#!/bin/bash

# Function to get the current instance type
get_instance_type() {
    instance_id=$1
    current_type=$(aws ec2 describe-instances --instance-ids $instance_id --query "Reservations[0].Instances[0].InstanceType" --output text)
    echo $current_type
}

# Function to stop the instance
stop_instance() {
    instance_id=$1
    aws ec2 stop-instances --instance-ids $instance_id
    aws ec2 wait instance-stopped --instance-ids $instance_id
}

# Function to start the instance
start_instance() {
    instance_id=$1
    aws ec2 start-instances --instance-ids $instance_id
    aws ec2 wait instance-running --instance-ids $instance_id
}

# Function to change the instance type
change_instance_type() {
    instance_id=$1
    new_type=$2

    # Stop the instance
    stop_instance $instance_id

    # Change the instance type
    aws ec2 modify-instance-attribute --instance-id $instance_id --instance-type $new_type

    # Start the instance
    start_instance $instance_id
}

# Main script
echo "Enter the AWS instance ID:"
read instance_id

# Get and print the current instance type
old_instance_type=$(get_instance_type $instance_id)
echo "Current Instance Type: $old_instance_type"

# Define a list of allowed instance types
allowed_instance_types=("t2.micro" "t3.micro" "t3.small" "m5.large" "c5.large")

# Print the allowed instance types
echo "Choose a new instance type:"
for i in "${!allowed_instance_types[@]}"; do
  echo "$(($i+1)). ${allowed_instance_types[$i]}"
done
echo "0. Enter your own instance type"

# Prompt user for a new instance type
read -p "Enter the number corresponding to the new instance type: " selection

# Validate user input
if [[ $selection -ge 1 && $selection -le ${#allowed_instance_types[@]} ]]; then
    new_instance_type=${allowed_instance_types[$(($selection-1))]}
    
    # Check if the entered instance type is valid
    if aws ec2 describe-instance-types --instance-types $new_instance_type &> /dev/null; then
        # Change the instance type
        change_instance_type $instance_id $new_instance_type
        echo "Instance type successfully changed from $old_instance_type to $new_instance_type."
    else
        echo "Invalid instance type. Please enter a valid instance type."
    fi

elif [[ $selection -eq 0 ]]; then
    # Prompt user to enter their own instance type
    read -p "Enter your own instance type: " new_instance_type

    # Check if the entered instance type is valid
    if aws ec2 describe-instance-types --instance-types $new_instance_type &> /dev/null; then
        # Change the instance type
        change_instance_type $instance_id $new_instance_type
        echo "Instance type successfully changed from $old_instance_type to $new_instance_type."
    else
        echo "Invalid instance type. Please enter a valid instance type."
    fi

else
    echo "Invalid selection. Please enter a valid number."
fi

