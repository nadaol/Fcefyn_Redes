# QUAGGA BGP
#
# VERSION 0.0.2
FROM alpine:3.11.5

LABEL maintainer.name="Nahuel Oliva - Cancinos Jose" \
      maintainer.email="nadaol@hotmail.com" \
      version="0.0.2" \
      description="Quagga OSPF/BGP - apline based image"

RUN apk update
RUN apk add supervisor quagga heimdal tcpdump
RUN echo "bgpd=yes" > /etc/quagga/daemons
RUN echo "zebra=yes" >> /etc/quagga/daemons
RUN touch /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord"]



