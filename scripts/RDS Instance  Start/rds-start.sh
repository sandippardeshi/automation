#!/bin/bash

# AWS CLI region settings
AWS_REGION="us-east-1" 

# Prompt the user to enter the RDS instance ID
read -p "Please enter the RDS instance ID you want to start: " DB_INSTANCE_IDENTIFIER

# Start the RDS database instance
echo "Starting RDS database instance $DB_INSTANCE_IDENTIFIER..."
aws rds start-db-instance --region "$AWS_REGION" --db-instance-identifier "$DB_INSTANCE_IDENTIFIER"

# Check if the instance start was successful
if [ $? -eq 0 ]; then
  echo "RDS database instance $DB_INSTANCE_IDENTIFIER has been started successfully."
else
  echo "Failed to start RDS database instance $DB_INSTANCE_IDENTIFIER."
fi

