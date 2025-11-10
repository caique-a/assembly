maimi proc
	; Transforma uma letra maiúscula em uma minúscula
	; Entrada -> BX: Offset do vetor de letras minúsculas
	;            AL: Letra maiúscula
	sub al, 'A'
	xlat ; Pega o valor em AL e usa como índice do vetor de letras minúsculas e coloca em AL
	ret
maimi endp
