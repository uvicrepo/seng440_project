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
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #68
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	str	r2, [fp, #-64]
	str	r3, [fp, #-68]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-60]
	and	r3, r3, #1
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-12]
	asr	r3, r2, r3
	and	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	and	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	and	r3, r3, r2
	ldr	r2, [fp, #-24]
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-32]
	and	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #0
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-40]
	and	r3, r3, r2
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	blt	.L3
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	movge	r3, #1
	movlt	r3, #0
	uxtb	r3, r3
	rsb	r3, r3, #0
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-48]
	and	r3, r3, r2
	ldr	r2, [fp, #-8]
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	movge	r3, #1
	movlt	r3, #0
	uxtb	r3, r3
	rsb	r3, r3, #0
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-52]
	and	r3, r3, r2
	ldr	r2, [fp, #-8]
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	MMM, .-MMM
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
