
#!/bin/bash

# DS1202 AS02 - System Information Report

# Get the project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_DIR="$PROJECT_DIR/logs"

# Create logs directory if it does not exist
mkdir -p "$LOG_DIR"

# Generate a timestamp for the report filename
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT="$LOG_DIR/sysinfo_$TIMESTAMP.txt"

# Generate and save the system information report
{
    echo "======================================"
    echo "      SYSTEM INFORMATION REPORT"
    echo "======================================"
    echo ""

    echo "Date and Time:"
    date
    echo ""

    echo "Hostname:"
    hostname
    echo ""

    echo "Operating System:"
    grep '^PRETTY_NAME=' /etc/os-release
    echo ""

    echo "Kernel Version:"
    uname -r
    echo ""

    echo "CPU Load:"
    uptime
    echo ""

    echo "System Uptime:"
    uptime -p
    echo ""

    echo "Memory Usage:"
    free -h
    echo ""

    echo "Disk Usage:"
    df -h /
    echo ""

    echo "======================================"
    echo "           END OF REPORT"
    echo "======================================"

} > "$REPORT"

# Display the report on the terminal
cat "$REPORT"

echo ""
echo "Report saved to: $REPORT"

