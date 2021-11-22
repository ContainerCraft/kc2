#!/bin/bash -x

reg_port='5000'
reg_name='kind-registry'
reg_image='quay.io/cloudctl/registry'

kind_cmd="sudo ./tmp/kind"
docker_cmd="sudo docker"
kubectl_cmd="sudo ./tmp/kubectl"

##############################################################
## Create ssh keys & secret for testing
mkdir tmp/ssh
ls tmp/ssh/id_rsa || ssh-keygen -t rsa -N "" -f tmp/ssh/id_rsa
chmod 600 tmp/ssh/id_rsa
chmod 700 tmp/ssh/id_rsa.pub

##############################################################
## Download Kubectl
export K8S_RELEASE_STABLE="$(curl -sSL https://dl.k8s.io/release/stable.txt)"
sudo curl --output tmp/kubectl -L https://storage.googleapis.com/kubernetes-release/release/${K8S_RELEASE_STABLE}/bin/$(uname -s | awk '{print tolower($0)}')/amd64/kubectl
sudo chmod +x tmp/kubectl
kubectl version --short --client

##############################################################
## Download Kind
curl -Lo tmp/kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x tmp/kind

##############################################################
## Start Kind Cluster
${docker_cmd}  volume create worker1-containerd
${docker_cmd}  volume create control1-containerd
${kind_cmd}    create cluster --config kind/config.yaml
${docker_cmd}  network connect "kind" "${reg_name}" || true
sleep 5
${kubectl_cmd} get po -A
${kind_cmd} load docker-image --name qubo-test quay.io/containercraft/ubuntu:21.10

##############################################################
## Start Local Registry Service
#running="$(${docker_cmd} inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)"
#if [ "${running}" != 'true' ]; then
#  ${docker_cmd} run -d --restart=always -p "127.0.0.1:${reg_port}:5000" --name "${reg_name}" ${reg_image}
#fi
#buildah push --tls-verify=false quay.io/containercraft/ubuntu:latest localhost:5000/containercraft/ubuntu:latest
#
### Configure cluster for local registry
#cat <<EOF | ${kubectl_cmd} apply -f -
#EOF

##############################################################
## Deploy Kubevirt
${kubectl_cmd} create namespace kubectl
until ${kubectl_cmd} kustomize ./kind/apply | ${kubectl_cmd} apply -n kubevirt -f - ; do sleep 3; done
## Cannot enable useEmulation on T640 runners
#${kubectl_cmd} create configmap kubevirt-config -n kubevirt --from-literal debug.useEmulation=true

##############################################################
## Deploy Virtual Machine Image
${kubectl_cmd} create secret generic kargo-sshpubkey-kc2user --from-file=key1=tmp/ssh/id_rsa.pub --dry-run=client -oyaml | ${kubectl_cmd} apply -f -
until ${kubectl_cmd} apply -f preview/ubuntu/x86_64/21.10/vm.yaml ; do echo "trying again in 3"; sleep 3; done

###############################################################
## Test for ssh access & timeout if not achieved in N tries
#if [[ ! $TEST ]] && [[ TIME != "50" ]] ; do
#  TEST=$(ssh -i tmp/ssh/id_rsa -o StrictHostKeyChecking=no -p30950 kc2user@127.0.0.1 whoami ; echo $?)
#  sleep 6; 
#done
until ssh -i tmp/ssh/id_rsa -o StrictHostKeyChecking=no -p30950 kc2user@127.0.0.1 whoami ; do echo "trying again in 6"; sleep 6; done

kubectl describe vm ubuntu-21.10
kubectl get po -A

