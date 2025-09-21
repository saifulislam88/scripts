#!/bin/bash

# -------------------------------------------
# | Script Created By: Saiful Islam | mSi   |
# | Script Created at: 10-09-2025 23:05 PM  |
# -------------------------------------------

# Variables
BACKUP_DIR="/var/opt/gitlab/backups"
LOG_FILE="/var/log/git_backup.log"
DATE=$(date +"%Y-%m-%d.%H.%M")
RETENTION_DAYS=3

# Logging for easier troubleshooting
exec > >(tee -i "$LOG_FILE") 2>&1

echo "Starting GitLab backup at $(date)..."

# 1. Find and remove backup files older than 3 days
echo "Cleaning up backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -mtime +$RETENTION_DAYS -type f -exec rm -f {} \; || { echo "Failed to remove old backups"; exit 1; }

# 2. Create a new GitLab backup
echo "Creating new GitLab backup: backup-${DATE}"
gitlab-rake gitlab:backup:create || { echo "GitLab backup failed"; exit 1; }

# 3. Completion message
echo "Backup completed successfully at $(date)."
