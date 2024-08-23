# User Creation with Sudo Access

This shell script allows you to create a new user, set up SSH key authentication, and grant sudo access to the user. It is designed to be run with root privileges.

## Prerequisites

Before using this script, ensure that you have root privileges or are running the script with sudo.

## Usage

1. Clone this repository to your local machine or download the script directly.

2. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x adduser.sh

3. Open a terminal and navigate to the directory where you saved the script. Make sure to run the script with root privileges using `sudo`:

   ```bash
   sudo ./adduser.sh

4. Enter the desired username when prompted. This will be the username of the new user you want to create.

5. The script checks if the user already exists. If the username is already in use, the script will exit.


6. The script creates a new user with the provided username and a disabled password (password login is disabled).


7. If it doesn't already exist, the script creates a .ssh directory in the user's home directory.

8. Enter the user's public SSH key when prompted. This key will be added to the authorized_keys file for SSH key authentication.

9. The script adds the public key to the user's authorized_keys file, sets the correct ownership and permissions for SSH key files and directories.


10. Enter the password for sudo access when prompted. This password will be used for the user's sudo access.


11. The script sets up sudo access for the user, adding them to the sudo group.


12. You will receive a message indicating that the user has been created with sudo access.
## Important Note
* **Sudo Access:** Be cautious when granting sudo access to users. Ensure that you trust the user with administrative privileges.
* **SSH Key Security:** Make sure to properly manage and secure the SSH private key associated with the public key you provide during user creation.
