#!/usr/bin/env bash
sudo apt-get install -y build-essential curl file
sudo apt-get install -y apt-transport-https gnupg2

# Install Kubernetes kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl