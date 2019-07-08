#!/bin/bash

#Create an nginx deployment
kubectl run nginx --image=nginx

#Create service
kubectl expose deployment nginx --port 80 --type NodePort

#Busybox pod spec
# cat << EOF > busybox.yaml
# apiVersion: v1
# kind: Pod
# metadata:
#   name: busybox
# spec:
#   containers:
#   - image: busybox:1.28.4
#     command:
#       - sleep
#       - "3600"
#     name: busybox
#   restartPolicy: Always
# EOF

kubectl create -f busybox.yaml

#Query DNS for nginx service
kubectl get pods