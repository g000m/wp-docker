#!/bin/bash

timestamp=$(date "+%d%M%Y-%H%S")

mv ./data/backup.sql ./public/backup.sql &&
docker-compose run wpcli db import backup.sql &&
# cp ./data/backup.sql ./data/backup-$timestamp.sql &# &
echo "DB backup.sql has been restored"
