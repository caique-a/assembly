potencia proc
	; Divide N por uma potência de 2
	; Entrada -> AL: Número a ser dividido
	;            CL: Potência de 2
	; Saída -> AL: Resultado da divisão
	shr al, cl
	ret
potencia endp
