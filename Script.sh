#!/bin/bash

sudo apt-get update

# Installer Apache2
sudo apt-get install -y apache2

# Activer Apache2 au démarrage
sudo systemctl restart apache2


sudo mkdir -p $HOME/mon-site
sudo touch $HOME/mon-site/mon-site-access.log
sudo touch $HOME/mon-site/mon-site-error.log
