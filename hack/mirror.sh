#!/bin/bash -x

mkdir -p \
  $PWD/mirror/registry-gcr.io \
  $PWD/mirror/registry-ghcr.io \
  $PWD/mirror/registry-quay.io \
  $PWD/mirror/registry-docker.io \
  $PWD/mirror/registry-k8s.gcr.io \

podman run --replace -d -p 5000:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
    --restart always \
    --volume $PWD/mirror/registry-docker.io:/var/lib/registry:z \
    --name registry-docker.io registry:2

podman run --replace -d -p 5001:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://k8s.gcr.io \
    --restart always \
    --volume $PWD/mirror/registry-k8s.gcr.io:/var/lib/registry:z \
    --name registry-k8s.gcr.io registry:2

podman run --replace -d -p 5002:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://quay.io \
    --restart always \
    --volume $PWD/mirror/registry-quay.io:/var/lib/registry:z \
    --name registry-quay.io registry:2.5

podman run --replace -d -p 5003:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://gcr.io \
    --restart always \
    --volume $PWD/mirror/registry-gcr.io:/var/lib/registry:z \
    --name registry-gcr.io registry:2

podman run --replace -d -p 5004:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://ghcr.io \
    --restart always \
    --volume $PWD/mirror/registry-ghcr.io:/var/lib/registry:z \
    --name registry-ghcr.io registry:2
