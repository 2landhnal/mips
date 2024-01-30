# 1!+ 3! +... +(2n-1)! = ?
.data   
    prompt: .asciiz "Result: "
    n: .word 7
    new_line: .asciiz "\n"
.text
    lw $t0, n #t0 = n
    li $t1, 2 #t1 = 2
    
    div $t0, $t1 # t0 / 2
    mfhi $t2 # load remainer to t2 (t2 = t0 mod 2)

    li $s0, 0 # result = 0
    li $t1, 0 # tmp = 0

    beq $t2, 0, even #if t2 = 0
    beq $t2, 1, odd #if t2 = 1

    even:
        add $t0, $t0, $t0 #t0 += t0
        j for_loop
    odd:
        add $t0, $t0, -1 #t0 -= 1
        add $t0, $t0, $t0 #t0 += t0
        j for_loop
        
    for_loop:
        bgt $t1, $t0, end_loop #t1 > t0 -> end
        add $s0, $s0, $t1 #result += t1
        addi $t1, $t1, 2 #t1 += 2
        j for_loop

    end_loop:
        li $v0, 1
        la $a0, ($s0)
        syscall 

        li $v0, 10
        syscall