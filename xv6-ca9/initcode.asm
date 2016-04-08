
build/initcode.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <start>:
   0:	e59f1024 	ldr	r1, [pc, #36]	; 2c <argv+0x8>
   4:	e59f2024 	ldr	r2, [pc, #36]	; 30 <argv+0xc>
   8:	e3a00007 	mov	r0, #7
   c:	ef000000 	svc	0x00000000

00000010 <exit>:
  10:	e3a00002 	mov	r0, #2
  14:	ef000000 	svc	0x00000000
  18:	eafffffc 	b	10 <exit>

0000001c <init>:
  1c:	696e692f 	.word	0x696e692f
  20:	0074      	.short	0x0074
	...

00000024 <argv>:
  24:	0000001c 	andeq	r0, r0, ip, lsl r0
  28:	00000000 	andeq	r0, r0, r0
  2c:	0000001c 	andeq	r0, r0, ip, lsl r0
  30:	00000024 	andeq	r0, r0, r4, lsr #32
