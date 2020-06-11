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
sudo docker exec -ti --privileged r1 ip route add default via 40.0.0.6
#sudo docker exec -ti --privileged r1 ip -6 route add default via fd17:625c:f037::10
echo 'r1 configured Ok'

#en vm2
#sudo brctl addif br-00154d8b855d enp0s8
#sudo ip route del 30.0.0.0/24
#sudo ip route del 30.1.0.0/24
#sudo ip route add 30.0.0.0/8 via 40.0.0.6 (redes docker -> interfaz router)
#sudo ip route del 30:1::/64
#sudo ip route del 30::/64
#sudo ip -6 route add 30::/16 via fd17:625c:f037::10

#agregar en vm_cluster
#sudo ip route add 30.0.0.0/8 via 40.0.0.6
#sudo ip -6 route add 30::/16 via fd17:625c:f037::10

#registrar usuario
#curl --cacert /home/server-com.pem -X POST https://server.com/auth/local/register -H 'Content-Type: application/json' -d '{"username":"user3","email":"user3@gmail.com","password":"123456"}'

#Consulta base de datos
#curl --cacert /home/server-com.pem -X GET https://server.com/Vehiculos/5ee08d5f13ea4800c26640e0 -H "Authorization: Bearer <token>"
exit
