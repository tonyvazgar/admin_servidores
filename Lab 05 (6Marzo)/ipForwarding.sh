iptables -A PREROUTING -t nat -i enp0s8 -p tcp --dport 80 -j DNAT --to 192.168.1.2:80
iptables -A FORDWARD -p tcp -d 192.168.1.2 --dport 80 -j ACCEPT