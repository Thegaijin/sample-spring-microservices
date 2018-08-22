#!/bin/bash
kubectl apply -R -f ./customer-service
kubectl apply -R -f ./account-service
kubectl create namespace ingress
kubectl apply -R -f ./default-backend
kubectl apply -f ./nginx/nginx-ingress-controller-config-map.yaml -n=ingress
kubectl apply -f ./nginx/nginx-ingress-controller-roles.yaml -n=ingress
kubectl apply -f ./nginx/nginx-ingress-controller-deployment.yaml -n=ingress
kubectl apply -f ./nginx/nginx-ingress.yaml -n=ingress
kubectl apply -f app-ingress.yaml
kubectl apply -f ./nginx/nginx-ingress-controller-service.yaml -n=ingress