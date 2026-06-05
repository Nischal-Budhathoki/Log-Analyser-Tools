#!/bin/bash

echo "Log analyzer tools"

# Check argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-file>"
    exit 1
fi

LOG_FILE=$1

# Check file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File does not exist."
    exit 1
fi

ERRORS=$(grep -c "ERROR" "$LOG_FILE")
WARNINGS=$(grep -c "WARNING" "$LOG_FILE")
INFOS=$(grep -c "INFO" "$LOG_FILE")

echo "======================="
echo "Log Analysis Report"
echo "======================="
echo "INFO     : $INFOS"
echo "WARNING  : $WARNINGS"
echo "ERROR    : $ERRORS"