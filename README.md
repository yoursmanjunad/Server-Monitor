# System Monitoring Shell Scripts

This repository contains a collection of shell scripts that I have used to monitor and analyze the utilization of a server during emergencies. These scripts are designed to capture and record various metrics such as CPU, memory, disk usage, network traffic, and disk I/O, allowing for a comprehensive analysis of server performance under different conditions.

## Table of Contents

- [Introduction](#introduction)
- [Scripts Overview](#scripts-overview)
- [Usage](#usage)
- [Setup](#setup)
- [Contributing](#contributing)
- [License](#license)

## Introduction

In critical situations where server performance needs to be closely monitored, these shell scripts provide a reliable way to record and analyze system utilization. The scripts are designed to quickly gather relevant metrics and summarize them, making it easier to identify performance bottlenecks or resource overuse by specific users or applications.

## Scripts Overview

- **CPU Usage Monitoring**: Captures and summarizes CPU utilization over a period, helping to identify processes or users consuming excessive CPU resources.
- **Memory Usage Monitoring**: Records memory usage data, summarizing the information to highlight potential memory leaks or heavy usage.
- **Disk Usage Monitoring**: Tracks disk space usage, providing insights into storage consumption patterns.
- **Disk I/O Monitoring**: Measures disk I/O operations, helping to analyze read/write operations and potential disk bottlenecks.
- **Network Usage Monitoring**: Monitors network traffic to detect unusual activity or bandwidth-heavy processes.
- **Cumulative Usage Report Generation**: Generates a comprehensive report summarizing all key metrics, making it easier to review overall server performance.

## Usage

To use these scripts, simply clone the repository and run the desired script(s) on your server. Each script is designed to be self-contained and can be executed independently.

### Example

```bash
./Monitor.sh
./aggregate_user.sh
./total_report.sh
```

The scripts will generate output files containing the monitored data, which can then be analyzed further as needed.

## Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yoursmanjunad/Server-Monitor/
   cd Server-Monitor
   ```

2. **Make Scripts Executable**:
   ```bash
   chmod +x *.sh
   ```

3. **Run the Scripts**:
   Execute the desired script(s) as needed to monitor your server.

## Contributing

If you have suggestions for improving these scripts or would like to contribute your own, please feel free to open an issue or submit a pull request. Contributions are always welcome!

