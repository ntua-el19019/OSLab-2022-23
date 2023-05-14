	.file	"simplesync.c"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Done increasing variable.\n"
	.text
	.p2align 4,,15
	.globl	increase_fn
	.type	increase_fn, @function
increase_fn:
.LFB52:
	.file 1 "simplesync.c"
	.loc 1 43 0
	.cfi_startproc
.LVL0:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
.LVL1:
.LBB14:
.LBB15:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 79 0
	movq	stderr(%rip), %rdi
.LVL2:
.LBE15:
.LBE14:
	.loc 1 43 0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
.LBB18:
.LBB16:
	.loc 2 79 0
	leaq	.LC0(%rip), %rdx
.LBE16:
.LBE18:
	.loc 1 43 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 56 0
	leaq	lock(%rip), %rbp
.LBB19:
.LBB17:
	.loc 2 79 0
	movl	$10000000, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	$10000000, %ebx
	call	__fprintf_chk@PLT
.LVL3:
	.p2align 4,,10
	.p2align 3
.L2:
.LBE17:
.LBE19:
	.loc 1 56 0
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
.LVL4:
	.loc 1 58 0
	movl	(%r12), %eax
	.loc 1 59 0
	movq	%rbp, %rdi
	.loc 1 58 0
	addl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 59 0
	call	pthread_mutex_unlock@PLT
.LVL5:
	.loc 1 48 0
	subl	$1, %ebx
.LVL6:
	jne	.L2
.LVL7:
.LBB20:
.LBB21:
	.loc 2 79 0
	movq	stderr(%rip), %rcx
	leaq	.LC1(%rip), %rdi
	movl	$26, %edx
	movl	$1, %esi
	call	fwrite@PLT
.LVL8:
.LBE21:
.LBE20:
	.loc 1 66 0
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL9:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL10:
	ret
	.cfi_endproc
.LFE52:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4,,15
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LFB53:
	.loc 1 69 0
	.cfi_startproc
.LVL11:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
.LVL12:
.LBB22:
.LBB23:
	.loc 2 79 0
	movq	stderr(%rip), %rdi
.LVL13:
.LBE23:
.LBE22:
	.loc 1 69 0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
.LBB26:
.LBB24:
	.loc 2 79 0
	leaq	.LC2(%rip), %rdx
.LBE24:
.LBE26:
	.loc 1 69 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 82 0
	leaq	lock(%rip), %rbp
.LBB27:
.LBB25:
	.loc 2 79 0
	movl	$10000000, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	$10000000, %ebx
	call	__fprintf_chk@PLT
.LVL14:
	.p2align 4,,10
	.p2align 3
.L7:
.LBE25:
.LBE27:
	.loc 1 82 0
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
.LVL15:
	.loc 1 84 0
	movl	(%r12), %eax
	.loc 1 85 0
	movq	%rbp, %rdi
	.loc 1 84 0
	subl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 85 0
	call	pthread_mutex_unlock@PLT
.LVL16:
	.loc 1 74 0
	subl	$1, %ebx
.LVL17:
	jne	.L7
.LVL18:
.LBB28:
.LBB29:
	.loc 2 79 0
	movq	stderr(%rip), %rcx
	leaq	.LC3(%rip), %rdi
	movl	$26, %edx
	movl	$1, %esi
	call	fwrite@PLT
.LVL19:
.LBE29:
.LBE28:
	.loc 1 92 0
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL20:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL21:
	ret
	.cfi_endproc
.LFE53:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC4:
	.string	""
.LC5:
	.string	"NOT "
.LC6:
	.string	"\n mutex init has failed"
.LC7:
	.string	"pthread_create"
.LC8:
	.string	"pthread_join"
.LC9:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB54:
	.loc 1 96 0
	.cfi_startproc
.LVL22:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.loc 1 108 0
	leaq	lock(%rip), %rdi
.LVL23:
	xorl	%esi, %esi
.LVL24:
	.loc 1 96 0
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 96 0
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 103 0
	movl	$0, 4(%rsp)
	.loc 1 108 0
	call	pthread_mutex_init@PLT
.LVL25:
	testl	%eax, %eax
	jne	.L27
	.loc 1 112 0
	leaq	4(%rsp), %rbx
	leaq	8(%rsp), %rdi
	leaq	increase_fn(%rip), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rcx
	call	pthread_create@PLT
.LVL26:
	.loc 1 113 0
	testl	%eax, %eax
	.loc 1 112 0
	movl	%eax, %ebp
.LVL27:
	.loc 1 113 0
	jne	.L28
	.loc 1 117 0
	leaq	16(%rsp), %rdi
	leaq	decrease_fn(%rip), %rdx
	movq	%rbx, %rcx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL28:
	.loc 1 118 0
	testl	%eax, %eax
	.loc 1 117 0
	movl	%eax, %ebx
.LVL29:
	.loc 1 118 0
	jne	.L29
	.loc 1 126 0
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL30:
	.loc 1 127 0
	testl	%eax, %eax
	.loc 1 126 0
	movl	%eax, %ebx
.LVL31:
	.loc 1 127 0
	jne	.L30
.LVL32:
.L15:
	.loc 1 129 0
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL33:
	.loc 1 130 0
	testl	%eax, %eax
	.loc 1 129 0
	movl	%eax, %ebx
.LVL34:
	.loc 1 130 0
	jne	.L31
.LVL35:
.L16:
	.loc 1 133 0
	leaq	lock(%rip), %rdi
	.loc 1 138 0
	xorl	%ebx, %ebx
.LVL36:
	.loc 1 133 0
	call	pthread_mutex_destroy@PLT
.LVL37:
	.loc 1 138 0
	movl	4(%rsp), %ecx
	.loc 1 140 0
	leaq	.LC5(%rip), %rax
	leaq	.LC4(%rip), %rdx
.LBB30:
.LBB31:
	.loc 2 86 0
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
.LBE31:
.LBE30:
	.loc 1 138 0
	testl	%ecx, %ecx
	sete	%bl
.LVL38:
	.loc 1 140 0
	cmovne	%rax, %rdx
.LVL39:
.LBB33:
.LBB32:
	.loc 2 86 0
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL40:
.L10:
.LBE32:
.LBE33:
	.loc 1 143 0
	movq	24(%rsp), %rsi
	xorq	%fs:40, %rsi
	movl	%ebx, %eax
	jne	.L32
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
.LVL41:
.LBB34:
.LBB35:
	.loc 2 86 0
	leaq	.LC6(%rip), %rdi
.LBE35:
.LBE34:
	.loc 1 110 0
	movl	$1, %ebx
.LBB37:
.LBB36:
	.loc 2 86 0
	call	puts@PLT
.LVL42:
.LBE36:
.LBE37:
	.loc 1 110 0
	jmp	.L10
.LVL43:
.L31:
	.loc 1 131 0
	call	__errno_location@PLT
.LVL44:
	leaq	.LC8(%rip), %rdi
	movl	%ebx, (%rax)
	call	perror@PLT
.LVL45:
	jmp	.L16
.LVL46:
.L30:
	.loc 1 128 0
	call	__errno_location@PLT
.LVL47:
	leaq	.LC8(%rip), %rdi
	movl	%ebx, (%rax)
	call	perror@PLT
.LVL48:
	jmp	.L15
.LVL49:
.L32:
	.loc 1 143 0
	call	__stack_chk_fail@PLT
.LVL50:
.L29:
	.loc 1 119 0
	call	__errno_location@PLT
.LVL51:
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	call	perror@PLT
.LVL52:
	.loc 1 120 0
	movl	$1, %edi
	call	exit@PLT
.LVL53:
.L28:
	.loc 1 114 0
	call	__errno_location@PLT
.LVL54:
	leaq	.LC7(%rip), %rdi
	movl	%ebp, (%rax)
	call	perror@PLT
.LVL55:
	.loc 1 115 0
	movl	$1, %edi
	call	exit@PLT
.LVL56:
	.cfi_endproc
.LFE54:
	.size	main, .-main
	.comm	lock,40,32
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/6/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 11 "/usr/include/unistd.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 13 "/usr/include/time.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/stdio2-decl.h"
	.file 15 "/usr/include/pthread.h"
	.file 16 "/usr/include/errno.h"
	.file 17 "/usr/include/stdlib.h"
	.file 18 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa55
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF110
	.byte	0xc
	.long	.LASF111
	.long	.LASF112
	.long	.Ldebug_ranges0+0xe0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0xd8
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF6
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	0x67
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x98
	.long	0x73
	.uleb128 0x2
	.long	.LASF10
	.byte	0x4
	.byte	0x99
	.long	0x73
	.uleb128 0x7
	.byte	0x8
	.long	0x96
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x8
	.long	0x96
	.uleb128 0x9
	.long	.LASF55
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.long	0x20b
	.uleb128 0xa
	.long	.LASF12
	.byte	0x5
	.byte	0x33
	.long	0x67
	.byte	0
	.uleb128 0xa
	.long	.LASF13
	.byte	0x5
	.byte	0x36
	.long	0x90
	.byte	0x8
	.uleb128 0xa
	.long	.LASF14
	.byte	0x5
	.byte	0x37
	.long	0x90
	.byte	0x10
	.uleb128 0xa
	.long	.LASF15
	.byte	0x5
	.byte	0x38
	.long	0x90
	.byte	0x18
	.uleb128 0xa
	.long	.LASF16
	.byte	0x5
	.byte	0x39
	.long	0x90
	.byte	0x20
	.uleb128 0xa
	.long	.LASF17
	.byte	0x5
	.byte	0x3a
	.long	0x90
	.byte	0x28
	.uleb128 0xa
	.long	.LASF18
	.byte	0x5
	.byte	0x3b
	.long	0x90
	.byte	0x30
	.uleb128 0xa
	.long	.LASF19
	.byte	0x5
	.byte	0x3c
	.long	0x90
	.byte	0x38
	.uleb128 0xa
	.long	.LASF20
	.byte	0x5
	.byte	0x3d
	.long	0x90
	.byte	0x40
	.uleb128 0xa
	.long	.LASF21
	.byte	0x5
	.byte	0x40
	.long	0x90
	.byte	0x48
	.uleb128 0xa
	.long	.LASF22
	.byte	0x5
	.byte	0x41
	.long	0x90
	.byte	0x50
	.uleb128 0xa
	.long	.LASF23
	.byte	0x5
	.byte	0x42
	.long	0x90
	.byte	0x58
	.uleb128 0xa
	.long	.LASF24
	.byte	0x5
	.byte	0x44
	.long	0x222
	.byte	0x60
	.uleb128 0xa
	.long	.LASF25
	.byte	0x5
	.byte	0x46
	.long	0x228
	.byte	0x68
	.uleb128 0xa
	.long	.LASF26
	.byte	0x5
	.byte	0x48
	.long	0x67
	.byte	0x70
	.uleb128 0xa
	.long	.LASF27
	.byte	0x5
	.byte	0x49
	.long	0x67
	.byte	0x74
	.uleb128 0xa
	.long	.LASF28
	.byte	0x5
	.byte	0x4a
	.long	0x7a
	.byte	0x78
	.uleb128 0xa
	.long	.LASF29
	.byte	0x5
	.byte	0x4d
	.long	0x52
	.byte	0x80
	.uleb128 0xa
	.long	.LASF30
	.byte	0x5
	.byte	0x4e
	.long	0x59
	.byte	0x82
	.uleb128 0xa
	.long	.LASF31
	.byte	0x5
	.byte	0x4f
	.long	0x22e
	.byte	0x83
	.uleb128 0xa
	.long	.LASF32
	.byte	0x5
	.byte	0x51
	.long	0x23e
	.byte	0x88
	.uleb128 0xa
	.long	.LASF33
	.byte	0x5
	.byte	0x59
	.long	0x85
	.byte	0x90
	.uleb128 0xa
	.long	.LASF34
	.byte	0x5
	.byte	0x5b
	.long	0x249
	.byte	0x98
	.uleb128 0xa
	.long	.LASF35
	.byte	0x5
	.byte	0x5c
	.long	0x254
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF36
	.byte	0x5
	.byte	0x5d
	.long	0x228
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF37
	.byte	0x5
	.byte	0x5e
	.long	0x49
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF38
	.byte	0x5
	.byte	0x5f
	.long	0x29
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF39
	.byte	0x5
	.byte	0x60
	.long	0x67
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x5
	.byte	0x62
	.long	0x25a
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF41
	.byte	0x6
	.byte	0x7
	.long	0xa2
	.uleb128 0xb
	.long	.LASF113
	.byte	0x5
	.byte	0x2b
	.uleb128 0xc
	.long	.LASF42
	.uleb128 0x7
	.byte	0x8
	.long	0x21d
	.uleb128 0x7
	.byte	0x8
	.long	0xa2
	.uleb128 0xd
	.long	0x96
	.long	0x23e
	.uleb128 0xe
	.long	0x3b
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x216
	.uleb128 0xc
	.long	.LASF43
	.uleb128 0x7
	.byte	0x8
	.long	0x244
	.uleb128 0xc
	.long	.LASF44
	.uleb128 0x7
	.byte	0x8
	.long	0x24f
	.uleb128 0xd
	.long	0x96
	.long	0x26a
	.uleb128 0xe
	.long	0x3b
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF45
	.byte	0x7
	.byte	0x8f
	.long	0x275
	.uleb128 0x7
	.byte	0x8
	.long	0x20b
	.uleb128 0x10
	.long	0x275
	.uleb128 0xf
	.long	.LASF46
	.byte	0x7
	.byte	0x90
	.long	0x275
	.uleb128 0xf
	.long	.LASF47
	.byte	0x7
	.byte	0x91
	.long	0x275
	.uleb128 0x3
	.byte	0x20
	.byte	0x3
	.long	.LASF48
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF49
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF50
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF51
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF52
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF53
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF54
	.uleb128 0x9
	.long	.LASF56
	.byte	0x10
	.byte	0x8
	.byte	0x33
	.long	0x2ec
	.uleb128 0xa
	.long	.LASF57
	.byte	0x8
	.byte	0x35
	.long	0x2ec
	.byte	0
	.uleb128 0xa
	.long	.LASF58
	.byte	0x8
	.byte	0x36
	.long	0x2ec
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x2c7
	.uleb128 0x2
	.long	.LASF59
	.byte	0x8
	.byte	0x37
	.long	0x2c7
	.uleb128 0x9
	.long	.LASF60
	.byte	0x28
	.byte	0x9
	.byte	0x16
	.long	0x36a
	.uleb128 0xa
	.long	.LASF61
	.byte	0x9
	.byte	0x18
	.long	0x67
	.byte	0
	.uleb128 0xa
	.long	.LASF62
	.byte	0x9
	.byte	0x19
	.long	0x42
	.byte	0x4
	.uleb128 0xa
	.long	.LASF63
	.byte	0x9
	.byte	0x1a
	.long	0x67
	.byte	0x8
	.uleb128 0xa
	.long	.LASF64
	.byte	0x9
	.byte	0x1c
	.long	0x42
	.byte	0xc
	.uleb128 0xa
	.long	.LASF65
	.byte	0x9
	.byte	0x20
	.long	0x67
	.byte	0x10
	.uleb128 0xa
	.long	.LASF66
	.byte	0x9
	.byte	0x22
	.long	0x60
	.byte	0x14
	.uleb128 0xa
	.long	.LASF67
	.byte	0x9
	.byte	0x23
	.long	0x60
	.byte	0x16
	.uleb128 0xa
	.long	.LASF68
	.byte	0x9
	.byte	0x24
	.long	0x2f2
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF69
	.byte	0xa
	.byte	0x1b
	.long	0x34
	.uleb128 0x11
	.byte	0x28
	.byte	0xa
	.byte	0x43
	.long	0x39f
	.uleb128 0x12
	.long	.LASF70
	.byte	0xa
	.byte	0x45
	.long	0x2fd
	.uleb128 0x12
	.long	.LASF71
	.byte	0xa
	.byte	0x46
	.long	0x39f
	.uleb128 0x12
	.long	.LASF72
	.byte	0xa
	.byte	0x47
	.long	0x73
	.byte	0
	.uleb128 0xd
	.long	0x96
	.long	0x3af
	.uleb128 0xe
	.long	0x3b
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF73
	.byte	0xa
	.byte	0x48
	.long	0x375
	.uleb128 0x13
	.long	.LASF74
	.byte	0xb
	.value	0x234
	.long	0x3c6
	.uleb128 0x7
	.byte	0x8
	.long	0x90
	.uleb128 0xf
	.long	.LASF75
	.byte	0xc
	.byte	0x24
	.long	0x90
	.uleb128 0xf
	.long	.LASF76
	.byte	0xc
	.byte	0x32
	.long	0x67
	.uleb128 0xf
	.long	.LASF77
	.byte	0xc
	.byte	0x37
	.long	0x67
	.uleb128 0xf
	.long	.LASF78
	.byte	0xc
	.byte	0x3b
	.long	0x67
	.uleb128 0x7
	.byte	0x8
	.long	0x9d
	.uleb128 0x10
	.long	0x3f8
	.uleb128 0xd
	.long	0x90
	.long	0x413
	.uleb128 0xe
	.long	0x3b
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF79
	.byte	0xd
	.byte	0xd9
	.long	0x403
	.uleb128 0xf
	.long	.LASF80
	.byte	0xd
	.byte	0xda
	.long	0x67
	.uleb128 0xf
	.long	.LASF81
	.byte	0xd
	.byte	0xdb
	.long	0x73
	.uleb128 0xf
	.long	.LASF82
	.byte	0xd
	.byte	0xe0
	.long	0x403
	.uleb128 0xf
	.long	.LASF83
	.byte	0xd
	.byte	0xe8
	.long	0x67
	.uleb128 0xf
	.long	.LASF84
	.byte	0xd
	.byte	0xe9
	.long	0x73
	.uleb128 0x14
	.long	.LASF85
	.byte	0x1
	.byte	0x28
	.long	0x3af
	.uleb128 0x9
	.byte	0x3
	.quad	lock
	.uleb128 0x15
	.long	.LASF88
	.byte	0x1
	.byte	0x5f
	.long	0x67
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0x724
	.uleb128 0x16
	.long	.LASF86
	.byte	0x1
	.byte	0x5f
	.long	0x67
	.long	.LLST10
	.uleb128 0x16
	.long	.LASF87
	.byte	0x1
	.byte	0x5f
	.long	0x3c6
	.long	.LLST11
	.uleb128 0x17
	.string	"val"
	.byte	0x1
	.byte	0x61
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x18
	.string	"ret"
	.byte	0x1
	.byte	0x61
	.long	0x67
	.long	.LLST12
	.uleb128 0x18
	.string	"ok"
	.byte	0x1
	.byte	0x61
	.long	0x67
	.long	.LLST13
	.uleb128 0x17
	.string	"t1"
	.byte	0x1
	.byte	0x62
	.long	0x36a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x17
	.string	"t2"
	.byte	0x1
	.byte	0x62
	.long	0x36a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.long	0x950
	.quad	.LBB30
	.long	.Ldebug_ranges0+0x80
	.byte	0x1
	.byte	0x8c
	.long	0x52f
	.uleb128 0x1a
	.long	0x960
	.long	.LLST14
	.uleb128 0x1b
	.quad	.LVL40
	.long	0x995
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	0x950
	.quad	.LBB34
	.long	.Ldebug_ranges0+0xb0
	.byte	0x1
	.byte	0x6d
	.long	0x56b
	.uleb128 0x1a
	.long	0x960
	.long	.LLST15
	.uleb128 0x1b
	.quad	.LVL42
	.long	0x9bd
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL25
	.long	0x9cc
	.long	0x58f
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	lock
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL26
	.long	0x9d8
	.long	0x5bf
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	increase_fn
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL28
	.long	0x9d8
	.long	0x5ef
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	decrease_fn
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL30
	.long	0x9e3
	.long	0x606
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL33
	.long	0x9e3
	.long	0x61d
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL37
	.long	0x9ee
	.long	0x63c
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	lock
	.byte	0
	.uleb128 0x1e
	.quad	.LVL44
	.long	0x9fa
	.uleb128 0x1d
	.quad	.LVL45
	.long	0xa05
	.long	0x668
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.uleb128 0x1e
	.quad	.LVL47
	.long	0x9fa
	.uleb128 0x1d
	.quad	.LVL48
	.long	0xa05
	.long	0x694
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.uleb128 0x1e
	.quad	.LVL50
	.long	0xa11
	.uleb128 0x1e
	.quad	.LVL51
	.long	0x9fa
	.uleb128 0x1d
	.quad	.LVL52
	.long	0xa05
	.long	0x6cd
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x1d
	.quad	.LVL53
	.long	0xa1a
	.long	0x6e4
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1e
	.quad	.LVL54
	.long	0x9fa
	.uleb128 0x1d
	.quad	.LVL55
	.long	0xa05
	.long	0x710
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x1b
	.quad	.LVL56
	.long	0xa1a
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LASF89
	.byte	0x1
	.byte	0x44
	.long	0x49
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x837
	.uleb128 0x1f
	.string	"arg"
	.byte	0x1
	.byte	0x44
	.long	0x49
	.long	.LLST5
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x46
	.long	0x67
	.long	.LLST6
	.uleb128 0x18
	.string	"ip"
	.byte	0x1
	.byte	0x47
	.long	0x837
	.long	.LLST7
	.uleb128 0x19
	.long	0x96d
	.quad	.LBB22
	.long	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0x49
	.long	0x7bb
	.uleb128 0x1a
	.long	0x988
	.long	.LLST8
	.uleb128 0x20
	.long	0x97d
	.uleb128 0x1b
	.quad	.LVL14
	.long	0xa26
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0x96d
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.byte	0x1
	.byte	0x59
	.long	0x80a
	.uleb128 0x1a
	.long	0x988
	.long	.LLST9
	.uleb128 0x20
	.long	0x97d
	.uleb128 0x1b
	.quad	.LVL19
	.long	0xa31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL15
	.long	0xa40
	.long	0x822
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1b
	.quad	.LVL16
	.long	0xa4c
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x6e
	.uleb128 0x15
	.long	.LASF90
	.byte	0x1
	.byte	0x2a
	.long	0x49
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0x950
	.uleb128 0x1f
	.string	"arg"
	.byte	0x1
	.byte	0x2a
	.long	0x49
	.long	.LLST0
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x2c
	.long	0x67
	.long	.LLST1
	.uleb128 0x18
	.string	"ip"
	.byte	0x1
	.byte	0x2d
	.long	0x837
	.long	.LLST2
	.uleb128 0x19
	.long	0x96d
	.quad	.LBB14
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2f
	.long	0x8d4
	.uleb128 0x1a
	.long	0x988
	.long	.LLST3
	.uleb128 0x20
	.long	0x97d
	.uleb128 0x1b
	.quad	.LVL3
	.long	0xa26
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0x96d
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.byte	0x1
	.byte	0x3f
	.long	0x923
	.uleb128 0x1a
	.long	0x988
	.long	.LLST4
	.uleb128 0x20
	.long	0x97d
	.uleb128 0x1b
	.quad	.LVL8
	.long	0xa31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL4
	.long	0xa40
	.long	0x93b
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1b
	.quad	.LVL5
	.long	0xa4c
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF91
	.byte	0x2
	.byte	0x54
	.long	0x67
	.byte	0x3
	.long	0x96d
	.uleb128 0x23
	.long	.LASF93
	.byte	0x2
	.byte	0x54
	.long	0x3fe
	.uleb128 0x24
	.byte	0
	.uleb128 0x22
	.long	.LASF92
	.byte	0x2
	.byte	0x4d
	.long	0x67
	.byte	0x3
	.long	0x995
	.uleb128 0x23
	.long	.LASF94
	.byte	0x2
	.byte	0x4d
	.long	0x27b
	.uleb128 0x23
	.long	.LASF93
	.byte	0x2
	.byte	0x4d
	.long	0x3fe
	.uleb128 0x24
	.byte	0
	.uleb128 0x25
	.long	.LASF95
	.long	.LASF95
	.byte	0xe
	.byte	0x33
	.uleb128 0x26
	.uleb128 0x1b
	.byte	0x9e
	.uleb128 0x19
	.byte	0xa
	.byte	0x20
	.byte	0x6d
	.byte	0x75
	.byte	0x74
	.byte	0x65
	.byte	0x78
	.byte	0x20
	.byte	0x69
	.byte	0x6e
	.byte	0x69
	.byte	0x74
	.byte	0x20
	.byte	0x68
	.byte	0x61
	.byte	0x73
	.byte	0x20
	.byte	0x66
	.byte	0x61
	.byte	0x69
	.byte	0x6c
	.byte	0x65
	.byte	0x64
	.byte	0xa
	.byte	0
	.uleb128 0x27
	.long	.LASF104
	.long	.LASF106
	.byte	0x12
	.byte	0
	.long	.LASF104
	.uleb128 0x28
	.long	.LASF96
	.long	.LASF96
	.byte	0xf
	.value	0x30d
	.uleb128 0x25
	.long	.LASF97
	.long	.LASF97
	.byte	0xf
	.byte	0xca
	.uleb128 0x25
	.long	.LASF98
	.long	.LASF98
	.byte	0xf
	.byte	0xdb
	.uleb128 0x28
	.long	.LASF99
	.long	.LASF99
	.byte	0xf
	.value	0x312
	.uleb128 0x25
	.long	.LASF100
	.long	.LASF100
	.byte	0x10
	.byte	0x25
	.uleb128 0x28
	.long	.LASF101
	.long	.LASF101
	.byte	0x7
	.value	0x324
	.uleb128 0x29
	.long	.LASF114
	.long	.LASF114
	.uleb128 0x28
	.long	.LASF102
	.long	.LASF102
	.byte	0x11
	.value	0x27d
	.uleb128 0x25
	.long	.LASF103
	.long	.LASF103
	.byte	0xe
	.byte	0x31
	.uleb128 0x27
	.long	.LASF105
	.long	.LASF107
	.byte	0x12
	.byte	0
	.long	.LASF105
	.uleb128 0x28
	.long	.LASF108
	.long	.LASF108
	.byte	0xf
	.value	0x31a
	.uleb128 0x28
	.long	.LASF109
	.long	.LASF109
	.byte	0xf
	.value	0x343
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST10:
	.quad	.LVL22
	.quad	.LVL23
	.value	0x1
	.byte	0x55
	.quad	.LVL23
	.quad	.LFE54
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL22
	.quad	.LVL24
	.value	0x1
	.byte	0x54
	.quad	.LVL24
	.quad	.LFE54
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL27
	.quad	.LVL28-1
	.value	0x1
	.byte	0x50
	.quad	.LVL28-1
	.quad	.LVL29
	.value	0x1
	.byte	0x56
	.quad	.LVL29
	.quad	.LVL30-1
	.value	0x1
	.byte	0x50
	.quad	.LVL30-1
	.quad	.LVL31
	.value	0x1
	.byte	0x53
	.quad	.LVL31
	.quad	.LVL32
	.value	0x1
	.byte	0x50
	.quad	.LVL32
	.quad	.LVL34
	.value	0x1
	.byte	0x53
	.quad	.LVL34
	.quad	.LVL35
	.value	0x1
	.byte	0x50
	.quad	.LVL35
	.quad	.LVL36
	.value	0x1
	.byte	0x53
	.quad	.LVL43
	.quad	.LVL44-1
	.value	0x1
	.byte	0x50
	.quad	.LVL44-1
	.quad	.LVL46
	.value	0x1
	.byte	0x53
	.quad	.LVL46
	.quad	.LVL47-1
	.value	0x1
	.byte	0x50
	.quad	.LVL47-1
	.quad	.LVL49
	.value	0x1
	.byte	0x53
	.quad	.LVL50
	.quad	.LVL51-1
	.value	0x1
	.byte	0x50
	.quad	.LVL51-1
	.quad	.LVL53
	.value	0x1
	.byte	0x53
	.quad	.LVL53
	.quad	.LVL54-1
	.value	0x1
	.byte	0x50
	.quad	.LVL54-1
	.quad	.LFE54
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL38
	.quad	.LVL40
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL39
	.quad	.LVL40
	.value	0xa
	.byte	0x3
	.quad	.LC9
	.byte	0x9f
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL41
	.quad	.LVL42
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2464
	.sleb128 0
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL11
	.quad	.LVL13
	.value	0x1
	.byte	0x55
	.quad	.LVL13
	.quad	.LVL21
	.value	0x1
	.byte	0x5c
	.quad	.LVL21
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL14
	.quad	.LVL16
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL16
	.quad	.LVL17
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL17
	.quad	.LVL20
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL12
	.quad	.LVL13
	.value	0x1
	.byte	0x55
	.quad	.LVL13
	.quad	.LVL19
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL12
	.quad	.LVL14
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL18
	.quad	.LVL19
	.value	0xa
	.byte	0x3
	.quad	.LC3
	.byte	0x9f
	.quad	0
	.quad	0
.LLST0:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL10
	.value	0x1
	.byte	0x5c
	.quad	.LVL10
	.quad	.LFE52
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL3
	.quad	.LVL5
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL6
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL6
	.quad	.LVL9
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL8
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL1
	.quad	.LVL3
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL7
	.quad	.LVL8
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB14
	.quad	.LBE14
	.quad	.LBB18
	.quad	.LBE18
	.quad	.LBB19
	.quad	.LBE19
	.quad	0
	.quad	0
	.quad	.LBB22
	.quad	.LBE22
	.quad	.LBB26
	.quad	.LBE26
	.quad	.LBB27
	.quad	.LBE27
	.quad	0
	.quad	0
	.quad	.LBB30
	.quad	.LBE30
	.quad	.LBB33
	.quad	.LBE33
	.quad	0
	.quad	0
	.quad	.LBB34
	.quad	.LBE34
	.quad	.LBB37
	.quad	.LBE37
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB54
	.quad	.LFE54
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF100:
	.string	"__errno_location"
.LASF75:
	.string	"optarg"
.LASF35:
	.string	"_wide_data"
.LASF106:
	.string	"__builtin_puts"
.LASF95:
	.string	"__printf_chk"
.LASF51:
	.string	"double"
.LASF55:
	.string	"_IO_FILE"
.LASF23:
	.string	"_IO_save_end"
.LASF6:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF1:
	.string	"sizetype"
.LASF33:
	.string	"_offset"
.LASF56:
	.string	"__pthread_internal_list"
.LASF88:
	.string	"main"
.LASF17:
	.string	"_IO_write_ptr"
.LASF12:
	.string	"_flags"
.LASF73:
	.string	"pthread_mutex_t"
.LASF57:
	.string	"__prev"
.LASF62:
	.string	"__count"
.LASF32:
	.string	"_lock"
.LASF74:
	.string	"__environ"
.LASF24:
	.string	"_markers"
.LASF48:
	.string	"__unknown__"
.LASF37:
	.string	"_freeres_buf"
.LASF83:
	.string	"daylight"
.LASF96:
	.string	"pthread_mutex_init"
.LASF84:
	.string	"timezone"
.LASF108:
	.string	"pthread_mutex_lock"
.LASF13:
	.string	"_IO_read_ptr"
.LASF58:
	.string	"__next"
.LASF71:
	.string	"__size"
.LASF50:
	.string	"float"
.LASF41:
	.string	"FILE"
.LASF47:
	.string	"stderr"
.LASF42:
	.string	"_IO_marker"
.LASF53:
	.string	"long long int"
.LASF98:
	.string	"pthread_join"
.LASF81:
	.string	"__timezone"
.LASF97:
	.string	"pthread_create"
.LASF80:
	.string	"__daylight"
.LASF7:
	.string	"long int"
.LASF91:
	.string	"printf"
.LASF29:
	.string	"_cur_column"
.LASF101:
	.string	"perror"
.LASF92:
	.string	"fprintf"
.LASF66:
	.string	"__spins"
.LASF16:
	.string	"_IO_write_base"
.LASF87:
	.string	"argv"
.LASF102:
	.string	"exit"
.LASF28:
	.string	"_old_offset"
.LASF52:
	.string	"long double"
.LASF107:
	.string	"__builtin_fwrite"
.LASF3:
	.string	"unsigned char"
.LASF86:
	.string	"argc"
.LASF79:
	.string	"__tzname"
.LASF99:
	.string	"pthread_mutex_destroy"
.LASF5:
	.string	"signed char"
.LASF34:
	.string	"_codecvt"
.LASF54:
	.string	"long long unsigned int"
.LASF89:
	.string	"decrease_fn"
.LASF2:
	.string	"unsigned int"
.LASF93:
	.string	"__fmt"
.LASF31:
	.string	"_shortbuf"
.LASF14:
	.string	"_IO_read_end"
.LASF104:
	.string	"puts"
.LASF82:
	.string	"tzname"
.LASF40:
	.string	"_unused2"
.LASF77:
	.string	"opterr"
.LASF110:
	.string	"GNU C11 6.4.0 20180424 -mtune=generic -march=x86-64 -g -O2 -fstack-protector-strong"
.LASF20:
	.string	"_IO_buf_end"
.LASF11:
	.string	"char"
.LASF64:
	.string	"__nusers"
.LASF76:
	.string	"optind"
.LASF111:
	.string	"simplesync.c"
.LASF49:
	.string	"__float128"
.LASF85:
	.string	"lock"
.LASF36:
	.string	"_freeres_list"
.LASF38:
	.string	"__pad5"
.LASF109:
	.string	"pthread_mutex_unlock"
.LASF61:
	.string	"__lock"
.LASF63:
	.string	"__owner"
.LASF4:
	.string	"short unsigned int"
.LASF90:
	.string	"increase_fn"
.LASF60:
	.string	"__pthread_mutex_s"
.LASF105:
	.string	"fwrite"
.LASF0:
	.string	"long unsigned int"
.LASF18:
	.string	"_IO_write_end"
.LASF10:
	.string	"__off64_t"
.LASF67:
	.string	"__elision"
.LASF26:
	.string	"_fileno"
.LASF25:
	.string	"_chain"
.LASF59:
	.string	"__pthread_list_t"
.LASF39:
	.string	"_mode"
.LASF70:
	.string	"__data"
.LASF112:
	.string	"/home/brewed/Desktop/OSLab-2022-23/ex3"
.LASF22:
	.string	"_IO_backup_base"
.LASF45:
	.string	"stdin"
.LASF19:
	.string	"_IO_buf_base"
.LASF9:
	.string	"__off_t"
.LASF27:
	.string	"_flags2"
.LASF43:
	.string	"_IO_codecvt"
.LASF15:
	.string	"_IO_read_base"
.LASF68:
	.string	"__list"
.LASF30:
	.string	"_vtable_offset"
.LASF44:
	.string	"_IO_wide_data"
.LASF21:
	.string	"_IO_save_base"
.LASF103:
	.string	"__fprintf_chk"
.LASF78:
	.string	"optopt"
.LASF114:
	.string	"__stack_chk_fail"
.LASF65:
	.string	"__kind"
.LASF94:
	.string	"__stream"
.LASF69:
	.string	"pthread_t"
.LASF72:
	.string	"__align"
.LASF46:
	.string	"stdout"
.LASF113:
	.string	"_IO_lock_t"
	.ident	"GCC: (Ubuntu 6.4.0-17ubuntu1) 6.4.0 20180424"
	.section	.note.GNU-stack,"",@progbits
