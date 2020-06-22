#!/usr/bin/env bash
#
# Script que permite la instalacion de Docker
#
sudo apt-get update && apt-get upgrade -y
sudo apt-get -y install docker.io
usermod -aG docker vagrant
docker pull andresfelipe9619/asignacion-faas