  .global programa
  .data
entrada:   
  .string  "test.txt"
error:   
  .string  "No se pudo arbir el .txt"
mensa: 
.string "No se ha podido terminar el laberinto :("
salida:   
  .string  "test2.txt"
mensaj:
  .string  "Se ha completado el laberinto correctamente"
msalida:   
  .string  ""
buffer:
  .string "250"
  .text
programa:
  la   s0, buffer   
  li   s1, 251      

  la   a0, entrada      # param nombre de archivo
  li   a1, 0       # param 0 leer, param 1 escribir
  li   a7, 1024     # abrir archivo
  ecall

  bltz a0, errorlectura # Salto si a0 es menor a 0, es decir si no existe
  mv   s6, a0        # sguardar info del archivo

ciclolectura:
  mv   a0, s6       # descripcion del archivo 
  mv   a1, s0       # direccion de buffer
  mv   a2, s1       # cantidad de caracteres a leer
  li   a7, 63       # parametro para leer archivo
  ecall             

  bltz a0, cerrararchivo # en caso de error, cerrar el archivo es importante
  mv   t0, a0       
  add  t1, s0, a0   
  sb   zero, 0(t1)  

  # impresion de lo que se ha leido
  mv a0, s0
  li   a7, 4
  ecall
  beq  t0, s1, ciclolectura

cerrararchivo: 
  mv   a0, s6       # informacion del archivo / descriptor
  li   a7, 57       # parametro para cerrar archivo
  ecall             # Cerrar el archivo
#se comienza a recorrer la cadena

#escribir archivo
  la   s0, mensaj
  li   s1, 45     

  la   a0, salida      # param nombre de archivo
  li   a1, 1       # param 0 leer, param 1 escribir
  li   a7, 1024     # abrir archivo
  ecall

  bltz a0, errorlectura # Salto si a0 es menor a 0, es decir si no existe
  mv   s6, a0        # sguardar info del archivo

ciclolectura2:
  mv   a0, s6       # descripcion del archivo 
  mv   a1, s0       # direccion de buffer
  mv   a2, s1       # cantidad de caracteres a leer
  li   a7, 64      # parametro para leer archivo
  ecall             

  bltz a0, cerrararchivo2 # en caso de error, cerrar el archivo es importante
  mv   t0, a0       
  add  t1, s0, a0   
  sb   zero, 0(t1)  

  # impresion de lo que se ha leido
  mv a0, s0
  li   a7, 4
  ecall

cerrararchivo2: 
  mv   a0, s6       # informacion del archivo / descriptor
  li   a7, 57       # parametro para cerrar archivo
  ecall             # Cerrar el archivo

finalizar:
  li   a7, 10
  ecall

errorlectura:
  la   a0, error
  li   a7, 4
  ecall
  



