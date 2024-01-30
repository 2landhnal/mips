# print an array includes n element, a[0] = start_num, distance = dis 
.data   
    n: .word 10
    start_num: .word 20
    space: .asciiz " "
.text
    main:
        lw $s1, n #size of arr

        addi $s0, $zero, 0 #start counter
        addi $s3, $zero, 1 #dis

        lw $s2, start_num #first value
        

        j for_loop
    
    for_loop:
        bgt $s0, $s1, end_loop #if s0 > s1, end

        li $v0, 1 #print int
        la $a0, ($s2) #load s2 to print
        syscall

        li $v0, 4 #print string
        la $a0, space #load space to print
        syscall

        add $s2, $s2, $s3 #s2 += s3
        addi $s0, $s0, 1 #s0 += 1

        j for_loop

    end_loop:
        li $v0, 10
        syscall