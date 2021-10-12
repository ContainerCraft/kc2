#!/bin/bash
source hack/userdata.yml.tmpl
echo "---" >  cloudinit.yml
kubectl create secret generic --namespace kargo node1-cloudinit-networkdata --from-file=networkdata=./hack/node1-networkdata.yml --dry-run=client -oyaml | tee -a cloudinit.yml
echo "---" >> cloudinit.yml
kubectl create secret generic --namespace kargo node2-cloudinit-networkdata --from-file=networkdata=./hack/node2-networkdata.yml --dry-run=client -oyaml | tee -a cloudinit.yml
echo "---" >> cloudinit.yml
kubectl create secret generic --namespace kargo node3-cloudinit-networkdata --from-file=networkdata=./hack/node3-networkdata.yml --dry-run=client -oyaml | tee -a cloudinit.yml
echo "---" >> cloudinit.yml
kubectl create secret generic --namespace kargo kargo-cloudinit-userdata    --from-file=userdata=./hack/userdata.yml             --dry-run=client -oyaml | tee -a cloudinit.yml
