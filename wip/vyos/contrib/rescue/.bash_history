#1622563557
configure
#1622563590
set interfaces ethernet eth0 address dhcp
#1622563603
set interfaces ethernet eth0 description 'WAN'
#1622563655
set interfaces ethernet eth1 address '192.168.1.1/24'
#1622563688
set interfaces ethernet eth2 address '10.0.0.1/24'
#1622563698
set interfaces ethernet eth1 description 'LAN'
#1622563708
set interfaces ethernet eth2 description 'DMZ'
#1622563720
set service ssh port '2022'
#1622563725
commit
#1622563728
save
#1622563731
clear
#1622563733
ip a
#1622563748
ip link set eth2 down
#1622563750
sudo !!
#1622563754
sudo ip link set eth2 down
#1622563756
ip a
#1622563763
clear
#1622563766
ping 10.0.0.1
#1622563769
ping google.com
#1622563770
clear
#1622563774
configure
#1622563798
set interfaces ethernet eth2 address '172.0.0.1/24'
#1622563800
commit
#1622563802
save
#1622563804
ip a
#1622563864
configure
#1622563884
delete address '10.0.0.1/24'
#1622563908
delete interfaces ethernet eth2 address '10.0.0.1/24'
#1622563911
commit
#1622563912
save
#1622563914
ip a
#1622563916
clear
#1622563916
ip a
#1622563932
ping 10.0.0.1
#1622563942
clear
#1622563963
clear
#1622563992
cat ~/.ssh/authorized_keys 
#1622564004
cat <<EOF >> ~/.ssh/authorized_keys 
#1622564025
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U= kmorgan@mprcs.braincraft.io
#1622564025
EOF
#1622564037
ls
#1622564039
cat history.log 
#1622564040
clear
#1622564042
clear
#1622564044
configure
#1622564080
set service dhcp-server shared-network-name LAN subnet 192.168.1.1/24 default-router '192.168.1.1'
#1622564087
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 default-router '192.168.1.1'
#1622564118
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.1.1'
#1622564141
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 domain-name 'fly.lan'
#1622564150
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 lease '86400'
#1622564173
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 range 0 start 192.168.1.100
#1622564193
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 range 0 stop '192.168.1.249'
#1622564211
set service dns forwarding listen-on eth1
#1622564227
set service dns forwarding cache-size 1000
#1622564292
set service dns forwarding name-server 1.1.1.1
#1622564296
set service dns forwarding name-server 1.0.0.1
#1622564300
set service dns forwarding name-server 8.8.8.8
#1622564304
set service dns forwarding name-server 8.8.4.4
#1622564324
set system name-server 192.168.1.1
#1622564327
commit
#1622564373
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 default-router '192.168.1.1'
#1622564392
set service dns forwarding listen-address '192.168.1.1'
#1622564405
set service dns forwarding allow-from '192.168.1.0/16'
#1622564411
set service dns forwarding allow-from '192.168.1.0/24'
#1622564431
set nat source rule 100 outbound-interface 'eth0'
#1622564440
set nat source rule 100 source address '192.168.1.0/24'
#1622564446
set nat source rule 100 translation address masquerade
#1622564449
commit
#1622564472
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564482
delete service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.1.1'
#1622564485
commit
#1622564501
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 lease '86400'
#1622564508
delete service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 lease '86400'
#1622564509
commit
#1622564593
cat /config/config.boot
#1622564599
cat /config/config.boot | grep 192.168
#1622564623
show 
#1622564667
history | grep 192.168.0
#1622564688
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564699
delete service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.1.1'
#1622564705
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564713
delete service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564719
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564721
commit
#1622564725
clear
#1622564726
commit
#1622564728
show
#1622564734
edit
#1622564745
edit service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564751
edit service dhcp-server shared-network-name LAN
#1622564757
edit service dhcp-server shared-network-name
#1622564764
show service dhcp-server shared-network-name LAN
#1622564767
clear
#1622564781
discard
#1622564784
show
#1622564786
lcear
#1622564788
ip a
#1622564791
commit
#1622564794
exit
#1622564797
configure
#1622564807
show
#1622564810
clear
#1622564810
show
#1622564827
ping google.com
#1622564831
clear; show
#1622564868
set interfaces ethernet eth1 address dhcp
#1622564880
discard
#1622564881
clear
#1622564886
show
#1622564889
clear
#1622564909
cat <<EOF >dhcp.sh
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 default-router '192.168.0.1'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.0.1'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 domain-name 'vyos.net'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 lease '86400'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 range 0 start 192.168.0.9
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 range 0 stop '192.168.0.254'
#1622565583
set service dns forwarding cache-size '0'
#1622565583
set service dns forwarding listen-address '192.168.0.1'
#1622565583
set service dns forwarding allow-from '192.168.0.0/24'
#1622565583
EOF
#1622564914
vi dhcp.sh 
#1622565043
vi dhcp.sh 
#1622565049
source dhcp.sh 
#1622565057
commit
#1622565060
save
#1622565063
clear
#1622565064
ip a
#1622565070
ls
#1622565076
vim nat.sh
#1622565078
vi nat.sh
#1622565100
configure
#1622565103
source nat.sh
#1622565111
commit
#1622565112
save
#1622565113
clear
#1622565135
vi fw.sh
#1622565137
set firewall name OUTSIDE-IN default-action 'drop'
#1622565137
set firewall name OUTSIDE-IN rule 10 action 'accept'
#1622565137
set firewall name OUTSIDE-IN rule 10 state established 'enable'
#1622565137
set firewall name OUTSIDE-IN rule 10 state related 'enable'
#1622565137
set firewall name OUTSIDE-LOCAL default-action 'drop'
#1622565137
set firewall name OUTSIDE-LOCAL rule 10 action 'accept'
#1622565137
set firewall name OUTSIDE-LOCAL rule 10 state established 'enable'
#1622565137
set firewall name OUTSIDE-LOCAL rule 10 state related 'enable'
#1622565137
set firewall name OUTSIDE-LOCAL rule 20 action 'accept'
#1622565137
set firewall name OUTSIDE-LOCAL rule 20 icmp type-name 'echo-request'
#1622565137
set firewall name OUTSIDE-LOCAL rule 20 protocol 'icmp'
#1622565140
clear
#1622565142
vi fw.sh
#1622565162
source fw.sh
#1622565174
vi fw.sh
#1622565193
vi fw.sh
#1622565235
configure
#1622565238
source fw.sh
#1622565242
commit
#1622565327
save
#1622565346
clear
#1622565372
clear
#1622565421
grep red -i /config/config.boot
#1622565423
clear
#1622565424
grep red -i /config/config.boot
#1622565427
clear
#1622565431
show
#1622565437
 clear
#1622565505
commit
#1622565508
exit
#1622565512
exit
#1622565513
exit
#1622565515
exit
#1622565516
quit
#1622565517
exit
#1622565520
commit
#1622565524
save
#1622565529
exit
#1622565531
exit
#1622565531
exit
#1622565532
exit
#1622565532
exit
#1622565533
exit
#1622565536
reboot
#1622563554
clear
#1622563557
configure
#1622563554
clear
#1622563557
configure
#1622565539
sudo reboot
#1622564044
configure
#1622565589
configure
#1622563554
clear
#1622563557
configure
#1622563590
set interfaces ethernet eth0 address dhcp
#1622563603
set interfaces ethernet eth0 description 'WAN'
#1622563655
set interfaces ethernet eth1 address '192.168.1.1/24'
#1622563688
set interfaces ethernet eth2 address '10.0.0.1/24'
#1622563698
set interfaces ethernet eth1 description 'LAN'
#1622563708
set interfaces ethernet eth2 description 'DMZ'
#1622563720
set service ssh port '2022'
#1622563725
commit
#1622563728
save
#1622563731
clear
#1622563733
ip a
#1622563748
ip link set eth2 down
#1622563750
sudo !!
#1622563754
sudo ip link set eth2 down
#1622563756
ip a
#1622563763
clear
#1622563766
ping 10.0.0.1
#1622563769
ping google.com
#1622563770
clear
#1622563774
configure
#1622563798
set interfaces ethernet eth2 address '172.0.0.1/24'
#1622563800
commit
#1622563802
save
#1622563804
ip a
#1622563864
configure
#1622563884
delete address '10.0.0.1/24'
#1622563908
delete interfaces ethernet eth2 address '10.0.0.1/24'
#1622563911
commit
#1622563912
save
#1622563914
ip a
#1622563916
clear
#1622563916
ip a
#1622563932
ping 10.0.0.1
#1622563942
clear
#1622563963
clear
#1622563992
cat ~/.ssh/authorized_keys 
#1622564004
cat <<EOF >> ~/.ssh/authorized_keys 
#1622564025
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U= kmorgan@mprcs.braincraft.io
#1622564025
EOF
#1622564037
ls
#1622564039
cat history.log 
#1622564040
clear
#1622564042
clear
#1622564044
configure
#1622564080
set service dhcp-server shared-network-name LAN subnet 192.168.1.1/24 default-router '192.168.1.1'
#1622564087
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 default-router '192.168.1.1'
#1622564118
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.1.1'
#1622564141
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 domain-name 'fly.lan'
#1622564150
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 lease '86400'
#1622564173
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 range 0 start 192.168.1.100
#1622564193
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 range 0 stop '192.168.1.249'
#1622564211
set service dns forwarding listen-on eth1
#1622564227
set service dns forwarding cache-size 1000
#1622564292
set service dns forwarding name-server 1.1.1.1
#1622564296
set service dns forwarding name-server 1.0.0.1
#1622564300
set service dns forwarding name-server 8.8.8.8
#1622564304
set service dns forwarding name-server 8.8.4.4
#1622564324
set system name-server 192.168.1.1
#1622564327
commit
#1622564373
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 default-router '192.168.1.1'
#1622564392
set service dns forwarding listen-address '192.168.1.1'
#1622564405
set service dns forwarding allow-from '192.168.1.0/16'
#1622564411
set service dns forwarding allow-from '192.168.1.0/24'
#1622564431
set nat source rule 100 outbound-interface 'eth0'
#1622564440
set nat source rule 100 source address '192.168.1.0/24'
#1622564446
set nat source rule 100 translation address masquerade
#1622564449
commit
#1622564472
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564482
delete service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.1.1'
#1622564485
commit
#1622564501
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 lease '86400'
#1622564508
delete service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 lease '86400'
#1622564509
commit
#1622564593
cat /config/config.boot
#1622564599
cat /config/config.boot | grep 192.168
#1622564623
show 
#1622564667
history | grep 192.168.0
#1622564688
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564699
delete service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.1.1'
#1622564705
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564713
delete service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564719
set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564721
commit
#1622564725
clear
#1622564726
commit
#1622564728
show
#1622564734
edit
#1622564745
edit service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server '192.168.1.1'
#1622564751
edit service dhcp-server shared-network-name LAN
#1622564757
edit service dhcp-server shared-network-name
#1622564764
show service dhcp-server shared-network-name LAN
#1622564767
clear
#1622564781
discard
#1622564784
show
#1622564786
lcear
#1622564788
ip a
#1622564791
commit
#1622564794
exit
#1622564797
configure
#1622564807
show
#1622564810
clear
#1622564810
show
#1622564827
ping google.com
#1622564831
clear; show
#1622564868
set interfaces ethernet eth1 address dhcp
#1622564880
discard
#1622564881
clear
#1622564886
show
#1622564889
clear
#1622564909
cat <<EOF >dhcp.sh
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 default-router '192.168.0.1'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 dns-server '192.168.0.1'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 domain-name 'vyos.net'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 lease '86400'
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 range 0 start 192.168.0.9
#1622565583
set service dhcp-server shared-network-name LAN subnet 192.168.0.0/24 range 0 stop '192.168.0.254'
#1622565583
set service dns forwarding cache-size '0'
#1622565583
set service dns forwarding listen-address '192.168.0.1'
#1622565583
set service dns forwarding allow-from '192.168.0.0/24'
#1622565583
EOF
#1622564914
vi dhcp.sh 
#1622565043
vi dhcp.sh 
#1622565049
source dhcp.sh 
#1622565057
commit
#1622565060
save
#1622565063
clear
#1622565064
ip a
#1622565070
ls
#1622565076
vim nat.sh
#1622565078
vi nat.sh
#1622565100
configure
#1622565103
source nat.sh
#1622565111
commit
#1622565112
save
#1622565113
clear
#1622565135
vi fw.sh
#1622565137
set firewall name OUTSIDE-IN default-action 'drop'
#1622565137
set firewall name OUTSIDE-IN rule 10 action 'accept'
#1622565137
set firewall name OUTSIDE-IN rule 10 state established 'enable'
#1622565137
set firewall name OUTSIDE-IN rule 10 state related 'enable'
#1622565137
set firewall name OUTSIDE-LOCAL default-action 'drop'
#1622565137
set firewall name OUTSIDE-LOCAL rule 10 action 'accept'
#1622565137
set firewall name OUTSIDE-LOCAL rule 10 state established 'enable'
#1622565137
set firewall name OUTSIDE-LOCAL rule 10 state related 'enable'
#1622565137
set firewall name OUTSIDE-LOCAL rule 20 action 'accept'
#1622565137
set firewall name OUTSIDE-LOCAL rule 20 icmp type-name 'echo-request'
#1622565137
set firewall name OUTSIDE-LOCAL rule 20 protocol 'icmp'
#1622565140
clear
#1622565142
vi fw.sh
#1622565162
source fw.sh
#1622565174
vi fw.sh
#1622565193
vi fw.sh
#1622565235
configure
#1622565238
source fw.sh
#1622565242
commit
#1622565327
save
#1622565346
clear
#1622565372
clear
#1622565421
grep red -i /config/config.boot
#1622565423
clear
#1622565424
grep red -i /config/config.boot
#1622565427
clear
#1622565431
show
#1622565437
 clear
#1622565505
commit
#1622565508
exit
#1622565512
exit
#1622565513
exit
#1622565515
exit
#1622565516
quit
#1622565517
exit
#1622565520
commit
#1622565524
save
#1622565529
exit
#1622565531
exit
#1622565531
exit
#1622565532
exit
#1622565532
exit
#1622565533
exit
#1622565536
reboot
#1622563554
clear
#1622563557
configure
#1622563554
clear
#1622563557
configure
#1622565539
sudo reboot
#1622564044
configure
#1622565589
configure
#1622565611
clear
#1622565612
show
#1622565616
exit
#1622565619
configure
#1622565641
commit
#1622565643
save
#1622565665
cat ~/.ssh/authorized_keys 
#1622565700
cat <<EOF >> ~/.ssh/authorized_keys 
#1622565706
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U= kmorgan@mprcs.braincraft.io
#1622565706
EOF
#1622565707
clear
#1622565718
clear
#1622565720
configure
#1622565721
clear
#1622565726
ip a
#1622565762
ping google.com
#1622565764
clear
#1622565767
ip a
#1622565802
ip a
#1622565803
clear
#1622565804
ip a
#1622565972
exit
#1622565972
exit
#1622565974
exit
#1622565988
exit
#1622566015
exit
#1622566185
clear
#1622565720
configure
#1622566204
sudo reboot
#1622566261
clear
#1622566271
cat <<EOF >> ~/.ssh/authorized_keys 
#1622566323
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U= kmorgan@mprcs.braincraft.io
#1622566323
EOF
#1622566302
cat <<EOF > /tmp/key
#1622566323
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U= kmorgan@mprcs.braincraft.io
#1622566323
EOF
#1622566324
clear
#1622566328
configure
#1622566329
clear
#1622566364
set system login user vyos authentication public-keys usrbinkat@mprcs type ssh-rsa
#1622566373
set system login user vyos authentication public-keys usrbinkat@mprcs key /tmp/key
#1622566375
show
#1622566396
set system login user vyos authentication public-keys usrbinkat@mprcs key $(pwd)/.ssh/authorized_keys
#1622566403
show
#1622566425
delete user myvyosuser
#1622566437
delete system login user myvyosuser
#1622566440
show
#1622566477
delete system login user myvyosuser
#1622566480
commit
#1622566484
show
#1622566495
pwd
#1622566509
set system login user vyos authentication public-keys usrbinkat@mprcs key /home/vyos/.ssh/authorized_keys
#1622566513
commit
#1622566516
show
#1622566552
cat <<EOF > ~/.ssh/id_rsa.pub
#1622566686
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U=
#1622566686
EOF
#1622566582
set system login user vyos authentication public-keys usrbinkat@mprcs key /home/vyos/.ssh/id_rsa.pub
#1622566587
cat ~/.ssh/id_rsa.pub 
#1622566591
commit
#1622566594
save
#1622566598
reboot
#1622566606
save
#1622566608
exit
#1622566608
exit
#1622566611
reboot
#1622566691
cat ~/.ssh/authorized_keys 
#1622566729
configure
#1622566763
login user vyos authentication public-keys usrbinkat@mprcs key AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U=
#1622566777
clear
#1622566800
clear
#1622566825
set system login user vyos authentication public-keys usrbinkat@mprcs key ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U=
#1622566838
show
#1622566873
set system login user vyos authentication public-keys usrbinkat@mprcs key AAAAB3NzaC1yc2EAAAADAQABAAAB/zPcAdyHRElufWDNQ1mZUWp4V9jDmaWX35ApsXgxfMHBuz3n8VLGVJuXodAAxeRbbE7Rws8BQcCH4DAMKKLHYZRdJtk3ZUw7rm0i/aq0wkeld7Yp6H/fv1ud3mudp7/+3fQ3gV8RmAO8+FS4jNBMciqtY6mWThKciwnkBWmH5atl6GsZ1ZQ+Y8+W4hXnaF6UEU1+xZ8ja+hu81a9fhejcV+m3RwT511kW5IXDe6wkq9tsIEC529VGI7XuySYvusbchivWYxmE+TBMmId3voGCfkl8hIemUG3/LvQWeK95B/6vBKDCFlmABn60zxrjPkdknWPbu4zg+VJWnslX+rDqSe2cBpHqQ8yDxegPcmXNKv2Qp0h8HhEljWoLc4U5x4hlceDraWBehj8i4N6p+Yt678+jUpOCwGC8z9l+zUrG6NPvbHZ2aIBC3eUteYPtmScNLvOiFASPo/9GQQDNqZclQZf5QGDToAV2rV1B4jJPV8fv/1rlgen6O1PNitKo9FlUfr0WA1IXev6CiJUt4x210BzhTlD84S2A0gHJRbeVVkjWKMx/vo/wqEKTg/vvzSOhFDDlKUxSsguL5rrtOxdGj4sUtjeVRuDjwk1u1DH8P75rI0R/1QaeDixJbRi8Q1315z+MrvJuvzJpMTieldqffNUnexMZcFox8yI8KlVt2U=
#1622566875
commit
#1622566877
save
#1622566879
exit
#1622566879
exit
#1622566881
reboot
#1622566929
clear
#1622566930
show
#1622566934
show config
#1622566941
show config > config.boot
#1622566947
vi config.boot 
#1622567002
clear
#1622567004
exit
#1622568408
clear
#1622568413
show interfaces
#1622568421
quit
#1622568424
exit
#1622568442
history >> history.log 
#1622568448
wc -l history.log 
#1622568450
clear
#1622568451
ls
#1622568463
cat /config/config.boot > config.boot 
#1622568464
ls
#1622568479
cat dhcp.sh fw.sh nat.sh >> history.log 
#1622568480
ls
#1622568483
wc -l history.log 
#1622568486
ls
#1622568495
rm dhcp.sh fw.sh nat.sh 
#1622568496
ls
#1622568498
exit
#1622570182
exit
#1622570186
exit
#1622570375
show interfaces
#1622570440
grep dhcp *
#1622570449
grep dhcp * | grep eth0
#1622570457
config
#1622570461
set interfaces ethernet eth0 address dhcpv6
#1622570466
commit
#1622570470
save
#1622570474
show interfaces
#1622570482
exit
#1622570482
exit
#1622570485
show interfaces
#1622570593
ping 2600:1700:8d53:2910::12
#1622570601
ssh root@2600:1700:8d53:2910::12
#1622570617
cat ~/.ssh/id_rsa
#1622570627
ssh root@2600:1700:8d53:2910::12
#1622570726
clear
#1622570736
ls
#1622570742
cat history.log fw.sh
#1622570749
cat history.log > fw.sh
#1622570752
vi fw.sh 
#1622570893
clear
#1622570920
vi fw.sh 
#1622570926
clear
#1622570927
exit
#1622570952
ssh root@2600:1700:8d53:2910::12
#1622571012
clear
#1622571015
exit
#1622571509
show config commands
#1622571512
show config commands
#1622571521
clear
#1622571522
clear
#1622571532
show config commands > show.config.cmds
#1622571534
exit
#1622573332
apt update
#1622573335
sudo apt update
#1622573337
clear
#1622573343
sudo apt-cache search haproxy
#1622574790
clear
#1622574793
apt install haproxy
#1622574796
sudo apt install haproxy
#1622574804
apt install docker.io
#1622574811
sudo apt install docker.io
#1622575213
cat /etc/os-release 
#1622575262
sudo vi /etc/apt/sources.list
#1622575275
sudo apt update
#1622575295
sudo apt install haproxy
#1622575333
sysctl enable --now haproxy
#1622575339
systemctl enable --now haproxy
#1622575348
sudo systemctl enable --now haproxy
#1622575366
sudo vi /etc/sysctl.conf 
#1622575434
apt-cache search docker
#1622575437
apt-cache search docker.io
#1622575439
clear
#1622575441
apt-cache search docker.io
#1622575498
clear
#1622575509
sudo rm -rf /etc/apt/sources.list
#1622575513
sudo apt upgrade
#1622575521
ls /etc/apt/sources.list.d/
#1622576330
sudo rm -rf /etc/apt/sources.list
#1622576339
sudo cat <<EOF > /etc/apt/sources.list
#1623333909
deb http://deb.debian.org/debian buster main
#1623333909
deb-src http://deb.debian.org/debian buster main
#1623333909
deb http://deb.debian.org/debian-security/ buster/updates main
#1623333909
deb-src http://deb.debian.org/debian-security/ buster/updates main
#1623333909
deb http://deb.debian.org/debian buster-updates main
#1623333909
deb-src http://deb.debian.org/debian buster-updates main
#1623333909
EOF
#1622576351
sudo -i
#1622576427
exit
#1622576956
show version
#1622576965
clear
#1622576968
show version
#1622578013
sudo -i
#1622578111
exit
#1622578160
dpkg -l
#1622578166
dpkg -l | grep cloud
#1622578168
clear
#1622578171
dpkg -l | grep vy
#1622578206
clear
#1622578208
exit
#1622578673
du -hs /
#1622578676
clear
#1622578678
exit
#1622579337
exit
#1622579460
exit
#1622587967
curl -ksL "https://kong4fargate-dev-lb-07ccd93b347256e4.elb.us-east-2.amazonaws.com:8445/"
#1622587972
curl -ksL "https://kong4fargate-dev-lb-07ccd93b347256e4.elb.us-east-2.amazonaws.com:8445/" -v
#1622587976
clear
#1622587979
curl -ksL "https://kong4fargate-dev-lb-07ccd93b347256e4.elb.us-east-2.amazonaws.com:8444/" -v
#1622587980
clear
#1622587982
exit
#1622590705
apt-cache search snapd
#1622590745
sudo systemctl status vyos-http-api
#1622590746
clear
#1622590748
exit
#1622599414
dpkg -qa
#1622599416
clear
#1622599453
sudo apt install hub
#1622599500
history | grep apt
#1622599520
sudo apt install vim
#1622599537
sudo apt install screenfetch
#1622599547
screenfetch
#1622599581
du -sh / 2>/dev/null
#1622599591
clear
#1622599592
clear
#1622599805
exit
#1622645100
ssh root@2600:1700:8d53:2910::12
#1622645116
clear
#1622645117
exit
#1622664684
ssh root@2600:1700:8d53:2910::12
#1622733607
exit
#1622667723
ssh root@2600:1700:8d53:2910::12
#1622734070
clear
#1622734073
exit
#1623167182
ssh root@2600:1700:8d53:2910::12
#1623167218
clear
#1623167220
exit
#1623167223
ls
#1623167236
show config
#1623167247
show config > vyos-config.json
#1623167248
clear
#1623167253
show config --cmds
#1623167257
show config -h
#1623167258
clear
#1623167262
show configuration -h
#1623167265
show configuration --help
#1623167269
show configuration --cmds
#1623167270
show configuration --cmd
#1623167287
show configuration commands
#1623167313
show configuration commands > vyos-show-config-commands.sh
#1623167316
cat vyos-show-config-commands.sh 
#1623167324
clear
#1623167327
cat vyos-show-config-commands.sh 
#1623167329
clear
#1623167330
clear
#1623167336
show configuration commands 
#1623167345
exit
#1623201523
history | grep apt
#1623201529
history | grep apt | grep install
#1623201847
exit
#1623253134
clear; history | grep install | grep apt
#1623253850
exit
#1623255414
exit
#1623270490
cat /etc/apt/sources.list.d/
#1623270491
cat /etc/apt/sources.list
#1623270493
exit
#1623278517
podman ps
#1623278520
exit
#1623278523
docker ps
#1623278526
sudo podman
#1623278528
sudo docker ps
#1623278529
exit
#1623289723
sudo -i
#1623295139
clear
#1623295140
exit
#1623333910
clear
#1623333923
config
#1623334426
set interfaces wireguard wg02 address '172.0.1.2/24'
#1623334450
set interfaces wireguard wg02 description 'wg01-ensign-overlay-wg02-client'
#1623334499
set interfaces wg02 peer to-wg01 allowed-ips '0.0.0.0/0'
#1623334512
set interfaces wg02 peer to-wg01 allowed-ips '172.0.1.1/24''
#1623334515
set interfaces wg02 peer to-wg01 allowed-ips '172.0.1.1/24'
#1623334586
set interfaces wg02 peer overlay-master allowed-ips '172.0.1.0/24'
#1623334597
set interfaces wireguard wg01 peer overlay allowed-ips '172.0.1.0/24'
#1623334628
set interfaces wireguard wg02 peer overlay-master address '172.0.1.1/24'
#1623334633
set interfaces wireguard wg02 peer overlay allowed-ips '172.0.1.0/24'
#1623334641
delete interfaces wireguard wg01 peer overlay allowed-ips '172.0.1.0/24'
#1623334683
generate wireguard named-keypairs wg02-client-wg01-master
#1623334701
show wireguard keypairs pubkey wg02-client-wg01-master
#1623335378
discard
#1623335384
discard
#1623335387
config
#1623335389
discard
#1623335394
exit
#1623335395
clear
#1623335399
config
#1623335400
clear
#1623335654
clear
#1623335659
clear
#1623335662
discard
#1623335679
clear
#1623335681
config
#1623335682
clear
#1623335828
clear
#1623335844
generate wireguard named-keypairs overlay-wg02
#1623335859
show wireguard keypairs privkey overlay-wg02
#1623335863
show wireguard keypairs pubkey overlay-wg02
#1623336837
show wireguard keypairs
#1623336843
show wireguard keypairs pubkey overlay-wg02
#1623336849
config
#1623336855
set interfaces wireguard wg02 private-key overlay-wg02
#1623336858
commit
#1623339272
clear
#1623339274
clear
#1623339275
discard
#1623339278
discard
#1623339286
exit
#1623339286
exit
#1623339287
clear
#1623339290
exit
#1623339297
clear
#1623339299
ip a
#1623339314
exit
#1623339439
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="
#1623339443
echo $PRESHARED_KEY 
#1623339593
export PUBKEY_OVERLAY_CLIENT_WG01="SmXTkQ2CqrSJqgSEN6OYf6lGxwBzJztMdvQ6LNmrYXk="
#1623339610
generate wireguard named-keypairs   overlay-client-wg02
#1623339618
show     wireguard keypairs pubkey  overlay-client-wg02
#1623339676
generate wireguard named-keypairs   overlay-client-wg02
#1623339697
show     wireguard keypairs pubkey  overlay-client-wg02
#1623339711
show     wireguard keypairs privkey overlay-client-wg02
#1623339734
config
#1623339750
set interfaces wireguard wg01 port '25565'
#1623339758
delete interfaces wireguard wg01 port '25565'
#1623339908
set interfaces wireguard wg02 port '25565'
#1623339915
set interfaces wireguard wg02 address '10.2.0.1/24'
#1623339922
set interfaces wireguard wg02 private-key overlay-client-wg02
#1623339928
set interfaces wireguard wg02 description 'overlay-client-wg02'
#1623339936
set interfaces wireguard wg02 peer overlay-server-wg01 port '25565'
#1623339944
set interfaces wireguard wg02 peer overlay-server-wg01 address '10.2.0.1'
#1623339952
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.2.0.0/24'
#1623339960
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623339972
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="
#1623339973
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623339991
export PUBKEY_OVERLAY_CLIENT_WG01="SmXTkQ2CqrSJqgSEN6OYf6lGxwBzJztMdvQ6LNmrYXk="
#1623339993
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623340490
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623340498
echo $PUBKEY_OVERLAY_CLIENT_WG01 
#1623340827
export PUBKEY_OVERLAY_CLIENT_WG01="1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc="
#1623340831
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623340854
echo $PUBKEY_OVERLAY_SERVER_WG01
#1623340873
echo "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623340889
export PUBKEY_OVERLAY_SERVER_WG01="1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc="
#1623340891
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623340927
set interfaces wireguard wg02 peer overlay-client-wg02 preshared-key "${PRESHARED_KEY}"
#1623340944
delete interfaces wireguard wg02 peer overlay-server-wg01 address '10.2.0.1'
#1623340965
set interfaces wireguard wg02 peer overlay-server-wg01 address '143.198.141.243'
#1623340971
commit
#1623340992
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '143.198.141.243'
#1623340999
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '143.198.141.243/32'
#1623341002
commit
#1623341159
set interfaces wireguard wg02 private-key overlay-client-wg02
#1623341171
delete interfaces wireguard wg02 private-key overlay-client-wg02
#1623341174
set interfaces wireguard wg02 private-key overlay-client-wg02
#1623341177
commit
#1623341250
run generate wireguard default-keypair
#1623341253
commit
#1623341394
set interfaces wireguard wg02 peer overlay-server-wg01 address '143.198.141.243'
#1623342035
clear
#1623342036
commit
#1623342506
commit
#1623342577
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.1.0.0/24'
#1623342586
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.2.0.0/24'
#1623342591
commit
#1623342609
set interfaces wireguard wg02 peer overlay-client-wg02 allowed-ips '10.2.0.0/24'
#1623342615
set interfaces wireguard wg02 peer overlay-client-wg02 allowed-ips '10.1.0.0/24'
#1623342617
commit
#1623342652
set interfaces wireguard wg02 peer overlay-server-wg01 port '25565'
#1623342660
set interfaces wireguard wg02 peer overlay-server-wg01 address '10.2.0.1'
#1623342668
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '143.198.141.243/32'
#1623342677
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.1.0.0/24'
#1623342688
set interfaces wireguard wg02 peer overlay-server-wg01 address '143.198.141.243/32'
#1623342705
delete
#1623342710
delete interfaces wireguard wg02 peer overlay-server-wg01 address '10.2.0.1'
#1623342712
set interfaces wireguard wg02 peer overlay-server-wg01 address '143.198.141.243/32'
#1623342716
set interfaces wireguard wg02 peer overlay-server-wg01 address '143.198.141.243'
#1623342725
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623342733
set interfaces wireguard wg02 peer overlay-client-wg02 preshared-key "${PRESHARED_KEY}"
#1623342737
commit
#1623342756
delete interfaces wireguard wg01
#1623342757
commit
#1623342793
delete interfaces wireguard wg01 peer overlay_client_wg02
#1623342809
discard
#1623342813
exit
#1623342814
clear
#1623342816
config
#1623342824
export PUBKEY_OVERLAY_SERVER_WG01="1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc="
#1623342833
set interfaces wireguard wg02 port '25565'
#1623342844
set interfaces wireguard wg02 address '10.2.0.1/24'
#1623342849
commit
#1623342857
set interfaces wireguard wg02 private-key overlay-client-wg02
#1623342879
set interfaces wireguard wg02 description 'overlay-server-wg01'
#1623342887
set interfaces wireguard wg02 peer overlay-server-wg01 port '25565'
#1623343027
set interfaces wireguard wg02 peer overlay-server-wg01 address '143.198.141.243'
#1623343180
export WIREGUARD_VPN_SERVER_IPV4="143.198.141.243"
#1623343188
set interfaces wireguard wg02 peer overlay-server-wg01 address "${WIREGUARD_VPN_SERVER_IPV4}"
#1623343196
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips "${WIREGUARD_VPN_SERVER_IPV4}"
#1623343203
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips "${WIREGUARD_VPN_SERVER_IPV4}/32"
#1623343223
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.1.0.0/24'
#1623343231
set interfaces wireguard wg02 peer overlay-server-wg01 allowed-ips '10.2.0.0/24'
#1623343243
set interfaces wireguard wg02 peer overlay-server-wg01 pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623343252
set interfaces wireguard wg02 peer overlay-client-wg02 preshared-key "${PRESHARED_KEY}"
#1623343256
commit
#1623343280
delete interfaces wireguard wg02 peer overlay-client-wg02 preshared-key "${PRESHARED_KEY}"
#1623343299
delete interfaces wireguard wg02 peer overlay-server-wg01 preshared-key "${PRESHARED_KEY}"
#1623343314
set interfaces wireguard wg02 peer overlay-server-wg01 preshared-key "${PRESHARED_KEY}"
#1623343322
commit
#1623343348
show
#1623343393
delete interfaces wireguard wg02 peer overlay-client-wg02
#1623343396
commit
#1623343415
ip a s wg02
#1623343443
set interfaces wireguard wg02 address '10.2.0.2/24'
#1623343450
delete interfaces wireguard wg02 address '10.2.0.1/24'
#1623343452
commit
#1623343473
ping 10.2.0.1
#1623343593
ip r
#1623343609
ping 10.0.0.2
#1623343611
ping 10.1.0.2
#1623343613
ping 10.1.0.1
#1623343617
ip a s wg02
#1623343621
ping 10.2.0.2
#1623343623
ip a
#1623343624
ping 10.2.0.1
#1623344027
discard
#1623344070
ip a
#1623346686
exit
#1623346692
show configuration comands
#1623346695
show configuration commands
#1623346702
show configuration commands > command.sh
#1623346705
vim command.sh 
#1623346725
ip a
#1623346734
vim command.sh 
#1623346743
ip r
#1623346747
vim command.sh 
#1623347042
source command.sh
#1623347045
config
#1623347046
source command.sh
#1623347056
source wg02-del.sh 
#1623347061
commit
#1623347067
vim wg02-del.sh 
#1623347072
config
#1623347076
source wg02-del.sh 
#1623347106
reboot
#1623347109
exit
#1623347113
discard
#1623347115
exit
#1623347115
exit
#1623347119
sudo reboot
#1623335399
config
#1623333923
config
#1623347191
ip a
#1623347200
sudo apt remove docker.io
#1623347302
sudo reboot
#1623347350
ls
#1623347358
vim command.sh 
#1623347423
show config commands
#1623347435
show config commands >> command.sh
#1623347437
vim command.sh 
#1623347570
source command.sh 
#1623347572
source command.sh 
#1623347612
set interfaces wireguard wg01 address '172.16.100.2/32'
#1623347620
set interfaces wireguard wg01 peer SERVER allow-ips '0.0.0.0/0'
#1623347638
set interfaces wireguard wg01 peer SERVER allowed-ips '0.0.0.0/0'
#1623347654
cat command.sh 
#1623347680
set interfaces wireguard wg01 peer SERVER endpoint "${WIREGUARD_VPN_SERVER_IPV4}:25565"
#1623347691
set interfaces wireguard wg01 peer SERVER endpoint "${WIREGUARD_VPN_SERVER_IPV4}:25565"
#1623347714
set interfaces wireguard wg01 peer SERVER address "${WIREGUARD_VPN_SERVER_IPV4}"
#1623347727
set interfaces wireguard wg01 peer SERVER port "25565"
#1623347757
set interfaces wireguard wg01 peer SERVER persistent-keepalive 15
#1623347765
set interfaces wireguard wg01 peer SERVER pubkey '${PUBKEY_OVERLAY_SERVER_WG01}'
#1623347775
export PUBKEY_OVERLAY_SERVER_WG01="1db8v8hVPV06EtoL+Lvbemyrmr2KOvVA2bmAi10aZFc="
#1623347781
export PRESHARED_KEY="zDLXlURhedidvH9JzlpHXQkyY5im5g2LG82ijV3P1Nk="
#1623347786
export WIREGUARD_VPN_SERVER_IPV4="143.198.141.243"
#1623347788
set interfaces wireguard wg01 peer SERVER pubkey '${PUBKEY_OVERLAY_SERVER_WG01}'
#1623347798
set interfaces wireguard wg01 peer SERVER pubkey "${PUBKEY_OVERLAY_SERVER_WG01}"
#1623347814
set interfaces wireguard wg01 peer SERVER preshared-key ${PRESHARED_KEY}
#1623347822
set protocols static interface-route '172.16.100.0/24' next-hop-interface wg01
#1623347825
commit
#1623347828
ip r
#1623347862
ping
#1623347863
ip a
#1623347871
ping 172.16.100.1
#1623348126
claer
#1623348127
clear
#1623348129
config
#1623348130
clear
#1623348132
ping 172.16.100.1
#1623348135
exit
#1623348135
exit
#1623348153
grep route command.sh 
#1623348377
clear
#1623348495
config
#1623348592
configure
#1623348605
set interfaces wireguard wg01 peer SERVER allowed-ips '0.0.0.0/0'
#1623351984
set interfaces wireguard wg01 peer SERVER endpoint
#1623352002
set interfaces wireguard wg01 peer SERVER endpoint 143.198.141.243:25565
#1623352246
discard
#1623352247
clear
#1623352752
config show
#1623352754
show
#1623352765
show commands
#1623352768
exit
#1623352768
exit
#1623352770
clear
#1623352771
exit
#1623352776
show config commands
#1623352788
show config commands > commands2.sh
#1623352792
vim commands2.sh
#1623355403
show firewall
#1623355410
show firewall
#1623355425
show firewall
#1623355449
show config commands | tee commands2.sh
#1623355468
show config commands | grep -iE "WAN-IN|WAN-LOCAL" | tee commands2.sh
#1623355550
show firewall summary
#1623361973
exit
#1623348136
ping 172.16.100.1
#1623362006
clear
#1623362008
exit
#1623362862
history | grep show
#1623362867
history | grep show | grep key
#1623362880
show     wireguard keypairs pubkey
#1623362889
run show     wireguard keypairs pubkey
#1623362891
config
#1623362906
run wireguard genkey
#1623362932
run show wireguard pubkey
#1623362942
run generate wireguard keypair
#1623362948
generate wireguard keypair
#1623362951
config
#1623362959
run generate wireguard keypair
#1623362966
run generate wireguard keypair
#1623362968
exit
#1623362969
run generate wireguard keypair
#1623362973
generate wireguard keypair
#1623362981
run show wireguard pubkey
#1623362983
config
#1623362984
run show wireguard pubkey
#1623362993
history | grep genk
#1623363005
history | grep pubkey
#1623363015
history | grep wireguard
#1623363024
run generate wireguard default-keypair
#1623363049
history | grep wireguard | grep pub
#1623363059
show wireguard keypairs pubkey
#1623363061
show wireguard keypairs pubkey default
#1623363083
run show wireguard keypairs pubkey default-keypair
#1623363092
cat /config/auth/wireguard/default/public.key 
#1623363154
run generate wireguard preshared-key
#1623363174
run show wireguard keypairs pubkey 
#1623363181
run show wireguard keypairs pubkey default
#1623363614
run show wireguard keypairs privkey pixel3
#1623363642
run generate wireguard named-keypairs pixel3
#1623363658
run show wireguard keypairs privkey pixel3
#1623364052
run show wireguard keypairs pubkey pixel3
#1623374018
ip a s wg01
#1623374019
clear
#1623374029
config
#1623374037
run show interfaces wireguard wg01
#1623374039
run show interfaces wireguard wg02
#1623374065
clear
#1623374099
run show wireguard keypairs pubkey overlay-client-wg02
#1623374105
run show wireguard keypairs privkey overlay-client-wg02
#1623374145
set interfaces wireguard wg02 description 'WIREGUARD'
#1623374159
set interfaces wireguard wg02 address '172.16.100.2/24'
#1623374178
set protocols static route '172.16.100.0/24' next-hop '172.16.100.2'
#1623374193
set firewall options interface wg02 adjust-mss '1372'
#1623374220
set interfaces wireguard wg02 peer WIREGUARD address '172.16.100.1'
#1623374231
set interfaces wireguard wg02 peer WIREGUARD port '25565'
#1623374251
set interfaces wireguard wg02 peer WIREGUARD allowed-ips '0.0.0.0/0'
#1623374261
set interfaces wireguard wg02 peer WIREGUARD persistent-keepalive '15'
#1623374300
set interfaces wireguard wg02 peer WIREGUARD pubkey '3NW1Oie3nIxKVbjnHNUrsuN0OOBDLeSTnDiGjuLJEWg='
#1623374335
set interfaces wireguard wg01 peer WIREGUARD address '172.16.100.1'
#1623374418
set interfaces wireguard wg01 peer WIREGUARD address '143.198.141.243'
#1623374429
delete interfaces wireguard wg01 peer WIREGUARD address '172.16.100.1'
#1623374432
set interfaces wireguard wg01 peer WIREGUARD address '143.198.141.243'
#1623374436
commit
#1623374454
set interfaces wireguard wg02 peer WIREGUARD address '172.16.100.1'
#1623374466
delete interfaces wireguard wg01 peer WIREGUARD address '143.198.141.243'
#1623374476
set interfaces wireguard wg02 peer WIREGUARD address '143.198.141.243'
#1623374479
commit
#1623374490
set interfaces wireguard wg02 peer WIREGUARD allowed-ips '0.0.0.0/0'
#1623374500
delete interfaces wireguard wg01
#1623374502
commit
#1623374609
run show wireguard keypairs pubkey default
#1623374572
ping 172.16.100.1
#1623374665
clear
#1623374684
ping 172.16.100.3
#1623374705
ping 172.16.100.3
#1623374707
clear
#1623374711
clear
#1623374722
run show config commands > wireguard.sh
#1623375258
ping 172.16.100.3
#1623375263
clear
#1623375270
ip r
#1623375333
set protocols static route '172.16.100.0/24' next-hop '172.16.100.1'
#1623375339
ping 172.16.100.1
#1623375344
commit
#1623375346
ping 172.16.100.1
#1623375377
set protocols static route '172.16.100.0/24' next-hop '172.16.100.2'
#1623375386
delete protocols static route '172.16.100.0/24' next-hop '172.16.100.1'
#1623375388
set protocols static route '172.16.100.0/24' next-hop '172.16.100.2'
#1623375395
delete protocols static route '172.16.100.0/24' next-hop '172.16.100.2'
#1623375397
delete protocols static route '172.16.100.0/24' next-hop '172.16.100.1'
#1623375404
set protocols static route '172.16.100.0/24' next-hop '172.16.100.2'
#1623375408
ping 172.16.100.1
#1623375431
commit
#1623375439
ping 172.16.100.3
#1623375606
set protocols static route '172.16.100.0/24' next-hop-interface wg01
#1623375634
ip a s wg01
#1623375635
ip a s wg02
#1623375649
set protocols static interface-route 172.16.100.0/24 next-hop-interface wg02
#1623375654
commit
#1623375722
ip r
#1623375821
ping 172.16.100.1
#1623376768
history | grep allowed
#1623376781
history
#1623376797
history | grep allowed
#1623376907
ip a s wg01
#1623376908
ip a s wg02
#1623376914
set interfaces wireguard wg02 peer SERVER allowed-ips '0.0.0.0/0'
#1623376963
ping 172.16.100.1
#1623376969
commit
#1623377021
run show config commands > wireguard-client-vyos.sh
#1623377035
wc -l wireguard-client-vyos.sh 
#1623377040
clear
#1623377043
clear
#1623362983
config
#1623374029
config
#1623430258
clear
#1623430261
config
#1623430262
clear
#1623430338
ip a
#1623430261
config
