# DNS server 
#
# VERSION 0.0.1

FROM alpine:3.10

LABEL maintainer.name="Natasha Tomattis" \
      maintainer.email="natasha.tomattis@mi.unc.edu.ar" \
      version="0.0.1" \
      description="DNS server ejemplo para redes de computadoras"

RUN apk --update upgrade && \
    apk add --update bind && \
    rm -rf /var/cache/apk/* 

ENTRYPOINT /usr/sbin/named -c /etc/bind/named.conf -f -g

