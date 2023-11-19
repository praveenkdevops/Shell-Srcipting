#!/bin/bash

# PostgreSQL Database Details
PG_USER="your_username"
PG_DB="your_database_name"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Create directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Timestamp for the backup file
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Backup filename format
BACKUP_FILE="$BACKUP_DIR/$PG_DB-$TIMESTAMP.sql.gz"

# Perform PostgreSQL database backup
pg_dump -U "$PG_USER" "$PG_DB" | gzip > "$BACKUP_FILE"

# Delete backups older than 5 days
find "$BACKUP_DIR" -name "$PG_DB-*.sql.gz" -type f -mtime +5 -delete

==============================================================================================


Make sure to replace "your_username", "your_database_name", and "/path/to/backup/directory" with your PostgreSQL username, database name, and the path to the directory where you want to store backups.

Save this script with a .sh extension, for example, backup_script.sh. Don't forget to grant executable permissions to the script using the command chmod +x backup_script.sh.

You'll then want to set up a scheduled task using cron to execute this script daily at 12:30 AM. To do this, you can edit the crontab by running:

crontab -e

30 0 * * * /path/to/your/backup_script.sh

This cron schedule means the script will run every day at 12:30 AM (0 hours and 30 minutes).

Remember to replace "/path/to/your/backup_script.sh" with the actual path where your script is located.
