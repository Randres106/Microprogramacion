;RAFAEL ANDRES ALVAREZ MAZARIEGOS 1018419
.model small
.data
	numA db ?
	numB db ?
	multiplicacion db 0
	cociente db 0
	residuo db 0
	labo db 'Laboratorio 3','$'
	opera1 db 'Ingrese primer numero del 0-9: ','$'
	opera2 db 'Ingrese segundo numero del 0-9: ','$'
	opera3 db 'El resultado de la multiplicacion:  ','$'
	opera4 db 'El resultado del cociente es:  ','$'
	opera5 db 'El resultado del residuo:  ','$'
	salto db 0DH, 0AH,'$'
.stack 
.code
programa:
	MOV AX, @Data
	MOV DS, AX
	
	XOR AX, AX
	;PEDIR LOS DOS NUMEROS
	MOV AH, 9
	MOV DX, OFFSET labo
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET opera1
	INT 21H
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV numA, AL
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET opera2
	INT 21H
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV numB, AL
	
	;MULTIPLICACION DE LOS DOS NUMEROS
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H
	
	XOR AX, AX
	MOV AL, numA
	MUL numB
	MOV multiplicacion, AL
	
	MOV AH, 09H
	MOV DX, OFFSET opera3
	INT 21H
	
	MOV AL, multiplicacion
	AAM
	MOV BX, AX
	MOV AH, 02H
	MOV DL, BH
	ADD DL, 30H
	INT 21H
	
	MOV AH, 02H
	MOV DL, BL
	ADD DL, 30H
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H
	;DIVISION DE LOS DOS NUMEROS
	XOR AX, AX
	MOV AL, numA
	DIV numB
	MOV cociente, Al
	MOV residuo, AH
	
	MOV AH, 09H
	MOV DX, OFFSET opera4
	INT 21H
	
	MOV AL, cociente
	AAM
	MOV BX, AX
	MOV AH, 02H
	MOV DL, BH
	ADD DL, 30H
	INT 21H
	
	MOV AH, 02H
	MOV DL, BL
	ADD DL, 30H
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H
	
	MOV AH, 09H
	MOV DX, OFFSET opera5
	INT 21H
	
	MOV AL, residuo
	AAM
	MOV BX, AX
	MOV AH, 02H
	MOV DL, BH
	ADD DL, 30H
	INT 21H
	
	MOV AH, 02H
	MOV DL, BL
	ADD DL, 30H
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H
	;FINAL DEL PROGRAMA
	MOV AH, 4CH
	INT 21H
 END programa
 
