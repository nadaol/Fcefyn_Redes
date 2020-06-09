#!/bin/bash

#H1
sudo docker exec -ti --privileged h1 ip route del default
sudo docker exec -ti --privileged h1 ip route add default via 30.1.0.2
sudo docker exec -ti --privileged h1 ip -6 route del default
sudo docker exec -ti --privileged h1 ip -6 route add default via 30:1::2
echo 'h1 configured Ok'

#H2
sudo docker exec -ti --privileged h2 ip route del default
sudo docker exec -ti --privileged h2 ip route add default via 30.1.0.2
sudo docker exec -ti --privileged h2 ip -6 route del default
sudo docker exec -ti --privileged h2 ip -6 route add default via 30:1::2
echo 'h2 configured Ok'

#prim_com
sudo docker exec -ti --privileged prim_com ip route del default
sudo docker exec -ti --privileged prim_com ip route add default via 30.0.0.2
sudo docker exec -ti --privileged prim_com ip -6 route del default
sudo docker exec -ti --privileged prim_com ip -6 route add default via 30::2
echo 'prim_com configured Ok'

#R1
sudo docker exec -ti --privileged r1 ip -6 route del default
sudo docker exec -ti --privileged r1 ip route del default
sudo docker exec -ti --privileged r1 ip route add default via 30.3.0.150
#sudo docker exec -ti --privileged r1 ip -6 route add default via 30:3::150
echo 'r1 configured Ok'

#sudo brctl addif br-00154d8b855d enp0s8

exit
