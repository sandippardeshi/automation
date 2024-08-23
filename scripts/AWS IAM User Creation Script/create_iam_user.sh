#!/bin/bash

# Function to generate a random password with at least one symbol and one number
generate_password() {
  # Define character sets
  upper='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  lower='abcdefghijklmnopqrstuvwxyz'
  digits='0123456789'
  symbols='!@#$%^&*()-=_+[]{}|;:,.<>?/'

  # Concatenate character sets
  all_characters="$upper$lower$digits$symbols"

  # Use /dev/urandom to generate a random password
  password=$(head /dev/urandom | tr -dc "$all_characters" | head -c 12)

  # Ensure the password contains at least one symbol and one number
  if ! [[ "$password" =~ [[:punct:]] && "$password" =~ [[:digit:]] ]]; then
    # If not, replace one character with a random symbol
    symbol=$(echo -n "$symbols" | shuf -n 1)
    password="${password:0:1}$symbol${password:2}"

    # Replace another character with a random digit
    digit=$(echo -n "$digits" | shuf -n 1)
    password="${password:0:2}$digit${password:3}"
  fi

  echo "$password"
}

# Function to create IAM user
create_iam_user() {
  user_name=$1

  # Create IAM user
  aws iam create-user --user-name $user_name

  # Generate and set initial password
  initial_password=$(generate_password)
  aws iam create-login-profile --user-name $user_name --password "$initial_password" --password-reset-required

  # Get AWS account ID
  aws_account_id=$(aws sts get-caller-identity --query "Account" --output text)

  # Attach policies based on user's choice
  case $permission_choice in
    1)
        permission="AdministratorAccess"
        ;;
    2)
        permission="PowerUserAccess"
        # Attach PowerUserAccess policy
        aws iam attach-user-policy --user-name $user_name --policy-arn arn:aws:iam::aws:policy/$permission
        # Update password policy for PowerUserAccess
        aws iam update-account-password-policy --minimum-password-length 12 --require-symbols --require-numbers --require-uppercase-characters --require-lowercase-characters --allow-users-to-change-password
        ;;
    3)
        permission="ReadOnlyAccess"
        # Attach ReadOnlyAccess policy
        aws iam attach-user-policy --user-name $user_name --policy-arn arn:aws:iam::aws:policy/$permission
        # Update password policy for ReadOnlyAccess
        aws iam update-account-password-policy --minimum-password-length 8 --allow-users-to-change-password
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
  esac

  # Save user details to passwords CSV
  echo "User: $user_name, AWS Account ID: $aws_account_id, Initial Password: $initial_password" >> passwords.csv

  # Download password CSV
  mv passwords.csv "$(pwd)/${user_name}_passwords.csv"
  echo "Password CSV saved to: $(pwd)/${user_name}_passwords.csv"


   # Prompt for email address
  read -p "Enter email address to send the CSV file: " email_address

  # Send email with CSV attachment

  echo "Sending email..."
  login_url="https://$aws_account_id.signin.aws.amazon.com/console"
  echo -e "You can log in to the AWS Management Console here: $login_url\n\nUser: $user_name\nInitial Password: $initial_password" | mail -s "IAM User Details" -a "From: c-test@example.com" $email_address
  echo "Email sent to $email_address"

}

# Main script
echo "Enter IAM user name:"
read user_name

# Check if user already exists
user_exists=$(aws iam get-user --user-name $user_name 2>&1)
if [[ $user_exists == *"NoSuchEntity"* ]]; then
  echo "Choose permissions:"
  echo "1) AdministratorAccess"
  echo "2) PowerUserAccess"
  echo "3) ReadOnlyAccess"
  read -p "Enter your choice (1/2/3): " permission_choice

  create_iam_user $user_name
else
  echo "IAM user $user_name already exists. Choose a different user name."
fi

