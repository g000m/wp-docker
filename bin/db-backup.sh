#!/bin/bash

# timestamp=$(date "+%d%M%Y-%H%S")

docker-compose run wpcli db export backup.sql &&
mv ./public/backup.sql ./data/backup.sql &&
echo "Database backup.sql has been created in the data folder"
