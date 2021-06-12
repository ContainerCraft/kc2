################################################################################
# Try-Again
################################################################################

################################################################################
# ensign-remote-server
export PUBKEY_OVERLAY_CLIENT_WG02="aNgIHGruLUVathMFgWXqdBTFNwFxNy1pcchf0lVc3Ew="
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="
configure
set interfaces wireguard wg01 address '172.16.100.1/24'
set interfaces wireguard wg01 port '25565'
set interfaces wireguard wg01 peer CLIENT1 allowed-ips '172.16.100.2/32'
set interfaces wireguard wg01 peer CLIENT1 allowed-ips '172.16.100.0/24'
set interfaces wireguard wg01 peer CLIENT1 persistent-keepalive '15'
set interfaces wireguard wg01 peer CLIENT1 preshared-key ${PRESHARED_KEY}
set interfaces wireguard wg01 peer CLIENT1 pubkey "${PUBKEY_OVERLAY_CLIENT_WG02}"
set protocols static route '172.16.100.0/24' next-hop '172.16.100.1'

set interfaces wireguard wg01 peer CLIENT2 address '172.16.100.3'
set interfaces wireguard wg01 peer CLIENT2 allowed-ips '172.16.100.3/32'
set interfaces wireguard wg01 peer CLIENT2 allowed-ips '172.16.100.0/24'
set interfaces wireguard wg01 peer CLIENT2 persistent-keepalive '15'
set interfaces wireguard wg01 peer CLIENT2 preshared-key ${PRESHARED_KEY}
set interfaces wireguard wg01 peer CLIENT2 pubkey "${PUBKEY_OVERLAY_CLIENT_WG02}"

commit


################################################################################
# ensign-local-client
export PUBKEY_OVERLAY_SERVER_WG01="1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc="
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="
export WIREGUARD_VPN_SERVER_IPV4="143.198.141.243"
configure
set interfaces wireguard wg01 address '172.16.100.2/32'
set interfaces wireguard wg01 peer SERVER allowed-ips '0.0.0.0/0'
set interfaces wireguard wg01 peer SERVER address "${WIREGUARD_VPN_SERVER_IPV4}"
set interfaces wireguard wg01 peer SERVER port "25565"
set interfaces wireguard wg01 peer SERVER persistent-keepalive 15
set interfaces wireguard wg01 peer SERVER pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
set interfaces wireguard wg01 peer SERVER preshared-key ${PRESHARED_KEY}
set protocols static interface-route '172.16.100.0/24' next-hop-interface wg01
commit


################################################################################
################################################################################
# FAIL below
################################################################################
################################################################################

run generate wireguard preshared-key
run show wireguard keypairs pubkey default

################################################################################
# ensign-remote-server
################################################################################
config
run generate wireguard preshared-key
run generate wireguard named-keypairs   overlay-server-wg01
run show     wireguard keypairs privkey overlay-server-wg01
run show     wireguard keypairs pubkey  overlay-server-wg01

# Export PSK & PubKey from Client
export PUBKEY_OVERLAY_CLIENT_WG02="aNgIHGruLUVathMFgWXqdBTFNwFxNy1pcchf0lVc3Ew="
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="

set interfaces wireguard wg01 port '25565'
set interfaces wireguard wg01 address '10.2.0.1/24'
set interfaces wireguard wg01 private-key overlay-server-wg01
set interfaces wireguard wg01 description 'overlay-server-wg01'
set interfaces wireguard wg01 peer overlay-client-wg02 port '25565'
set interfaces wireguard wg01 peer overlay-client-wg02 address '10.2.0.2'
set interfaces wireguard wg01 peer overlay-client-wg02 allowed-ips '10.1.0.0/24'
set interfaces wireguard wg01 peer overlay-client-wg02 allowed-ips '10.2.0.0/24'
set interfaces wireguard wg01 peer overlay-client-wg02 pubkey "${PUBKEY_OVERLAY_CLIENT_WG02}"
set interfaces wireguard wg01 peer overlay-client-wg02 preshared-key "${PRESHARED_KEY}"
set protocols static route 10.1.0.0/24 interface wg01
commit

################################################################################
# ensign-local-client
################################################################################

config
run generate wireguard named-keypairs   overlay-client-wg02
run show     wireguard keypairs pubkey  overlay-client-wg02
run show     wireguard keypairs privkey overlay-client-wg02

# Export PSK & PubKey from Server
export PUBKEY_OVERLAY_SERVER_WG01="1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc="
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="
export WIREGUARD_VPN_SERVER_IPV4="143.198.141.243"

set interfaces wireguard wg02 port '25565'
set interfaces wireguard wg02 address '10.2.0.2/24'
set interfaces wireguard wg02 peer overlay-client-wg02 preshared-key "${PRESHARED_KEY}"
set interfaces wireguard wg02 private-key overlay-client-wg02
set interfaces wireguard wg02 description 'overlay-client-wg02'
set interfaces wireguard wg02 peer overlay-server-wg01 port '25565'
set interfaces wireguard wg02 peer overlay-server-wg01 address "${WIREGUARD_VPN_SERVER_IPV4}"
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips "${WIREGUARD_VPN_SERVER_IPV4}/32"
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.1.0.0/24'
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.2.0.0/24'
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
set interfaces wireguard wg02 peer overlay-server-wg01 preshared-key "${PRESHARED_KEY}"
set protocols static route 10.1.0.0/24 interface wg01
set protocols static route 10.2.0.0/24 interface wg01
commit
