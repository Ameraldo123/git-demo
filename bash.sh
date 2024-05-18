#!/bin/bash

# Function to create a backup
create_backup() {
    # Check if source directory exists
    if [ ! -d "$1" ]; then
        echo "Error: Source directory '$1' not found."
        exit 1
    fi
