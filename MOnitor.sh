#!/bin/bash

# Set the directory where reports will be saved
REPORT_DIR="/home/ubuntu/Downloads/Server_REport"

# Create the directory if it does not exist
mkdir -p "$REPORT_DIR"

# Infinite loop to continuously generate reports
while true; do
    # Generate a timestamp to create a unique filename
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

    # Define the report file path
    REPORT_FILE="$REPORT_DIR/report_$TIMESTAMP.txt"

    # Check if the report file path is set correctly
    if [ -z "$REPORT_FILE" ]; then
        echo "Error: REPORT_FILE is empty"
        exit 1
    fi

    # Collect and append CPU usage data to the report file
    echo "CPU Usage:" > "$REPORT_FILE"
    mpstat -P ALL 1 5 >> "$REPORT_FILE" 2>&1

    # Collect and append memory usage data to the report file
    echo -e "\nMemory Usage:" >> "$REPORT_FILE"
    free -h >> "$REPORT_FILE" 2>&1

    # Collect and append disk usage data to the report file
    echo -e "\nDisk Usage:" >> "$REPORT_FILE"
    df -h >> "$REPORT_FILE" 2>&1

    # Collect and append disk I/O statistics to the report file
    echo -e "\nDisk I/O Stats:" >> "$REPORT_FILE"
    iostat -dx 1 5 >> "$REPORT_FILE" 2>&1

    # Collect and append network usage data to the report file
    echo -e "\nNetwork Usage:" >> "$REPORT_FILE"
    sudo iftop -t -s 5 >> "$REPORT_FILE" 2>&1  # Requires sudo

    # Print the location of the saved report
    echo "Report saved to $REPORT_FILE"

    # Sleep for a specified interval (e.g., 5 minutes)
    sleep 60  # Sleeps for 1 minute before next report
done

