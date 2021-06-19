kubectl create -n kargo secret generic wan0vyos-cloudconfig --from-file=userdata=startup-script
kubectl apply -n kargo -f debug.yaml
