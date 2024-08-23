# IAM User Creation Script

This script automates the process of creating an IAM user on AWS, setting up initial permissions, and sending user details via email.

## Prerequisites

- AWS CLI configured with appropriate permissions
- `mail` command installed on Ubuntu for sending emails

## Installation Process for `mail` on Ubuntu

To install the `mail` command on Ubuntu, follow these steps:

1. Update the package index:

    ```bash
    sudo apt update
    ```

2. Install the `mailutils` package:

    ```bash
    sudo apt install mailutils
    ```

3. During the installation, you'll be prompted to configure `mailutils`. Choose the "Internet Site" option and provide the system mail name when prompted.

## Usage

1. Ensure the AWS CLI is configured with appropriate permissions.

2. Run the script:

    ```bash
    ./create_iam_user.sh
    ```

3. Follow the prompts to enter the IAM user name, choose permissions, and provide an email address to send the CSV file.

## Script Explanation

- The script generates a random password with at least one symbol and one number.
- It creates an IAM user with the provided user name and sets the initial password.
- Policies are attached to the IAM user based on the user's choice.
- User details are saved in a CSV file.
- The CSV file is sent as an email attachment to the provided email address.
