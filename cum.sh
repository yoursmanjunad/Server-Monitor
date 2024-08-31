#!/bin/bash

# Define the input and output files
INPUT_FILE="/home/ubuntu/Downloads/Server_REport/combined_report.txt"
OUTPUT_FILE="/home/ubuntu/Downloads/Server_REport/modified_combined_report.txt"

# Define the increase factor
FACTOR=2  # Increase all values by a factor of 2 (e.g., you can adjust this factor as needed)

# Initialize the output file
echo "Modified Combined Report with Increased Resource Usage" > "$OUTPUT_FILE"
echo "====================================================" >> "$OUTPUT_FILE"

# Modify CPU Usage
sed -n '/CPU Usage:/,/^$/p' "$INPUT_FILE" | while read -r line; do
    if [[ "$line" =~ CPU\ Usage:\ ([0-9]+)% ]]; then
        cpu_usage=$(echo "${BASH_REMATCH[1]} * $FACTOR" | bc)
        echo "CPU Usage: $cpu_usage%" >> "$OUTPUT_FILE"
    else
        echo "$line" >> "$OUTPUT_FILE"
    fi
done

# Modify Memory Usage
sed -n '/Memory Usage:/,/^$/p' "$INPUT_FILE" | while read -r line; do
    if [[ "$line" =~ Memory\ Usage:\ ([0-9.]+)\ GB ]]; then
        memory_usage=$(echo "${BASH_REMATCH[1]} * $FACTOR" | bc)
        echo "Memory Usage: $memory_usage GB" >> "$OUTPUT_FILE"
    else
        echo "$line" >> "$OUTPUT_FILE"
    fi
done

# Modify Disk Usage
sed -n '/Disk Usage:/,/^$/p' "$INPUT_FILE" | while read -r line; do
    if [[ "$line" =~ Disk\ Usage:\ ([0-9.]+)\ GB ]]; then
        disk_usage=$(echo "${BASH_REMATCH[1]} * $FACTOR" | bc)
        echo "Disk Usage: $disk_usage GB" >> "$OUTPUT_FILE"
    else
        echo "$line" >> "$OUTPUT_FILE"
    fi
done

# Modify Disk I/O Stats
sed -n '/Disk I/O Stats:/,/^$/p' "$INPUT_FILE" | while read -r line; do
    if [[ "$line" =~ Disk\ I/O\ Stats:\ ([0-9.]+)\ KB/s ]]; then
        io_stats=$(echo "${BASH_REMATCH[1]} * $FACTOR" | bc)
        echo "Disk I/O Stats: $io_stats KB/s" >> "$OUTPUT_FILE"
    else
        echo "$line" >> "$OUTPUT_FILE"
    fi
done

# Modify Network Usage
sed -n '/Network Usage:/,/^$/p' "$INPUT_FILE" | while read -r line; do
    if [[ "$line" =~ Network\ Usage:\ ([0-9.]+)\ MB/s ]]; then
        network_usage=$(echo "${BASH_REMATCH[1]} * $FACTOR" | bc)
        echo "Network Usage: $network_usage MB/s" >> "$OUTPUT_FILE"
    else
        echo "$line" >> "$OUTPUT_FILE"
    fi
done

echo "Modified report created at $OUTPUT_FILE"

