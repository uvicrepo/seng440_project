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
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!	@,
	add	fp, sp, #0	@,,
	sub	sp, sp, #76	@,,
	str	r0, [fp, #-64]	@ X, X
	str	r1, [fp, #-68]	@ Y, Y
	str	r2, [fp, #-72]	@ M, M
	str	r3, [fp, #-76]	@ m, m
@ mmm_hardened.c:3:     int T = 0;
	mov	r3, #0	@ tmp120,
	str	r3, [fp, #-8]	@ tmp120, T
@ mmm_hardened.c:4:     int Y0 = Y & 1;
	ldr	r3, [fp, #-68]	@ tmp122, Y
	and	r3, r3, #1	@ tmp121, tmp122,
	str	r3, [fp, #-16]	@ tmp121, Y0
@ mmm_hardened.c:6:     for (int i = 0; i < m; i++) {
	mov	r3, #0	@ tmp123,
	str	r3, [fp, #-12]	@ tmp123, i
@ mmm_hardened.c:6:     for (int i = 0; i < m; i++) {
	b	.L2		@
.L3:
@ mmm_hardened.c:7:         int Xi = (X >> i) & 1;
	ldr	r2, [fp, #-64]	@ tmp124, X
	ldr	r3, [fp, #-12]	@ tmp125, i
	asr	r3, r2, r3	@ _1, tmp124, tmp125
@ mmm_hardened.c:7:         int Xi = (X >> i) & 1;
	and	r3, r3, #1	@ tmp126, _1,
	str	r3, [fp, #-20]	@ tmp126, Xi
@ mmm_hardened.c:8:         int T0 = T & 1;
	ldr	r3, [fp, #-8]	@ tmp128, T
	and	r3, r3, #1	@ tmp127, tmp128,
	str	r3, [fp, #-24]	@ tmp127, T0
@ mmm_hardened.c:9:         int eta = T0 ^ (Xi & Y0);
	ldr	r2, [fp, #-20]	@ tmp129, Xi
	ldr	r3, [fp, #-16]	@ tmp130, Y0
	and	r3, r3, r2	@ _2, tmp130, tmp129
@ mmm_hardened.c:9:         int eta = T0 ^ (Xi & Y0);
	ldr	r2, [fp, #-24]	@ tmp132, T0
	eor	r3, r3, r2	@ tmp131, _2, tmp132
	str	r3, [fp, #-28]	@ tmp131, eta
@ mmm_hardened.c:12:         int Xi_mask = -Xi;           // 0xFFFFFFFF if Xi == 1, else 0x00000000
	ldr	r3, [fp, #-20]	@ tmp134, Xi
	rsb	r3, r3, #0	@ tmp133, tmp134
	str	r3, [fp, #-32]	@ tmp133, Xi_mask
@ mmm_hardened.c:13:         int Xi_Y = Y & Xi_mask;
	ldr	r2, [fp, #-68]	@ tmp136, Y
	ldr	r3, [fp, #-32]	@ tmp137, Xi_mask
	and	r3, r3, r2	@ tmp135, tmp137, tmp136
	str	r3, [fp, #-36]	@ tmp135, Xi_Y
@ mmm_hardened.c:15:         int eta_mask = -eta;         // 0xFFFFFFFF if eta == 1, else 0x00000000
	ldr	r3, [fp, #-28]	@ tmp139, eta
	rsb	r3, r3, #0	@ tmp138, tmp139
	str	r3, [fp, #-40]	@ tmp138, eta_mask
@ mmm_hardened.c:16:         int eta_M = M & eta_mask;
	ldr	r2, [fp, #-72]	@ tmp141, M
	ldr	r3, [fp, #-40]	@ tmp142, eta_mask
	and	r3, r3, r2	@ tmp140, tmp142, tmp141
	str	r3, [fp, #-44]	@ tmp140, eta_M
@ mmm_hardened.c:19:         T = (T + Xi_Y + eta_M) >> 1;
	ldr	r2, [fp, #-8]	@ tmp143, T
	ldr	r3, [fp, #-36]	@ tmp144, Xi_Y
	add	r2, r2, r3	@ _3, tmp143, tmp144
@ mmm_hardened.c:19:         T = (T + Xi_Y + eta_M) >> 1;
	ldr	r3, [fp, #-44]	@ tmp145, eta_M
	add	r3, r2, r3	@ _4, _3, tmp145
@ mmm_hardened.c:19:         T = (T + Xi_Y + eta_M) >> 1;
	asr	r3, r3, #1	@ tmp146, _4,
	str	r3, [fp, #-8]	@ tmp146, T
@ mmm_hardened.c:6:     for (int i = 0; i < m; i++) {
	ldr	r3, [fp, #-12]	@ tmp148, i
	add	r3, r3, #1	@ tmp147, tmp148,
	str	r3, [fp, #-12]	@ tmp147, i
.L2:
@ mmm_hardened.c:6:     for (int i = 0; i < m; i++) {
	ldr	r2, [fp, #-12]	@ tmp149, i
	ldr	r3, [fp, #-76]	@ tmp150, m
	cmp	r2, r3	@ tmp149, tmp150
	blt	.L3		@,
@ mmm_hardened.c:23:     int diff1 = T - M;
	ldr	r2, [fp, #-8]	@ tmp152, T
	ldr	r3, [fp, #-72]	@ tmp153, M
	sub	r3, r2, r3	@ tmp151, tmp152, tmp153
	str	r3, [fp, #-48]	@ tmp151, diff1
@ mmm_hardened.c:24:     int mask1 = ~(diff1 >> 31);     // 0xFFFFFFFF if T >= M, else 0x00000000
	ldr	r3, [fp, #-48]	@ tmp154, diff1
	asr	r3, r3, #31	@ _5, tmp154,
@ mmm_hardened.c:24:     int mask1 = ~(diff1 >> 31);     // 0xFFFFFFFF if T >= M, else 0x00000000
	mvn	r3, r3	@ tmp155, _5
	str	r3, [fp, #-52]	@ tmp155, mask1
@ mmm_hardened.c:25:     T = T - (M & mask1);
	ldr	r2, [fp, #-72]	@ tmp156, M
	ldr	r3, [fp, #-52]	@ tmp157, mask1
	and	r3, r3, r2	@ _6, tmp157, tmp156
@ mmm_hardened.c:25:     T = T - (M & mask1);
	ldr	r2, [fp, #-8]	@ tmp159, T
	sub	r3, r2, r3	@ tmp158, tmp159, _6
	str	r3, [fp, #-8]	@ tmp158, T
@ mmm_hardened.c:27:     int diff2 = T - M;
	ldr	r2, [fp, #-8]	@ tmp161, T
	ldr	r3, [fp, #-72]	@ tmp162, M
	sub	r3, r2, r3	@ tmp160, tmp161, tmp162
	str	r3, [fp, #-56]	@ tmp160, diff2
@ mmm_hardened.c:28:     int mask2 = ~(diff2 >> 31);
	ldr	r3, [fp, #-56]	@ tmp163, diff2
	asr	r3, r3, #31	@ _7, tmp163,
@ mmm_hardened.c:28:     int mask2 = ~(diff2 >> 31);
	mvn	r3, r3	@ tmp164, _7
	str	r3, [fp, #-60]	@ tmp164, mask2
@ mmm_hardened.c:29:     T = T - (M & mask2);
	ldr	r2, [fp, #-72]	@ tmp165, M
	ldr	r3, [fp, #-60]	@ tmp166, mask2
	and	r3, r3, r2	@ _8, tmp166, tmp165
@ mmm_hardened.c:29:     T = T - (M & mask2);
	ldr	r2, [fp, #-8]	@ tmp168, T
	sub	r3, r2, r3	@ tmp167, tmp168, _8
	str	r3, [fp, #-8]	@ tmp167, T
@ mmm_hardened.c:31:     return T;
	ldr	r3, [fp, #-8]	@ _33, T
@ mmm_hardened.c:32: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
	.size	MMM, .-MMM
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
