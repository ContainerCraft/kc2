#!/bin/bash

source ./hack/userdata.yml.tmpl
echo "---" >  cloudinit.yml
kubectl create secret generic --namespace kargo microk8s-green-cloudinit-networkdata --from-file=networkdata=./hack/networkdata.yml --dry-run=client -oyaml | tee -a cloudinit.yml
echo "---" >> cloudinit.yml
kubectl create secret generic --namespace kargo microk8s-green-cloudinit-userdata    --from-file=userdata=./hack/userdata.yml       --dry-run=client -oyaml | tee -a cloudinit.yml
