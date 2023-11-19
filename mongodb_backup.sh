Create a new file, for example, mongodb_backup.sh, and add the following script:
==================================================================================
#!/bin/bash

# Directory to store the backups
backup_dir="/path/to/backup/directory"

# MongoDB host and port
mongo_host="localhost"
mongo_port="27017"

# Database name to backup
db_name="your_database_name"

# Timestamp (for naming the backup directory)
timestamp=$(date +%Y%m%d_%H%M%S)

# Create a directory for the backup
backup_directory="$backup_dir/$timestamp"
mkdir -p "$backup_directory"

# Run mongodump to perform the backup
mongodump --host "$mongo_host" --port "$mongo_port" --db "$db_name" --out "$backup_directory"

# Optional: Compress the backup folder to save space (uncomment the line below if needed)
# tar -zcvf "$backup_directory.tar.gz" "$backup_directory"

# Optional: Remove older backups (adjust the number of days as needed)
find "$backup_dir" -type d -ctime +7 -exec rm -rf {} \;

# Optional: Logging
echo "MongoDB backup completed on $(date)" >> "$backup_dir/backup_log.txt"
================================================================================================================================

chmod +x mongodb_backup.sh

crontab -e

30 0 * * * /path/to/mongodb_backup.sh >/dev/null 2>&1

This cron schedule will execute the mongodb_backup.sh script every day at 12:30 AM.

Remember to replace /path/to/mongodb_backup.sh with the actual path where your script is located.
