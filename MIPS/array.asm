.data
	valor: .word 1,2,3,4 #Defino array 4 palabras
	suma: .word 0 #Defino valor de variable suma
.text

main:
	move $t0,$zero # $t0&lt;-- "�ndice" con valor inicial 0
	move $t1,$zero# $t1&lt;-- "suma" con valor inicial 0
	li $t2,4 # $t2&lt;-- constante

bucle:
	mul $t3,$t0,$t2 # Multiplicamos el �ndice por 4
	lw $t4,valor($t3) # $t4 &lt;-- valor[�ndice]
	add $t1,$t1,$t4 # suma=suma+valor [�ndice]
	add $t0,$t0,1 # �ndice=�ndice+1	
	ble $t0,$t2,bucle # Repite BUCLE si �ndice&lt;4
	sw $t1,suma # Guardamos en suma el valor de $t1
	li $v0,1
	lw $a0,suma
	syscall #Hacemos la llamada al sistema