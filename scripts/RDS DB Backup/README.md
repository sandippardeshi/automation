# Amazon RDS Manual Backup Script

This shell script allows you to create a manual backup (DB snapshot) of an Amazon RDS (Relational Database Service) instance using the AWS Command Line Interface (AWS CLI).

## Prerequisites

Before using this script, you need to have the AWS CLI installed and properly configured on your local machine.


## Usage

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where you saved the script.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x rds-backup.sh

4. Run the script using:

   ```bash
   ./rds-backup.sh

5. The script will create a manual backup (DB snapshot) of the specified RDS instance using the provided backup name.

6. It will check the status of the backup creation operation and provide feedback on whether it was successful.

## Important Note
* **AWS CLI Configuration:** Verify that your AWS CLI is properly configured with the necessary credentials and permissions to create RDS manual backups.
* **Backup Retention:** Note that manual backups can contribute to storage costs. Be mindful of your AWS account's retention policy for manual backups.
