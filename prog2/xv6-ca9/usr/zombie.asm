
_zombie:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
    if(fork() > 0)
       8:	eb000149 	bl	534 <fork>
       c:	e1a03000 	mov	r3, r0
      10:	e3530000 	cmp	r3, #0
      14:	da000001 	ble	20 <main+0x20>
        sleep(5);  // Let child exit before parent.
      18:	e3a00005 	mov	r0, #5
      1c:	eb0001ef 	bl	7e0 <sleep>
    exit();
      20:	eb00014c 	bl	558 <exit>

00000024 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
      24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      28:	e28db000 	add	fp, sp, #0
      2c:	e24dd014 	sub	sp, sp, #20
      30:	e50b0010 	str	r0, [fp, #-16]
      34:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
      38:	e51b3010 	ldr	r3, [fp, #-16]
      3c:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
      40:	e1a00000 	nop			; (mov r0, r0)
      44:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      48:	e5d32000 	ldrb	r2, [r3]
      4c:	e51b3010 	ldr	r3, [fp, #-16]
      50:	e5c32000 	strb	r2, [r3]
      54:	e51b3010 	ldr	r3, [fp, #-16]
      58:	e5d33000 	ldrb	r3, [r3]
      5c:	e3530000 	cmp	r3, #0
      60:	03a03000 	moveq	r3, #0
      64:	13a03001 	movne	r3, #1
      68:	e6ef3073 	uxtb	r3, r3
      6c:	e51b2010 	ldr	r2, [fp, #-16]
      70:	e2822001 	add	r2, r2, #1
      74:	e50b2010 	str	r2, [fp, #-16]
      78:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      7c:	e2822001 	add	r2, r2, #1
      80:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
      84:	e3530000 	cmp	r3, #0
      88:	1affffed 	bne	44 <strcpy+0x20>
        ;
    return os;
      8c:	e51b3008 	ldr	r3, [fp, #-8]
}
      90:	e1a00003 	mov	r0, r3
      94:	e28bd000 	add	sp, fp, #0
      98:	e8bd0800 	pop	{fp}
      9c:	e12fff1e 	bx	lr

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      a4:	e28db000 	add	fp, sp, #0
      a8:	e24dd00c 	sub	sp, sp, #12
      ac:	e50b0008 	str	r0, [fp, #-8]
      b0:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
      b4:	ea000005 	b	d0 <strcmp+0x30>
        p++, q++;
      b8:	e51b3008 	ldr	r3, [fp, #-8]
      bc:	e2833001 	add	r3, r3, #1
      c0:	e50b3008 	str	r3, [fp, #-8]
      c4:	e51b300c 	ldr	r3, [fp, #-12]
      c8:	e2833001 	add	r3, r3, #1
      cc:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
      d0:	e51b3008 	ldr	r3, [fp, #-8]
      d4:	e5d33000 	ldrb	r3, [r3]
      d8:	e3530000 	cmp	r3, #0
      dc:	0a000005 	beq	f8 <strcmp+0x58>
      e0:	e51b3008 	ldr	r3, [fp, #-8]
      e4:	e5d32000 	ldrb	r2, [r3]
      e8:	e51b300c 	ldr	r3, [fp, #-12]
      ec:	e5d33000 	ldrb	r3, [r3]
      f0:	e1520003 	cmp	r2, r3
      f4:	0affffef 	beq	b8 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
      f8:	e51b3008 	ldr	r3, [fp, #-8]
      fc:	e5d33000 	ldrb	r3, [r3]
     100:	e1a02003 	mov	r2, r3
     104:	e51b300c 	ldr	r3, [fp, #-12]
     108:	e5d33000 	ldrb	r3, [r3]
     10c:	e0633002 	rsb	r3, r3, r2
}
     110:	e1a00003 	mov	r0, r3
     114:	e28bd000 	add	sp, fp, #0
     118:	e8bd0800 	pop	{fp}
     11c:	e12fff1e 	bx	lr

00000120 <strlen>:

uint
strlen(char *s)
{
     120:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     124:	e28db000 	add	fp, sp, #0
     128:	e24dd014 	sub	sp, sp, #20
     12c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     130:	e3a03000 	mov	r3, #0
     134:	e50b3008 	str	r3, [fp, #-8]
     138:	ea000002 	b	148 <strlen+0x28>
     13c:	e51b3008 	ldr	r3, [fp, #-8]
     140:	e2833001 	add	r3, r3, #1
     144:	e50b3008 	str	r3, [fp, #-8]
     148:	e51b3008 	ldr	r3, [fp, #-8]
     14c:	e51b2010 	ldr	r2, [fp, #-16]
     150:	e0823003 	add	r3, r2, r3
     154:	e5d33000 	ldrb	r3, [r3]
     158:	e3530000 	cmp	r3, #0
     15c:	1afffff6 	bne	13c <strlen+0x1c>
        ;
    return n;
     160:	e51b3008 	ldr	r3, [fp, #-8]
}
     164:	e1a00003 	mov	r0, r3
     168:	e28bd000 	add	sp, fp, #0
     16c:	e8bd0800 	pop	{fp}
     170:	e12fff1e 	bx	lr

00000174 <memset>:

void*
memset(void *dst, int v, uint n)
{
     174:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     178:	e28db000 	add	fp, sp, #0
     17c:	e24dd024 	sub	sp, sp, #36	; 0x24
     180:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     184:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     188:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     18c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     190:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     194:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     198:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     19c:	e55b300d 	ldrb	r3, [fp, #-13]
     1a0:	e1a02c03 	lsl	r2, r3, #24
     1a4:	e55b300d 	ldrb	r3, [fp, #-13]
     1a8:	e1a03803 	lsl	r3, r3, #16
     1ac:	e1822003 	orr	r2, r2, r3
     1b0:	e55b300d 	ldrb	r3, [fp, #-13]
     1b4:	e1a03403 	lsl	r3, r3, #8
     1b8:	e1822003 	orr	r2, r2, r3
     1bc:	e55b300d 	ldrb	r3, [fp, #-13]
     1c0:	e1823003 	orr	r3, r2, r3
     1c4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     1c8:	ea000008 	b	1f0 <memset+0x7c>
		*p = c;
     1cc:	e51b3008 	ldr	r3, [fp, #-8]
     1d0:	e55b200d 	ldrb	r2, [fp, #-13]
     1d4:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     1d8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     1dc:	e2433001 	sub	r3, r3, #1
     1e0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     1e4:	e51b3008 	ldr	r3, [fp, #-8]
     1e8:	e2833001 	add	r3, r3, #1
     1ec:	e50b3008 	str	r3, [fp, #-8]
     1f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     1f4:	e3530000 	cmp	r3, #0
     1f8:	0a000003 	beq	20c <memset+0x98>
     1fc:	e51b3008 	ldr	r3, [fp, #-8]
     200:	e2033003 	and	r3, r3, #3
     204:	e3530000 	cmp	r3, #0
     208:	1affffef 	bne	1cc <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     20c:	e51b3008 	ldr	r3, [fp, #-8]
     210:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     214:	ea000008 	b	23c <memset+0xc8>
		*p4 = val;
     218:	e51b300c 	ldr	r3, [fp, #-12]
     21c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     220:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     224:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     228:	e2433004 	sub	r3, r3, #4
     22c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     230:	e51b300c 	ldr	r3, [fp, #-12]
     234:	e2833004 	add	r3, r3, #4
     238:	e50b300c 	str	r3, [fp, #-12]
     23c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     240:	e3530003 	cmp	r3, #3
     244:	8afffff3 	bhi	218 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     248:	e51b300c 	ldr	r3, [fp, #-12]
     24c:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     250:	ea000008 	b	278 <memset+0x104>
		*p = c;
     254:	e51b3008 	ldr	r3, [fp, #-8]
     258:	e55b200d 	ldrb	r2, [fp, #-13]
     25c:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     260:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     264:	e2433001 	sub	r3, r3, #1
     268:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     26c:	e51b3008 	ldr	r3, [fp, #-8]
     270:	e2833001 	add	r3, r3, #1
     274:	e50b3008 	str	r3, [fp, #-8]
     278:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     27c:	e3530000 	cmp	r3, #0
     280:	1afffff3 	bne	254 <memset+0xe0>
		*p = c;
	}

	return dst;
     284:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     288:	e1a00003 	mov	r0, r3
     28c:	e28bd000 	add	sp, fp, #0
     290:	e8bd0800 	pop	{fp}
     294:	e12fff1e 	bx	lr

00000298 <strchr>:

char*
strchr(const char *s, char c)
{
     298:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     29c:	e28db000 	add	fp, sp, #0
     2a0:	e24dd00c 	sub	sp, sp, #12
     2a4:	e50b0008 	str	r0, [fp, #-8]
     2a8:	e1a03001 	mov	r3, r1
     2ac:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     2b0:	ea000009 	b	2dc <strchr+0x44>
        if(*s == c)
     2b4:	e51b3008 	ldr	r3, [fp, #-8]
     2b8:	e5d33000 	ldrb	r3, [r3]
     2bc:	e55b2009 	ldrb	r2, [fp, #-9]
     2c0:	e1520003 	cmp	r2, r3
     2c4:	1a000001 	bne	2d0 <strchr+0x38>
            return (char*)s;
     2c8:	e51b3008 	ldr	r3, [fp, #-8]
     2cc:	ea000007 	b	2f0 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     2d0:	e51b3008 	ldr	r3, [fp, #-8]
     2d4:	e2833001 	add	r3, r3, #1
     2d8:	e50b3008 	str	r3, [fp, #-8]
     2dc:	e51b3008 	ldr	r3, [fp, #-8]
     2e0:	e5d33000 	ldrb	r3, [r3]
     2e4:	e3530000 	cmp	r3, #0
     2e8:	1afffff1 	bne	2b4 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     2ec:	e3a03000 	mov	r3, #0
}
     2f0:	e1a00003 	mov	r0, r3
     2f4:	e28bd000 	add	sp, fp, #0
     2f8:	e8bd0800 	pop	{fp}
     2fc:	e12fff1e 	bx	lr

00000300 <gets>:

char*
gets(char *buf, int max)
{
     300:	e92d4800 	push	{fp, lr}
     304:	e28db004 	add	fp, sp, #4
     308:	e24dd018 	sub	sp, sp, #24
     30c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     310:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     314:	e3a03000 	mov	r3, #0
     318:	e50b3008 	str	r3, [fp, #-8]
     31c:	ea000016 	b	37c <gets+0x7c>
        cc = read(0, &c, 1);
     320:	e3a00000 	mov	r0, #0
     324:	e24b300d 	sub	r3, fp, #13
     328:	e1a01003 	mov	r1, r3
     32c:	e3a02001 	mov	r2, #1
     330:	eb0000a3 	bl	5c4 <read>
     334:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     338:	e51b300c 	ldr	r3, [fp, #-12]
     33c:	e3530000 	cmp	r3, #0
     340:	da000013 	ble	394 <gets+0x94>
            break;
        buf[i++] = c;
     344:	e51b3008 	ldr	r3, [fp, #-8]
     348:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     34c:	e0823003 	add	r3, r2, r3
     350:	e55b200d 	ldrb	r2, [fp, #-13]
     354:	e5c32000 	strb	r2, [r3]
     358:	e51b3008 	ldr	r3, [fp, #-8]
     35c:	e2833001 	add	r3, r3, #1
     360:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     364:	e55b300d 	ldrb	r3, [fp, #-13]
     368:	e353000a 	cmp	r3, #10
     36c:	0a000009 	beq	398 <gets+0x98>
     370:	e55b300d 	ldrb	r3, [fp, #-13]
     374:	e353000d 	cmp	r3, #13
     378:	0a000006 	beq	398 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     37c:	e51b3008 	ldr	r3, [fp, #-8]
     380:	e2832001 	add	r2, r3, #1
     384:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     388:	e1520003 	cmp	r2, r3
     38c:	baffffe3 	blt	320 <gets+0x20>
     390:	ea000000 	b	398 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     394:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     398:	e51b3008 	ldr	r3, [fp, #-8]
     39c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     3a0:	e0823003 	add	r3, r2, r3
     3a4:	e3a02000 	mov	r2, #0
     3a8:	e5c32000 	strb	r2, [r3]
    return buf;
     3ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     3b0:	e1a00003 	mov	r0, r3
     3b4:	e24bd004 	sub	sp, fp, #4
     3b8:	e8bd8800 	pop	{fp, pc}

000003bc <stat>:

int
stat(char *n, struct stat *st)
{
     3bc:	e92d4800 	push	{fp, lr}
     3c0:	e28db004 	add	fp, sp, #4
     3c4:	e24dd010 	sub	sp, sp, #16
     3c8:	e50b0010 	str	r0, [fp, #-16]
     3cc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     3d0:	e51b0010 	ldr	r0, [fp, #-16]
     3d4:	e3a01000 	mov	r1, #0
     3d8:	eb0000a6 	bl	678 <open>
     3dc:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     3e0:	e51b3008 	ldr	r3, [fp, #-8]
     3e4:	e3530000 	cmp	r3, #0
     3e8:	aa000001 	bge	3f4 <stat+0x38>
        return -1;
     3ec:	e3e03000 	mvn	r3, #0
     3f0:	ea000006 	b	410 <stat+0x54>
    r = fstat(fd, st);
     3f4:	e51b0008 	ldr	r0, [fp, #-8]
     3f8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     3fc:	eb0000b8 	bl	6e4 <fstat>
     400:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     404:	e51b0008 	ldr	r0, [fp, #-8]
     408:	eb00007f 	bl	60c <close>
    return r;
     40c:	e51b300c 	ldr	r3, [fp, #-12]
}
     410:	e1a00003 	mov	r0, r3
     414:	e24bd004 	sub	sp, fp, #4
     418:	e8bd8800 	pop	{fp, pc}

0000041c <atoi>:

int
atoi(const char *s)
{
     41c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     420:	e28db000 	add	fp, sp, #0
     424:	e24dd014 	sub	sp, sp, #20
     428:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     42c:	e3a03000 	mov	r3, #0
     430:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     434:	ea00000d 	b	470 <atoi+0x54>
        n = n*10 + *s++ - '0';
     438:	e51b2008 	ldr	r2, [fp, #-8]
     43c:	e1a03002 	mov	r3, r2
     440:	e1a03103 	lsl	r3, r3, #2
     444:	e0833002 	add	r3, r3, r2
     448:	e1a03083 	lsl	r3, r3, #1
     44c:	e1a02003 	mov	r2, r3
     450:	e51b3010 	ldr	r3, [fp, #-16]
     454:	e5d33000 	ldrb	r3, [r3]
     458:	e0823003 	add	r3, r2, r3
     45c:	e2433030 	sub	r3, r3, #48	; 0x30
     460:	e50b3008 	str	r3, [fp, #-8]
     464:	e51b3010 	ldr	r3, [fp, #-16]
     468:	e2833001 	add	r3, r3, #1
     46c:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     470:	e51b3010 	ldr	r3, [fp, #-16]
     474:	e5d33000 	ldrb	r3, [r3]
     478:	e353002f 	cmp	r3, #47	; 0x2f
     47c:	9a000003 	bls	490 <atoi+0x74>
     480:	e51b3010 	ldr	r3, [fp, #-16]
     484:	e5d33000 	ldrb	r3, [r3]
     488:	e3530039 	cmp	r3, #57	; 0x39
     48c:	9affffe9 	bls	438 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     490:	e51b3008 	ldr	r3, [fp, #-8]
}
     494:	e1a00003 	mov	r0, r3
     498:	e28bd000 	add	sp, fp, #0
     49c:	e8bd0800 	pop	{fp}
     4a0:	e12fff1e 	bx	lr

000004a4 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     4a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4a8:	e28db000 	add	fp, sp, #0
     4ac:	e24dd01c 	sub	sp, sp, #28
     4b0:	e50b0010 	str	r0, [fp, #-16]
     4b4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     4b8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     4bc:	e51b3010 	ldr	r3, [fp, #-16]
     4c0:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     4c4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     4c8:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     4cc:	ea000009 	b	4f8 <memmove+0x54>
        *dst++ = *src++;
     4d0:	e51b300c 	ldr	r3, [fp, #-12]
     4d4:	e5d32000 	ldrb	r2, [r3]
     4d8:	e51b3008 	ldr	r3, [fp, #-8]
     4dc:	e5c32000 	strb	r2, [r3]
     4e0:	e51b3008 	ldr	r3, [fp, #-8]
     4e4:	e2833001 	add	r3, r3, #1
     4e8:	e50b3008 	str	r3, [fp, #-8]
     4ec:	e51b300c 	ldr	r3, [fp, #-12]
     4f0:	e2833001 	add	r3, r3, #1
     4f4:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     4f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     4fc:	e3530000 	cmp	r3, #0
     500:	d3a03000 	movle	r3, #0
     504:	c3a03001 	movgt	r3, #1
     508:	e6ef3073 	uxtb	r3, r3
     50c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     510:	e2422001 	sub	r2, r2, #1
     514:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     518:	e3530000 	cmp	r3, #0
     51c:	1affffeb 	bne	4d0 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     520:	e51b3010 	ldr	r3, [fp, #-16]
}
     524:	e1a00003 	mov	r0, r3
     528:	e28bd000 	add	sp, fp, #0
     52c:	e8bd0800 	pop	{fp}
     530:	e12fff1e 	bx	lr

00000534 <fork>:
     534:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     538:	e1a04003 	mov	r4, r3
     53c:	e1a03002 	mov	r3, r2
     540:	e1a02001 	mov	r2, r1
     544:	e1a01000 	mov	r1, r0
     548:	e3a00001 	mov	r0, #1
     54c:	ef000000 	svc	0x00000000
     550:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     554:	e12fff1e 	bx	lr

00000558 <exit>:
     558:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     55c:	e1a04003 	mov	r4, r3
     560:	e1a03002 	mov	r3, r2
     564:	e1a02001 	mov	r2, r1
     568:	e1a01000 	mov	r1, r0
     56c:	e3a00002 	mov	r0, #2
     570:	ef000000 	svc	0x00000000
     574:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     578:	e12fff1e 	bx	lr

0000057c <wait>:
     57c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     580:	e1a04003 	mov	r4, r3
     584:	e1a03002 	mov	r3, r2
     588:	e1a02001 	mov	r2, r1
     58c:	e1a01000 	mov	r1, r0
     590:	e3a00003 	mov	r0, #3
     594:	ef000000 	svc	0x00000000
     598:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     59c:	e12fff1e 	bx	lr

000005a0 <pipe>:
     5a0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5a4:	e1a04003 	mov	r4, r3
     5a8:	e1a03002 	mov	r3, r2
     5ac:	e1a02001 	mov	r2, r1
     5b0:	e1a01000 	mov	r1, r0
     5b4:	e3a00004 	mov	r0, #4
     5b8:	ef000000 	svc	0x00000000
     5bc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5c0:	e12fff1e 	bx	lr

000005c4 <read>:
     5c4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5c8:	e1a04003 	mov	r4, r3
     5cc:	e1a03002 	mov	r3, r2
     5d0:	e1a02001 	mov	r2, r1
     5d4:	e1a01000 	mov	r1, r0
     5d8:	e3a00005 	mov	r0, #5
     5dc:	ef000000 	svc	0x00000000
     5e0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5e4:	e12fff1e 	bx	lr

000005e8 <write>:
     5e8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5ec:	e1a04003 	mov	r4, r3
     5f0:	e1a03002 	mov	r3, r2
     5f4:	e1a02001 	mov	r2, r1
     5f8:	e1a01000 	mov	r1, r0
     5fc:	e3a00010 	mov	r0, #16
     600:	ef000000 	svc	0x00000000
     604:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     608:	e12fff1e 	bx	lr

0000060c <close>:
     60c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     610:	e1a04003 	mov	r4, r3
     614:	e1a03002 	mov	r3, r2
     618:	e1a02001 	mov	r2, r1
     61c:	e1a01000 	mov	r1, r0
     620:	e3a00015 	mov	r0, #21
     624:	ef000000 	svc	0x00000000
     628:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     62c:	e12fff1e 	bx	lr

00000630 <kill>:
     630:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     634:	e1a04003 	mov	r4, r3
     638:	e1a03002 	mov	r3, r2
     63c:	e1a02001 	mov	r2, r1
     640:	e1a01000 	mov	r1, r0
     644:	e3a00006 	mov	r0, #6
     648:	ef000000 	svc	0x00000000
     64c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     650:	e12fff1e 	bx	lr

00000654 <exec>:
     654:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     658:	e1a04003 	mov	r4, r3
     65c:	e1a03002 	mov	r3, r2
     660:	e1a02001 	mov	r2, r1
     664:	e1a01000 	mov	r1, r0
     668:	e3a00007 	mov	r0, #7
     66c:	ef000000 	svc	0x00000000
     670:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     674:	e12fff1e 	bx	lr

00000678 <open>:
     678:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     67c:	e1a04003 	mov	r4, r3
     680:	e1a03002 	mov	r3, r2
     684:	e1a02001 	mov	r2, r1
     688:	e1a01000 	mov	r1, r0
     68c:	e3a0000f 	mov	r0, #15
     690:	ef000000 	svc	0x00000000
     694:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     698:	e12fff1e 	bx	lr

0000069c <mknod>:
     69c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6a0:	e1a04003 	mov	r4, r3
     6a4:	e1a03002 	mov	r3, r2
     6a8:	e1a02001 	mov	r2, r1
     6ac:	e1a01000 	mov	r1, r0
     6b0:	e3a00011 	mov	r0, #17
     6b4:	ef000000 	svc	0x00000000
     6b8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6bc:	e12fff1e 	bx	lr

000006c0 <unlink>:
     6c0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6c4:	e1a04003 	mov	r4, r3
     6c8:	e1a03002 	mov	r3, r2
     6cc:	e1a02001 	mov	r2, r1
     6d0:	e1a01000 	mov	r1, r0
     6d4:	e3a00012 	mov	r0, #18
     6d8:	ef000000 	svc	0x00000000
     6dc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6e0:	e12fff1e 	bx	lr

000006e4 <fstat>:
     6e4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6e8:	e1a04003 	mov	r4, r3
     6ec:	e1a03002 	mov	r3, r2
     6f0:	e1a02001 	mov	r2, r1
     6f4:	e1a01000 	mov	r1, r0
     6f8:	e3a00008 	mov	r0, #8
     6fc:	ef000000 	svc	0x00000000
     700:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     704:	e12fff1e 	bx	lr

00000708 <link>:
     708:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     70c:	e1a04003 	mov	r4, r3
     710:	e1a03002 	mov	r3, r2
     714:	e1a02001 	mov	r2, r1
     718:	e1a01000 	mov	r1, r0
     71c:	e3a00013 	mov	r0, #19
     720:	ef000000 	svc	0x00000000
     724:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     728:	e12fff1e 	bx	lr

0000072c <mkdir>:
     72c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     730:	e1a04003 	mov	r4, r3
     734:	e1a03002 	mov	r3, r2
     738:	e1a02001 	mov	r2, r1
     73c:	e1a01000 	mov	r1, r0
     740:	e3a00014 	mov	r0, #20
     744:	ef000000 	svc	0x00000000
     748:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     74c:	e12fff1e 	bx	lr

00000750 <chdir>:
     750:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     754:	e1a04003 	mov	r4, r3
     758:	e1a03002 	mov	r3, r2
     75c:	e1a02001 	mov	r2, r1
     760:	e1a01000 	mov	r1, r0
     764:	e3a00009 	mov	r0, #9
     768:	ef000000 	svc	0x00000000
     76c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     770:	e12fff1e 	bx	lr

00000774 <dup>:
     774:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     778:	e1a04003 	mov	r4, r3
     77c:	e1a03002 	mov	r3, r2
     780:	e1a02001 	mov	r2, r1
     784:	e1a01000 	mov	r1, r0
     788:	e3a0000a 	mov	r0, #10
     78c:	ef000000 	svc	0x00000000
     790:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     794:	e12fff1e 	bx	lr

00000798 <getpid>:
     798:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     79c:	e1a04003 	mov	r4, r3
     7a0:	e1a03002 	mov	r3, r2
     7a4:	e1a02001 	mov	r2, r1
     7a8:	e1a01000 	mov	r1, r0
     7ac:	e3a0000b 	mov	r0, #11
     7b0:	ef000000 	svc	0x00000000
     7b4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7b8:	e12fff1e 	bx	lr

000007bc <sbrk>:
     7bc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7c0:	e1a04003 	mov	r4, r3
     7c4:	e1a03002 	mov	r3, r2
     7c8:	e1a02001 	mov	r2, r1
     7cc:	e1a01000 	mov	r1, r0
     7d0:	e3a0000c 	mov	r0, #12
     7d4:	ef000000 	svc	0x00000000
     7d8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7dc:	e12fff1e 	bx	lr

000007e0 <sleep>:
     7e0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7e4:	e1a04003 	mov	r4, r3
     7e8:	e1a03002 	mov	r3, r2
     7ec:	e1a02001 	mov	r2, r1
     7f0:	e1a01000 	mov	r1, r0
     7f4:	e3a0000d 	mov	r0, #13
     7f8:	ef000000 	svc	0x00000000
     7fc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     800:	e12fff1e 	bx	lr

00000804 <uptime>:
     804:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     808:	e1a04003 	mov	r4, r3
     80c:	e1a03002 	mov	r3, r2
     810:	e1a02001 	mov	r2, r1
     814:	e1a01000 	mov	r1, r0
     818:	e3a0000e 	mov	r0, #14
     81c:	ef000000 	svc	0x00000000
     820:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     824:	e12fff1e 	bx	lr

00000828 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     828:	e92d4800 	push	{fp, lr}
     82c:	e28db004 	add	fp, sp, #4
     830:	e24dd008 	sub	sp, sp, #8
     834:	e50b0008 	str	r0, [fp, #-8]
     838:	e1a03001 	mov	r3, r1
     83c:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     840:	e51b0008 	ldr	r0, [fp, #-8]
     844:	e24b3009 	sub	r3, fp, #9
     848:	e1a01003 	mov	r1, r3
     84c:	e3a02001 	mov	r2, #1
     850:	ebffff64 	bl	5e8 <write>
}
     854:	e24bd004 	sub	sp, fp, #4
     858:	e8bd8800 	pop	{fp, pc}

0000085c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     85c:	e92d4800 	push	{fp, lr}
     860:	e28db004 	add	fp, sp, #4
     864:	e24dd030 	sub	sp, sp, #48	; 0x30
     868:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     86c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     870:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     874:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     878:	e3a03000 	mov	r3, #0
     87c:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     880:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     884:	e3530000 	cmp	r3, #0
     888:	0a000008 	beq	8b0 <printint+0x54>
     88c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     890:	e3530000 	cmp	r3, #0
     894:	aa000005 	bge	8b0 <printint+0x54>
        neg = 1;
     898:	e3a03001 	mov	r3, #1
     89c:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     8a0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     8a4:	e2633000 	rsb	r3, r3, #0
     8a8:	e50b3010 	str	r3, [fp, #-16]
     8ac:	ea000001 	b	8b8 <printint+0x5c>
    } else {
        x = xx;
     8b0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     8b4:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     8b8:	e3a03000 	mov	r3, #0
     8bc:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     8c0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     8c4:	e51b2010 	ldr	r2, [fp, #-16]
     8c8:	e1a00002 	mov	r0, r2
     8cc:	e1a01003 	mov	r1, r3
     8d0:	eb0001e5 	bl	106c <__aeabi_uidivmod>
     8d4:	e1a03001 	mov	r3, r1
     8d8:	e1a02003 	mov	r2, r3
     8dc:	e3013098 	movw	r3, #4248	; 0x1098
     8e0:	e3403000 	movt	r3, #0
     8e4:	e7d32002 	ldrb	r2, [r3, r2]
     8e8:	e3e0001b 	mvn	r0, #27
     8ec:	e51b3008 	ldr	r3, [fp, #-8]
     8f0:	e24bc004 	sub	ip, fp, #4
     8f4:	e08c1003 	add	r1, ip, r3
     8f8:	e1a03000 	mov	r3, r0
     8fc:	e0813003 	add	r3, r1, r3
     900:	e5c32000 	strb	r2, [r3]
     904:	e51b3008 	ldr	r3, [fp, #-8]
     908:	e2833001 	add	r3, r3, #1
     90c:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     910:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     914:	e51b0010 	ldr	r0, [fp, #-16]
     918:	e1a01003 	mov	r1, r3
     91c:	eb000195 	bl	f78 <__aeabi_uidiv>
     920:	e1a03000 	mov	r3, r0
     924:	e50b3010 	str	r3, [fp, #-16]
     928:	e51b3010 	ldr	r3, [fp, #-16]
     92c:	e3530000 	cmp	r3, #0
     930:	1affffe2 	bne	8c0 <printint+0x64>
    if(neg)
     934:	e51b300c 	ldr	r3, [fp, #-12]
     938:	e3530000 	cmp	r3, #0
     93c:	0a000015 	beq	998 <printint+0x13c>
        buf[i++] = '-';
     940:	e3e0101b 	mvn	r1, #27
     944:	e51b3008 	ldr	r3, [fp, #-8]
     948:	e24b0004 	sub	r0, fp, #4
     94c:	e0802003 	add	r2, r0, r3
     950:	e1a03001 	mov	r3, r1
     954:	e0823003 	add	r3, r2, r3
     958:	e3a0202d 	mov	r2, #45	; 0x2d
     95c:	e5c32000 	strb	r2, [r3]
     960:	e51b3008 	ldr	r3, [fp, #-8]
     964:	e2833001 	add	r3, r3, #1
     968:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     96c:	ea000009 	b	998 <printint+0x13c>
        putc(fd, buf[i]);
     970:	e3e0101b 	mvn	r1, #27
     974:	e51b3008 	ldr	r3, [fp, #-8]
     978:	e24bc004 	sub	ip, fp, #4
     97c:	e08c2003 	add	r2, ip, r3
     980:	e1a03001 	mov	r3, r1
     984:	e0823003 	add	r3, r2, r3
     988:	e5d33000 	ldrb	r3, [r3]
     98c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     990:	e1a01003 	mov	r1, r3
     994:	ebffffa3 	bl	828 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     998:	e51b3008 	ldr	r3, [fp, #-8]
     99c:	e2433001 	sub	r3, r3, #1
     9a0:	e50b3008 	str	r3, [fp, #-8]
     9a4:	e51b3008 	ldr	r3, [fp, #-8]
     9a8:	e3530000 	cmp	r3, #0
     9ac:	aaffffef 	bge	970 <printint+0x114>
        putc(fd, buf[i]);
}
     9b0:	e24bd004 	sub	sp, fp, #4
     9b4:	e8bd8800 	pop	{fp, pc}

000009b8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     9b8:	e92d000e 	push	{r1, r2, r3}
     9bc:	e92d4800 	push	{fp, lr}
     9c0:	e28db004 	add	fp, sp, #4
     9c4:	e24dd024 	sub	sp, sp, #36	; 0x24
     9c8:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     9cc:	e3a03000 	mov	r3, #0
     9d0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     9d4:	e28b3008 	add	r3, fp, #8
     9d8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     9dc:	e3a03000 	mov	r3, #0
     9e0:	e50b3010 	str	r3, [fp, #-16]
     9e4:	ea000077 	b	bc8 <printf+0x210>
        c = fmt[i] & 0xff;
     9e8:	e59b2004 	ldr	r2, [fp, #4]
     9ec:	e51b3010 	ldr	r3, [fp, #-16]
     9f0:	e0823003 	add	r3, r2, r3
     9f4:	e5d33000 	ldrb	r3, [r3]
     9f8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     9fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a00:	e3530000 	cmp	r3, #0
     a04:	1a00000b 	bne	a38 <printf+0x80>
            if(c == '%'){
     a08:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a0c:	e3530025 	cmp	r3, #37	; 0x25
     a10:	1a000002 	bne	a20 <printf+0x68>
                state = '%';
     a14:	e3a03025 	mov	r3, #37	; 0x25
     a18:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     a1c:	ea000066 	b	bbc <printf+0x204>
            } else {
                putc(fd, c);
     a20:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a24:	e6ef3073 	uxtb	r3, r3
     a28:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     a2c:	e1a01003 	mov	r1, r3
     a30:	ebffff7c 	bl	828 <putc>
     a34:	ea000060 	b	bbc <printf+0x204>
            }
        } else if(state == '%'){
     a38:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a3c:	e3530025 	cmp	r3, #37	; 0x25
     a40:	1a00005d 	bne	bbc <printf+0x204>
            if(c == 'd'){
     a44:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a48:	e3530064 	cmp	r3, #100	; 0x64
     a4c:	1a00000a 	bne	a7c <printf+0xc4>
                printint(fd, *ap, 10, 1);
     a50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     a54:	e5933000 	ldr	r3, [r3]
     a58:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     a5c:	e1a01003 	mov	r1, r3
     a60:	e3a0200a 	mov	r2, #10
     a64:	e3a03001 	mov	r3, #1
     a68:	ebffff7b 	bl	85c <printint>
                ap++;
     a6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     a70:	e2833004 	add	r3, r3, #4
     a74:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     a78:	ea00004d 	b	bb4 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     a7c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a80:	e3530078 	cmp	r3, #120	; 0x78
     a84:	0a000002 	beq	a94 <printf+0xdc>
     a88:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a8c:	e3530070 	cmp	r3, #112	; 0x70
     a90:	1a00000a 	bne	ac0 <printf+0x108>
                printint(fd, *ap, 16, 0);
     a94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     a98:	e5933000 	ldr	r3, [r3]
     a9c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     aa0:	e1a01003 	mov	r1, r3
     aa4:	e3a02010 	mov	r2, #16
     aa8:	e3a03000 	mov	r3, #0
     aac:	ebffff6a 	bl	85c <printint>
                ap++;
     ab0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ab4:	e2833004 	add	r3, r3, #4
     ab8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     abc:	ea00003c 	b	bb4 <printf+0x1fc>
            } else if(c == 's'){
     ac0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ac4:	e3530073 	cmp	r3, #115	; 0x73
     ac8:	1a00001b 	bne	b3c <printf+0x184>
                s = (char*)*ap;
     acc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ad0:	e5933000 	ldr	r3, [r3]
     ad4:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     ad8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     adc:	e2833004 	add	r3, r3, #4
     ae0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     ae4:	e51b300c 	ldr	r3, [fp, #-12]
     ae8:	e3530000 	cmp	r3, #0
     aec:	1a00000c 	bne	b24 <printf+0x16c>
                    s = "(null)";
     af0:	e3013090 	movw	r3, #4240	; 0x1090
     af4:	e3403000 	movt	r3, #0
     af8:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     afc:	ea000008 	b	b24 <printf+0x16c>
                    putc(fd, *s);
     b00:	e51b300c 	ldr	r3, [fp, #-12]
     b04:	e5d33000 	ldrb	r3, [r3]
     b08:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b0c:	e1a01003 	mov	r1, r3
     b10:	ebffff44 	bl	828 <putc>
                    s++;
     b14:	e51b300c 	ldr	r3, [fp, #-12]
     b18:	e2833001 	add	r3, r3, #1
     b1c:	e50b300c 	str	r3, [fp, #-12]
     b20:	ea000000 	b	b28 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     b24:	e1a00000 	nop			; (mov r0, r0)
     b28:	e51b300c 	ldr	r3, [fp, #-12]
     b2c:	e5d33000 	ldrb	r3, [r3]
     b30:	e3530000 	cmp	r3, #0
     b34:	1afffff1 	bne	b00 <printf+0x148>
     b38:	ea00001d 	b	bb4 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     b3c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b40:	e3530063 	cmp	r3, #99	; 0x63
     b44:	1a000009 	bne	b70 <printf+0x1b8>
                putc(fd, *ap);
     b48:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b4c:	e5933000 	ldr	r3, [r3]
     b50:	e6ef3073 	uxtb	r3, r3
     b54:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b58:	e1a01003 	mov	r1, r3
     b5c:	ebffff31 	bl	828 <putc>
                ap++;
     b60:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b64:	e2833004 	add	r3, r3, #4
     b68:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b6c:	ea000010 	b	bb4 <printf+0x1fc>
            } else if(c == '%'){
     b70:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b74:	e3530025 	cmp	r3, #37	; 0x25
     b78:	1a000005 	bne	b94 <printf+0x1dc>
                putc(fd, c);
     b7c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b80:	e6ef3073 	uxtb	r3, r3
     b84:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b88:	e1a01003 	mov	r1, r3
     b8c:	ebffff25 	bl	828 <putc>
     b90:	ea000007 	b	bb4 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     b94:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b98:	e3a01025 	mov	r1, #37	; 0x25
     b9c:	ebffff21 	bl	828 <putc>
                putc(fd, c);
     ba0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ba4:	e6ef3073 	uxtb	r3, r3
     ba8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bac:	e1a01003 	mov	r1, r3
     bb0:	ebffff1c 	bl	828 <putc>
            }
            state = 0;
     bb4:	e3a03000 	mov	r3, #0
     bb8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     bbc:	e51b3010 	ldr	r3, [fp, #-16]
     bc0:	e2833001 	add	r3, r3, #1
     bc4:	e50b3010 	str	r3, [fp, #-16]
     bc8:	e59b2004 	ldr	r2, [fp, #4]
     bcc:	e51b3010 	ldr	r3, [fp, #-16]
     bd0:	e0823003 	add	r3, r2, r3
     bd4:	e5d33000 	ldrb	r3, [r3]
     bd8:	e3530000 	cmp	r3, #0
     bdc:	1affff81 	bne	9e8 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     be0:	e24bd004 	sub	sp, fp, #4
     be4:	e8bd4800 	pop	{fp, lr}
     be8:	e28dd00c 	add	sp, sp, #12
     bec:	e12fff1e 	bx	lr

00000bf0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     bf0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bf4:	e28db000 	add	fp, sp, #0
     bf8:	e24dd014 	sub	sp, sp, #20
     bfc:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     c00:	e51b3010 	ldr	r3, [fp, #-16]
     c04:	e2433008 	sub	r3, r3, #8
     c08:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c0c:	e30130b4 	movw	r3, #4276	; 0x10b4
     c10:	e3403000 	movt	r3, #0
     c14:	e5933000 	ldr	r3, [r3]
     c18:	e50b3008 	str	r3, [fp, #-8]
     c1c:	ea000010 	b	c64 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c20:	e51b3008 	ldr	r3, [fp, #-8]
     c24:	e5932000 	ldr	r2, [r3]
     c28:	e51b3008 	ldr	r3, [fp, #-8]
     c2c:	e1520003 	cmp	r2, r3
     c30:	8a000008 	bhi	c58 <free+0x68>
     c34:	e51b200c 	ldr	r2, [fp, #-12]
     c38:	e51b3008 	ldr	r3, [fp, #-8]
     c3c:	e1520003 	cmp	r2, r3
     c40:	8a000010 	bhi	c88 <free+0x98>
     c44:	e51b3008 	ldr	r3, [fp, #-8]
     c48:	e5932000 	ldr	r2, [r3]
     c4c:	e51b300c 	ldr	r3, [fp, #-12]
     c50:	e1520003 	cmp	r2, r3
     c54:	8a00000b 	bhi	c88 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c58:	e51b3008 	ldr	r3, [fp, #-8]
     c5c:	e5933000 	ldr	r3, [r3]
     c60:	e50b3008 	str	r3, [fp, #-8]
     c64:	e51b200c 	ldr	r2, [fp, #-12]
     c68:	e51b3008 	ldr	r3, [fp, #-8]
     c6c:	e1520003 	cmp	r2, r3
     c70:	9affffea 	bls	c20 <free+0x30>
     c74:	e51b3008 	ldr	r3, [fp, #-8]
     c78:	e5932000 	ldr	r2, [r3]
     c7c:	e51b300c 	ldr	r3, [fp, #-12]
     c80:	e1520003 	cmp	r2, r3
     c84:	9affffe5 	bls	c20 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     c88:	e51b300c 	ldr	r3, [fp, #-12]
     c8c:	e5933004 	ldr	r3, [r3, #4]
     c90:	e1a03183 	lsl	r3, r3, #3
     c94:	e51b200c 	ldr	r2, [fp, #-12]
     c98:	e0822003 	add	r2, r2, r3
     c9c:	e51b3008 	ldr	r3, [fp, #-8]
     ca0:	e5933000 	ldr	r3, [r3]
     ca4:	e1520003 	cmp	r2, r3
     ca8:	1a00000d 	bne	ce4 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     cac:	e51b300c 	ldr	r3, [fp, #-12]
     cb0:	e5932004 	ldr	r2, [r3, #4]
     cb4:	e51b3008 	ldr	r3, [fp, #-8]
     cb8:	e5933000 	ldr	r3, [r3]
     cbc:	e5933004 	ldr	r3, [r3, #4]
     cc0:	e0822003 	add	r2, r2, r3
     cc4:	e51b300c 	ldr	r3, [fp, #-12]
     cc8:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     ccc:	e51b3008 	ldr	r3, [fp, #-8]
     cd0:	e5933000 	ldr	r3, [r3]
     cd4:	e5932000 	ldr	r2, [r3]
     cd8:	e51b300c 	ldr	r3, [fp, #-12]
     cdc:	e5832000 	str	r2, [r3]
     ce0:	ea000003 	b	cf4 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     ce4:	e51b3008 	ldr	r3, [fp, #-8]
     ce8:	e5932000 	ldr	r2, [r3]
     cec:	e51b300c 	ldr	r3, [fp, #-12]
     cf0:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     cf4:	e51b3008 	ldr	r3, [fp, #-8]
     cf8:	e5933004 	ldr	r3, [r3, #4]
     cfc:	e1a03183 	lsl	r3, r3, #3
     d00:	e51b2008 	ldr	r2, [fp, #-8]
     d04:	e0822003 	add	r2, r2, r3
     d08:	e51b300c 	ldr	r3, [fp, #-12]
     d0c:	e1520003 	cmp	r2, r3
     d10:	1a00000b 	bne	d44 <free+0x154>
        p->s.size += bp->s.size;
     d14:	e51b3008 	ldr	r3, [fp, #-8]
     d18:	e5932004 	ldr	r2, [r3, #4]
     d1c:	e51b300c 	ldr	r3, [fp, #-12]
     d20:	e5933004 	ldr	r3, [r3, #4]
     d24:	e0822003 	add	r2, r2, r3
     d28:	e51b3008 	ldr	r3, [fp, #-8]
     d2c:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     d30:	e51b300c 	ldr	r3, [fp, #-12]
     d34:	e5932000 	ldr	r2, [r3]
     d38:	e51b3008 	ldr	r3, [fp, #-8]
     d3c:	e5832000 	str	r2, [r3]
     d40:	ea000002 	b	d50 <free+0x160>
    } else
        p->s.ptr = bp;
     d44:	e51b3008 	ldr	r3, [fp, #-8]
     d48:	e51b200c 	ldr	r2, [fp, #-12]
     d4c:	e5832000 	str	r2, [r3]
    freep = p;
     d50:	e30130b4 	movw	r3, #4276	; 0x10b4
     d54:	e3403000 	movt	r3, #0
     d58:	e51b2008 	ldr	r2, [fp, #-8]
     d5c:	e5832000 	str	r2, [r3]
}
     d60:	e28bd000 	add	sp, fp, #0
     d64:	e8bd0800 	pop	{fp}
     d68:	e12fff1e 	bx	lr

00000d6c <morecore>:

static Header*
morecore(uint nu)
{
     d6c:	e92d4800 	push	{fp, lr}
     d70:	e28db004 	add	fp, sp, #4
     d74:	e24dd010 	sub	sp, sp, #16
     d78:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     d7c:	e51b2010 	ldr	r2, [fp, #-16]
     d80:	e3003fff 	movw	r3, #4095	; 0xfff
     d84:	e1520003 	cmp	r2, r3
     d88:	8a000001 	bhi	d94 <morecore+0x28>
        nu = 4096;
     d8c:	e3a03a01 	mov	r3, #4096	; 0x1000
     d90:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     d94:	e51b3010 	ldr	r3, [fp, #-16]
     d98:	e1a03183 	lsl	r3, r3, #3
     d9c:	e1a00003 	mov	r0, r3
     da0:	ebfffe85 	bl	7bc <sbrk>
     da4:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     da8:	e51b3008 	ldr	r3, [fp, #-8]
     dac:	e3730001 	cmn	r3, #1
     db0:	1a000001 	bne	dbc <morecore+0x50>
        return 0;
     db4:	e3a03000 	mov	r3, #0
     db8:	ea00000b 	b	dec <morecore+0x80>
    hp = (Header*)p;
     dbc:	e51b3008 	ldr	r3, [fp, #-8]
     dc0:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     dc4:	e51b300c 	ldr	r3, [fp, #-12]
     dc8:	e51b2010 	ldr	r2, [fp, #-16]
     dcc:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     dd0:	e51b300c 	ldr	r3, [fp, #-12]
     dd4:	e2833008 	add	r3, r3, #8
     dd8:	e1a00003 	mov	r0, r3
     ddc:	ebffff83 	bl	bf0 <free>
    return freep;
     de0:	e30130b4 	movw	r3, #4276	; 0x10b4
     de4:	e3403000 	movt	r3, #0
     de8:	e5933000 	ldr	r3, [r3]
}
     dec:	e1a00003 	mov	r0, r3
     df0:	e24bd004 	sub	sp, fp, #4
     df4:	e8bd8800 	pop	{fp, pc}

00000df8 <malloc>:

void*
malloc(uint nbytes)
{
     df8:	e92d4800 	push	{fp, lr}
     dfc:	e28db004 	add	fp, sp, #4
     e00:	e24dd018 	sub	sp, sp, #24
     e04:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e08:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e0c:	e2833007 	add	r3, r3, #7
     e10:	e1a031a3 	lsr	r3, r3, #3
     e14:	e2833001 	add	r3, r3, #1
     e18:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     e1c:	e30130b4 	movw	r3, #4276	; 0x10b4
     e20:	e3403000 	movt	r3, #0
     e24:	e5933000 	ldr	r3, [r3]
     e28:	e50b300c 	str	r3, [fp, #-12]
     e2c:	e51b300c 	ldr	r3, [fp, #-12]
     e30:	e3530000 	cmp	r3, #0
     e34:	1a000010 	bne	e7c <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     e38:	e30130ac 	movw	r3, #4268	; 0x10ac
     e3c:	e3403000 	movt	r3, #0
     e40:	e50b300c 	str	r3, [fp, #-12]
     e44:	e30130b4 	movw	r3, #4276	; 0x10b4
     e48:	e3403000 	movt	r3, #0
     e4c:	e51b200c 	ldr	r2, [fp, #-12]
     e50:	e5832000 	str	r2, [r3]
     e54:	e30130b4 	movw	r3, #4276	; 0x10b4
     e58:	e3403000 	movt	r3, #0
     e5c:	e5932000 	ldr	r2, [r3]
     e60:	e30130ac 	movw	r3, #4268	; 0x10ac
     e64:	e3403000 	movt	r3, #0
     e68:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     e6c:	e30130ac 	movw	r3, #4268	; 0x10ac
     e70:	e3403000 	movt	r3, #0
     e74:	e3a02000 	mov	r2, #0
     e78:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e7c:	e51b300c 	ldr	r3, [fp, #-12]
     e80:	e5933000 	ldr	r3, [r3]
     e84:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     e88:	e51b3008 	ldr	r3, [fp, #-8]
     e8c:	e5932004 	ldr	r2, [r3, #4]
     e90:	e51b3010 	ldr	r3, [fp, #-16]
     e94:	e1520003 	cmp	r2, r3
     e98:	3a00001f 	bcc	f1c <malloc+0x124>
            if(p->s.size == nunits)
     e9c:	e51b3008 	ldr	r3, [fp, #-8]
     ea0:	e5932004 	ldr	r2, [r3, #4]
     ea4:	e51b3010 	ldr	r3, [fp, #-16]
     ea8:	e1520003 	cmp	r2, r3
     eac:	1a000004 	bne	ec4 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     eb0:	e51b3008 	ldr	r3, [fp, #-8]
     eb4:	e5932000 	ldr	r2, [r3]
     eb8:	e51b300c 	ldr	r3, [fp, #-12]
     ebc:	e5832000 	str	r2, [r3]
     ec0:	ea00000e 	b	f00 <malloc+0x108>
            else {
                p->s.size -= nunits;
     ec4:	e51b3008 	ldr	r3, [fp, #-8]
     ec8:	e5932004 	ldr	r2, [r3, #4]
     ecc:	e51b3010 	ldr	r3, [fp, #-16]
     ed0:	e0632002 	rsb	r2, r3, r2
     ed4:	e51b3008 	ldr	r3, [fp, #-8]
     ed8:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     edc:	e51b3008 	ldr	r3, [fp, #-8]
     ee0:	e5933004 	ldr	r3, [r3, #4]
     ee4:	e1a03183 	lsl	r3, r3, #3
     ee8:	e51b2008 	ldr	r2, [fp, #-8]
     eec:	e0823003 	add	r3, r2, r3
     ef0:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     ef4:	e51b3008 	ldr	r3, [fp, #-8]
     ef8:	e51b2010 	ldr	r2, [fp, #-16]
     efc:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     f00:	e30130b4 	movw	r3, #4276	; 0x10b4
     f04:	e3403000 	movt	r3, #0
     f08:	e51b200c 	ldr	r2, [fp, #-12]
     f0c:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     f10:	e51b3008 	ldr	r3, [fp, #-8]
     f14:	e2833008 	add	r3, r3, #8
     f18:	ea000013 	b	f6c <malloc+0x174>
        }
        if(p == freep)
     f1c:	e30130b4 	movw	r3, #4276	; 0x10b4
     f20:	e3403000 	movt	r3, #0
     f24:	e5933000 	ldr	r3, [r3]
     f28:	e51b2008 	ldr	r2, [fp, #-8]
     f2c:	e1520003 	cmp	r2, r3
     f30:	1a000007 	bne	f54 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     f34:	e51b0010 	ldr	r0, [fp, #-16]
     f38:	ebffff8b 	bl	d6c <morecore>
     f3c:	e50b0008 	str	r0, [fp, #-8]
     f40:	e51b3008 	ldr	r3, [fp, #-8]
     f44:	e3530000 	cmp	r3, #0
     f48:	1a000001 	bne	f54 <malloc+0x15c>
                return 0;
     f4c:	e3a03000 	mov	r3, #0
     f50:	ea000005 	b	f6c <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f54:	e51b3008 	ldr	r3, [fp, #-8]
     f58:	e50b300c 	str	r3, [fp, #-12]
     f5c:	e51b3008 	ldr	r3, [fp, #-8]
     f60:	e5933000 	ldr	r3, [r3]
     f64:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
     f68:	eaffffc6 	b	e88 <malloc+0x90>
}
     f6c:	e1a00003 	mov	r0, r3
     f70:	e24bd004 	sub	sp, fp, #4
     f74:	e8bd8800 	pop	{fp, pc}

00000f78 <__aeabi_uidiv>:
     f78:	e2512001 	subs	r2, r1, #1
     f7c:	012fff1e 	bxeq	lr
     f80:	3a000036 	bcc	1060 <__aeabi_uidiv+0xe8>
     f84:	e1500001 	cmp	r0, r1
     f88:	9a000022 	bls	1018 <__aeabi_uidiv+0xa0>
     f8c:	e1110002 	tst	r1, r2
     f90:	0a000023 	beq	1024 <__aeabi_uidiv+0xac>
     f94:	e311020e 	tst	r1, #-536870912	; 0xe0000000
     f98:	01a01181 	lsleq	r1, r1, #3
     f9c:	03a03008 	moveq	r3, #8
     fa0:	13a03001 	movne	r3, #1
     fa4:	e3510201 	cmp	r1, #268435456	; 0x10000000
     fa8:	31510000 	cmpcc	r1, r0
     fac:	31a01201 	lslcc	r1, r1, #4
     fb0:	31a03203 	lslcc	r3, r3, #4
     fb4:	3afffffa 	bcc	fa4 <__aeabi_uidiv+0x2c>
     fb8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
     fbc:	31510000 	cmpcc	r1, r0
     fc0:	31a01081 	lslcc	r1, r1, #1
     fc4:	31a03083 	lslcc	r3, r3, #1
     fc8:	3afffffa 	bcc	fb8 <__aeabi_uidiv+0x40>
     fcc:	e3a02000 	mov	r2, #0
     fd0:	e1500001 	cmp	r0, r1
     fd4:	20400001 	subcs	r0, r0, r1
     fd8:	21822003 	orrcs	r2, r2, r3
     fdc:	e15000a1 	cmp	r0, r1, lsr #1
     fe0:	204000a1 	subcs	r0, r0, r1, lsr #1
     fe4:	218220a3 	orrcs	r2, r2, r3, lsr #1
     fe8:	e1500121 	cmp	r0, r1, lsr #2
     fec:	20400121 	subcs	r0, r0, r1, lsr #2
     ff0:	21822123 	orrcs	r2, r2, r3, lsr #2
     ff4:	e15001a1 	cmp	r0, r1, lsr #3
     ff8:	204001a1 	subcs	r0, r0, r1, lsr #3
     ffc:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1000:	e3500000 	cmp	r0, #0
    1004:	11b03223 	lsrsne	r3, r3, #4
    1008:	11a01221 	lsrne	r1, r1, #4
    100c:	1affffef 	bne	fd0 <__aeabi_uidiv+0x58>
    1010:	e1a00002 	mov	r0, r2
    1014:	e12fff1e 	bx	lr
    1018:	03a00001 	moveq	r0, #1
    101c:	13a00000 	movne	r0, #0
    1020:	e12fff1e 	bx	lr
    1024:	e3510801 	cmp	r1, #65536	; 0x10000
    1028:	21a01821 	lsrcs	r1, r1, #16
    102c:	23a02010 	movcs	r2, #16
    1030:	33a02000 	movcc	r2, #0
    1034:	e3510c01 	cmp	r1, #256	; 0x100
    1038:	21a01421 	lsrcs	r1, r1, #8
    103c:	22822008 	addcs	r2, r2, #8
    1040:	e3510010 	cmp	r1, #16
    1044:	21a01221 	lsrcs	r1, r1, #4
    1048:	22822004 	addcs	r2, r2, #4
    104c:	e3510004 	cmp	r1, #4
    1050:	82822003 	addhi	r2, r2, #3
    1054:	908220a1 	addls	r2, r2, r1, lsr #1
    1058:	e1a00230 	lsr	r0, r0, r2
    105c:	e12fff1e 	bx	lr
    1060:	e3500000 	cmp	r0, #0
    1064:	13e00000 	mvnne	r0, #0
    1068:	ea000007 	b	108c <__aeabi_idiv0>

0000106c <__aeabi_uidivmod>:
    106c:	e3510000 	cmp	r1, #0
    1070:	0afffffa 	beq	1060 <__aeabi_uidiv+0xe8>
    1074:	e92d4003 	push	{r0, r1, lr}
    1078:	ebffffbe 	bl	f78 <__aeabi_uidiv>
    107c:	e8bd4006 	pop	{r1, r2, lr}
    1080:	e0030092 	mul	r3, r2, r0
    1084:	e0411003 	sub	r1, r1, r3
    1088:	e12fff1e 	bx	lr

0000108c <__aeabi_idiv0>:
    108c:	e12fff1e 	bx	lr
