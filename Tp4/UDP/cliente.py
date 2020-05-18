# ----- receiver.py -----

#!/usr/bin/env python
import socket
import sys
import select
import time

delay1 = 0.01
delay2 = 0.1
delay3 = 1

socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
host = 'localhost'
puerto = 9999
socket.bind((host,puerto))

direccion = (host,puerto)
buffer=1024


#file = open("txtRecibido.txt", "wb")
#file = open("pdfRecibido.pdf", "wb")
file = open("bmpRecibido.bmp", "wb")
#file = open("isoRecibido.iso", "wb")

data,direccion = socket.recvfrom(buffer)
try:
    while(data):
        file.write(data)
        time.sleep(delay1)
        socket.settimeout(1) #(segundos) Recomendado 30 o 60 segundos
        data,direccion = socket.recvfrom(buffer)
except:
    e = sys.exc_info()
    file.close()
    socket.close()
    print ("\nArchivo descargado con exito")
    print ("\nCliente ha finalizado")