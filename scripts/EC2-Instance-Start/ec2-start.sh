#!/bin/bash

# Prompt the user to enter the EC2 instance ID
read -p "Please enter the EC2 instance ID you want to start: " INSTANCE_ID

# Start the EC2 instance
echo "Starting EC2 instance $INSTANCE_ID..."
aws ec2 start-instances --instance-ids $INSTANCE_ID

# Check if the instance start was successful
if [ $? -eq 0 ]; then
  echo "Instance $INSTANCE_ID has been started successfully."
else
  echo "Failed to start EC2 instance $INSTANCE_ID. Please check the AWS console for more information."
fi

