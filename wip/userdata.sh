#!/bin/bash -x
echo "fedora" | passwd fedora --stdin
mkdir /home/fedora/.ssh
touch /home/fedora/.ssh/authorized_keys
chmod 600 /home/fedora/.ssh/authorized_keys
chown fedora:fedora -R /home/fedora/.ssh
curl -L https://github.com/usrbinkat.keys | tee -a /home/fedora/.ssh/authorized_keys
sudo cat /home/fedora/.ssh/authorized_keys > /root/.ssh/authorized_keys
sudo rm -rf /root/{anaconda-ks.cfg,original-ks.cfg}
sudo dnf remove podman container-selinux -y
sudo grubby --update-kernel=ALL --args 'ipv6.disable=1 setenforce=0 cgroup_memory=1 cgroup_enable=cpuset cgroup_enable=memory systemd.unified_cgroup_hierarchy=0 intel_iommu=on iommu=pt rd.driver.pre=vfio-pci pci=realloc'
sudo dnf update -y
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo sed -i 's/$releasever/33/g' /etc/yum.repos.d/docker-ce.repo
sudo sed -i 's/^#PermitRootLogin\ prohibit-password/PermitRootLogin\ prohibit-password/g' /etc/ssh/sshd_config
sudo dnf update -y
sudo dnf -y install neofetch openssh-server qemu-guest-agent @virtualization lnav tmux vi vim git vi vim socat ethtool ebtables docker-ce docker-ce-cli containerd.io openssh-server conntrack-tools htop tmux
sudo git clone https://github.com/containercraft/artemis.git /root/artemis
sudo echo 'unix_sock_group = "libvirt"' > /etc/libvirt/libvirtd.conf
sudo echo 'unix_sock_rw_perms = "0770"' > /etc/libvirt/libvirtd.conf
sudo systemctl disable firewalld
sudo systemctl enable --now qemu-guest-agent
sudo sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
sudo systemctl enable docker
sudo systemctl enable containerd
sudo systemctl enable --now libvirtd
sudo systemctl restart libvirtd
sudo systemctl enable --now sshd
sudo usermod -aG libvirt fedora
sudo dnf -y groupinstall "Container Management"
sudo dnf update -y
sudo hostnamectl set-hostname artemis
sudo reboot
