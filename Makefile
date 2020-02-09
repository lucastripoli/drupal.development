
all: mount_folder

download_enviroment:
	git clone https://github.com/lucastripoli/drupal.development.enviroment.git

download_dependences:
	git clone https://github.com/lucastripoli/drupal.development.dependences.git

mount_project:
	mkdir docroot
	mkdir infraestructure

import_dependences:
	cp -R drupal.development.dependences/* docroot/

export_dependences:
	cp -R docroot/core drupal.development.dependences/core
	cp -R docroot/vendor drupal.development.dependences/vendor
	cp docroot/autoload.php drupal.development.dependences/autoload.php
	cp docroot/composer.json drupal.development.dependences/composer.json
	cp docroot/composer.lock drupal.development.dependences/composer.lock
	cp docroot/index.php drupal.development.dependences/index.php
	cp docroot/update.php drupal.development.dependences/update.php

import_enviroment:
	cp -R drupal.development.enviroment/* infraestructure/

mount_enviroment:
	cd infraestructure && docker-compose up -d
