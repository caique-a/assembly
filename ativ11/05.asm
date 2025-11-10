potencia proc
	; Multiplica N por uma potência de 2
	; Entrada -> AL: Número a ser multiplicado
	;            CL: Potência de 2
	; Saída -> AL: Resultado da multiplicação
	shl al, cl
	ret
potencia endp
