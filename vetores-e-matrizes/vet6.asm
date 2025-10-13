.model small
.stack 100h

.data
  vec1 dw 0,1,2,3,4,5,6,7,8,9
  vec2 dw 9,8,7,6,5,4,3,2,1,0
  res dw 10 dup(?)

.code
main proc
  mov ax, @data
  mov ds, ax

  mov cx, 10
  xor si, si

  dot:
  mov ax, vec1[si]
  mul vec2[si]
  mov res[si], ax
  add si, 2
  loop dot

  mov ah, 4ch
  int 21h
main endp
end main