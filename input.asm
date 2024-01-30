#input a string, print that string
.data   
    prompt: .asciiz "Ur input here: "
    prompt2: .asciiz "Ur output here: "
    buffer: .space 1
.text
    li $v0, 4 #print string
    la $a0, prompt #load prompt to print
    syscall

    li $v0,8 #read string
    la $a0, buffer #load byte space into address
    li $a1, 20 # set max space for a1 MUST BE A1
    move $t0,$a0 #save string to t0
    syscall

    li $v0, 4 #print string
    la $a0, prompt2 #load prompt2 to print
    syscall

    li $v0, 4 #print string
    la $a0, ($t0) #load t0 to print
    syscall

    j end_loop #jump to end_loop

    end_loop: 
        li $v0, 10 #exit
        syscall