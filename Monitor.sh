#!/bin/bash
REPORT_DIR="/home/ubuntu/Downloads/Server_REport"
# Infinite loop to continuously generate reports
while true; do
    # Generate a timestamp to create a unique filename
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    REPORT_FILE="$REPORT_DIR/report_$TIMESTAMP.txt"
    if [ -z "$REPORT_FILE" ]; then
        echo "Error: REPORT_FILE is empty"
        exit 1
    fi
    #CPU usage data to the report file
    echo "CPU Usage:" > "$REPORT_FILE"
    mpstat -P ALL 1 5 >> "$REPORT_FILE" 2>&1
    #Memory usage data to the report file
    echo -e "\nMemory Usage:" >> "$REPORT_FILE"
    free -h >> "$REPORT_FILE" 2>&1
    #Disk usage data to the report file
    echo -e "\nDisk Usage:" >> "$REPORT_FILE"
    df -h >> "$REPORT_FILE" 2>&1
    #Disk I/O statistics to the report file
    echo -e "\nDisk I/O Stats:" >> "$REPORT_FILE"
    iostat -dx 1 5 >> "$REPORT_FILE" 2>&1
    #Network usage data to the report file
    echo -e "\nNetwork Usage:" >> "$REPORT_FILE"
    sudo iftop -t -s 5 >> "$REPORT_FILE" 2>&1  # Requires sudo
    # Print the location of the saved report
    echo "Report saved to $REPORT_FILE"
    # Sleep for a specified interval (e.g., 60 seconds)
    sleep 60  # Sleeps for 1 seconds before next report
done

