# https://docs.vyos.io/en/latest/configexamples/pppoe-ipv6-basic.html

set service dns forwarding cache-size '0'
set service dns forwarding listen-address '192.168.1.1'
set service dns forwarding allow-from '192.168.1.0/24'

set firewall name WAN-IN default-action 'drop'
set firewall ipv6-name WAN_IN default-action 'drop'

set firewall name WAN-IN rule 10 action 'accept'
set firewall ipv6-name WAN_IN rule 10 action 'accept'

set firewall name WAN-IN rule 10 state established 'enable'

set firewall ipv6-name WAN_IN rule 10 state established 'enable'

set firewall name WAN-IN rule 10 state related 'enable'
set firewall ipv6-name WAN_IN rule 10 state related 'enable'

set firewall ipv6-name WAN_IN rule 20 action 'accept'
set firewall ipv6-name WAN_IN rule 20 protocol 'icmpv6'

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

set interfaces ethernet eth0 firewall in name 'WAN-IN'
set interfaces ethernet eth0 firewall local name 'WAN-LOCAL'

set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 source address '192.168.1.0/24'
set nat source rule 100 translation address masquerade

set firewall ipv6-name WAN_LOCAL default-action 'drop'
set firewall ipv6-name WAN_LOCAL rule 10 action 'accept'
set firewall ipv6-name WAN_LOCAL rule 10 state established 'enable'
set firewall ipv6-name WAN_LOCAL rule 10 state related 'enable'
set firewall ipv6-name WAN_LOCAL rule 20 action 'accept'
set firewall ipv6-name WAN_LOCAL rule 20 protocol 'icmpv6'
set firewall ipv6-name WAN_LOCAL rule 30 action 'accept'
set firewall ipv6-name WAN_LOCAL rule 30 destination port '546'
set firewall ipv6-name WAN_LOCAL rule 30 protocol 'udp'
set firewall ipv6-name WAN_LOCAL rule 30 source port '547'
set interfaces pppoe pppoe0 firewall in ipv6-name 'WAN_IN'
set interfaces pppoe pppoe0 firewall local ipv6-name 'WAN_LOCAL'
