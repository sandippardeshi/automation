#!/bin/bash

# Prompt user for EC2 instance ID
read -p "Enter EC2 instance ID: " INSTANCE_ID

# Get the list of attached volumes for the given instance
VOLUME_IDS=($(aws ec2 describe-volumes --filters "Name=attachment.instance-id,Values=$INSTANCE_ID" --query "Volumes[].VolumeId" --output text))

# Check the number of attached volumes
if [ "${#VOLUME_IDS[@]}" -eq 0 ]; then
  echo "No volumes found attached to the specified instance. Exiting."
  exit 1
elif [ "${#VOLUME_IDS[@]}" -eq 1 ]; then
  # If there's only one volume attached, use it
  VOLUME_ID="${VOLUME_IDS[0]}"
else
  # If there are multiple volumes attached, prompt user for volume ID
  echo "Multiple volumes found attached to the specified instance:"
  for ((i=0; i<${#VOLUME_IDS[@]}; i++)); do
    echo "$(($i+1)). ${VOLUME_IDS[$i]}"
  done

  read -p "Enter the number corresponding to the volume you want to modify: " SELECTED_VOLUME_INDEX

  # Validate user input
  if ! [[ "$SELECTED_VOLUME_INDEX" =~ ^[1-9][0-9]*$ ]] || [ "$SELECTED_VOLUME_INDEX" -gt "${#VOLUME_IDS[@]}" ]; then
    echo "Invalid input. Exiting."
    exit 1
  fi

  VOLUME_ID="${VOLUME_IDS[$((SELECTED_VOLUME_INDEX-1))]}"
fi

# Get the current size of the selected EBS volume
CURRENT_SIZE_GB=$(aws ec2 describe-volumes --volume-id $VOLUME_ID --query "Volumes[0].Size" --output text)

# Display current size and prompt for the new size
echo "Current size of EBS volume $VOLUME_ID: ${CURRENT_SIZE_GB}GB"
read -p "Enter the new size for the EBS volume in GiB: " NEW_SIZE_GB

# Check if the desired size is the same as the current size
if [ "$NEW_SIZE_GB" -eq "$CURRENT_SIZE_GB" ]; then
  echo "The new size is the same as the current size. Exiting without modification."
  exit 0
fi

# Check if the new size is greater than or equal to the current size
if [ "$NEW_SIZE_GB" -lt "$CURRENT_SIZE_GB" ]; then
  echo "Error: New size cannot be smaller than the existing size. Exiting without modification."
  exit 1
fi

# Modify the EBS volume size without stopping the EC2 instance
aws ec2 modify-volume --volume-id $VOLUME_ID --size $NEW_SIZE_GB

# Check for errors and handle the modification rate limit
if [ $? -eq 0 ]; then
  echo "EBS volume size for $VOLUME_ID modified from ${CURRENT_SIZE_GB}GB to ${NEW_SIZE_GB}GB."
else
  echo "An error occurred while modifying the volume. You may have reached the maximum modification rate per volume limit."
  echo "Please wait at least 6 hours between modifications per EBS volume and try again."
fi

