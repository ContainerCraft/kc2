#!/bin/bash -x

kubectl delete secret wan0vyos-cloudconfig
kubectl create secret generic wan0vyos-cloudconfig --dry-run=client -n default --from-file=userdata=cloud-config.userdata -oyaml | kubectl apply -f -

kubectl delete vm vyos-blue-wan0 2>/dev/null
kubectl apply -n default -f $1
