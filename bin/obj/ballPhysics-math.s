	.file	"math.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "C://msys64//home//alexa//ballPhysics//src" "math.c"
	.globl	floatComp
	.def	floatComp;	.scl	2;	.type	32;	.endef
	.seh_proc	floatComp
floatComp:
.LFB2:
	.file 1 "math.c"
	.loc 1 9 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movss	%xmm0, 16(%rbp)
	movss	%xmm1, 24(%rbp)
	.loc 1 11 1
	nop
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.seh_endproc
	.globl	vecComp
	.def	vecComp;	.scl	2;	.type	32;	.endef
	.seh_proc	vecComp
vecComp:
.LFB3:
	.loc 1 17 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 18 17
	movss	16(%rbp), %xmm0
	.loc 1 18 28
	movss	24(%rbp), %xmm1
	.loc 1 18 32
	ucomiss	%xmm1, %xmm0
	jp	.L3
	ucomiss	%xmm1, %xmm0
	jne	.L3
	.loc 1 18 40 discriminator 1
	movss	20(%rbp), %xmm0
	.loc 1 18 51 discriminator 1
	movss	28(%rbp), %xmm1
	.loc 1 18 32 discriminator 1
	ucomiss	%xmm1, %xmm0
	jp	.L3
	ucomiss	%xmm1, %xmm0
	jne	.L3
	.loc 1 18 32 is_stmt 0 discriminator 3
	movl	$1, %eax
	.loc 1 18 32
	jmp	.L6
.L3:
	.loc 1 18 32 discriminator 4
	movl	$0, %eax
.L6:
	.loc 1 18 32 discriminator 6
	andl	$1, %eax
	.loc 1 19 1 is_stmt 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.seh_endproc
	.globl	vecAdd
	.def	vecAdd;	.scl	2;	.type	32;	.endef
	.seh_proc	vecAdd
vecAdd:
.LFB4:
	.loc 1 22 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 23 26
	movss	16(%rbp), %xmm1
	.loc 1 23 36
	movss	24(%rbp), %xmm0
	.loc 1 23 29
	movaps	%xmm1, %xmm2
	addss	%xmm0, %xmm2
	.loc 1 23 44
	movss	20(%rbp), %xmm1
	.loc 1 23 54
	movss	28(%rbp), %xmm0
	.loc 1 23 47
	addss	%xmm1, %xmm0
	.loc 1 23 12
	movaps	%xmm2, %xmm1
	movd	%xmm1, %edx
	movabsq	$-4294967296, %rcx
	andq	%rcx, %rax
	orq	%rdx, %rax
	movd	%xmm0, %edx
	salq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	.loc 1 24 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.seh_endproc
	.globl	vecSub
	.def	vecSub;	.scl	2;	.type	32;	.endef
	.seh_proc	vecSub
vecSub:
.LFB5:
	.loc 1 27 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 28 26
	movss	16(%rbp), %xmm0
	.loc 1 28 36
	movss	24(%rbp), %xmm1
	.loc 1 28 29
	movaps	%xmm0, %xmm2
	subss	%xmm1, %xmm2
	.loc 1 28 44
	movss	20(%rbp), %xmm0
	.loc 1 28 54
	movss	28(%rbp), %xmm1
	.loc 1 28 47
	subss	%xmm1, %xmm0
	.loc 1 28 12
	movaps	%xmm2, %xmm1
	movd	%xmm1, %edx
	movabsq	$-4294967296, %rcx
	andq	%rcx, %rax
	orq	%rdx, %rax
	movd	%xmm0, %edx
	salq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	.loc 1 29 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.seh_endproc
	.globl	vecScale
	.def	vecScale;	.scl	2;	.type	32;	.endef
	.seh_proc	vecScale
vecScale:
.LFB6:
	.loc 1 32 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movss	%xmm1, 24(%rbp)
	.loc 1 33 25
	movss	16(%rbp), %xmm0
	.loc 1 33 28
	movaps	%xmm0, %xmm1
	mulss	24(%rbp), %xmm1
	.loc 1 33 41
	movss	20(%rbp), %xmm0
	.loc 1 33 44
	mulss	24(%rbp), %xmm0
	.loc 1 33 12
	movd	%xmm1, %edx
	movabsq	$-4294967296, %rcx
	andq	%rcx, %rax
	orq	%rdx, %rax
	movd	%xmm0, %edx
	salq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	.loc 1 34 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.seh_endproc
	.globl	vecDist
	.def	vecDist;	.scl	2;	.type	32;	.endef
	.seh_proc	vecDist
vecDist:
.LFB7:
	.loc 1 37 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 38 21
	movss	16(%rbp), %xmm1
	.loc 1 38 29
	movss	16(%rbp), %xmm0
	.loc 1 38 24
	mulss	%xmm0, %xmm1
	.loc 1 38 37
	movss	20(%rbp), %xmm2
	.loc 1 38 45
	movss	20(%rbp), %xmm0
	.loc 1 38 40
	mulss	%xmm2, %xmm0
	.loc 1 38 12
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movd	%eax, %xmm0
	call	sqrtf
	.loc 1 39 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.seh_endproc
	.globl	vecInverse
	.def	vecInverse;	.scl	2;	.type	32;	.endef
	.seh_proc	vecInverse
vecInverse:
.LFB8:
	.loc 1 42 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 43 26
	movss	16(%rbp), %xmm0
	.loc 1 43 22
	movss	.LC0(%rip), %xmm1
	movaps	%xmm0, %xmm2
	xorps	%xmm1, %xmm2
	.loc 1 43 34
	movss	20(%rbp), %xmm0
	.loc 1 43 30
	movss	.LC0(%rip), %xmm1
	xorps	%xmm1, %xmm0
	.loc 1 43 12
	movaps	%xmm2, %xmm1
	movd	%xmm1, %edx
	movabsq	$-4294967296, %rcx
	andq	%rcx, %rax
	orq	%rdx, %rax
	movd	%xmm0, %edx
	salq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	.loc 1 44 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.seh_endproc
	.globl	dotProduct
	.def	dotProduct;	.scl	2;	.type	32;	.endef
	.seh_proc	dotProduct
dotProduct:
.LFB9:
	.loc 1 47 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 48 16
	movss	16(%rbp), %xmm1
	.loc 1 48 26
	movss	24(%rbp), %xmm0
	.loc 1 48 19
	mulss	%xmm0, %xmm1
	.loc 1 48 35
	movss	20(%rbp), %xmm2
	.loc 1 48 45
	movss	28(%rbp), %xmm0
	.loc 1 48 38
	mulss	%xmm2, %xmm0
	.loc 1 48 29
	addss	%xmm1, %xmm0
	.loc 1 49 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.seh_endproc
	.globl	determinant
	.def	determinant;	.scl	2;	.type	32;	.endef
	.seh_proc	determinant
determinant:
.LFB10:
	.loc 1 55 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.seh_stackalloc	24
	.cfi_def_cfa_offset 48
	leaq	16(%rsp), %rbp
	.seh_setframe	%rbp, 16
	.cfi_def_cfa 6, 32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rbx), %rax
	movq	8(%rbx), %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	.loc 1 56 18
	movss	-16(%rbp), %xmm1
	.loc 1 56 29
	movss	-4(%rbp), %xmm0
	.loc 1 56 21
	mulss	%xmm1, %xmm0
	.loc 1 56 40
	movss	-12(%rbp), %xmm2
	.loc 1 56 51
	movss	-8(%rbp), %xmm1
	.loc 1 56 43
	mulss	%xmm2, %xmm1
	.loc 1 56 32
	subss	%xmm1, %xmm0
	.loc 1 57 1
	addq	$24, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -8
	ret
	.cfi_endproc
.LFE10:
	.seh_endproc
	.globl	cramerSystem
	.def	cramerSystem;	.scl	2;	.type	32;	.endef
	.seh_proc	cramerSystem
cramerSystem:
.LFB11:
	.loc 1 60 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	.loc 1 62 1
	nop
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.seh_endproc
	.globl	matrixVecMultiply
	.def	matrixVecMultiply;	.scl	2;	.type	32;	.endef
	.seh_proc	matrixVecMultiply
matrixVecMultiply:
.LFB12:
	.loc 1 65 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.seh_stackalloc	24
	.cfi_def_cfa_offset 48
	leaq	16(%rsp), %rbp
	.seh_setframe	%rbp, 16
	.cfi_def_cfa 6, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, %rbx
	movq	(%rbx), %rax
	movq	8(%rbx), %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	.loc 1 66 26
	movss	32(%rbp), %xmm1
	.loc 1 66 37
	movss	-16(%rbp), %xmm0
	.loc 1 66 29
	mulss	%xmm0, %xmm1
	.loc 1 66 45
	movss	36(%rbp), %xmm2
	.loc 1 66 56
	movss	-8(%rbp), %xmm0
	.loc 1 66 48
	mulss	%xmm2, %xmm0
	.loc 1 66 40
	movaps	%xmm1, %xmm3
	addss	%xmm0, %xmm3
	.loc 1 66 63
	movss	32(%rbp), %xmm1
	.loc 1 66 74
	movss	-12(%rbp), %xmm0
	.loc 1 66 66
	mulss	%xmm0, %xmm1
	.loc 1 66 82
	movss	36(%rbp), %xmm2
	.loc 1 66 93
	movss	-4(%rbp), %xmm0
	.loc 1 66 85
	mulss	%xmm2, %xmm0
	.loc 1 66 77
	addss	%xmm1, %xmm0
	.loc 1 66 12
	movaps	%xmm3, %xmm1
	movd	%xmm1, %edx
	movabsq	$-4294967296, %rax
	andq	%r8, %rax
	orq	%rdx, %rax
	movq	%rax, %r8
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%r8d, %edx
	orq	%rdx, %rax
	movq	%rax, %r8
	movq	%r8, %rax
	.loc 1 67 1
	addq	$24, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -8
	ret
	.cfi_endproc
.LFE12:
	.seh_endproc
	.globl	rotationMatrix
	.def	rotationMatrix;	.scl	2;	.type	32;	.endef
	.seh_proc	rotationMatrix
rotationMatrix:
.LFB13:
	.loc 1 70 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.seh_stackalloc	48
	.cfi_def_cfa_offset 80
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.cfi_def_cfa 6, 48
	movups	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 32
	.cfi_offset 23, -48
	.seh_endprologue
	movq	%rcx, 48(%rbp)
	movss	%xmm1, 56(%rbp)
	.loc 1 71 25
	movl	56(%rbp), %eax
	movd	%eax, %xmm0
	call	cosf
	movd	%xmm0, %esi
	.loc 1 71 38 discriminator 1
	movl	56(%rbp), %eax
	movd	%eax, %xmm0
	call	sinf
	movd	%xmm0, %ebx
	.loc 1 71 52 discriminator 2
	movl	56(%rbp), %eax
	movd	%eax, %xmm0
	call	sinf
	movd	%xmm0, %eax
	.loc 1 71 51 discriminator 3
	movss	.LC0(%rip), %xmm0
	movd	%eax, %xmm6
	xorps	%xmm0, %xmm6
	.loc 1 71 65 discriminator 3
	movl	56(%rbp), %eax
	movd	%eax, %xmm0
	call	cosf
	movd	%xmm0, %eax
	.loc 1 71 12 discriminator 4
	movq	48(%rbp), %rdx
	movl	%esi, (%rdx)
	movq	48(%rbp), %rdx
	movl	%ebx, 4(%rdx)
	movq	48(%rbp), %rdx
	movss	%xmm6, 8(%rdx)
	movq	48(%rbp), %rdx
	movl	%eax, 12(%rdx)
	.loc 1 72 1
	movq	48(%rbp), %rax
	movups	0(%rbp), %xmm6
	addq	$48, %rsp
	.cfi_restore 23
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -24
	ret
	.cfi_endproc
.LFE13:
	.seh_endproc
	.globl	calcCentroid
	.def	calcCentroid;	.scl	2;	.type	32;	.endef
	.seh_proc	calcCentroid
calcCentroid:
.LFB14:
	.loc 1 78 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 79 12
	movq	16(%rbp), %rdx
	movl	(%rdx), %edx
	.loc 1 79 8
	cmpl	$1, %edx
	jne	.L30
.LBB2:
	.loc 1 81 21
	movq	16(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -8(%rbp)
	.loc 1 82 63
	movq	-8(%rbp), %rdx
	movss	(%rdx), %xmm0
	.loc 1 82 51
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rcx
	andq	%rcx, %rax
	orq	%rdx, %rax
	.loc 1 82 78
	movq	-8(%rbp), %rdx
	movss	4(%rdx), %xmm0
	.loc 1 82 51
	movd	%xmm0, %edx
	salq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	.loc 1 82 16
	movss	.LC1(%rip), %xmm1
	movq	%rax, %rcx
	call	vecScale
	movq	%rax, %rdx
	.loc 1 82 16 is_stmt 0 discriminator 1
	movq	16(%rbp), %rax
	movq	4(%rax), %rax
	movq	%rax, %rcx
	call	vecAdd
	.loc 1 82 16
	jmp	.L29
.L30:
.LBE2:
	.loc 1 84 17 is_stmt 1
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 84 13
	testl	%eax, %eax
	jne	.L32
	.loc 1 86 19
	movq	16(%rbp), %rax
	movq	4(%rax), %rax
	jmp	.L29
.L32:
.L29:
	.loc 1 88 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC1:
	.long	1056964608
	.text
.Letext0:
	.file 2 "C:/msys64/ucrt64/include/raylib.h"
	.file 3 "../include/ballPhysics.h"
	.file 4 "C:/msys64/ucrt64/include/math.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x5d5
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0xf
	.ascii "GNU C17 13.1.0 -mtune=generic -march=nocona -g -O0\0"
	.byte	0x1d
	.secrel32	.LASF0
	.secrel32	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0xa
	.ascii "Vector2\0"
	.byte	0x8
	.byte	0x2
	.byte	0xc4
	.long	0x8c
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x2
	.byte	0xc5
	.byte	0xb
	.long	0x8c
	.byte	0
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x2
	.byte	0xc6
	.byte	0xb
	.long	0x8c
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0xb
	.ascii "Vector2\0"
	.byte	0x2
	.byte	0xc7
	.long	0x65
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x10
	.byte	0x8
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x11
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x4
	.long	0xbe
	.byte	0x3
	.byte	0x26
	.byte	0xe
	.long	0x168
	.uleb128 0xc
	.ascii "OBJ_CIRCLE\0"
	.byte	0
	.uleb128 0xc
	.ascii "OBJ_RECT\0"
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.secrel32	.LASF2
	.byte	0x2a
	.long	0x13d
	.uleb128 0xa
	.ascii "Object\0"
	.byte	0x20
	.byte	0x3
	.byte	0x2c
	.long	0x1bb
	.uleb128 0x3
	.ascii "type\0"
	.byte	0x3
	.byte	0x2e
	.byte	0x10
	.long	0x168
	.byte	0
	.uleb128 0x3
	.ascii "pos\0"
	.byte	0x3
	.byte	0x2f
	.byte	0xd
	.long	0x95
	.byte	0x4
	.uleb128 0x3
	.ascii "vel\0"
	.byte	0x3
	.byte	0x30
	.byte	0xd
	.long	0x95
	.byte	0xc
	.uleb128 0x3
	.ascii "typeObj\0"
	.byte	0x3
	.byte	0x31
	.byte	0xb
	.long	0xb5
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.ascii "Object\0"
	.byte	0x3
	.byte	0x32
	.long	0x172
	.uleb128 0xd
	.long	0x1bb
	.uleb128 0xe
	.secrel32	.LASF3
	.byte	0xc
	.byte	0x40
	.long	0x1fa
	.uleb128 0x3
	.ascii "size\0"
	.byte	0x3
	.byte	0x42
	.byte	0xd
	.long	0x95
	.byte	0
	.uleb128 0x3
	.ascii "rotation\0"
	.byte	0x3
	.byte	0x43
	.byte	0xb
	.long	0x8c
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.secrel32	.LASF3
	.byte	0x44
	.long	0x1ce
	.uleb128 0xe
	.secrel32	.LASF4
	.byte	0x10
	.byte	0x54
	.long	0x23c
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x3
	.byte	0x56
	.byte	0xb
	.long	0x8c
	.byte	0
	.uleb128 0x3
	.ascii "b\0"
	.byte	0x3
	.byte	0x57
	.byte	0xb
	.long	0x8c
	.byte	0x4
	.uleb128 0x3
	.ascii "c\0"
	.byte	0x3
	.byte	0x58
	.byte	0xb
	.long	0x8c
	.byte	0x8
	.uleb128 0x3
	.ascii "d\0"
	.byte	0x3
	.byte	0x59
	.byte	0xb
	.long	0x8c
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.secrel32	.LASF4
	.byte	0x5a
	.long	0x204
	.uleb128 0x7
	.ascii "sinf\0"
	.word	0x293
	.long	0x8c
	.long	0x25c
	.uleb128 0x8
	.long	0x8c
	.byte	0
	.uleb128 0x7
	.ascii "cosf\0"
	.word	0x296
	.long	0x8c
	.long	0x272
	.uleb128 0x8
	.long	0x8c
	.byte	0
	.uleb128 0x7
	.ascii "sqrtf\0"
	.word	0x380
	.long	0x8c
	.long	0x289
	.uleb128 0x8
	.long	0x8c
	.byte	0
	.uleb128 0x9
	.ascii "calcCentroid\0"
	.byte	0x4d
	.byte	0x9
	.long	0x95
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x2e5
	.uleb128 0x1
	.ascii "obj\0"
	.byte	0x4d
	.byte	0x1e
	.long	0x1c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x13
	.ascii "obj_R\0"
	.byte	0x1
	.byte	0x51
	.byte	0x15
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x1fa
	.uleb128 0x9
	.ascii "rotationMatrix\0"
	.byte	0x45
	.byte	0xb
	.long	0x23c
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x327
	.uleb128 0x1
	.ascii "angle\0"
	.byte	0x45
	.byte	0x20
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x4
	.ascii "matrixVecMultiply\0"
	.byte	0x40
	.byte	0x9
	.long	0x95
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x376
	.uleb128 0x1
	.ascii "vec\0"
	.byte	0x40
	.byte	0x23
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.ascii "matrix\0"
	.byte	0x40
	.byte	0x32
	.long	0x23c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x14
	.ascii "cramerSystem\0"
	.byte	0x1
	.byte	0x3b
	.byte	0x9
	.long	0x95
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.ascii "determinant\0"
	.byte	0x36
	.byte	0x7
	.long	0x8c
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x3d8
	.uleb128 0x1
	.ascii "matrix\0"
	.byte	0x36
	.byte	0x1d
	.long	0x23c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x4
	.ascii "dotProduct\0"
	.byte	0x2e
	.byte	0x7
	.long	0x8c
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x41e
	.uleb128 0x1
	.ascii "left\0"
	.byte	0x2e
	.byte	0x1a
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.secrel32	.LASF5
	.byte	0x2e
	.byte	0x28
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x4
	.ascii "vecInverse\0"
	.byte	0x29
	.byte	0x9
	.long	0x95
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x455
	.uleb128 0x1
	.ascii "vec\0"
	.byte	0x29
	.byte	0x1c
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.ascii "vecDist\0"
	.byte	0x24
	.byte	0x7
	.long	0x8c
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x489
	.uleb128 0x1
	.ascii "vec\0"
	.byte	0x24
	.byte	0x17
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.ascii "vecScale\0"
	.byte	0x1f
	.byte	0x9
	.long	0x95
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x4cf
	.uleb128 0x1
	.ascii "vec\0"
	.byte	0x1f
	.byte	0x1a
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.ascii "scalar\0"
	.byte	0x1f
	.byte	0x25
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x4
	.ascii "vecSub\0"
	.byte	0x1a
	.byte	0x9
	.long	0x95
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x511
	.uleb128 0x1
	.ascii "left\0"
	.byte	0x1a
	.byte	0x18
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.secrel32	.LASF5
	.byte	0x1a
	.byte	0x26
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x4
	.ascii "vecAdd\0"
	.byte	0x15
	.byte	0x9
	.long	0x95
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x553
	.uleb128 0x1
	.ascii "left\0"
	.byte	0x15
	.byte	0x18
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.secrel32	.LASF5
	.byte	0x15
	.byte	0x26
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x4
	.ascii "vecComp\0"
	.byte	0x10
	.byte	0x5
	.long	0xfe
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x596
	.uleb128 0x1
	.ascii "left\0"
	.byte	0x10
	.byte	0x15
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.secrel32	.LASF5
	.byte	0x10
	.byte	0x23
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x15
	.ascii "floatComp\0"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.long	0xfe
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1
	.ascii "left\0"
	.byte	0x8
	.byte	0x15
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.secrel32	.LASF5
	.byte	0x8
	.byte	0x21
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 43
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x2c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
.LASF3:
	.ascii "RectObject\0"
.LASF4:
	.ascii "Matrix2x2\0"
.LASF5:
	.ascii "right\0"
.LASF2:
	.ascii "ObjectType\0"
	.section	.debug_line_str,"dr"
.LASF1:
	.ascii "C:\\\\msys64\\\\home\\\\alexa\\\\ballPhysics\\\\src\0"
.LASF0:
	.ascii "math.c\0"
	.ident	"GCC: (Rev7, Built by MSYS2 project) 13.1.0"
	.def	sqrtf;	.scl	2;	.type	32;	.endef
	.def	cosf;	.scl	2;	.type	32;	.endef
	.def	sinf;	.scl	2;	.type	32;	.endef
