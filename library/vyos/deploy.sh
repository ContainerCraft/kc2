#!/bin/bash -e

# Create or update the cloud-init secret
kubectl delete secret wan0vyos-cloudconfig --ignore-not-found
kubectl create secret generic wan0vyos-cloudconfig \
  --from-file=userdata=cloud-config.userdata \
  --dry-run=client -o yaml | kubectl apply -f -

# Deploy the VirtualMachine
kubectl delete vm vyos-blue-wan0 --ignore-not-found
kubectl apply -f vyos-blue.yaml

# Wait for VM to be ready
#echo "Waiting for VM to become ready..."
#kubectl wait --for=condition=Ready vm/vyos-blue-wan0 --timeout=300s

# Print VM status
#echo "Deployment complete. VM status:"
#kubectl get -oyaml vm vyos-blue-wan0
