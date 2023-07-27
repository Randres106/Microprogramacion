.model small 					
.data							
	cadena1 DB 6 DUP(24h),'$' ; $ final de la cadena nos sirve para saber si hemos llegado al final
	res db ?
	val1 db ?
	val2 db ?
	salto db 0DH, 0AH,'$'
	opera1 db '			LABORATORIO 5		',0DH, 0AH
	opera2 db 'Instrucciones: ingrese una suma o resta ',0DH, 0AH
	opera3 db 'de dos digitos, ejemplo de la suma 19+98	 ',0DH, 0AH
	opera4 db 'ejemplo de la resta 99-07. Si es solo un',0DH, 0AH
	opera8 db 'digito agregarle un 0 antes 01,02,03...',0DH, 0AH,'$'
	opera5 db 'El resultado de la operacion es: ','$'
	opera6 db 'Ingrese la operacion aritmetica: ','$'

.stack							
.code 							
programa:						
		MOV AX, @DATA      		
		MOV DS, AX
		
		MOV AH, 9
		MOV DX, OFFSET opera1
		INT 21H
		MOV AH, 9
		MOV DX, OFFSET opera6
		INT 21H
		;llamadas principales
		;1 vincular la cadena con el indice
		LEA SI, cadena1
		;2 Leer caracter por caracter 
		;3 Verificar si ha llegado al final (enter)
		CALL GuardarCadena
		;4 imprimir
		CALL ImprimirCadena
		;5 JMP finalizar
		JMP finalizar
		
;------------------------Procedimientos -----------------------------------------

	; 2
	LeerCaracter PROC NEAR
		XOR AX, AX
		MOV AH, 01H
		INT 21H
	RET
	LeerCaracter ENDP
	
	;3
	GuardarCadena PROC NEAR
		LeerC:
			CMP AL,0DH ; si fue enter
			JE TerminarLectura
			CALL LeerCaracter ; luego de la lectura queda en AL
			MOV [SI], AL
			INC SI
			JMP LeerC
		TerminarLectura:
			RET
	RET
	GuardarCadena ENDP
	
	;4
	ImprimirCadena PROC NEAR
	
		MOV SI, 2
		MOV AL, [SI]
		CMP AL,2BH
		JE sumarnumeros
		
		MOV SI, 2
		MOV AL, [SI]
		CMP AL,2DH
		JE restanumeros
		
		;convertir el primer valor de la cadena a una variableç
		sumarnumeros:
		MOV AH, 9
		MOV DX, OFFSET salto
		INT 21H
		XOR DX, DX
		MOV SI, 0
		MOV AL, [SI]
		SUB AL, 30H
		MOV BL, AL   
		MOV SI, 1
		MOV AL, [SI]
		SUB AL, 30H
		MOV CL, AL   
		
		MOV SI, 3
		MOV AL, [SI]
		SUB AL, 30H
		ADD BL, AL  
		
		MOV SI, 4
		MOV AL, [SI]
		SUB AL, 30H
		ADD CL, AL
			
		MOV CH, 00H
		MOV AX, CX
		
		AAM
		MOV CX, AX
		ADD BL, CH
		MOV AX, BX
		
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
		
		MOV AH, 02H
		MOV DL, CL
		ADD DL, 30H
		INT 21H
		
		JMP SALIR
		;resta de los dos numeros
		restanumeros:
		MOV AH, 9
		MOV DX, OFFSET salto
		INT 21H
		XOR DX, DX
		MOV SI, 0
		MOV AL, [SI]
		SUB AL, 30H
		MOV BL, 10
		MUL BL
		MOV val1, AL
		MOV SI, 1
		MOV AL, [SI]
		SUB AL, 30H
		ADD val1, AL  
		
		MOV SI, 3
		MOV AL, [SI]
		SUB AL, 30H
		MOV BL, 10
		MUL BL
		MOV val2, AL
		MOV SI, 4
		MOV AL, [SI]
		SUB AL, 30H
		ADD val2, AL 
		
		MOV AL, val1
		SUB AL, val2
		MOV res, AL
		
		MOV AL, res
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
			
		
		
		SALIR:
	RET
	ImprimirCadena ENDP
	
		
		Finalizar:

		MOV AH, 4Ch				
		INT 21h					
		
END programa					 