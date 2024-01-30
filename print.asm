#just print a string
.data
    c: .asciiz "hihi"
.text
    li $v0, 4 #print string
    la $a0, c #load c to print
    syscall

    j end_loop #jump to end_loop

    end_loop:
        li $v0, 10
        syscall