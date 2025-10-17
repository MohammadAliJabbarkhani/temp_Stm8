   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  63                     .const:	section	.text
  64  0000               L6:
  65  0000 000003e8      	dc.l	1000
  66                     ; 4 void delay_ms(uint32_t ms) {
  67                     	scross	off
  68                     	switch	.text
  69  0000               _delay_ms:
  71  0000 5204          	subw	sp,#4
  72       00000004      OFST:	set	4
  75                     ; 6   for (i = 0; i < ms * 1000; i++) {
  77  0002 ae0000        	ldw	x,#0
  78  0005 1f03          	ldw	(OFST-1,sp),x
  79  0007 ae0000        	ldw	x,#0
  80  000a 1f01          	ldw	(OFST-3,sp),x
  83  000c 200a          	jra	L73
  84  000e               L33:
  85                     ; 7     _asm("nop");
  88  000e 9d            nop
  90                     ; 6   for (i = 0; i < ms * 1000; i++) {
  92  000f 96            	ldw	x,sp
  93  0010 1c0001        	addw	x,#OFST-3
  94  0013 a601          	ld	a,#1
  95  0015 cd0000        	call	c_lgadc
  98  0018               L73:
 101  0018 96            	ldw	x,sp
 102  0019 1c0007        	addw	x,#OFST+3
 103  001c cd0000        	call	c_ltor
 105  001f ae0000        	ldw	x,#L6
 106  0022 cd0000        	call	c_lmul
 108  0025 96            	ldw	x,sp
 109  0026 1c0001        	addw	x,#OFST-3
 110  0029 cd0000        	call	c_lcmp
 112  002c 22e0          	jrugt	L33
 113                     ; 9 }
 116  002e 5b04          	addw	sp,#4
 117  0030 81            	ret
 144                     ; 11 void main(void) {
 145                     	switch	.text
 146  0031               _main:
 150                     ; 13   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 152  0031 4f            	clr	a
 153  0032 cd0000        	call	_CLK_HSIPrescalerConfig
 155                     ; 16   GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 157  0035 4be0          	push	#224
 158  0037 4b01          	push	#1
 159  0039 ae500f        	ldw	x,#20495
 160  003c cd0000        	call	_GPIO_Init
 162  003f 85            	popw	x
 163  0040               L35:
 164                     ; 19     GPIO_WriteReverse(GPIOD, GPIO_PIN_0); // Toggle LED
 166  0040 4b01          	push	#1
 167  0042 ae500f        	ldw	x,#20495
 168  0045 cd0000        	call	_GPIO_WriteReverse
 170  0048 84            	pop	a
 171                     ; 20     delay_ms(500);
 173  0049 ae01f4        	ldw	x,#500
 174  004c 89            	pushw	x
 175  004d ae0000        	ldw	x,#0
 176  0050 89            	pushw	x
 177  0051 adad          	call	_delay_ms
 179  0053 5b04          	addw	sp,#4
 181  0055 20e9          	jra	L35
 194                     	xdef	_main
 195                     	xdef	_delay_ms
 196                     	xref	_CLK_HSIPrescalerConfig
 197                     	xref	_GPIO_WriteReverse
 198                     	xref	_GPIO_Init
 199                     	xref.b	c_x
 218                     	xref	c_lcmp
 219                     	xref	c_lmul
 220                     	xref	c_ltor
 221                     	xref	c_lgadc
 222                     	end
