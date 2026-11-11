.data
scores: .word 40, 55, 70, 85, 100
msg:    .asciiz "Total: "
nl:     .asciiz "\n"

.text
.globl main

main:
    # Step 1: Update scores[k] = V
    la   $s0, scores       # Address of scores[0]

    li   $s1, 2            # k = 3
    li   $s2, 84           # V = 46

    # Calculate address of scores[k]
    sll  $t1, $s1, 2       # k * 4
    add  $t1, $t1, $s0     # Address of scores[k]

    sw   $s2, 0($t1)       # Store V into scores[k]

    # Step 2: Add all five scores
    lw   $t0, 0($s0)       # scores[0]
    lw   $t1, 4($s0)       # scores[1]
    lw   $t2, 8($s0)       # scores[2]
    lw   $t3, 12($s0)      # scores[3]
    lw   $t4, 16($s0)      # scores[4]

    add  $s3, $t0, $t1
    add  $s3, $s3, $t2
    add  $s3, $s3, $t3
    add  $s3, $s3, $t4

    # Step 3: Print Total
    li   $v0, 4
    la   $a0, msg
    syscall

    li   $v0, 1
    add  $a0, $s3, $zero
    syscall

    # Print newline
    li   $v0, 4
    la   $a0, nl
    syscall

    # Exit
    li   $v0, 10
    syscall