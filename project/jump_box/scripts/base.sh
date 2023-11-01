#!/bin/bash
ip route del 0.0.0.0/0 via 10.10.10.1 #crona este treba
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
apt update
DEBIAN_FRONTEND=noninteractive apt-get install iptables-persistent -y
systemctl start netfilter-persistent
iptables-save > /etc/iptables/rules.v4