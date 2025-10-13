.model small
.stack 100h

.data
  linhas equ 4
  colunas equ 4
  matriz db linhas dup(colunas dup(?))
  nl db 13,10,'$'

.code
print_matriz proc
  xor bx, bx ; coluna
  mov di, 4 ; numero de linhas
  
  loop_linha:
  xor si, si
  mov cx, 4 ; numero de elementos da linha

  loop_coluna:
  mov dl, matriz[bx][si]
  or dl, 30h
  mov ah, 2
  int 21h
  inc si
  loop loop_coluna
  
  lea dx, nl
  mov ah, 9
  int 21h
  
  add bx, 4
  dec di
  jnz loop_linha
  
  ret
print_matriz endp
main proc
  mov ax, @data
  mov ds, ax

  call print_matriz

  mov di, 4
  xor bx, bx
  
  _loop_linha:
  xor si, si
  mov cx, 4

  _loop_coluna:
  mov matriz[bx][si], 1
  inc si
  loop _loop_coluna
  
  lea dx, nl
  mov ah, 9
  int 21h

  add bx, 4
  dec di
  jnz _loop_linha

  call print_matriz
  
  mov ah, 4ch
  int 21h
main endp
end main