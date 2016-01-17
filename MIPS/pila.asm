.data
	str: .asciiz "introduce nodo : "
	espacio: .asciiz "\n"
	hagopop: .asciiz "despues del pop:\n"
.text	
main:
	la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	jal create
	
	move $s0, $v0 #punter al primer nodo en $s0(ultimo que meto)
	move $a0, $s0
	jal print
	li $t0,1
bucle:
	bne $t0, 4,continuar
	move $a0, $s0
	jal pop
	
	la $a0, hagopop
	li $v0, 4
	syscall
	
	
	move $a0, $s0
	jal print

	li $v0, 10
	syscall
continuar:
	la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $s0
	move $a1, $v0
	jal push
	move $a0, $s0
	jal print
	addi $t0, $t0,1
	j bucle

push:
	subu $sp, $sp, 32
	sw $ra, 20($sp)
	sw $fp, 16($sp)
	addiu $fp, $sp, 28
	sw $a0, 0($fp)
	sw $a1, -4($fp)
	
	lw $a0, -4($fp)
	jal create
	
	lw $a0, 0($fp)
	sw $a0, 4($v0)
	move $s0, $v0
	
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addiu $sp, $sp, 32
	jr $ra

pop:
	subu $sp, $sp, 32
	sw $ra, 20($sp)
	sw $fp, 16($sp)
	addiu $fp, $sp, 28
	sw $a0, 0($fp)
	
	lw $a0, 0($fp)
	lw $a1, 4($a0)
	move $s0, $a1
	move $v0, $a0
	
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addiu $sp, $sp, 32
	jr $ra
	
	
	
		
create:
	subu $sp, $sp, 32
	sw $ra, 20($sp)
	sw $fp, 16($sp)
	addiu $fp, $sp, 28
	sw $a0, 0($fp)
	
	li $a0, 8
	li $a1, 0
	li $v0, 9
	syscall
	
	lw $a0, 0($fp)
	sw $a0, 0($v0)
	sw $a1, 4($v0)
	
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addiu $sp, $sp, 32
	jr $ra
	

print:
	subu $sp, $sp, 32
	sw $ra, 20($sp)
	sw $fp, 16($sp)
	addiu $fp, $sp, 28
	sw $a0, 0($fp)
	
	lw $a0, 0($fp)
	lw $a0, 4($a0)
	beqz $a0, pintar
	jal print
	
pintar:
	lw $a0, 0($fp)
	lw $a0, 0($a0)
	li $v0,1
	syscall
	
	la $a0, espacio
	li $v0,4
	syscall
	
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addiu $sp, $sp, 32
	jr $ra
	
