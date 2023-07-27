.model small
.data
	numA db 4
	numB db 2
	numC db 1
	valores db 'A=4, B=2, C=1', 0DH, 0AH
	opera1 db 'A+B=$'
	opera2 db 'A-C=$'
	opera3 db 'A+B+C=$'
	opera4 db 'A+2B-C=$'
	salto db 0DH, 0AH,'$'
.stack 
.code
programa:
	MOV AX, @Data
	MOV DS, AX
	;MOSTRAR LOS VALORES DE LAS VARIABLES
	MOV AH, 9
	MOV DX, OFFSET valores
	INT 21H 
	;OPERACION A+B
	XOR AX, AX
	MOV AL, numA
	ADD AL, numB
	MOV AH, AL
		
	MOV DL, AL
	ADD DL, 30H
	MOV AH, 02H
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H 
	;OPERACION A-C
	MOV AH, 9
	MOV DX, OFFSET opera2
	INT 21H
	
	XOR AX, AX
	MOV AL, numA
	SUB AL, numC
	MOV AH, AL
	
	MOV DL, AL
	ADD DL, 30H
	MOV AH, 02H
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H 
	;OPERACION A+B+C
	MOV AH, 9
	MOV DX, OFFSET opera3
	INT 21H 
	
	XOR AX, AX
	MOV AL, numA
	ADD AL, numB
	ADD AL, numC
	MOV AH, AL
		
	MOV DL, AL
	ADD DL, 30H
	MOV AH, 02H
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET salto
	INT 21H 
	;OPERACION A+2B-C
	MOV AH, 9
	MOV DX, OFFSET opera4
	INT 21H 
	
	XOR AX, AX
	MOV BL, numB
	MOV AL, 02H
	MUL AL
	ADD AL, numA
	SUB AL, numC
	MOV AH, AL
		
	MOV DL, AL
	ADD DL, 30H
	MOV AH, 02H
	INT 21H
	
	;FINAL DEL PROGRAMA
	MOV AH, 4CH
	INT 21H
	
 END programa
 
