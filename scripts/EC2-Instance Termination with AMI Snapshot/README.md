# EC2 Instance Backup and Termination Script

This shell script allows you to create a backup (Amazon Machine Image - AMI) of an Amazon EC2 instance and then terminate the instance using the AWS Command Line Interface (AWS CLI).

## Prerequisites

Before using this script, you need to have the AWS CLI installed and properly configured on your local machine.


## Usage

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where you saved the script.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x ec2-terminate.sh

4. Run the script using:

   ```bash
   ./ec2-terminate.sh

5. The script will prompt you to enter the EC2 instance ID of the instance you want to back up and terminate.

6. The script will create an AMI backup of the specified EC2 instance, using an id that includes the instance's id  tag and a timestamp.

7. It will check the status of the AMI creation and wait for it to become available.

8. After the AMI is created, the script will initiate the termination of the EC2 instance.

9. The script will provide feedback on whether the backup and termination operations were successful.


## Important Note
* **Caution:** Terminating an EC2 instance will permanently stop and delete the instance. Ensure that you have saved any important data and that you intend to terminate the instance.
* **AWS CLI Configuration:** Verify that your AWS CLI is properly configured with the necessary credentials and permissions to create AMIs and terminate EC2 instances.

