	.data
	
frase: .asciiz "introduce un numero	"
resultado: .asciiz "el resultado es	"
traza: .asciiz "aqui llega"

	.text
main: 
	la $a0, frase
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	
	move $a0, $v0 #para la funcion, el argumento se guarda en $a0
	jal fibo
	
	move $s1, $v0 #muevo el valor devuelto por fibo (que esta guardado en $v0)
	
	la $a0, resultado
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
	li $v0, 10 #ejecuta salir
	syscall
	
fibo:
	ble $a0, 2, fin
	subi $sp, $sp, 32
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	add $fp, $sp, 8
	
	sw $a0, 0($fp)
	subi $a0, $a0, 1
	jal fibo
	
	sw $v0, 4($fp)
	lw $a0, 0($fp)
	subi $a0, $a0, 2
	jal fibo
	
	lw $t1, 4($fp)
	add $v0, $v0, $t1
	
	lw $fp, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 32
	jr $ra
fin:
	li $v0, 1
	jr $ra	
