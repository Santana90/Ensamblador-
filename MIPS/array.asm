.data
	valor: .word 1,2,3,4 #Defino array 4 palabras
	suma: .word 0 #Defino valor de variable suma
.text

main:
	move $t0,$zero # $t0&lt;-- "índice" con valor inicial 0
	move $t1,$zero# $t1&lt;-- "suma" con valor inicial 0
	li $t2,4 # $t2&lt;-- constante

bucle:
	mul $t3,$t0,$t2 # Multiplicamos el índice por 4
	lw $t4,valor($t3) # $t4 &lt;-- valor[índice]
	add $t1,$t1,$t4 # suma=suma+valor [índice]
	add $t0,$t0,1 # índice=índice+1	
	ble $t0,$t2,bucle # Repite BUCLE si índice&lt;4
	sw $t1,suma # Guardamos en suma el valor de $t1
	li $v0,1
	lw $a0,suma
	syscall #Hacemos la llamada al sistema