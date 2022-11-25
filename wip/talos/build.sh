export KUBECONFIG=/Users/usrbinkat/.kube/config
kubectl --namespace=default config get-contexts
kubectl --namespace=default config use-context sauron
kubectl --namespace=default kustomize kubevirt/vm | kubectl apply -f -
kubectl --namespace=default get vm -owide

export ip="192.168.1.41"
talosctl -e $ip -n $ip --talosconfig talosconfig apply-config --file talos/controlplane.yaml --mode auto --insecure

export ip="192.168.1.42"
talosctl -e $ip -n $ip --talosconfig talosconfig apply-config --file talos/controlplane.yaml --mode auto --insecure

export ip="192.168.1.43"
talosctl -e $ip -n $ip --talosconfig talosconfig apply-config --file talos/controlplane.yaml --mode auto --insecure

export ip="192.168.1.41"
talosctl -e $ip -n $ip --talosconfig talosconfig bootstrap

talosctl -e $ip -n $ip --talosconfig talosconfig kubeconfig --force --merge --force-context-name aza --context aza --cluster aza

watch kubectl --kubeconfig=kubeconfig get pods -owide -A

# talosctl -e $ip -n $ip --talosconfig talosconfig disks --insecure
# talosctl --talosconfig talosconfig -n $ip -e $ip disks
