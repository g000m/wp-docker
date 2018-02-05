# Wordpress Docker Local Dev Environment (with Gesso theme)

This docker instance is meant to be a local dev environment for Wordpress.

### Getting Started

1. Clone this repo
2. Run `$ docker-compose up -d`
3. The install will be available at http://localhost:8080, follow the install prompts to finish setting the site up.

### WP-CLI
To avoid having to enter the wpcli docker container before running any WP-CLI command you should add the following alias to your local machine's ~/.bash_profile.

`alias dwp="docker-compose run wpcli"`

Instead of running a command like `wp plugin install` you instead run `dwp plugin install` from anywhere inside the <my-project-name> directory, and it runs the command inside of the php container.

### SSH Access
You can easily access the WordPress/PHP container with docker-compose exec. Here's a simple alias to add to your ~/.bash_profile:

`alias dbash="sudo docker exec -i -t wordpress /bin/bash"`

### Manual Database Backup and Restore
- For Backups
Run `$ sh bin/db-backup.sh`
from anywhere inside the project's root directory

- For Restore
Run `$ sh bin/db-restore.sh`
from anywhere inside the project's root directory

<!---
### Patternlab
To install Pattenlab
Run  `$ sh bin/patternlab.sh`
from anywhere inside the project's root directory
When prompted, select /forumone/starterkit-twig-drupal-gesso as the starterkit.
If prompted, select 'r' to overwrite existing /source/ files.
-->

### Theme Development
This box comes with a script to install run Gesso,  a Sass-based Wordpress starter theme that outputs accessible HTML5 markup. It uses a mobile-first responsive approach and leverages SMACSS for style organization. This encourages a component-based approach to theming through the creation of discrete, reusable UI elements.

More information about Gesso can be found [here](https://github.com/windycitymoon/gesso-wp)

- To install gesso
Run `$ sh bin/gesso-install.sh`
from anywhere inside the <my-project-name> root directory

- There is an option install Patternlab as part of this script.

When prompted, select /forumone/starterkit-twig-drupal-gesso as the starterkit.

If prompted, select 'r' to overwrite existing /source/ files.

- To Run Gesso
Run `$ sh bin/fed-start.sh`
from anywhere inside the <my-project-name> root directory
