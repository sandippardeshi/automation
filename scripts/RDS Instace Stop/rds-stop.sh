#!/bin/bash

# Specify the AWS Region where your RDS instance is located
region="<Provide region here>"

# Specify the identifier of your RDS instance
instance_id="Enter your RDS name here"

# Stop the RDS instance
aws rds stop-db-instance --region "$region" --db-instance-identifier "$instance_id"

# Check if the instance is in a "stopped" state
while true; do
    status=$(aws rds describe-db-instances --region "$region" --db-instance-identifier "$instance_id" --query 'DBInstances[0].DBInstanceStatus' --output text)
    
    if [ "$status" == "stopped" ]; then
        echo "RDS instance $instance_id has been stopped."
        break
    elif [ "$status" == "stopping" ]; then
        sleep 10
    else
        echo "Error: RDS instance $instance_id is in an unexpected state: $status"
        exit 1
    fi
done

