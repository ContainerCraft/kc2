### Double check kubeconfig/context
```bash
export KUBECONFIG=$HOME/.kube/config
kubectl --namespace=default config get-contexts
kubectl --namespace=default config use-context sauron
```

### Create Controlplane Userdata from Talos MachineConfig
```
kubectl create secret generic talos-controlplane-userdata \
    --dry-run=client -oyaml --namespace default \
    --from-file=userdata=talos/controlplane.yaml \
  | tee talos-controlplane-userdata.yaml
```

### Create Controlplane Bootstrap Userdata from Talos MachineConfig
```bash
kubectl create secret generic talos-controlplane-init-userdata \
    --dry-run=client -oyaml --namespace default \
    --from-file=userdata=talos/controlplane-init.yaml \
  | tee talos-controlplane-init-userdata.yaml
```

### Create VMs
```bash
kubectl --namespace=default kustomize kubevirt/vm | kubectl apply -f -
kubectl --namespace=default get vm -owide
```

### Pull Kubeconfig & watch pods come up
```bash
talosctl -e $ip -n $ip --talosconfig talosconfig kubeconfig --force --merge --force-context-name aza --context aza --cluster aza
watch kubectl --kubeconfig=kubeconfig get pods -owide -A
```

```bash
# talosctl -e $ip -n $ip --talosconfig talosconfig disks --insecure
# talosctl --talosconfig talosconfig -n $ip -e $ip disks
#export ip="192.168.1.41"
#talosctl -e $ip -n $ip --talosconfig talosconfig apply-config --file talos/controlplane.yaml --mode auto --insecure
#export ip="192.168.1.42"
#talosctl -e $ip -n $ip --talosconfig talosconfig apply-config --file talos/controlplane.yaml --mode auto --insecure
#export ip="192.168.1.43"
#talosctl -e $ip -n $ip --talosconfig talosconfig apply-config --file talos/controlplane.yaml --mode auto --insecure
```
