    .global MMM_asm
    .text


MMM_asm:
    PUSH    {r4-r12, lr}      @ save callee-saved registers

    MOV     r4, r0            @ r4 = X
    MOV     r5, r1            @ r5 = Y
    MOV     r6, r2            @ r6 = M
    MOV     r7, r3            @ r7 = m

    MOV     r8, #0            @ T = 0
    AND     r9, r5, #1        @ Y0 = Y & 1
    MOV     r10, #0           @ i = 0

loop_start:
    CMP     r10, r7
    BGE     loop_end

    @ Xi = (X >> i) & 1
    MOV     r11, r4
    LSR     r11, r11, r10
    AND     r11, r11, #1      @ r11 = Xi

    @ T0 = T & 1
    AND     r12, r8, #1       @ r12 = T0

    @ eta = T0 ^ (Xi & Y0)
    AND     r1, r11, r9       @ r1 = Xi & Y0
    EOR     r1, r12, r1       @ r1 = eta

    @ Xi_Y = Xi ? Y : 0 → r2
    RSB     r3, r11, #0       @ r3 = -Xi
    AND     r2, r5, r3        @ r2 = Xi_Y = Y & (-Xi)

    @ eta_M = eta ? M : 0 → r3
    RSB     r3, r1, #0        @ r3 = -eta
    AND     r3, r6, r3        @ r3 = eta_M = M & (-eta)

    @ T = (T + Xi_Y + eta_M) >> 1
    ADD     r8, r8, r2
    ADD     r8, r8, r3
    LSR     r8, r8, #1

    ADD     r10, r10, #1      @ i++
    B       loop_start

loop_end:
    @ while (T >= M) T -= M
check_reduce:
    CMP     r8, r6
    BLT     done
    SUB     r8, r8, r6
    B       check_reduce

done:
    MOV     r0, r8            @ return value in r0
    POP     {r4-r12, pc}
