#H1

docker exec -ti --privileged tp2redescomp_h1_1 ip route del default
docker exec -ti --privileged tp2redescomp_h1_1 ip route add default via 192.168.22.10 dev eth0

#H2

docker exec -ti --privileged tp2redescomp_h2_1 ip route del default
docker exec -ti --privileged tp2redescomp_h2_1 ip route add default via 192.168.22.10 dev eth0

#H3

docker exec -ti --privileged tp2redescomp_h3_1 ip route del default
docker exec -ti --privileged tp2redescomp_h3_1 ip route add default via 192.168.22.10 dev eth0

#H4

docker exec -ti --privileged tp2redescomp_h4_1 ip route del default
docker exec -ti --privileged tp2redescomp_h4_1 ip route add default via 192.168.24.11 dev eth0

#H5

docker exec -ti --privileged tp2redescomp_h5_1 ip route del default
docker exec -ti --privileged tp2redescomp_h5_1 ip route add default via 192.168.25.11 dev eth0
