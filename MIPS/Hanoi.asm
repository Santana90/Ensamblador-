	.data
mover: .asciiz " Se mueve el disco  "
de: .asciiz	" de la varilla  "
hasta: .asciiz " a la varilla  "
enter: .asciiz ".\n"
texto: .asciiz "Introduce el numero de discos (1-8)> "

		.text
main:	
	la $a0 texto
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	move $a0 $v0 	#n
	li $a1 1	#start
	li $a2 2	#finish
	li $a3 3	#extra
	jal hanoi
	
	li $v0 10
	syscall
	
hanoi: 	
	beqz $a0 finhanoi
	subi $sp $sp 32
	sw $ra 0($sp)
	sw $fp 4($sp)
	addi $fp $sp 28
	
	sw $a0 0($fp)	#n
	sw $a1 -4($fp)	#start
	sw $a2 -8($fp)	#finish
	sw $a3 -12($fp)	#extra
	
	# hanoi (n-1, start extra finish)
	sub $a0 $a0 1
	#lw $a1 4($fp)	#start
	
	lw $a1 -4($fp)	#finish
	lw $a2 -12($fp)	#extra
	lw $a3 -8($fp)	#extra
	jal hanoi
	
	la $a0 mover
	li $v0 4
	syscall
	
	lw $a0 0($fp)	#n
	li $v0 1
	syscall
	
	la $a0 de
	li $v0 4
	syscall
	
	lw $a0 -4($fp)	#start
	li $v0 1
	syscall
	
	la $a0 hasta
	li $v0 4
	syscall
	
	lw $a0 -8($fp)	#finish
	li $v0 1
	syscall
	
	la $a0 enter
	li $v0 4
	syscall
	
	# hanoi (n-1, extra finsh start)
	lw $a0 0($fp)	#n
	lw $a1 -8($fp)	#extra
	lw $a2 -12($fp)	#finish
	lw $a3 -4($fp)	#start

	
	sub $a0 $a0 1
	jal hanoi
	
	lw $ra 0($sp)
	lw $fp 4($sp)

	add $sp $sp 32
finhanoi:
	jr $ra
