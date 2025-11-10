.model small

.data
    N equ 4
    mat1 db N dup(N dup(?))
    mat2 db N dup(N dup(?))
	matsoma db N dup(N dup(?))

nl macro
    push ax
    push dx
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    pop dx
    pop ax
endm

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
    nl
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
    nl
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
somar proc
	; Procedimento para somar 2 matrizes definidas na memória
	; Entrada -> mat1, mat2 e matsoma definidas na memória
	; Saída -> Guarda a soma de mat1 e mat2 em matsoma
	push ax
	push bx
	push cx
	push dx
	mov ch, N
	xor bx, bx
	L5:
	xor si, si
	mov cl, N
	L6:
	mov dl, mat1[bx][si]
	add dl, mat2[bx][si]
	mov matsoma[bx][si], dl
	inc si
	dec cl
	jnz L6
	add bx, N
	dec ch
	jnz L5
	pop si
	pop cx
	pop bx
	pop ax
	ret
somar endp
main proc
    mov ax, @data
    mov ds, ax

    lea bx, mat1
    call ler
    nl
    lea bx, mat2
    call ler

    nl

	call somar

	lea bx, matsoma
	call imprime

    mov ah, 4ch
    int 21h
main endp
end main