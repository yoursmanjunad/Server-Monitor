#!/bin/bash
# Define the combined report file
COMBINED_FILE="/home/ubuntu/Downloads/Server_REport/combined_report.txt"
OUTPUT_FILE="/home/ubuntu/Downloads/Server_REport/cumulative_usage_report.txt"
# Initialize the output file
echo "Cumulative Usage Report" > "$OUTPUT_FILE"
# CPU usage sections and summarize
echo -e "\nCPU Usage Summary:" >> "$OUTPUT_FILE"
grep -A 10 "CPU Usage:" "$COMBINED_FILE" | grep -v "CPU Usage:" | awk '{sum += $3} END {print "Average CPU Usage: " sum/NR "%"}' >> "$OUTPUT_FILE"
# Memory usage sections and summarize
echo -e "\nMemory Usage Summary:" >> "$OUTPUT_FILE"
grep -A 10 "Memory Usage:" "$COMBINED_FILE" | grep -v "Memory Usage:" | awk 'NR%2==0 {sum += $3} END {print "Average Memory Usage: " sum/NR " GB"}' >> "$OUTPUT_FILE"
# Disk usage sections and summarize
echo -e "\nDisk Usage Summary:" >> "$OUTPUT_FILE"
grep -A 10 "Disk Usage:" "$COMBINED_FILE" | grep -v "Disk Usage:" | awk 'NR%2==0 {sum += $3} END {print "Average Disk Usage: " sum/NR " GB"}' >> "$OUTPUT_FILE"
# Disk I/O stats sections and summarize
echo -e "\nDisk I/O Stats Summary:" >> "$OUTPUT_FILE"
grep -A 10 "Disk I/O Stats:" "$COMBINED_FILE" | grep -v "Disk I/O Stats:" | awk '{sum += $2} END {print "Average Disk I/O: " sum/NR " KB/s"}' >> "$OUTPUT_FILE"
# Network usage sections and summarize
echo -e "\nNetwork Usage Summary:" >> "$OUTPUT_FILE"
grep -A 10 "Network Usage:" "$COMBINED_FILE" | grep -v "Network Usage:" | awk '{sum += $3} END {print "Average Network Usage: " sum/NR " MB/s"}' >> "$OUTPUT_FILE"
echo "Cumulative Usage Report created at $OUTPUT_FILE" #printiing location of output file

