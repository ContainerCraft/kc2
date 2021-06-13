#!/bin/bash -x

REPO="https://github.com/vyos/vyos-build.git"
BOOT_CONFIG=$(pwd)/images/vyos/config.boot.default
BOOT_CONFIG_PATH_OPENSTACK=/vyos/tools/cloud-init/openstack/config.boot.default
BOOT_CONFIG_PATH_LIVE=/vyos/data/live-build-config/includes.chroot/opt/vyatta/etc/config.boot.default 

#   --privileged --entrypoint bash \
sudo rm -rf /tmp/vyos-build
git clone ${REPO} /tmp/vyos-build
docker pull docker.io/vyos/vyos-build:current;

START=">> $(date) >> Started .."
time docker run --rm -t -w /vyos \
    --privileged --entrypoint ./build.sh \
    --sysctl net.ipv6.conf.lo.disable_ipv6=0 \
    -e GOSU_UID=$(id -u) -e GOSU_GID=$(id -g) \
    --volume ${BOOT_CONFIG}:${BOOT_CONFIG_PATH_LIVE} \
    --volume ${BOOT_CONFIG}:${BOOT_CONFIG_PATH_OPENSTACK} \
    --volume $(pwd)/images/vyos/build.sh:/vyos/build.sh \
    --volume $(pwd)/images/vyos:/vyos/artifacts \
    --volume /tmp/vyos-build:/vyos \
  docker.io/vyos/vyos-build:current
FINISH=">> $(date) >> Completed .."

echo "
$START
$FINISH
"

