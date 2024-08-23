# SSL Certificate Expiry Checker

This Bash script checks the expiration date of an SSL certificate for a given domain.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Script Overview](#script-overview)

## Introduction

The SSL Certificate Expiry Checker script is designed to retrieve and display the expiration date of the SSL certificate for a specified domain. It utilizes the `openssl` command to connect to the domain's server and extract the certificate information.

## Features

- **Simple and Fast**: Quickly check the SSL certificate expiration date for a given domain.
- **User Interaction**: Prompts the user for the domain name, ensuring flexibility and ease of use.
- **Informative Output**: Displays the SSL certificate expiration date in a clear and readable format.

## Prerequisites

Before using the SSL Certificate Expiry Checker script, ensure that you have the following:

- A system running Bash (Bourne Again SHell).
- The `openssl` command installed on your system.

## Usage

1. Clone or download this repository to your local machine:
   
2. Navigate to the script directory:
   
3. Make the script executable:
    ```bash
    chmod +x ssl_expiry_checker.sh
4. Run the script:
   ```bash
   ./ssl_expiry_checker.sh
 
7. Enter the domain name when prompted and view the SSL certificate expiration date.

## Script Overview
The script performs the following tasks:

- Prompts the user for a domain name.
- Connects to the domain's server using openssl s_client.
- Extracts the SSL certificate information, including the expiration date.
- Displays the SSL certificate expiration date.

## Important Notes
**Accuracy:** SSL certificate expiration date accuracy depends on server response and certificate availability.

**Prerequisites:** Ensure Bash and openssl are installed. Use your system's package manager for installation.

**User Input:** Provide a valid domain for accurate SSL certificate information.

**Security:** Handle SSL certificate information securely and use trusted connections.
