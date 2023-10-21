	.file	"render.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "C://msys64//home//alexa//ballPhysics//src" "render.c"
.lcomm objects,16,16
.lcomm collisions,8,8
.lcomm targetFPS,4,4
.lcomm nBalls,4,4
.lcomm radius,4,4
.lcomm speedMod,4,4
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC3:
	.ascii "Test\0"
	.align 8
.LC4:
	.ascii "{ Pos = { %f, %f }, Size = { %f, %f } }\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB124:
	.file 1 "test.h"
	.loc 1 6 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%r15
	.seh_pushreg	%r15
	.cfi_def_cfa_offset 24
	.cfi_offset 15, -24
	pushq	%r14
	.seh_pushreg	%r14
	.cfi_def_cfa_offset 32
	.cfi_offset 14, -32
	pushq	%r13
	.seh_pushreg	%r13
	.cfi_def_cfa_offset 40
	.cfi_offset 13, -40
	pushq	%r12
	.seh_pushreg	%r12
	.cfi_def_cfa_offset 48
	.cfi_offset 12, -48
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 56
	.cfi_offset 5, -56
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 64
	.cfi_offset 4, -64
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 72
	.cfi_offset 3, -72
	subq	$136, %rsp
	.seh_stackalloc	136
	.cfi_def_cfa_offset 208
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 80
	.seh_endprologue
	.loc 1 6 1
	call	__main
	.loc 1 7 15
	movl	$30, targetFPS(%rip)
	.loc 1 8 14
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, speedMod(%rip)
	.loc 1 10 22
	movl	$1, 12+objects(%rip)
	.loc 1 11 43
	movl	12+objects(%rip), %eax
	cltq
	.loc 1 11 29
	salq	$5, %rax
	movq	%rax, %rcx
	call	malloc
	.loc 1 11 18 discriminator 1
	movq	%rax, objects(%rip)
	.loc 1 12 18
	movl	$0, 8+objects(%rip)
	.loc 1 14 44
	movl	12+objects(%rip), %eax
	cltq
	.loc 1 14 30
	salq	$3, %rax
	movq	%rax, %rcx
	call	malloc
	.loc 1 14 16 discriminator 1
	movq	%rax, collisions(%rip)
	.loc 1 16 78
	movl	$1112014848, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	-72(%rbp), %rax
	orq	%rdx, %rax
	movq	%rax, %rcx
	movl	$1120403456, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%ecx, %edx
	orq	%rdx, %rax
	movq	%rax, %r8
	.loc 1 16 52
	movl	$0, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	-64(%rbp), %rax
	orq	%rdx, %rax
	movq	%rax, %rcx
	movl	$0, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%ecx, %edx
	orq	%rdx, %rax
	movq	%rax, %r10
	.loc 1 16 28
	movl	$1132068864, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	-56(%rbp), %rax
	orq	%rdx, %rax
	movq	%rax, %rcx
	movl	$1132068864, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%ecx, %edx
	orq	%rdx, %rax
	movq	%rax, %rcx
	.loc 1 16 5
	pxor	%xmm3, %xmm3
	movq	%r10, %rdx
	call	addRectObject
	.loc 1 17 78
	movl	$1112014848, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	-80(%rbp), %rax
	orq	%rdx, %rax
	movq	%rax, %rcx
	movl	$1120403456, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%ecx, %edx
	orq	%rdx, %rax
	movq	%rax, %r8
	.loc 1 17 52
	movl	$0, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%r15, %rax
	orq	%rdx, %rax
	movq	%rax, %r15
	movl	$0, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%r15d, %edx
	orq	%rdx, %rax
	movq	%rax, %r15
	.loc 1 17 28
	movl	$1132068864, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%r14, %rax
	orq	%rdx, %rax
	movq	%rax, %r14
	movl	$1132068864, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%r14d, %edx
	orq	%rdx, %rax
	movq	%rax, %r14
	.loc 1 17 5
	movss	.LC2(%rip), %xmm3
	movq	%r15, %rdx
	movq	%r14, %rcx
	call	addRectObject
	.loc 1 19 5
	movl	$6, %ecx
	call	SetTraceLogLevel
	.loc 1 20 5
	leaq	.LC3(%rip), %r8
	movl	$500, %edx
	movl	$500, %ecx
	call	InitWindow
	.loc 1 22 5
	call	BeginDrawing
	.loc 1 24 43
	movq	objects(%rip), %rax
	.loc 1 24 16
	leaq	32(%rax), %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	getAxisAlignedBBox
	.loc 1 25 49
	movss	-16(%rbp), %xmm0
	.loc 1 25 42
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rax
	andq	%r13, %rax
	orq	%rdx, %rax
	movq	%rax, %r13
	.loc 1 25 58
	movss	-12(%rbp), %xmm1
	.loc 1 25 69
	movss	-4(%rbp), %xmm0
	.loc 1 25 61
	addss	%xmm1, %xmm0
	.loc 1 25 42
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%r13d, %edx
	orq	%rdx, %rax
	movq	%rax, %r13
	.loc 1 25 20
	movq	%r13, %rcx
	call	getRenderPos
	movq	%rax, -24(%rbp)
	.loc 1 26 91
	movss	-4(%rbp), %xmm0
	.loc 1 26 5
	cvtss2sd	%xmm0, %xmm0
	.loc 1 26 81
	movss	-8(%rbp), %xmm1
	.loc 1 26 5
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm1, %xmm3
	.loc 1 26 71
	movss	-12(%rbp), %xmm1
	.loc 1 26 5
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm1, %xmm2
	.loc 1 26 62
	movss	-16(%rbp), %xmm1
	.loc 1 26 5
	cvtss2sd	%xmm1, %xmm1
	movq	%xmm3, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm3
	movq	%rax, %rcx
	movq	%xmm2, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm2
	movq	%rax, %rdx
	movq	%xmm1, %rax
	movq	%rax, %r8
	movq	%r8, %xmm1
	movsd	%xmm0, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
	.loc 1 32 16
	movb	$-1, %bl
	movl	$0, %eax
	movb	%al, %bh
	movl	%ebx, %eax
	andl	$-16711681, %eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	andl	$16777215, %eax
	orl	$1677721600, %eax
	movl	%eax, %ebx
	.loc 1 30 19
	movl	$0, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%r12, %rax
	orq	%rdx, %rax
	movq	%rax, %r12
	movl	$0, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%r12d, %edx
	orq	%rdx, %rax
	movq	%rax, %r12
	.loc 1 29 26
	movss	-24(%rbp), %xmm0
	.loc 1 29 20
	movd	%xmm0, %edx
	movq	%rsi, %rcx
	movabsq	$-4294967296, %rax
	andq	%rcx, %rax
	orq	%rdx, %rax
	movq	%rax, %rsi
	.loc 1 29 34
	movss	-20(%rbp), %xmm0
	.loc 1 29 20
	movd	%xmm0, %eax
	salq	$32, %rax
	movq	%rsi, %rdx
	movl	%edx, %edx
	orq	%rdx, %rax
	movq	%rax, %rsi
	.loc 1 29 44
	movss	-8(%rbp), %xmm0
	.loc 1 29 20
	movd	%xmm0, %edx
	movq	%rdi, %rcx
	movabsq	$-4294967296, %rax
	andq	%rcx, %rax
	orq	%rdx, %rax
	movq	%rax, %rdi
	.loc 1 29 54
	movss	-4(%rbp), %xmm0
	.loc 1 29 20
	movd	%xmm0, %eax
	salq	$32, %rax
	movq	%rdi, %rdx
	movl	%edx, %edx
	orq	%rdx, %rax
	movq	%rax, %rdi
	.loc 1 28 5
	movq	%rsi, -48(%rbp)
	movq	%rdi, -40(%rbp)
	leaq	-48(%rbp), %rax
	movl	%ebx, %r9d
	pxor	%xmm2, %xmm2
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	DrawRectanglePro
	.loc 1 35 5
	call	renderObjects
	.loc 1 36 5
	call	EndDrawing
	.loc 1 39 5
	movq	.LC5(%rip), %rax
	movq	%rax, %xmm0
	call	WaitTime
	.loc 1 41 5
	call	CloseWindow
	.loc 1 42 12
	movl	$0, %eax
	.loc 1 43 1
	addq	$136, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rdi
	.cfi_restore 5
	popq	%r12
	.cfi_restore 12
	popq	%r13
	.cfi_restore 13
	popq	%r14
	.cfi_restore 14
	popq	%r15
	.cfi_restore 15
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -72
	ret
	.cfi_endproc
.LFE124:
	.seh_endproc
	.globl	addCircleObject
	.def	addCircleObject;	.scl	2;	.type	32;	.endef
	.seh_proc	addCircleObject
addCircleObject:
.LFB125:
	.file 2 "render.c"
	.loc 2 92 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movss	%xmm2, 32(%rbp)
	.loc 2 95 5
	call	handleObjectsResize
	.loc 2 96 15
	movq	collisions(%rip), %rax
	.loc 2 96 23
	movl	8+objects(%rip), %edx
	movslq	%edx, %rdx
	.loc 2 96 15
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 96 30
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, (%rax)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 4(%rax)
	.loc 2 97 19
	movq	objects(%rip), %rcx
	.loc 2 97 32
	movl	8+objects(%rip), %eax
	.loc 2 97 37
	leal	1(%rax), %edx
	movl	%edx, 8+objects(%rip)
	cltq
	.loc 2 97 24
	salq	$5, %rax
	.loc 2 97 9
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	.loc 2 99 77
	movl	$4, %ecx
	call	malloc
	movq	%rax, %rcx
	.loc 2 99 10 discriminator 1
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 4(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 12(%rax)
	movq	-8(%rbp), %rax
	movq	%rcx, 24(%rax)
	.loc 2 100 25
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	.loc 2 100 36
	movss	32(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 2 101 1
	nop
	addq	$80, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE125:
	.seh_endproc
	.globl	addRectObject
	.def	addRectObject;	.scl	2;	.type	32;	.endef
	.seh_proc	addRectObject
addRectObject:
.LFB126:
	.loc 2 104 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movss	%xmm3, 40(%rbp)
	.loc 2 107 5
	call	handleObjectsResize
	.loc 2 108 15
	movq	collisions(%rip), %rax
	.loc 2 108 23
	movl	8+objects(%rip), %edx
	movslq	%edx, %rdx
	.loc 2 108 15
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 108 30
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, (%rax)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 4(%rax)
	.loc 2 109 19
	movq	objects(%rip), %rcx
	.loc 2 109 32
	movl	8+objects(%rip), %eax
	.loc 2 109 37
	leal	1(%rax), %edx
	movl	%edx, 8+objects(%rip)
	cltq
	.loc 2 109 24
	salq	$5, %rax
	.loc 2 109 9
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	.loc 2 111 75
	movl	$12, %ecx
	call	malloc
	movq	%rax, %rcx
	.loc 2 111 10 discriminator 1
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 4(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 12(%rax)
	movq	-8(%rbp), %rax
	movq	%rcx, 24(%rax)
	.loc 2 112 23
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	.loc 2 112 34
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	movss	40(%rbp), %xmm0
	movss	%xmm0, 8(%rax)
	.loc 2 113 1
	nop
	addq	$96, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE126:
	.seh_endproc
	.globl	handleObjectsResize
	.def	handleObjectsResize;	.scl	2;	.type	32;	.endef
	.seh_proc	handleObjectsResize
handleObjectsResize:
.LFB127:
	.loc 2 116 1
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
	.loc 2 117 16
	movl	8+objects(%rip), %edx
	.loc 2 117 31
	movl	12+objects(%rip), %eax
	.loc 2 117 8
	cmpl	%eax, %edx
	jl	.L8
	.loc 2 119 12
	movl	12+objects(%rip), %eax
	.loc 2 119 22
	addl	%eax, %eax
	movl	%eax, 12+objects(%rip)
	.loc 2 120 58
	movl	12+objects(%rip), %eax
	cltq
	.loc 2 120 29
	salq	$5, %rax
	movq	%rax, %rdx
	.loc 2 120 44
	movq	objects(%rip), %rax
	.loc 2 120 29
	movq	%rax, %rcx
	call	realloc
	.loc 2 120 18 discriminator 1
	movq	%rax, objects(%rip)
	.loc 2 121 45
	movl	12+objects(%rip), %eax
	cltq
	.loc 2 121 18
	leaq	0(,%rax,8), %rdx
	movq	collisions(%rip), %rax
	movq	%rax, %rcx
	call	realloc
	.loc 2 121 16 discriminator 1
	movq	%rax, collisions(%rip)
	jmp	.L5
.L8:
	.loc 2 117 42
	nop
.L5:
	.loc 2 122 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE127:
	.seh_endproc
	.globl	freeObjects
	.def	freeObjects;	.scl	2;	.type	32;	.endef
	.seh_proc	freeObjects
freeObjects:
.LFB128:
	.loc 2 125 1
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
	.loc 2 128 12
	movl	$0, -4(%rbp)
	.loc 2 128 5
	jmp	.L10
.L11:
	.loc 2 129 21
	movq	objects(%rip), %rax
	.loc 2 129 26
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	.loc 2 129 9
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 128 36 discriminator 3
	addl	$1, -4(%rbp)
.L10:
	.loc 2 128 28 discriminator 1
	movl	8+objects(%rip), %eax
	.loc 2 128 19 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L11
	.loc 2 131 17
	movq	objects(%rip), %rax
	.loc 2 131 5
	movq	%rax, %rcx
	call	free
	.loc 2 132 1
	nop
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE128:
	.seh_endproc
	.globl	renderObjects
	.def	renderObjects;	.scl	2;	.type	32;	.endef
	.seh_proc	renderObjects
renderObjects:
.LFB129:
	.loc 2 135 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%r14
	.seh_pushreg	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.seh_pushreg	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.seh_pushreg	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 48
	.cfi_offset 5, -48
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 56
	.cfi_offset 4, -56
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -64
	subq	$192, %rsp
	.seh_stackalloc	192
	.cfi_def_cfa_offset 256
	leaq	176(%rsp), %rbp
	.seh_setframe	%rbp, 176
	.cfi_def_cfa 6, 80
	movups	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 176
	.cfi_offset 23, -80
	.seh_endprologue
	.loc 2 140 12
	movl	$0, -4(%rbp)
	.loc 2 140 5
	jmp	.L13
.L18:
	.loc 2 142 23
	movq	objects(%rip), %rax
	.loc 2 142 28
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	.loc 2 142 13
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	.loc 2 144 35
	movq	collisions(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 144 13
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	isCollision
	.loc 2 144 12 discriminator 1
	testb	%al, %al
	je	.L14
.LBB2:
	.loc 2 146 67
	movq	collisions(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 146 33
	movss	4(%rax), %xmm0
	movq	-16(%rbp), %rax
	movq	12(%rax), %rax
	movaps	%xmm0, %xmm1
	movq	%rax, %rcx
	call	calcBounceVec
	movq	%rax, -64(%rbp)
	.loc 2 147 88
	movq	collisions(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 147 17
	movss	(%rax), %xmm0
	.loc 2 147 53
	movq	objects(%rip), %rax
	.loc 2 147 58
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	.loc 2 147 17
	movq	-64(%rbp), %rdx
	movq	12(%rax), %rax
	movaps	%xmm0, %xmm2
	movq	%rax, %rcx
	call	calcCollisionVec
	.loc 2 147 17 is_stmt 0 discriminator 1
	movq	%rax, %rcx
	call	getFrameVel
	movq	%rax, -56(%rbp)
	.loc 2 148 22 is_stmt 1
	movq	-16(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 12(%rax)
.LBE2:
	jmp	.L15
.L14:
	.loc 2 152 36
	movq	objects(%rip), %rax
	.loc 2 152 41
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	.loc 2 152 17
	movq	12(%rax), %rax
	movq	%rax, %rcx
	call	getFrameVel
	movq	%rax, -56(%rbp)
.L15:
	.loc 2 155 20
	movq	-16(%rbp), %r14
	movq	-56(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	4(%rax), %rax
	movq	%rax, %rcx
	call	vecAdd
	movq	%rax, 4(%r14)
	.loc 2 157 16
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	.loc 2 157 12
	testl	%eax, %eax
	jne	.L16
.LBB3:
	.loc 2 161 27
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 2 162 70
	movb	$-26, %bl
	movl	$41, %eax
	movb	%al, %bh
	movl	%ebx, %eax
	andl	$-16711681, %eax
	orl	$3604480, %eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	orl	$-16777216, %eax
	movl	%eax, %ebx
	.loc 2 162 13
	movq	-48(%rbp), %rax
	movss	(%rax), %xmm6
	movq	-16(%rbp), %rax
	movq	4(%rax), %rax
	movq	%rax, %rcx
	call	getRenderPos
	.loc 2 162 13 is_stmt 0 discriminator 1
	movl	%ebx, %r8d
	movaps	%xmm6, %xmm1
	movq	%rax, %rcx
	call	DrawCircleV
.LBE3:
	jmp	.L17
.L16:
	.loc 2 164 21 is_stmt 1
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	.loc 2 164 17
	cmpl	$1, %eax
	jne	.L17
.LBB4:
	.loc 2 169 25
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 2 171 19
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -28(%rbp)
	.loc 2 171 38
	movq	-24(%rbp), %rax
	movss	4(%rax), %xmm0
	movss	%xmm0, -32(%rbp)
	.loc 2 171 57
	movq	-24(%rbp), %rax
	movss	8(%rax), %xmm0
	movss	%xmm0, -36(%rbp)
	.loc 2 172 25
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	calcCentroid
	movq	%rax, -72(%rbp)
	.loc 2 174 33
	leaq	-96(%rbp), %rax
	movss	-36(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	movq	%rax, %rcx
	call	rotationMatrix
	.loc 2 175 72
	movq	-16(%rbp), %rax
	movss	4(%rax), %xmm0
	.loc 2 175 62
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rax
	andq	%r12, %rax
	orq	%rdx, %rax
	movq	%rax, %r12
	.loc 2 175 84
	movq	-16(%rbp), %rax
	movss	8(%rax), %xmm0
	.loc 2 175 87
	addss	-32(%rbp), %xmm0
	.loc 2 175 62
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%r12d, %edx
	orq	%rdx, %rax
	movq	%rax, %r12
	.loc 2 175 28
	movq	-72(%rbp), %rax
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	vecSub
	movq	%rax, %rcx
	.loc 2 175 28 is_stmt 0 discriminator 1
	movq	-96(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdx
	call	matrixVecMultiply
	movq	%rax, -104(%rbp)
	.loc 2 177 28 is_stmt 1
	movq	-104(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	vecAdd
	.loc 2 177 28 is_stmt 0 discriminator 1
	movq	%rax, %rcx
	call	getRenderPos
	movq	%rax, -112(%rbp)
	.loc 2 183 23 is_stmt 1
	movl	-132(%rbp), %ecx
	movb	$-1, %cl
	movl	$-1, %eax
	movb	%al, %ch
	orl	$16711680, %ecx
	movl	%ecx, %eax
	orl	$-16777216, %eax
	movl	%eax, -132(%rbp)
	.loc 2 179 13
	movl	-36(%rbp), %eax
	movd	%eax, %xmm0
	call	getRenderRotation
	movd	%xmm0, %edx
	.loc 2 181 27
	movl	$0, %eax
	movl	%eax, %ecx
	movabsq	$-4294967296, %rax
	andq	%r13, %rax
	orq	%rcx, %rax
	movq	%rax, %r13
	movl	$0, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%r13d, %ecx
	orq	%rcx, %rax
	movq	%rax, %r13
	.loc 2 180 34
	movss	-112(%rbp), %xmm0
	.loc 2 180 28
	movd	%xmm0, %ecx
	movq	%rsi, %r8
	movabsq	$-4294967296, %rax
	andq	%r8, %rax
	orq	%rcx, %rax
	movq	%rax, %rsi
	.loc 2 180 42
	movss	-108(%rbp), %xmm0
	.loc 2 180 28
	movd	%xmm0, %eax
	salq	$32, %rax
	movq	%rsi, %rcx
	movl	%ecx, %ecx
	orq	%rcx, %rax
	movq	%rax, %rsi
	movl	-28(%rbp), %eax
	movl	%eax, %ecx
	movq	%rdi, %r8
	movabsq	$-4294967296, %rax
	andq	%r8, %rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	movl	-32(%rbp), %eax
	movl	%eax, %eax
	salq	$32, %rax
	movq	%rdi, %rcx
	movl	%ecx, %ecx
	orq	%rcx, %rax
	movq	%rax, %rdi
	.loc 2 179 13
	movq	%rsi, -128(%rbp)
	movq	%rdi, -120(%rbp)
	leaq	-128(%rbp), %rax
	movl	-132(%rbp), %r9d
	movd	%edx, %xmm2
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	DrawRectanglePro
.L17:
.LBE4:
	.loc 2 140 36 discriminator 2
	addl	$1, -4(%rbp)
.L13:
	.loc 2 140 28 discriminator 1
	movl	8+objects(%rip), %eax
	.loc 2 140 19 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L18
	.loc 2 186 1
	nop
	nop
	movups	0(%rbp), %xmm6
	addq	$192, %rsp
	.cfi_restore 23
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rdi
	.cfi_restore 5
	popq	%r12
	.cfi_restore 12
	popq	%r13
	.cfi_restore 13
	popq	%r14
	.cfi_restore 14
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -136
	ret
	.cfi_endproc
.LFE129:
	.seh_endproc
	.globl	getRenderPos
	.def	getRenderPos;	.scl	2;	.type	32;	.endef
	.seh_proc	getRenderPos
getRenderPos:
.LFB130:
	.loc 2 191 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.seh_stackalloc	56
	.cfi_def_cfa_offset 80
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.cfi_def_cfa 6, 48
	movups	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 32
	.cfi_offset 23, -48
	.seh_endprologue
	movq	%rcx, 48(%rbp)
	.loc 2 193 26
	movss	48(%rbp), %xmm6
	.loc 2 193 30
	call	GetScreenHeight
	.loc 2 193 48 discriminator 1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	.loc 2 193 53 discriminator 1
	movss	52(%rbp), %xmm1
	.loc 2 193 48 discriminator 1
	subss	%xmm1, %xmm0
	.loc 2 193 56 discriminator 1
	movss	.LC0(%rip), %xmm1
	subss	%xmm1, %xmm0
	.loc 2 193 12 discriminator 1
	movaps	%xmm6, %xmm1
	movd	%xmm1, %edx
	movabsq	$-4294967296, %rax
	andq	%rbx, %rax
	orq	%rdx, %rax
	movq	%rax, %rbx
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%ebx, %edx
	orq	%rdx, %rax
	movq	%rax, %rbx
	.loc 2 193 12 is_stmt 0
	movq	%rbx, %rax
	.loc 2 194 1 is_stmt 1
	movups	0(%rbp), %xmm6
	addq	$56, %rsp
	.cfi_restore 23
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -40
	ret
	.cfi_endproc
.LFE130:
	.seh_endproc
	.globl	getRenderRotation
	.def	getRenderRotation;	.scl	2;	.type	32;	.endef
	.seh_proc	getRenderRotation
getRenderRotation:
.LFB131:
	.loc 2 197 1
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
	.loc 2 198 23
	movss	16(%rbp), %xmm1
	movss	.LC7(%rip), %xmm0
	mulss	%xmm1, %xmm0
	.loc 2 198 12
	movss	.LC8(%rip), %xmm1
	xorps	%xmm1, %xmm0
	.loc 2 199 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE131:
	.seh_endproc
	.globl	getFrameVel
	.def	getFrameVel;	.scl	2;	.type	32;	.endef
	.seh_proc	getFrameVel
getFrameVel:
.LFB132:
	.loc 2 202 1
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
	.loc 2 204 12
	movss	speedMod(%rip), %xmm0
	movl	targetFPS(%rip), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	divss	%xmm1, %xmm0
	movq	16(%rbp), %rax
	movaps	%xmm0, %xmm1
	movq	%rax, %rcx
	call	vecScale
	.loc 2 205 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE132:
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC2:
	.long	1061752795
	.align 8
.LC5:
	.long	0
	.long	1077149696
	.align 4
.LC6:
	.long	-1082130432
	.align 4
.LC7:
	.long	1113927392
	.align 16
.LC8:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.text
.Letext0:
	.file 3 "C:/msys64/ucrt64/include/raylib.h"
	.file 4 "C:/msys64/ucrt64/include/corecrt.h"
	.file 5 "../include/ballPhysics.h"
	.file 6 "C:/msys64/ucrt64/include/stdlib.h"
	.file 7 "C:/msys64/ucrt64/include/stdio.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0xaf3
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x15
	.ascii "GNU C17 13.1.0 -mtune=generic -march=nocona -g -O0\0"
	.byte	0x1d
	.secrel32	.LASF0
	.secrel32	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x16
	.long	0x5d
	.uleb128 0xd
	.ascii "Vector2\0"
	.byte	0x8
	.byte	0x3
	.byte	0xc4
	.long	0x91
	.uleb128 0x2
	.ascii "x\0"
	.byte	0x3
	.byte	0xc5
	.byte	0xb
	.long	0x91
	.byte	0
	.uleb128 0x2
	.ascii "y\0"
	.byte	0x3
	.byte	0xc6
	.byte	0xb
	.long	0x91
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0xb
	.ascii "Vector2\0"
	.byte	0x3
	.byte	0xc7
	.byte	0x3
	.long	0x6a
	.uleb128 0xd
	.ascii "Color\0"
	.byte	0x4
	.byte	0x3
	.byte	0xe4
	.long	0xe5
	.uleb128 0x2
	.ascii "r\0"
	.byte	0x3
	.byte	0xe5
	.byte	0x13
	.long	0xe5
	.byte	0
	.uleb128 0x2
	.ascii "g\0"
	.byte	0x3
	.byte	0xe6
	.byte	0x13
	.long	0xe5
	.byte	0x1
	.uleb128 0x2
	.ascii "b\0"
	.byte	0x3
	.byte	0xe7
	.byte	0x13
	.long	0xe5
	.byte	0x2
	.uleb128 0x2
	.ascii "a\0"
	.byte	0x3
	.byte	0xe8
	.byte	0x13
	.long	0xe5
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0xb
	.ascii "Color\0"
	.byte	0x3
	.byte	0xe9
	.byte	0x3
	.long	0xaa
	.uleb128 0x9
	.secrel32	.LASF2
	.byte	0x10
	.byte	0x3
	.byte	0xec
	.long	0x146
	.uleb128 0x2
	.ascii "x\0"
	.byte	0x3
	.byte	0xed
	.byte	0xb
	.long	0x91
	.byte	0
	.uleb128 0x2
	.ascii "y\0"
	.byte	0x3
	.byte	0xee
	.byte	0xb
	.long	0x91
	.byte	0x4
	.uleb128 0x2
	.ascii "width\0"
	.byte	0x3
	.byte	0xef
	.byte	0xb
	.long	0x91
	.byte	0x8
	.uleb128 0x2
	.ascii "height\0"
	.byte	0x3
	.byte	0xf0
	.byte	0xb
	.long	0x91
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF2
	.byte	0x3
	.byte	0xf1
	.long	0x104
	.uleb128 0x17
	.byte	0x8
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x4
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x18
	.byte	0x7
	.byte	0x4
	.long	0x15a
	.byte	0x3
	.word	0x20e
	.byte	0xe
	.long	0x211
	.uleb128 0x5
	.ascii "LOG_ALL\0"
	.byte	0
	.uleb128 0x5
	.ascii "LOG_TRACE\0"
	.byte	0x1
	.uleb128 0x5
	.ascii "LOG_DEBUG\0"
	.byte	0x2
	.uleb128 0x5
	.ascii "LOG_INFO\0"
	.byte	0x3
	.uleb128 0x5
	.ascii "LOG_WARNING\0"
	.byte	0x4
	.uleb128 0x5
	.ascii "LOG_ERROR\0"
	.byte	0x5
	.uleb128 0x5
	.ascii "LOG_FATAL\0"
	.byte	0x6
	.uleb128 0x5
	.ascii "LOG_NONE\0"
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.long	0x65
	.uleb128 0xb
	.ascii "size_t\0"
	.byte	0x4
	.byte	0x23
	.byte	0x2a
	.long	0x180
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x4
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x19
	.secrel32	.LASF3
	.byte	0x7
	.byte	0x4
	.long	0x15a
	.byte	0x5
	.byte	0x26
	.byte	0xe
	.long	0x286
	.uleb128 0x5
	.ascii "OBJ_CIRCLE\0"
	.byte	0
	.uleb128 0x5
	.ascii "OBJ_RECT\0"
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF3
	.byte	0x5
	.byte	0x2a
	.long	0x25b
	.uleb128 0xd
	.ascii "Object\0"
	.byte	0x20
	.byte	0x5
	.byte	0x2c
	.long	0x2da
	.uleb128 0x2
	.ascii "type\0"
	.byte	0x5
	.byte	0x2e
	.byte	0x10
	.long	0x286
	.byte	0
	.uleb128 0x2
	.ascii "pos\0"
	.byte	0x5
	.byte	0x2f
	.byte	0xd
	.long	0x9a
	.byte	0x4
	.uleb128 0x2
	.ascii "vel\0"
	.byte	0x5
	.byte	0x30
	.byte	0xd
	.long	0x9a
	.byte	0xc
	.uleb128 0x2
	.ascii "typeObj\0"
	.byte	0x5
	.byte	0x31
	.byte	0xb
	.long	0x151
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.ascii "Object\0"
	.byte	0x5
	.byte	0x32
	.byte	0x3
	.long	0x291
	.uleb128 0x9
	.secrel32	.LASF4
	.byte	0x10
	.byte	0x5
	.byte	0x34
	.long	0x324
	.uleb128 0x2
	.ascii "data\0"
	.byte	0x5
	.byte	0x36
	.byte	0xd
	.long	0x324
	.byte	0
	.uleb128 0x2
	.ascii "size\0"
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.long	0x153
	.byte	0x8
	.uleb128 0x2
	.ascii "capacity\0"
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.long	0x153
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.long	0x2da
	.uleb128 0x7
	.secrel32	.LASF4
	.byte	0x5
	.byte	0x39
	.long	0x2e9
	.uleb128 0x9
	.secrel32	.LASF5
	.byte	0x4
	.byte	0x5
	.byte	0x3b
	.long	0x34c
	.uleb128 0x12
	.secrel32	.LASF6
	.byte	0x3d
	.long	0x91
	.byte	0
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF5
	.byte	0x5
	.byte	0x3e
	.long	0x334
	.uleb128 0x9
	.secrel32	.LASF7
	.byte	0xc
	.byte	0x5
	.byte	0x40
	.long	0x37d
	.uleb128 0x2
	.ascii "size\0"
	.byte	0x5
	.byte	0x42
	.byte	0xd
	.long	0x9a
	.byte	0
	.uleb128 0x12
	.secrel32	.LASF8
	.byte	0x43
	.long	0x91
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF7
	.byte	0x5
	.byte	0x44
	.long	0x357
	.uleb128 0x9
	.secrel32	.LASF9
	.byte	0x8
	.byte	0x5
	.byte	0x48
	.long	0x3b5
	.uleb128 0x2
	.ascii "prop\0"
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x91
	.byte	0
	.uleb128 0x2
	.ascii "tanAngle\0"
	.byte	0x5
	.byte	0x4b
	.byte	0xb
	.long	0x91
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF9
	.byte	0x5
	.byte	0x4c
	.long	0x388
	.uleb128 0xd
	.ascii "AABBox\0"
	.byte	0x10
	.byte	0x5
	.byte	0x4e
	.long	0x3eb
	.uleb128 0x2
	.ascii "pos\0"
	.byte	0x5
	.byte	0x50
	.byte	0xd
	.long	0x9a
	.byte	0
	.uleb128 0x2
	.ascii "size\0"
	.byte	0x5
	.byte	0x51
	.byte	0xd
	.long	0x9a
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.ascii "AABBox\0"
	.byte	0x5
	.byte	0x52
	.byte	0x3
	.long	0x3c0
	.uleb128 0x9
	.secrel32	.LASF10
	.byte	0x10
	.byte	0x5
	.byte	0x54
	.long	0x433
	.uleb128 0x2
	.ascii "a\0"
	.byte	0x5
	.byte	0x56
	.byte	0xb
	.long	0x91
	.byte	0
	.uleb128 0x2
	.ascii "b\0"
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.long	0x91
	.byte	0x4
	.uleb128 0x2
	.ascii "c\0"
	.byte	0x5
	.byte	0x58
	.byte	0xb
	.long	0x91
	.byte	0x8
	.uleb128 0x2
	.ascii "d\0"
	.byte	0x5
	.byte	0x59
	.byte	0xb
	.long	0x91
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF10
	.byte	0x5
	.byte	0x5a
	.long	0x3fa
	.uleb128 0x3
	.ascii "objects\0"
	.byte	0x2
	.byte	0x9
	.byte	0x13
	.long	0x329
	.uleb128 0x9
	.byte	0x3
	.quad	objects
	.uleb128 0x3
	.ascii "collisions\0"
	.byte	0x2
	.byte	0xa
	.byte	0x13
	.long	0x475
	.uleb128 0x9
	.byte	0x3
	.quad	collisions
	.uleb128 0xc
	.long	0x3b5
	.uleb128 0x3
	.ascii "targetFPS\0"
	.byte	0x2
	.byte	0xb
	.byte	0xc
	.long	0x153
	.uleb128 0x9
	.byte	0x3
	.quad	targetFPS
	.uleb128 0x3
	.ascii "nBalls\0"
	.byte	0x2
	.byte	0xb
	.byte	0x17
	.long	0x153
	.uleb128 0x9
	.byte	0x3
	.quad	nBalls
	.uleb128 0x1a
	.secrel32	.LASF6
	.byte	0x2
	.byte	0xb
	.byte	0x1f
	.long	0x153
	.uleb128 0x9
	.byte	0x3
	.quad	radius
	.uleb128 0x3
	.ascii "speedMod\0"
	.byte	0x2
	.byte	0xc
	.byte	0xe
	.long	0x91
	.uleb128 0x9
	.byte	0x3
	.quad	speedMod
	.uleb128 0x6
	.ascii "vecScale\0"
	.byte	0x5
	.byte	0x77
	.byte	0x9
	.long	0x9a
	.long	0x500
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x91
	.byte	0
	.uleb128 0x1b
	.ascii "GetScreenHeight\0"
	.byte	0x3
	.word	0x3ba
	.byte	0x6
	.long	0x153
	.uleb128 0x6
	.ascii "matrixVecMultiply\0"
	.byte	0x5
	.byte	0x7c
	.byte	0x9
	.long	0x9a
	.long	0x542
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x433
	.byte	0
	.uleb128 0x6
	.ascii "vecSub\0"
	.byte	0x5
	.byte	0x76
	.byte	0x9
	.long	0x9a
	.long	0x560
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x9a
	.byte	0
	.uleb128 0x6
	.ascii "rotationMatrix\0"
	.byte	0x5
	.byte	0x7d
	.byte	0xb
	.long	0x433
	.long	0x581
	.uleb128 0x1
	.long	0x91
	.byte	0
	.uleb128 0x6
	.ascii "calcCentroid\0"
	.byte	0x5
	.byte	0x7e
	.byte	0x9
	.long	0x9a
	.long	0x5a0
	.uleb128 0x1
	.long	0x324
	.byte	0
	.uleb128 0xa
	.ascii "DrawCircleV\0"
	.byte	0x3
	.word	0x4a1
	.byte	0x7
	.long	0x5c5
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x91
	.uleb128 0x1
	.long	0xf6
	.byte	0
	.uleb128 0x6
	.ascii "vecAdd\0"
	.byte	0x5
	.byte	0x75
	.byte	0x9
	.long	0x9a
	.long	0x5e3
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x9a
	.byte	0
	.uleb128 0x6
	.ascii "calcCollisionVec\0"
	.byte	0x5
	.byte	0x70
	.byte	0x9
	.long	0x9a
	.long	0x610
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x91
	.byte	0
	.uleb128 0x6
	.ascii "calcBounceVec\0"
	.byte	0x5
	.byte	0x6f
	.byte	0x9
	.long	0x9a
	.long	0x635
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x91
	.byte	0
	.uleb128 0x6
	.ascii "isCollision\0"
	.byte	0x5
	.byte	0x71
	.byte	0x5
	.long	0x19a
	.long	0x653
	.uleb128 0x1
	.long	0x3b5
	.byte	0
	.uleb128 0xa
	.ascii "free\0"
	.byte	0x6
	.word	0x219
	.byte	0x23
	.long	0x667
	.uleb128 0x1
	.long	0x151
	.byte	0
	.uleb128 0xf
	.ascii "realloc\0"
	.byte	0x6
	.word	0x21b
	.byte	0x24
	.long	0x151
	.long	0x687
	.uleb128 0x1
	.long	0x151
	.uleb128 0x1
	.long	0x216
	.byte	0
	.uleb128 0x10
	.ascii "CloseWindow\0"
	.word	0x3a1
	.uleb128 0xa
	.ascii "WaitTime\0"
	.byte	0x3
	.word	0x3d3
	.byte	0x7
	.long	0x6ae
	.uleb128 0x1
	.long	0x242
	.byte	0
	.uleb128 0x10
	.ascii "EndDrawing\0"
	.word	0x3e0
	.uleb128 0xa
	.ascii "DrawRectanglePro\0"
	.byte	0x3
	.word	0x4aa
	.byte	0x7
	.long	0x6eb
	.uleb128 0x1
	.long	0x146
	.uleb128 0x1
	.long	0x9a
	.uleb128 0x1
	.long	0x91
	.uleb128 0x1
	.long	0xf6
	.byte	0
	.uleb128 0xf
	.ascii "printf\0"
	.byte	0x7
	.word	0x1f9
	.byte	0x22
	.long	0x153
	.long	0x706
	.uleb128 0x1
	.long	0x211
	.uleb128 0x1c
	.byte	0
	.uleb128 0x6
	.ascii "getAxisAlignedBBox\0"
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.long	0x3eb
	.long	0x72b
	.uleb128 0x1
	.long	0x324
	.byte	0
	.uleb128 0x10
	.ascii "BeginDrawing\0"
	.word	0x3df
	.uleb128 0xa
	.ascii "InitWindow\0"
	.byte	0x3
	.word	0x39f
	.byte	0x7
	.long	0x75f
	.uleb128 0x1
	.long	0x153
	.uleb128 0x1
	.long	0x153
	.uleb128 0x1
	.long	0x211
	.byte	0
	.uleb128 0xa
	.ascii "SetTraceLogLevel\0"
	.byte	0x3
	.word	0x417
	.byte	0x7
	.long	0x77f
	.uleb128 0x1
	.long	0x153
	.byte	0
	.uleb128 0xf
	.ascii "malloc\0"
	.byte	0x6
	.word	0x21a
	.byte	0x24
	.long	0x151
	.long	0x799
	.uleb128 0x1
	.long	0x216
	.byte	0
	.uleb128 0x13
	.ascii "getFrameVel\0"
	.byte	0xc9
	.long	0x9a
	.quad	.LFB132
	.quad	.LFE132-.LFB132
	.uleb128 0x1
	.byte	0x9c
	.long	0x7d0
	.uleb128 0x8
	.ascii "vel\0"
	.byte	0xc9
	.byte	0x1d
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.ascii "getRenderRotation\0"
	.byte	0x2
	.byte	0xc4
	.byte	0x7
	.long	0x91
	.quad	.LFB131
	.quad	.LFE131-.LFB131
	.uleb128 0x1
	.byte	0x9c
	.long	0x80f
	.uleb128 0x11
	.secrel32	.LASF8
	.byte	0xc4
	.byte	0x1f
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.ascii "getRenderPos\0"
	.byte	0xbe
	.long	0x9a
	.quad	.LFB130
	.quad	.LFE130-.LFB130
	.uleb128 0x1
	.byte	0x9c
	.long	0x847
	.uleb128 0x8
	.ascii "pos\0"
	.byte	0xbe
	.byte	0x1e
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.ascii "renderObjects\0"
	.byte	0x86
	.quad	.LFB129
	.quad	.LFE129-.LFB129
	.uleb128 0x1
	.byte	0x9c
	.long	0x980
	.uleb128 0x3
	.ascii "i\0"
	.byte	0x2
	.byte	0x88
	.byte	0x9
	.long	0x153
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x3
	.ascii "d\0"
	.byte	0x2
	.byte	0x89
	.byte	0xd
	.long	0x9a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x3
	.ascii "obj\0"
	.byte	0x2
	.byte	0x8a
	.byte	0xd
	.long	0x324
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x14
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x8c5
	.uleb128 0x3
	.ascii "bounceVec\0"
	.byte	0x2
	.byte	0x92
	.byte	0x15
	.long	0x9a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.uleb128 0x14
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x8ed
	.uleb128 0x3
	.ascii "obj_C\0"
	.byte	0x2
	.byte	0xa1
	.byte	0x1b
	.long	0x980
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x1e
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x3
	.ascii "obj_R\0"
	.byte	0x2
	.byte	0xa9
	.byte	0x19
	.long	0x985
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x3
	.ascii "w\0"
	.byte	0x2
	.byte	0xab
	.byte	0x13
	.long	0x91
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x3
	.ascii "h\0"
	.byte	0x2
	.byte	0xab
	.byte	0x26
	.long	0x91
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3
	.ascii "r\0"
	.byte	0x2
	.byte	0xab
	.byte	0x39
	.long	0x91
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x3
	.ascii "c\0"
	.byte	0x2
	.byte	0xac
	.byte	0x15
	.long	0x9a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x3
	.ascii "rMatrix\0"
	.byte	0x2
	.byte	0xae
	.byte	0x17
	.long	0x433
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3
	.ascii "rVec\0"
	.byte	0x2
	.byte	0xaf
	.byte	0x15
	.long	0x9a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x3
	.ascii "rPos\0"
	.byte	0x2
	.byte	0xb1
	.byte	0x15
	.long	0x9a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x34c
	.uleb128 0xc
	.long	0x37d
	.uleb128 0xe
	.ascii "freeObjects\0"
	.byte	0x7c
	.quad	.LFB128
	.quad	.LFE128-.LFB128
	.uleb128 0x1
	.byte	0x9c
	.long	0x9bc
	.uleb128 0x3
	.ascii "i\0"
	.byte	0x2
	.byte	0x7e
	.byte	0x9
	.long	0x153
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1f
	.ascii "handleObjectsResize\0"
	.byte	0x2
	.byte	0x73
	.byte	0x6
	.quad	.LFB127
	.quad	.LFE127-.LFB127
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.ascii "addRectObject\0"
	.byte	0x67
	.quad	.LFB126
	.quad	.LFE126-.LFB126
	.uleb128 0x1
	.byte	0x9c
	.long	0xa55
	.uleb128 0x8
	.ascii "pos\0"
	.byte	0x67
	.byte	0x1c
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.ascii "vel\0"
	.byte	0x67
	.byte	0x29
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x8
	.ascii "size\0"
	.byte	0x67
	.byte	0x36
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x11
	.secrel32	.LASF8
	.byte	0x67
	.byte	0x42
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x3
	.ascii "obj\0"
	.byte	0x2
	.byte	0x69
	.byte	0xd
	.long	0x324
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.ascii "addCircleObject\0"
	.byte	0x5b
	.quad	.LFB125
	.quad	.LFE125-.LFB125
	.uleb128 0x1
	.byte	0x9c
	.long	0xab7
	.uleb128 0x8
	.ascii "pos\0"
	.byte	0x5b
	.byte	0x1e
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.ascii "vel\0"
	.byte	0x5b
	.byte	0x2b
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.secrel32	.LASF6
	.byte	0x5b
	.byte	0x36
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x3
	.ascii "obj\0"
	.byte	0x2
	.byte	0x5d
	.byte	0xd
	.long	0x324
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x20
	.ascii "main\0"
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.long	0x153
	.quad	.LFB124
	.quad	.LFE124-.LFB124
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.ascii "b\0"
	.byte	0x1
	.byte	0x18
	.byte	0xc
	.long	0x3eb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3
	.ascii "bPos\0"
	.byte	0x1
	.byte	0x19
	.byte	0xd
	.long	0x9a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
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
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
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
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
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
.LASF2:
	.ascii "Rectangle\0"
.LASF6:
	.ascii "radius\0"
.LASF8:
	.ascii "rotation\0"
.LASF3:
	.ascii "ObjectType\0"
.LASF4:
	.ascii "ObjectList\0"
.LASF10:
	.ascii "Matrix2x2\0"
.LASF9:
	.ascii "Collision\0"
.LASF7:
	.ascii "RectObject\0"
.LASF5:
	.ascii "CircleObject\0"
	.section	.debug_line_str,"dr"
.LASF1:
	.ascii "C:\\\\msys64\\\\home\\\\alexa\\\\ballPhysics\\\\src\0"
.LASF0:
	.ascii "render.c\0"
	.ident	"GCC: (Rev7, Built by MSYS2 project) 13.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	SetTraceLogLevel;	.scl	2;	.type	32;	.endef
	.def	InitWindow;	.scl	2;	.type	32;	.endef
	.def	BeginDrawing;	.scl	2;	.type	32;	.endef
	.def	getAxisAlignedBBox;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	DrawRectanglePro;	.scl	2;	.type	32;	.endef
	.def	EndDrawing;	.scl	2;	.type	32;	.endef
	.def	WaitTime;	.scl	2;	.type	32;	.endef
	.def	CloseWindow;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	isCollision;	.scl	2;	.type	32;	.endef
	.def	calcBounceVec;	.scl	2;	.type	32;	.endef
	.def	calcCollisionVec;	.scl	2;	.type	32;	.endef
	.def	vecAdd;	.scl	2;	.type	32;	.endef
	.def	DrawCircleV;	.scl	2;	.type	32;	.endef
	.def	calcCentroid;	.scl	2;	.type	32;	.endef
	.def	rotationMatrix;	.scl	2;	.type	32;	.endef
	.def	vecSub;	.scl	2;	.type	32;	.endef
	.def	matrixVecMultiply;	.scl	2;	.type	32;	.endef
	.def	GetScreenHeight;	.scl	2;	.type	32;	.endef
	.def	vecScale;	.scl	2;	.type	32;	.endef
