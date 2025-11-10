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
	; Procedimento para trocar linha por columa em uma matriz
	; Entrada -> BX: Endereço base da matriz
	; Assume N definido como tamanho da matriz
	; Saída -> Transpõe a matriz
	push ax
	push bx
	push cx
	push dx
	push si
	push di
	push bp

	xor si, si ; linha atual
	loop_linha:
	mov di, si ; di = coluna atual (começa na linha atual)
	inc di ; pula a diagonal
	loop_coluna:
	cmp di, N ; terminou colunas
	jae fim_linha

	; calcula offset para matriz[si][di]
	mov ax, si
	mov cl, N
	mul cl ; ax = si * N
	add ax, di ; ax = si * N + di
	mov bp, ax ; bp = offset de [si][di]

	; calcula offset para matriz [di][si]
	mov ax, di
	mov cl, N
	mul cl ; ax = di * N
	add ax, si ; ax = di * N + si

	; trocar os elementos
	push bx
	add bx, bp
	mov dl, [bx] ; dl = matriz[si][di]
	pop bx

	push bx
	add bx, ax
	mov dh, [bx] ; dh = matriz[di][si]
	mov [bx], dl ; matriz[di][si] = dl
	pop bx

	push bx
	add bx, bp
	mov [bx], dh ; matriz[si][di] = dh
	pop bx

	inc di
	jmp loop_coluna

	fim_linha:
	inc si
	cmp si, N
	jb loop_linha
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
