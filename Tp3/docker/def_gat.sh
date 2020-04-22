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

#R2 :para no tener que redistribuir bgp a ospf agrego ruta estatica para el trafico del servidor hacia AS102-AS103
sudo docker exec -ti --privileged docker_r2_1 ip route del default
sudo docker exec -ti --privileged docker_r2_1 ip route add default via 192.168.15.12 dev eth0
#agrego ruta estatica para no tener que correr ospf en la interface de h1 (y asi privatizarlo)para el trafico del servidor a h1
sudo docker exec -ti --privileged docker_r2_1 ip route add 192.168.24.0/24 via 192.168.16.11

#R3 :para no tener que redistribuir bgp a ospf agrego ruta estatica para el trafico del servidor hacia AS102-AS103
sudo docker exec -ti --privileged docker_r3_1 ip route del default
sudo docker exec -ti --privileged docker_r3_1 ip route add default via 192.168.14.11 dev eth1

#R4 :para no tener que redistribuir ospf a bgp agrego ruta estatica para el trafico de AS102 hacia AS101
sudo docker exec -ti --privileged docker_r4_1 ip route del default
sudo docker exec -ti --privileged docker_r4_1 ip route add default via 192.168.12.12 dev eth1

#R5 :para no tener que redistribuir ospf a bgp agrego ruta estatica para el trafico de AS103 hacia AS101
sudo docker exec -ti --privileged docker_r5_1 ip route del default
sudo docker exec -ti --privileged docker_r5_1 ip route add default via 192.168.13.12 dev eth1
#sudo docker exec -ti --privileged docker_r5_1 ip route add default via 192.168.11.12 dev eth2
exit
