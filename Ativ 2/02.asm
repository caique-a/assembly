TITLE 02
.model small

.data
  msg db 'ola bem vindo',13,10,'$'

.code
main proc
  mov ax, @data
  mov ds, ax
  
  mov ah, 09
  mov dx, offset msg
  int 21h

  mov ah, 4Ch
  int 21h
main endp
end main