.model small
.data
  matriz db 1,2,3,4
         db 5,6,7,8
         db 5,2,1,3
  nmatriz db 13,10,'A matriz = ',13,10,'$'
  pula_linha db 13,10,'$'

.code
main proc
  mov ax, @data
  mov ds, ax

  xor ax, ax ; inicializa ax com 0
  xor si, si ; indexador de coluna
  mov bx, 8 ; primeiro elemento da linha 3
  mov cx, 4 ; numero de elementos da linha

  ; Esse loop zera a terceira linha
  linha1:
  mov matriz[bx][si], 0
  inc si
  loop linha1

  lea dx, nmatriz
  mov ah, 9
  int 21h

  mov bx, 0 ; indexador de coluna
  mov di, 3 ; numero de linhas

  linha2:
  xor si, si
  mov cx, 4 ; numero de elementos da linha

  linha3:
  mov dl, matriz[bx][si] ; carrega zero em dx
  or dl, 30h ; converte para caractere
  mov ah, 2
  int 21h
  inc si
  loop linha3

  lea dx, pula_linha
  mov ah, 9
  int 21h
  add bx, 4
  dec di
  jnz linha2

  mov ah, 4ch
  int 21h
main endp
end main