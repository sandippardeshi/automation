# EBS Volume Resizer Script

This shell script allows you to interactively increase the size of an Elastic Block Store (EBS) volume attached to an Amazon EC2 instance. It prompts you to enter the EC2 instance ID, lists the attached volumes, and allows you to choose the volume you want to modify. You can specify the new size for the EBS volume, and the script will handle the modification, checking for errors and the maximum modification rate.

## Prerequisites

Before using this script, make sure you have the following:

- AWS CLI installed and configured on your system.
- Appropriate IAM permissions to describe volumes and modify EBS volumes.

## Usage

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where you saved the script.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x ebs_volume_resizer.sh

4. Run the script using:

   ```bash
   ./ebs_volume_resizer.sh

5. Follow the on-screen prompts to provide the required information.

## Script Overview
- The script prompts for the EC2 instance ID.
- It retrieves a list of attached EBS volumes for the specified instance.
- If only one volume is attached, it proceeds with that volume. If multiple volumes are attached, it prompts you to select a volume.
- After selecting a volume, it prompts for the new size for the EBS volume.
- The script checks if the new size is valid and proceeds with the modification if conditions are met.
- It handles errors, such as when the new size is smaller than the current size or when the modification rate limit is reached.

## Important Notes
- Verify that your AWS CLI is properly configured with the necessary credentials and permissions to modify the EBS Volume.
- Ensure you have the necessary IAM permissions to modify EBS volumes.
- The script checks for the maximum modification rate per volume and suggests waiting at least 6 hours between modifications.
