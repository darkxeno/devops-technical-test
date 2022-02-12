#!/bin/bash
set -e


kubectl apply -f challenge.yaml

sleep 10

kubectl get endpoints -n web

kubectl port-forward service/frontend 8080:80 -n web &

sleep 5

curl http://localhost:8080 | grep "Guestbook"

kill -9 $(ps -A | grep port-forward | awk '{ print $1 }' | head -n 1 )

sleep 5

kubectl delete -f challenge.yaml