delete interfaces wireguard wg02 address '10.2.0.2/24'
delete interfaces wireguard wg02 description 'overlay-server-wg01'
delete interfaces wireguard wg02 peer overlay-server-wg01 address '143.198.141.243'
delete interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '143.198.141.243/32'
delete interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.1.0.0/24'
delete interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.2.0.0/24'
delete interfaces wireguard wg02 peer overlay-server-wg01 port '25565'
delete interfaces wireguard wg02 peer overlay-server-wg01 preshared-key 'zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk='
delete interfaces wireguard wg02 peer overlay-server-wg01 pubkey '1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc='
delete interfaces wireguard wg02 port '25565'
delete interfaces wireguard wg02 private-key 'overlay-client-wg02'
