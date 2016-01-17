.data
cad: .space 1024
desbordamiento: .asciiz "Desbordamiento"
.text

main:	li $v0,8
	la $a0,cad
	li $a1,1024
	syscall
	
	lb $t4,cad
	
	beq $t4,'-', negativo
	addi $t5,$zero,1
	b atoi
	
negativo: addi $t5, $zero,-1
	b atoi
	
atoi:	li $t3,0
	
	li $t0,1
	lb $t1,cad($t0)
bucle:	blt $t1, '0',salir
	bgt $t1, '9',salir
	mul $t3,$t3,10
	mfhi $t2 #mayor que cero 
	bgtz $t2, desb
	sub $t6,$t1,'0'
	add $t3,$t3,$t6
	bltz $t3, desb #menor que cero 
	addi $t0,$t0,1
	lb $t1,cad($t0)
	b bucle

desb:	li $v0,4
	la $a0,desbordamiento
	syscall
	li $v0,10
	syscall
	
salir: mul $t3,$t3,$t5

	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,10
	syscall
