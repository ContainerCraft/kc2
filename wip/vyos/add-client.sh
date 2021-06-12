config
set interfaces wireguard wg01 peer CLIENT2 address '172.16.100.2'
set interfaces wireguard wg01 peer CLIENT2 allowed-ips '172.16.100.2/32'
set interfaces wireguard wg01 peer CLIENT2 pubkey 'TKzKX1JmOKbOJ1K5ZwrAQGHdnVVdsdfAY0FBcXaktAc='
set interfaces wireguard wg01 peer CLIENT2 persistent-keepalive '15'
commit
