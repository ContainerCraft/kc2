#!/usr/bin/env bash
cat <<EOF > ./fcos.fcct
variant: fcos
version: 1.4.0
passwd:
  users:
    - name: core
  users:
    - name: core
      password_hash: $(echo core | mkpasswd --method=yescrypt --stdin)
      ssh_authorized_keys:
        - $(cat ~/.ssh/id_rsa.pub)
      groups:
        - sudo
        - wheel
        - docker
storage:
  files:
    - path: /etc/ssh/sshd_config.d/20-enable-passwords.conf
      mode: 0644
      contents:
        inline: |
          PasswordAuthentication yes
EOF
