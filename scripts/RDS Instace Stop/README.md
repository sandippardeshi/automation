# Amazon RDS Instance Stop Script

This shell script allows you to stop an Amazon RDS (Relational Database Service) instance using the AWS Command Line Interface (AWS CLI).

## Prerequisites

Before using this script, you need to have the AWS CLI installed and properly configured on your local machine.

## Usage

1. Clone or download this repository to your local machine.


2. Open the script in a text editor and provide the necessary information:

   - `region`: Specify the AWS Region where your RDS instance is located.
   - `instance_id`: Specify the identifier of your RDS instance (replace "Enter your RDS name here" with the actual instance identifier).

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x rds-stop.sh

4. Run the script using:

   ```bash
   ./rds-stop.sh

5. The script will initiate the stopping of the specified RDS instance.

6. It will check the status of the instance and wait until it reaches a "stopped" state.
   
## Important Note
* **AWS CLI Configuration:** Verify that your AWS CLI is properly configured with the necessary credentials and permissions to stop RDS instances.
* **Instance State:** Note that stopping an RDS instance can affect database availability. Ensure that you intend to stop the instance and that you are aware of its current state.

