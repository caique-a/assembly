.model small
.stack 100h
.code
espelhar proc
	; Procedimento que espelha um byte
	; Entrada -> BL: Byte a ser espelhado
	; Saida -> BL: Byte espelhado
	push ax
	push cx
	mov cx, 8
	loop_espelho:
	rcl bl, 1
	rcr ah, 1
	loop loop_espelho
	mov bl, ah
	pop dx
	pop ax
	ret
espelhar endp
main proc
	mov bl, 10101010b
	call espelhar
	mov ah, 4ch
	int 21h
main endp
end main
