.model small
.stack 100h
.data
	N equ 4
	matriz db N dup (N dup(?))

.code
ler proc
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
ler endp
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
	; Procedimento para trocar linha por coluna em uma matriz
	; Entrada -> BX: Endereço base da matriz
	; Saída -> Altera a matriz na memória
	push ax
	push bx
	push cx
	push dx
	push si
	push di

	mov ch, N
	mov cl, N

	shr ch, 1
	shr cl, 1

	xor bp, bp ; linha atual

	loop_linha:
	mov si, bp ; coluna atual
	loop_coluna:
	mov al, matriz[bp][si]
	mov ah, matriz[si][bp]
	mov matriz[bp][si], ah
	mov matriz[si][bp], al
	inc si

	dec ch
	jnz loop_coluna
	add di, N
	inc di

	dec cl
	jnz loop_linha

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
troca endp
main proc
	mov ax, @data
	mov ds, ax
	
	lea bx, matriz
	call ler
	call nl
	call imprime
	call nl
	call troca
	call imprime

	mov ah, 4ch
	int 21h
main endp
end main
