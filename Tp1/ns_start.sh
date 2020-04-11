#!/bin/bash
# Create resources (h4 for dhcp-server)
sudo ip netns add h1
sudo ip netns add h2
sudo ip netns add h3
sudo ip netns add h4
sudo ip netns add r1
sudo brctl addbr sw1
sudo echo ns created
# Create veth's links
sudo ip link add name veth-h1-r1 type veth peer name veth-r1-h1
sudo ip link add name veth-h2-sw type veth peer name veth-sw-h2
sudo ip link add name veth-h3-sw type veth peer name veth-sw-h3
sudo ip link add name veth-h4-sw type veth peer name veth-sw-h4
sudo ip link add name veth-r1-sw type veth peer name veth-sw-r1

sudo echo links created
sudo sleep 0.1

# Link interfaces to namespaces 
sudo ip link set dev veth-h1-r1 netns h1
sudo ip link set dev veth-h2-sw netns h2
sudo ip link set dev veth-h3-sw netns h3
sudo ip link set dev veth-h4-sw netns h4

sudo ip link set dev veth-r1-sw netns r1
sudo ip link set dev veth-r1-h1 netns r1

sudo brctl addif sw1 veth-sw-h2
sudo brctl addif sw1 veth-sw-h3
sudo brctl addif sw1 veth-sw-h4
sudo brctl addif sw1 veth-sw-r1

sudo echo interfaces conected
sudo sleep 0.1

#Set switch link's up

sudo ip link set veth-sw-h2 up
sudo ip link set veth-sw-h3 up
sudo ip link set veth-sw-h4 up
sudo ip link set veth-sw-r1 up

sudo ip link set sw1 up
sudo echo links are up

# Configure router as router
sudo ip netns exec r1 sysctl -w net.ipv4.conf.all.forwarding=1

# Configure IP addresses
#router interfaces
sudo ip netns exec r1 ip addr add 192.168.2.12/24 dev veth-r1-sw
sudo ip netns exec r1 ip addr add 192.168.1.11/24 dev veth-r1-h1
#hosts static ip's
sudo ip netns exec h1 ip addr add 192.168.1.10/24 dev veth-h1-r1
sudo ip netns exec h4 ip addr add 192.168.2.4/24 dev veth-h4-sw

sudo echo ip addresses configured
sudo sleep 0.1

# Set Up interfaces
sudo ip netns exec h1 ip link set lo up
sudo ip netns exec h2 ip link set lo up
sudo ip netns exec h3 ip link set lo up
sudo ip netns exec h4 ip link set lo up
sudo ip netns exec r1 ip link set lo up

sudo ip netns exec h1 ip link set veth-h1-r1 up
sudo ip netns exec h2 ip link set veth-h2-sw up
sudo ip netns exec h3 ip link set veth-h3-sw up
sudo ip netns exec h4 ip link set veth-h4-sw up
sudo ip netns exec r1 ip link set veth-r1-sw up
sudo ip netns exec r1 ip link set veth-r1-h1 up

sudo echo interfaces are up
sudo sleep 0.1

#host default gateways
sudo ip netns exec h1 ip route add default via 192.168.1.11
sudo ip netns exec h4 ip route add default via 192.168.2.12

#configure dhcp-server on host 4
sudo chown root:root /var/lib/dhcp/dhcpd.leases
sudo chown root:root /var/lib/dhcp /var/lib/dhcp/dhcpd.leases
sleep 5s

sudo ip netns exec h4 dhcpd -user dhcpd -group dhcpd -4 -cf /etc/dhcp/dhcpd.conf veth-h4-sw
#sudo echo dhcp server on
#sudo sleep 0.1

#start dhc-clients to listen to dhcp-server
sudo ip netns exec h2 dhclient -4 -nw
sudo ip netns exec h3 dhclient -4 -d
