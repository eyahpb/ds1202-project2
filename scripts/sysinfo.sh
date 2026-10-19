#!/bin/bash

echo "===== SYSTEM INFORMATION REPORT ====="
echo ""

echo "Hostname:"
hostname
echo ""

echo "Operating System:"
grep PRETTY_NAME /etc/os-release
echo ""

echo "Kernel Version:"
uname -r
echo ""

echo "Memory Usage:"
free -h
echo ""

echo "Disk Usage:"
df -h /
echo ""
