# NGINX Configuration for ABC API with Let's Encrypt SSL Encryption

## Overview

This guide outlines the steps to set up NGINX as a reverse proxy for an ABC API with SSL encryption using Let's Encrypt certificates.

## Prerequisites

- Ubuntu-based server
- NGINX installed
- Certbot installed

## Step 1: Install NGINX

```bash
sudo apt-get update
sudo apt-get install nginx
```

## Step 2: Install Certbot for Let's Encrypt
```bash
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx
```

## Step 3: Obtain and Install SSL Certificate
 Run Certbot to obtain and install the SSL certificate:
```bash
sudo certbot --nginx
```
## Step 4: Configure NGINX for ABC API
Create a new NGINX site configuration file for the API:
```bash
sudo vim /etc/nginx/sites-available/api
```

Paste the following configuration into the file:
```bash
server {
  listen 80;
  listen 443 ssl;
  server_name Enter-your-server-domain;

  # SSL certificate and key paths
  ssl_certificate /etc/letsencrypt/live/Enter-your-server-domain/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/Enter-your-server-domain/privkey.pem;

  # SSL settings
  ssl_protocols TLSv1.2 TLSv1.3;
  ssl_prefer_server_ciphers off;
  ssl_ciphers 'TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';

  # Other SSL-related settings go here
  # ...

  location / {
    proxy_pass http://0.0.0.0:0000;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```
Save the file and exit the text editor.

## Step 5: Enable NGINX Site Configuration
```bash
sudo ln -s /etc/nginx/sites-available/api /etc/nginx/sites-enabled/
```

## Step 6: Test NGINX Configuration
Check the NGINX configuration for syntax errors:
```bash
sudo nginx -t
```

### If there are no errors, proceed to reload NGINX:
```bash
sudo systemctl reload nginx
```

## Step 7: Allow Traffic on Port 80 (Optional)
Open port 80 in the firewall (assuming UFW is in use):
```bash
sudo ufw allow 80
```
## Step 8: Restart NGINX
```bash
sudo systemctl restart nginx
```
## Important Note
* Security and TLS:-
Utilizes modern TLS protocols (v1.2, v1.3) and secure ciphers for enhanced communication security.
* Let's Encrypt Integration:-
Automates SSL certificate management with Certbot, ensuring secure and renewable certificates.
* NGINX Reverse Proxy:-
Configures NGINX as a reverse proxy for the ABC API, forwarding requests to http://0.0.0.0:0000.
* Firewall and Ports:-
Opens port 80 for HTTP traffic (optional), consider adjusting based on security requirements.
* Configuration Testing:-
Use sudo nginx -t to check NGINX configuration for syntax errors before reloading.
* Configuration Reload:-
Reload NGINX configuration with sudo systemctl reload nginx for changes to take effect.
* DNS Records and IP:-
Ensure DNS records point to the correct server IP address where NGINX is configured.
* Documentation and Maintenance:-
Keep NGINX configuration documentation up to date; check for updates to NGINX and Certbot.
* Logging and Monitoring:-
Implement logging and monitoring for NGINX access and error logs, monitor SSL certificate expiration.
* Backup and Restore:-
Regularly backup NGINX configuration and SSL certificates for quick restoration and server changes.
