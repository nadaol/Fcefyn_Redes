#!/bin/bash
# CONFIGURACION default gateways para hosts y el web server

#H1
sudo docker exec -ti --privileged docker_h1_1 ip route del default
sudo docker exec -ti --privileged docker_h1_1 ip route add default via 192.168.24.11
sudo docker exec -ti --privileged docker_h1_1 ip -6 route del default
sudo docker exec -ti --privileged docker_h1_1 ip -6 route add default via 2001:24::11

#H2
sudo docker exec -ti --privileged docker_h2_1 ip route del default
sudo docker exec -ti --privileged docker_h2_1 ip route add default via 192.168.22.10
sudo docker exec -ti --privileged docker_h2_1 ip -6 route del default
sudo docker exec -ti --privileged docker_h2_1 ip -6 route add default via 2001:22::10

#H3
sudo docker exec -ti --privileged docker_h3_1 ip route del default
sudo docker exec -ti --privileged docker_h3_1 ip route add default via 192.168.23.11
sudo docker exec -ti --privileged docker_h3_1 ip -6 route del default
sudo docker exec -ti --privileged docker_h3_1 ip -6 route add default via 2001:23::11

#ws
sudo docker exec -ti --privileged docker_ws_1 ip route del default
sudo docker exec -ti --privileged docker_ws_1 ip route add default via 192.168.25.11
sudo docker exec -ti --privileged docker_ws_1 ip -6 route del default
sudo docker exec -ti --privileged docker_ws_1 ip -6 route add default via 2001:25::11

#R1
sudo docker exec -ti --privileged docker_r1_1 ip route del default
sudo docker exec -ti --privileged docker_r1_1 ip -6 route del default

#R2 :para no tener que redistribuir bgp a ospf agrego ruta default para el trafico del servidor hacia AS102-AS103
sudo docker exec -ti --privileged docker_r2_1 ip route del default
sudo docker exec -ti --privileged docker_r2_1 ip -6 route del default
sudo docker exec -ti --privileged docker_r2_1 ip route add default via 192.168.15.12
sudo docker exec -ti --privileged docker_r2_1 ip -6 route add default via 2001:15::12

#R3 :para no tener que redistribuir bgp a ospf agrego ruta estatica para el trafico del servidor hacia AS102-AS103
sudo docker exec -ti --privileged docker_r3_1 ip route del default
sudo docker exec -ti --privileged docker_r3_1 ip -6 route del default
sudo docker exec -ti --privileged docker_r3_1 ip route add default via 192.168.14.11
sudo docker exec -ti --privileged docker_r3_1 ip -6 route add default via 2001:14::11

#R4 :para no tener que redistribuir ospf a bgp agrego ruta estatica para el trafico de AS102 hacia AS101
sudo docker exec -ti --privileged docker_r4_1 ip -6 route del default
sudo docker exec -ti --privileged docker_r4_1 ip route del default
sudo docker exec -ti --privileged docker_r4_1 ip route add 192.168.25.0/24 via 192.168.12.12
sudo docker exec -ti --privileged docker_r4_1 ip -6 route add 2001:25::/64 via 2001:12::12
#sudo docker exec -ti --privileged docker_r4_1 ip route add 198.192.25.0/24 via 192.168.11.11
#sudo docker exec -ti --privileged docker_r4_1 ip -6 route add 2001:25::/64 via 2001:12::11


#R5 :para no tener que redistribuir ospf a bgp agrego ruta estatica para el trafico de AS103 hacia AS101
sudo docker exec -ti --privileged docker_r5_1 ip -6 route del default
sudo docker exec -ti --privileged docker_r5_1 ip route del default
#sudo docker exec -ti --privileged docker_r5_1 ip route add 192.168.25.0/24 via 192.168.13.12
#sudo docker exec -ti --privileged docker_r5_1 ip -6 route add 2001:25::/64 via 2001:13::12
sudo docker exec -ti --privileged docker_r5_1 ip route add 192.168.25.0/24 via 192.168.11.12
sudo docker exec -ti --privileged docker_r5_1 ip -6 route add 2001:25::/64 via 2001:11::12

exit
