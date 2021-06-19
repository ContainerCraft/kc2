#!/bin/bash -x

kubectl create secret generic wan0vyos-cloudconfig --dry-run=client -n kargo --from-file=cloud-config.userdata -oyaml | kubectl apply -f -

kubectl apply -n kargo -f vyos-blue.yaml
