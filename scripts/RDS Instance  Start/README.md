# AWS RDS Database Start Script

This shell script allows you to start an AWS RDS (Relational Database Service) database instance using the AWS CLI.

## Prerequisites

Before using this script, you need to have the AWS CLI installed and properly configured on your local machine.


## Usage

1. Clone this repository to your local machine or download the script directly.

2. Open the script in a text editor if you want to specify the AWS region in the script. By default, the script uses the AWS region `"us-east-1"`. If you need to use a different region, modify the `AWS_REGION` variable in the script.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x rds-start.sh

4. Run the script using:

   ```bash
   ./rds-start.sh

5. The script will prompt you to enter the RDS instance ID that you want to start. Please provide the valid RDS instance ID.

6. The script will initiate the starting of the specified RDS database instance.

7. It will check if the instance start was successful.
## Important Note
* **AWS CLI Configuration**: Verify that your AWS CLI is properly configured with the necessary credentials and permissions to start RDS instances.

