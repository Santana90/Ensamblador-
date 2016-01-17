.data
	str: .asciiz "introduce nodo : "
	espacio: .asciiz "\n"
.text
	la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	li $a1, 0
	jal create
	
	move $s0, $v0 #apunta al primer nodo de la lista
	move $s1, $v0 #s1 apunta al ultimo nodo de la lista
	
bucle:
	la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	bnez $v0,insertar
	move $a0,$s0
	jal print
	li $v0,10
	syscall
	
insertar:
	move $a0, $s1
	move $a1, $v0
	jal insert
	move $s1, $v0
	j bucle
	
insert:
	subu $sp, $sp, 32
	sw $ra, 20($sp)
	sw $fp, 16($sp)
	addiu $fp, $sp, 28
	sw $a0, 0($fp)
	sw $a1, -4($fp)
	
	lw $a0, -4($fp)
	li $a1, 0
	jal create
	
	lw $a0, 0($fp)
	sw $v0, 4($a0)
	
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
	li $v0,9
	syscall
	
	lw $a0, 0($fp)
	sw $a0, 0($v0)
	sw $a1, 4($v0)
	
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addiu $sp, $sp,32
	jr $ra
	
print:
	subu $sp, $sp, 32
	sw $ra, 20($sp)
	sw $fp, 16($sp)
	addiu $fp, $sp, 28
	sw $a0, 0($fp)
	
	lw $a0, 0($fp)
	lw $a0, 4($a0)
	beqz $a0, pinto
	jal print
pinto:
	lw $a0, 0($fp)
	lw $a0, 0($a0)
	li $v0, 1
	syscall
	
	la $a0, espacio
	li $v0,4
	syscall
	
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addiu $sp, $sp, 32
	jr $ra
