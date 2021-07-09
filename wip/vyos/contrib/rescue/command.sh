export PUBKEY_OVERLAY_SERVER_WG01="1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc="
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="
export WIREGUARD_VPN_SERVER_IPV4="143.198.141.243"
config
set firewall all-ping 'enable'
set firewall broadcast-ping 'disable'
set firewall config-trap 'disable'
set firewall ipv6-receive-redirects 'disable'
set firewall ipv6-src-route 'disable'
set firewall ip-src-route 'disable'
set firewall log-martians 'enable'
set firewall name OUTSIDE-IN default-action 'drop'
set firewall name OUTSIDE-IN rule 10 action 'accept'
set firewall name OUTSIDE-IN rule 10 state established 'enable'
set firewall name OUTSIDE-IN rule 10 state related 'enable'
set firewall name OUTSIDE-LOCAL default-action 'drop'
set firewall name OUTSIDE-LOCAL rule 10 action 'accept'
set firewall name OUTSIDE-LOCAL rule 10 state established 'enable'
set firewall name OUTSIDE-LOCAL rule 10 state related 'enable'
set firewall name OUTSIDE-LOCAL rule 20 action 'accept'
set firewall name OUTSIDE-LOCAL rule 20 icmp type-name 'echo-request'
set firewall name OUTSIDE-LOCAL rule 20 protocol 'icmp'
set firewall name WAN-IN default-action 'drop'
set firewall name WAN-IN rule 10 action 'accept'
set firewall name WAN-IN rule 10 state established 'enable'
set firewall name WAN-IN rule 10 state related 'enable'
set firewall name WAN-LOCAL default-action 'drop'
set firewall name WAN-LOCAL rule 10 action 'accept'
set firewall name WAN-LOCAL rule 10 state established 'enable'
set firewall name WAN-LOCAL rule 10 state related 'enable'
set firewall name WAN-LOCAL rule 20 action 'accept'
set firewall name WAN-LOCAL rule 20 icmp type-name 'echo-request'
set firewall name WAN-LOCAL rule 20 protocol 'icmp'
set firewall name WAN-LOCAL rule 20 state new 'enable'
set firewall name WAN-LOCAL rule 30 action 'drop'
set firewall name WAN-LOCAL rule 30 destination port '22'
set firewall name WAN-LOCAL rule 30 protocol 'tcp'
set firewall name WAN-LOCAL rule 30 recent count '4'
set firewall name WAN-LOCAL rule 30 recent time '60'
set firewall name WAN-LOCAL rule 30 state new 'enable'
set firewall name WAN-LOCAL rule 31 action 'accept'
set firewall name WAN-LOCAL rule 31 destination port '22'
set firewall name WAN-LOCAL rule 31 protocol 'tcp'
set firewall name WAN-LOCAL rule 31 state new 'enable'
set firewall receive-redirects 'disable'
set firewall send-redirects 'enable'
set firewall source-validation 'disable'
set firewall syn-cookies 'enable'
set firewall twa-hazards-protection 'disable'
set interfaces ethernet eth0 address 'dhcp'
set interfaces ethernet eth0 address 'dhcpv6'
set interfaces ethernet eth0 description 'WAN'
set interfaces ethernet eth0 firewall in name 'WAN-IN'
set interfaces ethernet eth0 firewall local name 'WAN-LOCAL'
set interfaces ethernet eth1 address '192.168.1.1/24'
set interfaces ethernet eth1 description 'LAN'
set interfaces ethernet eth2 address '172.0.0.1/24'
set interfaces ethernet eth2 description 'DMZ'
set interfaces loopback lo
set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 source address '192.168.1.0/24'
set nat source rule 100 translation address 'masquerade'
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 default-router '192.168.1.1'
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 domain-name 'fly.lan'
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 lease '86400'
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 range 0 start '192.168.1.100'
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 range 0 stop '192.168.1.249'
set service dns forwarding allow-from '192.168.1.0/24'
set service dns forwarding cache-size '0'
set service dns forwarding listen-address '192.168.1.1'
set service dns forwarding name-server '1.1.1.1'
set service dns forwarding name-server '1.0.0.1'
set service dns forwarding name-server '8.8.8.8'
set service dns forwarding name-server '8.8.4.4'
set service ssh disable-password-authentication
set service ssh port '2022'
set system config-management commit-revisions '100'
set system host-name 'vyos'
set system login user vyos authentication encrypted-password '$6$FbiqO9EL1qbKzxoO$/C7f4XZaOrLNBsf7hKhCLbjnVb/Nbp9khhrjKnfoO4KXTFMGojudVaK.sIIz/bbcxMSgE9E6WsSbfxvkIcu5U0'
set system login user vyos authentication public-keys usrbinkat@mprcs key 'AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U='
set system login user vyos authentication public-keys usrbinkat@mprcs type 'ssh-rsa'
set system name-server '192.168.1.1'
set system ntp server 0.pool.ntp.org
set system ntp server 1.pool.ntp.org
set system ntp server 2.pool.ntp.org
set system syslog global facility all level 'notice'
set system syslog global facility protocols level 'debug'

set interfaces wireguard wg01 address '172.16.100.2/32'
set interfaces wireguard wg01 peer SERVER allow-ips '0.0.0.0/0'
set interfaces wireguard wg01 peer SERVER endpoint '${WIREGUARD_VPN_SERVER_IPV4}:25565'
set interfaces wireguard wg01 peer SERVER persistent-keepalive 15
set interfaces wireguard wg01 peer SERVER pubkey '${PUBKEY_OVERLAY_SERVER_WG01}'
set interfaces wireguard wg01 peer SERVER preshared-key ${PRESHARED_KEY}
set protocols static interface-route '172.16.100.0/24' next-hop-interface wg01
commit