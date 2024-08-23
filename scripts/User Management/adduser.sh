#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Define the username
echo "Please enter the username:"
read username

# Check if the user already exists
if id "$username" &>/dev/null; then
   echo "User $username already exists."
   exit 1
fi

# Create the user
adduser --disabled-password --gecos "" "$username"

# Create the .ssh directory if it doesn't exist
mkdir -p "/home/$username/.ssh"

# Prompt the user to enter the public key
echo "Please enter the user's public key:"
read public_key

# Add the public key to the authorized_keys file
echo "$public_key" >> "/home/$username/.ssh/authorized_keys"

# Set the correct ownership and permissions
chown -R "$username:$username" "/home/$username/.ssh"
chmod 700 "/home/$username/.ssh"
chmod 600 "/home/$username/.ssh/authorized_keys"

# Prompt the user to enter the password for sudo access
echo "Please enter the password for sudo access:"
read -s password

# Set the password for sudo access
echo "$username:$password" | chpasswd

# Grant sudo access
usermod -aG sudo "$username"

echo "User $username has been created with sudo access."

