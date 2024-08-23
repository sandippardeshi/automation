# SCP Shell Script

## Description
This is a simple shell script designed to facilitate file transfers using the Secure Copy Protocol (SCP). SCP is a secure and efficient way to transfer files between two remote hosts over SSH. This script allows you to choose between pulling files from a remote host or pushing files to a remote host.

## Prerequisites
- This script requires `bash` to run.
- You should have SSH access to the remote host for SCP to work.

## Usage
1. Open a terminal.
2. Make sure the script has execute permissions:
   ```bash
   chmod +x scp_script.sh
3. Run the script:
   ```bash
   ./scp_script.sh

##Follow the on-screen prompts to complete the file transfer.
###Options
- Pull (1): Use this option to pull a file from a remote host to your local machine.
- Push (2): Use this option to push a file from your local machine to a remote host.
###Prompts
- Choose whether you want to pull or push a file by entering 1 or 2, respectively.
```bash
Enter the IP address of the remote client from/to which you want to transfer the file.
Enter the source path of the file (remote path for pull, local path for push).
Enter the destination path of the file (local path for pull, remote path for push).


