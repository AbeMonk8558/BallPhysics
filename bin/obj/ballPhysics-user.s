	.file	"user.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "C://msys64//home//alexa//ballPhysics//src" "user.c"
	.globl	handleSpeedMod
	.def	handleSpeedMod;	.scl	2;	.type	32;	.endef
	.seh_proc	handleSpeedMod
handleSpeedMod:
.LFB2:
	.file 1 "user.c"
	.loc 1 11 1
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
	movl	%edx, 24(%rbp)
	.loc 1 12 8
	cmpl	$265, 24(%rbp)
	jne	.L2
	.loc 1 13 9
	movq	16(%rbp), %rax
	movss	(%rax), %xmm1
	.loc 1 13 19
	movss	.LC0(%rip), %xmm0
	addss	%xmm1, %xmm0
	movq	16(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 16 1
	jmp	.L6
.L2:
	.loc 1 14 13
	cmpl	$264, 24(%rbp)
	jne	.L6
	.loc 1 14 33 discriminator 1
	movq	16(%rbp), %rax
	movss	(%rax), %xmm0
	.loc 1 14 30 discriminator 1
	comiss	.LC1(%rip), %xmm0
	jnb	.L5
	.loc 1 16 1
	jmp	.L6
.L5:
	.loc 1 15 9
	movq	16(%rbp), %rax
	movss	(%rax), %xmm0
	.loc 1 15 19
	movss	.LC0(%rip), %xmm1
	subss	%xmm1, %xmm0
	movq	16(%rbp), %rax
	movss	%xmm0, (%rax)
.L6:
	.loc 1 16 1
	nop
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.seh_endproc
	.globl	handlePause
	.def	handlePause;	.scl	2;	.type	32;	.endef
	.seh_proc	handlePause
handlePause:
.LFB3:
	.loc 1 19 1
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
	movl	%edx, 24(%rbp)
	.loc 1 20 8
	cmpl	$80, 24(%rbp)
	jne	.L9
	.loc 1 21 21
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	.loc 1 21 9
	testl	%eax, %eax
	setne	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	.loc 1 21 19
	andl	$1, %eax
	.loc 1 21 17
	movq	16(%rbp), %rdx
	movb	%al, (%rdx)
.L9:
	.loc 1 22 1
	nop
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.seh_endproc
	.globl	handleLineCreation
	.def	handleLineCreation;	.scl	2;	.type	32;	.endef
	.seh_proc	handleLineCreation
handleLineCreation:
.LFB4:
	.loc 1 25 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$72, %rsp
	.seh_stackalloc	72
	.cfi_def_cfa_offset 96
	leaq	64(%rsp), %rbp
	.seh_setframe	%rbp, 64
	.cfi_def_cfa 6, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	.loc 1 26 17
	movl	$0, -4(%rbp)
	.loc 1 29 9
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	IsMouseButtonPressed
	.loc 1 29 8 discriminator 1
	testb	%al, %al
	je	.L11
.LBB2:
	.loc 1 31 21
	movq	32(%rbp), %rax
	movq	%rax, currLnStart.0(%rip)
	.loc 1 32 45
	movl	-20(%rbp), %ecx
	movb	$-1, %cl
	movl	$-1, %eax
	movb	%al, %ch
	orl	$16711680, %ecx
	movl	%ecx, %eax
	orl	$-16777216, %eax
	movl	%eax, %ebx
	.loc 1 32 9
	movq	32(%rbp), %rdx
	movq	32(%rbp), %rax
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	DrawLineV
.LBE2:
	.loc 1 38 1
	jmp	.L13
.L11:
	.loc 1 34 14
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	IsMouseButtonDown
	.loc 1 34 13 discriminator 1
	testb	%al, %al
	je	.L13
.LBB3:
	.loc 1 36 48
	movb	$-1, %bl
	movl	$-1, %eax
	movb	%al, %bh
	movl	%ebx, %eax
	orl	$16711680, %eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	orl	$-16777216, %eax
	movl	%eax, %ebx
	.loc 1 36 9
	movq	32(%rbp), %rdx
	movq	currLnStart.0(%rip), %rax
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	DrawLineV
.L13:
.LBE3:
	.loc 1 38 1
	nop
	addq	$72, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -56
	ret
	.cfi_endproc
.LFE4:
	.seh_endproc
.lcomm currLnStart.0,8,8
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC1:
	.long	1073741824
	.text
.Letext0:
	.file 2 "C:/msys64/ucrt64/include/raylib.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x8cd
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0xe
	.ascii "GNU C17 13.1.0 -mtune=generic -march=nocona -g -O0\0"
	.byte	0x1d
	.secrel32	.LASF0
	.secrel32	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x7
	.ascii "Vector2\0"
	.byte	0x8
	.byte	0xc4
	.long	0x89
	.uleb128 0x4
	.ascii "x\0"
	.byte	0xc5
	.byte	0xb
	.long	0x89
	.byte	0
	.uleb128 0x4
	.ascii "y\0"
	.byte	0xc6
	.byte	0xb
	.long	0x89
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x8
	.ascii "Vector2\0"
	.byte	0xc7
	.long	0x65
	.uleb128 0x7
	.ascii "Color\0"
	.byte	0x4
	.byte	0xe4
	.long	0xd6
	.uleb128 0x4
	.ascii "r\0"
	.byte	0xe5
	.byte	0x13
	.long	0xd6
	.byte	0
	.uleb128 0x4
	.ascii "g\0"
	.byte	0xe6
	.byte	0x13
	.long	0xd6
	.byte	0x1
	.uleb128 0x4
	.ascii "b\0"
	.byte	0xe7
	.byte	0x13
	.long	0xd6
	.byte	0x2
	.uleb128 0x4
	.ascii "a\0"
	.byte	0xe8
	.byte	0x13
	.long	0xd6
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x8
	.ascii "Color\0"
	.byte	0xe9
	.long	0xa0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x9
	.long	0x89
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0xa
	.long	0xfa
	.word	0x21c
	.long	0x69d
	.uleb128 0x1
	.ascii "KEY_NULL\0"
	.byte	0
	.uleb128 0x1
	.ascii "KEY_APOSTROPHE\0"
	.byte	0x27
	.uleb128 0x1
	.ascii "KEY_COMMA\0"
	.byte	0x2c
	.uleb128 0x1
	.ascii "KEY_MINUS\0"
	.byte	0x2d
	.uleb128 0x1
	.ascii "KEY_PERIOD\0"
	.byte	0x2e
	.uleb128 0x1
	.ascii "KEY_SLASH\0"
	.byte	0x2f
	.uleb128 0x1
	.ascii "KEY_ZERO\0"
	.byte	0x30
	.uleb128 0x1
	.ascii "KEY_ONE\0"
	.byte	0x31
	.uleb128 0x1
	.ascii "KEY_TWO\0"
	.byte	0x32
	.uleb128 0x1
	.ascii "KEY_THREE\0"
	.byte	0x33
	.uleb128 0x1
	.ascii "KEY_FOUR\0"
	.byte	0x34
	.uleb128 0x1
	.ascii "KEY_FIVE\0"
	.byte	0x35
	.uleb128 0x1
	.ascii "KEY_SIX\0"
	.byte	0x36
	.uleb128 0x1
	.ascii "KEY_SEVEN\0"
	.byte	0x37
	.uleb128 0x1
	.ascii "KEY_EIGHT\0"
	.byte	0x38
	.uleb128 0x1
	.ascii "KEY_NINE\0"
	.byte	0x39
	.uleb128 0x1
	.ascii "KEY_SEMICOLON\0"
	.byte	0x3b
	.uleb128 0x1
	.ascii "KEY_EQUAL\0"
	.byte	0x3d
	.uleb128 0x1
	.ascii "KEY_A\0"
	.byte	0x41
	.uleb128 0x1
	.ascii "KEY_B\0"
	.byte	0x42
	.uleb128 0x1
	.ascii "KEY_C\0"
	.byte	0x43
	.uleb128 0x1
	.ascii "KEY_D\0"
	.byte	0x44
	.uleb128 0x1
	.ascii "KEY_E\0"
	.byte	0x45
	.uleb128 0x1
	.ascii "KEY_F\0"
	.byte	0x46
	.uleb128 0x1
	.ascii "KEY_G\0"
	.byte	0x47
	.uleb128 0x1
	.ascii "KEY_H\0"
	.byte	0x48
	.uleb128 0x1
	.ascii "KEY_I\0"
	.byte	0x49
	.uleb128 0x1
	.ascii "KEY_J\0"
	.byte	0x4a
	.uleb128 0x1
	.ascii "KEY_K\0"
	.byte	0x4b
	.uleb128 0x1
	.ascii "KEY_L\0"
	.byte	0x4c
	.uleb128 0x1
	.ascii "KEY_M\0"
	.byte	0x4d
	.uleb128 0x1
	.ascii "KEY_N\0"
	.byte	0x4e
	.uleb128 0x1
	.ascii "KEY_O\0"
	.byte	0x4f
	.uleb128 0x1
	.ascii "KEY_P\0"
	.byte	0x50
	.uleb128 0x1
	.ascii "KEY_Q\0"
	.byte	0x51
	.uleb128 0x1
	.ascii "KEY_R\0"
	.byte	0x52
	.uleb128 0x1
	.ascii "KEY_S\0"
	.byte	0x53
	.uleb128 0x1
	.ascii "KEY_T\0"
	.byte	0x54
	.uleb128 0x1
	.ascii "KEY_U\0"
	.byte	0x55
	.uleb128 0x1
	.ascii "KEY_V\0"
	.byte	0x56
	.uleb128 0x1
	.ascii "KEY_W\0"
	.byte	0x57
	.uleb128 0x1
	.ascii "KEY_X\0"
	.byte	0x58
	.uleb128 0x1
	.ascii "KEY_Y\0"
	.byte	0x59
	.uleb128 0x1
	.ascii "KEY_Z\0"
	.byte	0x5a
	.uleb128 0x1
	.ascii "KEY_LEFT_BRACKET\0"
	.byte	0x5b
	.uleb128 0x1
	.ascii "KEY_BACKSLASH\0"
	.byte	0x5c
	.uleb128 0x1
	.ascii "KEY_RIGHT_BRACKET\0"
	.byte	0x5d
	.uleb128 0x1
	.ascii "KEY_GRAVE\0"
	.byte	0x60
	.uleb128 0x1
	.ascii "KEY_SPACE\0"
	.byte	0x20
	.uleb128 0x2
	.ascii "KEY_ESCAPE\0"
	.word	0x100
	.uleb128 0x2
	.ascii "KEY_ENTER\0"
	.word	0x101
	.uleb128 0x2
	.ascii "KEY_TAB\0"
	.word	0x102
	.uleb128 0x2
	.ascii "KEY_BACKSPACE\0"
	.word	0x103
	.uleb128 0x2
	.ascii "KEY_INSERT\0"
	.word	0x104
	.uleb128 0x2
	.ascii "KEY_DELETE\0"
	.word	0x105
	.uleb128 0x2
	.ascii "KEY_RIGHT\0"
	.word	0x106
	.uleb128 0x2
	.ascii "KEY_LEFT\0"
	.word	0x107
	.uleb128 0x2
	.ascii "KEY_DOWN\0"
	.word	0x108
	.uleb128 0x2
	.ascii "KEY_UP\0"
	.word	0x109
	.uleb128 0x2
	.ascii "KEY_PAGE_UP\0"
	.word	0x10a
	.uleb128 0x2
	.ascii "KEY_PAGE_DOWN\0"
	.word	0x10b
	.uleb128 0x2
	.ascii "KEY_HOME\0"
	.word	0x10c
	.uleb128 0x2
	.ascii "KEY_END\0"
	.word	0x10d
	.uleb128 0x2
	.ascii "KEY_CAPS_LOCK\0"
	.word	0x118
	.uleb128 0x2
	.ascii "KEY_SCROLL_LOCK\0"
	.word	0x119
	.uleb128 0x2
	.ascii "KEY_NUM_LOCK\0"
	.word	0x11a
	.uleb128 0x2
	.ascii "KEY_PRINT_SCREEN\0"
	.word	0x11b
	.uleb128 0x2
	.ascii "KEY_PAUSE\0"
	.word	0x11c
	.uleb128 0x2
	.ascii "KEY_F1\0"
	.word	0x122
	.uleb128 0x2
	.ascii "KEY_F2\0"
	.word	0x123
	.uleb128 0x2
	.ascii "KEY_F3\0"
	.word	0x124
	.uleb128 0x2
	.ascii "KEY_F4\0"
	.word	0x125
	.uleb128 0x2
	.ascii "KEY_F5\0"
	.word	0x126
	.uleb128 0x2
	.ascii "KEY_F6\0"
	.word	0x127
	.uleb128 0x2
	.ascii "KEY_F7\0"
	.word	0x128
	.uleb128 0x2
	.ascii "KEY_F8\0"
	.word	0x129
	.uleb128 0x2
	.ascii "KEY_F9\0"
	.word	0x12a
	.uleb128 0x2
	.ascii "KEY_F10\0"
	.word	0x12b
	.uleb128 0x2
	.ascii "KEY_F11\0"
	.word	0x12c
	.uleb128 0x2
	.ascii "KEY_F12\0"
	.word	0x12d
	.uleb128 0x2
	.ascii "KEY_LEFT_SHIFT\0"
	.word	0x154
	.uleb128 0x2
	.ascii "KEY_LEFT_CONTROL\0"
	.word	0x155
	.uleb128 0x2
	.ascii "KEY_LEFT_ALT\0"
	.word	0x156
	.uleb128 0x2
	.ascii "KEY_LEFT_SUPER\0"
	.word	0x157
	.uleb128 0x2
	.ascii "KEY_RIGHT_SHIFT\0"
	.word	0x158
	.uleb128 0x2
	.ascii "KEY_RIGHT_CONTROL\0"
	.word	0x159
	.uleb128 0x2
	.ascii "KEY_RIGHT_ALT\0"
	.word	0x15a
	.uleb128 0x2
	.ascii "KEY_RIGHT_SUPER\0"
	.word	0x15b
	.uleb128 0x2
	.ascii "KEY_KB_MENU\0"
	.word	0x15c
	.uleb128 0x2
	.ascii "KEY_KP_0\0"
	.word	0x140
	.uleb128 0x2
	.ascii "KEY_KP_1\0"
	.word	0x141
	.uleb128 0x2
	.ascii "KEY_KP_2\0"
	.word	0x142
	.uleb128 0x2
	.ascii "KEY_KP_3\0"
	.word	0x143
	.uleb128 0x2
	.ascii "KEY_KP_4\0"
	.word	0x144
	.uleb128 0x2
	.ascii "KEY_KP_5\0"
	.word	0x145
	.uleb128 0x2
	.ascii "KEY_KP_6\0"
	.word	0x146
	.uleb128 0x2
	.ascii "KEY_KP_7\0"
	.word	0x147
	.uleb128 0x2
	.ascii "KEY_KP_8\0"
	.word	0x148
	.uleb128 0x2
	.ascii "KEY_KP_9\0"
	.word	0x149
	.uleb128 0x2
	.ascii "KEY_KP_DECIMAL\0"
	.word	0x14a
	.uleb128 0x2
	.ascii "KEY_KP_DIVIDE\0"
	.word	0x14b
	.uleb128 0x2
	.ascii "KEY_KP_MULTIPLY\0"
	.word	0x14c
	.uleb128 0x2
	.ascii "KEY_KP_SUBTRACT\0"
	.word	0x14d
	.uleb128 0x2
	.ascii "KEY_KP_ADD\0"
	.word	0x14e
	.uleb128 0x2
	.ascii "KEY_KP_ENTER\0"
	.word	0x14f
	.uleb128 0x2
	.ascii "KEY_KP_EQUAL\0"
	.word	0x150
	.uleb128 0x1
	.ascii "KEY_BACK\0"
	.byte	0x4
	.uleb128 0x1
	.ascii "KEY_MENU\0"
	.byte	0x52
	.uleb128 0x1
	.ascii "KEY_VOLUME_UP\0"
	.byte	0x18
	.uleb128 0x1
	.ascii "KEY_VOLUME_DOWN\0"
	.byte	0x19
	.byte	0
	.uleb128 0xb
	.ascii "KeyboardKey\0"
	.word	0x28f
	.long	0x148
	.uleb128 0xa
	.long	0xfa
	.word	0x297
	.long	0x74f
	.uleb128 0x1
	.ascii "MOUSE_BUTTON_LEFT\0"
	.byte	0
	.uleb128 0x1
	.ascii "MOUSE_BUTTON_RIGHT\0"
	.byte	0x1
	.uleb128 0x1
	.ascii "MOUSE_BUTTON_MIDDLE\0"
	.byte	0x2
	.uleb128 0x1
	.ascii "MOUSE_BUTTON_SIDE\0"
	.byte	0x3
	.uleb128 0x1
	.ascii "MOUSE_BUTTON_EXTRA\0"
	.byte	0x4
	.uleb128 0x1
	.ascii "MOUSE_BUTTON_FORWARD\0"
	.byte	0x5
	.uleb128 0x1
	.ascii "MOUSE_BUTTON_BACK\0"
	.byte	0x6
	.byte	0
	.uleb128 0xb
	.ascii "MouseButton\0"
	.word	0x29f
	.long	0x6b0
	.uleb128 0xc
	.ascii "IsMouseButtonDown\0"
	.word	0x464
	.long	0x13f
	.long	0x785
	.uleb128 0x5
	.long	0xf3
	.byte	0
	.uleb128 0xf
	.ascii "DrawLineV\0"
	.byte	0x2
	.word	0x497
	.byte	0x7
	.long	0x7a8
	.uleb128 0x5
	.long	0x92
	.uleb128 0x5
	.long	0x92
	.uleb128 0x5
	.long	0xe7
	.byte	0
	.uleb128 0xc
	.ascii "IsMouseButtonPressed\0"
	.word	0x463
	.long	0x13f
	.long	0x7ce
	.uleb128 0x5
	.long	0xf3
	.byte	0
	.uleb128 0x10
	.ascii "handleLineCreation\0"
	.byte	0x1
	.byte	0x18
	.byte	0x6
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x83e
	.uleb128 0x6
	.ascii "mousePos\0"
	.byte	0x18
	.byte	0x21
	.long	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.ascii "lineBtn\0"
	.byte	0x1a
	.byte	0x11
	.long	0x74f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xd
	.ascii "currLnStart\0"
	.byte	0x1b
	.byte	0x14
	.long	0x92
	.uleb128 0x9
	.byte	0x3
	.quad	currLnStart.0
	.byte	0
	.uleb128 0x11
	.ascii "handlePause\0"
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x884
	.uleb128 0x6
	.ascii "paused\0"
	.byte	0x12
	.byte	0x17
	.long	0x884
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.ascii "key\0"
	.byte	0x12
	.byte	0x2b
	.long	0x69d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x9
	.long	0x13f
	.uleb128 0x12
	.ascii "handleSpeedMod\0"
	.byte	0x1
	.byte	0xa
	.byte	0x6
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.ascii "speedMod\0"
	.byte	0xa
	.byte	0x1c
	.long	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.ascii "key\0"
	.byte	0xa
	.byte	0x32
	.long	0x69d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
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
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0x21
	.sleb128 7
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
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
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.section	.debug_line_str,"dr"
.LASF0:
	.ascii "user.c\0"
.LASF1:
	.ascii "C:\\\\msys64\\\\home\\\\alexa\\\\ballPhysics\\\\src\0"
	.ident	"GCC: (Rev7, Built by MSYS2 project) 13.1.0"
	.def	IsMouseButtonPressed;	.scl	2;	.type	32;	.endef
	.def	DrawLineV;	.scl	2;	.type	32;	.endef
	.def	IsMouseButtonDown;	.scl	2;	.type	32;	.endef
