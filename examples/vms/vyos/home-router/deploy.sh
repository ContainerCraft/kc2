#!/bin/bash -x

kubectl create secret generic wan0vyos-cloudconfig --dry-run=client -n default --from-file=userdata=cloud-config.userdata -oyaml | kubectl apply -f -

kubectl apply -n default -f $1
