#!/bin/bash
# CONFIGURACION default gateways para hosts

#H1

sudo docker exec -ti --privileged docker_h1_1 ash
sudo ip route del default
sudo ip route add default via 192.168.22.10 dev eth0
sudo exit

#H2

docker exec -ti --privileged docker_h2_1 ash
ip route del default
ip route add default via 192.168.22.10 dev eth0
exit

#H3

docker exec -ti --privileged docker_h3_1 ash
ip route del default
ip route add default via 192.168.22.10 dev eth0
exit

#H4

docker exec -ti --privileged docker_h4_1 ash
ip route del default
ip route add default via 192.168.22.10 dev eth0


#H5

ip route 192.168.11.0/24 eth0
ip route 192.168.12.0/24 eth0
ip route 192.168.13.0/24 eth0
ip route 192.168.14.0/24 eth0
ip route 192.168.15.0/24 eth0
ip route 192.168.16.0/24 eth0
ip route 192.168.22.0/24 eth0
ip route 192.168.24.0/24 eth0