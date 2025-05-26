#!/bin/bash

LOG_FILE="/var/log/server_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Functions
log_info() {
    echo "$TIMESTAMP - INFO: $1" >> "$LOG_FILE"
}

log_warn() {
    echo "$TIMESTAMP - WARNING: $1" >> "$LOG_FILE"
}

# Check CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
log_info "CPU Usage: $CPU_USAGE%"

# Check Memory Usage
MEMORY_USAGE=$(free | awk '/Mem:/ { printf("%.2f"), $3/$2 * 100.0 }')
log_info "Memory Usage: $MEMORY_USAGE%"

# Check Disk Usage
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')
log_info "Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt 90 ]; then
    log_warn "Disk usage is above 90%"
fi

# Check Web Server (apache2 or nginx)
if systemctl is-active --quiet apache2 || systemctl is-active --quiet nginx; then
    log_info "Web server is running."
else
    log_warn "Web server is not running!"
fi

# Check API endpoints
for endpoint in "/students" "/subjects"
do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://ec2-13-49-159-116.eu-north-1.compute.amazonaws.com$endpoint)
    if [ "$STATUS" -eq 200 ]; then
        log_info "API $endpoint is OK (Status 200)."
    else
        log_warn "API $endpoint check failed (Status $STATUS)."
    fi
done
