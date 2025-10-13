; Guarda o menor elemento de um vetor em ax e o maior em bx
.model small

.data 
  vec dw 4,3,10,56,1,8,8

.code
main proc
  mov ax, @data
  mov ds, ax

  xor si, si
  mov cx, 7
  ; Define tanto o minimo quanto o maximo para serem o primeiro elemento do vetor
  mov ax, vec[si]
  mov bx, vec[si]

  minmax:
  mov dx, vec[si]
  cmp dx, ax
  jl min
  cmp dx, bx
  jg max
  jmp continue

  min:
  mov ax, dx
  jmp continue

  max:
  mov bx, dx

  continue:
  add si, 2
  
  loop minmax
  
  mov ah, 4ch
  int 21h
main endp
end main