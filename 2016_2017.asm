# 1!+ 3! +... +(2n-1)! = ?
.data   
    prompt: .asciiz "!= "
    n: .word 5
    new_line: .asciiz "\n"
.text
    lw $t0, n # t0 = n
    sll $t0, $t0, 1 #t0 *= 2
    addi $t0, $t0, -1 #t0 -= 1

    addi $t1, $zero, 1 #t1 = 1
    
    addi $s0, $zero, 0 #result = 0

    j for_loop

    for_loop:
        bgt $t1, $t0, end_loop #if t1 > t0 -> exit
        addi $t2, $zero , 1 #t2 = 1
        addi $s1, $t1, 0 #s1 = t1
        jal factorial
        add $s0, $s0, $t2 #t2 = result of factorial, s0 += t2
        add $t1, $t1, 2 #t1 += t3
        j for_loop

    factorial:
        blt $s1, 1, end_fac #if s1 < 1 -> exit

        mul $t2, $t2, $s1 #t2 *= s1

        addi $s1, $s1, -1 # s1 -= 1
        j factorial 

    end_fac:
        jr $ra #jump to return address

    end_loop:
        li $v0, 1 #print int
        lw $a0, n #a0 = n
        syscall

        li $v0, 4 #print string
        la $a0, prompt
        syscall

        li $v0, 1 #print value
        la $a0, ($s0)
        syscall

        li $v0, 10
        syscall