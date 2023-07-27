;RAFAEL ANDRES ALVAREZ MAZARIEGOS 1018419
.model smALl
.data
	unidades db 0
	decenas db 0
	numA db ?
	numB db ?
	nume db 0
	cociente db 0
	reSIduo db 0
	CONTA DB 0
	labo db 'Laboratorio 4','$'
	opera1 db 'Ingrese primer numero de dos digitos: ','$'
	opera2 db 'Ingrese segundo numero de dos digitos: ','$'
	opera3 db 'El resultado de la multiplicacion: ','$'
	opera4 db 'El resultado del cociente es:  ','$'
	opera5 db 'El resultado del reSIduo:  ','$'
	opera6 db 'El resultado es:  ','$'
	sALto db 0DH, 0AH,'$'
.stack 
.code
programa:
	MOV AX, @Data
	MOV DS, AX
	
	XOR AX, AX
	;PEDIR LOS DOS NUMEROS
	PNUMEROS:
	MOV AH, 9
	MOV DX, OFFSET labo
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET sALto
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET opera1
	INT 21H
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV decenas, AL
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV unidades, AL
	
	MOV AL, decenas
	MOV BL, 10
	MUL BL
	ADD AL, unidades
	MOV numA, AL
	
	MOV AH, 9
	MOV DX, OFFSET sALto
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET opera2
	INT 21H
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV decenas, AL
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV unidades, AL
	
	MOV AL, decenas
	MOV BL, 10
	MUL BL
	ADD AL, unidades
	MOV numB, AL
	
	RET
	;MULTIPLICACION DE LOS DOS NUMEROS
	MULTIPLICACIONSUCE:
	MOV AH, 9
	MOV DX, OFFSET sALto
	INT 21H
	
	XOR AX, AX
	;LOS SALTOS DE MULTIPLICACION
	MOV CX, numA
	ADD AL, numB
	MULT:
	SUB CX, 1
	ADD AL, numB
	CMP CX, 0
	JNE MULT
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
	MOV DX, OFFSET sALto
	INT 21H
	
	;DIVISION DE LOS DOS NUMEROS
	XOR AX, AX
	MOV AL, numA
	CMP AL, numB
	JE ESIguAL
	
	DIVI:
	MOV AL, numA
	SUB AL, numB
	ADD CONTA, 1
	MOV numA ,AL
	MOV CONTA, 1
	CMP AL, 0
	JE IMPRIMIR
	JS IMPRIMIR
	JMP DIVI
	
	IMPRIMIR:
	MOV AH, 09H
	MOV DX, OFFSET opera4
	INT 21H
	
	MOV AL, CONTA
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
	MOV DX, OFFSET sALto
	INT 21H
	
	MOV AH, 09H
	MOV DX, OFFSET opera5
	INT 21H
	
	MOV AL, reSIduo
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
	
	JMP FACTORIZACION
	ESIguAL:
	MOV AH, 09H
	MOV DX, OFFSET opera4
	INT 21H
	
	MOV AL, 1
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
	MOV DX, OFFSET sALto
	INT 21H
	
	MOV AH, 09H
	MOV DX, OFFSET opera5
	INT 21H
	
	MOV AL, 0
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
	
	JMP FACTORIZACION
	;FACTORIZACION
	FACTORIZACION:
	MOV AH, 9
	MOV DX, OFFSET sALto
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET opera1
	INT 21H
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV decenas, AL
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV unidades, AL
	
	MOV AL, decenas
	MOV BL, 10
	MUL BL
	ADD AL, unidades
	MOV numA, AL
	
	MOV AH, 9
	MOV DX, OFFSET sALto
	INT 21H
	
	OPRE:
	MOV CX, numA
	CICLO:
	MOV AL, numA
	DIV CONTA
	MOV cociente, AL
	MOV reSIduo, AH
	MOV AL, reSIduo
	CMP AL, 0
	JE IMPRIMIRF
	JMP NOES
	IMPRIMIRF:
	MOV AH, 09H
	MOV DX, OFFSET opera6
	INT 21H
	
	MOV AL, CONTA
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
	NOES:
	ADD CONTA, 01H
	LOOP CICLO
	;DECIMAL A BINARIO
	DECIMALBINARIO:
	MOV AH, 9
	MOV DX, OFFSET sALto
	INT 21H
	
	MOV AH, 9
	MOV DX, OFFSET opera1
	INT 21H
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV decenas, AL
	
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV unidades, AL
	
	MOV AL, decenas
	MOV BL, 10
	MUL BL
	ADD AL, unidades
	MOV numA, AL
	
	CONVERT:
		
	BIN1:
	 mul BX; aquí está AX * BX-> dl_AX, entonces AH debe ser 0, de lo contrario AH afectará
		   ; Cuando el número decimAL a convertir es menor que 65536,
		   ; Todos los datos se ALmacenan en AX
	INC SI
	MOV DL, [SI]
	SUB DL, 30h
	ADD AX, dx
	LOOP BIN1
	MOV CX, 10h
	MOV BX,AX

	BIN2:
	MOV dl,bl
	MOV AH,02h
	INT 21h
	LOOP BIN2;

	MOV AH, 09H
	MOV DX, OFFSET opera6
	INT 21H
	
	MOV AL, 
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
	;FINAL DEL PROGRAMA
	MOV AH, 4CH
	INT 21H
 END programa
 
