#!/usr/bin/env bash

kind delete cluster
kind create cluster

kubectl create namespace monitoring
helm install grafana stable/grafana --namespace monitoring
# TODO add steps for installing prometheus-operator

echo "[INFO]: Grafana username: admin"
echo "[INFO]: Grafana password: $(kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode)"
