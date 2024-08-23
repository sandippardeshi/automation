# WordPress Installation Script

This Bash script automates the installation of a WordPress website on a Linux system with Apache, MySQL, and PHP. It is designed to be run on Debian-based systems.

## Prerequisites

- This script assumes that you are running it on a Debian-based system.
- You need to have root privileges to execute the script.
- Make sure to have the MySQL root password ready.

## Usage

1. Open a terminal.

2. Clone or download this repository to your local machine.

3. Make the script executable:

    ```bash
    chmod +x Wordpress_setup.sh
    ```

4. Run the script:

    ```bash
    sudo ./Wordpress_setup.sh
    ```

5. Follow the prompts to enter required information during the script execution.

## Script Overview

1. **System Update:**
   - The script starts by updating the system packages and upgrading them.

2. **Install Apache Web Server:**
   - Installs the Apache web server, a popular choice for hosting WordPress.

3. **Install MySQL Server:**
   - Installs the MySQL server, which is used to store the WordPress database.

4. **Install PHP and Necessary Extensions:**
   - Installs PHP and required extensions for WordPress.

5. **Download and Install WordPress:**
   - Downloads the latest version of WordPress, extracts it, and moves it to the Apache web server directory.

6. **Create MySQL Database and User for WordPress:**
   - Prompts the user to enter MySQL root password and then creates a database and a user for WordPress.

7. **Configure WordPress:**
   - Copies the WordPress configuration file, and replaces placeholder values with the provided MySQL database information.

8. **Configure Apache for WordPress:**
   - Prompts the user to enter the domain name or IP address for the WordPress site and creates an Apache virtual host configuration.

9. **Enable the Virtual Host and Mod_Rewrite:**
   - Enables the Apache virtual host for WordPress and the mod_rewrite module.

10. **Restart Apache:**
    - Restarts the Apache web server to apply the changes.

11. **Completion:**
    - Informs the user that the WordPress installation and setup have been completed successfully.

## Note

- The script assumes a basic setup and might need adjustments based on specific server configurations or security requirements.
- Visit http://your-ec2-public-ip or your-domain-name in your web browser to complete the WordPress installation.
- Follow the on-screen instructions to set up your WordPress site.


