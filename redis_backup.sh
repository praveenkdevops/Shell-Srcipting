#!/bin/bash

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Redis configuration
REDIS_HOST="localhost"
REDIS_PORT="6379"
REDIS_PASSWORD="your_redis_password"

# Create a backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Define backup filename with date
BACKUP_FILENAME="redis_backup_$(date +%Y%m%d_%H%M%S).rdb"

# Perform Redis backup
redis-cli -h "$REDIS_HOST" -p "$REDIS_PORT" -a "$REDIS_PASSWORD" save

# Move the generated backup file to the backup directory
mv dump.rdb "$BACKUP_DIR/$BACKUP_FILENAME"

# Delete backups older than 5 days
find "$BACKUP_DIR" -type f -name 'redis_backup_*' -mtime +5 -exec rm {} \;

==================================================================================================

To set up a daily backup at 12:30 AM, you can use the cron scheduler in Linux. Follow these steps:

Save the above script in a file, for example, redis_backup_script.sh.
Make the script executable: chmod +x redis_backup_script.sh.
Open the crontab editor by running crontab -e.
Add the following line at the end of the crontab file to schedule the backup at 12:30 AM every day:

30 0 * * * /path/to/redis_backup_script.sh

