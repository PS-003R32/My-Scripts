#!/bin/bash

ZSH_HISTORY="/home/rk800/.zsh_history"
BACKUP_HISTORY="/home/rk800/.zsh_history.bak"
TEMP_HISTORY="/home/rk800/.zsh_history.tmp"

if [ ! -f "$ZSH_HISTORY" ]; then
    echo "Error: $ZSH_HISTORY does not exist."
    exit 1
fi
echo "Creating backup of $ZSH_HISTORY to $BACKUP_HISTORY"
cp "$ZSH_HISTORY" "$BACKUP_HISTORY" || {
    echo "Error: Failed to create backup of $ZSH_HISTORY"
    exit 1
}
echo "Attempting to repair $ZSH_HISTORY..."
strings "$ZSH_HISTORY" > "$TEMP_HISTORY" || {
    echo "Error: Failed to process $ZSH_HISTORY with strings"
    exit 1
}
mv "$TEMP_HISTORY" "$ZSH_HISTORY" || {
    echo "Error: Failed to replace $ZSH_HISTORY with repaired version"
    exit 1
}
chmod 600 "$ZSH_HISTORY" || {
    echo "Warning: Failed to set permissions on $ZSH_HISTORY"
}
echo "Verifying the history file..."
zsh -c "fc -R $ZSH_HISTORY" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "Success: $ZSH_HISTORY has been repaired and is now usable."
else
    echo "Warning: The history file may still have issues. Consider clearing it."
    echo "To clear the history file, run: echo '' > $ZSH_HISTORY"
fi

echo "Backup of original file is saved at $BACKUP_HISTORY"
exit 0
