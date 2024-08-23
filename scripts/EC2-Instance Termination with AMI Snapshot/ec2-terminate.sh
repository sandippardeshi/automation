#!/bin/bash

# Replace 'your-instance-id' with your actual EC2 instance ID
#INSTANCE_ID="Enter your EC2 instance ID"

# Prompt the user to enter their EC2 instance ID
read -p "Enter your EC2 instance ID (to be terminated): " INSTANCE_ID

# Create a timestamp for the AMI name
DATE=$(date +%Y%m%d%H%M%S)

# Describe the instance to get its name tag (if available)
INSTANCE_NAME=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].Tags[?Key=='Name'].Value" --output text)

# Create an AMI from the EC2 instance
AMI_NAME="backup-$INSTANCE_NAME-$DATE"
echo "Creating an AMI backup of EC2 instance $INSTANCE_ID with the name '$AMI_NAME'..."
AMI_ID=$(aws ec2 create-image --instance-id $INSTANCE_ID --name "$AMI_NAME" --description "Backup created on $DATE" --block-device-mappings "[{\"DeviceName\": \"/dev/sda1\",\"Ebs\":{\"VolumeSize\":10}}]" --output text)

# Check if the AMI creation was successful
if [ $? -eq 0 ]; then
  echo "AMI backup (AMI ID: $AMI_ID) created successfully."
else
  echo "Failed to initiate AMI backup creation. Please check the AWS console for more information."
  exit 1
fi

# Wait for the AMI creation to complete
echo "Waiting for the AMI creation to complete..."
aws ec2 wait image-available --image-ids $AMI_ID

# Terminate the EC2 instance
echo "Terminating EC2 instance $INSTANCE_ID..."
aws ec2 terminate-instances --instance-ids $INSTANCE_ID

# Check if termination was initiated successfully
if [ $? -eq 0 ]; then
  echo "Termination initiated successfully. Please check the AWS console for the termination status."
else
  echo "Failed to initiate instance termination. Please check the AWS console for more information."
fi

