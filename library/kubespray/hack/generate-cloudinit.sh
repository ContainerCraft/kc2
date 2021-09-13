#!/bin/bash
source hack/userdata.yml.tmpl
echo "---" >  cloudinit.yml
kubectl create secret generic --namespace kargo node1-green-cloudinit-networkdata --from-file=networkdata=./hack/node1-networkdata.yml --dry-run=client -oyaml | tee -a cloudinit.yml
echo "---" >> cloudinit.yml
kubectl create secret generic --namespace kargo node2-green-cloudinit-networkdata --from-file=networkdata=./hack/node2-networkdata.yml --dry-run=client -oyaml | tee -a cloudinit.yml
echo "---" >> cloudinit.yml
kubectl create secret generic --namespace kargo node3-green-cloudinit-networkdata --from-file=networkdata=./hack/node3-networkdata.yml --dry-run=client -oyaml | tee -a cloudinit.yml
echo "---" >> cloudinit.yml
kubectl create secret generic --namespace kargo kargo-green-cloudinit-userdata    --from-file=userdata=./hack/userdata.yml             --dry-run=client -oyaml | tee -a cloudinit.yml
