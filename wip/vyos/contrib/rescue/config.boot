firewall {
    all-ping enable
    broadcast-ping disable
    config-trap disable
    ipv6-receive-redirects disable
    ipv6-src-route disable
    ip-src-route disable
    log-martians enable
    name OUTSIDE-IN {
        default-action drop
        rule 10 {
            action accept
            state {
                established enable
                related enable
            }
        }
    }
    name OUTSIDE-LOCAL {
        default-action drop
        rule 10 {
            action accept
            state {
                established enable
                related enable
            }
        }
        rule 20 {
            action accept
            icmp {
                type-name echo-request
            }
            protocol icmp
        }
    }
    name WAN-IN {
        default-action drop
        rule 10 {
            action accept
            state {
                established enable
                related enable
            }
        }
    }
    name WAN-LOCAL {
        default-action drop
        rule 10 {
            action accept
            state {
                established enable
                related enable
            }
        }
        rule 20 {
            action accept
            icmp {
                type-name echo-request
            }
            protocol icmp
            state {
                new enable
            }
        }
        rule 30 {
            action drop
            destination {
                port 22
            }
            protocol tcp
            recent {
                count 4
                time 60
            }
            state {
                new enable
            }
        }
        rule 31 {
            action accept
            destination {
                port 22
            }
            protocol tcp
            state {
                new enable
            }
        }
    }
    receive-redirects disable
    send-redirects enable
    source-validation disable
    syn-cookies enable
    twa-hazards-protection disable
}
interfaces {
    ethernet eth0 {
        address dhcp
        description WAN
        firewall {
            in {
                name WAN-IN
            }
            local {
                name WAN-LOCAL
            }
        }
    }
    ethernet eth1 {
        address 192.168.1.1/24
        description LAN
    }
    ethernet eth2 {
        address 172.0.0.1/24
        description DMZ
    }
    loopback lo
}
nat {
    source {
        rule 100 {
            outbound-interface eth0
            source {
                address 192.168.1.0/24
            }
            translation {
                address masquerade
            }
        }
    }
}
service {
    dhcp-server {
        shared-network-name LAN {
            subnet 192.168.1.0/24 {
                default-router 192.168.1.1
                dns-server 192.168.1.1
                domain-name fly.lan
                lease 86400
                range 0 {
                    start 192.168.1.100
                    stop 192.168.1.249
                }
            }
        }
    }
    dns {
        forwarding {
            allow-from 192.168.1.0/24
            cache-size 0
            listen-address 192.168.1.1
            name-server 1.1.1.1
            name-server 1.0.0.1
            name-server 8.8.8.8
            name-server 8.8.4.4
        }
    }
    ssh {
        disable-password-authentication {
        }
        port 2022
    }
}
system {
    config-management {
        commit-revisions 100
    }
    host-name vyos
    login {
        user vyos {
            authentication {
                encrypted-password $6$FbiqO9EL1qbKzxoO$/C7f4XZaOrLNBsf7hKhCLbjnVb/Nbp9khhrjKnfoO4KXTFMGojudVaK.sIIz/bbcxMSgE9E6WsSbfxvkIcu5U0
                public-keys usrbinkat@mprcs {
                    key AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U=
                    type ssh-rsa
                }
            }
        }
    }
    name-server 192.168.1.1
    ntp {
        server 0.pool.ntp.org
        server 1.pool.ntp.org
        server 2.pool.ntp.org
    }
    syslog {
        global {
            facility all {
                level notice
            }
            facility protocols {
                level debug
            }
        }
    }
}
// Warning: Do not remove the following line.
// vyos-config-version: "broadcast-relay@1:cluster@1:config-management@1:conntrack@1:conntrack-sync@1:dhcp-relay@2:dhcp-server@5:dhcpv6-server@1:dns-forwarding@3:firewall@5:https@2:interfaces@18:ipoe-server@1:ipsec@5:l2tp@3:lldp@1:mdns@1:nat@5:ntp@1:pppoe-server@5:pptp@2:qos@1:quagga@6:salt@1:snmp@2:ssh@2:sstp@3:system@20:vrrp@2:vyos-accel-ppp@2:wanloadbalance@3:webproxy@2:zone-policy@1"
// Release version: 1.3-rolling-202101
