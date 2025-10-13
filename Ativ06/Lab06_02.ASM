title ex02
.model small

.code
main proc
  xor cx, cx

  mov ah, 1
  int 21h

  cmp al, 13
  je end_read

  _end_read:
  mov ah, 2
  mov dl, 13
  int 21h
  mov dl, 10
  int 21h

  mov ah, 2
  mov dl, '*'
  int 21h

  _end:
  mov ah, 4ch
  int 21h
main endp
end main