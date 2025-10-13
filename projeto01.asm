title jogo da velha
.model small
.stack 100h

.data
  tabuleiro db 0,0,0
            db 0,0,0
            db 0,0,0
  mensagemEntradaLinha db 'Insira a linha de entrada (1 - 3): $'
  mensagemEntradaColuna db 'Insira a coluna de entrada (1 - 3): $'
  mensagemPosicaoOcupada db 'Posicao ja ocupada! Tente novamente.', 13, 10, '$'
  linha db ?
  coluna db ?
  usuarioAtivo dw 0
  usuarioInativo dw 1

.code
adicionar_X proc
  push ax
  push bx
  push si

  ; calcula o offset da linha (linha * 3) e coloca em BX
  mov al, linha
  mov bl, 3
  mul bl
  mov ah, 0
  mov bx, ax

  mov al, coluna
  mov ah, 0
  mov si, ax

  mov tabuleiro[bx][si], 'X'

  pop si
  pop bx
  pop ax
  ret
adicionar_X endp
adicionar_O proc
  push ax
  push bx
  push si

  ; calcula o offset da linha (linha * 3) e coloca em BX
  mov al, linha
  mov bl, 3
  mul bl
  mov ah, 0
  mov bx, ax

  mov al, coluna
  mov ah, 0
  mov si, ax

  mov tabuleiro[bx][si], 'O'

  pop si
  pop bx
  pop ax
  ret
adicionar_O endp
nl proc
  mov ah, 2
  mov dl, 13
  int 21h
  mov dl, 10
  int 21h
  ret
nl endp
print_tabuleiro proc
  ; Guarda os valores dos registradores
  push ax
  push bx
  push cx
  push dx

  xor bx, bx ; coluna
  mov di, 3 ; numero de linhas
  
  loop_linha:
  xor si, si
  mov cx, 3 ; numero de elementos da linha

  loop_coluna:
  mov dl, tabuleiro[bx][si]
  cmp dl, 'O'
  je letra
  cmp dl, 'X'
  je letra
  add dl, 30h
  mov ah, 2
  int 21h
  jmp continua_print

  letra:
  mov ah, 2
  int 21h

  continua_print:
  mov dl, ' '
  int 21h
  inc si
  loop loop_coluna

  call nl
  
  add bx, 3
  dec di
  jnz loop_linha
  
  pop dx
  pop cx
  pop bx
  pop ax
  ret
print_tabuleiro endp
main proc
  mov ax, @data ; Inicializa segmento de dados
  mov ds, ax

  ; Ciclo de jogo principal, entra linha/coluna coloca símbolo correto, verifica vitória ou empate
  main_loop:
  call print_tabuleiro

  call nl

  lea dx, mensagemEntradaLinha
  mov ah, 9
  int 21h

  mov ah, 1
  int 21h
  mov linha, al

  call nl

  lea dx, mensagemEntradaColuna
  mov ah, 9
  int 21h

  mov ah, 1
  int 21h
  mov coluna, al

  call nl

  and linha, 0Fh
  and coluna, 0Fh

  dec linha
  dec coluna

  ; Verifica se a posicao ja esta ocupada
  push ax
  push bx
  push si

  mov al, linha
  mov bl, 3
  mul bl
  mov ah, 0
  mov bx, ax

  mov al, coluna
  mov ah, 0
  mov si, ax

  mov al, tabuleiro[bx][si]
  cmp al, 0

  pop si
  pop bx
  pop ax

  jne entrada_invalida

  ; Adiciona X ou O na matriz
  cmp usuarioAtivo, 0
  je adiciona_X

  call adicionar_O
  jmp continua

  adiciona_X:
  call adicionar_X

  continua:
  ; Troca o usuário ativo
  push usuarioAtivo
  push usuarioInativo
  pop usuarioAtivo
  pop usuarioInativo

  ; Verifica se alguem ganhou, se X ganhou, ax = 1, se O ganhou, ax = 2, se ninguém ganhou, ax = 0

  ; Verifica se empatou

  jmp main_loop

  entrada_invalida:
  lea dx, mensagemPosicaoOcupada
  mov ah, 9
  int 21h
  jmp main_loop

  mov ah, 4ch ; Fim do programa
  int 21h
main endp
end main