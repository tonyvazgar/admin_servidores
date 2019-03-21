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

# Config INPUT for HTTP server
iptables -A INPUT -p tcp --sport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 5432 -j ACCEPT

iptables -A INPUT -p udp --sport 53 -j ACCEPT
iptables -A INPUT -p tcp --sport 5432 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 5432 -j ACCEPT

iptables -A OUTPUT -p tcp --dport 5432 -j ACCEPT