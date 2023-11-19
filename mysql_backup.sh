 Here's an example of a shell script that can perform MySQL backup, keep backups for 5 days, and delete older backups automatically:

=========================================================================================================
 #!/bin/bash

# MySQL database credentials
DB_USER="your_username"
DB_PASS="your_password"
DB_NAME="your_database_name"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Current date
DATE=$(date +%Y%m%d-%H%M%S)

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Perform MySQL backup
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql

# Remove backups older than 5 days
find $BACKUP_DIR -type f -name "$DB_NAME-*.sql" -mtime +5 -exec rm {} \;
=============================================================================================================

Please replace 'your_username', 'your_password', 'your_database_name', and '/path/to/backup/directory' with your actual MySQL credentials and desired backup directory.

To automate the backup process to run daily at 12:30 AM, you can schedule this script using the cron utility. Open the cron jobs editor by running:


crontab -e


30 0 * * * /bin/bash /path/to/your/script.sh


Replace '/path/to/your/script.sh' with the actual path to your shell script file.

