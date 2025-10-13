.model small
.stack 100h

.code
main proc
  mov ax, @data
  mov ds, ax

  xor cx, cx
  xor bx, bx

  _while:
  mov ah, 1
  int 21h
  cmp al, 13
  je end_while
  shl bx, 1
  or bl, al

  loop _while

  end_while:

  mov ah, 4ch
  int 21h
main endp
end main