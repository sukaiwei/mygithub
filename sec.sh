#!/bin/bash
iptables -F
iptables -X
iptables -Z

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -o tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -o tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT

iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

iptables -A INPUT -s 192.168.42.1 -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -d 192.168.42.1 -p tcp --sport 22 -j ACCEPT

iptables -A INPUT -s 192.168.42.0/24 -p tcp --dport 5901 -j ACCEPT
iptables -A OUTPUT -d 192.168.42.0/24 -p tcp --sport 5901 -j ACCEPT

#挑战：为网站开发iptables脚本
