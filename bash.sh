#!/bin/bash

# Function to create a backup
create_backup() {
    # Check if source directory exists
    if [ ! -d "$1" ]; then
        echo "Error: Source directory '$1' not found."
        exit 1
    fi


 # Create timestamp for the backup file
    timestamp=$(date +"%Y%m%d_%H%M%S")

    # Destination directory for the backup
    backup_dir="backup_$timestamp"
    mkdir "$backup_dir" || { echo "Error: Failed to create backup directory."; exit 1; }

    # Copy contents of source directory to backup directory
    cp -r "$1"/* "$backup_dir" || { echo "Error: Failed to copy files to backup directory."; exit 1; }

    # Create tar.gz archive of the backup
    tar -czf "$backup_dir.tar.gz" "$backup_dir" || { echo "Error: Failed to create tar.gz archive."; exit 1; }

    echo "Backup created successfully: $backup_dir.tar.gz"
}

# Check if source directory is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <source_directory>"
    exit 1
fi

# Call the function to create backup
create_backup "$1"
