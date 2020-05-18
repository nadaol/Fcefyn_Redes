# ----- sender.py ------

#!/usr/bin/env python

import socket
import sys

socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
host = 'localhost'
puerto = 9999
buffer =1024
direccion = (host,puerto)

#file = open("txtEnviar.txt", "rb")
#file = open("pdfEnviar.pdf", "rb")
file = open("bmpEnviar.bmp", "rb")
#file = open("isoEnviar.iso", "rb")

data = file.read(buffer)
while (data):
    if(socket.sendto(data,direccion)):
        print ("Enviando ...")
        data = file.read(buffer)
socket.close()
file.close()
print ("Se ha cerrado el servidor")
