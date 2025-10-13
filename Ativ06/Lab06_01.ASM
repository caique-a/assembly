TITLE ex01
.model small

.code
main proc
  mov ax, @data
  mov ds, ax

  xor cx, cx

  _start:
  mov ah, 1
  int 21h

  cmp al, 13
  je _end_read

  inc cx

  jmp _start

  _end_read:
  mov ah, 2
  mov dl, 13
  int 21h
  mov dl, 10
  int 21h

  _print:
  mov ah, 2
  mov dl, '*'
  int 21h

  dec cx
  jmp _print

  cmp cx, 0
  je _end

  _end:
  mov ah, 4ch
  int 21h
main endp
end main