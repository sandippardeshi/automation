#!/bin/bash

# Specify the AWS Region where your RDS instance is located
region="<Provide region here>"

# Specify the identifier of your RDS instance
instance_id="<Provide RDS Instance ID here>"

# Specify a name for the manual backup
backup_name="<Provide backup name here>"

# Create a manual backup of the RDS instance
aws rds create-db-snapshot --region "$region" --db-instance-identifier "$instance_id" --db-snapshot-identifier "$backup_name"

# Check if the backup creation was successful
if [ $? -eq 0 ]; then
    echo "Manual backup $backup_name of RDS instance $instance_id has been initiated."
else
    echo "Error: Failed to initiate manual backup."
fi

