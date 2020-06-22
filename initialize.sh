#!/usr/bin/env bash

# Create KinD cluster
kind create cluster --name openfaas
kubectl cluster-info --context kind-openfaas

# Create a ServiceAccount for Tiller
kubectl -n kube-system create sa tiller \
 && kubectl create clusterrolebinding tiller \
      --clusterrole cluster-admin \
      --serviceaccount=kube-system:tiller

# Install the Tiller server component
helm init --skip-refresh --upgrade --service-account tiller

# Create the openfaas and openfaas-fn namespaces
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

# Install using the helm chart
helm repo add openfaas https://openfaas.github.io/faas-netes && \
    helm repo update && \
    helm upgrade openfaas --install openfaas/openfaas \
      --namespace openfaas  \
      --set basic_auth=false \
      --set functionNamespace=openfaas-fn \
      --set operator.create=true

# Start Docker container with tensorflow
docker run -d -p 8000:8080 -p 8001:8001 andresfelipe9619/asignacion-faas:latest

# Connect to GCE exit node
inlets client --remote "ws://34.82.3.78:8080" --token "Kd6qf8yeeggw6Bfdz2T7A33MC0GYG1CqayLtaJAlpTgridDcrVdizriR5OTNSHvV" --upstream "http://127.0.0.1:8000"