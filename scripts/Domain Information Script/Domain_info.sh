#!/bin/bash

# Prompt the user to provide the domain name
read -p "Please provide the domain name: " domain

# Check if the domain name is provided
if [ -z "$domain" ]; then
    echo "Domain name is required."
    exit 1
fi

# Retrieve registration and expiry date using whois command
echo "Domain Information for: $domain"
echo "--------------------------"
whois_info=$(whois "$domain")
registration_date=$(echo "$whois_info" | grep -i "Creation Date:" | awk '{print $3}')
expiry_date=$(echo "$whois_info" | grep -i "Registrar Registration Expiration Date:" | awk '{print $5}')

# Extract registrar (platform of registration) from whois info
registrar=$(echo "$whois_info" | grep -i "Registrar:" | awk -F ':' '{print $2}' | sed 's/^[ \t]*//')

# Print registration and expiry date
echo "Creation Date: $registration_date"
echo "Registrar Registration Expiration Date: $expiry_date"

# Print platform of registration
if [ -n "$registrar" ]; then
    echo "Platform of Registration: $registrar"
else
    echo "Error: Unable to determine the platform of registration."
fi
