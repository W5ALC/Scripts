#!/bin/bash

backup_dir="/root/"
backup_filename="asl-hv-backup.tar"

# Find and extract the backup file
find "$backup_dir" -name "$backup_filename" -exec tar --extract --file={} --directory="/" \;

echo "Restore complete!"

