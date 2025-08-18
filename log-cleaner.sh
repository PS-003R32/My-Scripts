#!/bin/bash

LOG_DIR="/var/log"
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory '$LOG_DIR' not found."
    exit 1
fi
read -p "Enter the number of days to keep log files (e.g., 30): " DAYS_TO_KEEP
if ! [[ "$DAYS_TO_KEEP" =~ ^[0-9]+$ ]] || [ "$DAYS_TO_KEEP" -lt 0 ]; then
    echo "Error: Invalid input. Please enter a positive number."
    exit 1
fi
echo "Cleaning log files in '$LOG_DIR' older than $DAYS_TO_KEEP days..."
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_TO_KEEP -delete
echo "Log cleanup complete!"

# this script prompts you to enter the number of days that are defined to keep. 
#Alternatively if you dont want to enter any prompts yo can remove the read function and just add the number itself.
