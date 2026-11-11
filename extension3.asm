.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main

main:
    la   $s0, board       # $s0 = base address of board

    # Store 1 (X) at row 1, column 2
    li   $s1, 1           # r = 1
    li   $s2, 2           # c = 2

    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c
    sll  $t0, $t0, 2      # $t0 = 4 * (3*r + c)
    add  $t0, $t0, $s0    # Address of board[r][c]

    li   $t1, 1           # Value = 1 (X)
    sw   $t1, 0($t0)      # Store 1

    # Store 2 (O) at row 2, column 0
    li   $s1, 2           # r = 2
    li   $s2, 0           # c = 0

    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c
    sll  $t0, $t0, 2      # $t0 = 4 * (3*r + c)
    add  $t0, $t0, $s0    # Address of board[r][c]

    li   $t1, 2           # Value = 2 (O)
    sw   $t1, 0($t0)      # Store 2

    # Exit program
    li   $v0, 10
    syscall