	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"mmm_original.c"
	.text
	.align	2
	.global	MMM
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	MMM, %function
MMM:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-44]
	and	r3, r3, #1
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L7:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-8]
	asr	r3, r2, r3
	and	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	and	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	and	r3, r3, r2
	ldr	r2, [fp, #-24]
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-44]
	b	.L4
.L3:
	mov	r3, #0
.L4:
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L5
	ldr	r3, [fp, #-48]
	b	.L6
.L5:
	mov	r3, #0
.L6:
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	blt	.L7
	b	.L8
.L9:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-48]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
.L8:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	bge	.L9
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	MMM, .-MMM
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
