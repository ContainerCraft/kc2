#!/bin/bash -x
./configure \
    --custom-apt-entry="deb http://deb.debian.org/debian buster main contrib non-free" \
    --custom-apt-entry="deb http://deb.debian.org/debian buster-updates main contrib non-free" \
    --custom-apt-entry="deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free" \
    --custom-apt-entry="deb http://deb.debian.org/debian buster-backports main contrib non-free" \
    --custom-apt-entry="deb http://repo.saltstack.com/py3/debian/10/amd64/archive/3002.5 buster main" \
    --custom-apt-entry="deb http://repo.powerdns.com/debian buster-rec-43 main" \
    --custom-package="vim cloud-initramfs-growroot cloud-init qemu-guest-agent qemu-utils"
make iso
make openstack
make qemu
