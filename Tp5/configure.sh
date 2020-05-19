#!/bin/bash
# CONFIGURACION default gateways para hosts y el web server

#H1
sudo docker exec -ti --privileged h1 ip route del default
sudo docker exec -ti --privileged h1 ip route add default via 10.0.0.2

#WebServer
sudo docker exec -ti --privileged ws ip route del default
sudo docker exec -ti --privileged ws ip route add default via 10.0.0.2
sudo docker exec ws python ./app.py &

#H3
sudo docker exec -ti --privileged h3 ip route del default
sudo docker exec -ti --privileged h3 ip route add default via 20.0.0.2

#prim_edu
sudo docker exec -ti --privileged prim_edu ip route del default
sudo docker exec -ti --privileged prim_edu ip route add default via 10.0.0.2

#sec_edu
sudo docker exec -ti --privileged sec_edu ip route del default
sudo docker exec -ti --privileged sec_edu ip route add default via 10.0.0.2

#prim_com
sudo docker exec -ti --privileged prim_com ip route del default
sudo docker exec -ti --privileged prim_com ip route add default via 20.0.0.2

#root
sudo docker exec -ti --privileged root ip route del default
sudo docker exec -ti --privileged root ip route add default via 30.0.0.2

#R1
sudo docker exec -ti --privileged r1 ip route del default
sudo docker exec -ti --privileged r1 ip route add default via 30.0.0.3

exit
