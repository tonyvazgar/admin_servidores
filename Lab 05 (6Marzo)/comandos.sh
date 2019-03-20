iptables -F
iptables -X
iptables -A INPUT -m state --state INVALID -j DROP
iptables -I INPUT -i lo -j ACCEPT

iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

iptables -A OUTPUT -i INVALID -j DROP

iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
# iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
# iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
# iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
