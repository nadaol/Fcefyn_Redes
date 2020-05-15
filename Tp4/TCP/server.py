#!/usr/bin/env python3

import socket


PORT = 9897
HOST = 'localhost'

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

print("\n Server escuchando en el puerto :", PORT, "\n")

s.bind((HOST, PORT))
s.listen(1)

#Abrir y enviar el dato
print("\n Archivo a enviar: LISTO")


while True:
    conn, addr = s.accept()
    print("\n Conectado con", addr)

    #file = open("txtEnviar.txt", "rb")
    #file = open("pdfEnviar.pdf", "rb")
    file = open("bmpEnviar.bmp", "rb")
    #file = open("isoEnviar.iso", "rb")


    SendData = file.read(1024)

    while SendData:
        conn.send(SendData)
        SendData = file.read(1024)
    
    file.close
    print('Envio completado')
    break

conn.close()
s.close()
