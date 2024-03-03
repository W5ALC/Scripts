#!/bin/bash

backup_dir="/root"
backup_filename="asl-hv-backup.tar"
timestamp=$(date -d "Oct 5 00:17" +%s)

# Find and backup files modified after the specified date
find / -type f -newermt "2023-10-05 00:17:00" -not \( -path "/proc/*" -o -path "/run/*" -o -path "/root/*" -o -path "/usr/lib/*" -o -path "/var/*" -o -path "/sys/*" -o -path "/tmp/*" \) -exec tar --append --file="$backup_dir/$backup_filename" --directory="/" --transform 's|^/||' '{}' +

# Add additional files to backup
read -p "Enter additional files to backup (separated by space): " additional_files
tar --append --file="$backup_dir/$backup_filename" --directory="/" --transform 's|^/||' $additional_files

echo "Backup complete! Archive stored at $backup_dir/$backup_filename"

