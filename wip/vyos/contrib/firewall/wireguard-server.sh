################################################################################
# Firewall Base Settings
set firewall all-ping 'enable'
set firewall syn-cookies 'enable'
set firewall config-trap 'disable'
set firewall log-martians 'enable'
set firewall ip-src-route 'disable'
set firewall send-redirects 'enable'
set firewall broadcast-ping 'disable'
set firewall ipv6-src-route 'disable'
set firewall receive-redirects 'disable'
set firewall source-validation 'disable'
set firewall twa-hazards-protection 'disable'
set firewall ipv6-receive-redirects 'disable'

################################################################################
# Firewall Configuration
set firewall name PUBLIC-to-WIREGUARD default-action 'drop'
set firewall name PUBLIC-to-WIREGUARD rule 5 action 'accept'
set firewall name PUBLIC-to-WIREGUARD rule 5 state established 'enable'
set firewall name PUBLIC-to-WIREGUARD rule 5 state related 'enable'
set firewall name PUBLIC-to-WIREGUARD rule 5 description "Allow Established / Related Traffic"

# Ping ICMP Accept from Public
set firewall name PUBLIC-to-WIREGUARD rule 20 protocol 'icmp'
set firewall name PUBLIC-to-WIREGUARD rule 20 icmp type-name 'echo-request'
set firewall name PUBLIC-to-WIREGUARD rule 20 state new 'enable'
set firewall name PUBLIC-to-WIREGUARD rule 20 action 'accept'

# SSH Rate Limit from Public
set firewall name PUBLIC-to-WIREGUARD rule 23 protocol 'tcp'
set firewall name PUBLIC-to-WIREGUARD rule 23 destination port '2222'
set firewall name PUBLIC-to-WIREGUARD rule 23 recent time '60'
set firewall name PUBLIC-to-WIREGUARD rule 23 recent count '4'
set firewall name PUBLIC-to-WIREGUARD rule 23 state new 'enable'
set firewall name PUBLIC-to-WIREGUARD rule 23 action 'drop'

# SSH Accept from Public
set firewall name PUBLIC-to-WIREGUARD rule 24 protocol 'tcp'
set firewall name PUBLIC-to-WIREGUARD rule 24 destination port '2222'
set firewall name PUBLIC-to-WIREGUARD rule 24 state new 'enable'
set firewall name PUBLIC-to-WIREGUARD rule 24 action 'accept'

################################################################################
# WIREGUARD Firewall & NAT Rules

# Firewall: WireGuard Accept from Public
set firewall name PUBLIC-to-WIREGUARD rule 21 description 'WireGuard Server Rule: Accept'
set firewall name PUBLIC-to-WIREGUARD rule 21 protocol 'udp'
set firewall name PUBLIC-to-WIREGUARD rule 21 destination port '25565'
set firewall name PUBLIC-to-WIREGUARD rule 21 state new 'enable'
set firewall name PUBLIC-to-WIREGUARD rule 21 action 'accept'

# NAT: Forward Wireguard UDP from Public to wg01
set nat destination rule 22 description "WireGuard Server NAT"
set nat destination rule 22 protocol udp
set nat destination rule 22 inbound-interface eth0
set nat destination rule 22 translation port 25565
set nat destination rule 22 translation address 172.16.100.1

################################################################################
# Interface Settings

# eth0 Static as PUBLIC
set interfaces ethernet eth0 description 'PUBLIC'
set interfaces ethernet eth0 address '143.198.128.243/20'
set protocols static route 0.0.0.0/0 next-hop 143.198.128.1
set interfaces ethernet eth0 firewall in name 'PUBLIC-to-WIREGUARD'
set interfaces ethernet eth0 firewall local name 'PUBLIC-to-WIREGUARD'

# wg01 Static as WIREGUARD
set interfaces wireguard wg01 description 'WIREGUARD'
set interfaces wireguard wg01 address '172.16.100.1/24'
set protocols static route '172.16.100.0/24' next-hop '172.16.100.1'
set firewall options interface wg01 adjust-mss '1372'

# loopback
set interfaces loopback lo
set interfaces loopback lo description 'loopback'
set interfaces loopback lo address '127.0.0.1/8'

################################################################################
# Base NAT Port Forward Rules
set nat source rule 40 outbound-interface 'eth0'
set nat source rule 40 source address '172.16.100.0/24'
set nat source rule 40 translation address masquerade

################################################################################
# Vyos DNS Configuration
set service dns forwarding name-server    '1.1.1.1'
set service dns forwarding name-server    '8.8.8.8'
set service dns forwarding listen-address '0.0.0.0'
set service dns forwarding allow-from     '0.0.0.0/0'
set service dns forwarding cache-size     '1000'
set system name-server                    '127.0.0.1'

################################################################################
# System Settings
################################################################################

# Host SSH Settings
set service ssh port '2222'
set service ssh disable-password-authentication
set system login user vyos authentication public-keys usrbinkat@mprcs type 'ssh-rsa'
set system login user vyos authentication public-keys usrbinkat@mprcs key 'AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U='
set system login user vyos authentication encrypted-password '$6$FbiqO9EL1qbKzxoO$/C7f4XZaOrLNBsf7hKhCLbjnVb/Nbp9khhrjKnfoO4KXTFMGojudVaK.sIIz/bbcxMSgE9E6WsSbfxvkIcu5U0'

# System Settings
set system ntp server 0.pool.ntp.org
set system ntp server 1.pool.ntp.org
set system ntp server 2.pool.ntp.org
set system host-name 'vyos-wireguard-server-n01'
set system config-management commit-revisions '100'
set system syslog global facility all level 'notice'
set system syslog global facility protocols level 'debug'

################################################################################
# Wireguard Client wg01
#set interfaces wireguard wg01 peer SERVER port '25565'
#set interfaces wireguard wg01 peer SERVER address '143.198.141.243'
#set interfaces wireguard wg01 peer SERVER allowed-ips '0.0.0.0/0'
#set interfaces wireguard wg01 peer SERVER preshared-key 'zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk='
#set interfaces wireguard wg01 peer SERVER pubkey '1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc='
#set interfaces wireguard wg01 peer SERVER persistent-keepalive '15'
