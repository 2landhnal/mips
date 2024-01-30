#input an array includes n elements, print out max value
.data   
    prompt: .asciiz "Ur input here: "
    prompt2: .asciiz "Ur output here: "
    n: .word 4
    new_line: .asciiz "\n"
.text
    lw $s1, n # s1 = size

    addi $s0, $zero, 0 #s0 = 0 (counter)
    addi $s2, $zero, -100000 #s2 = -∞ (holder)

    j for_loop

    for_loop:
        bgt $s0, $s1, end_loop #if s0 > s1 -> exit

        li $v0, 4 #print prompt
        la $a0, prompt #la prompt
        syscall

        li $v0, 5 #require integer input
        syscall
        move $a1, $v0 # move integer just input into $a1: $a1 = $v0

        addi $s0, $s0, 1 # counter += 1

        bge $s2, $a1, for_loop # if s2 >= a1, loop again

        addi $s2, $a1, 0 #set new max value: s2 = a1
        j for_loop

    end_loop:
        li $v0, 4 #print string
        la $a0, prompt2
        syscall

        li $v0, 1 #print max value
        la $a0, ($s2)
        syscall

        li $v0, 10
        syscall