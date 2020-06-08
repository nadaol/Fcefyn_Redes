#!/bin/bash
# CONFIGURACION default gateways para hosts y el web server

#H1
sudo docker exec -ti --privileged h1 ip route del default
sudo docker exec -ti --privileged h1 ip route add default via 30.1.0.2
sudo docker exec -ti --privileged h1 ip -6 route del default
sudo docker exec -ti --privileged h1 ip -6 route add default via 30:1::2

#H2
sudo docker exec -ti --privileged h2 ip route del default
sudo docker exec -ti --privileged h2 ip route add default via 30.1.0.2
sudo docker exec -ti --privileged h2 ip -6 route del default
sudo docker exec -ti --privileged h2 ip -6 route add default via 30:1::2

#prim_com
sudo docker exec -ti --privileged prim_com ip route del default
sudo docker exec -ti --privileged prim_com ip route add default via 30.0.0.2
sudo docker exec -ti --privileged prim_com ip -6 route del default
sudo docker exec -ti --privileged prim_com ip -6 route add default via 30::2

#R1
sudo docker exec -ti --privileged r1 ip -6 route del default
sudo docker exec -ti --privileged r1 ip route del default
sudo docker exec -ti --privileged r1 ip route add default via 192.168.0.200
sudo docker exec -ti --privileged prim_com ip -6 route del default

exit
