#!/bin/bash
set -e

kubectl create namespace xml

helm install xml-config-app ./chart --values chart/values/values.yaml -n xml

kubectl get pods -n xml

sleep 5

POD_NAME=$(kubectl get pods -n xml | grep xml-deployment | awk '{ print $1 }' | head -n 1)

kubectl exec $POD_NAME -n xml -- cat /tmp/config.xml | grep "com.phonegap.helloworld"

helm uninstall xml-config-app -n xml

kubectl delete namespace xml