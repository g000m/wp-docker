#!/bin/bash

# Install Gesso
if [ -d "public/wp-content/themes/gesso" ];
then
	echo "Gesso is installed"
else
	echo "Gesso is not found. Installing..."
  git clone https://github.com/windycitymoon/gesso-wp ./public/wp-content/themes/gesso
  cd ./public/wp-content/themes/gesso
  rm -rf .git &&
  npm install &&
  composer create-project pattern-lab/edition-drupal-standard pattern-lab &&
  grunt build
fi

# Install Timber Library
if [ -d "public/wp-content/plugins/timber-library" ];
then
  echo "Timber Library is installed"
else
  echo "Timber Library is not found...installing"
  docker-compose run wpcli plugin install timber-library &&
  docker-compose run wpcli plugin activate timber-library &&
  docker-compose run wpcli theme activate gesso
fi
