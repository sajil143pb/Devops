#!/bin/bash
####################################
#
# Backup script created by sajil
#
####################################

# What to backup.
backup_files="/var/www/html"

# Where to backup to.
dest="/backups"

# Create archive filename.
day=$(date +"%d-%m-%y-%T")
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date
# Copying backup to s3
aws s3 cp /backups/${hostname}-${day}.tgz s3://bucket-name

#remove backups
rm -rf "$dest/$archive_file"