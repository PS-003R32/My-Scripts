#!/bin/bash

LOG_DIR="/var/log"
DAYS_TO_KEEP=30 #change the no. of days for deletion 

echo "Cleaning log files in $LOG_DIR older than $DAYS_TO_KEEP days..."
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_TO_KEEP -delete
echo "Log cleanup complete!"
