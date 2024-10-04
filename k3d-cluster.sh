#!/bin/bash

k3d cluster delete test-cluster
k3d cluster create test-cluster -s 1 -a 1 -p "3001:80@loadbalancer"
docker build -t marquard/prefect-server:latest prefect/server
docker build -t marquard/prefect-worker:latest prefect/worker
k3d image import marquard/prefect-server:latest marquard/prefect-worker:latest -c test-cluster


kubectl apply -f prefect/server/statefulset.yaml
kubectl apply -f prefect/worker/deployment.yaml

kubectl apply -f metrics-dashboard/deployment.yaml
kubectl apply -f metrics-dashboard/ingress.yaml

# /api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy