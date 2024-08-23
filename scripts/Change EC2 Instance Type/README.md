# AWS Instance Type Changer

This Bash script allows you to change the instance type of an AWS EC2 instance interactively. It provides a list of predefined instance types for you to choose from or allows you to enter a custom instance type.

## Prerequisites

1. **AWS CLI:** Ensure that you have the AWS Command Line Interface (CLI) installed and configured with the necessary credentials.

2. **jq:** The script uses `jq` for JSON parsing. Make sure it is installed on your system.

   ```bash
   sudo apt-get install jq

## Usage
1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where you saved the script.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x change_instance_type.sh

4. Run the script using:

   ```bash
   ./change_instance_type.sh

5. Follow the prompts to enter the AWS instance ID and choose a new instance type.

## Script Overview

The script performs the following steps:

1. Gets the current instance type of the specified AWS instance.
2. Allows you to choose a new instance type from a predefined list.
3. Validates the chosen instance type.
4. Stops the instance.
5. Changes the instance type.
6. Starts the instance.

## Allowed Instance Types
The script provides a list of allowed instance types:

1. t2.micro
2. t3.micro
3. t3.small
4. m5.large
5. c5.large
0. Enter your own instance type.

You can also choose to enter your own instance type.

## Important Note
- The script performs checks to ensure the validity of the entered instance type.
- Ensure that you have the necessary permissions to modify EC2 instances.
