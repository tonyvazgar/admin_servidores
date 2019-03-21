# Reiniciar todas iptables
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Flush tables
iptables -X
iptables -F

# Hacer drop a todas las tablas
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Agregar DROp a filter
iptables -A INPUT -m state --state INVALID -j DROP

# Aceptamos todo lo de *lo*
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# para configurar el SSH
iptables -A INPUT  -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISH,RELATED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 22 -m conntrack --ctstate ESTABLISH,RELATED -j ACCEPT
iptables -A INPUT  -p tcp -m tcp --sport 22 -m conntrack --ctstate ESTABLISH,RELATED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISH,RELATED -j ACCEPT

# imput desde el server http
iptables -A INPUT -p tcp --sport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --sport 80 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --sport 443 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -j LOG --log-prefix "DROPPED:"

# output de acessos http


iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -p tcp -m tcp --sport 80 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT 



iptables -A OUTPUT -p tcp -m tcp --sport 443 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT 

iptables -A PREROUTING -t nat -i enp0s8 -p tcp --dport 80 -j DNAT --to 192.168.30.10:80

iptables -A FORWARD -p tcp -d 192.168.30.10 --dport 80 -j ACCEPT