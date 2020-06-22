#!/usr/bin/env bash
sudo apt-get install -y build-essential curl file
sudo apt-get install -y apt-transport-https gnupg2

# Install Kubernetes kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

kubectl cluster-info --context kind-openfaas

kubectl -n kube-system create sa tiller \
 && kubectl create clusterrolebinding tiller \
      --clusterrole cluster-admin \
      --serviceaccount=kube-system:tiller

kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

helm repo add openfaas https://openfaas.github.io/faas-netes && \
    helm repo update && \
    helm upgrade openfaas --install openfaas/openfaas \
      --namespace openfaas  \
      --set basic_auth=false \
      --set functionNamespace=openfaas-fn \
      --set operator.create=true

