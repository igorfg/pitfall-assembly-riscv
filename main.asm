.globl current_harry_sprite

.data
	current_harry_sprite: .word 0

.text

main:
	addi s0, zero, 0   # posicao x inicial do pitfall harry
	addi s1, zero, 125 # posicao y inicial do pitfall harry

	addi a0, zero, 0     # x = 0
	addi a1, zero, 0     # y = 0
	call render_background
	
	addi a0, zero, 0     # x = 0
	addi a1, zero, 125   # y = 0
	call render_standing
	
loop_infinito:	call handle_keyboard_event
	#li t0, 100    # cnt = 100
	#fps_cap: beq t0, zero, fps_cap_end
	#	addi t0, t0, -1 # cnt -= 1
	#	jal zero, fps_cap
	#fps_cap_end:
	
	jal zero, loop_infinito
	
	
	
	#addi a0, zero, 9     # x = 9
	#addi a1, zero, 125   # y = 0
	#call render_running1
	
	#addi a0, zero, 24    # x = 24
	#addi a1, zero, 125   # y = 0
	#call render_running2
	
	#addi a0, zero, 35    # x = 35
	#addi a1, zero, 125  # y = 0
	#call render_running3
	
	#addi a0, zero, 46    # x = 46
	#addi a1, zero, 125  # y = 0
	#call render_running4
	
	#addi a0, zero, 63    # x = 63
	#addi a1, zero, 125   # y = 0
	#call render_jump	
	
	addi a7, zero, 10    # fim
	ecall
