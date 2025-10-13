; Conta a quantidade de elementos impares e pares em um vetor
.model small
.data
  vec dw 0,1,2,3,4,5,6,7,8,9

.code
main proc
  mov ax, @data
  mov ds, ax

  xor ax, ax
  xor bx, bx

  mov cx, 10
  xor si, si

  _loop:

  mov dx, vec[si]
  add si, 2

  and dx, 1
  jz par
  jmp impar

  par:
  inc ax
  jmp continue
  impar:
  inc bx

  continue:
  loop _loop

  mov ah, 4ch
  int 21h
main endp
end main