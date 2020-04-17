#!/bin/bash
# CONFIGURACION default gateways para hosts y el web server

#H3

sudo docker exec -ti --privileged docker_h3_1 ip route del default
sudo docker exec -ti --privileged docker_h3_1 ip route add default via 192.168.23.11

#H1
sudo docker exec -ti --privileged docker_h1_1 ip route del default
sudo docker exec -ti --privileged docker_h1_1 ip route add default via 192.168.24.11 dev eth0

#H2

sudo docker exec -ti --privileged docker_h2_1 ip route del default
sudo docker exec -ti --privileged docker_h2_1 ip route add default via 192.168.22.10 dev eth0



#ws

sudo docker exec -ti --privileged docker_ws_1 ip route del default
sudo docker exec -ti --privileged docker_ws_1 ip route add default via 192.168.25.11 dev eth0