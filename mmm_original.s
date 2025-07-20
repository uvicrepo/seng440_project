	.arch armv7-a
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 6	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"mmm_original.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  mmm_original.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -auxbase-strip mmm_original.s -O0 -fno-builtin
@ -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
@ -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
@ -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcommon
@ -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
@ -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
@ -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fivopts -fkeep-static-consts -fleading-underscore -flifetime-dse
@ -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
@ -fplt -fprefetch-loop-arrays -freg-struct-return
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
@ -fsched-stalled-insns-dep -fsemantic-interposition -fshow-column
@ -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
@ -fssa-backprop -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls
@ -ftrapping-math -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
@ -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
@ -ftree-parallelize-loops= -ftree-phiprop -ftree-reassoc -ftree-scev-cprop
@ -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm -mbe32
@ -mglibc -mlittle-endian -mpic-data-is-text-relative -msched-prolog
@ -munaligned-access -mvectorize-with-neon-quad

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
	str	fp, [sp, #-4]!	@,
	add	fp, sp, #0	@,,
	sub	sp, sp, #52	@,,
	str	r0, [fp, #-40]	@ X, X
	str	r1, [fp, #-44]	@ Y, Y
	str	r2, [fp, #-48]	@ M, M
	str	r3, [fp, #-52]	@ m, m
@ mmm_original.c:10:     T = 0;
	mov	r3, #0	@ tmp118,
	str	r3, [fp, #-12]	@ tmp118, T
@ mmm_original.c:11:     Y0 = Y & 1;
	ldr	r3, [fp, #-44]	@ tmp120, Y
	and	r3, r3, #1	@ tmp119, tmp120,
	str	r3, [fp, #-16]	@ tmp119, Y0
@ mmm_original.c:12:     for (i = 0; i < m; i++) {
	mov	r3, #0	@ tmp121,
	str	r3, [fp, #-8]	@ tmp121, i
@ mmm_original.c:12:     for (i = 0; i < m; i++) {
	b	.L2		@
.L7:
@ mmm_original.c:13:         Xi = (X >> i) & 1;
	ldr	r2, [fp, #-40]	@ tmp122, X
	ldr	r3, [fp, #-8]	@ tmp123, i
	asr	r3, r2, r3	@ _1, tmp122, tmp123
@ mmm_original.c:13:         Xi = (X >> i) & 1;
	and	r3, r3, #1	@ tmp124, _1,
	str	r3, [fp, #-20]	@ tmp124, Xi
@ mmm_original.c:14:         T0 = T & 1;
	ldr	r3, [fp, #-12]	@ tmp126, T
	and	r3, r3, #1	@ tmp125, tmp126,
	str	r3, [fp, #-24]	@ tmp125, T0
@ mmm_original.c:15:         eta = T0 ^ (Xi & Y0);
	ldr	r2, [fp, #-20]	@ tmp127, Xi
	ldr	r3, [fp, #-16]	@ tmp128, Y0
	and	r3, r3, r2	@ _2, tmp128, tmp127
@ mmm_original.c:15:         eta = T0 ^ (Xi & Y0);
	ldr	r2, [fp, #-24]	@ tmp130, T0
	eor	r3, r3, r2	@ tmp129, _2, tmp130
	str	r3, [fp, #-28]	@ tmp129, eta
@ mmm_original.c:16:         Xi_Y = Xi ? Y : 0;
	ldr	r3, [fp, #-20]	@ tmp131, Xi
	cmp	r3, #0	@ tmp131,
	beq	.L3		@,
@ mmm_original.c:16:         Xi_Y = Xi ? Y : 0;
	ldr	r3, [fp, #-44]	@ iftmp.0_8, Y
	b	.L4		@
.L3:
@ mmm_original.c:16:         Xi_Y = Xi ? Y : 0;
	mov	r3, #0	@ iftmp.0_8,
.L4:
@ mmm_original.c:16:         Xi_Y = Xi ? Y : 0;
	str	r3, [fp, #-32]	@ iftmp.0_8, Xi_Y
@ mmm_original.c:17:         eta_M = eta ? M : 0;
	ldr	r3, [fp, #-28]	@ tmp132, eta
	cmp	r3, #0	@ tmp132,
	beq	.L5		@,
@ mmm_original.c:17:         eta_M = eta ? M : 0;
	ldr	r3, [fp, #-48]	@ iftmp.1_9, M
	b	.L6		@
.L5:
@ mmm_original.c:17:         eta_M = eta ? M : 0;
	mov	r3, #0	@ iftmp.1_9,
.L6:
@ mmm_original.c:17:         eta_M = eta ? M : 0;
	str	r3, [fp, #-36]	@ iftmp.1_9, eta_M
@ mmm_original.c:18:         T = (T + Xi_Y + eta_M) >> 1;
	ldr	r2, [fp, #-12]	@ tmp133, T
	ldr	r3, [fp, #-32]	@ tmp134, Xi_Y
	add	r2, r2, r3	@ _3, tmp133, tmp134
@ mmm_original.c:18:         T = (T + Xi_Y + eta_M) >> 1;
	ldr	r3, [fp, #-36]	@ tmp135, eta_M
	add	r3, r2, r3	@ _4, _3, tmp135
@ mmm_original.c:18:         T = (T + Xi_Y + eta_M) >> 1;
	asr	r3, r3, #1	@ tmp136, _4,
	str	r3, [fp, #-12]	@ tmp136, T
@ mmm_original.c:12:     for (i = 0; i < m; i++) {
	ldr	r3, [fp, #-8]	@ tmp138, i
	add	r3, r3, #1	@ tmp137, tmp138,
	str	r3, [fp, #-8]	@ tmp137, i
.L2:
@ mmm_original.c:12:     for (i = 0; i < m; i++) {
	ldr	r2, [fp, #-8]	@ tmp139, i
	ldr	r3, [fp, #-52]	@ tmp140, m
	cmp	r2, r3	@ tmp139, tmp140
	blt	.L7		@,
@ mmm_original.c:20:     while (T >= M)
	b	.L8		@
.L9:
@ mmm_original.c:21:         T -= M;
	ldr	r2, [fp, #-12]	@ tmp142, T
	ldr	r3, [fp, #-48]	@ tmp143, M
	sub	r3, r2, r3	@ tmp141, tmp142, tmp143
	str	r3, [fp, #-12]	@ tmp141, T
.L8:
@ mmm_original.c:20:     while (T >= M)
	ldr	r2, [fp, #-12]	@ tmp144, T
	ldr	r3, [fp, #-48]	@ tmp145, M
	cmp	r2, r3	@ tmp144, tmp145
	bge	.L9		@,
@ mmm_original.c:23:     return T;
	ldr	r3, [fp, #-12]	@ _29, T
@ mmm_original.c:24: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
	.size	MMM, .-MMM
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
