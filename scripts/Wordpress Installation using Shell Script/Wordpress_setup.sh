#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Update the system
sudo apt-get update
sudo apt-get upgrade -y

# Install Apache Web Server
sudo apt-get install -y apache2

# Install MySQL Server
sudo apt-get install -y mysql-server

# Install PHP and Necessary Extensions
sudo apt-get install -y php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-zip

# Download and Install WordPress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
sudo mv wordpress /var/www/html/
sudo chown -R www-data:www-data /var/www/html/wordpress

# Create MySQL Database and User for WordPress
read -p "Enter MySQL root password: " mysql_root_password
read -p "Enter WordPress database name: " wp_db_name
read -p "Enter WordPress database user: " wp_db_user
read -sp "Enter WordPress database password: " wp_db_password
echo

mysql -u root -p$mysql_root_password -e "CREATE DATABASE $wp_db_name;"
mysql -u root -p$mysql_root_password -e "CREATE USER '$wp_db_user'@'localhost' IDENTIFIED BY '$wp_db_password';"
mysql -u root -p$mysql_root_password -e "GRANT ALL PRIVILEGES ON $wp_db_name.* TO '$wp_db_user'@'localhost';"
mysql -u root -p$mysql_root_password -e "FLUSH PRIVILEGES;"

echo "MySQL database and user created successfully."

# Configure WordPress
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$wp_db_name/" wp-config.php
sed -i "s/username_here/$wp_db_user/" wp-config.php
sed -i "s/password_here/$wp_db_password/" wp-config.php

# Configure Apache for WordPress
read -p "Enter the domain name or IP address for your WordPress site: " domain_name

# Create Apache configuration for WordPress
cat <<EOL > /etc/apache2/sites-available/wordpress.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/wordpress
    ServerName $domain_name

    <Directory /var/www/html/wordpress>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL

# Enable the virtual host and mod_rewrite, then restart Apache
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo service apache2 restart

echo "WordPress installation and setup completed successfully."
