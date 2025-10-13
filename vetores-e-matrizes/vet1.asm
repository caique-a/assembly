; Inicializa um vetor com valores de 1 até n
.model small

.data
  tam db 10
  vec dw 10 dup(?)

.code
main proc
  mov ax, @data
  mov ds, ax

  mov si, 0
  xor ch, ch
  mov cl, tam
  mov bx, 1
  inicializa:
  mov vec[si], bx 
  add si, 2
  inc bx
  loop inicializa
  
  mov ah, 4ch
  int 21h
main endp
end main