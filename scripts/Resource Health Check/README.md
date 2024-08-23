# Server Health Check Script

This script performs routine server health checks, including monitoring CPU usage, memory usage, and disk usage on a Linux-based server. It provides a quick overview of your server's current health status.

## Prerequisites

Before using this script, make sure you have the following prerequisites in place:

- **Linux-based Server**: This script is designed to work on Linux-based systems (e.g., Ubuntu, CentOS).

## Usage

1. Clone this repository to your server or download the script directly.

2. Open the script in a text editor if you need to customize any settings. The script includes three functions for checking CPU usage, memory usage, and disk usage. You can modify these functions as needed.

3. Provide appropriate Linux permissions to the Script using below command to make the script executable:

   ```bash
   chmod +x server-health-check.sh

4. Run the script using:

   ```bash
   ./server-health-check.sh

5. The script will display a server health check report that includes CPU usage, memory usage, and disk usage. This report provides valuable insights into your server's performance.

6. To perform routine health checks, consider scheduling this script to run periodically using a cron job. For example, you can schedule it to run daily or weekly to monitor your server's health over time.

## Important Notes
* **Customization:** You can customize this script to include additional health checks or change the output format to suit your needs.
* **Scheduled Checks:** For ongoing server monitoring, consider setting up scheduled runs of this script and redirecting the output to a log file for historical data analysis.
