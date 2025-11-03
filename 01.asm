.model small
.stack 100h
.data
	N equ 4
	matriz db N dup (N dup(?))

.code
le proc
	; Le uma matriz N x N
	; Entrada -> BX: Offset da matriz
	; Saída -> Matriz lida na memoria
	push ax
	push bx
	push cx
	push dx
	push si
	mov ch, N
	L1:
	xor si, si
	mov cl, N
	mov ah, 1
	L2:
	int 21h
	and al, 0fh
	mov [bx][si], al
	inc si
	dec cl
	jnz L2
	call nl
	add bx, N
	dec ch
	jnz L1
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
le endp
nl proc
	push ax
	push dx
	mov ah, 2
	mov dl, 13
	int 21h
	mov dl, 10
	int 21h
	pop dx
	pop ax
	ret
nl endp
imprime proc
	; Imprime uma matriz N x N
	; Entrada -> BX: Offset da matriz
	; Saída -> Imprime a matriz na tela
	push ax
	push bx
	push cx
	push dx
	push si
	mov ch, N
	L3:
	xor si, si
	mov cl, N
	mov ah, 2
	L4:
	mov dl, [bx][si]
	or dl, 30h
	int 21h
	inc si
	dec cl
	jnz L4
	call nl
	add bx, N
	dec ch
	jnz L3
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imprime endp
troca proc
	; Troca elementos acima da diagonal principal por elementos abaixo
	; Entrada -> BX: Offset da matriz
	; Saída -> Troca os elementos
	push bx
	push cx
	push dx
	push si
	push di
	ret
troca endp
main proc
	mov ax, @data
	mov ds, ax
	
	lea bx, matriz
	call le
	call nl
	call imprime

	mov ah, 4ch
	int 21h
main endp
end main
