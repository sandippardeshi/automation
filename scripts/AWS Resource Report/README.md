# AWS Resource Reporting Script

This shell script automates the generation of reports for various AWS resources, including EC2 instances, S3 buckets, Lambda functions, and IAM users. The generated reports are saved to a specified directory in text file format.

## Prerequisites

Before using this script, you need to have the AWS CLI installed and properly configured on your local machine.

## Usage

1. Clone this repository to your local machine or download the script directly.

2. Open the script in a text editor if you need to customize any settings. The following settings can be adjusted in the script:

   - `AWS_PROFILE`: Specify your AWS CLI profile name.
   - `AWS_REGION`: Replace with your desired AWS region.
   - `REPORT_DIR`: Set the output directory where the reports will be saved.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x report.sh

4. Run the script using:

   ```bash
   ./report.sh

5. The script will generate separate reports for EC2 instances, S3 buckets, Lambda functions, and IAM users. Each report will be saved with a timestamp in the specified output directory.

6. You can find the generated reports in the directory specified by REPORT_DIR.
   
## Important Notes
* **AWS CLI Configuration:** Ensure that your AWS CLI is properly configured with the necessary credentials and permissions to list AWS resources.
* **Output Directory:** Make sure that the REPORT_DIR directory exists and is writable. The script will attempt to create the directory if it doesn't exist.

