#!/usr/bin/env bash
#
# Script para la instalacion de asciinema
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-29
apt-add-repository ppa:zanchey/asciinema
apt update
apt -y install asciinema