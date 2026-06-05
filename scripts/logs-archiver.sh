#!/bin/bash

echo "Log Archiver Tool"

# Check argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR=$1

# Check directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Create archive folder
ARCHIVE_DIR="../archives"
mkdir -p "$ARCHIVE_DIR"

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive file name
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_${TIMESTAMP}.tar.gz"

# Create archive
tar -czf "$ARCHIVE_FILE" "$LOG_DIR"

# Check success
if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Archived $LOG_DIR -> $ARCHIVE_FILE" >> ../archive.log
    echo "Archive created successfully:"
    echo "$ARCHIVE_FILE"
else
    echo "Archive failed."
    exit 1
fi