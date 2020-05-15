#!/usr/bin/env python3

import socket
import sys
import time


delay1 = 0.01
delay2 = 0.1
delay3 = 1

PORT = 9897
HOST = 'localhost'

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))

#file = open("txtRecibido.txt", "wb")
#file = open("pdfRecibido.pdf", "wb")
file = open("bmpRecibido.bmp", "wb")
#file = open("isoRecibido.iso", "wb")



while True:
    RecvData = s.recv(1024)
    time.sleep(delay3)
    if not RecvData:
        print("\n ERROR EN LA TRANSFERENCIA \n")
        break
    file.write(RecvData)



file.close()
s.close()
print("\n Cliente cierra la conexion \n")
