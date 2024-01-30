# print an array includes n element, a[0] = start_v, distance = 1
.data
    array: .space 100     # Dãy có thể chứa tối đa 100 phần tử
    start_v: .word 5 #a[0]
    n: .word 10
    space: .asciiz " "
.text
    main:
        addi $s0, $zero, 0 #s0 = 0 + 0
        lw $t0, n #load word t0 = n
        lw $t1, start_v #load word t1 = start_v

        jal for_loop #jump to for_loop

    for_loop:
        bge $s0, $t0, end_loop #if so >= t0, end_loop

        li $v0, 1 #print int
        la $a0, ($t1) #load t1 to print
        syscall

        li $v0, 4 #print string 
        la $a0, space #load space to print
        syscall

        addi $t1, $t1, 1 #t1 += 1
        addi $s0, $s0, 1 #s0 += 1

        j for_loop

    end_loop:
        li $v0, 10
        syscall

    
