.data   
    a: .word 4
    b: .word 3
    new_line: .asciiz "\n"
.text
    lw $t0, a # t0 = a
    lw $t1, b # t1 = b

    li $s0, 1 #s0 = 1, (store a^b)
    li $s1, 1 #s1 = 1, (store b^a)

    li $t2, 0 #counter = 0


    for_loop:   
        bge $t2, $t1, end_for1 #if t1 > t2 -> exit
        mult $s0, $t0 #s0 * t0
        mflo $s0 #save result to s0

        addi $t2, $t2,1  #t2 += 1
        j for_loop

    end_for1:
        li $t2, 0

    for_loop2:
        bge $t2, $t0, end_for2 #if t1 > t0 -> exit
        mult $s1, $t1 #s1 * t1
        mflo $s1 #save result to s1

        addi $t2, $t2,1  #t2 += 1
        j for_loop2

    end_for2:
        bgt $s0, $s1, aa #if s0 > s1
        bge $s1, $s0, bb #if s1 >= s0

    aa:
        move $s4, $s0 #s4 = s0
        j end
    bb:
        move $s4, $s1 #s4 = s1
        j end
    end:
        li $v0, 1 #print int
        la $a0, ($s4) #load s4
        syscall

        li $v0, 10
        syscall