# EC2 Instance Start Script

This shell script allows you to start an Amazon EC2 instance using the AWS Command Line Interface (AWS CLI).

## Prerequisites

Before using this script, you need to have the AWS CLI installed and properly configured on your local machine.

## Usage

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where you saved the script.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x ec2-start.sh

4. Run the script using:

   ```bash
   ./ec2-start.sh

5. The script will prompt you to enter the EC2 instance ID of the instance you want to start.

6. The script will attempt to start the specified EC2 instance and provide you with feedback on whether the operation was successful.

7. If successful, you will receive a message indicating that the instance has been started. Otherwise, you will be informed of any issues.

## Important Note
*  **Caution:** Starting an EC2 instance can affect running processes and services on the instance. Ensure that you intend to start the instance and that you are aware of its current state.
* **AWS Credentials:** Verify that your AWS CLI is properly configured with the necessary credentials and permissions to start EC2 instances.
