#!/usr/bin/env bash
#
# Instalacion de herramientas para el ambiente de cómputo
#

apt-get -y install git runc tmux bridge-utils gcc

# Install Helm
curl -sLSf https://raw.githubusercontent.com/helm/helm/master/scripts/get | sudo bash
helm init --skip-refresh --upgrade --service-account tiller

# Install KinD
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64" && chmod +x ./kind
mkdir -p /usr/local/bin/
sudo install kind /usr/local/bin/

# Create KinD cluster
kind create cluster --name openfaas

# Install OpenFaaS CLI
curl -SLsf https://cli.openfaas.com | sudo sh