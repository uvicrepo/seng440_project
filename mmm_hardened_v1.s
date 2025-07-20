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
	.file	"mmm_hardened.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  mmm_hardened.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -auxbase-strip mmm_hardened.s -O0 -fno-builtin
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
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!	@,
	add	fp, sp, #0	@,,
	sub	sp, sp, #68	@,,
	str	r0, [fp, #-56]	@ X, X
	str	r1, [fp, #-60]	@ Y, Y
	str	r2, [fp, #-64]	@ M, M
	str	r3, [fp, #-68]	@ m, m
@ mmm_hardened.c:4:     int T = 0;
	mov	r3, #0	@ tmp122,
	str	r3, [fp, #-8]	@ tmp122, T
@ mmm_hardened.c:5:     int Y0 = Y & 1;
	ldr	r3, [fp, #-60]	@ tmp124, Y
	and	r3, r3, #1	@ tmp123, tmp124,
	str	r3, [fp, #-16]	@ tmp123, Y0
@ mmm_hardened.c:7:     for (int i = 0; i < m; i++) {
	mov	r3, #0	@ tmp125,
	str	r3, [fp, #-12]	@ tmp125, i
@ mmm_hardened.c:7:     for (int i = 0; i < m; i++) {
	b	.L2		@
.L3:
@ mmm_hardened.c:8:         int Xi = (X >> i) & 1;
	ldr	r2, [fp, #-56]	@ tmp126, X
	ldr	r3, [fp, #-12]	@ tmp127, i
	asr	r3, r2, r3	@ _1, tmp126, tmp127
@ mmm_hardened.c:8:         int Xi = (X >> i) & 1;
	and	r3, r3, #1	@ tmp128, _1,
	str	r3, [fp, #-20]	@ tmp128, Xi
@ mmm_hardened.c:9:         int T0 = T & 1;
	ldr	r3, [fp, #-8]	@ tmp130, T
	and	r3, r3, #1	@ tmp129, tmp130,
	str	r3, [fp, #-24]	@ tmp129, T0
@ mmm_hardened.c:10:         int eta = T0 ^ (Xi & Y0);
	ldr	r2, [fp, #-20]	@ tmp131, Xi
	ldr	r3, [fp, #-16]	@ tmp132, Y0
	and	r3, r3, r2	@ _2, tmp132, tmp131
@ mmm_hardened.c:10:         int eta = T0 ^ (Xi & Y0);
	ldr	r2, [fp, #-24]	@ tmp134, T0
	eor	r3, r3, r2	@ tmp133, _2, tmp134
	str	r3, [fp, #-28]	@ tmp133, eta
@ mmm_hardened.c:13:         int Xi_mask = -Xi;           // 0xFFFFFFFF if Xi == 1, else 0x00000000
	ldr	r3, [fp, #-20]	@ tmp136, Xi
	rsb	r3, r3, #0	@ tmp135, tmp136
	str	r3, [fp, #-32]	@ tmp135, Xi_mask
@ mmm_hardened.c:14:         int Xi_Y = Y & Xi_mask;
	ldr	r2, [fp, #-60]	@ tmp138, Y
	ldr	r3, [fp, #-32]	@ tmp139, Xi_mask
	and	r3, r3, r2	@ tmp137, tmp139, tmp138
	str	r3, [fp, #-36]	@ tmp137, Xi_Y
@ mmm_hardened.c:16:         int eta_mask = -eta;         // 0xFFFFFFFF if eta == 1, else 0x00000000
	ldr	r3, [fp, #-28]	@ tmp141, eta
	rsb	r3, r3, #0	@ tmp140, tmp141
	str	r3, [fp, #-40]	@ tmp140, eta_mask
@ mmm_hardened.c:17:         int eta_M = M & eta_mask;
	ldr	r2, [fp, #-64]	@ tmp143, M
	ldr	r3, [fp, #-40]	@ tmp144, eta_mask
	and	r3, r3, r2	@ tmp142, tmp144, tmp143
	str	r3, [fp, #-44]	@ tmp142, eta_M
@ mmm_hardened.c:20:         T = (T + Xi_Y + eta_M) >> 1;
	ldr	r2, [fp, #-8]	@ tmp145, T
	ldr	r3, [fp, #-36]	@ tmp146, Xi_Y
	add	r2, r2, r3	@ _3, tmp145, tmp146
@ mmm_hardened.c:20:         T = (T + Xi_Y + eta_M) >> 1;
	ldr	r3, [fp, #-44]	@ tmp147, eta_M
	add	r3, r2, r3	@ _4, _3, tmp147
@ mmm_hardened.c:20:         T = (T + Xi_Y + eta_M) >> 1;
	asr	r3, r3, #1	@ tmp148, _4,
	str	r3, [fp, #-8]	@ tmp148, T
@ mmm_hardened.c:7:     for (int i = 0; i < m; i++) {
	ldr	r3, [fp, #-12]	@ tmp150, i
	add	r3, r3, #1	@ tmp149, tmp150,
	str	r3, [fp, #-12]	@ tmp149, i
.L2:
@ mmm_hardened.c:7:     for (int i = 0; i < m; i++) {
	ldr	r2, [fp, #-12]	@ tmp151, i
	ldr	r3, [fp, #-68]	@ tmp152, m
	cmp	r2, r3	@ tmp151, tmp152
	blt	.L3		@,
@ mmm_hardened.c:24:     int mask1 = -(T >= M);
	ldr	r2, [fp, #-8]	@ tmp154, T
	ldr	r3, [fp, #-64]	@ tmp155, M
	cmp	r2, r3	@ tmp154, tmp155
	movge	r3, #1	@ tmp156,
	movlt	r3, #0	@ tmp156,
	uxtb	r3, r3	@ _5, tmp153
@ mmm_hardened.c:24:     int mask1 = -(T >= M);
	rsb	r3, r3, #0	@ tmp157, _6
	str	r3, [fp, #-48]	@ tmp157, mask1
@ mmm_hardened.c:25:     T = T - (M & mask1);
	ldr	r2, [fp, #-64]	@ tmp158, M
	ldr	r3, [fp, #-48]	@ tmp159, mask1
	and	r3, r3, r2	@ _7, tmp159, tmp158
@ mmm_hardened.c:25:     T = T - (M & mask1);
	ldr	r2, [fp, #-8]	@ tmp161, T
	sub	r3, r2, r3	@ tmp160, tmp161, _7
	str	r3, [fp, #-8]	@ tmp160, T
@ mmm_hardened.c:27:     int mask2 = -(T >= M);
	ldr	r2, [fp, #-8]	@ tmp163, T
	ldr	r3, [fp, #-64]	@ tmp164, M
	cmp	r2, r3	@ tmp163, tmp164
	movge	r3, #1	@ tmp165,
	movlt	r3, #0	@ tmp165,
	uxtb	r3, r3	@ _8, tmp162
@ mmm_hardened.c:27:     int mask2 = -(T >= M);
	rsb	r3, r3, #0	@ tmp166, _9
	str	r3, [fp, #-52]	@ tmp166, mask2
@ mmm_hardened.c:28:     T = T - (M & mask2);
	ldr	r2, [fp, #-64]	@ tmp167, M
	ldr	r3, [fp, #-52]	@ tmp168, mask2
	and	r3, r3, r2	@ _10, tmp168, tmp167
@ mmm_hardened.c:28:     T = T - (M & mask2);
	ldr	r2, [fp, #-8]	@ tmp170, T
	sub	r3, r2, r3	@ tmp169, tmp170, _10
	str	r3, [fp, #-8]	@ tmp169, T
@ mmm_hardened.c:30:     return T;
	ldr	r3, [fp, #-8]	@ _33, T
@ mmm_hardened.c:31: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
	.size	MMM, .-MMM
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
