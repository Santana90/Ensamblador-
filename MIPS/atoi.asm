.data
cad: .space 1024

.text

main:	li $v0,8
	la $a0,cad
	li $a1,1024
	syscall
	
	li $t0,0 #carga un 0
	lb $t1,cad($t0)# primer caracter en t1
	li $t2,0 #carga un 0
	
bucle:	beq $t1, '\n',salir
	mul $t2,$t2,10 # t2 = num*10
	sub $t3,$t1,'0' #t3 = nextchar - "0"
	add $t2,$t2,$t3 #t2 + t3
	addi $t0,$t0,1 #t0 +1
	lb $t1,cad($t0)
	b bucle
	
salir: li $v0,1
	move $a0,$t2 # paso a a0 mi resultado que esta en t2
	syscall
	
	li $v0,10
	syscall
