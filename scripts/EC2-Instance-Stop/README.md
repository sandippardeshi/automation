# EC2 Instance Stop Script

This shell script allows you to stop an Amazon EC2 instance using the AWS Command Line Interface (AWS CLI).

## Prerequisites

Before using this script, you need to have the AWS CLI installed and properly configured on your local machine.
## Usage

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where you saved the script.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x ec2-stop.sh

4. Run the script using:

   ```bash
   ./ec2-stop.sh

5. The script will prompt you to enter your EC2 instance ID. Provide ‘instance-id’  to stop.
6. The script will then attempt to stop the specified EC2 instance and check if the operation was successful.
7. If successful, you will receive a message indicating that the instance has been stopped. Otherwise, you will be informed of any issues.

## Important Note
* **Caution**: Stopping an EC2 instance will interrupt any running processes and services on the instance. Ensure that you have saved any important work and that stopping the instance is intended.
* **AWS CLI Configuration**: Verify that your AWS CLI is properly configured with the necessary credentials and permissions to stop EC2 instances. You can configure it using aws configure.

