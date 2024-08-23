#!/bin/bash

# Set your AWS CLI profile name
AWS_PROFILE="Enter your profile name here"

# Set the region for which you want to check the bill
AWS_REGION="Enter your Region here"

# Prompt the user for the date
read -p "Enter the date (YYYY-MM-DD) for which you want to check the bill: " USER_DATE

# Validate the date format (optional)
if ! [[ $USER_DATE =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Invalid date format. Please use the format YYYY-MM-DD."
    exit 1
fi

# Calculate the start date (day before the specified date)
START_DATE=$(date -d "$USER_DATE - 1 day" "+%Y-%m-%d")

# Get the AWS account bill for the specified date
aws ce get-cost-and-usage \
    --profile $AWS_PROFILE \
    --region $AWS_REGION \
    --time-period Start=$START_DATE,End=$USER_DATE \
    --granularity DAILY \
    --metrics "BlendedCost" \
    --output table

