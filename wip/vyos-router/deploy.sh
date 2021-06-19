kubectl delete secret -n kargo wan0vyos-cloudconfig
sleep 2
kubectl create secret -n kargo generic wan0vyos-cloudconfig --from-file=userdata=cloud-config.userdata
kubectl apply -n kargo -f $1
