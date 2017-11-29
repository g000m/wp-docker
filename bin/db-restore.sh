#!/bin/bash

$timestamp=$(date "+%d%M%Y-%H%S")

if [ -f "data/backup.sql" ];
then
  cp ./data/backup.sql ./data/backup-$timestamp.sql &&
  mv ./data/backup.sql ./public/backup.sql &&
  docker-compose run wpcli db import backup.sql &&
  echo "DB backup.sql has been restored"
else
  echo "DB backup.sql does not exist"
fi
