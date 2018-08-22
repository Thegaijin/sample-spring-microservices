#!/bin/bash
kubectl apply -R -f ./k8s/customer
kubectl apply -R -f ./k8s/account
kubectl create namespace ingress
kubectl apply -R -f ./k8s/default-backend
kubectl apply -f ./k8s/nginx/nginx-ingress-controller-config-map.yaml -n=ingress
kubectl apply -f ./k8s/nginx/nginx-ingress-controller-roles.yaml -n=ingress
kubectl apply -f ./k8s/nginx/nginx-ingress-controller-deployment.yaml -n=ingress
kubectl apply -f ./k8s/nginx/nginx-ingress.yaml -n=ingress
kubectl apply -f ./k8s/app-ingress.yaml
kubectl apply -f ./k8s/nginx/nginx-ingress-controller-service.yaml -n=ingress