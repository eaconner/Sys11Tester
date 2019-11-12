;-----------------------;
;	Williams System 11	;
;	6821 PIA Tester		;
;	Version 1.00		;
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
    .TEXT   "- Version 1.00 -"
    .TEXT   "2019 Eric Conner"
    .TEXT   " EricConner.net "
    .FILL   $10, $2D


main:
		LDAA	#$00			;	Select PIA data direction register (bit2 = LOW)
		STAA	sndSelOut_C
		STAA	solB_C
		STAA	lampDrive_C
		STAA	lampStrobe_C
		STAA	dispStrobe_C
		STAA	dispSeg_C
		STAA	dispDataA_C
		STAA	dispDataB_C
		STAA	switchInput_C
		STAA	switchDrive_C
		STAA	dispDataC_C
		STAA	widgetIO_C

		LDAA	#$FF			;	Set all PIA bits to outputs (LOW = Input, HIGH = Output)
		STAA	sndSelOut
		STAA	solB
		STAA	lampDrive
		STAA	lampStrobe
		STAA	dispStrobe
		STAA	dispSeg
		STAA	dispDataA
		STAA	dispDataB
		STAA	switchInput
		STAA	switchDrive
		STAA	dispDataC
		STAA	widgetIO
		JMP		setFF


setFF:
		LDAA	#$04			;	Select PIA output register (bit2 = HIGH)
		STAA	sndSelOut_C
		STAA	solB_C
		STAA	lampDrive_C
		STAA	lampStrobe_C
		STAA	dispStrobe_C
		STAA	dispSeg_C
		STAA	dispDataA_C
		STAA	dispDataB_C
		STAA	switchInput_C
		STAA	switchDrive_C
		STAA	dispDataC_C
		STAA	widgetIO_C
		
		LDAA    #$FF			;	Output 0xFF to all PIAs and U28 latch
		STAA    solA
		STAA	sndSelOut
		STAA	solB
		STAA	lampDrive
		STAA	lampStrobe
		STAA	dispStrobe
		STAA	dispSeg
		STAA	dispDataA
		STAA	dispDataB
		STAA	switchInput
		STAA	switchDrive
		STAA	dispDataC
		STAA	widgetIO

		LDAA	#$30			;	Select PIA output register (bit1 = HIGH, bit0 = HIGH)
		STAA	sndSelOut_C
		STAA	solB_C
		STAA	lampDrive_C
		STAA	lampStrobe_C
		STAA	dispStrobe_C
		STAA	dispSeg_C
		STAA	dispDataA_C
		STAA	dispDataB_C
		STAA	switchInput_C
		STAA	switchDrive_C
		STAA	dispDataC_C
		STAA	widgetIO_C

		JMP		delay1


set00:
		LDAA	#$04			;	Select PIA output register (bit2 = HIGH)
		STAA	sndSelOut_C
		STAA	solB_C
		STAA	lampDrive_C
		STAA	lampStrobe_C
		STAA	dispStrobe_C
		STAA	dispSeg_C
		STAA	dispDataA_C
		STAA	dispDataB_C
		STAA	switchInput_C
		STAA	switchDrive_C
		STAA	dispDataC_C
		STAA	widgetIO_C
		
		LDAA    #$00			;	Output 0x00 to all PIAs and U28 latch
		STAA    solA
		STAA	sndSelOut
		STAA	solB
		STAA	lampDrive
		STAA	lampStrobe
		STAA	dispStrobe
		STAA	dispSeg
		STAA	dispDataA
		STAA	dispDataB
		STAA	switchInput
		STAA	switchDrive
		STAA	dispDataC
		STAA	widgetIO

		LDAA	#$30			;	Select PIA output register (bit1 = HIGH, bit0 = HIGH)
		STAA	sndSelOut_C
		STAA	solB_C
		STAA	lampDrive_C
		STAA	lampStrobe_C
		STAA	dispStrobe_C
		STAA	dispSeg_C
		STAA	dispDataA_C
		STAA	dispDataB_C
		STAA	switchInput_C
		STAA	switchDrive_C
		STAA	dispDataC_C
		STAA	widgetIO_C

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
	.WORD	main
	.END
