#!/bin/bash

timestamp=$(date "+%d%M%Y-%H%S")

docker-compose run wpcli db export backup.sql &&
mv ./public/backup.sql ./data/backup.sql &&
# cp ./data/backup.sql ./data/backup-$timestamp.sql &# &
echo "DB backup-$timestamp.sql has been backed up to the data folder"
