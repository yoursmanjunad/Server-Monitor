#!/bin/bash

# Define the combined report file
COMBINED_FILE="/home/ubuntu/Downloads/Server_REport/combined_report.txt"
OUTPUT_FILE="/home/ubuntu/Downloads/Server_REport/total_usage_report.txt"

# Initialize the output file
echo "Total Usage Report" > "$OUTPUT_FILE"
echo "===================" >> "$OUTPUT_FILE"

# Total variables
total_cpu=0
total_memory=0
total_disk=0
total_io=0
total_network=0
count_cpu=0
count_memory=0
count_disk=0
count_io=0
count_network=0

# Extract and sum CPU usage
echo -e "\nTotal CPU Usage:" >> "$OUTPUT_FILE"
grep -A 10 "CPU Usage:" "$COMBINED_FILE" | grep -v "CPU Usage:" | while read -r line; do
    cpu=$(echo "$line" | awk '{print $3}')
    if [[ ! -z "$cpu" ]]; then
        total_cpu=$(echo "$total_cpu + $cpu" | bc)
        count_cpu=$((count_cpu + 1))
    fi
done
echo "Total CPU Usage: $total_cpu%" >> "$OUTPUT_FILE"

# Extract and sum Memory usage
echo -e "\nTotal Memory Usage:" >> "$OUTPUT_FILE"
grep -A 10 "Memory Usage:" "$COMBINED_FILE" | grep -v "Memory Usage:" | while read -r line; do
    memory=$(echo "$line" | awk '{print $3}')
    if [[ ! -z "$memory" ]]; then
        total_memory=$(echo "$total_memory + $memory" | bc)
        count_memory=$((count_memory + 1))
    fi
done
echo "Total Memory Usage: $total_memory GB" >> "$OUTPUT_FILE"

# Extract and sum Disk usage
echo -e "\nTotal Disk Usage:" >> "$OUTPUT_FILE"
grep -A 10 "Disk Usage:" "$COMBINED_FILE" | grep -v "Disk Usage:" | while read -r line; do
    disk=$(echo "$line" | awk '{print $3}')
    if [[ ! -z "$disk" ]]; then
        total_disk=$(echo "$total_disk + $disk" | bc)
        count_disk=$((count_disk + 1))
    fi
done
echo "Total Disk Usage: $total_disk GB" >> "$OUTPUT_FILE"

# Extract and sum Disk I/O
echo -e "\nTotal Disk I/O:" >> "$OUTPUT_FILE"
grep -A 10 "Disk I/O Stats:" "$COMBINED_FILE" | grep -v "Disk I/O Stats:" | while read -r line; do
    io=$(echo "$line" | awk '{print $2}')
    if [[ ! -z "$io" ]]; then
        total_io=$(echo "$total_io + $io" | bc)
        count_io=$((count_io + 1))
    fi
done
echo "Total Disk I/O: $total_io KB/s" >> "$OUTPUT_FILE"

# Extract and sum Network usage
echo -e "\nTotal Network Usage:" >> "$OUTPUT_FILE"
grep -A 10 "Network Usage:" "$COMBINED_FILE" | grep -v "Network Usage:" | while read -r line; do
    network=$(echo "$line" | awk '{print $3}')
    if [[ ! -z "$network" ]]; then
        total_network=$(echo "$total_network + $network" | bc)
        count_network=$((count_network + 1))
    fi
done
echo "Total Network Usage: $total_network MB/s" >> "$OUTPUT_FILE"

echo "Total Usage Report created at $OUTPUT_FILE"

