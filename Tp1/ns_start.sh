#!/bin/bash
# Create resources (h4 for dhcp-server)
sudo ip netns add h1
sudo ip netns add h2
sudo ip netns add h3
sudo ip netns add h4
sudo ip netns add r1
# Create veth's links
sudo ip link add name veth1 type veth peer name vpeer1
sudo ip link add name veth2 type veth peer name vpeer2
sudo ip link add name veth3 type veth peer name vpeer3
sudo ip link add name veth4 type veth peer name vpeer4
sudo ip link add name veth-router type veth peer name vpeer-router
sudo brctl addbr sw1

sudo echo resources created
sudo sleep 0.1

# Set peer's links up
sudo ip link set veth1 up
sudo ip link set veth2 up
sudo ip link set veth3 up
sudo ip link set veth4 up
sudo ip link set veth-router up
sudo ip link set sw1 up

sudo echo links are up
sudo sleep 0.1

# Assign interfaces to namespaces 
sudo ip link set dev vpeer1 netns h1
sudo ip link set dev vpeer2 netns h2
sudo ip link set dev vpeer3 netns h3
sudo ip link set dev vpeer4 netns h4

sudo ip link set dev vpeer-router netns r1
sudo ip link set dev veth1 netns r1

sudo echo interfaces assigned
sudo sleep 0.1

# Connect veth's to bridge  (3 hosts and router)
sudo brctl addif sw1 veth2
sudo brctl addif sw1 veth3
sudo brctl addif sw1 veth4
sudo brctl addif sw1 veth-router

sudo echo switch interfaces conected
sudo sleep 0.1

# Configure router as router
sudo ip netns exec r1 sysctl -w net.ipv6.conf.all.forwarding=1

# Configure IP addresses
#router interfaces
sudo ip netns exec r1 ip addr add 192.168.2.12/24 dev vpeer-router
sudo ip netns exec r1 ip addr add 192.168.1.11/24 dev veth1

#hosts interfaces
#sudo ip addr add 192.168.1.0/24 dev veth1
#sudo ip addr add 192.168.2.0/24 dev veth2
#sudo ip addr add 192.168.2.0/24 dev veth3
#sudo ip addr add 192.168.2.0/24 dev veth4

#hosts static ip's
#sudo ip netns exec h1 ip addr add 192.168.1.10/24 dev vpeer1
#sudo ip netns exec h2 ip addr add 192.168.2.2/24 dev vpeer2
#sudo ip netns exec h3 ip addr add 192.168.2.3/24 dev vpeer3
#sudo ip netns exec h4 ip addr add 192.168.2.4/24 dev vpeer4

sudo echo ip addresses configured
sudo sleep 0.1

# Set Up interfaces
sudo ip netns exec h1 ip link set lo up
sudo ip netns exec h2 ip link set lo up
sudo ip netns exec h3 ip link set lo up
sudo ip netns exec h4 ip link set lo up
sudo ip netns exec r1 ip link set lo up

sudo ip netns exec h1 ip link set vpeer1 up
sudo ip netns exec h2 ip link set vpeer2 up
sudo ip netns exec h3 ip link set vpeer3 up
sudo ip netns exec h4 ip link set vpeer4 up

sudo ip netns exec r1 ip link set vpeer-router up
sudo ip netns exec r1 ip link set veth1 up

sudo echo interfaces are up
sudo sleep 0.1

#host routes
#sudo ip netns exec h1 ip route add default via 192.168.1.11
#sudo ip netns exec h2 ip route add default via 192.168.2.12

# Init router advertisement daemon
#sudo ip netns exec r1 radvd -n
