
_test:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int
main(void)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
	kthread_create();
       8:	eb000205 	bl	824 <kthread_create>
	printf(1,"hello world\n");
       c:	e3a00001 	mov	r0, #1
      10:	e30110b0 	movw	r1, #4272	; 0x10b0
      14:	e3401000 	movt	r1, #0
      18:	eb00026e 	bl	9d8 <printf>
	exit();
      1c:	eb00014c 	bl	554 <exit>

00000020 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
      20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      24:	e28db000 	add	fp, sp, #0
      28:	e24dd014 	sub	sp, sp, #20
      2c:	e50b0010 	str	r0, [fp, #-16]
      30:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
      34:	e51b3010 	ldr	r3, [fp, #-16]
      38:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
      3c:	e1a00000 	nop			; (mov r0, r0)
      40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      44:	e5d32000 	ldrb	r2, [r3]
      48:	e51b3010 	ldr	r3, [fp, #-16]
      4c:	e5c32000 	strb	r2, [r3]
      50:	e51b3010 	ldr	r3, [fp, #-16]
      54:	e5d33000 	ldrb	r3, [r3]
      58:	e3530000 	cmp	r3, #0
      5c:	03a03000 	moveq	r3, #0
      60:	13a03001 	movne	r3, #1
      64:	e6ef3073 	uxtb	r3, r3
      68:	e51b2010 	ldr	r2, [fp, #-16]
      6c:	e2822001 	add	r2, r2, #1
      70:	e50b2010 	str	r2, [fp, #-16]
      74:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      78:	e2822001 	add	r2, r2, #1
      7c:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
      80:	e3530000 	cmp	r3, #0
      84:	1affffed 	bne	40 <strcpy+0x20>
        ;
    return os;
      88:	e51b3008 	ldr	r3, [fp, #-8]
}
      8c:	e1a00003 	mov	r0, r3
      90:	e28bd000 	add	sp, fp, #0
      94:	e8bd0800 	pop	{fp}
      98:	e12fff1e 	bx	lr

0000009c <strcmp>:

int
strcmp(const char *p, const char *q)
{
      9c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      a0:	e28db000 	add	fp, sp, #0
      a4:	e24dd00c 	sub	sp, sp, #12
      a8:	e50b0008 	str	r0, [fp, #-8]
      ac:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
      b0:	ea000005 	b	cc <strcmp+0x30>
        p++, q++;
      b4:	e51b3008 	ldr	r3, [fp, #-8]
      b8:	e2833001 	add	r3, r3, #1
      bc:	e50b3008 	str	r3, [fp, #-8]
      c0:	e51b300c 	ldr	r3, [fp, #-12]
      c4:	e2833001 	add	r3, r3, #1
      c8:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
      cc:	e51b3008 	ldr	r3, [fp, #-8]
      d0:	e5d33000 	ldrb	r3, [r3]
      d4:	e3530000 	cmp	r3, #0
      d8:	0a000005 	beq	f4 <strcmp+0x58>
      dc:	e51b3008 	ldr	r3, [fp, #-8]
      e0:	e5d32000 	ldrb	r2, [r3]
      e4:	e51b300c 	ldr	r3, [fp, #-12]
      e8:	e5d33000 	ldrb	r3, [r3]
      ec:	e1520003 	cmp	r2, r3
      f0:	0affffef 	beq	b4 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
      f4:	e51b3008 	ldr	r3, [fp, #-8]
      f8:	e5d33000 	ldrb	r3, [r3]
      fc:	e1a02003 	mov	r2, r3
     100:	e51b300c 	ldr	r3, [fp, #-12]
     104:	e5d33000 	ldrb	r3, [r3]
     108:	e0633002 	rsb	r3, r3, r2
}
     10c:	e1a00003 	mov	r0, r3
     110:	e28bd000 	add	sp, fp, #0
     114:	e8bd0800 	pop	{fp}
     118:	e12fff1e 	bx	lr

0000011c <strlen>:

uint
strlen(char *s)
{
     11c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     120:	e28db000 	add	fp, sp, #0
     124:	e24dd014 	sub	sp, sp, #20
     128:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     12c:	e3a03000 	mov	r3, #0
     130:	e50b3008 	str	r3, [fp, #-8]
     134:	ea000002 	b	144 <strlen+0x28>
     138:	e51b3008 	ldr	r3, [fp, #-8]
     13c:	e2833001 	add	r3, r3, #1
     140:	e50b3008 	str	r3, [fp, #-8]
     144:	e51b3008 	ldr	r3, [fp, #-8]
     148:	e51b2010 	ldr	r2, [fp, #-16]
     14c:	e0823003 	add	r3, r2, r3
     150:	e5d33000 	ldrb	r3, [r3]
     154:	e3530000 	cmp	r3, #0
     158:	1afffff6 	bne	138 <strlen+0x1c>
        ;
    return n;
     15c:	e51b3008 	ldr	r3, [fp, #-8]
}
     160:	e1a00003 	mov	r0, r3
     164:	e28bd000 	add	sp, fp, #0
     168:	e8bd0800 	pop	{fp}
     16c:	e12fff1e 	bx	lr

00000170 <memset>:

void*
memset(void *dst, int v, uint n)
{
     170:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     174:	e28db000 	add	fp, sp, #0
     178:	e24dd024 	sub	sp, sp, #36	; 0x24
     17c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     180:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     184:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     188:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     18c:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     190:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     194:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     198:	e55b300d 	ldrb	r3, [fp, #-13]
     19c:	e1a02c03 	lsl	r2, r3, #24
     1a0:	e55b300d 	ldrb	r3, [fp, #-13]
     1a4:	e1a03803 	lsl	r3, r3, #16
     1a8:	e1822003 	orr	r2, r2, r3
     1ac:	e55b300d 	ldrb	r3, [fp, #-13]
     1b0:	e1a03403 	lsl	r3, r3, #8
     1b4:	e1822003 	orr	r2, r2, r3
     1b8:	e55b300d 	ldrb	r3, [fp, #-13]
     1bc:	e1823003 	orr	r3, r2, r3
     1c0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     1c4:	ea000008 	b	1ec <memset+0x7c>
		*p = c;
     1c8:	e51b3008 	ldr	r3, [fp, #-8]
     1cc:	e55b200d 	ldrb	r2, [fp, #-13]
     1d0:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     1d4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     1d8:	e2433001 	sub	r3, r3, #1
     1dc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     1e0:	e51b3008 	ldr	r3, [fp, #-8]
     1e4:	e2833001 	add	r3, r3, #1
     1e8:	e50b3008 	str	r3, [fp, #-8]
     1ec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     1f0:	e3530000 	cmp	r3, #0
     1f4:	0a000003 	beq	208 <memset+0x98>
     1f8:	e51b3008 	ldr	r3, [fp, #-8]
     1fc:	e2033003 	and	r3, r3, #3
     200:	e3530000 	cmp	r3, #0
     204:	1affffef 	bne	1c8 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     208:	e51b3008 	ldr	r3, [fp, #-8]
     20c:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     210:	ea000008 	b	238 <memset+0xc8>
		*p4 = val;
     214:	e51b300c 	ldr	r3, [fp, #-12]
     218:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     21c:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     220:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     224:	e2433004 	sub	r3, r3, #4
     228:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     22c:	e51b300c 	ldr	r3, [fp, #-12]
     230:	e2833004 	add	r3, r3, #4
     234:	e50b300c 	str	r3, [fp, #-12]
     238:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     23c:	e3530003 	cmp	r3, #3
     240:	8afffff3 	bhi	214 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     244:	e51b300c 	ldr	r3, [fp, #-12]
     248:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     24c:	ea000008 	b	274 <memset+0x104>
		*p = c;
     250:	e51b3008 	ldr	r3, [fp, #-8]
     254:	e55b200d 	ldrb	r2, [fp, #-13]
     258:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     25c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     260:	e2433001 	sub	r3, r3, #1
     264:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     268:	e51b3008 	ldr	r3, [fp, #-8]
     26c:	e2833001 	add	r3, r3, #1
     270:	e50b3008 	str	r3, [fp, #-8]
     274:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     278:	e3530000 	cmp	r3, #0
     27c:	1afffff3 	bne	250 <memset+0xe0>
		*p = c;
	}

	return dst;
     280:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     284:	e1a00003 	mov	r0, r3
     288:	e28bd000 	add	sp, fp, #0
     28c:	e8bd0800 	pop	{fp}
     290:	e12fff1e 	bx	lr

00000294 <strchr>:

char*
strchr(const char *s, char c)
{
     294:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     298:	e28db000 	add	fp, sp, #0
     29c:	e24dd00c 	sub	sp, sp, #12
     2a0:	e50b0008 	str	r0, [fp, #-8]
     2a4:	e1a03001 	mov	r3, r1
     2a8:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     2ac:	ea000009 	b	2d8 <strchr+0x44>
        if(*s == c)
     2b0:	e51b3008 	ldr	r3, [fp, #-8]
     2b4:	e5d33000 	ldrb	r3, [r3]
     2b8:	e55b2009 	ldrb	r2, [fp, #-9]
     2bc:	e1520003 	cmp	r2, r3
     2c0:	1a000001 	bne	2cc <strchr+0x38>
            return (char*)s;
     2c4:	e51b3008 	ldr	r3, [fp, #-8]
     2c8:	ea000007 	b	2ec <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     2cc:	e51b3008 	ldr	r3, [fp, #-8]
     2d0:	e2833001 	add	r3, r3, #1
     2d4:	e50b3008 	str	r3, [fp, #-8]
     2d8:	e51b3008 	ldr	r3, [fp, #-8]
     2dc:	e5d33000 	ldrb	r3, [r3]
     2e0:	e3530000 	cmp	r3, #0
     2e4:	1afffff1 	bne	2b0 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     2e8:	e3a03000 	mov	r3, #0
}
     2ec:	e1a00003 	mov	r0, r3
     2f0:	e28bd000 	add	sp, fp, #0
     2f4:	e8bd0800 	pop	{fp}
     2f8:	e12fff1e 	bx	lr

000002fc <gets>:

char*
gets(char *buf, int max)
{
     2fc:	e92d4800 	push	{fp, lr}
     300:	e28db004 	add	fp, sp, #4
     304:	e24dd018 	sub	sp, sp, #24
     308:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     30c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     310:	e3a03000 	mov	r3, #0
     314:	e50b3008 	str	r3, [fp, #-8]
     318:	ea000016 	b	378 <gets+0x7c>
        cc = read(0, &c, 1);
     31c:	e3a00000 	mov	r0, #0
     320:	e24b300d 	sub	r3, fp, #13
     324:	e1a01003 	mov	r1, r3
     328:	e3a02001 	mov	r2, #1
     32c:	eb0000a3 	bl	5c0 <read>
     330:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     334:	e51b300c 	ldr	r3, [fp, #-12]
     338:	e3530000 	cmp	r3, #0
     33c:	da000013 	ble	390 <gets+0x94>
            break;
        buf[i++] = c;
     340:	e51b3008 	ldr	r3, [fp, #-8]
     344:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     348:	e0823003 	add	r3, r2, r3
     34c:	e55b200d 	ldrb	r2, [fp, #-13]
     350:	e5c32000 	strb	r2, [r3]
     354:	e51b3008 	ldr	r3, [fp, #-8]
     358:	e2833001 	add	r3, r3, #1
     35c:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     360:	e55b300d 	ldrb	r3, [fp, #-13]
     364:	e353000a 	cmp	r3, #10
     368:	0a000009 	beq	394 <gets+0x98>
     36c:	e55b300d 	ldrb	r3, [fp, #-13]
     370:	e353000d 	cmp	r3, #13
     374:	0a000006 	beq	394 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     378:	e51b3008 	ldr	r3, [fp, #-8]
     37c:	e2832001 	add	r2, r3, #1
     380:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     384:	e1520003 	cmp	r2, r3
     388:	baffffe3 	blt	31c <gets+0x20>
     38c:	ea000000 	b	394 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     390:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     394:	e51b3008 	ldr	r3, [fp, #-8]
     398:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     39c:	e0823003 	add	r3, r2, r3
     3a0:	e3a02000 	mov	r2, #0
     3a4:	e5c32000 	strb	r2, [r3]
    return buf;
     3a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     3ac:	e1a00003 	mov	r0, r3
     3b0:	e24bd004 	sub	sp, fp, #4
     3b4:	e8bd8800 	pop	{fp, pc}

000003b8 <stat>:

int
stat(char *n, struct stat *st)
{
     3b8:	e92d4800 	push	{fp, lr}
     3bc:	e28db004 	add	fp, sp, #4
     3c0:	e24dd010 	sub	sp, sp, #16
     3c4:	e50b0010 	str	r0, [fp, #-16]
     3c8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     3cc:	e51b0010 	ldr	r0, [fp, #-16]
     3d0:	e3a01000 	mov	r1, #0
     3d4:	eb0000a6 	bl	674 <open>
     3d8:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     3dc:	e51b3008 	ldr	r3, [fp, #-8]
     3e0:	e3530000 	cmp	r3, #0
     3e4:	aa000001 	bge	3f0 <stat+0x38>
        return -1;
     3e8:	e3e03000 	mvn	r3, #0
     3ec:	ea000006 	b	40c <stat+0x54>
    r = fstat(fd, st);
     3f0:	e51b0008 	ldr	r0, [fp, #-8]
     3f4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     3f8:	eb0000b8 	bl	6e0 <fstat>
     3fc:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     400:	e51b0008 	ldr	r0, [fp, #-8]
     404:	eb00007f 	bl	608 <close>
    return r;
     408:	e51b300c 	ldr	r3, [fp, #-12]
}
     40c:	e1a00003 	mov	r0, r3
     410:	e24bd004 	sub	sp, fp, #4
     414:	e8bd8800 	pop	{fp, pc}

00000418 <atoi>:

int
atoi(const char *s)
{
     418:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     41c:	e28db000 	add	fp, sp, #0
     420:	e24dd014 	sub	sp, sp, #20
     424:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     428:	e3a03000 	mov	r3, #0
     42c:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     430:	ea00000d 	b	46c <atoi+0x54>
        n = n*10 + *s++ - '0';
     434:	e51b2008 	ldr	r2, [fp, #-8]
     438:	e1a03002 	mov	r3, r2
     43c:	e1a03103 	lsl	r3, r3, #2
     440:	e0833002 	add	r3, r3, r2
     444:	e1a03083 	lsl	r3, r3, #1
     448:	e1a02003 	mov	r2, r3
     44c:	e51b3010 	ldr	r3, [fp, #-16]
     450:	e5d33000 	ldrb	r3, [r3]
     454:	e0823003 	add	r3, r2, r3
     458:	e2433030 	sub	r3, r3, #48	; 0x30
     45c:	e50b3008 	str	r3, [fp, #-8]
     460:	e51b3010 	ldr	r3, [fp, #-16]
     464:	e2833001 	add	r3, r3, #1
     468:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     46c:	e51b3010 	ldr	r3, [fp, #-16]
     470:	e5d33000 	ldrb	r3, [r3]
     474:	e353002f 	cmp	r3, #47	; 0x2f
     478:	9a000003 	bls	48c <atoi+0x74>
     47c:	e51b3010 	ldr	r3, [fp, #-16]
     480:	e5d33000 	ldrb	r3, [r3]
     484:	e3530039 	cmp	r3, #57	; 0x39
     488:	9affffe9 	bls	434 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     48c:	e51b3008 	ldr	r3, [fp, #-8]
}
     490:	e1a00003 	mov	r0, r3
     494:	e28bd000 	add	sp, fp, #0
     498:	e8bd0800 	pop	{fp}
     49c:	e12fff1e 	bx	lr

000004a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     4a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4a4:	e28db000 	add	fp, sp, #0
     4a8:	e24dd01c 	sub	sp, sp, #28
     4ac:	e50b0010 	str	r0, [fp, #-16]
     4b0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     4b4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     4b8:	e51b3010 	ldr	r3, [fp, #-16]
     4bc:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     4c0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     4c4:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     4c8:	ea000009 	b	4f4 <memmove+0x54>
        *dst++ = *src++;
     4cc:	e51b300c 	ldr	r3, [fp, #-12]
     4d0:	e5d32000 	ldrb	r2, [r3]
     4d4:	e51b3008 	ldr	r3, [fp, #-8]
     4d8:	e5c32000 	strb	r2, [r3]
     4dc:	e51b3008 	ldr	r3, [fp, #-8]
     4e0:	e2833001 	add	r3, r3, #1
     4e4:	e50b3008 	str	r3, [fp, #-8]
     4e8:	e51b300c 	ldr	r3, [fp, #-12]
     4ec:	e2833001 	add	r3, r3, #1
     4f0:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     4f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     4f8:	e3530000 	cmp	r3, #0
     4fc:	d3a03000 	movle	r3, #0
     500:	c3a03001 	movgt	r3, #1
     504:	e6ef3073 	uxtb	r3, r3
     508:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     50c:	e2422001 	sub	r2, r2, #1
     510:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     514:	e3530000 	cmp	r3, #0
     518:	1affffeb 	bne	4cc <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     51c:	e51b3010 	ldr	r3, [fp, #-16]
}
     520:	e1a00003 	mov	r0, r3
     524:	e28bd000 	add	sp, fp, #0
     528:	e8bd0800 	pop	{fp}
     52c:	e12fff1e 	bx	lr

00000530 <fork>:
     530:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     534:	e1a04003 	mov	r4, r3
     538:	e1a03002 	mov	r3, r2
     53c:	e1a02001 	mov	r2, r1
     540:	e1a01000 	mov	r1, r0
     544:	e3a00001 	mov	r0, #1
     548:	ef000000 	svc	0x00000000
     54c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     550:	e12fff1e 	bx	lr

00000554 <exit>:
     554:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     558:	e1a04003 	mov	r4, r3
     55c:	e1a03002 	mov	r3, r2
     560:	e1a02001 	mov	r2, r1
     564:	e1a01000 	mov	r1, r0
     568:	e3a00002 	mov	r0, #2
     56c:	ef000000 	svc	0x00000000
     570:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     574:	e12fff1e 	bx	lr

00000578 <wait>:
     578:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     57c:	e1a04003 	mov	r4, r3
     580:	e1a03002 	mov	r3, r2
     584:	e1a02001 	mov	r2, r1
     588:	e1a01000 	mov	r1, r0
     58c:	e3a00003 	mov	r0, #3
     590:	ef000000 	svc	0x00000000
     594:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     598:	e12fff1e 	bx	lr

0000059c <pipe>:
     59c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5a0:	e1a04003 	mov	r4, r3
     5a4:	e1a03002 	mov	r3, r2
     5a8:	e1a02001 	mov	r2, r1
     5ac:	e1a01000 	mov	r1, r0
     5b0:	e3a00004 	mov	r0, #4
     5b4:	ef000000 	svc	0x00000000
     5b8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5bc:	e12fff1e 	bx	lr

000005c0 <read>:
     5c0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5c4:	e1a04003 	mov	r4, r3
     5c8:	e1a03002 	mov	r3, r2
     5cc:	e1a02001 	mov	r2, r1
     5d0:	e1a01000 	mov	r1, r0
     5d4:	e3a00005 	mov	r0, #5
     5d8:	ef000000 	svc	0x00000000
     5dc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5e0:	e12fff1e 	bx	lr

000005e4 <write>:
     5e4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5e8:	e1a04003 	mov	r4, r3
     5ec:	e1a03002 	mov	r3, r2
     5f0:	e1a02001 	mov	r2, r1
     5f4:	e1a01000 	mov	r1, r0
     5f8:	e3a00010 	mov	r0, #16
     5fc:	ef000000 	svc	0x00000000
     600:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     604:	e12fff1e 	bx	lr

00000608 <close>:
     608:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     60c:	e1a04003 	mov	r4, r3
     610:	e1a03002 	mov	r3, r2
     614:	e1a02001 	mov	r2, r1
     618:	e1a01000 	mov	r1, r0
     61c:	e3a00015 	mov	r0, #21
     620:	ef000000 	svc	0x00000000
     624:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     628:	e12fff1e 	bx	lr

0000062c <kill>:
     62c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     630:	e1a04003 	mov	r4, r3
     634:	e1a03002 	mov	r3, r2
     638:	e1a02001 	mov	r2, r1
     63c:	e1a01000 	mov	r1, r0
     640:	e3a00006 	mov	r0, #6
     644:	ef000000 	svc	0x00000000
     648:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     64c:	e12fff1e 	bx	lr

00000650 <exec>:
     650:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     654:	e1a04003 	mov	r4, r3
     658:	e1a03002 	mov	r3, r2
     65c:	e1a02001 	mov	r2, r1
     660:	e1a01000 	mov	r1, r0
     664:	e3a00007 	mov	r0, #7
     668:	ef000000 	svc	0x00000000
     66c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     670:	e12fff1e 	bx	lr

00000674 <open>:
     674:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     678:	e1a04003 	mov	r4, r3
     67c:	e1a03002 	mov	r3, r2
     680:	e1a02001 	mov	r2, r1
     684:	e1a01000 	mov	r1, r0
     688:	e3a0000f 	mov	r0, #15
     68c:	ef000000 	svc	0x00000000
     690:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     694:	e12fff1e 	bx	lr

00000698 <mknod>:
     698:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     69c:	e1a04003 	mov	r4, r3
     6a0:	e1a03002 	mov	r3, r2
     6a4:	e1a02001 	mov	r2, r1
     6a8:	e1a01000 	mov	r1, r0
     6ac:	e3a00011 	mov	r0, #17
     6b0:	ef000000 	svc	0x00000000
     6b4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6b8:	e12fff1e 	bx	lr

000006bc <unlink>:
     6bc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6c0:	e1a04003 	mov	r4, r3
     6c4:	e1a03002 	mov	r3, r2
     6c8:	e1a02001 	mov	r2, r1
     6cc:	e1a01000 	mov	r1, r0
     6d0:	e3a00012 	mov	r0, #18
     6d4:	ef000000 	svc	0x00000000
     6d8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6dc:	e12fff1e 	bx	lr

000006e0 <fstat>:
     6e0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6e4:	e1a04003 	mov	r4, r3
     6e8:	e1a03002 	mov	r3, r2
     6ec:	e1a02001 	mov	r2, r1
     6f0:	e1a01000 	mov	r1, r0
     6f4:	e3a00008 	mov	r0, #8
     6f8:	ef000000 	svc	0x00000000
     6fc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     700:	e12fff1e 	bx	lr

00000704 <link>:
     704:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     708:	e1a04003 	mov	r4, r3
     70c:	e1a03002 	mov	r3, r2
     710:	e1a02001 	mov	r2, r1
     714:	e1a01000 	mov	r1, r0
     718:	e3a00013 	mov	r0, #19
     71c:	ef000000 	svc	0x00000000
     720:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     724:	e12fff1e 	bx	lr

00000728 <mkdir>:
     728:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     72c:	e1a04003 	mov	r4, r3
     730:	e1a03002 	mov	r3, r2
     734:	e1a02001 	mov	r2, r1
     738:	e1a01000 	mov	r1, r0
     73c:	e3a00014 	mov	r0, #20
     740:	ef000000 	svc	0x00000000
     744:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     748:	e12fff1e 	bx	lr

0000074c <chdir>:
     74c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     750:	e1a04003 	mov	r4, r3
     754:	e1a03002 	mov	r3, r2
     758:	e1a02001 	mov	r2, r1
     75c:	e1a01000 	mov	r1, r0
     760:	e3a00009 	mov	r0, #9
     764:	ef000000 	svc	0x00000000
     768:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     76c:	e12fff1e 	bx	lr

00000770 <dup>:
     770:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     774:	e1a04003 	mov	r4, r3
     778:	e1a03002 	mov	r3, r2
     77c:	e1a02001 	mov	r2, r1
     780:	e1a01000 	mov	r1, r0
     784:	e3a0000a 	mov	r0, #10
     788:	ef000000 	svc	0x00000000
     78c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     790:	e12fff1e 	bx	lr

00000794 <getpid>:
     794:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     798:	e1a04003 	mov	r4, r3
     79c:	e1a03002 	mov	r3, r2
     7a0:	e1a02001 	mov	r2, r1
     7a4:	e1a01000 	mov	r1, r0
     7a8:	e3a0000b 	mov	r0, #11
     7ac:	ef000000 	svc	0x00000000
     7b0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7b4:	e12fff1e 	bx	lr

000007b8 <sbrk>:
     7b8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7bc:	e1a04003 	mov	r4, r3
     7c0:	e1a03002 	mov	r3, r2
     7c4:	e1a02001 	mov	r2, r1
     7c8:	e1a01000 	mov	r1, r0
     7cc:	e3a0000c 	mov	r0, #12
     7d0:	ef000000 	svc	0x00000000
     7d4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7d8:	e12fff1e 	bx	lr

000007dc <sleep>:
     7dc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7e0:	e1a04003 	mov	r4, r3
     7e4:	e1a03002 	mov	r3, r2
     7e8:	e1a02001 	mov	r2, r1
     7ec:	e1a01000 	mov	r1, r0
     7f0:	e3a0000d 	mov	r0, #13
     7f4:	ef000000 	svc	0x00000000
     7f8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7fc:	e12fff1e 	bx	lr

00000800 <uptime>:
     800:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     804:	e1a04003 	mov	r4, r3
     808:	e1a03002 	mov	r3, r2
     80c:	e1a02001 	mov	r2, r1
     810:	e1a01000 	mov	r1, r0
     814:	e3a0000e 	mov	r0, #14
     818:	ef000000 	svc	0x00000000
     81c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     820:	e12fff1e 	bx	lr

00000824 <kthread_create>:
     824:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     828:	e1a04003 	mov	r4, r3
     82c:	e1a03002 	mov	r3, r2
     830:	e1a02001 	mov	r2, r1
     834:	e1a01000 	mov	r1, r0
     838:	e3a00016 	mov	r0, #22
     83c:	ef000000 	svc	0x00000000
     840:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     844:	e12fff1e 	bx	lr

00000848 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     848:	e92d4800 	push	{fp, lr}
     84c:	e28db004 	add	fp, sp, #4
     850:	e24dd008 	sub	sp, sp, #8
     854:	e50b0008 	str	r0, [fp, #-8]
     858:	e1a03001 	mov	r3, r1
     85c:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     860:	e51b0008 	ldr	r0, [fp, #-8]
     864:	e24b3009 	sub	r3, fp, #9
     868:	e1a01003 	mov	r1, r3
     86c:	e3a02001 	mov	r2, #1
     870:	ebffff5b 	bl	5e4 <write>
}
     874:	e24bd004 	sub	sp, fp, #4
     878:	e8bd8800 	pop	{fp, pc}

0000087c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     87c:	e92d4800 	push	{fp, lr}
     880:	e28db004 	add	fp, sp, #4
     884:	e24dd030 	sub	sp, sp, #48	; 0x30
     888:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     88c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     890:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     894:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     898:	e3a03000 	mov	r3, #0
     89c:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     8a0:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     8a4:	e3530000 	cmp	r3, #0
     8a8:	0a000008 	beq	8d0 <printint+0x54>
     8ac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     8b0:	e3530000 	cmp	r3, #0
     8b4:	aa000005 	bge	8d0 <printint+0x54>
        neg = 1;
     8b8:	e3a03001 	mov	r3, #1
     8bc:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     8c0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     8c4:	e2633000 	rsb	r3, r3, #0
     8c8:	e50b3010 	str	r3, [fp, #-16]
     8cc:	ea000001 	b	8d8 <printint+0x5c>
    } else {
        x = xx;
     8d0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     8d4:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     8d8:	e3a03000 	mov	r3, #0
     8dc:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     8e0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     8e4:	e51b2010 	ldr	r2, [fp, #-16]
     8e8:	e1a00002 	mov	r0, r2
     8ec:	e1a01003 	mov	r1, r3
     8f0:	eb0001e5 	bl	108c <__aeabi_uidivmod>
     8f4:	e1a03001 	mov	r3, r1
     8f8:	e1a02003 	mov	r2, r3
     8fc:	e30130c8 	movw	r3, #4296	; 0x10c8
     900:	e3403000 	movt	r3, #0
     904:	e7d32002 	ldrb	r2, [r3, r2]
     908:	e3e0001b 	mvn	r0, #27
     90c:	e51b3008 	ldr	r3, [fp, #-8]
     910:	e24bc004 	sub	ip, fp, #4
     914:	e08c1003 	add	r1, ip, r3
     918:	e1a03000 	mov	r3, r0
     91c:	e0813003 	add	r3, r1, r3
     920:	e5c32000 	strb	r2, [r3]
     924:	e51b3008 	ldr	r3, [fp, #-8]
     928:	e2833001 	add	r3, r3, #1
     92c:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     930:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     934:	e51b0010 	ldr	r0, [fp, #-16]
     938:	e1a01003 	mov	r1, r3
     93c:	eb000195 	bl	f98 <__aeabi_uidiv>
     940:	e1a03000 	mov	r3, r0
     944:	e50b3010 	str	r3, [fp, #-16]
     948:	e51b3010 	ldr	r3, [fp, #-16]
     94c:	e3530000 	cmp	r3, #0
     950:	1affffe2 	bne	8e0 <printint+0x64>
    if(neg)
     954:	e51b300c 	ldr	r3, [fp, #-12]
     958:	e3530000 	cmp	r3, #0
     95c:	0a000015 	beq	9b8 <printint+0x13c>
        buf[i++] = '-';
     960:	e3e0101b 	mvn	r1, #27
     964:	e51b3008 	ldr	r3, [fp, #-8]
     968:	e24b0004 	sub	r0, fp, #4
     96c:	e0802003 	add	r2, r0, r3
     970:	e1a03001 	mov	r3, r1
     974:	e0823003 	add	r3, r2, r3
     978:	e3a0202d 	mov	r2, #45	; 0x2d
     97c:	e5c32000 	strb	r2, [r3]
     980:	e51b3008 	ldr	r3, [fp, #-8]
     984:	e2833001 	add	r3, r3, #1
     988:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     98c:	ea000009 	b	9b8 <printint+0x13c>
        putc(fd, buf[i]);
     990:	e3e0101b 	mvn	r1, #27
     994:	e51b3008 	ldr	r3, [fp, #-8]
     998:	e24bc004 	sub	ip, fp, #4
     99c:	e08c2003 	add	r2, ip, r3
     9a0:	e1a03001 	mov	r3, r1
     9a4:	e0823003 	add	r3, r2, r3
     9a8:	e5d33000 	ldrb	r3, [r3]
     9ac:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     9b0:	e1a01003 	mov	r1, r3
     9b4:	ebffffa3 	bl	848 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     9b8:	e51b3008 	ldr	r3, [fp, #-8]
     9bc:	e2433001 	sub	r3, r3, #1
     9c0:	e50b3008 	str	r3, [fp, #-8]
     9c4:	e51b3008 	ldr	r3, [fp, #-8]
     9c8:	e3530000 	cmp	r3, #0
     9cc:	aaffffef 	bge	990 <printint+0x114>
        putc(fd, buf[i]);
}
     9d0:	e24bd004 	sub	sp, fp, #4
     9d4:	e8bd8800 	pop	{fp, pc}

000009d8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     9d8:	e92d000e 	push	{r1, r2, r3}
     9dc:	e92d4800 	push	{fp, lr}
     9e0:	e28db004 	add	fp, sp, #4
     9e4:	e24dd024 	sub	sp, sp, #36	; 0x24
     9e8:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     9ec:	e3a03000 	mov	r3, #0
     9f0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     9f4:	e28b3008 	add	r3, fp, #8
     9f8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     9fc:	e3a03000 	mov	r3, #0
     a00:	e50b3010 	str	r3, [fp, #-16]
     a04:	ea000077 	b	be8 <printf+0x210>
        c = fmt[i] & 0xff;
     a08:	e59b2004 	ldr	r2, [fp, #4]
     a0c:	e51b3010 	ldr	r3, [fp, #-16]
     a10:	e0823003 	add	r3, r2, r3
     a14:	e5d33000 	ldrb	r3, [r3]
     a18:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     a1c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a20:	e3530000 	cmp	r3, #0
     a24:	1a00000b 	bne	a58 <printf+0x80>
            if(c == '%'){
     a28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a2c:	e3530025 	cmp	r3, #37	; 0x25
     a30:	1a000002 	bne	a40 <printf+0x68>
                state = '%';
     a34:	e3a03025 	mov	r3, #37	; 0x25
     a38:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     a3c:	ea000066 	b	bdc <printf+0x204>
            } else {
                putc(fd, c);
     a40:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a44:	e6ef3073 	uxtb	r3, r3
     a48:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     a4c:	e1a01003 	mov	r1, r3
     a50:	ebffff7c 	bl	848 <putc>
     a54:	ea000060 	b	bdc <printf+0x204>
            }
        } else if(state == '%'){
     a58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a5c:	e3530025 	cmp	r3, #37	; 0x25
     a60:	1a00005d 	bne	bdc <printf+0x204>
            if(c == 'd'){
     a64:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a68:	e3530064 	cmp	r3, #100	; 0x64
     a6c:	1a00000a 	bne	a9c <printf+0xc4>
                printint(fd, *ap, 10, 1);
     a70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     a74:	e5933000 	ldr	r3, [r3]
     a78:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     a7c:	e1a01003 	mov	r1, r3
     a80:	e3a0200a 	mov	r2, #10
     a84:	e3a03001 	mov	r3, #1
     a88:	ebffff7b 	bl	87c <printint>
                ap++;
     a8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     a90:	e2833004 	add	r3, r3, #4
     a94:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     a98:	ea00004d 	b	bd4 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     a9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     aa0:	e3530078 	cmp	r3, #120	; 0x78
     aa4:	0a000002 	beq	ab4 <printf+0xdc>
     aa8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     aac:	e3530070 	cmp	r3, #112	; 0x70
     ab0:	1a00000a 	bne	ae0 <printf+0x108>
                printint(fd, *ap, 16, 0);
     ab4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ab8:	e5933000 	ldr	r3, [r3]
     abc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ac0:	e1a01003 	mov	r1, r3
     ac4:	e3a02010 	mov	r2, #16
     ac8:	e3a03000 	mov	r3, #0
     acc:	ebffff6a 	bl	87c <printint>
                ap++;
     ad0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ad4:	e2833004 	add	r3, r3, #4
     ad8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     adc:	ea00003c 	b	bd4 <printf+0x1fc>
            } else if(c == 's'){
     ae0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ae4:	e3530073 	cmp	r3, #115	; 0x73
     ae8:	1a00001b 	bne	b5c <printf+0x184>
                s = (char*)*ap;
     aec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     af0:	e5933000 	ldr	r3, [r3]
     af4:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     af8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     afc:	e2833004 	add	r3, r3, #4
     b00:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     b04:	e51b300c 	ldr	r3, [fp, #-12]
     b08:	e3530000 	cmp	r3, #0
     b0c:	1a00000c 	bne	b44 <printf+0x16c>
                    s = "(null)";
     b10:	e30130c0 	movw	r3, #4288	; 0x10c0
     b14:	e3403000 	movt	r3, #0
     b18:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     b1c:	ea000008 	b	b44 <printf+0x16c>
                    putc(fd, *s);
     b20:	e51b300c 	ldr	r3, [fp, #-12]
     b24:	e5d33000 	ldrb	r3, [r3]
     b28:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b2c:	e1a01003 	mov	r1, r3
     b30:	ebffff44 	bl	848 <putc>
                    s++;
     b34:	e51b300c 	ldr	r3, [fp, #-12]
     b38:	e2833001 	add	r3, r3, #1
     b3c:	e50b300c 	str	r3, [fp, #-12]
     b40:	ea000000 	b	b48 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     b44:	e1a00000 	nop			; (mov r0, r0)
     b48:	e51b300c 	ldr	r3, [fp, #-12]
     b4c:	e5d33000 	ldrb	r3, [r3]
     b50:	e3530000 	cmp	r3, #0
     b54:	1afffff1 	bne	b20 <printf+0x148>
     b58:	ea00001d 	b	bd4 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     b5c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b60:	e3530063 	cmp	r3, #99	; 0x63
     b64:	1a000009 	bne	b90 <printf+0x1b8>
                putc(fd, *ap);
     b68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b6c:	e5933000 	ldr	r3, [r3]
     b70:	e6ef3073 	uxtb	r3, r3
     b74:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b78:	e1a01003 	mov	r1, r3
     b7c:	ebffff31 	bl	848 <putc>
                ap++;
     b80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b84:	e2833004 	add	r3, r3, #4
     b88:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b8c:	ea000010 	b	bd4 <printf+0x1fc>
            } else if(c == '%'){
     b90:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b94:	e3530025 	cmp	r3, #37	; 0x25
     b98:	1a000005 	bne	bb4 <printf+0x1dc>
                putc(fd, c);
     b9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ba0:	e6ef3073 	uxtb	r3, r3
     ba4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ba8:	e1a01003 	mov	r1, r3
     bac:	ebffff25 	bl	848 <putc>
     bb0:	ea000007 	b	bd4 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     bb4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bb8:	e3a01025 	mov	r1, #37	; 0x25
     bbc:	ebffff21 	bl	848 <putc>
                putc(fd, c);
     bc0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bc4:	e6ef3073 	uxtb	r3, r3
     bc8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bcc:	e1a01003 	mov	r1, r3
     bd0:	ebffff1c 	bl	848 <putc>
            }
            state = 0;
     bd4:	e3a03000 	mov	r3, #0
     bd8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     bdc:	e51b3010 	ldr	r3, [fp, #-16]
     be0:	e2833001 	add	r3, r3, #1
     be4:	e50b3010 	str	r3, [fp, #-16]
     be8:	e59b2004 	ldr	r2, [fp, #4]
     bec:	e51b3010 	ldr	r3, [fp, #-16]
     bf0:	e0823003 	add	r3, r2, r3
     bf4:	e5d33000 	ldrb	r3, [r3]
     bf8:	e3530000 	cmp	r3, #0
     bfc:	1affff81 	bne	a08 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     c00:	e24bd004 	sub	sp, fp, #4
     c04:	e8bd4800 	pop	{fp, lr}
     c08:	e28dd00c 	add	sp, sp, #12
     c0c:	e12fff1e 	bx	lr

00000c10 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c14:	e28db000 	add	fp, sp, #0
     c18:	e24dd014 	sub	sp, sp, #20
     c1c:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     c20:	e51b3010 	ldr	r3, [fp, #-16]
     c24:	e2433008 	sub	r3, r3, #8
     c28:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c2c:	e30130e4 	movw	r3, #4324	; 0x10e4
     c30:	e3403000 	movt	r3, #0
     c34:	e5933000 	ldr	r3, [r3]
     c38:	e50b3008 	str	r3, [fp, #-8]
     c3c:	ea000010 	b	c84 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c40:	e51b3008 	ldr	r3, [fp, #-8]
     c44:	e5932000 	ldr	r2, [r3]
     c48:	e51b3008 	ldr	r3, [fp, #-8]
     c4c:	e1520003 	cmp	r2, r3
     c50:	8a000008 	bhi	c78 <free+0x68>
     c54:	e51b200c 	ldr	r2, [fp, #-12]
     c58:	e51b3008 	ldr	r3, [fp, #-8]
     c5c:	e1520003 	cmp	r2, r3
     c60:	8a000010 	bhi	ca8 <free+0x98>
     c64:	e51b3008 	ldr	r3, [fp, #-8]
     c68:	e5932000 	ldr	r2, [r3]
     c6c:	e51b300c 	ldr	r3, [fp, #-12]
     c70:	e1520003 	cmp	r2, r3
     c74:	8a00000b 	bhi	ca8 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c78:	e51b3008 	ldr	r3, [fp, #-8]
     c7c:	e5933000 	ldr	r3, [r3]
     c80:	e50b3008 	str	r3, [fp, #-8]
     c84:	e51b200c 	ldr	r2, [fp, #-12]
     c88:	e51b3008 	ldr	r3, [fp, #-8]
     c8c:	e1520003 	cmp	r2, r3
     c90:	9affffea 	bls	c40 <free+0x30>
     c94:	e51b3008 	ldr	r3, [fp, #-8]
     c98:	e5932000 	ldr	r2, [r3]
     c9c:	e51b300c 	ldr	r3, [fp, #-12]
     ca0:	e1520003 	cmp	r2, r3
     ca4:	9affffe5 	bls	c40 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     ca8:	e51b300c 	ldr	r3, [fp, #-12]
     cac:	e5933004 	ldr	r3, [r3, #4]
     cb0:	e1a03183 	lsl	r3, r3, #3
     cb4:	e51b200c 	ldr	r2, [fp, #-12]
     cb8:	e0822003 	add	r2, r2, r3
     cbc:	e51b3008 	ldr	r3, [fp, #-8]
     cc0:	e5933000 	ldr	r3, [r3]
     cc4:	e1520003 	cmp	r2, r3
     cc8:	1a00000d 	bne	d04 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     ccc:	e51b300c 	ldr	r3, [fp, #-12]
     cd0:	e5932004 	ldr	r2, [r3, #4]
     cd4:	e51b3008 	ldr	r3, [fp, #-8]
     cd8:	e5933000 	ldr	r3, [r3]
     cdc:	e5933004 	ldr	r3, [r3, #4]
     ce0:	e0822003 	add	r2, r2, r3
     ce4:	e51b300c 	ldr	r3, [fp, #-12]
     ce8:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     cec:	e51b3008 	ldr	r3, [fp, #-8]
     cf0:	e5933000 	ldr	r3, [r3]
     cf4:	e5932000 	ldr	r2, [r3]
     cf8:	e51b300c 	ldr	r3, [fp, #-12]
     cfc:	e5832000 	str	r2, [r3]
     d00:	ea000003 	b	d14 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     d04:	e51b3008 	ldr	r3, [fp, #-8]
     d08:	e5932000 	ldr	r2, [r3]
     d0c:	e51b300c 	ldr	r3, [fp, #-12]
     d10:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     d14:	e51b3008 	ldr	r3, [fp, #-8]
     d18:	e5933004 	ldr	r3, [r3, #4]
     d1c:	e1a03183 	lsl	r3, r3, #3
     d20:	e51b2008 	ldr	r2, [fp, #-8]
     d24:	e0822003 	add	r2, r2, r3
     d28:	e51b300c 	ldr	r3, [fp, #-12]
     d2c:	e1520003 	cmp	r2, r3
     d30:	1a00000b 	bne	d64 <free+0x154>
        p->s.size += bp->s.size;
     d34:	e51b3008 	ldr	r3, [fp, #-8]
     d38:	e5932004 	ldr	r2, [r3, #4]
     d3c:	e51b300c 	ldr	r3, [fp, #-12]
     d40:	e5933004 	ldr	r3, [r3, #4]
     d44:	e0822003 	add	r2, r2, r3
     d48:	e51b3008 	ldr	r3, [fp, #-8]
     d4c:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     d50:	e51b300c 	ldr	r3, [fp, #-12]
     d54:	e5932000 	ldr	r2, [r3]
     d58:	e51b3008 	ldr	r3, [fp, #-8]
     d5c:	e5832000 	str	r2, [r3]
     d60:	ea000002 	b	d70 <free+0x160>
    } else
        p->s.ptr = bp;
     d64:	e51b3008 	ldr	r3, [fp, #-8]
     d68:	e51b200c 	ldr	r2, [fp, #-12]
     d6c:	e5832000 	str	r2, [r3]
    freep = p;
     d70:	e30130e4 	movw	r3, #4324	; 0x10e4
     d74:	e3403000 	movt	r3, #0
     d78:	e51b2008 	ldr	r2, [fp, #-8]
     d7c:	e5832000 	str	r2, [r3]
}
     d80:	e28bd000 	add	sp, fp, #0
     d84:	e8bd0800 	pop	{fp}
     d88:	e12fff1e 	bx	lr

00000d8c <morecore>:

static Header*
morecore(uint nu)
{
     d8c:	e92d4800 	push	{fp, lr}
     d90:	e28db004 	add	fp, sp, #4
     d94:	e24dd010 	sub	sp, sp, #16
     d98:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     d9c:	e51b2010 	ldr	r2, [fp, #-16]
     da0:	e3003fff 	movw	r3, #4095	; 0xfff
     da4:	e1520003 	cmp	r2, r3
     da8:	8a000001 	bhi	db4 <morecore+0x28>
        nu = 4096;
     dac:	e3a03a01 	mov	r3, #4096	; 0x1000
     db0:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     db4:	e51b3010 	ldr	r3, [fp, #-16]
     db8:	e1a03183 	lsl	r3, r3, #3
     dbc:	e1a00003 	mov	r0, r3
     dc0:	ebfffe7c 	bl	7b8 <sbrk>
     dc4:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e3730001 	cmn	r3, #1
     dd0:	1a000001 	bne	ddc <morecore+0x50>
        return 0;
     dd4:	e3a03000 	mov	r3, #0
     dd8:	ea00000b 	b	e0c <morecore+0x80>
    hp = (Header*)p;
     ddc:	e51b3008 	ldr	r3, [fp, #-8]
     de0:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     de4:	e51b300c 	ldr	r3, [fp, #-12]
     de8:	e51b2010 	ldr	r2, [fp, #-16]
     dec:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     df0:	e51b300c 	ldr	r3, [fp, #-12]
     df4:	e2833008 	add	r3, r3, #8
     df8:	e1a00003 	mov	r0, r3
     dfc:	ebffff83 	bl	c10 <free>
    return freep;
     e00:	e30130e4 	movw	r3, #4324	; 0x10e4
     e04:	e3403000 	movt	r3, #0
     e08:	e5933000 	ldr	r3, [r3]
}
     e0c:	e1a00003 	mov	r0, r3
     e10:	e24bd004 	sub	sp, fp, #4
     e14:	e8bd8800 	pop	{fp, pc}

00000e18 <malloc>:

void*
malloc(uint nbytes)
{
     e18:	e92d4800 	push	{fp, lr}
     e1c:	e28db004 	add	fp, sp, #4
     e20:	e24dd018 	sub	sp, sp, #24
     e24:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e2c:	e2833007 	add	r3, r3, #7
     e30:	e1a031a3 	lsr	r3, r3, #3
     e34:	e2833001 	add	r3, r3, #1
     e38:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     e3c:	e30130e4 	movw	r3, #4324	; 0x10e4
     e40:	e3403000 	movt	r3, #0
     e44:	e5933000 	ldr	r3, [r3]
     e48:	e50b300c 	str	r3, [fp, #-12]
     e4c:	e51b300c 	ldr	r3, [fp, #-12]
     e50:	e3530000 	cmp	r3, #0
     e54:	1a000010 	bne	e9c <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     e58:	e30130dc 	movw	r3, #4316	; 0x10dc
     e5c:	e3403000 	movt	r3, #0
     e60:	e50b300c 	str	r3, [fp, #-12]
     e64:	e30130e4 	movw	r3, #4324	; 0x10e4
     e68:	e3403000 	movt	r3, #0
     e6c:	e51b200c 	ldr	r2, [fp, #-12]
     e70:	e5832000 	str	r2, [r3]
     e74:	e30130e4 	movw	r3, #4324	; 0x10e4
     e78:	e3403000 	movt	r3, #0
     e7c:	e5932000 	ldr	r2, [r3]
     e80:	e30130dc 	movw	r3, #4316	; 0x10dc
     e84:	e3403000 	movt	r3, #0
     e88:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     e8c:	e30130dc 	movw	r3, #4316	; 0x10dc
     e90:	e3403000 	movt	r3, #0
     e94:	e3a02000 	mov	r2, #0
     e98:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e9c:	e51b300c 	ldr	r3, [fp, #-12]
     ea0:	e5933000 	ldr	r3, [r3]
     ea4:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     ea8:	e51b3008 	ldr	r3, [fp, #-8]
     eac:	e5932004 	ldr	r2, [r3, #4]
     eb0:	e51b3010 	ldr	r3, [fp, #-16]
     eb4:	e1520003 	cmp	r2, r3
     eb8:	3a00001f 	bcc	f3c <malloc+0x124>
            if(p->s.size == nunits)
     ebc:	e51b3008 	ldr	r3, [fp, #-8]
     ec0:	e5932004 	ldr	r2, [r3, #4]
     ec4:	e51b3010 	ldr	r3, [fp, #-16]
     ec8:	e1520003 	cmp	r2, r3
     ecc:	1a000004 	bne	ee4 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     ed0:	e51b3008 	ldr	r3, [fp, #-8]
     ed4:	e5932000 	ldr	r2, [r3]
     ed8:	e51b300c 	ldr	r3, [fp, #-12]
     edc:	e5832000 	str	r2, [r3]
     ee0:	ea00000e 	b	f20 <malloc+0x108>
            else {
                p->s.size -= nunits;
     ee4:	e51b3008 	ldr	r3, [fp, #-8]
     ee8:	e5932004 	ldr	r2, [r3, #4]
     eec:	e51b3010 	ldr	r3, [fp, #-16]
     ef0:	e0632002 	rsb	r2, r3, r2
     ef4:	e51b3008 	ldr	r3, [fp, #-8]
     ef8:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     efc:	e51b3008 	ldr	r3, [fp, #-8]
     f00:	e5933004 	ldr	r3, [r3, #4]
     f04:	e1a03183 	lsl	r3, r3, #3
     f08:	e51b2008 	ldr	r2, [fp, #-8]
     f0c:	e0823003 	add	r3, r2, r3
     f10:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     f14:	e51b3008 	ldr	r3, [fp, #-8]
     f18:	e51b2010 	ldr	r2, [fp, #-16]
     f1c:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     f20:	e30130e4 	movw	r3, #4324	; 0x10e4
     f24:	e3403000 	movt	r3, #0
     f28:	e51b200c 	ldr	r2, [fp, #-12]
     f2c:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     f30:	e51b3008 	ldr	r3, [fp, #-8]
     f34:	e2833008 	add	r3, r3, #8
     f38:	ea000013 	b	f8c <malloc+0x174>
        }
        if(p == freep)
     f3c:	e30130e4 	movw	r3, #4324	; 0x10e4
     f40:	e3403000 	movt	r3, #0
     f44:	e5933000 	ldr	r3, [r3]
     f48:	e51b2008 	ldr	r2, [fp, #-8]
     f4c:	e1520003 	cmp	r2, r3
     f50:	1a000007 	bne	f74 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     f54:	e51b0010 	ldr	r0, [fp, #-16]
     f58:	ebffff8b 	bl	d8c <morecore>
     f5c:	e50b0008 	str	r0, [fp, #-8]
     f60:	e51b3008 	ldr	r3, [fp, #-8]
     f64:	e3530000 	cmp	r3, #0
     f68:	1a000001 	bne	f74 <malloc+0x15c>
                return 0;
     f6c:	e3a03000 	mov	r3, #0
     f70:	ea000005 	b	f8c <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f74:	e51b3008 	ldr	r3, [fp, #-8]
     f78:	e50b300c 	str	r3, [fp, #-12]
     f7c:	e51b3008 	ldr	r3, [fp, #-8]
     f80:	e5933000 	ldr	r3, [r3]
     f84:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
     f88:	eaffffc6 	b	ea8 <malloc+0x90>
}
     f8c:	e1a00003 	mov	r0, r3
     f90:	e24bd004 	sub	sp, fp, #4
     f94:	e8bd8800 	pop	{fp, pc}

00000f98 <__aeabi_uidiv>:
     f98:	e2512001 	subs	r2, r1, #1
     f9c:	012fff1e 	bxeq	lr
     fa0:	3a000036 	bcc	1080 <__aeabi_uidiv+0xe8>
     fa4:	e1500001 	cmp	r0, r1
     fa8:	9a000022 	bls	1038 <__aeabi_uidiv+0xa0>
     fac:	e1110002 	tst	r1, r2
     fb0:	0a000023 	beq	1044 <__aeabi_uidiv+0xac>
     fb4:	e311020e 	tst	r1, #-536870912	; 0xe0000000
     fb8:	01a01181 	lsleq	r1, r1, #3
     fbc:	03a03008 	moveq	r3, #8
     fc0:	13a03001 	movne	r3, #1
     fc4:	e3510201 	cmp	r1, #268435456	; 0x10000000
     fc8:	31510000 	cmpcc	r1, r0
     fcc:	31a01201 	lslcc	r1, r1, #4
     fd0:	31a03203 	lslcc	r3, r3, #4
     fd4:	3afffffa 	bcc	fc4 <__aeabi_uidiv+0x2c>
     fd8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
     fdc:	31510000 	cmpcc	r1, r0
     fe0:	31a01081 	lslcc	r1, r1, #1
     fe4:	31a03083 	lslcc	r3, r3, #1
     fe8:	3afffffa 	bcc	fd8 <__aeabi_uidiv+0x40>
     fec:	e3a02000 	mov	r2, #0
     ff0:	e1500001 	cmp	r0, r1
     ff4:	20400001 	subcs	r0, r0, r1
     ff8:	21822003 	orrcs	r2, r2, r3
     ffc:	e15000a1 	cmp	r0, r1, lsr #1
    1000:	204000a1 	subcs	r0, r0, r1, lsr #1
    1004:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1008:	e1500121 	cmp	r0, r1, lsr #2
    100c:	20400121 	subcs	r0, r0, r1, lsr #2
    1010:	21822123 	orrcs	r2, r2, r3, lsr #2
    1014:	e15001a1 	cmp	r0, r1, lsr #3
    1018:	204001a1 	subcs	r0, r0, r1, lsr #3
    101c:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1020:	e3500000 	cmp	r0, #0
    1024:	11b03223 	lsrsne	r3, r3, #4
    1028:	11a01221 	lsrne	r1, r1, #4
    102c:	1affffef 	bne	ff0 <__aeabi_uidiv+0x58>
    1030:	e1a00002 	mov	r0, r2
    1034:	e12fff1e 	bx	lr
    1038:	03a00001 	moveq	r0, #1
    103c:	13a00000 	movne	r0, #0
    1040:	e12fff1e 	bx	lr
    1044:	e3510801 	cmp	r1, #65536	; 0x10000
    1048:	21a01821 	lsrcs	r1, r1, #16
    104c:	23a02010 	movcs	r2, #16
    1050:	33a02000 	movcc	r2, #0
    1054:	e3510c01 	cmp	r1, #256	; 0x100
    1058:	21a01421 	lsrcs	r1, r1, #8
    105c:	22822008 	addcs	r2, r2, #8
    1060:	e3510010 	cmp	r1, #16
    1064:	21a01221 	lsrcs	r1, r1, #4
    1068:	22822004 	addcs	r2, r2, #4
    106c:	e3510004 	cmp	r1, #4
    1070:	82822003 	addhi	r2, r2, #3
    1074:	908220a1 	addls	r2, r2, r1, lsr #1
    1078:	e1a00230 	lsr	r0, r0, r2
    107c:	e12fff1e 	bx	lr
    1080:	e3500000 	cmp	r0, #0
    1084:	13e00000 	mvnne	r0, #0
    1088:	ea000007 	b	10ac <__aeabi_idiv0>

0000108c <__aeabi_uidivmod>:
    108c:	e3510000 	cmp	r1, #0
    1090:	0afffffa 	beq	1080 <__aeabi_uidiv+0xe8>
    1094:	e92d4003 	push	{r0, r1, lr}
    1098:	ebffffbe 	bl	f98 <__aeabi_uidiv>
    109c:	e8bd4006 	pop	{r1, r2, lr}
    10a0:	e0030092 	mul	r3, r2, r0
    10a4:	e0411003 	sub	r1, r1, r3
    10a8:	e12fff1e 	bx	lr

000010ac <__aeabi_idiv0>:
    10ac:	e12fff1e 	bx	lr
