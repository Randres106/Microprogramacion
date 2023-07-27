#Rafael Andrés Alvares Mazariegos 1018419
.global programa   #Directiva punto de arranque del programa
.data              #Inicio segmento de datos

mensaje:
	.string "		Laboratorio No.6"

.text              #Inicio segmento de codigo	
programa:
	
	.macro factorial(%num1)
		li a2, %num1    #Asignando a registros
		li a5, 1
		li a6, 1
		mv a4, a2
	Bucle:
		sub a1, a2, a5  # resultado, operando1, operando2
		mul a0, a4, a1
		add a5, a5, a6
		mv a4, a0
		beq a5, a2, Imprimir
		j Bucle
	Imprimir: 
		li a7, 93
		ecall
	.end_macro 
	
	la   a0, mensaje
  	li   a7, 4
  	ecall

	factorial(8) #Ingrese el factorial dentro de los ()
	

finalizar:
	li a7, 10  #Parametro para finalizar programa
	ecall      #int 21h
