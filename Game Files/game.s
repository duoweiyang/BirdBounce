	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	updateCats1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCats1, %function
updateCats1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #52]
	cmp	r3, #0
	push	{r4, r5, lr}
	beq	.L2
	mov	r3, #0
	mov	r2, #67108864
	ldr	ip, .L30
	str	r3, [r0, #32]
	str	r3, [ip]
	ldr	r3, [r2, #304]
	tst	r3, #32
	bne	.L4
	mov	lr, #3
	mvn	ip, #0
	ldr	r2, [r0, #40]
	ldr	r3, .L30+4
	add	r2, r2, #1
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
	str	r2, [r0, #40]
	str	lr, [r0, #32]
	str	ip, [r0, #12]
	bne	.L5
	ldr	r2, [r0, #36]
	cmp	r2, #2
	addle	r2, r2, #1
	strle	r2, [r0, #36]
	strgt	r3, [r0, #36]
.L5:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #44]
	cmp	r3, r2
	subge	r3, r3, #1
	strge	r3, [r0, #4]
.L4:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L9
	mov	ip, #1
	mov	lr, #3
	ldr	r2, [r0, #40]
	ldr	r3, .L30+4
	add	r2, r2, ip
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl ip
	str	r2, [r0, #40]
	str	lr, [r0, #32]
	str	ip, [r0, #12]
	bne	.L10
	ldr	r2, [r0, #36]
	cmp	r2, #2
	addle	r2, r2, ip
	strle	r2, [r0, #36]
	strgt	r3, [r0, #36]
.L10:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #48]
	cmp	r3, r2
	addle	r3, r3, #1
	strle	r3, [r0, #4]
.L9:
	ldr	r3, .L30+8
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L28
.L2:
	ldr	r3, [r0, #60]
	cmp	r3, #1
	beq	.L14
	ldr	r2, [r1, #64]
.L15:
	cmp	r2, #1
	beq	.L17
	pop	{r4, r5, lr}
	bx	lr
.L28:
	ldr	r3, .L30+12
	ldr	r3, [r3]
	ands	r3, r3, #1
	bne	.L2
	mov	ip, #1
	ldr	r2, [r0, #20]
	ldr	lr, .L30+16
	smull	r4, r5, r2, lr
	str	r3, [r0, #52]
	sub	r2, r5, r2, asr #31
	str	ip, [r0, #60]
	str	ip, [r0, #32]
	b	.L13
.L14:
	ldr	r2, [r0, #8]
.L13:
	ldr	ip, [r0, #16]
	ldr	r3, [r0]
	add	r2, r2, ip
	ldr	ip, [r0, #28]
	add	r3, r2, r3, lsl #8
	asr	r3, r3, #8
	rsb	ip, ip, #160
	cmp	r3, ip
	str	r2, [r0, #8]
	blt	.L29
	mov	r2, #0
	mov	lr, #1
	mov	r4, #2
	ldr	ip, [r1, #20]
	rsb	ip, ip, #0
	str	r2, [r0, #60]
	str	r2, [r0, #32]
	str	r2, [r0, #8]
	str	lr, [r0, #56]
	str	r2, [r1, #56]
	str	lr, [r1, #64]
	str	ip, [r1, #8]
	str	r4, [r1, #32]
	str	r3, [r0]
.L17:
	ldr	r2, [r1, #8]
	ldr	ip, [r1, #16]
	ldr	r3, [r1]
	add	r2, r2, ip
	add	r3, r2, r3, lsl #8
	asr	r3, r3, #8
	cmp	r3, #10
	str	r2, [r1, #8]
	bgt	.L19
	mov	ip, #1
	mov	r2, #0
	mov	lr, #2
	str	ip, [r1, #52]
	ldr	ip, .L30+20
	str	r2, [r1, #64]
	str	r2, [r1, #32]
	str	lr, [ip]
	str	r2, [r0, #8]
	str	r2, [r1, #8]
.L19:
	str	r3, [r1]
	pop	{r4, r5, lr}
	bx	lr
.L29:
	ldr	r2, [r1, #64]
	str	r3, [r0]
	b	.L15
.L31:
	.align	2
.L30:
	.word	birdsInJump
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	715827883
	.word	catToggle
	.size	updateCats1, .-updateCats1
	.align	2
	.global	updateCats2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCats2, %function
updateCats2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #52]
	cmp	r3, #0
	push	{r4, r5, lr}
	beq	.L33
	mov	r3, #0
	mov	r2, #67108864
	ldr	ip, .L60
	str	r3, [r1, #32]
	str	r3, [ip]
	ldr	r3, [r2, #304]
	tst	r3, #32
	bne	.L35
	mov	lr, #3
	mvn	ip, #0
	ldr	r2, [r1, #40]
	ldr	r3, .L60+4
	add	r2, r2, #1
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
	str	r2, [r1, #40]
	str	lr, [r1, #32]
	str	ip, [r1, #12]
	bne	.L36
	ldr	r2, [r1, #36]
	cmp	r2, #2
	addle	r2, r2, #1
	strle	r2, [r1, #36]
	strgt	r3, [r1, #36]
.L36:
	ldr	r3, [r1, #4]
	ldr	r2, [r1, #44]
	cmp	r3, r2
	subge	r3, r3, #1
	strge	r3, [r1, #4]
.L35:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L40
	mov	ip, #1
	mov	lr, #3
	ldr	r2, [r1, #40]
	ldr	r3, .L60+4
	add	r2, r2, ip
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl ip
	str	r2, [r1, #40]
	str	lr, [r1, #32]
	str	ip, [r1, #12]
	bne	.L41
	ldr	r2, [r1, #36]
	cmp	r2, #2
	addle	r2, r2, ip
	strle	r2, [r1, #36]
	strgt	r3, [r1, #36]
.L41:
	ldr	r3, [r1, #4]
	ldr	r2, [r1, #48]
	cmp	r3, r2
	addle	r3, r3, #1
	strle	r3, [r1, #4]
.L40:
	ldr	r3, .L60+8
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L58
.L33:
	ldr	r3, [r1, #60]
	cmp	r3, #1
	beq	.L45
	ldr	r2, [r0, #64]
.L46:
	cmp	r2, #1
	beq	.L48
	pop	{r4, r5, lr}
	bx	lr
.L58:
	ldr	r3, .L60+12
	ldr	r3, [r3]
	ands	r3, r3, #1
	bne	.L33
	mov	ip, #1
	ldr	r2, [r1, #20]
	ldr	lr, .L60+16
	smull	r4, r5, r2, lr
	str	r3, [r1, #52]
	sub	r2, r5, r2, asr #31
	str	ip, [r1, #60]
	str	ip, [r1, #32]
	b	.L44
.L45:
	ldr	r2, [r1, #8]
.L44:
	ldr	ip, [r1, #16]
	ldr	r3, [r1]
	add	r2, r2, ip
	ldr	ip, [r1, #28]
	add	r3, r2, r3, lsl #8
	asr	r3, r3, #8
	rsb	ip, ip, #160
	cmp	r3, ip
	str	r2, [r1, #8]
	blt	.L59
	mov	r2, #0
	mov	lr, #1
	mov	r4, #2
	ldr	ip, [r0, #20]
	rsb	ip, ip, #0
	str	r2, [r1, #60]
	str	r2, [r1, #32]
	str	r2, [r1, #8]
	str	lr, [r1, #56]
	str	r2, [r0, #56]
	str	lr, [r0, #64]
	str	ip, [r0, #8]
	str	r4, [r0, #32]
	str	r3, [r1]
.L48:
	ldr	r2, [r0, #8]
	ldr	ip, [r0, #16]
	ldr	r3, [r0]
	add	r2, r2, ip
	add	r3, r2, r3, lsl #8
	asr	r3, r3, #8
	cmp	r3, #10
	str	r2, [r0, #8]
	bgt	.L50
	mov	r2, #0
	mov	ip, #1
	ldr	lr, .L60+20
	str	r2, [r0, #64]
	str	r2, [r0, #32]
	str	r2, [r0, #8]
	str	ip, [r0, #52]
	str	ip, [lr]
	str	r2, [r1, #8]
.L50:
	str	r3, [r0]
	pop	{r4, r5, lr}
	bx	lr
.L59:
	ldr	r2, [r0, #64]
	str	r3, [r1]
	b	.L46
.L61:
	.align	2
.L60:
	.word	birdsInJump
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	715827883
	.word	catToggle
	.size	updateCats2, .-updateCats2
	.align	2
	.global	updateBird
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBird, %function
updateBird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #40]
	cmp	r3, #1
	bxne	lr
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxne	lr
	ldr	r3, [r0, #8]
	cmn	r3, #1
	ldr	r2, [r0, #4]
	beq	.L69
	cmp	r2, #240
	bgt	.L67
	ldr	r1, [r0, #32]
	cmp	r1, #3
	beq	.L70
	add	r3, r3, r2
	str	r3, [r0, #4]
	bx	lr
.L69:
	cmn	r2, #16
	blt	.L67
	ldr	r3, [r0, #32]
	cmp	r3, #3
	beq	.L71
	sub	r3, r2, #1
	str	r3, [r0, #4]
	bx	lr
.L67:
	mov	r3, #0
	str	r3, [r0, #40]
	bx	lr
.L70:
	ldr	r1, .L72
	ldr	r1, [r1]
	tst	r1, #1
	addeq	r3, r3, r3, lsl #1
	addeq	r3, r3, r2
	streq	r3, [r0, #4]
	bx	lr
.L71:
	ldr	r3, .L72
	ldr	r3, [r3]
	tst	r3, #1
	subeq	r3, r2, #3
	streq	r3, [r0, #4]
	bx	lr
.L73:
	.align	2
.L72:
	.word	time
	.size	updateBird, .-updateBird
	.align	2
	.global	drawCat
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCat, %function
drawCat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #68]
	ldr	r3, [r0]
	str	lr, [sp, #-4]!
	ldr	lr, .L93
	ldr	ip, [r0, #12]
	lsl	r2, r1, #3
	strh	r3, [lr, r2]	@ movhi
	ldrsh	r3, [r0, #4]
	cmn	ip, #1
	mvneq	r3, r3, lsl #17
	mvneq	r3, r3, lsr #17
	orrne	r3, r3, #36864
	add	ip, lr, r2
	cmp	r1, #0
	strh	r3, [ip, #2]	@ movhi
	ldr	r3, [r0, #32]
	bne	.L77
	cmp	r3, #0
	strheq	r1, [lr, #4]	@ movhi
	beq	.L74
	cmp	r3, #1
	moveq	r3, #128
	strheq	r3, [lr, #4]	@ movhi
	beq	.L74
	cmp	r3, #2
	moveq	r3, #256
	strheq	r3, [lr, #4]	@ movhi
	beq	.L74
	cmp	r3, #3
	beq	.L90
.L74:
	ldr	lr, [sp], #4
	bx	lr
.L77:
	cmp	r3, #0
	beq	.L91
	cmp	r3, #1
	moveq	r3, #132
	addeq	r2, lr, r2
	strheq	r3, [r2, #4]	@ movhi
	beq	.L74
	cmp	r3, #2
	moveq	r3, #260
	addeq	r2, lr, r2
	strheq	r3, [r2, #4]	@ movhi
	beq	.L74
	cmp	r3, #3
	bne	.L74
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L92
	cmp	r3, #2
	moveq	r3, #516
	movne	r3, #520
	add	r2, lr, r2
	strh	r3, [r2, #4]	@ movhi
	b	.L74
.L91:
	mov	r3, #4
	add	r2, lr, r2
	strh	r3, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L90:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r3, #384
	strheq	r3, [lr, #4]	@ movhi
	beq	.L74
	cmp	r3, #2
	moveq	r3, #388
	movne	r3, #392
	strh	r3, [lr, #4]	@ movhi
	b	.L74
.L92:
	mov	r3, #512
	add	r2, lr, r2
	strh	r3, [r2, #4]	@ movhi
	b	.L74
.L94:
	.align	2
.L93:
	.word	shadowOAM
	.size	drawCat, .-drawCat
	.align	2
	.global	drawBird
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBird, %function
drawBird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #40]
	cmp	r3, #1
	bxne	lr
	ldr	r2, [r0, #4]
	ldr	r1, [r0, #8]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	cmp	r1, #1
	mov	r1, r2
	ldr	r3, [r0, #44]
	ldr	ip, .L130
	lsl	r3, r3, #3
	push	{r4, lr}
	orreq	r1, r2, #16384
	orrne	r1, r1, #20480
	add	r4, ip, r3
	ldrb	lr, [r0]	@ zero_extendqisi2
	strh	r1, [r4, #2]	@ movhi
	ldr	r1, [r0, #20]
	cmp	r1, #0
	strh	lr, [ip, r3]	@ movhi
	bne	.L100
	ldr	r2, [r0, #32]
	cmp	r2, #1
	beq	.L122
	cmp	r2, #2
	beq	.L123
	cmp	r2, #3
	bne	.L95
	ldr	r2, [r0, #28]
	cmp	r2, #0
	moveq	r2, #168
	movne	r2, #170
	add	r3, ip, r3
	strh	r2, [r3, #4]	@ movhi
	b	.L95
.L100:
	cmp	r1, #1
	beq	.L124
.L95:
	pop	{r4, lr}
	bx	lr
.L124:
	ldr	r1, [r0, #32]
	cmp	r1, #1
	beq	.L125
	cmp	r1, #2
	beq	.L126
	cmp	r1, #3
	bne	.L95
	ldr	r1, [r0, #28]
	cmp	r1, #0
	beq	.L127
	cmp	r1, #1
	moveq	r2, #174
	addeq	r3, ip, r3
	strheq	r2, [r3, #4]	@ movhi
	beq	.L95
	cmp	r1, #2
	moveq	r2, #176
	movne	r1, #18
	addne	r2, r2, #4
	addne	r3, ip, r3
	addeq	r3, ip, r3
	orrne	r2, r2, #16384
	strheq	r2, [r3, #4]	@ movhi
	strhne	r2, [r3, #2]	@ movhi
	strhne	r1, [r3, #4]	@ movhi
	b	.L95
.L122:
	ldr	r2, [r0, #28]
	cmp	r2, #0
	moveq	r2, #40
	movne	r2, #42
	add	r3, ip, r3
	strh	r2, [r3, #4]	@ movhi
	b	.L95
.L125:
	ldr	r1, [r0, #28]
	cmp	r1, #0
	beq	.L128
	cmp	r1, #1
	moveq	r2, #46
	addeq	r3, ip, r3
	strheq	r2, [r3, #4]	@ movhi
	beq	.L95
	cmp	r1, #2
	moveq	r2, #48
	addeq	r3, ip, r3
	strheq	r2, [r3, #4]	@ movhi
	beq	.L95
.L114:
	ldr	r1, [r0, #36]
	add	lr, lr, #8
	add	r0, ip, r3
	add	r1, r1, #8
	add	r2, r2, #4
	strh	lr, [ip, r3]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	b	.L95
.L123:
	ldr	r2, [r0, #28]
	cmp	r2, #0
	moveq	r2, #104
	movne	r2, #106
	add	r3, ip, r3
	strh	r2, [r3, #4]	@ movhi
	b	.L95
.L126:
	ldr	r1, [r0, #28]
	cmp	r1, #0
	beq	.L129
	cmp	r1, #1
	moveq	r2, #110
	addeq	r3, ip, r3
	strheq	r2, [r3, #4]	@ movhi
	beq	.L95
	cmp	r1, #2
	moveq	r2, #112
	addeq	r3, ip, r3
	strheq	r2, [r3, #4]	@ movhi
	bne	.L114
	b	.L95
.L128:
	mov	r2, #44
	add	r3, ip, r3
	strh	r2, [r3, #4]	@ movhi
	b	.L95
.L129:
	mov	r2, #108
	add	r3, ip, r3
	strh	r2, [r3, #4]	@ movhi
	b	.L95
.L127:
	mov	r2, #172
	add	r3, ip, r3
	strh	r2, [r3, #4]	@ movhi
	b	.L95
.L131:
	.align	2
.L130:
	.word	shadowOAM
	.size	drawBird, .-drawBird
	.align	2
	.global	checkBirdCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBirdCollision, %function
checkBirdCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #40]
	cmp	r3, #0
	bxeq	lr
	ldr	ip, [r1, #20]
	cmp	ip, #0
	bxne	lr
	push	{r4, lr}
	ldr	r3, [r0, #4]
	ldr	lr, [r1, #4]
	ldr	r2, [r1, #12]
	add	r4, r3, #9
	add	r2, lr, r2
	cmp	r4, r2
	bge	.L132
	ldr	r2, [r0, #24]
	add	r3, r3, r2
	sub	r3, r3, #9
	cmp	lr, r3
	bge	.L132
	ldr	lr, [r1]
	ldr	r3, [r1, #16]
	ldr	r2, [r0]
	add	r3, lr, r3
	sub	r3, r3, #1
	add	r4, r2, #11
	cmp	r4, r3
	bge	.L132
	ldr	r3, [r0, #28]
	add	r2, r2, r3
	sub	r2, r2, #11
	add	lr, lr, #5
	cmp	r2, lr
	ble	.L132
	mov	lr, #1
	ldr	r2, .L142
	ldr	r0, [r1, #32]
	ldr	r3, [r2]
	cmp	r0, #3
	add	r4, r3, lr
	mulne	r3, r0, r4
	str	r4, [r2]
	ldrne	r0, .L142+4
	ldreq	r2, .L142+8
	ldrne	r2, [r0]
	ldreq	r3, [r2]
	addne	r2, r2, r3
	addeq	r3, r3, #5
	str	ip, [r1, #28]
	str	lr, [r1, #20]
	streq	r3, [r2]
	strne	r3, [r1, #36]
	strne	r2, [r0]
.L132:
	pop	{r4, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	birdsInJump
	.word	score
	.word	timeLeft
	.size	checkBirdCollision, .-checkBirdCollision
	.comm	time,4,4
	.comm	timeLeft,4,4
	.comm	birdsInJump,4,4
	.comm	score,4,4
	.comm	catToggle,4,4
	.comm	catState,4,4
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	birds,480,4
	.comm	leftCat,72,4
	.comm	rightCat,72,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
