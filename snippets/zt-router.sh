iptables -t nat -A POSTROUTING -o enp1s0 -s 172.30.0.0/16 -j SNAT --to-source 45.77.189.172
iptables -t filter -A FORWARD -i zt+ -s 172.30.0.0/16 -d 0.0.0.0/0 -j ACCEPT
iptables -t filter -A FORWARD -i enp1s0 -s 0.0.0.0/0 -d 172.30.0.0/0 -j ACCEPT

ip6tables -t filter -A FORWARD -i zt+ -s fd83:048a:0632:6c5a:6099:93::/88 -d ::/0 -j ACCEPT
ip6tables -t filter -A FORWARD -i enp1s0 -s ::/0 -d fd83:048a:0632:6c5a:6099:93::/88 -j ACCEPT
sysctl -w net.ipv6.conf.all.forwarding=1
ip6tables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE
ip6tables -t nat -A POSTROUTING -o enp1s0 -j SNAT --to-source 2001:19f0:ac01:1774:5400:3ff:feec:396d