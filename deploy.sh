#!/bin/bash

kubectl create -R -f ./customer-service
kubectl create -R -f ./account-service
kubectl create namespace ingress
kubectl create -R -f ./default-backend
kubectl create -f ./nginx/nginx-ingress-controller-config-map.yaml -n=ingress
kubectl create -f ./nginx/nginx-ingress-controller-roles.yaml -n=ingress
kubectl create -f ./nginx/nginx-ingress-controller-deployment.yaml -n=ingress
kubectl create -f ./nginx/nginx-ingress.yaml -n=ingress
kubectl create -f app-ingress.yaml
kubectl create -f ./nginx/nginx-ingress-controller-service.yaml -n=ingress