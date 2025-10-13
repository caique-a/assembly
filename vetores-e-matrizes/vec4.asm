; Inverte um vetor
.model small
.stack 100h

.data
  vec dw 0,1,2,3,4,5,6,7,8,9

.code
print proc
  xor si, si
  mov cx, 10
  _loop:
  mov ah, 2
  mov dx, vec[si]
  add si, 2
  add dl, 30h
  int 21h
  mov dl, ' '
  int 21h
  loop _loop

  ret
print endp
main proc
  mov ax, @data
  mov ds, ax

  call print

  mov cx, 5
  ; Utiliza um metodo com 2 ponteiros, si e bx
  xor si, si ; Começa em 0
  mov bx, 18 ; Começa no fim no vetor
  inverte:
  push vec[si]
  push vec[bx]

  pop vec[si]
  pop vec[bx]

  add si, 2
  sub bx, 2
  loop inverte

  mov ah, 2
  mov dl, 13
  int 21h
  mov dl, 10
  int 21h

  call print

  mov ah, 4ch
  int 21h
main endp
end main