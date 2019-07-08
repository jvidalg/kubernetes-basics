#!/bin/bash

#Simple deployment of nginx 
kubectl create deployment nginx --image=nginx
kubectl scale deployment nginx --replicas=4
