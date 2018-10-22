#############################
#   EVENT HANDLER DO JOGO   #
#############################

.globl handle_keyboard_event

.text
handle_keyboard_event:
	addi sp, sp, -4
	sw   ra, 0(sp)

	li t0, 0xFF200000       # carrega o endereco de controle do KDMMIO
	lw t1, 0(t0)	        # le bit de Controle Teclado
	andi t1, t1,0x0001      # mascara o bit menos significativo
   	beq t1, zero, continue  # se nao ha tecla pressionada entao vai para FIM
   	
   	lw t2, 4(t0) # carrega a tecla pressionada
   	
   	addi t3, zero, 74     # se a tecla pressionada for J
   	beq t2, t3, walk_left # anda para a esquerda
   	addi t3, zero, 106    # se a tecla pressionada for j
   	beq t2, t3, walk_left # anda para a esquerda
   	
   	addi t3, zero, 76      # se a tecla pressionada for L
   	beq t2, t3, walk_right # anda para a direita
   	addi t3, zero, 108     # se a tecla pressionada for l
   	beq t2, t3, walk_left  # anda para a direita
   	
   	continue:
   		
    
    lw   ra, 0(sp)  # retorna
    addi sp, sp, 4
	ret
	
walk_left:
	
walk_right:
	addi sp, sp, -4
	sw   ra, 0(sp)
	
	call restore_background
	addi s0, s0, 1 # anda 1 pixel para a direita
	
	add a0, zero, s0 # x = s0
	add a1, zero, s1 # y = s1
	call render_running1
	
	lw   ra, 0(sp)  # retorna
    addi sp, sp, 4
	ret
	
	
	
