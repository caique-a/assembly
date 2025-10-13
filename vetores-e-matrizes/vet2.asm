; soma todos os elementos de um vetor em ax
.model small

.data
  vec dw 1,2,3,4,5,6,7,8,9,10

.code
main proc
  mov ax, @data
  mov ds, ax

  mov cx, 10
  xor ax, ax

  xor si, si

  acumula:
  add ax, vec[si]
  add si, 2
  loop acumula
  
  mov ah, 4ch
  int 21h
main endp
end main