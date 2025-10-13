.model small
.stack 100h

.code
_add proc
  ; Adiciona 2 números
  ; Entradas AX, BX
  ; Saída DX
  mov dx, ax
  add dx, bx
  ret
_add endp
max proc
  ; Define o maior entre AX e BX para DX
  cmp ax, bx
  jg _if
  jmp _else
  ; Se ax > bx, dx = ax
  _if:
  mov dx, ax
  jmp _end
  ; Else, dx = bx
  _else:
  mov dx, bx
  _end:
  ret
max endp
fact proc
  ; Faz fatorial de AX, substitui AX
  push cx
  push dx
  mov cx, ax
  dec cx
  _fact:
  mul cx
  loop _fact
  pop cx
  ret
fact endp
main proc
  mov ax, 10
  mov bx, 10
  call _add
  call max
  call fact
  mov ah, 4ch
  int 21h
main endp
end main