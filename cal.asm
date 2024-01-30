#a+b = ?
.data   
    a: .word 5
    b: .word 7
.text
    lw $s0, a #load word s0 = a
    lw $s1, b #load word s1 = b

    add $s0, $s1, $s0 #s0 = s1 + s0

    li $v0, 1 #print int
    la $a0, ($s0) #load s0 to print
    syscall

    j end_loop

    end_loop:
        li $v0, 10
        syscall