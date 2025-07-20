	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"mmm_optimized.c"
	.text
	.align	2
	.global	MMM
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	MMM, %function
MMM:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	ble	.L4
	mov	r4, #0
	mov	r5, r4
.L3:
	asr	ip, r0, r4
	and	ip, ip, #1
	and	lr, r1, ip
	and	r6, r5, #1
	rsb	ip, ip, #0
	eor	lr, lr, r6
	and	ip, ip, r1
	rsb	lr, lr, #0
	add	ip, ip, r5
	add	r4, r4, #1
	and	lr, lr, r2
	add	ip, lr, ip
	cmp	r3, r4
	asr	r5, ip, #1
	bne	.L3
.L2:
	cmp	r2, r5
	movle	ip, r2
	movgt	ip, #0
	sub	ip, r5, ip
	cmp	r2, ip
	movgt	r2, #0
	sub	r0, ip, r2
	pop	{r4, r5, r6, pc}
.L4:
	mov	r5, #0
	b	.L2
	.size	MMM, .-MMM
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
