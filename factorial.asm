#n! = ?
.data   
    prompt: .asciiz "Ur input here: "
    prompt2: .asciiz "Ur output here: "
    n: .word 5
    new_line: .asciiz "\n"
.text
    lw $s1, n # s1 = n

    addi $s2, $zero, 1 #result 

    j for_loop

    for_loop:
        blt $s1, 1, end_loop #if s1 < 1 -> exit

        mul $s2, $s2, $s1 #s2 *= s1

        addi $s1, $s1, -1 # s1 -= 1
        j for_loop 

    end_loop:
        li $v0, 4 #print string
        la $a0, prompt2
        syscall

        li $v0, 1 #print value
        la $a0, ($s2)
        syscall

        li $v0, 10
        syscall