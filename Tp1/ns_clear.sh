#!/bin/bash
#Clear environment 
sudo ip netns delete h1
sudo ip netns delete h2 
sudo ip netns delete h3
sudo ip netns delete h4
sudo ip netns delete r1
sudo ip link delete veth-sw-r1
sudo ip link delete veth-sw-h2
sudo ip link delete veth-sw-h3
sudo ip link delete veth-sw-h4
sudo ip link set sw1 down
sudo brctl delbr sw1