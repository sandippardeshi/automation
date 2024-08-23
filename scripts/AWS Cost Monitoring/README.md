# AWS Billing Script

This Bash script allows you to check your AWS account's daily cost and usage using the AWS CLI.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions.
- Bash shell environment.

## Usage

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where you saved the script.

3. Set your AWS CLI profile name by updating the `AWS_PROFILE` variable.

4. Set the AWS region for which you want to check the bill by updating the `AWS_REGION` variable.

5. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x check_AWS_bill.sh

6. Run the script and enter the date (in the format YYYY-MM-DD) for which you want to check the bill when prompted.

   ```bash
   ./check_AWS_bill.sh


## Important Note
*  AWS Credentials: Ensure that your AWS CLI is properly configured, and the specified AWS profile has the necessary permissions to access billing information.

* Changes: Feel free to customize the script according to your needs and preferences.

