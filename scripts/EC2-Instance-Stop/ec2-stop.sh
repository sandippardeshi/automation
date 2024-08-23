#!/bin/bash

# Replace 'your-instance-id' with your actual EC2 instance ID
#INSTANCE_ID="Enter your EC2 instance ID"

# Prompt the user to enter their EC2 instance ID
read -p "Enter your EC2 instance ID (to be stopped): " INSTANCE_ID

# Stop the EC2 instance
aws ec2 stop-instances --instance-ids $INSTANCE_ID

# Check if the instance has stopped successfully
STATUS=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].State.Name" --output text)

if [ "$STATUS" == "stopping" ] || [ "$STATUS" == "stopped" ]; then
  echo "EC2 instance $INSTANCE_ID has been stopped successfully."
else
  echo "Failed to stop EC2 instance $INSTANCE_ID. Please check the AWS console for more information."
fi

