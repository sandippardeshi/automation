# WordPress Setup on AWS EC2

This guide outlines the steps to set up WordPress on an AWS EC2 instance using Apache, MySQL, and PHP.

## Step 1: Connect to your AWS EC2 instance
```bash
$ ssh -i your-key-pair.pem ubuntu@your-ec2-public-ip
```
## Step 2: Update the System
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
```

## Step 3: Install Apache Web Server

To install the Apache web server, follow these commands:

```bash
$ sudo apt-get install apache2
```
## Step 4: Install MySQL Server

To install MySQL Server, execute the following command:

```bash
$ sudo apt-get install mysql-server
```

* Note : During the installation, set a secure password for the MySQL root user when prompted.

## Step 5: Install PHP and Necessary Extensions

Install PHP and its necessary extensions by running the following command:

```bash
$ sudo apt-get install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-zip
```

## Step 6: Download and Install WordPress

Download and install WordPress with the following commands:

```bash
$ cd /tmp
$ wget https://wordpress.org/latest.tar.gz
$ tar -xvzf latest.tar.gz
$ sudo mv wordpress /var/www/html/
$ sudo chown -R www-data:www-data /var/www/html/wordpress
```
## Step 7: Create a MySQL Database and User for WordPress

1. Access MySQL by running the following command:

    ```bash
    $ mysql -u root -p
    ```

    Enter the MySQL root password when prompted.

2. In the MySQL prompt, execute the following commands to create a WordPress database, user, and grant privileges:

    ```sql
    CREATE DATABASE wordpress;
    CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'your-password';
    GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
    FLUSH PRIVILEGES;
    EXIT;
    ```

These commands create a MySQL database named 'wordpress,' a user 'wordpressuser' with the specified password, grant all privileges on the 'wordpress' database to the user, and flush privileges. Continue with the next steps in your setup process.

## Step 8: Configure WordPress

1. Change to the WordPress directory:

    ```bash
    $ cd /var/www/html/wordpress
    ```

2. Copy the sample configuration file:

    ```bash
    $ cp wp-config-sample.php wp-config.php
    ```

3. Open the configuration file using your preferred text editor (e.g., vim):

    ```bash
    $ vim wp-config.php
    ```

4. Edit the `wp-config.php` file and set the database name, user, and password:

    ```php
    define('DB_NAME', 'wordpress');
    define('DB_USER', 'wordpressuser');
    define('DB_PASSWORD', 'your-password');
    ```

   Save the changes.

These steps configure WordPress with the necessary database information. Proceed with the next steps in your setup process.

## Step 9: Configure Apache

Edit the Apache configuration file for WordPress:

```bash
$ sudo nano /etc/apache2/sites-available/wordpress.conf
```

* Note 1:- Add the following configuration if you have Domain. Otherwise go to Note 2.

<VirtualHost *:80>
    ServerAdmin webmaster@your-domain.com
    DocumentRoot /var/www/html/wordpress
    ServerName your-ec2-public-ip

    <Directory /var/www/html/wordpress>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


* Note 2 :- Note :- Add the following configuration if you have not Domain.

<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/wordpress
    ServerName your-ec2-public-ip

    <Directory /var/www/html/wordpress>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

## Step 10: Enable the Virtual Host

Enable the virtual host, configure mod_rewrite, and restart Apache with the following commands:

```bash
$ sudo a2ensite wordpress
$ sudo a2enmod rewrite
$ sudo service apache2 restart
```

## Step 11: Complete WordPress Installation

Follow these steps to complete the WordPress installation:

1. Open your web browser and visit [http://your-ec2-public-ip](http://your-ec2-public-ip).
2. Follow the on-screen instructions to set up your WordPress site.


## Important Note
* Replace placeholders like your-key-pair.pem, your-ec2-public-ip, and your-password with your actual values.
* Accessing your WordPress site directly via IP is common during development, but for production, it's recommended to use a domain for better accessibility and security.
