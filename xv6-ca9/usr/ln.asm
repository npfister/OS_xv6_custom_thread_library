
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
      24:	e3011120 	movw	r1, #4384	; 0x1120
      28:	e3401000 	movt	r1, #0
      2c:	eb000285 	bl	a48 <printf>
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
      80:	e3011134 	movw	r1, #4404	; 0x1134
      84:	e3401000 	movt	r1, #0
      88:	eb00026e 	bl	a48 <printf>
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

00000894 <kthread_create>:
     894:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     898:	e1a04003 	mov	r4, r3
     89c:	e1a03002 	mov	r3, r2
     8a0:	e1a02001 	mov	r2, r1
     8a4:	e1a01000 	mov	r1, r0
     8a8:	e3a00016 	mov	r0, #22
     8ac:	ef000000 	svc	0x00000000
     8b0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8b4:	e12fff1e 	bx	lr

000008b8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     8b8:	e92d4800 	push	{fp, lr}
     8bc:	e28db004 	add	fp, sp, #4
     8c0:	e24dd008 	sub	sp, sp, #8
     8c4:	e50b0008 	str	r0, [fp, #-8]
     8c8:	e1a03001 	mov	r3, r1
     8cc:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     8d0:	e51b0008 	ldr	r0, [fp, #-8]
     8d4:	e24b3009 	sub	r3, fp, #9
     8d8:	e1a01003 	mov	r1, r3
     8dc:	e3a02001 	mov	r2, #1
     8e0:	ebffff5b 	bl	654 <write>
}
     8e4:	e24bd004 	sub	sp, fp, #4
     8e8:	e8bd8800 	pop	{fp, pc}

000008ec <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     8ec:	e92d4800 	push	{fp, lr}
     8f0:	e28db004 	add	fp, sp, #4
     8f4:	e24dd030 	sub	sp, sp, #48	; 0x30
     8f8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     8fc:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     900:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     904:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     908:	e3a03000 	mov	r3, #0
     90c:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     910:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     914:	e3530000 	cmp	r3, #0
     918:	0a000008 	beq	940 <printint+0x54>
     91c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     920:	e3530000 	cmp	r3, #0
     924:	aa000005 	bge	940 <printint+0x54>
        neg = 1;
     928:	e3a03001 	mov	r3, #1
     92c:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     930:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     934:	e2633000 	rsb	r3, r3, #0
     938:	e50b3010 	str	r3, [fp, #-16]
     93c:	ea000001 	b	948 <printint+0x5c>
    } else {
        x = xx;
     940:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     944:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     948:	e3a03000 	mov	r3, #0
     94c:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     950:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     954:	e51b2010 	ldr	r2, [fp, #-16]
     958:	e1a00002 	mov	r0, r2
     95c:	e1a01003 	mov	r1, r3
     960:	eb0001e5 	bl	10fc <__aeabi_uidivmod>
     964:	e1a03001 	mov	r3, r1
     968:	e1a02003 	mov	r2, r3
     96c:	e3013150 	movw	r3, #4432	; 0x1150
     970:	e3403000 	movt	r3, #0
     974:	e7d32002 	ldrb	r2, [r3, r2]
     978:	e3e0001b 	mvn	r0, #27
     97c:	e51b3008 	ldr	r3, [fp, #-8]
     980:	e24bc004 	sub	ip, fp, #4
     984:	e08c1003 	add	r1, ip, r3
     988:	e1a03000 	mov	r3, r0
     98c:	e0813003 	add	r3, r1, r3
     990:	e5c32000 	strb	r2, [r3]
     994:	e51b3008 	ldr	r3, [fp, #-8]
     998:	e2833001 	add	r3, r3, #1
     99c:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     9a0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     9a4:	e51b0010 	ldr	r0, [fp, #-16]
     9a8:	e1a01003 	mov	r1, r3
     9ac:	eb000195 	bl	1008 <__aeabi_uidiv>
     9b0:	e1a03000 	mov	r3, r0
     9b4:	e50b3010 	str	r3, [fp, #-16]
     9b8:	e51b3010 	ldr	r3, [fp, #-16]
     9bc:	e3530000 	cmp	r3, #0
     9c0:	1affffe2 	bne	950 <printint+0x64>
    if(neg)
     9c4:	e51b300c 	ldr	r3, [fp, #-12]
     9c8:	e3530000 	cmp	r3, #0
     9cc:	0a000015 	beq	a28 <printint+0x13c>
        buf[i++] = '-';
     9d0:	e3e0101b 	mvn	r1, #27
     9d4:	e51b3008 	ldr	r3, [fp, #-8]
     9d8:	e24b0004 	sub	r0, fp, #4
     9dc:	e0802003 	add	r2, r0, r3
     9e0:	e1a03001 	mov	r3, r1
     9e4:	e0823003 	add	r3, r2, r3
     9e8:	e3a0202d 	mov	r2, #45	; 0x2d
     9ec:	e5c32000 	strb	r2, [r3]
     9f0:	e51b3008 	ldr	r3, [fp, #-8]
     9f4:	e2833001 	add	r3, r3, #1
     9f8:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     9fc:	ea000009 	b	a28 <printint+0x13c>
        putc(fd, buf[i]);
     a00:	e3e0101b 	mvn	r1, #27
     a04:	e51b3008 	ldr	r3, [fp, #-8]
     a08:	e24bc004 	sub	ip, fp, #4
     a0c:	e08c2003 	add	r2, ip, r3
     a10:	e1a03001 	mov	r3, r1
     a14:	e0823003 	add	r3, r2, r3
     a18:	e5d33000 	ldrb	r3, [r3]
     a1c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     a20:	e1a01003 	mov	r1, r3
     a24:	ebffffa3 	bl	8b8 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     a28:	e51b3008 	ldr	r3, [fp, #-8]
     a2c:	e2433001 	sub	r3, r3, #1
     a30:	e50b3008 	str	r3, [fp, #-8]
     a34:	e51b3008 	ldr	r3, [fp, #-8]
     a38:	e3530000 	cmp	r3, #0
     a3c:	aaffffef 	bge	a00 <printint+0x114>
        putc(fd, buf[i]);
}
     a40:	e24bd004 	sub	sp, fp, #4
     a44:	e8bd8800 	pop	{fp, pc}

00000a48 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     a48:	e92d000e 	push	{r1, r2, r3}
     a4c:	e92d4800 	push	{fp, lr}
     a50:	e28db004 	add	fp, sp, #4
     a54:	e24dd024 	sub	sp, sp, #36	; 0x24
     a58:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     a5c:	e3a03000 	mov	r3, #0
     a60:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     a64:	e28b3008 	add	r3, fp, #8
     a68:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     a6c:	e3a03000 	mov	r3, #0
     a70:	e50b3010 	str	r3, [fp, #-16]
     a74:	ea000077 	b	c58 <printf+0x210>
        c = fmt[i] & 0xff;
     a78:	e59b2004 	ldr	r2, [fp, #4]
     a7c:	e51b3010 	ldr	r3, [fp, #-16]
     a80:	e0823003 	add	r3, r2, r3
     a84:	e5d33000 	ldrb	r3, [r3]
     a88:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     a8c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a90:	e3530000 	cmp	r3, #0
     a94:	1a00000b 	bne	ac8 <printf+0x80>
            if(c == '%'){
     a98:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a9c:	e3530025 	cmp	r3, #37	; 0x25
     aa0:	1a000002 	bne	ab0 <printf+0x68>
                state = '%';
     aa4:	e3a03025 	mov	r3, #37	; 0x25
     aa8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     aac:	ea000066 	b	c4c <printf+0x204>
            } else {
                putc(fd, c);
     ab0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ab4:	e6ef3073 	uxtb	r3, r3
     ab8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     abc:	e1a01003 	mov	r1, r3
     ac0:	ebffff7c 	bl	8b8 <putc>
     ac4:	ea000060 	b	c4c <printf+0x204>
            }
        } else if(state == '%'){
     ac8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     acc:	e3530025 	cmp	r3, #37	; 0x25
     ad0:	1a00005d 	bne	c4c <printf+0x204>
            if(c == 'd'){
     ad4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ad8:	e3530064 	cmp	r3, #100	; 0x64
     adc:	1a00000a 	bne	b0c <printf+0xc4>
                printint(fd, *ap, 10, 1);
     ae0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ae4:	e5933000 	ldr	r3, [r3]
     ae8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     aec:	e1a01003 	mov	r1, r3
     af0:	e3a0200a 	mov	r2, #10
     af4:	e3a03001 	mov	r3, #1
     af8:	ebffff7b 	bl	8ec <printint>
                ap++;
     afc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b00:	e2833004 	add	r3, r3, #4
     b04:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b08:	ea00004d 	b	c44 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     b0c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b10:	e3530078 	cmp	r3, #120	; 0x78
     b14:	0a000002 	beq	b24 <printf+0xdc>
     b18:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b1c:	e3530070 	cmp	r3, #112	; 0x70
     b20:	1a00000a 	bne	b50 <printf+0x108>
                printint(fd, *ap, 16, 0);
     b24:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b28:	e5933000 	ldr	r3, [r3]
     b2c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b30:	e1a01003 	mov	r1, r3
     b34:	e3a02010 	mov	r2, #16
     b38:	e3a03000 	mov	r3, #0
     b3c:	ebffff6a 	bl	8ec <printint>
                ap++;
     b40:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b44:	e2833004 	add	r3, r3, #4
     b48:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b4c:	ea00003c 	b	c44 <printf+0x1fc>
            } else if(c == 's'){
     b50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b54:	e3530073 	cmp	r3, #115	; 0x73
     b58:	1a00001b 	bne	bcc <printf+0x184>
                s = (char*)*ap;
     b5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b60:	e5933000 	ldr	r3, [r3]
     b64:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     b68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b6c:	e2833004 	add	r3, r3, #4
     b70:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     b74:	e51b300c 	ldr	r3, [fp, #-12]
     b78:	e3530000 	cmp	r3, #0
     b7c:	1a00000c 	bne	bb4 <printf+0x16c>
                    s = "(null)";
     b80:	e3013148 	movw	r3, #4424	; 0x1148
     b84:	e3403000 	movt	r3, #0
     b88:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     b8c:	ea000008 	b	bb4 <printf+0x16c>
                    putc(fd, *s);
     b90:	e51b300c 	ldr	r3, [fp, #-12]
     b94:	e5d33000 	ldrb	r3, [r3]
     b98:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b9c:	e1a01003 	mov	r1, r3
     ba0:	ebffff44 	bl	8b8 <putc>
                    s++;
     ba4:	e51b300c 	ldr	r3, [fp, #-12]
     ba8:	e2833001 	add	r3, r3, #1
     bac:	e50b300c 	str	r3, [fp, #-12]
     bb0:	ea000000 	b	bb8 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     bb4:	e1a00000 	nop			; (mov r0, r0)
     bb8:	e51b300c 	ldr	r3, [fp, #-12]
     bbc:	e5d33000 	ldrb	r3, [r3]
     bc0:	e3530000 	cmp	r3, #0
     bc4:	1afffff1 	bne	b90 <printf+0x148>
     bc8:	ea00001d 	b	c44 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     bcc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bd0:	e3530063 	cmp	r3, #99	; 0x63
     bd4:	1a000009 	bne	c00 <printf+0x1b8>
                putc(fd, *ap);
     bd8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bdc:	e5933000 	ldr	r3, [r3]
     be0:	e6ef3073 	uxtb	r3, r3
     be4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     be8:	e1a01003 	mov	r1, r3
     bec:	ebffff31 	bl	8b8 <putc>
                ap++;
     bf0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bf4:	e2833004 	add	r3, r3, #4
     bf8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bfc:	ea000010 	b	c44 <printf+0x1fc>
            } else if(c == '%'){
     c00:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c04:	e3530025 	cmp	r3, #37	; 0x25
     c08:	1a000005 	bne	c24 <printf+0x1dc>
                putc(fd, c);
     c0c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c10:	e6ef3073 	uxtb	r3, r3
     c14:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c18:	e1a01003 	mov	r1, r3
     c1c:	ebffff25 	bl	8b8 <putc>
     c20:	ea000007 	b	c44 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     c24:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c28:	e3a01025 	mov	r1, #37	; 0x25
     c2c:	ebffff21 	bl	8b8 <putc>
                putc(fd, c);
     c30:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c34:	e6ef3073 	uxtb	r3, r3
     c38:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c3c:	e1a01003 	mov	r1, r3
     c40:	ebffff1c 	bl	8b8 <putc>
            }
            state = 0;
     c44:	e3a03000 	mov	r3, #0
     c48:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     c4c:	e51b3010 	ldr	r3, [fp, #-16]
     c50:	e2833001 	add	r3, r3, #1
     c54:	e50b3010 	str	r3, [fp, #-16]
     c58:	e59b2004 	ldr	r2, [fp, #4]
     c5c:	e51b3010 	ldr	r3, [fp, #-16]
     c60:	e0823003 	add	r3, r2, r3
     c64:	e5d33000 	ldrb	r3, [r3]
     c68:	e3530000 	cmp	r3, #0
     c6c:	1affff81 	bne	a78 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     c70:	e24bd004 	sub	sp, fp, #4
     c74:	e8bd4800 	pop	{fp, lr}
     c78:	e28dd00c 	add	sp, sp, #12
     c7c:	e12fff1e 	bx	lr

00000c80 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c80:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c84:	e28db000 	add	fp, sp, #0
     c88:	e24dd014 	sub	sp, sp, #20
     c8c:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     c90:	e51b3010 	ldr	r3, [fp, #-16]
     c94:	e2433008 	sub	r3, r3, #8
     c98:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c9c:	e301316c 	movw	r3, #4460	; 0x116c
     ca0:	e3403000 	movt	r3, #0
     ca4:	e5933000 	ldr	r3, [r3]
     ca8:	e50b3008 	str	r3, [fp, #-8]
     cac:	ea000010 	b	cf4 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     cb0:	e51b3008 	ldr	r3, [fp, #-8]
     cb4:	e5932000 	ldr	r2, [r3]
     cb8:	e51b3008 	ldr	r3, [fp, #-8]
     cbc:	e1520003 	cmp	r2, r3
     cc0:	8a000008 	bhi	ce8 <free+0x68>
     cc4:	e51b200c 	ldr	r2, [fp, #-12]
     cc8:	e51b3008 	ldr	r3, [fp, #-8]
     ccc:	e1520003 	cmp	r2, r3
     cd0:	8a000010 	bhi	d18 <free+0x98>
     cd4:	e51b3008 	ldr	r3, [fp, #-8]
     cd8:	e5932000 	ldr	r2, [r3]
     cdc:	e51b300c 	ldr	r3, [fp, #-12]
     ce0:	e1520003 	cmp	r2, r3
     ce4:	8a00000b 	bhi	d18 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ce8:	e51b3008 	ldr	r3, [fp, #-8]
     cec:	e5933000 	ldr	r3, [r3]
     cf0:	e50b3008 	str	r3, [fp, #-8]
     cf4:	e51b200c 	ldr	r2, [fp, #-12]
     cf8:	e51b3008 	ldr	r3, [fp, #-8]
     cfc:	e1520003 	cmp	r2, r3
     d00:	9affffea 	bls	cb0 <free+0x30>
     d04:	e51b3008 	ldr	r3, [fp, #-8]
     d08:	e5932000 	ldr	r2, [r3]
     d0c:	e51b300c 	ldr	r3, [fp, #-12]
     d10:	e1520003 	cmp	r2, r3
     d14:	9affffe5 	bls	cb0 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     d18:	e51b300c 	ldr	r3, [fp, #-12]
     d1c:	e5933004 	ldr	r3, [r3, #4]
     d20:	e1a03183 	lsl	r3, r3, #3
     d24:	e51b200c 	ldr	r2, [fp, #-12]
     d28:	e0822003 	add	r2, r2, r3
     d2c:	e51b3008 	ldr	r3, [fp, #-8]
     d30:	e5933000 	ldr	r3, [r3]
     d34:	e1520003 	cmp	r2, r3
     d38:	1a00000d 	bne	d74 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     d3c:	e51b300c 	ldr	r3, [fp, #-12]
     d40:	e5932004 	ldr	r2, [r3, #4]
     d44:	e51b3008 	ldr	r3, [fp, #-8]
     d48:	e5933000 	ldr	r3, [r3]
     d4c:	e5933004 	ldr	r3, [r3, #4]
     d50:	e0822003 	add	r2, r2, r3
     d54:	e51b300c 	ldr	r3, [fp, #-12]
     d58:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     d5c:	e51b3008 	ldr	r3, [fp, #-8]
     d60:	e5933000 	ldr	r3, [r3]
     d64:	e5932000 	ldr	r2, [r3]
     d68:	e51b300c 	ldr	r3, [fp, #-12]
     d6c:	e5832000 	str	r2, [r3]
     d70:	ea000003 	b	d84 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     d74:	e51b3008 	ldr	r3, [fp, #-8]
     d78:	e5932000 	ldr	r2, [r3]
     d7c:	e51b300c 	ldr	r3, [fp, #-12]
     d80:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     d84:	e51b3008 	ldr	r3, [fp, #-8]
     d88:	e5933004 	ldr	r3, [r3, #4]
     d8c:	e1a03183 	lsl	r3, r3, #3
     d90:	e51b2008 	ldr	r2, [fp, #-8]
     d94:	e0822003 	add	r2, r2, r3
     d98:	e51b300c 	ldr	r3, [fp, #-12]
     d9c:	e1520003 	cmp	r2, r3
     da0:	1a00000b 	bne	dd4 <free+0x154>
        p->s.size += bp->s.size;
     da4:	e51b3008 	ldr	r3, [fp, #-8]
     da8:	e5932004 	ldr	r2, [r3, #4]
     dac:	e51b300c 	ldr	r3, [fp, #-12]
     db0:	e5933004 	ldr	r3, [r3, #4]
     db4:	e0822003 	add	r2, r2, r3
     db8:	e51b3008 	ldr	r3, [fp, #-8]
     dbc:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     dc0:	e51b300c 	ldr	r3, [fp, #-12]
     dc4:	e5932000 	ldr	r2, [r3]
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e5832000 	str	r2, [r3]
     dd0:	ea000002 	b	de0 <free+0x160>
    } else
        p->s.ptr = bp;
     dd4:	e51b3008 	ldr	r3, [fp, #-8]
     dd8:	e51b200c 	ldr	r2, [fp, #-12]
     ddc:	e5832000 	str	r2, [r3]
    freep = p;
     de0:	e301316c 	movw	r3, #4460	; 0x116c
     de4:	e3403000 	movt	r3, #0
     de8:	e51b2008 	ldr	r2, [fp, #-8]
     dec:	e5832000 	str	r2, [r3]
}
     df0:	e28bd000 	add	sp, fp, #0
     df4:	e8bd0800 	pop	{fp}
     df8:	e12fff1e 	bx	lr

00000dfc <morecore>:

static Header*
morecore(uint nu)
{
     dfc:	e92d4800 	push	{fp, lr}
     e00:	e28db004 	add	fp, sp, #4
     e04:	e24dd010 	sub	sp, sp, #16
     e08:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     e0c:	e51b2010 	ldr	r2, [fp, #-16]
     e10:	e3003fff 	movw	r3, #4095	; 0xfff
     e14:	e1520003 	cmp	r2, r3
     e18:	8a000001 	bhi	e24 <morecore+0x28>
        nu = 4096;
     e1c:	e3a03a01 	mov	r3, #4096	; 0x1000
     e20:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     e24:	e51b3010 	ldr	r3, [fp, #-16]
     e28:	e1a03183 	lsl	r3, r3, #3
     e2c:	e1a00003 	mov	r0, r3
     e30:	ebfffe7c 	bl	828 <sbrk>
     e34:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     e38:	e51b3008 	ldr	r3, [fp, #-8]
     e3c:	e3730001 	cmn	r3, #1
     e40:	1a000001 	bne	e4c <morecore+0x50>
        return 0;
     e44:	e3a03000 	mov	r3, #0
     e48:	ea00000b 	b	e7c <morecore+0x80>
    hp = (Header*)p;
     e4c:	e51b3008 	ldr	r3, [fp, #-8]
     e50:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     e54:	e51b300c 	ldr	r3, [fp, #-12]
     e58:	e51b2010 	ldr	r2, [fp, #-16]
     e5c:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     e60:	e51b300c 	ldr	r3, [fp, #-12]
     e64:	e2833008 	add	r3, r3, #8
     e68:	e1a00003 	mov	r0, r3
     e6c:	ebffff83 	bl	c80 <free>
    return freep;
     e70:	e301316c 	movw	r3, #4460	; 0x116c
     e74:	e3403000 	movt	r3, #0
     e78:	e5933000 	ldr	r3, [r3]
}
     e7c:	e1a00003 	mov	r0, r3
     e80:	e24bd004 	sub	sp, fp, #4
     e84:	e8bd8800 	pop	{fp, pc}

00000e88 <malloc>:

void*
malloc(uint nbytes)
{
     e88:	e92d4800 	push	{fp, lr}
     e8c:	e28db004 	add	fp, sp, #4
     e90:	e24dd018 	sub	sp, sp, #24
     e94:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e98:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e9c:	e2833007 	add	r3, r3, #7
     ea0:	e1a031a3 	lsr	r3, r3, #3
     ea4:	e2833001 	add	r3, r3, #1
     ea8:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     eac:	e301316c 	movw	r3, #4460	; 0x116c
     eb0:	e3403000 	movt	r3, #0
     eb4:	e5933000 	ldr	r3, [r3]
     eb8:	e50b300c 	str	r3, [fp, #-12]
     ebc:	e51b300c 	ldr	r3, [fp, #-12]
     ec0:	e3530000 	cmp	r3, #0
     ec4:	1a000010 	bne	f0c <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     ec8:	e3013164 	movw	r3, #4452	; 0x1164
     ecc:	e3403000 	movt	r3, #0
     ed0:	e50b300c 	str	r3, [fp, #-12]
     ed4:	e301316c 	movw	r3, #4460	; 0x116c
     ed8:	e3403000 	movt	r3, #0
     edc:	e51b200c 	ldr	r2, [fp, #-12]
     ee0:	e5832000 	str	r2, [r3]
     ee4:	e301316c 	movw	r3, #4460	; 0x116c
     ee8:	e3403000 	movt	r3, #0
     eec:	e5932000 	ldr	r2, [r3]
     ef0:	e3013164 	movw	r3, #4452	; 0x1164
     ef4:	e3403000 	movt	r3, #0
     ef8:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     efc:	e3013164 	movw	r3, #4452	; 0x1164
     f00:	e3403000 	movt	r3, #0
     f04:	e3a02000 	mov	r2, #0
     f08:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f0c:	e51b300c 	ldr	r3, [fp, #-12]
     f10:	e5933000 	ldr	r3, [r3]
     f14:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     f18:	e51b3008 	ldr	r3, [fp, #-8]
     f1c:	e5932004 	ldr	r2, [r3, #4]
     f20:	e51b3010 	ldr	r3, [fp, #-16]
     f24:	e1520003 	cmp	r2, r3
     f28:	3a00001f 	bcc	fac <malloc+0x124>
            if(p->s.size == nunits)
     f2c:	e51b3008 	ldr	r3, [fp, #-8]
     f30:	e5932004 	ldr	r2, [r3, #4]
     f34:	e51b3010 	ldr	r3, [fp, #-16]
     f38:	e1520003 	cmp	r2, r3
     f3c:	1a000004 	bne	f54 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     f40:	e51b3008 	ldr	r3, [fp, #-8]
     f44:	e5932000 	ldr	r2, [r3]
     f48:	e51b300c 	ldr	r3, [fp, #-12]
     f4c:	e5832000 	str	r2, [r3]
     f50:	ea00000e 	b	f90 <malloc+0x108>
            else {
                p->s.size -= nunits;
     f54:	e51b3008 	ldr	r3, [fp, #-8]
     f58:	e5932004 	ldr	r2, [r3, #4]
     f5c:	e51b3010 	ldr	r3, [fp, #-16]
     f60:	e0632002 	rsb	r2, r3, r2
     f64:	e51b3008 	ldr	r3, [fp, #-8]
     f68:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     f6c:	e51b3008 	ldr	r3, [fp, #-8]
     f70:	e5933004 	ldr	r3, [r3, #4]
     f74:	e1a03183 	lsl	r3, r3, #3
     f78:	e51b2008 	ldr	r2, [fp, #-8]
     f7c:	e0823003 	add	r3, r2, r3
     f80:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     f84:	e51b3008 	ldr	r3, [fp, #-8]
     f88:	e51b2010 	ldr	r2, [fp, #-16]
     f8c:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     f90:	e301316c 	movw	r3, #4460	; 0x116c
     f94:	e3403000 	movt	r3, #0
     f98:	e51b200c 	ldr	r2, [fp, #-12]
     f9c:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     fa0:	e51b3008 	ldr	r3, [fp, #-8]
     fa4:	e2833008 	add	r3, r3, #8
     fa8:	ea000013 	b	ffc <malloc+0x174>
        }
        if(p == freep)
     fac:	e301316c 	movw	r3, #4460	; 0x116c
     fb0:	e3403000 	movt	r3, #0
     fb4:	e5933000 	ldr	r3, [r3]
     fb8:	e51b2008 	ldr	r2, [fp, #-8]
     fbc:	e1520003 	cmp	r2, r3
     fc0:	1a000007 	bne	fe4 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     fc4:	e51b0010 	ldr	r0, [fp, #-16]
     fc8:	ebffff8b 	bl	dfc <morecore>
     fcc:	e50b0008 	str	r0, [fp, #-8]
     fd0:	e51b3008 	ldr	r3, [fp, #-8]
     fd4:	e3530000 	cmp	r3, #0
     fd8:	1a000001 	bne	fe4 <malloc+0x15c>
                return 0;
     fdc:	e3a03000 	mov	r3, #0
     fe0:	ea000005 	b	ffc <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fe4:	e51b3008 	ldr	r3, [fp, #-8]
     fe8:	e50b300c 	str	r3, [fp, #-12]
     fec:	e51b3008 	ldr	r3, [fp, #-8]
     ff0:	e5933000 	ldr	r3, [r3]
     ff4:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
     ff8:	eaffffc6 	b	f18 <malloc+0x90>
}
     ffc:	e1a00003 	mov	r0, r3
    1000:	e24bd004 	sub	sp, fp, #4
    1004:	e8bd8800 	pop	{fp, pc}

00001008 <__aeabi_uidiv>:
    1008:	e2512001 	subs	r2, r1, #1
    100c:	012fff1e 	bxeq	lr
    1010:	3a000036 	bcc	10f0 <__aeabi_uidiv+0xe8>
    1014:	e1500001 	cmp	r0, r1
    1018:	9a000022 	bls	10a8 <__aeabi_uidiv+0xa0>
    101c:	e1110002 	tst	r1, r2
    1020:	0a000023 	beq	10b4 <__aeabi_uidiv+0xac>
    1024:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1028:	01a01181 	lsleq	r1, r1, #3
    102c:	03a03008 	moveq	r3, #8
    1030:	13a03001 	movne	r3, #1
    1034:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1038:	31510000 	cmpcc	r1, r0
    103c:	31a01201 	lslcc	r1, r1, #4
    1040:	31a03203 	lslcc	r3, r3, #4
    1044:	3afffffa 	bcc	1034 <__aeabi_uidiv+0x2c>
    1048:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    104c:	31510000 	cmpcc	r1, r0
    1050:	31a01081 	lslcc	r1, r1, #1
    1054:	31a03083 	lslcc	r3, r3, #1
    1058:	3afffffa 	bcc	1048 <__aeabi_uidiv+0x40>
    105c:	e3a02000 	mov	r2, #0
    1060:	e1500001 	cmp	r0, r1
    1064:	20400001 	subcs	r0, r0, r1
    1068:	21822003 	orrcs	r2, r2, r3
    106c:	e15000a1 	cmp	r0, r1, lsr #1
    1070:	204000a1 	subcs	r0, r0, r1, lsr #1
    1074:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1078:	e1500121 	cmp	r0, r1, lsr #2
    107c:	20400121 	subcs	r0, r0, r1, lsr #2
    1080:	21822123 	orrcs	r2, r2, r3, lsr #2
    1084:	e15001a1 	cmp	r0, r1, lsr #3
    1088:	204001a1 	subcs	r0, r0, r1, lsr #3
    108c:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1090:	e3500000 	cmp	r0, #0
    1094:	11b03223 	lsrsne	r3, r3, #4
    1098:	11a01221 	lsrne	r1, r1, #4
    109c:	1affffef 	bne	1060 <__aeabi_uidiv+0x58>
    10a0:	e1a00002 	mov	r0, r2
    10a4:	e12fff1e 	bx	lr
    10a8:	03a00001 	moveq	r0, #1
    10ac:	13a00000 	movne	r0, #0
    10b0:	e12fff1e 	bx	lr
    10b4:	e3510801 	cmp	r1, #65536	; 0x10000
    10b8:	21a01821 	lsrcs	r1, r1, #16
    10bc:	23a02010 	movcs	r2, #16
    10c0:	33a02000 	movcc	r2, #0
    10c4:	e3510c01 	cmp	r1, #256	; 0x100
    10c8:	21a01421 	lsrcs	r1, r1, #8
    10cc:	22822008 	addcs	r2, r2, #8
    10d0:	e3510010 	cmp	r1, #16
    10d4:	21a01221 	lsrcs	r1, r1, #4
    10d8:	22822004 	addcs	r2, r2, #4
    10dc:	e3510004 	cmp	r1, #4
    10e0:	82822003 	addhi	r2, r2, #3
    10e4:	908220a1 	addls	r2, r2, r1, lsr #1
    10e8:	e1a00230 	lsr	r0, r0, r2
    10ec:	e12fff1e 	bx	lr
    10f0:	e3500000 	cmp	r0, #0
    10f4:	13e00000 	mvnne	r0, #0
    10f8:	ea000007 	b	111c <__aeabi_idiv0>

000010fc <__aeabi_uidivmod>:
    10fc:	e3510000 	cmp	r1, #0
    1100:	0afffffa 	beq	10f0 <__aeabi_uidiv+0xe8>
    1104:	e92d4003 	push	{r0, r1, lr}
    1108:	ebffffbe 	bl	1008 <__aeabi_uidiv>
    110c:	e8bd4006 	pop	{r1, r2, lr}
    1110:	e0030092 	mul	r3, r2, r0
    1114:	e0411003 	sub	r1, r1, r3
    1118:	e12fff1e 	bx	lr

0000111c <__aeabi_idiv0>:
    111c:	e12fff1e 	bx	lr
