	.cpu generic+fp+simd
	.file	"decomment.c"
	.text
	.align	2
	.global	handleNormalState
	.type	handleNormalState, %function
handleNormalState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 34
	bne	.L2
	mov	w0, 1
	str	w0, [x29,44]
	ldr	w0, [x29,28]
	bl	putchar
	b	.L3
.L2:
	ldr	w0, [x29,28]
	cmp	w0, 39
	bne	.L4
	mov	w0, 2
	str	w0, [x29,44]
	ldr	w0, [x29,28]
	bl	putchar
	b	.L3
.L4:
	ldr	w0, [x29,28]
	cmp	w0, 47
	bne	.L5
	mov	w0, 3
	str	w0, [x29,44]
	b	.L3
.L5:
	str	wzr, [x29,44]
	ldr	w0, [x29,28]
	bl	putchar
.L3:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormalState, .-handleNormalState
	.align	2
	.global	handleInStringState
	.type	handleInStringState, %function
handleInStringState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 34
	bne	.L8
	str	wzr, [x29,44]
	ldr	w0, [x29,28]
	bl	putchar
	b	.L9
.L8:
	ldr	w0, [x29,28]
	cmp	w0, 92
	bne	.L10
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 7
	str	w0, [x29,44]
	b	.L9
.L10:
	mov	w0, 1
	str	w0, [x29,44]
	ldr	w0, [x29,28]
	bl	putchar
.L9:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleInStringState, .-handleInStringState
	.align	2
	.global	handleInCharState
	.type	handleInCharState, %function
handleInCharState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 39
	bne	.L13
	str	wzr, [x29,44]
	ldr	w0, [x29,28]
	bl	putchar
	b	.L14
.L13:
	ldr	w0, [x29,28]
	cmp	w0, 92
	bne	.L15
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 6
	str	w0, [x29,44]
	b	.L14
.L15:
	mov	w0, 2
	str	w0, [x29,44]
	ldr	w0, [x29,28]
	bl	putchar
.L14:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleInCharState, .-handleInCharState
	.align	2
	.global	handleSlashState
	.type	handleSlashState, %function
handleSlashState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 42
	bne	.L18
	mov	w0, 32
	bl	putchar
	mov	w0, 5
	str	w0, [x29,44]
	b	.L19
.L18:
	ldr	w0, [x29,28]
	cmp	w0, 47
	bne	.L20
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 3
	str	w0, [x29,44]
	b	.L19
.L20:
	ldr	w0, [x29,28]
	cmp	w0, 39
	bne	.L21
	mov	w0, 47
	bl	putchar
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 2
	str	w0, [x29,44]
	b	.L19
.L21:
	ldr	w0, [x29,28]
	cmp	w0, 34
	bne	.L22
	mov	w0, 47
	bl	putchar
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 1
	str	w0, [x29,44]
	b	.L19
.L22:
	mov	w0, 47
	bl	putchar
	ldr	w0, [x29,28]
	bl	putchar
	str	wzr, [x29,44]
.L19:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleSlashState, .-handleSlashState
	.align	2
	.global	handleCommentState
	.type	handleCommentState, %function
handleCommentState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 42
	bne	.L25
	mov	w0, 4
	str	w0, [x29,44]
	b	.L26
.L25:
	ldr	w0, [x29,28]
	cmp	w0, 10
	bne	.L27
	mov	w0, 10
	bl	putchar
	b	.L26
.L27:
	mov	w0, 5
	str	w0, [x29,44]
.L26:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleCommentState, .-handleCommentState
	.align	2
	.global	handleStarState
	.type	handleStarState, %function
handleStarState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 47
	bne	.L30
	str	wzr, [x29,44]
	b	.L31
.L30:
	ldr	w0, [x29,28]
	cmp	w0, 42
	bne	.L32
	mov	w0, 4
	str	w0, [x29,44]
	b	.L31
.L32:
	ldr	w0, [x29,28]
	cmp	w0, 10
	bne	.L33
	mov	w0, 10
	bl	putchar
	mov	w0, 5
	str	w0, [x29,44]
	b	.L31
.L33:
	mov	w0, 5
	str	w0, [x29,44]
.L31:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleStarState, .-handleStarState
	.align	2
	.global	handleEscapedChar
	.type	handleEscapedChar, %function
handleEscapedChar:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 2
	str	w0, [x29,44]
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleEscapedChar, .-handleEscapedChar
	.align	2
	.global	handleEscapedString
	.type	handleEscapedString, %function
handleEscapedString:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 1
	str	w0, [x29,44]
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleEscapedString, .-handleEscapedString
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	mov	w0, 1
	str	w0, [x29,28]
	str	wzr, [x29,24]
	str	wzr, [x29,20]
	b	.L40
.L54:
	ldr	w0, [x29,16]
	cmp	w0, 10
	bne	.L41
	ldr	w0, [x29,28]
	add	w0, w0, 1
	str	w0, [x29,28]
.L41:
	ldr	w0, [x29,16]
	cmp	w0, 10
	bne	.L42
	ldr	w0, [x29,20]
	cmp	w0, 5
	beq	.L43
	ldr	w0, [x29,20]
	cmp	w0, 4
	bne	.L42
.L43:
	ldr	w0, [x29,24]
	add	w0, w0, 1
	str	w0, [x29,24]
.L42:
	ldr	w0, [x29,20]
	cmp	w0, wzr
	bne	.L44
	str	wzr, [x29,24]
.L44:
	ldr	w0, [x29,20]
	cmp	w0, 7
	bhi	.L40
	adrp	x1, .L46
	add	x1, x1, :lo12:.L46
	ldr	w2, [x1,w0,uxtw #2]
	adr	x3, .Lrtx46
	add	x2, x3, w2, sxtw #2
	br	x2
.Lrtx46:
	.section	.rodata
	.align	0
	.align	2
.L46:
	.word	(.L45 - .Lrtx46) / 4
	.word	(.L47 - .Lrtx46) / 4
	.word	(.L48 - .Lrtx46) / 4
	.word	(.L49 - .Lrtx46) / 4
	.word	(.L50 - .Lrtx46) / 4
	.word	(.L51 - .Lrtx46) / 4
	.word	(.L52 - .Lrtx46) / 4
	.word	(.L53 - .Lrtx46) / 4
	.text
.L45:
	ldr	w0, [x29,16]
	bl	handleNormalState
	str	w0, [x29,20]
	b	.L40
.L47:
	ldr	w0, [x29,16]
	bl	handleInStringState
	str	w0, [x29,20]
	b	.L40
.L48:
	ldr	w0, [x29,16]
	bl	handleInCharState
	str	w0, [x29,20]
	b	.L40
.L49:
	ldr	w0, [x29,16]
	bl	handleSlashState
	str	w0, [x29,20]
	b	.L40
.L51:
	ldr	w0, [x29,16]
	bl	handleCommentState
	str	w0, [x29,20]
	b	.L40
.L50:
	ldr	w0, [x29,16]
	bl	handleStarState
	str	w0, [x29,20]
	b	.L40
.L52:
	ldr	w0, [x29,16]
	bl	handleEscapedChar
	str	w0, [x29,20]
	b	.L40
.L53:
	ldr	w0, [x29,16]
	bl	handleEscapedString
	str	w0, [x29,20]
	nop
.L40:
	bl	getchar
	str	w0, [x29,16]
	ldr	w0, [x29,16]
	cmn	w0, #1
	bne	.L54
	ldr	w0, [x29,20]
	cmp	w0, 3
	bne	.L55
	mov	w0, 47
	bl	putchar
	b	.L56
.L55:
	ldr	w0, [x29,20]
	cmp	w0, 5
	beq	.L57
	ldr	w0, [x29,20]
	cmp	w0, 4
	bne	.L56
.L57:
	ldr	w1, [x29,28]
	ldr	w0, [x29,24]
	sub	w0, w1, w0
	str	w0, [x29,28]
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x0, [x0]
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	ldr	w2, [x29,28]
	bl	fprintf
	mov	w0, 1
	b	.L58
.L56:
	mov	w0, 0
.L58:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-28)"
	.section	.note.GNU-stack,"",%progbits
