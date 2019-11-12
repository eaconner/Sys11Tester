;-----------------------;
;	Williams System 11	;
;	6821 PIA Tester		;
;	Version 1.10		;
;	2019 Eric Conner	;
;	EricConner.net		;
;-----------------------;

sndSelOut:		.EQU	$2100
sndSelOut_C:	.EQU	$2101
solB:			.EQU	$2102
solB_C:			.EQU	$2103
solA:			.EQU	$2200
lampDrive:		.EQU	$2400
lampDrive_C:	.EQU	$2401
lampStrobe:		.EQU	$2402
lampStrobe_C:	.EQU	$2403
dispStrobe:		.EQU	$2800
dispStrobe_C:	.EQU	$2801
dispSeg:		.EQU	$2802
dispSeg_C:		.EQU	$2803
dispDataA:		.EQU	$2C00
dispDataA_C:	.EQU	$2C01
dispDataB:		.EQU	$2C02
dispDataB_C:	.EQU	$2C03
switchInput:	.EQU	$3000
switchInput_C:	.EQU	$3001
switchDrive:	.EQU	$3002
switchDrive_C:	.EQU	$3003
dispDataC:		.EQU	$3400
dispDataC_C:	.EQU	$3401
widgetIO:		.EQU	$3402
widgetIO_C:		.EQU	$3403


	.MSFIRST
	.ORG    $8000
info:
	.FILL   $10, $2D
	.TEXT   "-- WMS SYS 11 --"
	.TEXT   "6821 PIA Tester "
	.TEXT   "- Version 1.10 -"
	.TEXT   "2019 Eric Conner"
	.TEXT   " EricConner.net "
	.FILL   $10, $2D


init:
	LDAA	#$00	; Select PIA data direction register
	LDAB	#$FF	; Set all PIA bits to outputs (LOW = Input, HIGH = Output)
	STAA	sndSelOut_C
	STAB	sndSelOut
	STAA	solB_C
	STAB	solB
	STAA	lampDrive_C
	STAB	lampDrive
	STAA	lampStrobe_C
	STAB	lampStrobe
	STAA	dispStrobe_C
	STAB	dispStrobe
	STAA	dispSeg_C
	STAB	dispSeg
	STAA	dispDataA_C
	STAB	dispDataA
	STAA	dispDataB_C
	STAB	dispDataB
	STAA	switchInput_C
	STAB	switchInput
	STAA	switchDrive_C
	STAB	switchDrive
	STAA	dispDataC_C
	STAB	dispDataC
	STAA	widgetIO_C
	STAB	widgetIO
	JMP		setFF


setFF:
	LDAA	#$34	; Select PIA output register and CA2/CB2 = LOW
	LDAB    #$FF	; Output 0xFF to all PIAs and U28 latch
	STAB    solA
	STAA	sndSelOut_C
	STAB	sndSelOut
	STAA	solB_C
	STAB	solB
	STAA	lampDrive_C
	STAB	lampDrive
	STAA	lampStrobe_C
	STAB	lampStrobe
	STAA	dispStrobe_C
	STAB	dispStrobe
	STAA	dispSeg_C
	STAB	dispSeg
	STAA	dispDataA_C
	STAB	dispDataA
	STAA	dispDataB_C
	STAB	dispDataB
	STAA	switchInput_C
	STAB	switchInput
	STAA	switchDrive_C
	STAB	switchDrive
	STAA	dispDataC_C
	STAB	dispDataC
	STAA	widgetIO_C
	STAB	widgetIO
	JMP		delay1


set00:
	LDAA	#$3C	; Select PIA output register and CA2/CB2 = HIGH
	LDAB    #$00	; Output 0x00 to all PIAs and U28 latch
	STAB    solA
	STAA	sndSelOut_C
	STAB	sndSelOut
	STAA	solB_C
	STAB	solB
	STAA	lampDrive_C
	STAB	lampDrive
	STAA	lampStrobe_C
	STAB	lampStrobe
	STAA	dispStrobe_C
	STAB	dispStrobe
	STAA	dispSeg_C
	STAB	dispSeg
	STAA	dispDataA_C
	STAB	dispDataA
	STAA	dispDataB_C
	STAB	dispDataB
	STAA	switchInput_C
	STAB	switchInput
	STAA	switchDrive_C
	STAB	switchDrive
	STAA	dispDataC_C
	STAB	dispDataC
	STAA	widgetIO_C
	STAB	widgetIO
	JMP		delay2


delay1:
	LDAB	#$FF
loadA1:
	LDAA	#$FF
sutractA1:
	SUBA	#$01
	CMPA	#$00
	BGE		sutractB1
	JMP		sutractA1
sutractB1:
	SUBB	#$01
	CMPB	#$00
	BGE		returnDelay1
	JMP		loadA1
returnDelay1:
	JMP		set00


delay2:
	LDAB	#$FF
loadA2:
	LDAA	#$FF
sutractA2:
	SUBA	#$01
	CMPA	#$00
	BGE		sutractB2
	JMP		sutractA2
sutractB2:
	SUBB	#$01
	CMPB	#$00
	BGE		returnDelay2
	JMP		loadA2
returnDelay2:
	JMP		setFF


	.ORG	$FFFE
	.WORD	init
	.END
