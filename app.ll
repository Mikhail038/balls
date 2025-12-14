	.file	"app.c"
	.text
	.globl	initBalls
	.type	initBalls, @function
initBalls:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	X(%rip), %r12
	leaq	Y(%rip), %r15
	leaq	VX(%rip), %rbp
	leaq	VY(%rip), %rbx
	leaq	Radius(%rip), %r14
	leaq	Color(%rip), %r13
	jmp	.L4
.L3:
	movl	%edx, (%rcx)
	movl	$0, %eax
	call	simRand@PLT
	cltd
	shrl	$28, %edx
	addl	%edx, %eax
	andl	$15, %eax
	subl	%edx, %eax
	addl	$5, %eax
	movl	%eax, (%r14)
	movl	$-65536, (%rsp)
	movl	$-16776961, 4(%rsp)
	movl	$-65281, 8(%rsp)
	movl	$-1, 12(%rsp)
	movl	$0, %eax
	call	simRand@PLT
	cltd
	shrl	$30, %edx
	addl	%edx, %eax
	andl	$3, %eax
	subl	%edx, %eax
	cltq
	movl	(%rsp,%rax,4), %eax
	movl	%eax, 0(%r13)
	addq	$4, %r12
	addq	$4, %r15
	addq	$4, %rbp
	addq	$4, %rbx
	addq	$4, %r14
	addq	$4, %r13
	leaq	40+X(%rip), %rax
	cmpq	%rax, %r12
	je	.L10
.L4:
	movl	$0, %eax
	call	simRand@PLT
	movslq	%eax, %rdx
	imulq	$-1401515643, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$9, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$760, %edx, %edx
	subl	%edx, %eax
	addl	$20, %eax
	movl	%eax, (%r12)
	movl	$0, %eax
	call	simRand@PLT
	movslq	%eax, %rdx
	imulq	$-368140053, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$9, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$560, %edx, %edx
	subl	%edx, %eax
	addl	$20, %eax
	movl	%eax, (%r15)
	movl	$0, %eax
	call	simRand@PLT
	movslq	%eax, %rdx
	imulq	$780903145, %rdx, %rdx
	sarq	$33, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %ecx
	leal	(%rdx,%rcx,2), %edx
	subl	%edx, %eax
	subl	$5, %eax
	movq	%rbp, %rcx
	movl	%eax, 0(%rbp)
	movl	$1, %edx
	je	.L2
	movl	%eax, %edx
.L2:
	movl	%edx, (%rcx)
	movl	$0, %eax
	call	simRand@PLT
	movslq	%eax, %rdx
	imulq	$780903145, %rdx, %rdx
	sarq	$33, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %ecx
	leal	(%rdx,%rcx,2), %edx
	subl	%edx, %eax
	subl	$5, %eax
	movq	%rbx, %rcx
	movl	%eax, (%rbx)
	movl	$1, %edx
	je	.L3
	movl	%eax, %edx
	jmp	.L3
.L10:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L11
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
	.size	initBalls, .-initBalls
	.globl	updateBalls
	.type	updateBalls, @function
updateBalls:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	$0, %ebp
.L13:
	movl	$0, %ebx
.L14:
	movl	$-16777216, %edx
	movl	%ebp, %esi
	movl	%ebx, %edi
	call	simPutPixel@PLT
	addl	$1, %ebx
	cmpl	$800, %ebx
	jne	.L14
	addl	$1, %ebp
	cmpl	$600, %ebp
	jne	.L13
	leaq	X(%rip), %rbp
	leaq	VX(%rip), %rax
	leaq	Y(%rip), %r13
	leaq	VY(%rip), %rdx
	leaq	Radius(%rip), %r9
	leaq	Color(%rip), %r8
	movq	%rax, %r15
	movq	%rbp, %r12
	movq	%r13, %rax
	jmp	.L24
.L22:
	addl	$1, %ebx
	addl	$1, %r12d
	cmpl	%ebx, %r14d
	jl	.L30
.L23:
	movl	%ebx, %eax
	imull	%ebx, %eax
	addl	%r15d, %eax
	cmpl	%ebp, %eax
	jg	.L22
	cmpl	$799, %r12d
	ja	.L22
	cmpl	$599, (%rsp)
	ja	.L22
	movl	12(%rsp), %edx
	movl	(%rsp), %esi
	movl	%r12d, %edi
	call	simPutPixel@PLT
	jmp	.L22
.L30:
	addl	$1, %r13d
	addl	$1, (%rsp)
	cmpl	%r13d, %r14d
	jl	.L28
.L21:
	movl	%r13d, %r15d
	imull	%r13d, %r15d
	movl	4(%rsp), %r12d
	subl	%r14d, %r12d
	movl	8(%rsp), %ebx
	jmp	.L23
.L28:
	movq	16(%rsp), %r15
	movq	24(%rsp), %r12
	movq	32(%rsp), %rax
	movq	40(%rsp), %rdx
	movq	48(%rsp), %r9
	movq	56(%rsp), %r8
.L20:
	addq	$4, %r12
	addq	$4, %r15
	addq	$4, %rax
	addq	$4, %rdx
	addq	$4, %r9
	addq	$4, %r8
	leaq	40+X(%rip), %rcx
	cmpq	%rcx, %r12
	je	.L31
.L24:
	movq	%r12, %r10
	movq	%r15, %rbp
	movl	(%r15), %edi
	movl	%edi, %r13d
	addl	(%r12), %r13d
	movl	%r13d, (%r12)
	movq	%rax, %rcx
	movq	%rdx, %r11
	movl	(%rdx), %esi
	movl	%esi, %ebx
	addl	(%rax), %ebx
	movl	%ebx, (%rax)
	movl	(%r9), %r14d
	cmpl	%r14d, %r13d
	jge	.L16
	movl	%r14d, (%r12)
	negl	%edi
	movl	%edi, (%r15)
.L16:
	movl	$800, %edi
	subl	%r14d, %edi
	cmpl	%edi, (%r10)
	jl	.L17
	movl	$799, %edi
	subl	%r14d, %edi
	movl	%edi, (%r10)
	negl	0(%rbp)
.L17:
	cmpl	%r14d, %ebx
	jge	.L18
	movl	%r14d, (%rcx)
	negl	%esi
	movl	%esi, (%r11)
.L18:
	movl	$600, %esi
	subl	%r14d, %esi
	cmpl	%esi, (%rcx)
	jl	.L19
	movl	$599, %esi
	subl	%r14d, %esi
	movl	%esi, (%rcx)
	negl	(%r11)
.L19:
	movl	(%r10), %edi
	movl	%edi, 4(%rsp)
	movl	(%rcx), %ecx
	movl	(%r8), %edi
	movl	%edi, 12(%rsp)
	movl	%r14d, %esi
	negl	%esi
	cmpl	%esi, %r14d
	jl	.L20
	movl	%r14d, %ebp
	imull	%r14d, %ebp
	subl	%r14d, %ecx
	movl	%ecx, (%rsp)
	movl	%esi, %r13d
	movl	%esi, 8(%rsp)
	movq	%r15, 16(%rsp)
	movq	%r12, 24(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%r9, 48(%rsp)
	movq	%r8, 56(%rsp)
	jmp	.L21
.L31:
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	updateBalls, .-updateBalls
	.globl	app
	.type	app, @function
app:
.LFB2:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %eax
	call	initBalls
	jmp	.L33
.L34:
	movl	$0, %eax
	call	updateBalls
	movl	$0, %eax
	call	simFlush@PLT
	movl	$20, %edi
	call	simDelay@PLT
.L33:
	movl	$0, %eax
	call	hasQuitSignal@PLT
	testl	%eax, %eax
	je	.L34
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	app, .-app
	.globl	Color
	.bss
	.align 32
	.type	Color, @object
	.size	Color, 40
Color:
	.zero	40
	.globl	Radius
	.align 32
	.type	Radius, @object
	.size	Radius, 40
Radius:
	.zero	40
	.globl	VY
	.align 32
	.type	VY, @object
	.size	VY, 40
VY:
	.zero	40
	.globl	VX
	.align 32
	.type	VX, @object
	.size	VX, 40
VX:
	.zero	40
	.globl	Y
	.align 32
	.type	Y, @object
	.size	Y, 40
Y:
	.zero	40
	.globl	X
	.align 32
	.type	X, @object
	.size	X, 40
X:
	.zero	40
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
