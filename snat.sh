#!/bin/bash 

# enable IP forwarding and NAT
sudo sysctl -q -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# persist the previous changes
sudo yum install -y iptables-services
sudo service iptables save
sudo service iptables restart
sudo chkconfig iptables on
sudo echo 'net.ipv4.ip_forward = 1' > /etc/sysctl.d/99-ipv4.conf
