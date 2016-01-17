.data

cad: .space 1024
pal: .asciiz "Palindromo"
nopal: .asciiz "Nopal"

.text

main:	li $v0,8
	la $a0,cad
	li $a1,1024
	syscall
	
	#puntero principio
	li $t0,0
	#puntero final
	li $t1,0
	lb $t2,cad($t1)

bucle:	beqz $t2, fin
	addi $t1,$t1,1
	lb $t2,cad($t1)
	b bucle

fin:	addi $t1,$t1,-2

	lb $t2,cad($t0)
	lb $t3,cad($t1)
	
compara: bne $t2,$t3,nopali
 	ble $t1, $t0, pali
	sub $t1,$t1,1
	addi $t0,$t0,1
	lb $t2,cad($t0)
	lb $t3,cad($t1)
	b compara
	
nopali:	li $v0,4
	la $a0,nopal
	syscall
	b salir
	
pali: 	li $v0,4
	la $a0,pal
	syscall
	b salir
	
salir: li $v0,10
	syscall
