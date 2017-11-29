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
  grunt build
fi

# Install Timber Library
if [ -d "public/wp-content/plugins/timber-library" ];
then
  echo "Timber Library is installed"
else
  echo "Timber Library is not found. Installing..."
  docker-compose run wpcli plugin install timber-library &&
  docker-compose run wpcli plugin activate timber-library &&
  docker-compose run wpcli theme activate gesso
fi

# Create Symlink to Gesso Theme in root folder
if [ -d "theme" ];
then
  echo "theme symlink exists"
else
  echo "Creating symlink to gesso theme in root"
  cd ./
  ln -s public/wp-content/themes/gesso theme
fi

#Install Patternlab
if [ -d "public/wp-content/themes/gesso/pattern-lab" ];
then
  echo "Patternlab is already installed"
else
  echo
  read -p "Would you like to install Patternlab (y/N)" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]];
  then
    echo "Installing Patternlab"
    cd ./public/wp-content/themes/gesso
    composer create-project  pattern-lab/edition-drupal-standard pattern-lab
  else
    echo "No Patternlab needed"
  fi
fi
