#!/bin/bash

#Simple deployment of nginx 
kubectl create deployment nginx --image=nginx
kubectl get deployments

#Forward the container port 80 to 8081
kubectl port-forward $(kubectl get pods | tail -n 1 | awk '{print $1}') 8081:80  &

#Expose deployment
kubectl expose deployment nginx --port 80 --type NodePort
