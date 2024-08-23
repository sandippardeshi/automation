#!/bin/bash

# Function to check CPU usage
check_cpu_usage() {
    echo "CPU Usage:"
    top -b -n 1 | grep "%Cpu"
}

# Function to check memory usage
check_memory_usage() {
    echo "Memory Usage:"
    free -h
}

# Function to check disk usage
check_disk_usage() {
    echo "Disk Usage:"
    df -h
}

# Main function to perform server health check
main() {
    echo "Server Health Check Report"
    echo "--------------------------"

    check_cpu_usage
    echo "--------------------------"
    check_memory_usage
    echo "--------------------------"
    check_disk_usage
}

# Run the main function
main

