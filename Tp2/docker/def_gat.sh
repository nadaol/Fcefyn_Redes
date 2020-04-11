#!/bin/bash
# CONFIGURACION default gateways para hosts

#H3

sudo docker exec -ti --privileged docker_h3_1 ip route del default
sudo docker exec -ti --privileged docker_h3_1 ip route add default via 192.168.22.10

#H1
sudo docker exec -ti --privileged docker_h1_1 ip route del default
sudo docker exec -ti --privileged docker_h1_1 ip route add default via 192.168.22.10 dev eth0

#H2

sudo docker exec -ti --privileged docker_h2_1 ip route del default
sudo docker exec -ti --privileged docker_h2_1 ip route add default via 192.168.22.10 dev eth0



#H4

sudo docker exec -ti --privileged docker_h4_1 ip route del default
sudo docker exec -ti --privileged docker_h4_1 ip route add default via 192.168.24.11 dev eth0


#H5

sudo docker exec -ti --privileged docker_h5_1 ip route del default
sudo docker exec -ti --privileged docker_h5_1 ip route add default via 192.168.25.11 dev eth0
exit

#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.11.0/24 eth0
#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.12.0/24 eth0
#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.13.0/24 eth0
#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.14.0/24 eth0
#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.15.0/24 eth0
#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.16.0/24 eth0
#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.22.0/24 eth0
#sudo docker exec -ti --privileged docker_h5_1 ip route 192.168.24.0/24 eth0