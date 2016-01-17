	.data
str: .asciiz "introduce un numero: "
str2: .asciiz "El resultado es:"
	.text
main:
	la $a0,str
	li $v0,4
	syscall
	
	li $v0,5 
	syscall
	move $a1,$v0
	
	la $a0,str
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $a2,$v0
	
	la $a0,str2
	li $v0,4
	syscall
	#hay que mover luego a a0 si lo hago antes me imprime el valor de la direccion de momemorai del string 
	add $a0,$a1,$a2
	li $v0,1
	syscall
	
	li $v0,10
	syscall
		