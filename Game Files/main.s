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
	.file	"main.c"
	.text
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, #67108864
	mov	r5, #128
	mov	r3, #0
	mov	r1, #1
	mov	r8, #15
	mov	r7, #60
	mov	ip, #32
	mov	lr, #45
	mov	r4, #1792
	mov	r6, #80
	mov	r10, #10
	mov	r9, #30
	ldr	fp, .L6
	strh	r5, [r0, #132]	@ movhi
	strh	fp, [r0, #130]	@ movhi
	ldrh	fp, [r0, #4]
	orr	fp, fp, #8
	strh	fp, [r0, #4]	@ movhi
	strh	r3, [r0, #128]	@ movhi
	add	r0, r0, #512
	ldrh	fp, [r0]
	orr	fp, fp, r1
	strh	fp, [r0]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	ldr	fp, .L6+4
	ldr	r0, .L6+8
	str	r0, [fp, #4092]
	ldr	r0, .L6+12
	str	r3, [r0]
	ldr	r0, .L6+16
	str	r1, [r0]
	ldr	r0, .L6+20
	str	r3, [r0]
	ldr	r0, .L6+24
	str	r3, [r0]
	ldr	r0, .L6+28
	str	r3, [r0]
	ldr	r0, .L6+32
	str	r3, [r0]
	ldr	r0, .L6+36
	str	r8, [r0, #44]
	ldr	r8, .L6+40
	str	r7, [r8]
	ldr	r7, .L6+44
	str	r3, [r0, #8]
	str	r3, [r0, #32]
	str	r3, [r0, #40]
	str	r3, [r0, #36]
	str	r3, [r0, #56]
	str	r1, [r0, #12]
	str	r1, [r0, #52]
	str	r10, [r0]
	str	r9, [r0, #4]
	str	lr, [r0, #16]
	str	lr, [r0, #48]
	str	r4, [r0, #20]
	str	ip, [r0, #24]
	str	ip, [r0, #28]
	str	r6, [r7]
	ldr	r6, .L6+48
	str	r3, [r0, #60]
	str	r3, [r0, #64]
	str	r3, [r0, #68]
	mov	r2, r3
	str	r3, [r6, #8]
	str	r3, [r6, #32]
	str	r3, [r6, #40]
	str	r3, [r6, #36]
	str	r3, [r6, #52]
	str	r3, [r6, #60]
	str	r3, [r6, #64]
	mov	r3, #178
	str	r3, [r6, #4]
	mvn	r3, #0
	str	r3, [r6, #12]
	mov	r3, #163
	str	r3, [r6, #44]
	mov	r3, #193
	ldr	r0, .L6+52
	str	r5, [r6]
	str	lr, [r6, #16]
	str	r4, [r6, #20]
	str	ip, [r6, #24]
	str	ip, [r6, #28]
	str	r1, [r6, #56]
	str	r1, [r6, #68]
	str	r3, [r6, #48]
	add	r3, r0, #480
.L2:
	str	r2, [r0, #40]
	add	r0, r0, #48
	cmp	r0, r3
	bne	.L2
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	-1266
	.word	50360320
	.word	interruptHandler
	.word	catState
	.word	catToggle
	.word	hOff
	.word	time
	.word	score
	.word	currentBird
	.word	leftCat
	.word	timeLeft
	.word	birdSpawnRate
	.word	rightCat
	.word	birds
	.size	init, .-init
	.align	2
	.global	initBird
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBird, %function
initBird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L22
	mov	r5, r0
	mov	lr, pc
	bx	r6
	mov	r2, #0
	mov	r1, #16
	ldr	r9, .L22+4
	smull	r10, fp, r0, r9
	asr	r3, r0, #31
	rsb	r3, r3, fp, asr #4
	add	r3, r3, r3, lsl #2
	lsl	r4, r5, #1
	add	ip, r4, r5
	ldr	r8, .L22+8
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	lsl	r0, ip, #4
	add	r7, r8, r0
	add	r3, r3, #55
	str	r1, [r7, #12]
	str	r1, [r7, #16]
	str	r2, [r7, #20]
	str	r2, [r7, #24]
	str	r2, [r7, #28]
	str	r3, [r8, r0]
	mov	lr, pc
	bx	r6
	smull	r10, fp, r0, r9
	asr	r3, r0, #31
	rsb	r3, r3, fp, asr #3
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	cmp	r3, #9
	movls	r3, #1
	strls	r3, [r7, #32]
	bhi	.L21
.L10:
	mov	r2, #1
	add	r3, r4, r5
	add	r3, r8, r3, lsl #4
	str	r2, [r3, #36]
.L16:
	mov	r3, #0
	add	r4, r4, r5
	add	r4, r8, r4, lsl #4
	add	r5, r5, #9
	str	r3, [r4, #40]
	str	r5, [r4, #44]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	cmp	r0, #0
	moveq	r3, #1
	mvnne	r3, #0
	mvneq	r2, #15
	movne	r2, #256
	stmib	r4, {r2, r3}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	sub	r2, r3, #10
	cmp	r2, #9
	movls	r3, #2
	strls	r3, [r7, #32]
	bls	.L12
	sub	r3, r3, #20
	cmp	r3, #4
	movls	r3, #3
	strls	r3, [r7, #32]
	bls	.L14
	ldr	r3, [r7, #32]
	cmp	r3, #1
	beq	.L10
	cmp	r3, #2
	beq	.L12
	cmp	r3, #3
	bne	.L16
.L14:
	mov	r2, #0
	add	r3, r4, r5
	add	r3, r8, r3, lsl #4
	str	r2, [r3, #36]
	b	.L16
.L12:
	mov	r2, #2
	add	r3, r4, r5
	add	r3, r8, r3, lsl #4
	str	r2, [r3, #36]
	b	.L16
.L23:
	.align	2
.L22:
	.word	rand
	.word	1374389535
	.word	birds
	.size	initBird, .-initBird
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L28
	add	r2, r3, #1024
.L25:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L25
	bx	lr
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	getDigit
	.syntax unified
	.arm
	.fpu softvfp
	.type	getDigit, %function
getDigit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r4, .L32
	mov	r0, r1
	mov	lr, pc
	bx	r4
	ldr	r6, .L32+4
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L32+8
	mov	lr, pc
	bx	r6
	mov	r6, r0
	mov	r7, r1
	mov	r0, r5
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r3, r7
	ldr	r4, .L32+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+20
	smull	r4, r5, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	__aeabi_i2d
	.word	pow
	.word	1076101120
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	1717986919
	.size	getDigit, .-getDigit
	.align	2
	.global	drawTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTimer, %function
drawTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #120
	mov	r5, #20
	ldr	r6, .L36
	ldr	r4, .L36+4
	ldr	r0, [r6]
	mov	r1, #0
	strh	r3, [r4, #18]	@ movhi
	strh	r5, [r4, #16]	@ movhi
	bl	getDigit
	mov	r3, #112
	add	r2, r0, #8
	mov	r1, #1
	ldr	r0, [r6]
	strh	r2, [r4, #20]	@ movhi
	strh	r5, [r4, #24]	@ movhi
	strh	r3, [r4, #26]	@ movhi
	bl	getDigit
	add	r0, r0, #8
	strh	r0, [r4, #28]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	timeLeft
	.word	shadowOAM
	.size	drawTimer, .-drawTimer
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #128
	mov	r6, #0
	mov	r8, #10
	ldr	r5, .L42
	ldr	r7, .L42+4
.L39:
	mov	r1, r6
	ldr	r0, [r7]
	strh	r4, [r5, #34]	@ movhi
	strh	r8, [r5, #32]	@ movhi
	bl	getDigit
	add	r6, r6, #1
	sub	r4, r4, #8
	add	r0, r0, #8
	lsl	r4, r4, #16
	cmp	r6, #4
	strh	r0, [r5, #36]	@ movhi
	lsr	r4, r4, #16
	add	r5, r5, #8
	bne	.L39
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	shadowOAM
	.word	score
	.size	drawScore, .-drawScore
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #512
	push	{r4, r5, r6, lr}
	ldr	r3, .L50
	add	r2, r3, #1024
.L45:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L45
	ldr	r4, .L50+4
	bl	drawTimer
	bl	drawScore
	ldr	r0, .L50+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L50+12
	mov	lr, pc
	bx	r4
	ldr	r4, .L50+16
	ldr	r6, .L50+20
	add	r5, r4, #480
.L46:
	mov	r0, r4
	add	r4, r4, #48
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L46
	ldr	r4, .L50+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L50
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	shadowOAM
	.word	drawCat
	.word	leftCat
	.word	rightCat
	.word	birds
	.word	drawBird
	.word	DMANow
	.size	draw, .-draw
	.align	2
	.global	startInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	startInstructions, %function
startInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L54
	ldr	r1, .L54+4
	ldr	r0, .L54+8
	ldr	r3, .L54+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	state
	.word	updateInstructions
	.word	instScreenBitmap
	.word	drawBackgroundImage3
	.size	startInstructions, .-startInstructions
	.align	2
	.global	setupSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L57
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L58:
	.align	2
.L57:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_dmul
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L61+8
	ldr	r2, [r2]
	ldr	r7, .L61+12
	mov	r8, r1
	mov	r9, r0
	mov	r10, r3
	str	r5, [r2, #20]
	mov	r1, r0
	ldr	r2, .L61+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L61+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #2]	@ movhi
	mov	r1, r6
	ldr	r3, .L61+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L61+28
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strh	r0, [r7]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	mov	r0, r8
	ldr	r7, .L61+32
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L61+36
	adr	r3, .L61
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L61+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L61+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L62:
	.align	3
.L61:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	startSplash
	.syntax unified
	.arm
	.fpu softvfp
	.type	startSplash, %function
startSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L66
	bl	init
	ldr	r5, [r4]
	cmp	r5, #0
	bne	.L64
	mov	r3, #1
	ldr	r2, .L66+4
	ldr	r1, .L66+8
	ldr	r0, .L66+12
	bl	playSoundA
	str	r5, [r4]
.L64:
	mov	lr, #0
	mov	r3, #67108864
	ldr	ip, .L66+16
	ldr	r1, .L66+20
	ldr	r0, .L66+24
	ldr	r2, .L66+28
	str	lr, [ip]
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	ldr	r0, .L66+32
	ldr	r3, .L66+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	fromInst
	.word	11025
	.word	377651
	.word	GameSong
	.word	splashState
	.word	state
	.word	updateSplash
	.word	1027
	.word	splashStartBitmap
	.word	drawBackgroundImage3
	.size	startSplash, .-startSplash
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	mov	r7, #67108864
	ldr	r6, .L71+8
	ldr	r4, .L71+12
	ldr	r5, .L71+16
.L69:
	ldr	r3, [r4]
	str	r3, [r6]
	ldr	r2, [r7, #304]
	ldr	r3, [r5]
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	b	.L69
.L72:
	.align	2
.L71:
	.word	init
	.word	startSplash
	.word	oldButtons
	.word	buttons
	.word	state
	.size	main, .-main
	.text
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L75+8
	ldr	r2, [r2]
	ldr	r7, .L75+12
	mov	r8, r1
	mov	r9, r0
	mov	r10, r3
	str	r5, [r2, #32]
	mov	r1, r0
	ldr	r2, .L75+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L75+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #6]	@ movhi
	mov	r1, r6
	ldr	r3, .L75+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L75+28
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strh	r0, [r7, #4]	@ movhi
	strh	r2, [r7, #6]	@ movhi
	mov	r0, r8
	ldr	r7, .L75+32
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L75+36
	adr	r3, .L75
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L75+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L75+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L76:
	.align	3
.L75:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	startPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	startPause, %function
startPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L79
	ldr	lr, .L79+4
	mov	r3, #0
	ldr	r2, .L79+8
	mov	r1, #692
	ldr	r0, .L79+12
	str	lr, [ip]
	bl	playSoundB
	mov	r2, #232
	ldr	ip, .L79+16
	ldr	lr, .L79+20
	ldr	r0, .L79+24
	strh	r2, [ip, #68]	@ movhi
	strh	r0, [ip, #64]	@ movhi
	strh	lr, [ip, #66]	@ movhi
	ldr	r4, .L79+28
	mov	r1, ip
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	state
	.word	updatePause
	.word	11025
	.word	CursorSFX
	.word	shadowOAM
	.word	-32664
	.word	16448
	.word	DMANow
	.size	startPause, .-startPause
	.align	2
	.global	updatePause
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L90
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L90+4
	ldr	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r2, .L90+8
	mov	r1, #692
	ldr	r0, .L90+12
	bl	playSoundB
	ldr	r3, .L90+16
	ldr	r2, .L90+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L91:
	.align	2
.L90:
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	CursorSFX
	.word	state
	.word	updateGame
	.size	updatePause, .-updatePause
	.align	2
	.global	startEnd
	.syntax unified
	.arm
	.fpu softvfp
	.type	startEnd, %function
startEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L97
	ldr	r6, .L97+4
	ldr	r0, [r4]
	ldr	r3, [r6]
	ldr	r2, .L97+8
	ldr	r1, .L97+12
	cmp	r3, r0
	str	r1, [r2]
	strgt	r3, [r4]
	ldr	r2, .L97+16
	mov	r3, #0
	ldr	r1, .L97+20
	sub	sp, sp, #32
	ldr	r0, .L97+24
	bl	playSoundB
	mov	r1, #512
	ldr	r3, .L97+28
	add	r2, r3, #1024
.L94:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L94
	mov	r3, #67108864
	ldr	r2, .L97+32
	ldr	r0, .L97+36
	strh	r2, [r3]	@ movhi
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	ldr	r5, .L97+44
	ldr	r3, [r6]
	mov	r0, sp
	ldr	r2, .L97+48
	ldr	r1, .L97+52
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	add	r0, sp, #16
	ldr	r2, .L97+48
	ldr	r1, .L97+52
	mov	lr, pc
	bx	r5
	ldr	r4, .L97+56
	mov	r2, sp
	mov	r3, #0
	mov	r1, #130
	mov	r0, #68
	mov	lr, pc
	bx	r4
	add	r2, sp, #16
	mov	r3, #0
	mov	r1, #130
	mov	r0, #88
	mov	lr, pc
	bx	r4
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	highScore
	.word	score
	.word	state
	.word	updateEnd
	.word	11025
	.word	15109
	.word	CatMeowSFX
	.word	shadowOAM
	.word	1027
	.word	endScreenBitmap
	.word	drawBackgroundImage3
	.word	sprintf
	.word	.LC0
	.word	.LC1
	.word	drawString
	.size	startEnd, .-startEnd
	.global	__aeabi_idivmod
	.align	2
	.global	updateTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTime, %function
updateTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L110
	ldr	r4, [r5]
	ldr	r3, .L110+4
	add	r4, r4, #1
	smull	r0, r1, r4, r3
	asr	r3, r4, #31
	ldr	r2, .L110+8
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #3
	ldr	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	cmp	r3, #0
	str	r4, [r5]
	beq	.L108
.L101:
	ldr	r3, .L110+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L110+16
	mov	r1, r0
	mov	r0, r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L110+20
	mov	r0, r1
	ldr	r1, [r3]
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	bne	.L99
	ldr	r4, .L110+24
	ldr	r0, [r4]
	ldr	r5, .L110+28
	add	r3, r0, r0, lsl #1
	add	r3, r5, r3, lsl #4
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L109
.L104:
	add	r0, r0, #1
	cmp	r0, #10
	moveq	r3, #0
	strne	r0, [r4]
	streq	r3, [r4]
.L99:
	pop	{r4, r5, r6, lr}
	bx	lr
.L108:
	bl	startEnd
	ldr	r4, [r5]
	b	.L101
.L109:
	bl	initBird
	mov	r3, #1
	ldr	r0, [r4]
	add	r2, r0, r0, lsl r3
	add	r5, r5, r2, lsl #4
	str	r3, [r5, #40]
	b	.L104
.L111:
	.align	2
.L110:
	.word	time
	.word	1717986919
	.word	timeLeft
	.word	rand
	.word	__aeabi_idivmod
	.word	birdSpawnRate
	.word	currentBird
	.word	birds
	.size	updateTime, .-updateTime
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bl	updateTime
	ldr	r3, .L137
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L131
	cmp	r3, #2
	beq	.L132
.L114:
	ldr	r5, .L137+4
	ldr	r8, .L137+8
	mov	r4, r5
	ldr	fp, .L137+12
	ldr	r9, .L137+16
	ldr	r10, .L137+20
	add	r7, r5, #480
	mov	r6, r5
	b	.L123
.L134:
	smull	r0, r1, r2, r8
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r2, r2, r3, lsl #2
	bne	.L116
	ldr	r3, [r4, #28]
	cmp	r3, #1
	movne	r3, #1
	streq	r2, [r4, #28]
	strne	r3, [r4, #28]
.L116:
	add	r4, r4, #48
	cmp	r4, r7
	beq	.L133
.L123:
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #40]
	add	r2, r2, #1
	cmp	r3, #0
	str	r2, [r4, #24]
	beq	.L116
	ldr	r5, [r4, #20]
	cmp	r5, #0
	beq	.L134
	cmp	r5, #1
	bne	.L116
	smull	r0, r1, r2, r8
	asr	ip, r2, #31
	rsb	r3, ip, r1, asr #2
	add	r3, r3, r3, lsl #2
	subs	lr, r2, r3, lsl #1
	bne	.L116
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L135
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r4, #28]
	beq	.L116
	cmp	r3, #2
	beq	.L136
	smull	r0, r1, r2, fp
	rsb	ip, ip, r1, asr #4
	add	ip, ip, ip, lsl #2
	add	ip, ip, ip, lsl #2
	cmp	r2, ip, lsl #1
	strne	lr, [r4, #40]
	add	r4, r4, #48
	cmp	r4, r7
	bne	.L123
.L133:
	mov	r5, r6
	ldr	r9, .L137+24
	ldr	r6, .L137+28
	ldr	r8, .L137+32
	ldr	r7, .L137+36
.L124:
	mov	r0, r5
	mov	lr, pc
	bx	r9
	mov	r1, r5
	mov	r0, r8
	mov	lr, pc
	bx	r6
	mov	r1, r5
	mov	r0, r7
	add	r5, r5, #48
	mov	lr, pc
	bx	r6
	cmp	r5, r4
	bne	.L124
	ldr	r1, .L137+40
	ldr	r3, [r1]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #8
	movge	r3, r2
	mov	r0, #67108864
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r1]
	strh	r3, [r0, #20]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L135:
	mov	r2, r9
	ldr	r1, .L137+44
	mov	r0, r10
	bl	playSoundB
	str	r5, [r4, #28]
	b	.L116
.L131:
	ldr	r1, .L137+36
	ldr	r0, .L137+32
	ldr	r3, .L137+48
	mov	lr, pc
	bx	r3
	b	.L114
.L136:
	mov	r3, #3
	ldr	r2, [r4, #32]
	cmp	r2, r3
	str	r3, [r4, #28]
	bne	.L116
	mov	r3, lr
	mov	r2, r9
	ldr	r1, .L137+52
	ldr	r0, .L137+56
	bl	playSoundB
	b	.L116
.L132:
	ldr	r1, .L137+36
	ldr	r0, .L137+32
	ldr	r3, .L137+60
	mov	lr, pc
	bx	r3
	b	.L114
.L138:
	.align	2
.L137:
	.word	catToggle
	.word	birds
	.word	1717986919
	.word	1374389535
	.word	11025
	.word	BirdSFX
	.word	updateBird
	.word	checkBirdCollision
	.word	leftCat
	.word	rightCat
	.word	hOff
	.word	5227
	.word	updateCats1
	.word	4667
	.word	TimeSFX
	.word	updateCats2
	.size	update, .-update
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L151
	bl	update
	bl	draw
	ldr	r3, .L151+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L140
	ldr	r2, .L151+8
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L150
.L140:
	tst	r3, #512
	beq	.L139
	ldr	r3, .L151+8
	ldr	r3, [r3]
	ands	r3, r3, #512
	bne	.L139
	ldr	r2, .L151+12
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r0, #1
	moveq	r1, #15
	movne	r0, #60
	ldreq	r3, .L151+16
	ldrne	r1, .L151+16
	streq	r0, [r2]
	streq	r1, [r3]
	strne	r3, [r2]
	strne	r0, [r1]
.L139:
	pop	{r4, lr}
	bx	lr
.L150:
	bl	startPause
	ldr	r3, [r4]
	b	.L140
.L152:
	.align	2
.L151:
	.word	oldButtons
	.word	waitForVblank
	.word	buttons
	.word	cheat
	.word	birdSpawnRate
	.size	updateGame, .-updateGame
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L172
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L167
	ldr	r0, .L172+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	push	{r4, lr}
	beq	.L156
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	ble	.L156
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L170
	ldr	r1, .L172+8
	ldr	r2, .L172+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L156:
	ldr	r0, .L172+16
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L160
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	ble	.L160
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L171
	ldr	r1, .L172+8
	ldr	r2, .L172+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L160:
	mov	r2, #1
	ldr	r3, .L172
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L172
	pop	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L167:
	mov	r2, #1
	ldr	r3, .L172
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L170:
	ldm	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L156
.L171:
	ldm	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L160
.L173:
	.align	2
.L172:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	updateInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L182
	ldr	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L182+4
	ldr	r3, [r3]
	ands	r3, r3, #1
	bxne	lr
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L182+8
	ldr	r2, .L182+12
	mov	r1, #692
	ldr	r0, .L182+16
	str	lr, [ip]
	bl	playSoundB
	pop	{r4, lr}
	b	startSplash
.L183:
	.align	2
.L182:
	.word	oldButtons
	.word	buttons
	.word	fromInst
	.word	11025
	.word	CursorSFX
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	updateEnd
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnd, %function
updateEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L192
	ldr	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L192+4
	ldr	r3, [r3]
	ands	r3, r3, #1
	bxne	lr
	push	{r4, lr}
	ldr	r2, .L192+8
	mov	r1, #692
	ldr	r0, .L192+12
	bl	playSoundB
	pop	{r4, lr}
	b	startSplash
.L193:
	.align	2
.L192:
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	CursorSFX
	.size	updateEnd, .-updateEnd
	.align	2
	.global	startGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	startGame, %function
startGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r1, .L196
	ldr	r3, .L196+4
	ldr	r2, .L196+8
	ldr	r4, .L196+12
	str	r5, [r1]
	str	r2, [r3]
	bl	init
	mov	r2, r4
	mov	r3, #1
	ldr	r1, .L196+16
	ldr	r0, .L196+20
	bl	playSoundA
	mov	r3, r5
	mov	r2, r4
	ldr	r1, .L196+24
	ldr	r0, .L196+28
	bl	playSoundB
	mov	r3, #67108864
	mov	r0, #7424
	mov	r1, #4864
	ldr	r2, .L196+32
	ldr	r4, .L196+36
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L196+40
	mov	r3, #256
	ldr	r2, .L196+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L196+48
	ldr	r1, .L196+52
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L196+56
	ldr	r3, .L196+60
	mov	lr, pc
	bx	r3
	mov	r3, #224
	ldr	r2, .L196+64
	ldr	r1, .L196+68
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L196+72
	ldr	r1, .L196+76
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2352
	mov	r2, #100663296
	ldr	r1, .L196+80
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L196+84
	ldr	r1, .L196+88
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L197:
	.align	2
.L196:
	.word	fromInst
	.word	state
	.word	updateGame
	.word	11025
	.word	688320
	.word	ParkSong
	.word	15109
	.word	CatMeowSFX
	.word	7684
	.word	DMANow
	.word	spritePal
	.word	83886592
	.word	100728832
	.word	spriteTiles
	.word	treesPal
	.word	loadPalette
	.word	100679680
	.word	bgTiles
	.word	100724736
	.word	bgMap
	.word	treesTiles
	.word	100722688
	.word	treesMap
	.size	startGame, .-startGame
	.align	2
	.global	updateSplash
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L220
	ldr	r2, [r4]
	tst	r2, #128
	beq	.L199
	ldr	r3, .L220+4
	ldr	r3, [r3]
	ands	r3, r3, #128
	beq	.L217
.L199:
	tst	r2, #64
	beq	.L201
	ldr	r3, .L220+4
	ldr	r3, [r3]
	ands	r5, r3, #64
	beq	.L218
.L201:
	tst	r2, #1
	beq	.L198
	ldr	r3, .L220+4
	ldr	r3, [r3]
	ands	r3, r3, #1
	bne	.L198
	ldr	r2, .L220+8
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L219
	ldr	r2, .L220+12
	mov	r1, #692
	ldr	r0, .L220+16
	bl	playSoundB
	ldr	r2, .L220+20
	ldr	r1, .L220+24
	ldr	r0, .L220+28
	ldr	r3, .L220+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
.L198:
	pop	{r4, r5, r6, lr}
	bx	lr
.L218:
	mov	r3, r5
	ldr	r2, .L220+12
	mov	r1, #692
	ldr	r0, .L220+16
	bl	playSoundB
	ldr	r3, .L220+8
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L202
.L216:
	ldr	r2, [r4]
	b	.L201
.L217:
	ldr	r2, .L220+12
	mov	r1, #692
	ldr	r0, .L220+16
	bl	playSoundB
	ldr	r3, .L220+8
	ldr	r2, [r3]
	cmp	r2, #1
	beq	.L215
	mov	r1, #1
	ldr	r0, .L220+36
	ldr	r2, .L220+32
	str	r1, [r3]
	mov	lr, pc
	bx	r2
.L215:
	ldr	r2, [r4]
	b	.L199
.L219:
	pop	{r4, r5, r6, lr}
	b	startGame
.L202:
	ldr	r0, .L220+40
	ldr	r2, .L220+32
	str	r5, [r3]
	mov	lr, pc
	bx	r2
	b	.L216
.L221:
	.align	2
.L220:
	.word	oldButtons
	.word	buttons
	.word	splashState
	.word	11025
	.word	CursorSFX
	.word	state
	.word	updateInstructions
	.word	instScreenBitmap
	.word	drawBackgroundImage3
	.word	splashInstBitmap
	.word	splashStartBitmap
	.size	updateSplash, .-updateSplash
	.align	2
	.global	pauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L223
	ldr	r0, .L223+4
	ldr	r1, .L223+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L224:
	.align	2
.L223:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L226
	ldr	ip, .L226+4
	ldr	r0, .L226+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L227:
	.align	2
.L226:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L229
	ldr	r2, .L229+4
	ldr	r1, [r1]
	ldr	ip, .L229+8
	ldr	r0, .L229+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L230:
	.align	2
.L229:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L233
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L233+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L233+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L234:
	.align	2
.L233:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	hOff,4,4
	.comm	fromInst,4,4
	.comm	cheat,4,4
	.comm	birdSpawnRate,4,4
	.comm	currentBird,4,4
	.comm	highScore,4,4
	.comm	time,4,4
	.comm	splashState,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	birds,480,4
	.comm	leftCat,72,4
	.comm	rightCat,72,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\000"
	.space	3
.LC1:
	.ascii	"%s%d\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
