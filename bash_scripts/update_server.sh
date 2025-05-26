#!/bin/bash

REPO_DIR="/home/ubuntu/app"
LOG_FILE="/var/log/update.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

log_info() {
    echo "$TIMESTAMP - INFO: $1" >> "$LOG_FILE"
}

log_error() {
    echo "$TIMESTAMP - ERROR: $1" >> "$LOG_FILE"
}

# Update Ubuntu packages
log_info "Updating packages..."
apt update && apt upgrade -y >> "$LOG_FILE" 2>&1

# Pull latest code
cd "$REPO_DIR"
git pull origin main >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_error "Git pull failed. Aborting update."
    exit 1
else
    log_info "Git pull successful."
fi

# Restart web server
if systemctl restart apache2 || systemctl restart nginx; then
    log_info "Web server restarted successfully."
else
    log_error "Failed to restart web server."
fi
