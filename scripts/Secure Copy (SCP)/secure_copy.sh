#!/bin/bash

read -p "Press 1 for Pull OR Press 2 for Push: " user_choice

if [ "$user_choice" != "1" ] && [ "$user_choice" != "2" ]; then
  echo "Invalid choice. Please enter 1 for Pull or 2 for Push."
  exit 1
fi

read -p "Enter The Client IP: " client_ip	#Enter the IP from where you want to receive or send the file

read -p "Enter The Source Path: " source_path
read -p "Enter The Destination Path: " destination_path

if [ "$user_choice" == "1" ]; then
  scp "$client_ip:$source_path" "$destination_path"
  if [ $? -eq 0 ]; then
    echo "File successfully pulled."
  else
    echo "Error: File pull failed."
  fi
elif [ "$user_choice" == "2" ]; then
  scp "$source_path" "$client_ip:$destination_path"
  if [ $? -eq 0 ]; then
    echo "File successfully pushed."
  else
    echo "Error: File push failed."
  fi
fi

