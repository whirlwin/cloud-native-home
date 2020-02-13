#!/usr/bin/env bash

kind create cluster

kubectl create namespace monitoring
helm install grafana stable/grafana --namespace monitoring

echo "[INFO]: Grafana username: admin"
echo "[INFO]: Grafana password: $(kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode)"
