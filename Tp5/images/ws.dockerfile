# Host 
#
# VERSION 0.0.1
FROM python:alpine3.7
LABEL maintainer.name="Nahuel Oliva - Cancinos Jose" \
      maintainer.email="nadaol@hotmail.com" \
      version="0.0.2" \
      description="Python 3.7 - apline based image"
RUN apk --update upgrade && \
    apk add --update vim tcpdump bind-tools dnsmasq iproute2 net-tools && \
    rm -rf /var/cache/apk/*

RUN pip install --upgrade pip
RUN pip install flask