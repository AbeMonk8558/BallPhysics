	.file	"generation.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "C://msys64//home//alexa//ballPhysics//src" "generation.c"
	.globl	genTrajectories
	.def	genTrajectories;	.scl	2;	.type	32;	.endef
	.seh_proc	genTrajectories
genTrajectories:
.LFB2:
	.file 1 "generation.c"
	.loc 1 7 1
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
	movq	%rcx, %rbx
	movq	(%rbx), %rax
	movq	8(%rbx), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 1 10 12
	movl	$0, -4(%rbp)
	.loc 1 10 5
	jmp	.L2
.L5:
	.loc 1 16 12
	cmpl	$0, -4(%rbp)
	jne	.L3
.LBB2:
	.loc 1 16 28 discriminator 1
	movq	-32(%rbp), %rax
	.loc 1 16 33 discriminator 1
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	.loc 1 16 41 discriminator 1
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, 12(%rax)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 16(%rax)
.LBE2:
	jmp	.L4
.L3:
	.loc 1 17 17
	cmpl	$1, -4(%rbp)
	jne	.L4
.LBB3:
	.loc 1 17 33 discriminator 1
	movq	-32(%rbp), %rax
	.loc 1 17 38 discriminator 1
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	.loc 1 17 46 discriminator 1
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, 12(%rax)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, 16(%rax)
.L4:
.LBE3:
	.loc 1 10 36 discriminator 2
	addl	$1, -4(%rbp)
.L2:
	.loc 1 10 28 discriminator 1
	movl	-24(%rbp), %eax
	.loc 1 10 19 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L5
	.loc 1 20 1
	nop
	nop
	addq	$40, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -24
	ret
	.cfi_endproc
.LFE2:
	.seh_endproc
	.globl	genLocations
	.def	genLocations;	.scl	2;	.type	32;	.endef
	.seh_proc	genLocations
genLocations:
.LFB3:
	.loc 1 24 1
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
	movq	%rcx, %rbx
	movq	(%rbx), %rax
	movq	8(%rbx), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 1 27 12
	movl	$0, -4(%rbp)
	.loc 1 27 5
	jmp	.L7
.L10:
	.loc 1 33 12
	cmpl	$0, -4(%rbp)
	jne	.L8
.LBB4:
	.loc 1 33 28 discriminator 1
	movq	-32(%rbp), %rax
	.loc 1 33 33 discriminator 1
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	.loc 1 33 41 discriminator 1
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 4(%rax)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 8(%rax)
.LBE4:
	jmp	.L9
.L8:
	.loc 1 34 17
	cmpl	$1, -4(%rbp)
	jne	.L9
.LBB5:
	.loc 1 34 33 discriminator 1
	movq	-32(%rbp), %rax
	.loc 1 34 38 discriminator 1
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	.loc 1 34 46 discriminator 1
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 4(%rax)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 8(%rax)
.L9:
.LBE5:
	.loc 1 27 36 discriminator 2
	addl	$1, -4(%rbp)
.L7:
	.loc 1 27 28 discriminator 1
	movl	-24(%rbp), %eax
	.loc 1 27 19 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L10
	.loc 1 37 1
	nop
	nop
	addq	$40, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -24
	ret
	.cfi_endproc
.LFE3:
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	-1035468800
	.align 4
.LC2:
	.long	-1039307810
	.align 4
.LC3:
	.long	1128792064
	.align 4
.LC4:
	.long	1112014848
	.align 4
.LC5:
	.long	1125912806
	.text
.Letext0:
	.file 2 "C:/msys64/ucrt64/include/raylib.h"
	.file 3 "../include/ballPhysics.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x29b
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x9
	.ascii "GNU C17 13.1.0 -mtune=generic -march=nocona -g -O0\0"
	.byte	0x1d
	.secrel32	.LASF0
	.secrel32	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
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
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x4
	.ascii "Vector2\0"
	.byte	0x2
	.byte	0xc7
	.long	0x65
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0xa
	.byte	0x8
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x1
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0xb
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x4
	.long	0xbe
	.byte	0x3
	.byte	0x26
	.byte	0xe
	.long	0x168
	.uleb128 0x5
	.ascii "OBJ_CIRCLE\0"
	.byte	0
	.uleb128 0x5
	.ascii "OBJ_RECT\0"
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.secrel32	.LASF2
	.byte	0x2a
	.long	0x13d
	.uleb128 0x3
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
	.uleb128 0x4
	.ascii "Object\0"
	.byte	0x3
	.byte	0x32
	.long	0x172
	.uleb128 0xc
	.secrel32	.LASF3
	.byte	0x10
	.byte	0x3
	.byte	0x34
	.byte	0x10
	.long	0x205
	.uleb128 0x2
	.ascii "data\0"
	.byte	0x3
	.byte	0x36
	.byte	0xd
	.long	0x205
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
	.uleb128 0xd
	.byte	0x8
	.long	0x1bb
	.uleb128 0x6
	.secrel32	.LASF3
	.byte	0x39
	.long	0x1c9
	.uleb128 0xe
	.ascii "genLocations\0"
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x25a
	.uleb128 0x7
	.ascii "objects\0"
	.byte	0x17
	.byte	0x1e
	.long	0x20b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x8
	.ascii "i\0"
	.byte	0x19
	.long	0xb7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0xf
	.ascii "genTrajectories\0"
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.ascii "objects\0"
	.byte	0x6
	.byte	0x21
	.long	0x20b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x8
	.ascii "i\0"
	.byte	0x8
	.long	0xb7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x4
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
	.uleb128 0x8
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x7a
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
	.ascii "ObjectList\0"
.LASF2:
	.ascii "ObjectType\0"
	.section	.debug_line_str,"dr"
.LASF1:
	.ascii "C:\\\\msys64\\\\home\\\\alexa\\\\ballPhysics\\\\src\0"
.LASF0:
	.ascii "generation.c\0"
	.ident	"GCC: (Rev7, Built by MSYS2 project) 13.1.0"
