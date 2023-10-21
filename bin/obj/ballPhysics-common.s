	.file	"common.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "C://msys64//home//alexa//ballPhysics//src" "common.c"
	.globl	randomColor
	.def	randomColor;	.scl	2;	.type	32;	.endef
	.seh_proc	randomColor
randomColor:
.LFB2:
	.file 1 "common.c"
	.loc 1 7 1
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
	movl	%ecx, 16(%rbp)
	.loc 1 10 8
	cmpl	$1, 16(%rbp)
	jne	.L2
	.loc 1 10 41 discriminator 1
	movl	$6, %edx
	movl	$0, %ecx
	call	GetRandomValue
	.loc 1 10 40 discriminator 1
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	colors.0(%rip), %rax
	movl	(%rdx,%rax), %eax
	.loc 1 10 40 is_stmt 0
	jmp	.L4
.L2:
	.loc 1 11 24 is_stmt 1
	movl	$5, %edx
	movl	$0, %ecx
	call	GetRandomValue
	.loc 1 11 23 discriminator 1
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	colors.0(%rip), %rax
	movl	(%rdx,%rax), %eax
.L4:
	.loc 1 12 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.seh_endproc
	.data
	.align 16
colors.0:
	.byte	-26
	.byte	41
	.byte	55
	.byte	-1
	.byte	-1
	.byte	-95
	.byte	0
	.byte	-1
	.byte	-3
	.byte	-7
	.byte	0
	.byte	-1
	.byte	0
	.byte	-28
	.byte	48
	.byte	-1
	.byte	0
	.byte	121
	.byte	-15
	.byte	-1
	.byte	-121
	.byte	60
	.byte	-66
	.byte	-1
	.text
.Letext0:
	.file 2 "C:/msys64/ucrt64/include/raylib.h"
	.file 3 "../include/ballPhysics.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x1fb
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x5
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
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x6
	.ascii "Color\0"
	.byte	0x4
	.byte	0x2
	.byte	0xe4
	.byte	0x10
	.long	0xa2
	.uleb128 0x2
	.ascii "r\0"
	.byte	0xe5
	.long	0xa2
	.byte	0
	.uleb128 0x2
	.ascii "g\0"
	.byte	0xe6
	.long	0xa2
	.byte	0x1
	.uleb128 0x2
	.ascii "b\0"
	.byte	0xe7
	.long	0xa2
	.byte	0x2
	.uleb128 0x2
	.ascii "a\0"
	.byte	0xe8
	.long	0xa2
	.byte	0x3
	.byte	0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x7
	.ascii "Color\0"
	.byte	0x2
	.byte	0xe9
	.byte	0x3
	.long	0x6e
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
	.uleb128 0x8
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x4
	.long	0xc8
	.byte	0x3
	.byte	0x1e
	.byte	0xe
	.long	0x16a
	.uleb128 0x3
	.ascii "ALL\0"
	.byte	0
	.uleb128 0x3
	.ascii "RAINBOW\0"
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.secrel32	.LASF2
	.byte	0x3
	.byte	0x22
	.byte	0x3
	.long	0x147
	.uleb128 0xa
	.ascii "GetRandomValue\0"
	.byte	0x2
	.word	0x411
	.byte	0x6
	.long	0xc1
	.long	0x19d
	.uleb128 0x4
	.long	0xc1
	.uleb128 0x4
	.long	0xc1
	.byte	0
	.uleb128 0xb
	.ascii "randomColor\0"
	.byte	0x1
	.byte	0x6
	.byte	0x7
	.long	0xb3
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f2
	.uleb128 0xc
	.ascii "scope\0"
	.byte	0x1
	.byte	0x6
	.byte	0x22
	.long	0x16a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.ascii "colors\0"
	.byte	0x1
	.byte	0x8
	.byte	0x12
	.long	0x1f2
	.uleb128 0x9
	.byte	0x3
	.quad	colors.0
	.byte	0
	.uleb128 0xe
	.long	0xb3
	.uleb128 0xf
	.long	0xee
	.byte	0x5
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
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x16
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.ascii "RandColorScope\0"
	.section	.debug_line_str,"dr"
.LASF1:
	.ascii "C:\\\\msys64\\\\home\\\\alexa\\\\ballPhysics\\\\src\0"
.LASF0:
	.ascii "common.c\0"
	.ident	"GCC: (Rev7, Built by MSYS2 project) 13.1.0"
	.def	GetRandomValue;	.scl	2;	.type	32;	.endef
