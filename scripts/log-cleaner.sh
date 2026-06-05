#!/bin/bash

echo "🧹 Cleanup Tool"

ARCHIVE_DIR="../archives"

# delete files older than 7 days
find "$ARCHIVE_DIR" -type f -name "*.tar.gz" -mtime +15 -exec rm -f {} \;

echo "Old archives older than 7 days removed."