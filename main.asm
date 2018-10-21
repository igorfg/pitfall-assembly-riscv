.text

main:
	addi a0, zero, 0     # x = 0
	addi a1, zero, 0     # y = 0
	call render_standing
	
	addi a0, zero, 9     # x = 9
	addi a1, zero, 0     # y = 0
	call render_running1
	
	addi a0, zero, 24    # x = 24
	addi a1, zero, 0     # y = 0
	call render_running2
	
	addi a0, zero, 35    # x = 35
	addi a1, zero, 0     # y = 0
	call render_running3
	
	addi a0, zero, 46    # x = 46
	addi a1, zero, 0     # y = 0
	call render_running4
	
	addi a0, zero, 63    # x = 63
	addi a1, zero, 0     # y = 0
	call render_jump
	
	
	
	addi a7, zero, 10    # fim
	ecall