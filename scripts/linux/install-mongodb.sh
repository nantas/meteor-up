#!/bin/bash

# Remove the lock
set +e
sudo rm /var/lib/dpkg/lock > /dev/null
sudo rm /var/cache/apt/archives/lock > /dev/null
sudo dpkg --configure -a
set -e

sudo apt-get update -y
sudo apt-get install mongodb-server -y

# Restart mongodb
sudo stop mongod || :
sudo start mongod
