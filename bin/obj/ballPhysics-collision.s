	.file	"collision.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "C://msys64//home//alexa//ballPhysics//src" "collision.c"
	.globl	calcBounceVec
	.def	calcBounceVec;	.scl	2;	.type	32;	.endef
	.seh_proc	calcBounceVec
calcBounceVec:
.LFB119:
	.file 1 "collision.c"
	.loc 1 15 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movss	%xmm1, 24(%rbp)
	.loc 1 16 19
	movl	24(%rbp), %eax
	movd	%eax, %xmm0
	call	cosf
	movd	%xmm0, %eax
	.loc 1 16 13 discriminator 1
	movl	%eax, -8(%rbp)
	.loc 1 16 39 discriminator 1
	movl	24(%rbp), %eax
	movd	%eax, %xmm0
	call	sinf
	movd	%xmm0, %eax
	.loc 1 16 13 discriminator 2
	movl	%eax, -4(%rbp)
	.loc 1 18 21
	movq	-8(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	dotProduct
	movd	%xmm0, %edx
	.loc 1 18 21 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movd	%edx, %xmm1
	movq	%rax, %rcx
	call	vecScale
	movq	%rax, -16(%rbp)
	.loc 1 18 65 is_stmt 1 discriminator 2
	movq	-16(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	vecSub
	movq	%rax, -24(%rbp)
	.loc 1 20 12
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	vecSub
	.loc 1 20 12 is_stmt 0 discriminator 1
	movq	%rax, %rcx
	call	vecInverse
	.loc 1 21 1 is_stmt 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE119:
	.seh_endproc
	.globl	calcCollisionVec
	.def	calcCollisionVec;	.scl	2;	.type	32;	.endef
	.seh_proc	calcCollisionVec
calcCollisionVec:
.LFB120:
	.loc 1 27 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.seh_stackalloc	40
	.cfi_def_cfa_offset 64
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.cfi_def_cfa 6, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movss	%xmm2, 48(%rbp)
	.loc 1 28 12
	movss	.LC0(%rip), %xmm0
	subss	48(%rbp), %xmm0
	movq	40(%rbp), %rax
	movaps	%xmm0, %xmm1
	movq	%rax, %rcx
	call	vecScale
	movq	%rax, %rbx
	.loc 1 28 12 is_stmt 0 discriminator 1
	movss	48(%rbp), %xmm0
	movq	32(%rbp), %rax
	movaps	%xmm0, %xmm1
	movq	%rax, %rcx
	call	vecScale
	.loc 1 28 12 discriminator 2
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	vecAdd
	.loc 1 29 1 is_stmt 1
	addq	$40, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -24
	ret
	.cfi_endproc
.LFE120:
	.seh_endproc
	.globl	isCollision
	.def	isCollision;	.scl	2;	.type	32;	.endef
	.seh_proc	isCollision
isCollision:
.LFB121:
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
	.loc 1 33 16
	movss	16(%rbp), %xmm0
	.loc 1 33 22
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	setnb	%al
	.loc 1 34 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE121:
	.seh_endproc
	.globl	findCollisions
	.def	findCollisions;	.scl	2;	.type	32;	.endef
	.seh_proc	findCollisions
findCollisions:
.LFB122:
	.loc 1 37 1
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
	subq	$80, %rsp
	.seh_stackalloc	80
	.cfi_def_cfa_offset 112
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.cfi_def_cfa 6, 32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rbx), %rcx
	movq	8(%rbx), %rbx
	movq	%rcx, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movl	%edx, 40(%rbp)
	.loc 1 39 27
	movq	-48(%rbp), %rax
	.loc 1 39 32
	movl	40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	.loc 1 39 13
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	.loc 1 42 12
	movl	$0, -4(%rbp)
	.loc 1 42 5
	jmp	.L8
.L17:
.LBB2:
	.loc 1 44 12
	movl	-4(%rbp), %eax
	cmpl	40(%rbp), %eax
	je	.L19
	.loc 1 46 32
	movq	-48(%rbp), %rax
	.loc 1 46 37
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	.loc 1 46 17
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	.loc 1 48 16
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 48 12
	testl	%eax, %eax
	jne	.L11
	.loc 1 48 44 discriminator 1
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 48 37 discriminator 1
	cmpl	$1, %eax
	jne	.L11
	.loc 1 49 20
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	circleAndRectCollision
	movq	%rax, -32(%rbp)
	.loc 1 49 18
	jmp	.L12
.L11:
	.loc 1 50 21
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 50 17
	cmpl	$1, %eax
	jne	.L13
	.loc 1 50 47 discriminator 1
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 50 40 discriminator 1
	testl	%eax, %eax
	jne	.L13
	.loc 1 51 20
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	circleAndRectCollision
	movq	%rax, -32(%rbp)
	.loc 1 51 18
	jmp	.L12
.L13:
	.loc 1 53 20
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	circleAndCircleCollision
	movq	%rax, -32(%rbp)
.L12:
	.loc 1 55 17
	movss	-32(%rbp), %xmm1
	.loc 1 55 12
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L20
	.loc 1 57 16
	movq	-32(%rbp), %rsi
	jmp	.L18
.L19:
	.loc 1 44 23
	nop
	jmp	.L10
.L20:
	.loc 1 55 31
	nop
.L10:
.LBE2:
	.loc 1 42 36 discriminator 2
	addl	$1, -4(%rbp)
.L8:
	.loc 1 42 28 discriminator 1
	movl	-40(%rbp), %eax
	.loc 1 42 19 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L17
	.loc 1 60 12
	movl	$-1082130432, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%rsi, %rax
	orq	%rdx, %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%esi, %edx
	orq	%rdx, %rax
	movq	%rax, %rsi
.L18:
	.loc 1 61 1
	movq	%rsi, %rax
	addq	$80, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -56
	ret
	.cfi_endproc
.LFE122:
	.seh_endproc
	.globl	circleAndRectCollision
	.def	circleAndRectCollision;	.scl	2;	.type	32;	.endef
	.seh_proc	circleAndRectCollision
circleAndRectCollision:
.LFB123:
	.loc 1 64 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 65 19
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 66 17
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 70 12
	movl	$-1082130432, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%r8, %rax
	orq	%rdx, %rax
	movq	%rax, %r8
	movl	$0, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%r8d, %edx
	orq	%rdx, %rax
	movq	%rax, %r8
	movq	%r8, %rax
	.loc 1 71 1
	addq	$16, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE123:
	.seh_endproc
	.globl	circleAndCircleCollision
	.def	circleAndCircleCollision;	.scl	2;	.type	32;	.endef
	.seh_proc	circleAndCircleCollision
circleAndCircleCollision:
.LFB124:
	.loc 1 75 1
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
	subq	$96, %rsp
	.seh_stackalloc	96
	.cfi_def_cfa_offset 128
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.cfi_def_cfa 6, 48
	movups	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 80
	.cfi_offset 23, -48
	.seh_endprologue
	movq	%rcx, 48(%rbp)
	movq	%rdx, 56(%rbp)
	.loc 1 76 19
	movq	48(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 76 59
	movq	56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 77 18
	movq	48(%rbp), %rax
	movq	12(%rax), %rax
	movq	%rax, %rcx
	call	getFrameVel
	movq	%rax, -32(%rbp)
	.loc 1 77 47 discriminator 1
	movq	56(%rbp), %rax
	movq	12(%rax), %rax
	movq	%rax, %rcx
	call	getFrameVel
	movq	%rax, -40(%rbp)
	.loc 1 79 21
	movq	56(%rbp), %rax
	movq	4(%rax), %rdx
	movq	48(%rbp), %rax
	movq	4(%rax), %rax
	movq	%rax, %rcx
	call	vecSub
	.loc 1 79 21 is_stmt 0 discriminator 1
	movq	%rax, %rcx
	call	vecDist
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	.loc 1 80 21 is_stmt 1
	movq	-40(%rbp), %rdx
	movq	56(%rbp), %rax
	movq	4(%rax), %rax
	movq	%rax, %rcx
	call	vecAdd
	movq	%rax, %rsi
	.loc 1 80 21 is_stmt 0 discriminator 1
	movq	-32(%rbp), %rdx
	movq	48(%rbp), %rax
	movq	4(%rax), %rax
	movq	%rax, %rcx
	call	vecAdd
	.loc 1 80 21 discriminator 2
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	vecSub
	.loc 1 80 21 discriminator 3
	movq	%rax, %rcx
	call	vecDist
	movd	%xmm0, %eax
	movl	%eax, -24(%rbp)
	.loc 1 82 8 is_stmt 1
	movss	-24(%rbp), %xmm0
	comiss	-20(%rbp), %xmm0
	jnb	.L24
	.loc 1 82 48 discriminator 1
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	.loc 1 82 57 discriminator 1
	movaps	%xmm0, %xmm1
	addss	%xmm0, %xmm1
	.loc 1 82 28 discriminator 1
	movss	-24(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	jb	.L29
.L24:
.LBB3:
	.loc 1 83 16
	movl	$-1082130432, %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%rbx, %rax
	orq	%rdx, %rax
	movq	%rax, %rbx
	movl	$0, %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%ebx, %edx
	orq	%rdx, %rax
	movq	%rax, %rbx
	jmp	.L28
.L29:
.LBE3:
	.loc 1 87 34
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	.loc 1 87 43
	movaps	%xmm0, %xmm1
	addss	%xmm0, %xmm1
	.loc 1 87 26
	movss	-20(%rbp), %xmm0
	subss	%xmm1, %xmm0
	.loc 1 87 62
	movss	-20(%rbp), %xmm1
	subss	-24(%rbp), %xmm1
	.loc 1 87 51
	movaps	%xmm0, %xmm6
	divss	%xmm1, %xmm6
	.loc 1 88 43
	movss	-32(%rbp), %xmm1
	.loc 1 88 50
	movss	-40(%rbp), %xmm0
	.loc 1 88 21
	movaps	%xmm1, %xmm2
	addss	%xmm0, %xmm2
	.loc 1 88 30
	movss	-28(%rbp), %xmm1
	.loc 1 88 37
	movss	-36(%rbp), %xmm0
	.loc 1 88 21
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movaps	%xmm2, %xmm1
	movd	%eax, %xmm0
	call	atan2f
	.loc 1 85 12
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
.L28:
	.loc 1 90 1
	movq	%rbx, %rax
	movups	0(%rbp), %xmm6
	addq	$96, %rsp
	.cfi_restore 23
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -72
	ret
	.cfi_endproc
.LFE124:
	.seh_endproc
	.globl	getAxisAlignedBBox
	.def	getAxisAlignedBBox;	.scl	2;	.type	32;	.endef
	.seh_proc	getAxisAlignedBBox
getAxisAlignedBBox:
.LFB125:
	.loc 1 93 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 24
	.cfi_offset 5, -24
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$168, %rsp
	.seh_stackalloc	168
	.cfi_def_cfa_offset 208
	leaq	160(%rsp), %rbp
	.seh_setframe	%rbp, 160
	.cfi_def_cfa 6, 48
	.seh_endprologue
	movq	%rcx, 48(%rbp)
	movq	%rdx, 56(%rbp)
	.loc 1 94 12
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 94 8
	testl	%eax, %eax
	jne	.L31
.LBB4:
	.loc 1 96 23
	movq	56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -40(%rbp)
	.loc 1 100 39
	movq	56(%rbp), %rax
	movss	4(%rax), %xmm0
	.loc 1 100 49
	movq	-40(%rbp), %rax
	movss	(%rax), %xmm1
	.loc 1 100 42
	movaps	%xmm0, %xmm3
	subss	%xmm1, %xmm3
	.loc 1 100 67
	movq	56(%rbp), %rax
	movss	8(%rax), %xmm0
	.loc 1 100 77
	movq	-40(%rbp), %rax
	movss	(%rax), %xmm1
	.loc 1 100 70
	movaps	%xmm0, %xmm2
	subss	%xmm1, %xmm2
	.loc 1 101 37
	movq	-40(%rbp), %rax
	movss	(%rax), %xmm1
	.loc 1 101 52
	movq	-40(%rbp), %rax
	movss	(%rax), %xmm0
	.loc 1 98 16
	movq	48(%rbp), %rax
	movss	%xmm3, (%rax)
	movq	48(%rbp), %rax
	movss	%xmm2, 4(%rax)
	movq	48(%rbp), %rax
	movss	%xmm1, 8(%rax)
	movq	48(%rbp), %rax
	movss	%xmm0, 12(%rax)
.LBE4:
	.loc 1 134 1
	jmp	.L30
.L31:
	.loc 1 104 17
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 104 13
	cmpl	$1, %eax
	jne	.L56
.LBB5:
	.loc 1 106 21
	movq	56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 108 15
	movq	-16(%rbp), %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -20(%rbp)
	.loc 1 108 34
	movq	-16(%rbp), %rax
	movss	4(%rax), %xmm0
	movss	%xmm0, -24(%rbp)
	.loc 1 108 53
	movq	-16(%rbp), %rax
	movss	8(%rax), %xmm0
	movss	%xmm0, -28(%rbp)
	.loc 1 109 21
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	calcCentroid
	movq	%rax, -48(%rbp)
	.loc 1 110 29
	leaq	-64(%rbp), %rax
	movss	-28(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	movq	%rax, %rcx
	call	rotationMatrix
	.loc 1 112 17
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -72(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -68(%rbp)
	.loc 1 112 46
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -80(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -76(%rbp)
	.loc 1 117 13
	movq	-48(%rbp), %rdx
	movq	56(%rbp), %rax
	movq	4(%rax), %rax
	movq	%rax, %rcx
	call	vecSub
	movq	%rax, %rcx
	.loc 1 117 13 is_stmt 0 discriminator 1
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdx
	call	matrixVecMultiply
	movq	%rax, %rdx
	.loc 1 117 13 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vecAdd
	movq	%rax, -112(%rbp)
	.loc 1 118 67 is_stmt 1
	movq	56(%rbp), %rax
	movss	4(%rax), %xmm0
	.loc 1 118 70
	addss	-20(%rbp), %xmm0
	.loc 1 118 57
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rax
	andq	%rdi, %rax
	orq	%rdx, %rax
	movq	%rax, %rdi
	.loc 1 118 83
	movq	56(%rbp), %rax
	movss	8(%rax), %xmm0
	.loc 1 118 57
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%edi, %edx
	orq	%rdx, %rax
	movq	%rax, %rdi
	.loc 1 118 13
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	vecSub
	movq	%rax, %rcx
	.loc 1 118 13 is_stmt 0 discriminator 1
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdx
	call	matrixVecMultiply
	movq	%rax, %rdx
	.loc 1 118 13 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vecAdd
	movq	%rax, -104(%rbp)
	.loc 1 119 67 is_stmt 1
	movq	56(%rbp), %rax
	movss	4(%rax), %xmm0
	.loc 1 119 70
	addss	-20(%rbp), %xmm0
	.loc 1 119 57
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rax
	andq	%rsi, %rax
	orq	%rdx, %rax
	movq	%rax, %rsi
	.loc 1 119 83
	movq	56(%rbp), %rax
	movss	8(%rax), %xmm0
	.loc 1 119 86
	addss	-24(%rbp), %xmm0
	.loc 1 119 57
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%esi, %edx
	orq	%rdx, %rax
	movq	%rax, %rsi
	.loc 1 119 13
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	vecSub
	movq	%rax, %rcx
	.loc 1 119 13 is_stmt 0 discriminator 1
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdx
	call	matrixVecMultiply
	movq	%rax, %rdx
	.loc 1 119 13 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vecAdd
	movq	%rax, -96(%rbp)
	.loc 1 120 67 is_stmt 1
	movq	56(%rbp), %rax
	movss	4(%rax), %xmm0
	.loc 1 120 57
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rax
	andq	%rbx, %rax
	orq	%rdx, %rax
	movq	%rax, %rbx
	.loc 1 120 79
	movq	56(%rbp), %rax
	movss	8(%rax), %xmm0
	.loc 1 120 82
	addss	-24(%rbp), %xmm0
	.loc 1 120 57
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%ebx, %edx
	orq	%rdx, %rax
	movq	%rax, %rbx
	.loc 1 120 13
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	vecSub
	movq	%rax, %rcx
	.loc 1 120 13 is_stmt 0 discriminator 1
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdx
	call	matrixVecMultiply
	movq	%rax, %rdx
	.loc 1 120 13 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vecAdd
	movq	%rax, -88(%rbp)
	.loc 1 123 16 is_stmt 1
	movl	$0, -4(%rbp)
	.loc 1 123 9
	jmp	.L34
.L47:
	.loc 1 125 26
	movss	-72(%rbp), %xmm1
	.loc 1 125 44
	movl	-4(%rbp), %eax
	cltq
	movss	-112(%rbp,%rax,8), %xmm0
	.loc 1 125 58
	comiss	%xmm1, %xmm0
	jbe	.L52
	.loc 1 125 58 is_stmt 0 discriminator 1
	movss	-72(%rbp), %xmm0
	jmp	.L37
.L52:
	.loc 1 125 58 discriminator 2
	movl	-4(%rbp), %eax
	cltq
	movss	-112(%rbp,%rax,8), %xmm0
.L37:
	.loc 1 125 19 is_stmt 1 discriminator 4
	movss	%xmm0, -72(%rbp)
	.loc 1 126 26
	movss	-68(%rbp), %xmm1
	.loc 1 126 44
	movl	-4(%rbp), %eax
	cltq
	movss	-108(%rbp,%rax,8), %xmm0
	.loc 1 126 58
	comiss	%xmm1, %xmm0
	jbe	.L53
	.loc 1 126 58 is_stmt 0 discriminator 1
	movss	-68(%rbp), %xmm0
	jmp	.L40
.L53:
	.loc 1 126 58 discriminator 2
	movl	-4(%rbp), %eax
	cltq
	movss	-108(%rbp,%rax,8), %xmm0
.L40:
	.loc 1 126 19 is_stmt 1 discriminator 4
	movss	%xmm0, -68(%rbp)
	.loc 1 127 28
	movss	-80(%rbp), %xmm0
	.loc 1 127 46
	movl	-4(%rbp), %eax
	cltq
	movss	-112(%rbp,%rax,8), %xmm1
	.loc 1 127 61
	comiss	%xmm1, %xmm0
	jbe	.L54
	.loc 1 127 61 is_stmt 0 discriminator 1
	movss	-80(%rbp), %xmm0
	jmp	.L43
.L54:
	.loc 1 127 61 discriminator 2
	movl	-4(%rbp), %eax
	cltq
	movss	-112(%rbp,%rax,8), %xmm0
.L43:
	.loc 1 127 20 is_stmt 1 discriminator 4
	movss	%xmm0, -80(%rbp)
	.loc 1 128 28
	movss	-76(%rbp), %xmm0
	.loc 1 128 46
	movl	-4(%rbp), %eax
	cltq
	movss	-108(%rbp,%rax,8), %xmm1
	.loc 1 128 61
	comiss	%xmm1, %xmm0
	jbe	.L55
	.loc 1 128 61 is_stmt 0 discriminator 1
	movss	-76(%rbp), %xmm0
	jmp	.L46
.L55:
	.loc 1 128 61 discriminator 2
	movl	-4(%rbp), %eax
	cltq
	movss	-108(%rbp,%rax,8), %xmm0
.L46:
	.loc 1 128 20 is_stmt 1 discriminator 4
	movss	%xmm0, -76(%rbp)
	.loc 1 123 29 discriminator 2
	addl	$1, -4(%rbp)
.L34:
	.loc 1 123 23 discriminator 1
	cmpl	$3, -4(%rbp)
	jle	.L47
	.loc 1 130 16
	movq	-72(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	vecSub
	movq	%rax, -80(%rbp)
	.loc 1 132 16
	movq	48(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	48(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 8(%rax)
.LBE5:
	.loc 1 134 1
	jmp	.L30
.L56:
	nop
.L30:
	movq	48(%rbp), %rax
	addq	$168, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rdi
	.cfi_restore 5
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -136
	ret
	.cfi_endproc
.LFE125:
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC2:
	.long	2139095040
	.align 4
.LC3:
	.long	-8388608
	.text
.Letext0:
	.file 2 "C:/msys64/ucrt64/include/raylib.h"
	.file 3 "../include/ballPhysics.h"
	.file 4 "C:/msys64/ucrt64/include/math.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x8a0
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x11
	.ascii "GNU C17 13.1.0 -mtune=generic -march=nocona -g -O0\0"
	.byte	0x1d
	.secrel32	.LASF0
	.secrel32	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0xa
	.ascii "Vector2\0"
	.byte	0x8
	.byte	0x2
	.byte	0xc4
	.long	0x8c
	.uleb128 0x2
	.ascii "x\0"
	.byte	0x2
	.byte	0xc5
	.byte	0xb
	.long	0x8c
	.byte	0
	.uleb128 0x2
	.ascii "y\0"
	.byte	0x2
	.byte	0xc6
	.byte	0xb
	.long	0x8c
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0xb
	.ascii "Vector2\0"
	.byte	0x2
	.byte	0xc7
	.long	0x65
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x12
	.byte	0x8
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x5
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x13
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x4
	.long	0xbe
	.byte	0x3
	.byte	0x26
	.byte	0xe
	.long	0x168
	.uleb128 0xe
	.ascii "OBJ_CIRCLE\0"
	.byte	0
	.uleb128 0xe
	.ascii "OBJ_RECT\0"
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF2
	.byte	0x2a
	.long	0x13d
	.uleb128 0xa
	.ascii "Object\0"
	.byte	0x20
	.byte	0x3
	.byte	0x2c
	.long	0x1bb
	.uleb128 0x2
	.ascii "type\0"
	.byte	0x3
	.byte	0x2e
	.byte	0x10
	.long	0x168
	.byte	0
	.uleb128 0x2
	.ascii "pos\0"
	.byte	0x3
	.byte	0x2f
	.byte	0xd
	.long	0x95
	.byte	0x4
	.uleb128 0x2
	.ascii "vel\0"
	.byte	0x3
	.byte	0x30
	.byte	0xd
	.long	0x95
	.byte	0xc
	.uleb128 0x2
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
	.uleb128 0x8
	.secrel32	.LASF3
	.byte	0x10
	.byte	0x34
	.long	0x203
	.uleb128 0x2
	.ascii "data\0"
	.byte	0x3
	.byte	0x36
	.byte	0xd
	.long	0x203
	.byte	0
	.uleb128 0x2
	.ascii "size\0"
	.byte	0x3
	.byte	0x37
	.byte	0x9
	.long	0xb7
	.byte	0x8
	.uleb128 0x2
	.ascii "capacity\0"
	.byte	0x3
	.byte	0x38
	.byte	0x9
	.long	0xb7
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.long	0x1bb
	.uleb128 0x7
	.secrel32	.LASF3
	.byte	0x39
	.long	0x1c9
	.uleb128 0x8
	.secrel32	.LASF4
	.byte	0x4
	.byte	0x3b
	.long	0x22e
	.uleb128 0x2
	.ascii "radius\0"
	.byte	0x3
	.byte	0x3d
	.byte	0xb
	.long	0x8c
	.byte	0
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF4
	.byte	0x3e
	.long	0x212
	.uleb128 0x8
	.secrel32	.LASF5
	.byte	0xc
	.byte	0x40
	.long	0x264
	.uleb128 0x2
	.ascii "size\0"
	.byte	0x3
	.byte	0x42
	.byte	0xd
	.long	0x95
	.byte	0
	.uleb128 0x2
	.ascii "rotation\0"
	.byte	0x3
	.byte	0x43
	.byte	0xb
	.long	0x8c
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF5
	.byte	0x44
	.long	0x238
	.uleb128 0x8
	.secrel32	.LASF6
	.byte	0x8
	.byte	0x48
	.long	0x29a
	.uleb128 0x2
	.ascii "prop\0"
	.byte	0x3
	.byte	0x4a
	.byte	0xb
	.long	0x8c
	.byte	0
	.uleb128 0x2
	.ascii "tanAngle\0"
	.byte	0x3
	.byte	0x4b
	.byte	0xb
	.long	0x8c
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF6
	.byte	0x4c
	.long	0x26e
	.uleb128 0xa
	.ascii "AABBox\0"
	.byte	0x10
	.byte	0x3
	.byte	0x4e
	.long	0x2cf
	.uleb128 0x2
	.ascii "pos\0"
	.byte	0x3
	.byte	0x50
	.byte	0xd
	.long	0x95
	.byte	0
	.uleb128 0x2
	.ascii "size\0"
	.byte	0x3
	.byte	0x51
	.byte	0xd
	.long	0x95
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.ascii "AABBox\0"
	.byte	0x3
	.byte	0x52
	.long	0x2a4
	.uleb128 0x8
	.secrel32	.LASF7
	.byte	0x10
	.byte	0x54
	.long	0x315
	.uleb128 0x2
	.ascii "a\0"
	.byte	0x3
	.byte	0x56
	.byte	0xb
	.long	0x8c
	.byte	0
	.uleb128 0x2
	.ascii "b\0"
	.byte	0x3
	.byte	0x57
	.byte	0xb
	.long	0x8c
	.byte	0x4
	.uleb128 0x2
	.ascii "c\0"
	.byte	0x3
	.byte	0x58
	.byte	0xb
	.long	0x8c
	.byte	0x8
	.uleb128 0x2
	.ascii "d\0"
	.byte	0x3
	.byte	0x59
	.byte	0xb
	.long	0x8c
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.secrel32	.LASF7
	.byte	0x5a
	.long	0x2dd
	.uleb128 0x6
	.ascii "matrixVecMultiply\0"
	.byte	0x7c
	.byte	0x9
	.long	0x95
	.long	0x347
	.uleb128 0x3
	.long	0x95
	.uleb128 0x3
	.long	0x315
	.byte	0
	.uleb128 0x6
	.ascii "rotationMatrix\0"
	.byte	0x7d
	.byte	0xb
	.long	0x315
	.long	0x367
	.uleb128 0x3
	.long	0x8c
	.byte	0
	.uleb128 0x6
	.ascii "calcCentroid\0"
	.byte	0x7e
	.byte	0x9
	.long	0x95
	.long	0x385
	.uleb128 0x3
	.long	0x203
	.byte	0
	.uleb128 0xd
	.ascii "atan2f\0"
	.word	0x2a4
	.long	0x8c
	.long	0x3a2
	.uleb128 0x3
	.long	0x8c
	.uleb128 0x3
	.long	0x8c
	.byte	0
	.uleb128 0x6
	.ascii "vecDist\0"
	.byte	0x78
	.byte	0x7
	.long	0x8c
	.long	0x3bb
	.uleb128 0x3
	.long	0x95
	.byte	0
	.uleb128 0x6
	.ascii "getFrameVel\0"
	.byte	0x5d
	.byte	0x9
	.long	0x95
	.long	0x3d8
	.uleb128 0x3
	.long	0x95
	.byte	0
	.uleb128 0x6
	.ascii "vecAdd\0"
	.byte	0x75
	.byte	0x9
	.long	0x95
	.long	0x3f5
	.uleb128 0x3
	.long	0x95
	.uleb128 0x3
	.long	0x95
	.byte	0
	.uleb128 0x6
	.ascii "vecInverse\0"
	.byte	0x79
	.byte	0x9
	.long	0x95
	.long	0x411
	.uleb128 0x3
	.long	0x95
	.byte	0
	.uleb128 0x6
	.ascii "vecSub\0"
	.byte	0x76
	.byte	0x9
	.long	0x95
	.long	0x42e
	.uleb128 0x3
	.long	0x95
	.uleb128 0x3
	.long	0x95
	.byte	0
	.uleb128 0x6
	.ascii "vecScale\0"
	.byte	0x77
	.byte	0x9
	.long	0x95
	.long	0x44d
	.uleb128 0x3
	.long	0x95
	.uleb128 0x3
	.long	0x8c
	.byte	0
	.uleb128 0x6
	.ascii "dotProduct\0"
	.byte	0x7a
	.byte	0x7
	.long	0x8c
	.long	0x46e
	.uleb128 0x3
	.long	0x95
	.uleb128 0x3
	.long	0x95
	.byte	0
	.uleb128 0xd
	.ascii "sinf\0"
	.word	0x293
	.long	0x8c
	.long	0x484
	.uleb128 0x3
	.long	0x8c
	.byte	0
	.uleb128 0xd
	.ascii "cosf\0"
	.word	0x296
	.long	0x8c
	.long	0x49a
	.uleb128 0x3
	.long	0x8c
	.byte	0
	.uleb128 0x9
	.ascii "getAxisAlignedBBox\0"
	.byte	0x5c
	.byte	0x8
	.long	0x2cf
	.quad	.LFB125
	.quad	.LFE125-.LFB125
	.uleb128 0x1
	.byte	0x9c
	.long	0x5a8
	.uleb128 0x4
	.ascii "obj\0"
	.byte	0x5c
	.byte	0x23
	.long	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x4ff
	.uleb128 0x1
	.ascii "obj_C\0"
	.byte	0x60
	.byte	0x17
	.long	0x5a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0xf
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1
	.ascii "obj_R\0"
	.byte	0x6a
	.byte	0x15
	.long	0x5ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.ascii "w\0"
	.byte	0x6c
	.byte	0xf
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1
	.ascii "h\0"
	.byte	0x6c
	.byte	0x22
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.ascii "r\0"
	.byte	0x6c
	.byte	0x35
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1
	.ascii "c\0"
	.byte	0x6d
	.byte	0x11
	.long	0x95
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.ascii "rMatrix\0"
	.byte	0x6e
	.byte	0x13
	.long	0x315
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1
	.ascii "pos\0"
	.byte	0x70
	.byte	0x11
	.long	0x95
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.ascii "size\0"
	.byte	0x70
	.byte	0x2e
	.long	0x95
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.ascii "i\0"
	.byte	0x71
	.byte	0xd
	.long	0xb7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1
	.ascii "vertices\0"
	.byte	0x73
	.byte	0x11
	.long	0x5b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x22e
	.uleb128 0xc
	.long	0x264
	.uleb128 0x15
	.long	0x95
	.long	0x5c2
	.uleb128 0x16
	.long	0xe4
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.ascii "circleAndCircleCollision\0"
	.byte	0x4a
	.byte	0xb
	.long	0x29a
	.quad	.LFB124
	.quad	.LFE124-.LFB124
	.uleb128 0x1
	.byte	0x9c
	.long	0x67b
	.uleb128 0x4
	.ascii "obj1\0"
	.byte	0x4a
	.byte	0x2c
	.long	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.ascii "obj2\0"
	.byte	0x4a
	.byte	0x3a
	.long	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1
	.ascii "obj1_C\0"
	.byte	0x4c
	.byte	0x13
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.ascii "obj2_C\0"
	.byte	0x4c
	.byte	0x3b
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.ascii "d1\0"
	.byte	0x4d
	.byte	0xd
	.long	0x95
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.ascii "d2\0"
	.byte	0x4d
	.byte	0x2a
	.long	0x95
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.ascii "begDist\0"
	.byte	0x4f
	.byte	0xb
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1
	.ascii "endDist\0"
	.byte	0x50
	.byte	0xb
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x10
	.ascii "circleAndRectCollision\0"
	.byte	0x3f
	.byte	0xb
	.long	0x29a
	.quad	.LFB123
	.quad	.LFE123-.LFB123
	.uleb128 0x1
	.byte	0x9c
	.long	0x6f0
	.uleb128 0x4
	.ascii "cObj\0"
	.byte	0x3f
	.byte	0x2a
	.long	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.ascii "rObj\0"
	.byte	0x3f
	.byte	0x38
	.long	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1
	.ascii "cObj_C\0"
	.byte	0x41
	.byte	0x13
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.ascii "rObj_R\0"
	.byte	0x42
	.byte	0x11
	.long	0x5ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x9
	.ascii "findCollisions\0"
	.byte	0x24
	.byte	0xb
	.long	0x29a
	.quad	.LFB122
	.quad	.LFE122-.LFB122
	.uleb128 0x1
	.byte	0x9c
	.long	0x788
	.uleb128 0x4
	.ascii "objects\0"
	.byte	0x24
	.byte	0x25
	.long	0x208
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x4
	.ascii "idx\0"
	.byte	0x24
	.byte	0x32
	.long	0xb7
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1
	.ascii "i\0"
	.byte	0x26
	.byte	0x9
	.long	0xb7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.ascii "obj\0"
	.byte	0x27
	.byte	0xd
	.long	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.ascii "clsn\0"
	.byte	0x28
	.byte	0xf
	.long	0x29a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xf
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1
	.ascii "obj2\0"
	.byte	0x2e
	.byte	0x11
	.long	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0x10
	.ascii "isCollision\0"
	.byte	0x1f
	.byte	0x5
	.long	0xfe
	.quad	.LFB121
	.quad	.LFE121-.LFB121
	.uleb128 0x1
	.byte	0x9c
	.long	0x7c1
	.uleb128 0x4
	.ascii "clsn\0"
	.byte	0x1f
	.byte	0x1b
	.long	0x29a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.ascii "calcCollisionVec\0"
	.byte	0x1a
	.byte	0x9
	.long	0x95
	.quad	.LFB120
	.quad	.LFE120-.LFB120
	.uleb128 0x1
	.byte	0x9c
	.long	0x826
	.uleb128 0x4
	.ascii "vel1\0"
	.byte	0x1a
	.byte	0x22
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.ascii "vel2\0"
	.byte	0x1a
	.byte	0x30
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x4
	.ascii "collisionProp\0"
	.byte	0x1a
	.byte	0x3c
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x17
	.ascii "calcBounceVec\0"
	.byte	0x1
	.byte	0xe
	.byte	0x9
	.long	0x95
	.quad	.LFB119
	.quad	.LFE119-.LFB119
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.ascii "vel\0"
	.byte	0xe
	.byte	0x1f
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.ascii "surfaceAngle\0"
	.byte	0xe
	.byte	0x2a
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x10
	.byte	0xd
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.ascii "nProj\0"
	.byte	0x12
	.byte	0xd
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.ascii "perpDist\0"
	.byte	0x12
	.byte	0x36
	.long	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0x8
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
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
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
.LASF6:
	.ascii "Collision\0"
.LASF7:
	.ascii "Matrix2x2\0"
.LASF4:
	.ascii "CircleObject\0"
.LASF2:
	.ascii "ObjectType\0"
.LASF3:
	.ascii "ObjectList\0"
.LASF5:
	.ascii "RectObject\0"
	.section	.debug_line_str,"dr"
.LASF1:
	.ascii "C:\\\\msys64\\\\home\\\\alexa\\\\ballPhysics\\\\src\0"
.LASF0:
	.ascii "collision.c\0"
	.ident	"GCC: (Rev7, Built by MSYS2 project) 13.1.0"
	.def	cosf;	.scl	2;	.type	32;	.endef
	.def	sinf;	.scl	2;	.type	32;	.endef
	.def	dotProduct;	.scl	2;	.type	32;	.endef
	.def	vecScale;	.scl	2;	.type	32;	.endef
	.def	vecSub;	.scl	2;	.type	32;	.endef
	.def	vecInverse;	.scl	2;	.type	32;	.endef
	.def	vecAdd;	.scl	2;	.type	32;	.endef
	.def	getFrameVel;	.scl	2;	.type	32;	.endef
	.def	vecDist;	.scl	2;	.type	32;	.endef
	.def	atan2f;	.scl	2;	.type	32;	.endef
	.def	calcCentroid;	.scl	2;	.type	32;	.endef
	.def	rotationMatrix;	.scl	2;	.type	32;	.endef
	.def	matrixVecMultiply;	.scl	2;	.type	32;	.endef
