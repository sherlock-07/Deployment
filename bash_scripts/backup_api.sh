#!/bin/bash

API_DIR="/home/ubuntu/app"
BACKUP_DIR="/home/ubuntu/backups"
DATE=$(date +%F)
LOG_FILE="/var/log/backup.log"


# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Functions
log_info() {
    echo "$(date "+%Y-%m-%d %H:%M:%S") - INFO: $1" >> "$LOG_FILE"
}

log_error() {
    echo "$(date "+%Y-%m-%d %H:%M:%S") - ERROR: $1" >> "$LOG_FILE"
}

# Backup API project
tar -czf "$BACKUP_DIR/api_backup_${DATE}.tar.gz" "$API_DIR"
if [ $? -eq 0 ]; then
    log_info "API project backed up successfully."
else
    log_error "Failed to back up API project."
fi


# Delete backups older than 7 days
find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \; && log_info "Old backups deleted."

# Backup API project
tar -czf "$BACKUP_DIR/api_backup_${DATE}.tar.gz" "$API_DIR"
if [ $? -eq 0 ]; then
    log_info "API project backed up successfully."
else
    log_error "Failed to back up API project."
fi



# Delete backups older than 7 days
find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \; && log_info "Old backups deleted."
