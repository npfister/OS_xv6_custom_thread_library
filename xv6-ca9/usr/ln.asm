
_ln:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd008 	sub	sp, sp, #8
       c:	e50b0008 	str	r0, [fp, #-8]
      10:	e50b100c 	str	r1, [fp, #-12]
    if(argc != 3){
      14:	e51b3008 	ldr	r3, [fp, #-8]
      18:	e3530003 	cmp	r3, #3
      1c:	0a000004 	beq	34 <main+0x34>
        printf(2, "Usage: ln old new\n");
      20:	e3a00002 	mov	r0, #2
      24:	e30110fc 	movw	r1, #4348	; 0x10fc
      28:	e3401000 	movt	r1, #0
      2c:	eb00027c 	bl	a24 <printf>
        exit();
      30:	eb000163 	bl	5c4 <exit>
    }
    if(link(argv[1], argv[2]) < 0)
      34:	e51b300c 	ldr	r3, [fp, #-12]
      38:	e2833004 	add	r3, r3, #4
      3c:	e5932000 	ldr	r2, [r3]
      40:	e51b300c 	ldr	r3, [fp, #-12]
      44:	e2833008 	add	r3, r3, #8
      48:	e5933000 	ldr	r3, [r3]
      4c:	e1a00002 	mov	r0, r2
      50:	e1a01003 	mov	r1, r3
      54:	eb0001c6 	bl	774 <link>
      58:	e1a03000 	mov	r3, r0
      5c:	e3530000 	cmp	r3, #0
      60:	aa000009 	bge	8c <main+0x8c>
        printf(2, "link %s %s: failed\n", argv[1], argv[2]);
      64:	e51b300c 	ldr	r3, [fp, #-12]
      68:	e2833004 	add	r3, r3, #4
      6c:	e5932000 	ldr	r2, [r3]
      70:	e51b300c 	ldr	r3, [fp, #-12]
      74:	e2833008 	add	r3, r3, #8
      78:	e5933000 	ldr	r3, [r3]
      7c:	e3a00002 	mov	r0, #2
      80:	e3011110 	movw	r1, #4368	; 0x1110
      84:	e3401000 	movt	r1, #0
      88:	eb000265 	bl	a24 <printf>
    exit();
      8c:	eb00014c 	bl	5c4 <exit>

00000090 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
      90:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      94:	e28db000 	add	fp, sp, #0
      98:	e24dd014 	sub	sp, sp, #20
      9c:	e50b0010 	str	r0, [fp, #-16]
      a0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
      a4:	e51b3010 	ldr	r3, [fp, #-16]
      a8:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
      ac:	e1a00000 	nop			; (mov r0, r0)
      b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      b4:	e5d32000 	ldrb	r2, [r3]
      b8:	e51b3010 	ldr	r3, [fp, #-16]
      bc:	e5c32000 	strb	r2, [r3]
      c0:	e51b3010 	ldr	r3, [fp, #-16]
      c4:	e5d33000 	ldrb	r3, [r3]
      c8:	e3530000 	cmp	r3, #0
      cc:	03a03000 	moveq	r3, #0
      d0:	13a03001 	movne	r3, #1
      d4:	e6ef3073 	uxtb	r3, r3
      d8:	e51b2010 	ldr	r2, [fp, #-16]
      dc:	e2822001 	add	r2, r2, #1
      e0:	e50b2010 	str	r2, [fp, #-16]
      e4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      e8:	e2822001 	add	r2, r2, #1
      ec:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
      f0:	e3530000 	cmp	r3, #0
      f4:	1affffed 	bne	b0 <strcpy+0x20>
        ;
    return os;
      f8:	e51b3008 	ldr	r3, [fp, #-8]
}
      fc:	e1a00003 	mov	r0, r3
     100:	e28bd000 	add	sp, fp, #0
     104:	e8bd0800 	pop	{fp}
     108:	e12fff1e 	bx	lr

0000010c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     110:	e28db000 	add	fp, sp, #0
     114:	e24dd00c 	sub	sp, sp, #12
     118:	e50b0008 	str	r0, [fp, #-8]
     11c:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     120:	ea000005 	b	13c <strcmp+0x30>
        p++, q++;
     124:	e51b3008 	ldr	r3, [fp, #-8]
     128:	e2833001 	add	r3, r3, #1
     12c:	e50b3008 	str	r3, [fp, #-8]
     130:	e51b300c 	ldr	r3, [fp, #-12]
     134:	e2833001 	add	r3, r3, #1
     138:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     13c:	e51b3008 	ldr	r3, [fp, #-8]
     140:	e5d33000 	ldrb	r3, [r3]
     144:	e3530000 	cmp	r3, #0
     148:	0a000005 	beq	164 <strcmp+0x58>
     14c:	e51b3008 	ldr	r3, [fp, #-8]
     150:	e5d32000 	ldrb	r2, [r3]
     154:	e51b300c 	ldr	r3, [fp, #-12]
     158:	e5d33000 	ldrb	r3, [r3]
     15c:	e1520003 	cmp	r2, r3
     160:	0affffef 	beq	124 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     164:	e51b3008 	ldr	r3, [fp, #-8]
     168:	e5d33000 	ldrb	r3, [r3]
     16c:	e1a02003 	mov	r2, r3
     170:	e51b300c 	ldr	r3, [fp, #-12]
     174:	e5d33000 	ldrb	r3, [r3]
     178:	e0633002 	rsb	r3, r3, r2
}
     17c:	e1a00003 	mov	r0, r3
     180:	e28bd000 	add	sp, fp, #0
     184:	e8bd0800 	pop	{fp}
     188:	e12fff1e 	bx	lr

0000018c <strlen>:

uint
strlen(char *s)
{
     18c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     190:	e28db000 	add	fp, sp, #0
     194:	e24dd014 	sub	sp, sp, #20
     198:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     19c:	e3a03000 	mov	r3, #0
     1a0:	e50b3008 	str	r3, [fp, #-8]
     1a4:	ea000002 	b	1b4 <strlen+0x28>
     1a8:	e51b3008 	ldr	r3, [fp, #-8]
     1ac:	e2833001 	add	r3, r3, #1
     1b0:	e50b3008 	str	r3, [fp, #-8]
     1b4:	e51b3008 	ldr	r3, [fp, #-8]
     1b8:	e51b2010 	ldr	r2, [fp, #-16]
     1bc:	e0823003 	add	r3, r2, r3
     1c0:	e5d33000 	ldrb	r3, [r3]
     1c4:	e3530000 	cmp	r3, #0
     1c8:	1afffff6 	bne	1a8 <strlen+0x1c>
        ;
    return n;
     1cc:	e51b3008 	ldr	r3, [fp, #-8]
}
     1d0:	e1a00003 	mov	r0, r3
     1d4:	e28bd000 	add	sp, fp, #0
     1d8:	e8bd0800 	pop	{fp}
     1dc:	e12fff1e 	bx	lr

000001e0 <memset>:

void*
memset(void *dst, int v, uint n)
{
     1e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     1e4:	e28db000 	add	fp, sp, #0
     1e8:	e24dd024 	sub	sp, sp, #36	; 0x24
     1ec:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     1f0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     1f4:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     1f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     1fc:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     200:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     204:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     208:	e55b300d 	ldrb	r3, [fp, #-13]
     20c:	e1a02c03 	lsl	r2, r3, #24
     210:	e55b300d 	ldrb	r3, [fp, #-13]
     214:	e1a03803 	lsl	r3, r3, #16
     218:	e1822003 	orr	r2, r2, r3
     21c:	e55b300d 	ldrb	r3, [fp, #-13]
     220:	e1a03403 	lsl	r3, r3, #8
     224:	e1822003 	orr	r2, r2, r3
     228:	e55b300d 	ldrb	r3, [fp, #-13]
     22c:	e1823003 	orr	r3, r2, r3
     230:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     234:	ea000008 	b	25c <memset+0x7c>
		*p = c;
     238:	e51b3008 	ldr	r3, [fp, #-8]
     23c:	e55b200d 	ldrb	r2, [fp, #-13]
     240:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     244:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     248:	e2433001 	sub	r3, r3, #1
     24c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     250:	e51b3008 	ldr	r3, [fp, #-8]
     254:	e2833001 	add	r3, r3, #1
     258:	e50b3008 	str	r3, [fp, #-8]
     25c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     260:	e3530000 	cmp	r3, #0
     264:	0a000003 	beq	278 <memset+0x98>
     268:	e51b3008 	ldr	r3, [fp, #-8]
     26c:	e2033003 	and	r3, r3, #3
     270:	e3530000 	cmp	r3, #0
     274:	1affffef 	bne	238 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     278:	e51b3008 	ldr	r3, [fp, #-8]
     27c:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     280:	ea000008 	b	2a8 <memset+0xc8>
		*p4 = val;
     284:	e51b300c 	ldr	r3, [fp, #-12]
     288:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     28c:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     290:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     294:	e2433004 	sub	r3, r3, #4
     298:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     29c:	e51b300c 	ldr	r3, [fp, #-12]
     2a0:	e2833004 	add	r3, r3, #4
     2a4:	e50b300c 	str	r3, [fp, #-12]
     2a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2ac:	e3530003 	cmp	r3, #3
     2b0:	8afffff3 	bhi	284 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     2b4:	e51b300c 	ldr	r3, [fp, #-12]
     2b8:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     2bc:	ea000008 	b	2e4 <memset+0x104>
		*p = c;
     2c0:	e51b3008 	ldr	r3, [fp, #-8]
     2c4:	e55b200d 	ldrb	r2, [fp, #-13]
     2c8:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     2cc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2d0:	e2433001 	sub	r3, r3, #1
     2d4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     2d8:	e51b3008 	ldr	r3, [fp, #-8]
     2dc:	e2833001 	add	r3, r3, #1
     2e0:	e50b3008 	str	r3, [fp, #-8]
     2e4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2e8:	e3530000 	cmp	r3, #0
     2ec:	1afffff3 	bne	2c0 <memset+0xe0>
		*p = c;
	}

	return dst;
     2f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     2f4:	e1a00003 	mov	r0, r3
     2f8:	e28bd000 	add	sp, fp, #0
     2fc:	e8bd0800 	pop	{fp}
     300:	e12fff1e 	bx	lr

00000304 <strchr>:

char*
strchr(const char *s, char c)
{
     304:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     308:	e28db000 	add	fp, sp, #0
     30c:	e24dd00c 	sub	sp, sp, #12
     310:	e50b0008 	str	r0, [fp, #-8]
     314:	e1a03001 	mov	r3, r1
     318:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     31c:	ea000009 	b	348 <strchr+0x44>
        if(*s == c)
     320:	e51b3008 	ldr	r3, [fp, #-8]
     324:	e5d33000 	ldrb	r3, [r3]
     328:	e55b2009 	ldrb	r2, [fp, #-9]
     32c:	e1520003 	cmp	r2, r3
     330:	1a000001 	bne	33c <strchr+0x38>
            return (char*)s;
     334:	e51b3008 	ldr	r3, [fp, #-8]
     338:	ea000007 	b	35c <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     33c:	e51b3008 	ldr	r3, [fp, #-8]
     340:	e2833001 	add	r3, r3, #1
     344:	e50b3008 	str	r3, [fp, #-8]
     348:	e51b3008 	ldr	r3, [fp, #-8]
     34c:	e5d33000 	ldrb	r3, [r3]
     350:	e3530000 	cmp	r3, #0
     354:	1afffff1 	bne	320 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     358:	e3a03000 	mov	r3, #0
}
     35c:	e1a00003 	mov	r0, r3
     360:	e28bd000 	add	sp, fp, #0
     364:	e8bd0800 	pop	{fp}
     368:	e12fff1e 	bx	lr

0000036c <gets>:

char*
gets(char *buf, int max)
{
     36c:	e92d4800 	push	{fp, lr}
     370:	e28db004 	add	fp, sp, #4
     374:	e24dd018 	sub	sp, sp, #24
     378:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     37c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     380:	e3a03000 	mov	r3, #0
     384:	e50b3008 	str	r3, [fp, #-8]
     388:	ea000016 	b	3e8 <gets+0x7c>
        cc = read(0, &c, 1);
     38c:	e3a00000 	mov	r0, #0
     390:	e24b300d 	sub	r3, fp, #13
     394:	e1a01003 	mov	r1, r3
     398:	e3a02001 	mov	r2, #1
     39c:	eb0000a3 	bl	630 <read>
     3a0:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     3a4:	e51b300c 	ldr	r3, [fp, #-12]
     3a8:	e3530000 	cmp	r3, #0
     3ac:	da000013 	ble	400 <gets+0x94>
            break;
        buf[i++] = c;
     3b0:	e51b3008 	ldr	r3, [fp, #-8]
     3b4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     3b8:	e0823003 	add	r3, r2, r3
     3bc:	e55b200d 	ldrb	r2, [fp, #-13]
     3c0:	e5c32000 	strb	r2, [r3]
     3c4:	e51b3008 	ldr	r3, [fp, #-8]
     3c8:	e2833001 	add	r3, r3, #1
     3cc:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     3d0:	e55b300d 	ldrb	r3, [fp, #-13]
     3d4:	e353000a 	cmp	r3, #10
     3d8:	0a000009 	beq	404 <gets+0x98>
     3dc:	e55b300d 	ldrb	r3, [fp, #-13]
     3e0:	e353000d 	cmp	r3, #13
     3e4:	0a000006 	beq	404 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     3e8:	e51b3008 	ldr	r3, [fp, #-8]
     3ec:	e2832001 	add	r2, r3, #1
     3f0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     3f4:	e1520003 	cmp	r2, r3
     3f8:	baffffe3 	blt	38c <gets+0x20>
     3fc:	ea000000 	b	404 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     400:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     404:	e51b3008 	ldr	r3, [fp, #-8]
     408:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     40c:	e0823003 	add	r3, r2, r3
     410:	e3a02000 	mov	r2, #0
     414:	e5c32000 	strb	r2, [r3]
    return buf;
     418:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     41c:	e1a00003 	mov	r0, r3
     420:	e24bd004 	sub	sp, fp, #4
     424:	e8bd8800 	pop	{fp, pc}

00000428 <stat>:

int
stat(char *n, struct stat *st)
{
     428:	e92d4800 	push	{fp, lr}
     42c:	e28db004 	add	fp, sp, #4
     430:	e24dd010 	sub	sp, sp, #16
     434:	e50b0010 	str	r0, [fp, #-16]
     438:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     43c:	e51b0010 	ldr	r0, [fp, #-16]
     440:	e3a01000 	mov	r1, #0
     444:	eb0000a6 	bl	6e4 <open>
     448:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     44c:	e51b3008 	ldr	r3, [fp, #-8]
     450:	e3530000 	cmp	r3, #0
     454:	aa000001 	bge	460 <stat+0x38>
        return -1;
     458:	e3e03000 	mvn	r3, #0
     45c:	ea000006 	b	47c <stat+0x54>
    r = fstat(fd, st);
     460:	e51b0008 	ldr	r0, [fp, #-8]
     464:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     468:	eb0000b8 	bl	750 <fstat>
     46c:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     470:	e51b0008 	ldr	r0, [fp, #-8]
     474:	eb00007f 	bl	678 <close>
    return r;
     478:	e51b300c 	ldr	r3, [fp, #-12]
}
     47c:	e1a00003 	mov	r0, r3
     480:	e24bd004 	sub	sp, fp, #4
     484:	e8bd8800 	pop	{fp, pc}

00000488 <atoi>:

int
atoi(const char *s)
{
     488:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     48c:	e28db000 	add	fp, sp, #0
     490:	e24dd014 	sub	sp, sp, #20
     494:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     498:	e3a03000 	mov	r3, #0
     49c:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     4a0:	ea00000d 	b	4dc <atoi+0x54>
        n = n*10 + *s++ - '0';
     4a4:	e51b2008 	ldr	r2, [fp, #-8]
     4a8:	e1a03002 	mov	r3, r2
     4ac:	e1a03103 	lsl	r3, r3, #2
     4b0:	e0833002 	add	r3, r3, r2
     4b4:	e1a03083 	lsl	r3, r3, #1
     4b8:	e1a02003 	mov	r2, r3
     4bc:	e51b3010 	ldr	r3, [fp, #-16]
     4c0:	e5d33000 	ldrb	r3, [r3]
     4c4:	e0823003 	add	r3, r2, r3
     4c8:	e2433030 	sub	r3, r3, #48	; 0x30
     4cc:	e50b3008 	str	r3, [fp, #-8]
     4d0:	e51b3010 	ldr	r3, [fp, #-16]
     4d4:	e2833001 	add	r3, r3, #1
     4d8:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     4dc:	e51b3010 	ldr	r3, [fp, #-16]
     4e0:	e5d33000 	ldrb	r3, [r3]
     4e4:	e353002f 	cmp	r3, #47	; 0x2f
     4e8:	9a000003 	bls	4fc <atoi+0x74>
     4ec:	e51b3010 	ldr	r3, [fp, #-16]
     4f0:	e5d33000 	ldrb	r3, [r3]
     4f4:	e3530039 	cmp	r3, #57	; 0x39
     4f8:	9affffe9 	bls	4a4 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     4fc:	e51b3008 	ldr	r3, [fp, #-8]
}
     500:	e1a00003 	mov	r0, r3
     504:	e28bd000 	add	sp, fp, #0
     508:	e8bd0800 	pop	{fp}
     50c:	e12fff1e 	bx	lr

00000510 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     510:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     514:	e28db000 	add	fp, sp, #0
     518:	e24dd01c 	sub	sp, sp, #28
     51c:	e50b0010 	str	r0, [fp, #-16]
     520:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     524:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     528:	e51b3010 	ldr	r3, [fp, #-16]
     52c:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     530:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     534:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     538:	ea000009 	b	564 <memmove+0x54>
        *dst++ = *src++;
     53c:	e51b300c 	ldr	r3, [fp, #-12]
     540:	e5d32000 	ldrb	r2, [r3]
     544:	e51b3008 	ldr	r3, [fp, #-8]
     548:	e5c32000 	strb	r2, [r3]
     54c:	e51b3008 	ldr	r3, [fp, #-8]
     550:	e2833001 	add	r3, r3, #1
     554:	e50b3008 	str	r3, [fp, #-8]
     558:	e51b300c 	ldr	r3, [fp, #-12]
     55c:	e2833001 	add	r3, r3, #1
     560:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     564:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     568:	e3530000 	cmp	r3, #0
     56c:	d3a03000 	movle	r3, #0
     570:	c3a03001 	movgt	r3, #1
     574:	e6ef3073 	uxtb	r3, r3
     578:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     57c:	e2422001 	sub	r2, r2, #1
     580:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     584:	e3530000 	cmp	r3, #0
     588:	1affffeb 	bne	53c <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     58c:	e51b3010 	ldr	r3, [fp, #-16]
}
     590:	e1a00003 	mov	r0, r3
     594:	e28bd000 	add	sp, fp, #0
     598:	e8bd0800 	pop	{fp}
     59c:	e12fff1e 	bx	lr

000005a0 <fork>:
     5a0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5a4:	e1a04003 	mov	r4, r3
     5a8:	e1a03002 	mov	r3, r2
     5ac:	e1a02001 	mov	r2, r1
     5b0:	e1a01000 	mov	r1, r0
     5b4:	e3a00001 	mov	r0, #1
     5b8:	ef000000 	svc	0x00000000
     5bc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5c0:	e12fff1e 	bx	lr

000005c4 <exit>:
     5c4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5c8:	e1a04003 	mov	r4, r3
     5cc:	e1a03002 	mov	r3, r2
     5d0:	e1a02001 	mov	r2, r1
     5d4:	e1a01000 	mov	r1, r0
     5d8:	e3a00002 	mov	r0, #2
     5dc:	ef000000 	svc	0x00000000
     5e0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5e4:	e12fff1e 	bx	lr

000005e8 <wait>:
     5e8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5ec:	e1a04003 	mov	r4, r3
     5f0:	e1a03002 	mov	r3, r2
     5f4:	e1a02001 	mov	r2, r1
     5f8:	e1a01000 	mov	r1, r0
     5fc:	e3a00003 	mov	r0, #3
     600:	ef000000 	svc	0x00000000
     604:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     608:	e12fff1e 	bx	lr

0000060c <pipe>:
     60c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     610:	e1a04003 	mov	r4, r3
     614:	e1a03002 	mov	r3, r2
     618:	e1a02001 	mov	r2, r1
     61c:	e1a01000 	mov	r1, r0
     620:	e3a00004 	mov	r0, #4
     624:	ef000000 	svc	0x00000000
     628:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     62c:	e12fff1e 	bx	lr

00000630 <read>:
     630:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     634:	e1a04003 	mov	r4, r3
     638:	e1a03002 	mov	r3, r2
     63c:	e1a02001 	mov	r2, r1
     640:	e1a01000 	mov	r1, r0
     644:	e3a00005 	mov	r0, #5
     648:	ef000000 	svc	0x00000000
     64c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     650:	e12fff1e 	bx	lr

00000654 <write>:
     654:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     658:	e1a04003 	mov	r4, r3
     65c:	e1a03002 	mov	r3, r2
     660:	e1a02001 	mov	r2, r1
     664:	e1a01000 	mov	r1, r0
     668:	e3a00010 	mov	r0, #16
     66c:	ef000000 	svc	0x00000000
     670:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     674:	e12fff1e 	bx	lr

00000678 <close>:
     678:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     67c:	e1a04003 	mov	r4, r3
     680:	e1a03002 	mov	r3, r2
     684:	e1a02001 	mov	r2, r1
     688:	e1a01000 	mov	r1, r0
     68c:	e3a00015 	mov	r0, #21
     690:	ef000000 	svc	0x00000000
     694:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     698:	e12fff1e 	bx	lr

0000069c <kill>:
     69c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6a0:	e1a04003 	mov	r4, r3
     6a4:	e1a03002 	mov	r3, r2
     6a8:	e1a02001 	mov	r2, r1
     6ac:	e1a01000 	mov	r1, r0
     6b0:	e3a00006 	mov	r0, #6
     6b4:	ef000000 	svc	0x00000000
     6b8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6bc:	e12fff1e 	bx	lr

000006c0 <exec>:
     6c0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6c4:	e1a04003 	mov	r4, r3
     6c8:	e1a03002 	mov	r3, r2
     6cc:	e1a02001 	mov	r2, r1
     6d0:	e1a01000 	mov	r1, r0
     6d4:	e3a00007 	mov	r0, #7
     6d8:	ef000000 	svc	0x00000000
     6dc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6e0:	e12fff1e 	bx	lr

000006e4 <open>:
     6e4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6e8:	e1a04003 	mov	r4, r3
     6ec:	e1a03002 	mov	r3, r2
     6f0:	e1a02001 	mov	r2, r1
     6f4:	e1a01000 	mov	r1, r0
     6f8:	e3a0000f 	mov	r0, #15
     6fc:	ef000000 	svc	0x00000000
     700:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     704:	e12fff1e 	bx	lr

00000708 <mknod>:
     708:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     70c:	e1a04003 	mov	r4, r3
     710:	e1a03002 	mov	r3, r2
     714:	e1a02001 	mov	r2, r1
     718:	e1a01000 	mov	r1, r0
     71c:	e3a00011 	mov	r0, #17
     720:	ef000000 	svc	0x00000000
     724:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     728:	e12fff1e 	bx	lr

0000072c <unlink>:
     72c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     730:	e1a04003 	mov	r4, r3
     734:	e1a03002 	mov	r3, r2
     738:	e1a02001 	mov	r2, r1
     73c:	e1a01000 	mov	r1, r0
     740:	e3a00012 	mov	r0, #18
     744:	ef000000 	svc	0x00000000
     748:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     74c:	e12fff1e 	bx	lr

00000750 <fstat>:
     750:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     754:	e1a04003 	mov	r4, r3
     758:	e1a03002 	mov	r3, r2
     75c:	e1a02001 	mov	r2, r1
     760:	e1a01000 	mov	r1, r0
     764:	e3a00008 	mov	r0, #8
     768:	ef000000 	svc	0x00000000
     76c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     770:	e12fff1e 	bx	lr

00000774 <link>:
     774:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     778:	e1a04003 	mov	r4, r3
     77c:	e1a03002 	mov	r3, r2
     780:	e1a02001 	mov	r2, r1
     784:	e1a01000 	mov	r1, r0
     788:	e3a00013 	mov	r0, #19
     78c:	ef000000 	svc	0x00000000
     790:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     794:	e12fff1e 	bx	lr

00000798 <mkdir>:
     798:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     79c:	e1a04003 	mov	r4, r3
     7a0:	e1a03002 	mov	r3, r2
     7a4:	e1a02001 	mov	r2, r1
     7a8:	e1a01000 	mov	r1, r0
     7ac:	e3a00014 	mov	r0, #20
     7b0:	ef000000 	svc	0x00000000
     7b4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7b8:	e12fff1e 	bx	lr

000007bc <chdir>:
     7bc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7c0:	e1a04003 	mov	r4, r3
     7c4:	e1a03002 	mov	r3, r2
     7c8:	e1a02001 	mov	r2, r1
     7cc:	e1a01000 	mov	r1, r0
     7d0:	e3a00009 	mov	r0, #9
     7d4:	ef000000 	svc	0x00000000
     7d8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7dc:	e12fff1e 	bx	lr

000007e0 <dup>:
     7e0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7e4:	e1a04003 	mov	r4, r3
     7e8:	e1a03002 	mov	r3, r2
     7ec:	e1a02001 	mov	r2, r1
     7f0:	e1a01000 	mov	r1, r0
     7f4:	e3a0000a 	mov	r0, #10
     7f8:	ef000000 	svc	0x00000000
     7fc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     800:	e12fff1e 	bx	lr

00000804 <getpid>:
     804:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     808:	e1a04003 	mov	r4, r3
     80c:	e1a03002 	mov	r3, r2
     810:	e1a02001 	mov	r2, r1
     814:	e1a01000 	mov	r1, r0
     818:	e3a0000b 	mov	r0, #11
     81c:	ef000000 	svc	0x00000000
     820:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     824:	e12fff1e 	bx	lr

00000828 <sbrk>:
     828:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     82c:	e1a04003 	mov	r4, r3
     830:	e1a03002 	mov	r3, r2
     834:	e1a02001 	mov	r2, r1
     838:	e1a01000 	mov	r1, r0
     83c:	e3a0000c 	mov	r0, #12
     840:	ef000000 	svc	0x00000000
     844:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     848:	e12fff1e 	bx	lr

0000084c <sleep>:
     84c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     850:	e1a04003 	mov	r4, r3
     854:	e1a03002 	mov	r3, r2
     858:	e1a02001 	mov	r2, r1
     85c:	e1a01000 	mov	r1, r0
     860:	e3a0000d 	mov	r0, #13
     864:	ef000000 	svc	0x00000000
     868:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     86c:	e12fff1e 	bx	lr

00000870 <uptime>:
     870:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     874:	e1a04003 	mov	r4, r3
     878:	e1a03002 	mov	r3, r2
     87c:	e1a02001 	mov	r2, r1
     880:	e1a01000 	mov	r1, r0
     884:	e3a0000e 	mov	r0, #14
     888:	ef000000 	svc	0x00000000
     88c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     890:	e12fff1e 	bx	lr

00000894 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     894:	e92d4800 	push	{fp, lr}
     898:	e28db004 	add	fp, sp, #4
     89c:	e24dd008 	sub	sp, sp, #8
     8a0:	e50b0008 	str	r0, [fp, #-8]
     8a4:	e1a03001 	mov	r3, r1
     8a8:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     8ac:	e51b0008 	ldr	r0, [fp, #-8]
     8b0:	e24b3009 	sub	r3, fp, #9
     8b4:	e1a01003 	mov	r1, r3
     8b8:	e3a02001 	mov	r2, #1
     8bc:	ebffff64 	bl	654 <write>
}
     8c0:	e24bd004 	sub	sp, fp, #4
     8c4:	e8bd8800 	pop	{fp, pc}

000008c8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     8c8:	e92d4800 	push	{fp, lr}
     8cc:	e28db004 	add	fp, sp, #4
     8d0:	e24dd030 	sub	sp, sp, #48	; 0x30
     8d4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     8d8:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     8dc:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     8e0:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     8e4:	e3a03000 	mov	r3, #0
     8e8:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     8ec:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     8f0:	e3530000 	cmp	r3, #0
     8f4:	0a000008 	beq	91c <printint+0x54>
     8f8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     8fc:	e3530000 	cmp	r3, #0
     900:	aa000005 	bge	91c <printint+0x54>
        neg = 1;
     904:	e3a03001 	mov	r3, #1
     908:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     90c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     910:	e2633000 	rsb	r3, r3, #0
     914:	e50b3010 	str	r3, [fp, #-16]
     918:	ea000001 	b	924 <printint+0x5c>
    } else {
        x = xx;
     91c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     920:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     924:	e3a03000 	mov	r3, #0
     928:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     92c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     930:	e51b2010 	ldr	r2, [fp, #-16]
     934:	e1a00002 	mov	r0, r2
     938:	e1a01003 	mov	r1, r3
     93c:	eb0001e5 	bl	10d8 <__aeabi_uidivmod>
     940:	e1a03001 	mov	r3, r1
     944:	e1a02003 	mov	r2, r3
     948:	e301312c 	movw	r3, #4396	; 0x112c
     94c:	e3403000 	movt	r3, #0
     950:	e7d32002 	ldrb	r2, [r3, r2]
     954:	e3e0001b 	mvn	r0, #27
     958:	e51b3008 	ldr	r3, [fp, #-8]
     95c:	e24bc004 	sub	ip, fp, #4
     960:	e08c1003 	add	r1, ip, r3
     964:	e1a03000 	mov	r3, r0
     968:	e0813003 	add	r3, r1, r3
     96c:	e5c32000 	strb	r2, [r3]
     970:	e51b3008 	ldr	r3, [fp, #-8]
     974:	e2833001 	add	r3, r3, #1
     978:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     97c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     980:	e51b0010 	ldr	r0, [fp, #-16]
     984:	e1a01003 	mov	r1, r3
     988:	eb000195 	bl	fe4 <__aeabi_uidiv>
     98c:	e1a03000 	mov	r3, r0
     990:	e50b3010 	str	r3, [fp, #-16]
     994:	e51b3010 	ldr	r3, [fp, #-16]
     998:	e3530000 	cmp	r3, #0
     99c:	1affffe2 	bne	92c <printint+0x64>
    if(neg)
     9a0:	e51b300c 	ldr	r3, [fp, #-12]
     9a4:	e3530000 	cmp	r3, #0
     9a8:	0a000015 	beq	a04 <printint+0x13c>
        buf[i++] = '-';
     9ac:	e3e0101b 	mvn	r1, #27
     9b0:	e51b3008 	ldr	r3, [fp, #-8]
     9b4:	e24b0004 	sub	r0, fp, #4
     9b8:	e0802003 	add	r2, r0, r3
     9bc:	e1a03001 	mov	r3, r1
     9c0:	e0823003 	add	r3, r2, r3
     9c4:	e3a0202d 	mov	r2, #45	; 0x2d
     9c8:	e5c32000 	strb	r2, [r3]
     9cc:	e51b3008 	ldr	r3, [fp, #-8]
     9d0:	e2833001 	add	r3, r3, #1
     9d4:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     9d8:	ea000009 	b	a04 <printint+0x13c>
        putc(fd, buf[i]);
     9dc:	e3e0101b 	mvn	r1, #27
     9e0:	e51b3008 	ldr	r3, [fp, #-8]
     9e4:	e24bc004 	sub	ip, fp, #4
     9e8:	e08c2003 	add	r2, ip, r3
     9ec:	e1a03001 	mov	r3, r1
     9f0:	e0823003 	add	r3, r2, r3
     9f4:	e5d33000 	ldrb	r3, [r3]
     9f8:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     9fc:	e1a01003 	mov	r1, r3
     a00:	ebffffa3 	bl	894 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     a04:	e51b3008 	ldr	r3, [fp, #-8]
     a08:	e2433001 	sub	r3, r3, #1
     a0c:	e50b3008 	str	r3, [fp, #-8]
     a10:	e51b3008 	ldr	r3, [fp, #-8]
     a14:	e3530000 	cmp	r3, #0
     a18:	aaffffef 	bge	9dc <printint+0x114>
        putc(fd, buf[i]);
}
     a1c:	e24bd004 	sub	sp, fp, #4
     a20:	e8bd8800 	pop	{fp, pc}

00000a24 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     a24:	e92d000e 	push	{r1, r2, r3}
     a28:	e92d4800 	push	{fp, lr}
     a2c:	e28db004 	add	fp, sp, #4
     a30:	e24dd024 	sub	sp, sp, #36	; 0x24
     a34:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     a38:	e3a03000 	mov	r3, #0
     a3c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     a40:	e28b3008 	add	r3, fp, #8
     a44:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     a48:	e3a03000 	mov	r3, #0
     a4c:	e50b3010 	str	r3, [fp, #-16]
     a50:	ea000077 	b	c34 <printf+0x210>
        c = fmt[i] & 0xff;
     a54:	e59b2004 	ldr	r2, [fp, #4]
     a58:	e51b3010 	ldr	r3, [fp, #-16]
     a5c:	e0823003 	add	r3, r2, r3
     a60:	e5d33000 	ldrb	r3, [r3]
     a64:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     a68:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a6c:	e3530000 	cmp	r3, #0
     a70:	1a00000b 	bne	aa4 <printf+0x80>
            if(c == '%'){
     a74:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a78:	e3530025 	cmp	r3, #37	; 0x25
     a7c:	1a000002 	bne	a8c <printf+0x68>
                state = '%';
     a80:	e3a03025 	mov	r3, #37	; 0x25
     a84:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     a88:	ea000066 	b	c28 <printf+0x204>
            } else {
                putc(fd, c);
     a8c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a90:	e6ef3073 	uxtb	r3, r3
     a94:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     a98:	e1a01003 	mov	r1, r3
     a9c:	ebffff7c 	bl	894 <putc>
     aa0:	ea000060 	b	c28 <printf+0x204>
            }
        } else if(state == '%'){
     aa4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     aa8:	e3530025 	cmp	r3, #37	; 0x25
     aac:	1a00005d 	bne	c28 <printf+0x204>
            if(c == 'd'){
     ab0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ab4:	e3530064 	cmp	r3, #100	; 0x64
     ab8:	1a00000a 	bne	ae8 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     abc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ac0:	e5933000 	ldr	r3, [r3]
     ac4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ac8:	e1a01003 	mov	r1, r3
     acc:	e3a0200a 	mov	r2, #10
     ad0:	e3a03001 	mov	r3, #1
     ad4:	ebffff7b 	bl	8c8 <printint>
                ap++;
     ad8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     adc:	e2833004 	add	r3, r3, #4
     ae0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     ae4:	ea00004d 	b	c20 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     ae8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     aec:	e3530078 	cmp	r3, #120	; 0x78
     af0:	0a000002 	beq	b00 <printf+0xdc>
     af4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     af8:	e3530070 	cmp	r3, #112	; 0x70
     afc:	1a00000a 	bne	b2c <printf+0x108>
                printint(fd, *ap, 16, 0);
     b00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b04:	e5933000 	ldr	r3, [r3]
     b08:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b0c:	e1a01003 	mov	r1, r3
     b10:	e3a02010 	mov	r2, #16
     b14:	e3a03000 	mov	r3, #0
     b18:	ebffff6a 	bl	8c8 <printint>
                ap++;
     b1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b20:	e2833004 	add	r3, r3, #4
     b24:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b28:	ea00003c 	b	c20 <printf+0x1fc>
            } else if(c == 's'){
     b2c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b30:	e3530073 	cmp	r3, #115	; 0x73
     b34:	1a00001b 	bne	ba8 <printf+0x184>
                s = (char*)*ap;
     b38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b3c:	e5933000 	ldr	r3, [r3]
     b40:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     b44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b48:	e2833004 	add	r3, r3, #4
     b4c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     b50:	e51b300c 	ldr	r3, [fp, #-12]
     b54:	e3530000 	cmp	r3, #0
     b58:	1a00000c 	bne	b90 <printf+0x16c>
                    s = "(null)";
     b5c:	e3013124 	movw	r3, #4388	; 0x1124
     b60:	e3403000 	movt	r3, #0
     b64:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     b68:	ea000008 	b	b90 <printf+0x16c>
                    putc(fd, *s);
     b6c:	e51b300c 	ldr	r3, [fp, #-12]
     b70:	e5d33000 	ldrb	r3, [r3]
     b74:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b78:	e1a01003 	mov	r1, r3
     b7c:	ebffff44 	bl	894 <putc>
                    s++;
     b80:	e51b300c 	ldr	r3, [fp, #-12]
     b84:	e2833001 	add	r3, r3, #1
     b88:	e50b300c 	str	r3, [fp, #-12]
     b8c:	ea000000 	b	b94 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     b90:	e1a00000 	nop			; (mov r0, r0)
     b94:	e51b300c 	ldr	r3, [fp, #-12]
     b98:	e5d33000 	ldrb	r3, [r3]
     b9c:	e3530000 	cmp	r3, #0
     ba0:	1afffff1 	bne	b6c <printf+0x148>
     ba4:	ea00001d 	b	c20 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     ba8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bac:	e3530063 	cmp	r3, #99	; 0x63
     bb0:	1a000009 	bne	bdc <printf+0x1b8>
                putc(fd, *ap);
     bb4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bb8:	e5933000 	ldr	r3, [r3]
     bbc:	e6ef3073 	uxtb	r3, r3
     bc0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bc4:	e1a01003 	mov	r1, r3
     bc8:	ebffff31 	bl	894 <putc>
                ap++;
     bcc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bd0:	e2833004 	add	r3, r3, #4
     bd4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bd8:	ea000010 	b	c20 <printf+0x1fc>
            } else if(c == '%'){
     bdc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     be0:	e3530025 	cmp	r3, #37	; 0x25
     be4:	1a000005 	bne	c00 <printf+0x1dc>
                putc(fd, c);
     be8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bec:	e6ef3073 	uxtb	r3, r3
     bf0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bf4:	e1a01003 	mov	r1, r3
     bf8:	ebffff25 	bl	894 <putc>
     bfc:	ea000007 	b	c20 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     c00:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c04:	e3a01025 	mov	r1, #37	; 0x25
     c08:	ebffff21 	bl	894 <putc>
                putc(fd, c);
     c0c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c10:	e6ef3073 	uxtb	r3, r3
     c14:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c18:	e1a01003 	mov	r1, r3
     c1c:	ebffff1c 	bl	894 <putc>
            }
            state = 0;
     c20:	e3a03000 	mov	r3, #0
     c24:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     c28:	e51b3010 	ldr	r3, [fp, #-16]
     c2c:	e2833001 	add	r3, r3, #1
     c30:	e50b3010 	str	r3, [fp, #-16]
     c34:	e59b2004 	ldr	r2, [fp, #4]
     c38:	e51b3010 	ldr	r3, [fp, #-16]
     c3c:	e0823003 	add	r3, r2, r3
     c40:	e5d33000 	ldrb	r3, [r3]
     c44:	e3530000 	cmp	r3, #0
     c48:	1affff81 	bne	a54 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     c4c:	e24bd004 	sub	sp, fp, #4
     c50:	e8bd4800 	pop	{fp, lr}
     c54:	e28dd00c 	add	sp, sp, #12
     c58:	e12fff1e 	bx	lr

00000c5c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c5c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c60:	e28db000 	add	fp, sp, #0
     c64:	e24dd014 	sub	sp, sp, #20
     c68:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     c6c:	e51b3010 	ldr	r3, [fp, #-16]
     c70:	e2433008 	sub	r3, r3, #8
     c74:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c78:	e3013148 	movw	r3, #4424	; 0x1148
     c7c:	e3403000 	movt	r3, #0
     c80:	e5933000 	ldr	r3, [r3]
     c84:	e50b3008 	str	r3, [fp, #-8]
     c88:	ea000010 	b	cd0 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c8c:	e51b3008 	ldr	r3, [fp, #-8]
     c90:	e5932000 	ldr	r2, [r3]
     c94:	e51b3008 	ldr	r3, [fp, #-8]
     c98:	e1520003 	cmp	r2, r3
     c9c:	8a000008 	bhi	cc4 <free+0x68>
     ca0:	e51b200c 	ldr	r2, [fp, #-12]
     ca4:	e51b3008 	ldr	r3, [fp, #-8]
     ca8:	e1520003 	cmp	r2, r3
     cac:	8a000010 	bhi	cf4 <free+0x98>
     cb0:	e51b3008 	ldr	r3, [fp, #-8]
     cb4:	e5932000 	ldr	r2, [r3]
     cb8:	e51b300c 	ldr	r3, [fp, #-12]
     cbc:	e1520003 	cmp	r2, r3
     cc0:	8a00000b 	bhi	cf4 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     cc4:	e51b3008 	ldr	r3, [fp, #-8]
     cc8:	e5933000 	ldr	r3, [r3]
     ccc:	e50b3008 	str	r3, [fp, #-8]
     cd0:	e51b200c 	ldr	r2, [fp, #-12]
     cd4:	e51b3008 	ldr	r3, [fp, #-8]
     cd8:	e1520003 	cmp	r2, r3
     cdc:	9affffea 	bls	c8c <free+0x30>
     ce0:	e51b3008 	ldr	r3, [fp, #-8]
     ce4:	e5932000 	ldr	r2, [r3]
     ce8:	e51b300c 	ldr	r3, [fp, #-12]
     cec:	e1520003 	cmp	r2, r3
     cf0:	9affffe5 	bls	c8c <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     cf4:	e51b300c 	ldr	r3, [fp, #-12]
     cf8:	e5933004 	ldr	r3, [r3, #4]
     cfc:	e1a03183 	lsl	r3, r3, #3
     d00:	e51b200c 	ldr	r2, [fp, #-12]
     d04:	e0822003 	add	r2, r2, r3
     d08:	e51b3008 	ldr	r3, [fp, #-8]
     d0c:	e5933000 	ldr	r3, [r3]
     d10:	e1520003 	cmp	r2, r3
     d14:	1a00000d 	bne	d50 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     d18:	e51b300c 	ldr	r3, [fp, #-12]
     d1c:	e5932004 	ldr	r2, [r3, #4]
     d20:	e51b3008 	ldr	r3, [fp, #-8]
     d24:	e5933000 	ldr	r3, [r3]
     d28:	e5933004 	ldr	r3, [r3, #4]
     d2c:	e0822003 	add	r2, r2, r3
     d30:	e51b300c 	ldr	r3, [fp, #-12]
     d34:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     d38:	e51b3008 	ldr	r3, [fp, #-8]
     d3c:	e5933000 	ldr	r3, [r3]
     d40:	e5932000 	ldr	r2, [r3]
     d44:	e51b300c 	ldr	r3, [fp, #-12]
     d48:	e5832000 	str	r2, [r3]
     d4c:	ea000003 	b	d60 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     d50:	e51b3008 	ldr	r3, [fp, #-8]
     d54:	e5932000 	ldr	r2, [r3]
     d58:	e51b300c 	ldr	r3, [fp, #-12]
     d5c:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     d60:	e51b3008 	ldr	r3, [fp, #-8]
     d64:	e5933004 	ldr	r3, [r3, #4]
     d68:	e1a03183 	lsl	r3, r3, #3
     d6c:	e51b2008 	ldr	r2, [fp, #-8]
     d70:	e0822003 	add	r2, r2, r3
     d74:	e51b300c 	ldr	r3, [fp, #-12]
     d78:	e1520003 	cmp	r2, r3
     d7c:	1a00000b 	bne	db0 <free+0x154>
        p->s.size += bp->s.size;
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e5932004 	ldr	r2, [r3, #4]
     d88:	e51b300c 	ldr	r3, [fp, #-12]
     d8c:	e5933004 	ldr	r3, [r3, #4]
     d90:	e0822003 	add	r2, r2, r3
     d94:	e51b3008 	ldr	r3, [fp, #-8]
     d98:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     d9c:	e51b300c 	ldr	r3, [fp, #-12]
     da0:	e5932000 	ldr	r2, [r3]
     da4:	e51b3008 	ldr	r3, [fp, #-8]
     da8:	e5832000 	str	r2, [r3]
     dac:	ea000002 	b	dbc <free+0x160>
    } else
        p->s.ptr = bp;
     db0:	e51b3008 	ldr	r3, [fp, #-8]
     db4:	e51b200c 	ldr	r2, [fp, #-12]
     db8:	e5832000 	str	r2, [r3]
    freep = p;
     dbc:	e3013148 	movw	r3, #4424	; 0x1148
     dc0:	e3403000 	movt	r3, #0
     dc4:	e51b2008 	ldr	r2, [fp, #-8]
     dc8:	e5832000 	str	r2, [r3]
}
     dcc:	e28bd000 	add	sp, fp, #0
     dd0:	e8bd0800 	pop	{fp}
     dd4:	e12fff1e 	bx	lr

00000dd8 <morecore>:

static Header*
morecore(uint nu)
{
     dd8:	e92d4800 	push	{fp, lr}
     ddc:	e28db004 	add	fp, sp, #4
     de0:	e24dd010 	sub	sp, sp, #16
     de4:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     de8:	e51b2010 	ldr	r2, [fp, #-16]
     dec:	e3003fff 	movw	r3, #4095	; 0xfff
     df0:	e1520003 	cmp	r2, r3
     df4:	8a000001 	bhi	e00 <morecore+0x28>
        nu = 4096;
     df8:	e3a03a01 	mov	r3, #4096	; 0x1000
     dfc:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     e00:	e51b3010 	ldr	r3, [fp, #-16]
     e04:	e1a03183 	lsl	r3, r3, #3
     e08:	e1a00003 	mov	r0, r3
     e0c:	ebfffe85 	bl	828 <sbrk>
     e10:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     e14:	e51b3008 	ldr	r3, [fp, #-8]
     e18:	e3730001 	cmn	r3, #1
     e1c:	1a000001 	bne	e28 <morecore+0x50>
        return 0;
     e20:	e3a03000 	mov	r3, #0
     e24:	ea00000b 	b	e58 <morecore+0x80>
    hp = (Header*)p;
     e28:	e51b3008 	ldr	r3, [fp, #-8]
     e2c:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     e30:	e51b300c 	ldr	r3, [fp, #-12]
     e34:	e51b2010 	ldr	r2, [fp, #-16]
     e38:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     e3c:	e51b300c 	ldr	r3, [fp, #-12]
     e40:	e2833008 	add	r3, r3, #8
     e44:	e1a00003 	mov	r0, r3
     e48:	ebffff83 	bl	c5c <free>
    return freep;
     e4c:	e3013148 	movw	r3, #4424	; 0x1148
     e50:	e3403000 	movt	r3, #0
     e54:	e5933000 	ldr	r3, [r3]
}
     e58:	e1a00003 	mov	r0, r3
     e5c:	e24bd004 	sub	sp, fp, #4
     e60:	e8bd8800 	pop	{fp, pc}

00000e64 <malloc>:

void*
malloc(uint nbytes)
{
     e64:	e92d4800 	push	{fp, lr}
     e68:	e28db004 	add	fp, sp, #4
     e6c:	e24dd018 	sub	sp, sp, #24
     e70:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e78:	e2833007 	add	r3, r3, #7
     e7c:	e1a031a3 	lsr	r3, r3, #3
     e80:	e2833001 	add	r3, r3, #1
     e84:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     e88:	e3013148 	movw	r3, #4424	; 0x1148
     e8c:	e3403000 	movt	r3, #0
     e90:	e5933000 	ldr	r3, [r3]
     e94:	e50b300c 	str	r3, [fp, #-12]
     e98:	e51b300c 	ldr	r3, [fp, #-12]
     e9c:	e3530000 	cmp	r3, #0
     ea0:	1a000010 	bne	ee8 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     ea4:	e3013140 	movw	r3, #4416	; 0x1140
     ea8:	e3403000 	movt	r3, #0
     eac:	e50b300c 	str	r3, [fp, #-12]
     eb0:	e3013148 	movw	r3, #4424	; 0x1148
     eb4:	e3403000 	movt	r3, #0
     eb8:	e51b200c 	ldr	r2, [fp, #-12]
     ebc:	e5832000 	str	r2, [r3]
     ec0:	e3013148 	movw	r3, #4424	; 0x1148
     ec4:	e3403000 	movt	r3, #0
     ec8:	e5932000 	ldr	r2, [r3]
     ecc:	e3013140 	movw	r3, #4416	; 0x1140
     ed0:	e3403000 	movt	r3, #0
     ed4:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     ed8:	e3013140 	movw	r3, #4416	; 0x1140
     edc:	e3403000 	movt	r3, #0
     ee0:	e3a02000 	mov	r2, #0
     ee4:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     ee8:	e51b300c 	ldr	r3, [fp, #-12]
     eec:	e5933000 	ldr	r3, [r3]
     ef0:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     ef4:	e51b3008 	ldr	r3, [fp, #-8]
     ef8:	e5932004 	ldr	r2, [r3, #4]
     efc:	e51b3010 	ldr	r3, [fp, #-16]
     f00:	e1520003 	cmp	r2, r3
     f04:	3a00001f 	bcc	f88 <malloc+0x124>
            if(p->s.size == nunits)
     f08:	e51b3008 	ldr	r3, [fp, #-8]
     f0c:	e5932004 	ldr	r2, [r3, #4]
     f10:	e51b3010 	ldr	r3, [fp, #-16]
     f14:	e1520003 	cmp	r2, r3
     f18:	1a000004 	bne	f30 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     f1c:	e51b3008 	ldr	r3, [fp, #-8]
     f20:	e5932000 	ldr	r2, [r3]
     f24:	e51b300c 	ldr	r3, [fp, #-12]
     f28:	e5832000 	str	r2, [r3]
     f2c:	ea00000e 	b	f6c <malloc+0x108>
            else {
                p->s.size -= nunits;
     f30:	e51b3008 	ldr	r3, [fp, #-8]
     f34:	e5932004 	ldr	r2, [r3, #4]
     f38:	e51b3010 	ldr	r3, [fp, #-16]
     f3c:	e0632002 	rsb	r2, r3, r2
     f40:	e51b3008 	ldr	r3, [fp, #-8]
     f44:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     f48:	e51b3008 	ldr	r3, [fp, #-8]
     f4c:	e5933004 	ldr	r3, [r3, #4]
     f50:	e1a03183 	lsl	r3, r3, #3
     f54:	e51b2008 	ldr	r2, [fp, #-8]
     f58:	e0823003 	add	r3, r2, r3
     f5c:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     f60:	e51b3008 	ldr	r3, [fp, #-8]
     f64:	e51b2010 	ldr	r2, [fp, #-16]
     f68:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     f6c:	e3013148 	movw	r3, #4424	; 0x1148
     f70:	e3403000 	movt	r3, #0
     f74:	e51b200c 	ldr	r2, [fp, #-12]
     f78:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     f7c:	e51b3008 	ldr	r3, [fp, #-8]
     f80:	e2833008 	add	r3, r3, #8
     f84:	ea000013 	b	fd8 <malloc+0x174>
        }
        if(p == freep)
     f88:	e3013148 	movw	r3, #4424	; 0x1148
     f8c:	e3403000 	movt	r3, #0
     f90:	e5933000 	ldr	r3, [r3]
     f94:	e51b2008 	ldr	r2, [fp, #-8]
     f98:	e1520003 	cmp	r2, r3
     f9c:	1a000007 	bne	fc0 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     fa0:	e51b0010 	ldr	r0, [fp, #-16]
     fa4:	ebffff8b 	bl	dd8 <morecore>
     fa8:	e50b0008 	str	r0, [fp, #-8]
     fac:	e51b3008 	ldr	r3, [fp, #-8]
     fb0:	e3530000 	cmp	r3, #0
     fb4:	1a000001 	bne	fc0 <malloc+0x15c>
                return 0;
     fb8:	e3a03000 	mov	r3, #0
     fbc:	ea000005 	b	fd8 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fc0:	e51b3008 	ldr	r3, [fp, #-8]
     fc4:	e50b300c 	str	r3, [fp, #-12]
     fc8:	e51b3008 	ldr	r3, [fp, #-8]
     fcc:	e5933000 	ldr	r3, [r3]
     fd0:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
     fd4:	eaffffc6 	b	ef4 <malloc+0x90>
}
     fd8:	e1a00003 	mov	r0, r3
     fdc:	e24bd004 	sub	sp, fp, #4
     fe0:	e8bd8800 	pop	{fp, pc}

00000fe4 <__aeabi_uidiv>:
     fe4:	e2512001 	subs	r2, r1, #1
     fe8:	012fff1e 	bxeq	lr
     fec:	3a000036 	bcc	10cc <__aeabi_uidiv+0xe8>
     ff0:	e1500001 	cmp	r0, r1
     ff4:	9a000022 	bls	1084 <__aeabi_uidiv+0xa0>
     ff8:	e1110002 	tst	r1, r2
     ffc:	0a000023 	beq	1090 <__aeabi_uidiv+0xac>
    1000:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1004:	01a01181 	lsleq	r1, r1, #3
    1008:	03a03008 	moveq	r3, #8
    100c:	13a03001 	movne	r3, #1
    1010:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1014:	31510000 	cmpcc	r1, r0
    1018:	31a01201 	lslcc	r1, r1, #4
    101c:	31a03203 	lslcc	r3, r3, #4
    1020:	3afffffa 	bcc	1010 <__aeabi_uidiv+0x2c>
    1024:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1028:	31510000 	cmpcc	r1, r0
    102c:	31a01081 	lslcc	r1, r1, #1
    1030:	31a03083 	lslcc	r3, r3, #1
    1034:	3afffffa 	bcc	1024 <__aeabi_uidiv+0x40>
    1038:	e3a02000 	mov	r2, #0
    103c:	e1500001 	cmp	r0, r1
    1040:	20400001 	subcs	r0, r0, r1
    1044:	21822003 	orrcs	r2, r2, r3
    1048:	e15000a1 	cmp	r0, r1, lsr #1
    104c:	204000a1 	subcs	r0, r0, r1, lsr #1
    1050:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1054:	e1500121 	cmp	r0, r1, lsr #2
    1058:	20400121 	subcs	r0, r0, r1, lsr #2
    105c:	21822123 	orrcs	r2, r2, r3, lsr #2
    1060:	e15001a1 	cmp	r0, r1, lsr #3
    1064:	204001a1 	subcs	r0, r0, r1, lsr #3
    1068:	218221a3 	orrcs	r2, r2, r3, lsr #3
    106c:	e3500000 	cmp	r0, #0
    1070:	11b03223 	lsrsne	r3, r3, #4
    1074:	11a01221 	lsrne	r1, r1, #4
    1078:	1affffef 	bne	103c <__aeabi_uidiv+0x58>
    107c:	e1a00002 	mov	r0, r2
    1080:	e12fff1e 	bx	lr
    1084:	03a00001 	moveq	r0, #1
    1088:	13a00000 	movne	r0, #0
    108c:	e12fff1e 	bx	lr
    1090:	e3510801 	cmp	r1, #65536	; 0x10000
    1094:	21a01821 	lsrcs	r1, r1, #16
    1098:	23a02010 	movcs	r2, #16
    109c:	33a02000 	movcc	r2, #0
    10a0:	e3510c01 	cmp	r1, #256	; 0x100
    10a4:	21a01421 	lsrcs	r1, r1, #8
    10a8:	22822008 	addcs	r2, r2, #8
    10ac:	e3510010 	cmp	r1, #16
    10b0:	21a01221 	lsrcs	r1, r1, #4
    10b4:	22822004 	addcs	r2, r2, #4
    10b8:	e3510004 	cmp	r1, #4
    10bc:	82822003 	addhi	r2, r2, #3
    10c0:	908220a1 	addls	r2, r2, r1, lsr #1
    10c4:	e1a00230 	lsr	r0, r0, r2
    10c8:	e12fff1e 	bx	lr
    10cc:	e3500000 	cmp	r0, #0
    10d0:	13e00000 	mvnne	r0, #0
    10d4:	ea000007 	b	10f8 <__aeabi_idiv0>

000010d8 <__aeabi_uidivmod>:
    10d8:	e3510000 	cmp	r1, #0
    10dc:	0afffffa 	beq	10cc <__aeabi_uidiv+0xe8>
    10e0:	e92d4003 	push	{r0, r1, lr}
    10e4:	ebffffbe 	bl	fe4 <__aeabi_uidiv>
    10e8:	e8bd4006 	pop	{r1, r2, lr}
    10ec:	e0030092 	mul	r3, r2, r0
    10f0:	e0411003 	sub	r1, r1, r3
    10f4:	e12fff1e 	bx	lr

000010f8 <__aeabi_idiv0>:
    10f8:	e12fff1e 	bx	lr
