# Domain Information Retrieval Script

This is a shell script that retrieves information about a domain, including its registration and expiry dates, and the platform of registration (registrar).

## Prerequisites

- Ensure you have `whois` installed on your system. You can install it on most Linux distributions using your package manager. For example, on Ubuntu or Debian, you can use:

```bash
sudo apt-get update && sudo apt-get install whois

```
## Usage
1. Open your terminal.
2. Navigate to the directory containing the script.
3. Make the script executable if it isn't already:
   ```bash
   chmod +x Domain_info.sh
   ```
4. Run the script:
   ```bash
   ./Domain_info.sh
   ```
5. When prompted, enter the domain name you wish to check and press "**Enter**".
## Script Behavior
- The script first prompts you to enter a domain name.
- If no domain name is provided, it will exit and display a message indicating that the domain name is required.
- If a domain name is provided, the script will use the whois command to fetch and display the domain's registration and expiry dates.

## Sample Output
The output will include the domain's registration creation date, its expiry date and Registration Platform, if available, in the format:
```bash
Domain Information for: coachwalla.com
--------------------------
Creation Date: <Date>
<Date>
Registrar Registration Expiration Date: <Date>
Platform of Registration: <Platform>

```

## Notes
- The availability of registration, expiry date and Registration Platform information may vary depending on the domain registrar and the TLD (Top-Level Domain).
- This script is intended for informational purposes and should be used responsibly.

## Troubleshooting
1. **Command Not Found**: If you receive a whois: command not found error, ensure that the whois package is installed on your system.
2. **Incorrect Dates**: If the dates don't seem accurate, check the domain directly on the registrar's website for the most reliable information.
