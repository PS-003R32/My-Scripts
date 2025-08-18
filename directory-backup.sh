#!/bin/bash

if [ -z "$1" ]; then
    echo "Warning: Usage: $0 <directory_to_backup>"
    exit 1
fi
SOURCE_DIR="$1"
DEST_DIR="/home/rk800/backups" #change your backup directory.
DATE=$(date +"%Y-%m-%d")

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory '$SOURCE_DIR' not found."
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
fi
DIR_NAME=$(basename "$SOURCE_DIR")
BACKUP_FILE="${DEST_DIR}/${DIR_NAME}-backup-${DATE}.zip"

echo "Creating zip backup of '$SOURCE_DIR'..."
zip -r "$BACKUP_FILE" "$SOURCE_DIR"
echo "Backup created successfully at '$BACKUP_FILE'"
