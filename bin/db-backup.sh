#!/bin/bash

# timestamp=$(date "+%d%M%Y-%H%S")

source ./.env


docker-compose run wpcli db export backup.sql &&
mv ./${PROJECT_NAME}-dev/backup.sql ./data/backup.sql &&
echo "Database backup.sql has been created in the data folder"
