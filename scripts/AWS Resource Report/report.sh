#!/bin/bash

# AWS CLI profile name
AWS_PROFILE="Replace with your AWS CLI profile name:"  

# AWS region
AWS_REGION="Replace with your AWS region"      

# Output directory for reports
REPORT_DIR="Replace with the desired directory path"  

# Generate a timestamp for the report
TIMESTAMP=$(date "+%Y-%m-%d-%H-%M-%S")

# Function to generate a report for EC2 instances
generate_ec2_report() {
    aws ec2 describe-instances --profile "$AWS_PROFILE" --region "$AWS_REGION" > "$REPORT_DIR/ec2_report_$TIMESTAMP.txt"
    echo "EC2 Instance Report Generated."
}

# Function to generate a report for S3 buckets
generate_s3_report() {
    aws s3 ls --profile "$AWS_PROFILE" > "$REPORT_DIR/s3_report_$TIMESTAMP.txt"
    echo "S3 Bucket Report Generated."
}

# Function to generate a report for Lambda functions
generate_lambda_report() {
    aws lambda list-functions --profile "$AWS_PROFILE" --region "$AWS_REGION" > "$REPORT_DIR/lambda_report_$TIMESTAMP.txt"
    echo "Lambda Function Report Generated."
}

# Function to generate a report for IAM users
generate_iam_report() {
    aws iam list-users --profile "$AWS_PROFILE" > "$REPORT_DIR/iam_report_$TIMESTAMP.txt"
    echo "IAM User Report Generated."
}

# Main function to generate all reports
main() {
    mkdir -p "$REPORT_DIR"
    generate_ec2_report
    generate_s3_report
    generate_lambda_report
    generate_iam_report
    echo "All Reports Generated."
}

# Run the main function
main

