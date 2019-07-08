#!/bin/bash
#tain node
kubectl taint node $(kubectl get nodes | awk '{print $1}' | tail -n 1) node-type=prod:NoSchedule
#Create dev pod
kubectl create -f dev.yaml
#Create prod pod
kubectl create -f prod.yaml

kubectl get pods -o wide

kubectl get pods $(kubectl get pods | awk '{print $1}' | grep -i "prod" ) -o yaml >> schedule-info.out



