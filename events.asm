#############################
#   EVENT HANDLER DO JOGO   #
#############################

.globl handle_keyboard_event

.text
handle_keyboard_event:
	addi sp, sp, -4 # abre espaco para uma word na pilha
	sw   ra, 0(sp)  # guarda endereco de retorno na pilha

	li t0, 0xFF200000        # carrega o endereco de controle do KDMMIO
	lw t1, 0(t0)	         # le bit de Controle Teclado
	andi t1, t1,0x0001       # mascara o bit menos significativo
   	beq t1, zero, not_moving # se nao ha tecla pressionada entao vai para FIM
   	
   	lw t2, 4(t0) # carrega a tecla pressionada
   	#sw t2, 12(t0) # joga no mmio
   	
   	addi t3, zero, 74     # se a tecla pressionada for J
   	beq t2, t3, walk_left # anda para a esquerda
   	addi t3, zero, 106    # se a tecla pressionada for j
   	beq t2, t3, walk_left # anda para a esquerda
   	
   	addi t3, zero, 76      # se a tecla pressionada for L
   	beq t2, t3, walk_right # anda para a direita
   	addi t3, zero, 108     # se a tecla pressionada for l
   	beq t2, t3, walk_right  # anda para a direita
   	
continue:
	lw   ra, 0(sp)  # retorna
    addi sp, sp, 4
	ret
   	
not_moving:
	addi t5, zero, 0            # valor para ser comparado com a sprite atual = 0
	beq s2, t5, continue        # caso o harry ja esteja parado nao sera necessario renderiza-lo novamente
	
	addi s3, s3, -1
	beq s3, zero, not_moving_for_real
	jal zero, continue
	
not_moving_for_real:
	li s3, 10000
	call restore_background # restaura o fundo antes de renderizar a proxima imagem
	add a0, zero, s0        # x = x atual
	add a1, zero, s1        # y = y atual
	
	bge s2, zero, standing_front
	call render_standing_reversed # se a sprite de movimento for < 0, printa parado invertido
	jal zero, continue # termina a leitura do teclado
	
standing_front:	call render_standing
				jal zero, continue # termina a leitura do teclado

walk_left:
	call restore_background
	addi s0, s0, -2 # anda 2 pixels para a esquerda
	
	add a0, zero, s0 # x = s0
	add a1, zero, s1 # y = s1
	
	beq s2, zero, running1_reversed
	
	addi t0, zero, -1
	beq  s2, t0, running2_reversed
	
	addi t0, zero, -2
	beq  s2, t0, running3_reversed
	
	addi t0, zero, -3
	beq  s2, t0, running4_reversed
	
	addi t0, zero, -4
	beq  s2, t0, running5_reversed
	
	addi t0, zero, -5
	beq  s2, t0, running1_reversed
	
running1_reversed:
	call render_running1_reversed
	jal zero, continue_left
running2_reversed:
	call render_running2_reversed
	jal zero, continue_left
running3_reversed:
	call render_running3_reversed
	jal zero, continue_left
running4_reversed:
	call render_running4_reversed
	jal zero, continue_left
running5_reversed:
	call render_jump_reversed
continue_left:
	jal zero, continue # termina a leitura do teclado
	
walk_right:
	call restore_background
	addi s0, s0, 2 # anda 1 pixel para a direita
	
	add a0, zero, s0 # x = s0
	add a1, zero, s1 # y = s1
	
	beq s2, zero, running1
	
	addi t0, zero, 1
	beq  s2, t0, running2
	
	addi t0, zero, 2
	beq  s2, t0, running3
	
	addi t0, zero, 3
	beq  s2, t0, running4
	
	addi t0, zero, 4
	beq  s2, t0, running5
	
	addi t0, zero, 5
	beq  s2, t0, running1
	
running1:
	call render_running1
	jal zero, continue_right
running2:
	call render_running2
	jal zero, continue_right
running3:
	call render_running3
	jal zero, continue_right
running4:
	call render_running4
	jal zero, continue_right
running5:
	call render_jump
continue_right:
	jal zero, continue # termina a leitura do teclado
	
	
	
