#n mod m = ?
.data
    n: .word 6
    m: .word 4
    prompt: .asciiz " mod "
    prompt2: .asciiz " = "
.text
    main: 
        lw $t0, n #t0 = n
        lw $t1, m #t1 = m
        
        div $t0, $t1 # t0 / t1
        mfhi $t3 # load remainer to t3

        li $v0, 1 #print t0
        la $a0, ($t0)
        syscall

        li $v0, 4 #print prompt
        la $a0, prompt
        syscall

        li $v0, 1 #print t1
        la $a0, ($t1)
        syscall

        li $v0, 4 #print prompt2
        la $a0, prompt2
        syscall
        
        li $v0, 1 #print result 
        la $a0, ($t3)
        syscall

    end_loop:
        li $v0, 10
        syscall