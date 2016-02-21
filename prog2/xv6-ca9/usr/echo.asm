
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd010 	sub	sp, sp, #16
       c:	e50b0010 	str	r0, [fp, #-16]
      10:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int i;
    
    for(i = 1; i < argc; i++)
      14:	e3a03001 	mov	r3, #1
      18:	e50b3008 	str	r3, [fp, #-8]
      1c:	ea000015 	b	78 <main+0x78>
        printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
      20:	e51b3008 	ldr	r3, [fp, #-8]
      24:	e1a03103 	lsl	r3, r3, #2
      28:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      2c:	e0823003 	add	r3, r2, r3
      30:	e5932000 	ldr	r2, [r3]
      34:	e51b3008 	ldr	r3, [fp, #-8]
      38:	e2831001 	add	r1, r3, #1
      3c:	e51b3010 	ldr	r3, [fp, #-16]
      40:	e1510003 	cmp	r1, r3
      44:	aa000002 	bge	54 <main+0x54>
      48:	e30130f8 	movw	r3, #4344	; 0x10f8
      4c:	e3403000 	movt	r3, #0
      50:	ea000001 	b	5c <main+0x5c>
      54:	e30130fc 	movw	r3, #4348	; 0x10fc
      58:	e3403000 	movt	r3, #0
      5c:	e3a00001 	mov	r0, #1
      60:	e3011100 	movw	r1, #4352	; 0x1100
      64:	e3401000 	movt	r1, #0
      68:	eb00026c 	bl	a20 <printf>
int
main(int argc, char *argv[])
{
    int i;
    
    for(i = 1; i < argc; i++)
      6c:	e51b3008 	ldr	r3, [fp, #-8]
      70:	e2833001 	add	r3, r3, #1
      74:	e50b3008 	str	r3, [fp, #-8]
      78:	e51b2008 	ldr	r2, [fp, #-8]
      7c:	e51b3010 	ldr	r3, [fp, #-16]
      80:	e1520003 	cmp	r2, r3
      84:	baffffe5 	blt	20 <main+0x20>
        printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    exit();
      88:	eb00014c 	bl	5c0 <exit>

0000008c <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
      8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      90:	e28db000 	add	fp, sp, #0
      94:	e24dd014 	sub	sp, sp, #20
      98:	e50b0010 	str	r0, [fp, #-16]
      9c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
      a0:	e51b3010 	ldr	r3, [fp, #-16]
      a4:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
      a8:	e1a00000 	nop			; (mov r0, r0)
      ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      b0:	e5d32000 	ldrb	r2, [r3]
      b4:	e51b3010 	ldr	r3, [fp, #-16]
      b8:	e5c32000 	strb	r2, [r3]
      bc:	e51b3010 	ldr	r3, [fp, #-16]
      c0:	e5d33000 	ldrb	r3, [r3]
      c4:	e3530000 	cmp	r3, #0
      c8:	03a03000 	moveq	r3, #0
      cc:	13a03001 	movne	r3, #1
      d0:	e6ef3073 	uxtb	r3, r3
      d4:	e51b2010 	ldr	r2, [fp, #-16]
      d8:	e2822001 	add	r2, r2, #1
      dc:	e50b2010 	str	r2, [fp, #-16]
      e0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      e4:	e2822001 	add	r2, r2, #1
      e8:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
      ec:	e3530000 	cmp	r3, #0
      f0:	1affffed 	bne	ac <strcpy+0x20>
        ;
    return os;
      f4:	e51b3008 	ldr	r3, [fp, #-8]
}
      f8:	e1a00003 	mov	r0, r3
      fc:	e28bd000 	add	sp, fp, #0
     100:	e8bd0800 	pop	{fp}
     104:	e12fff1e 	bx	lr

00000108 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     108:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     10c:	e28db000 	add	fp, sp, #0
     110:	e24dd00c 	sub	sp, sp, #12
     114:	e50b0008 	str	r0, [fp, #-8]
     118:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     11c:	ea000005 	b	138 <strcmp+0x30>
        p++, q++;
     120:	e51b3008 	ldr	r3, [fp, #-8]
     124:	e2833001 	add	r3, r3, #1
     128:	e50b3008 	str	r3, [fp, #-8]
     12c:	e51b300c 	ldr	r3, [fp, #-12]
     130:	e2833001 	add	r3, r3, #1
     134:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     138:	e51b3008 	ldr	r3, [fp, #-8]
     13c:	e5d33000 	ldrb	r3, [r3]
     140:	e3530000 	cmp	r3, #0
     144:	0a000005 	beq	160 <strcmp+0x58>
     148:	e51b3008 	ldr	r3, [fp, #-8]
     14c:	e5d32000 	ldrb	r2, [r3]
     150:	e51b300c 	ldr	r3, [fp, #-12]
     154:	e5d33000 	ldrb	r3, [r3]
     158:	e1520003 	cmp	r2, r3
     15c:	0affffef 	beq	120 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     160:	e51b3008 	ldr	r3, [fp, #-8]
     164:	e5d33000 	ldrb	r3, [r3]
     168:	e1a02003 	mov	r2, r3
     16c:	e51b300c 	ldr	r3, [fp, #-12]
     170:	e5d33000 	ldrb	r3, [r3]
     174:	e0633002 	rsb	r3, r3, r2
}
     178:	e1a00003 	mov	r0, r3
     17c:	e28bd000 	add	sp, fp, #0
     180:	e8bd0800 	pop	{fp}
     184:	e12fff1e 	bx	lr

00000188 <strlen>:

uint
strlen(char *s)
{
     188:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     18c:	e28db000 	add	fp, sp, #0
     190:	e24dd014 	sub	sp, sp, #20
     194:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     198:	e3a03000 	mov	r3, #0
     19c:	e50b3008 	str	r3, [fp, #-8]
     1a0:	ea000002 	b	1b0 <strlen+0x28>
     1a4:	e51b3008 	ldr	r3, [fp, #-8]
     1a8:	e2833001 	add	r3, r3, #1
     1ac:	e50b3008 	str	r3, [fp, #-8]
     1b0:	e51b3008 	ldr	r3, [fp, #-8]
     1b4:	e51b2010 	ldr	r2, [fp, #-16]
     1b8:	e0823003 	add	r3, r2, r3
     1bc:	e5d33000 	ldrb	r3, [r3]
     1c0:	e3530000 	cmp	r3, #0
     1c4:	1afffff6 	bne	1a4 <strlen+0x1c>
        ;
    return n;
     1c8:	e51b3008 	ldr	r3, [fp, #-8]
}
     1cc:	e1a00003 	mov	r0, r3
     1d0:	e28bd000 	add	sp, fp, #0
     1d4:	e8bd0800 	pop	{fp}
     1d8:	e12fff1e 	bx	lr

000001dc <memset>:

void*
memset(void *dst, int v, uint n)
{
     1dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     1e0:	e28db000 	add	fp, sp, #0
     1e4:	e24dd024 	sub	sp, sp, #36	; 0x24
     1e8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     1ec:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     1f0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     1f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     1f8:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     1fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     200:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     204:	e55b300d 	ldrb	r3, [fp, #-13]
     208:	e1a02c03 	lsl	r2, r3, #24
     20c:	e55b300d 	ldrb	r3, [fp, #-13]
     210:	e1a03803 	lsl	r3, r3, #16
     214:	e1822003 	orr	r2, r2, r3
     218:	e55b300d 	ldrb	r3, [fp, #-13]
     21c:	e1a03403 	lsl	r3, r3, #8
     220:	e1822003 	orr	r2, r2, r3
     224:	e55b300d 	ldrb	r3, [fp, #-13]
     228:	e1823003 	orr	r3, r2, r3
     22c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     230:	ea000008 	b	258 <memset+0x7c>
		*p = c;
     234:	e51b3008 	ldr	r3, [fp, #-8]
     238:	e55b200d 	ldrb	r2, [fp, #-13]
     23c:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     240:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     244:	e2433001 	sub	r3, r3, #1
     248:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     24c:	e51b3008 	ldr	r3, [fp, #-8]
     250:	e2833001 	add	r3, r3, #1
     254:	e50b3008 	str	r3, [fp, #-8]
     258:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     25c:	e3530000 	cmp	r3, #0
     260:	0a000003 	beq	274 <memset+0x98>
     264:	e51b3008 	ldr	r3, [fp, #-8]
     268:	e2033003 	and	r3, r3, #3
     26c:	e3530000 	cmp	r3, #0
     270:	1affffef 	bne	234 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     274:	e51b3008 	ldr	r3, [fp, #-8]
     278:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     27c:	ea000008 	b	2a4 <memset+0xc8>
		*p4 = val;
     280:	e51b300c 	ldr	r3, [fp, #-12]
     284:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     288:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     28c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     290:	e2433004 	sub	r3, r3, #4
     294:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     298:	e51b300c 	ldr	r3, [fp, #-12]
     29c:	e2833004 	add	r3, r3, #4
     2a0:	e50b300c 	str	r3, [fp, #-12]
     2a4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2a8:	e3530003 	cmp	r3, #3
     2ac:	8afffff3 	bhi	280 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     2b0:	e51b300c 	ldr	r3, [fp, #-12]
     2b4:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     2b8:	ea000008 	b	2e0 <memset+0x104>
		*p = c;
     2bc:	e51b3008 	ldr	r3, [fp, #-8]
     2c0:	e55b200d 	ldrb	r2, [fp, #-13]
     2c4:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     2c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2cc:	e2433001 	sub	r3, r3, #1
     2d0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     2d4:	e51b3008 	ldr	r3, [fp, #-8]
     2d8:	e2833001 	add	r3, r3, #1
     2dc:	e50b3008 	str	r3, [fp, #-8]
     2e0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2e4:	e3530000 	cmp	r3, #0
     2e8:	1afffff3 	bne	2bc <memset+0xe0>
		*p = c;
	}

	return dst;
     2ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     2f0:	e1a00003 	mov	r0, r3
     2f4:	e28bd000 	add	sp, fp, #0
     2f8:	e8bd0800 	pop	{fp}
     2fc:	e12fff1e 	bx	lr

00000300 <strchr>:

char*
strchr(const char *s, char c)
{
     300:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     304:	e28db000 	add	fp, sp, #0
     308:	e24dd00c 	sub	sp, sp, #12
     30c:	e50b0008 	str	r0, [fp, #-8]
     310:	e1a03001 	mov	r3, r1
     314:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     318:	ea000009 	b	344 <strchr+0x44>
        if(*s == c)
     31c:	e51b3008 	ldr	r3, [fp, #-8]
     320:	e5d33000 	ldrb	r3, [r3]
     324:	e55b2009 	ldrb	r2, [fp, #-9]
     328:	e1520003 	cmp	r2, r3
     32c:	1a000001 	bne	338 <strchr+0x38>
            return (char*)s;
     330:	e51b3008 	ldr	r3, [fp, #-8]
     334:	ea000007 	b	358 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     338:	e51b3008 	ldr	r3, [fp, #-8]
     33c:	e2833001 	add	r3, r3, #1
     340:	e50b3008 	str	r3, [fp, #-8]
     344:	e51b3008 	ldr	r3, [fp, #-8]
     348:	e5d33000 	ldrb	r3, [r3]
     34c:	e3530000 	cmp	r3, #0
     350:	1afffff1 	bne	31c <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     354:	e3a03000 	mov	r3, #0
}
     358:	e1a00003 	mov	r0, r3
     35c:	e28bd000 	add	sp, fp, #0
     360:	e8bd0800 	pop	{fp}
     364:	e12fff1e 	bx	lr

00000368 <gets>:

char*
gets(char *buf, int max)
{
     368:	e92d4800 	push	{fp, lr}
     36c:	e28db004 	add	fp, sp, #4
     370:	e24dd018 	sub	sp, sp, #24
     374:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     378:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     37c:	e3a03000 	mov	r3, #0
     380:	e50b3008 	str	r3, [fp, #-8]
     384:	ea000016 	b	3e4 <gets+0x7c>
        cc = read(0, &c, 1);
     388:	e3a00000 	mov	r0, #0
     38c:	e24b300d 	sub	r3, fp, #13
     390:	e1a01003 	mov	r1, r3
     394:	e3a02001 	mov	r2, #1
     398:	eb0000a3 	bl	62c <read>
     39c:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     3a0:	e51b300c 	ldr	r3, [fp, #-12]
     3a4:	e3530000 	cmp	r3, #0
     3a8:	da000013 	ble	3fc <gets+0x94>
            break;
        buf[i++] = c;
     3ac:	e51b3008 	ldr	r3, [fp, #-8]
     3b0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     3b4:	e0823003 	add	r3, r2, r3
     3b8:	e55b200d 	ldrb	r2, [fp, #-13]
     3bc:	e5c32000 	strb	r2, [r3]
     3c0:	e51b3008 	ldr	r3, [fp, #-8]
     3c4:	e2833001 	add	r3, r3, #1
     3c8:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     3cc:	e55b300d 	ldrb	r3, [fp, #-13]
     3d0:	e353000a 	cmp	r3, #10
     3d4:	0a000009 	beq	400 <gets+0x98>
     3d8:	e55b300d 	ldrb	r3, [fp, #-13]
     3dc:	e353000d 	cmp	r3, #13
     3e0:	0a000006 	beq	400 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     3e4:	e51b3008 	ldr	r3, [fp, #-8]
     3e8:	e2832001 	add	r2, r3, #1
     3ec:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     3f0:	e1520003 	cmp	r2, r3
     3f4:	baffffe3 	blt	388 <gets+0x20>
     3f8:	ea000000 	b	400 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     3fc:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     400:	e51b3008 	ldr	r3, [fp, #-8]
     404:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     408:	e0823003 	add	r3, r2, r3
     40c:	e3a02000 	mov	r2, #0
     410:	e5c32000 	strb	r2, [r3]
    return buf;
     414:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     418:	e1a00003 	mov	r0, r3
     41c:	e24bd004 	sub	sp, fp, #4
     420:	e8bd8800 	pop	{fp, pc}

00000424 <stat>:

int
stat(char *n, struct stat *st)
{
     424:	e92d4800 	push	{fp, lr}
     428:	e28db004 	add	fp, sp, #4
     42c:	e24dd010 	sub	sp, sp, #16
     430:	e50b0010 	str	r0, [fp, #-16]
     434:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     438:	e51b0010 	ldr	r0, [fp, #-16]
     43c:	e3a01000 	mov	r1, #0
     440:	eb0000a6 	bl	6e0 <open>
     444:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     448:	e51b3008 	ldr	r3, [fp, #-8]
     44c:	e3530000 	cmp	r3, #0
     450:	aa000001 	bge	45c <stat+0x38>
        return -1;
     454:	e3e03000 	mvn	r3, #0
     458:	ea000006 	b	478 <stat+0x54>
    r = fstat(fd, st);
     45c:	e51b0008 	ldr	r0, [fp, #-8]
     460:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     464:	eb0000b8 	bl	74c <fstat>
     468:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     46c:	e51b0008 	ldr	r0, [fp, #-8]
     470:	eb00007f 	bl	674 <close>
    return r;
     474:	e51b300c 	ldr	r3, [fp, #-12]
}
     478:	e1a00003 	mov	r0, r3
     47c:	e24bd004 	sub	sp, fp, #4
     480:	e8bd8800 	pop	{fp, pc}

00000484 <atoi>:

int
atoi(const char *s)
{
     484:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     488:	e28db000 	add	fp, sp, #0
     48c:	e24dd014 	sub	sp, sp, #20
     490:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     494:	e3a03000 	mov	r3, #0
     498:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     49c:	ea00000d 	b	4d8 <atoi+0x54>
        n = n*10 + *s++ - '0';
     4a0:	e51b2008 	ldr	r2, [fp, #-8]
     4a4:	e1a03002 	mov	r3, r2
     4a8:	e1a03103 	lsl	r3, r3, #2
     4ac:	e0833002 	add	r3, r3, r2
     4b0:	e1a03083 	lsl	r3, r3, #1
     4b4:	e1a02003 	mov	r2, r3
     4b8:	e51b3010 	ldr	r3, [fp, #-16]
     4bc:	e5d33000 	ldrb	r3, [r3]
     4c0:	e0823003 	add	r3, r2, r3
     4c4:	e2433030 	sub	r3, r3, #48	; 0x30
     4c8:	e50b3008 	str	r3, [fp, #-8]
     4cc:	e51b3010 	ldr	r3, [fp, #-16]
     4d0:	e2833001 	add	r3, r3, #1
     4d4:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     4d8:	e51b3010 	ldr	r3, [fp, #-16]
     4dc:	e5d33000 	ldrb	r3, [r3]
     4e0:	e353002f 	cmp	r3, #47	; 0x2f
     4e4:	9a000003 	bls	4f8 <atoi+0x74>
     4e8:	e51b3010 	ldr	r3, [fp, #-16]
     4ec:	e5d33000 	ldrb	r3, [r3]
     4f0:	e3530039 	cmp	r3, #57	; 0x39
     4f4:	9affffe9 	bls	4a0 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     4f8:	e51b3008 	ldr	r3, [fp, #-8]
}
     4fc:	e1a00003 	mov	r0, r3
     500:	e28bd000 	add	sp, fp, #0
     504:	e8bd0800 	pop	{fp}
     508:	e12fff1e 	bx	lr

0000050c <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     50c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     510:	e28db000 	add	fp, sp, #0
     514:	e24dd01c 	sub	sp, sp, #28
     518:	e50b0010 	str	r0, [fp, #-16]
     51c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     520:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     524:	e51b3010 	ldr	r3, [fp, #-16]
     528:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     52c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     530:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     534:	ea000009 	b	560 <memmove+0x54>
        *dst++ = *src++;
     538:	e51b300c 	ldr	r3, [fp, #-12]
     53c:	e5d32000 	ldrb	r2, [r3]
     540:	e51b3008 	ldr	r3, [fp, #-8]
     544:	e5c32000 	strb	r2, [r3]
     548:	e51b3008 	ldr	r3, [fp, #-8]
     54c:	e2833001 	add	r3, r3, #1
     550:	e50b3008 	str	r3, [fp, #-8]
     554:	e51b300c 	ldr	r3, [fp, #-12]
     558:	e2833001 	add	r3, r3, #1
     55c:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     560:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     564:	e3530000 	cmp	r3, #0
     568:	d3a03000 	movle	r3, #0
     56c:	c3a03001 	movgt	r3, #1
     570:	e6ef3073 	uxtb	r3, r3
     574:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     578:	e2422001 	sub	r2, r2, #1
     57c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     580:	e3530000 	cmp	r3, #0
     584:	1affffeb 	bne	538 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     588:	e51b3010 	ldr	r3, [fp, #-16]
}
     58c:	e1a00003 	mov	r0, r3
     590:	e28bd000 	add	sp, fp, #0
     594:	e8bd0800 	pop	{fp}
     598:	e12fff1e 	bx	lr

0000059c <fork>:
     59c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5a0:	e1a04003 	mov	r4, r3
     5a4:	e1a03002 	mov	r3, r2
     5a8:	e1a02001 	mov	r2, r1
     5ac:	e1a01000 	mov	r1, r0
     5b0:	e3a00001 	mov	r0, #1
     5b4:	ef000000 	svc	0x00000000
     5b8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5bc:	e12fff1e 	bx	lr

000005c0 <exit>:
     5c0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5c4:	e1a04003 	mov	r4, r3
     5c8:	e1a03002 	mov	r3, r2
     5cc:	e1a02001 	mov	r2, r1
     5d0:	e1a01000 	mov	r1, r0
     5d4:	e3a00002 	mov	r0, #2
     5d8:	ef000000 	svc	0x00000000
     5dc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5e0:	e12fff1e 	bx	lr

000005e4 <wait>:
     5e4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5e8:	e1a04003 	mov	r4, r3
     5ec:	e1a03002 	mov	r3, r2
     5f0:	e1a02001 	mov	r2, r1
     5f4:	e1a01000 	mov	r1, r0
     5f8:	e3a00003 	mov	r0, #3
     5fc:	ef000000 	svc	0x00000000
     600:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     604:	e12fff1e 	bx	lr

00000608 <pipe>:
     608:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     60c:	e1a04003 	mov	r4, r3
     610:	e1a03002 	mov	r3, r2
     614:	e1a02001 	mov	r2, r1
     618:	e1a01000 	mov	r1, r0
     61c:	e3a00004 	mov	r0, #4
     620:	ef000000 	svc	0x00000000
     624:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     628:	e12fff1e 	bx	lr

0000062c <read>:
     62c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     630:	e1a04003 	mov	r4, r3
     634:	e1a03002 	mov	r3, r2
     638:	e1a02001 	mov	r2, r1
     63c:	e1a01000 	mov	r1, r0
     640:	e3a00005 	mov	r0, #5
     644:	ef000000 	svc	0x00000000
     648:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     64c:	e12fff1e 	bx	lr

00000650 <write>:
     650:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     654:	e1a04003 	mov	r4, r3
     658:	e1a03002 	mov	r3, r2
     65c:	e1a02001 	mov	r2, r1
     660:	e1a01000 	mov	r1, r0
     664:	e3a00010 	mov	r0, #16
     668:	ef000000 	svc	0x00000000
     66c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     670:	e12fff1e 	bx	lr

00000674 <close>:
     674:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     678:	e1a04003 	mov	r4, r3
     67c:	e1a03002 	mov	r3, r2
     680:	e1a02001 	mov	r2, r1
     684:	e1a01000 	mov	r1, r0
     688:	e3a00015 	mov	r0, #21
     68c:	ef000000 	svc	0x00000000
     690:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     694:	e12fff1e 	bx	lr

00000698 <kill>:
     698:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     69c:	e1a04003 	mov	r4, r3
     6a0:	e1a03002 	mov	r3, r2
     6a4:	e1a02001 	mov	r2, r1
     6a8:	e1a01000 	mov	r1, r0
     6ac:	e3a00006 	mov	r0, #6
     6b0:	ef000000 	svc	0x00000000
     6b4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6b8:	e12fff1e 	bx	lr

000006bc <exec>:
     6bc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6c0:	e1a04003 	mov	r4, r3
     6c4:	e1a03002 	mov	r3, r2
     6c8:	e1a02001 	mov	r2, r1
     6cc:	e1a01000 	mov	r1, r0
     6d0:	e3a00007 	mov	r0, #7
     6d4:	ef000000 	svc	0x00000000
     6d8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6dc:	e12fff1e 	bx	lr

000006e0 <open>:
     6e0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6e4:	e1a04003 	mov	r4, r3
     6e8:	e1a03002 	mov	r3, r2
     6ec:	e1a02001 	mov	r2, r1
     6f0:	e1a01000 	mov	r1, r0
     6f4:	e3a0000f 	mov	r0, #15
     6f8:	ef000000 	svc	0x00000000
     6fc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     700:	e12fff1e 	bx	lr

00000704 <mknod>:
     704:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     708:	e1a04003 	mov	r4, r3
     70c:	e1a03002 	mov	r3, r2
     710:	e1a02001 	mov	r2, r1
     714:	e1a01000 	mov	r1, r0
     718:	e3a00011 	mov	r0, #17
     71c:	ef000000 	svc	0x00000000
     720:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     724:	e12fff1e 	bx	lr

00000728 <unlink>:
     728:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     72c:	e1a04003 	mov	r4, r3
     730:	e1a03002 	mov	r3, r2
     734:	e1a02001 	mov	r2, r1
     738:	e1a01000 	mov	r1, r0
     73c:	e3a00012 	mov	r0, #18
     740:	ef000000 	svc	0x00000000
     744:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     748:	e12fff1e 	bx	lr

0000074c <fstat>:
     74c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     750:	e1a04003 	mov	r4, r3
     754:	e1a03002 	mov	r3, r2
     758:	e1a02001 	mov	r2, r1
     75c:	e1a01000 	mov	r1, r0
     760:	e3a00008 	mov	r0, #8
     764:	ef000000 	svc	0x00000000
     768:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     76c:	e12fff1e 	bx	lr

00000770 <link>:
     770:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     774:	e1a04003 	mov	r4, r3
     778:	e1a03002 	mov	r3, r2
     77c:	e1a02001 	mov	r2, r1
     780:	e1a01000 	mov	r1, r0
     784:	e3a00013 	mov	r0, #19
     788:	ef000000 	svc	0x00000000
     78c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     790:	e12fff1e 	bx	lr

00000794 <mkdir>:
     794:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     798:	e1a04003 	mov	r4, r3
     79c:	e1a03002 	mov	r3, r2
     7a0:	e1a02001 	mov	r2, r1
     7a4:	e1a01000 	mov	r1, r0
     7a8:	e3a00014 	mov	r0, #20
     7ac:	ef000000 	svc	0x00000000
     7b0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7b4:	e12fff1e 	bx	lr

000007b8 <chdir>:
     7b8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7bc:	e1a04003 	mov	r4, r3
     7c0:	e1a03002 	mov	r3, r2
     7c4:	e1a02001 	mov	r2, r1
     7c8:	e1a01000 	mov	r1, r0
     7cc:	e3a00009 	mov	r0, #9
     7d0:	ef000000 	svc	0x00000000
     7d4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7d8:	e12fff1e 	bx	lr

000007dc <dup>:
     7dc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7e0:	e1a04003 	mov	r4, r3
     7e4:	e1a03002 	mov	r3, r2
     7e8:	e1a02001 	mov	r2, r1
     7ec:	e1a01000 	mov	r1, r0
     7f0:	e3a0000a 	mov	r0, #10
     7f4:	ef000000 	svc	0x00000000
     7f8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7fc:	e12fff1e 	bx	lr

00000800 <getpid>:
     800:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     804:	e1a04003 	mov	r4, r3
     808:	e1a03002 	mov	r3, r2
     80c:	e1a02001 	mov	r2, r1
     810:	e1a01000 	mov	r1, r0
     814:	e3a0000b 	mov	r0, #11
     818:	ef000000 	svc	0x00000000
     81c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     820:	e12fff1e 	bx	lr

00000824 <sbrk>:
     824:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     828:	e1a04003 	mov	r4, r3
     82c:	e1a03002 	mov	r3, r2
     830:	e1a02001 	mov	r2, r1
     834:	e1a01000 	mov	r1, r0
     838:	e3a0000c 	mov	r0, #12
     83c:	ef000000 	svc	0x00000000
     840:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     844:	e12fff1e 	bx	lr

00000848 <sleep>:
     848:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     84c:	e1a04003 	mov	r4, r3
     850:	e1a03002 	mov	r3, r2
     854:	e1a02001 	mov	r2, r1
     858:	e1a01000 	mov	r1, r0
     85c:	e3a0000d 	mov	r0, #13
     860:	ef000000 	svc	0x00000000
     864:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     868:	e12fff1e 	bx	lr

0000086c <uptime>:
     86c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     870:	e1a04003 	mov	r4, r3
     874:	e1a03002 	mov	r3, r2
     878:	e1a02001 	mov	r2, r1
     87c:	e1a01000 	mov	r1, r0
     880:	e3a0000e 	mov	r0, #14
     884:	ef000000 	svc	0x00000000
     888:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     88c:	e12fff1e 	bx	lr

00000890 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     890:	e92d4800 	push	{fp, lr}
     894:	e28db004 	add	fp, sp, #4
     898:	e24dd008 	sub	sp, sp, #8
     89c:	e50b0008 	str	r0, [fp, #-8]
     8a0:	e1a03001 	mov	r3, r1
     8a4:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     8a8:	e51b0008 	ldr	r0, [fp, #-8]
     8ac:	e24b3009 	sub	r3, fp, #9
     8b0:	e1a01003 	mov	r1, r3
     8b4:	e3a02001 	mov	r2, #1
     8b8:	ebffff64 	bl	650 <write>
}
     8bc:	e24bd004 	sub	sp, fp, #4
     8c0:	e8bd8800 	pop	{fp, pc}

000008c4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     8c4:	e92d4800 	push	{fp, lr}
     8c8:	e28db004 	add	fp, sp, #4
     8cc:	e24dd030 	sub	sp, sp, #48	; 0x30
     8d0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     8d4:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     8d8:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     8dc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     8e0:	e3a03000 	mov	r3, #0
     8e4:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     8e8:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     8ec:	e3530000 	cmp	r3, #0
     8f0:	0a000008 	beq	918 <printint+0x54>
     8f4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     8f8:	e3530000 	cmp	r3, #0
     8fc:	aa000005 	bge	918 <printint+0x54>
        neg = 1;
     900:	e3a03001 	mov	r3, #1
     904:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     908:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     90c:	e2633000 	rsb	r3, r3, #0
     910:	e50b3010 	str	r3, [fp, #-16]
     914:	ea000001 	b	920 <printint+0x5c>
    } else {
        x = xx;
     918:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     91c:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     920:	e3a03000 	mov	r3, #0
     924:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     928:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     92c:	e51b2010 	ldr	r2, [fp, #-16]
     930:	e1a00002 	mov	r0, r2
     934:	e1a01003 	mov	r1, r3
     938:	eb0001e5 	bl	10d4 <__aeabi_uidivmod>
     93c:	e1a03001 	mov	r3, r1
     940:	e1a02003 	mov	r2, r3
     944:	e3013110 	movw	r3, #4368	; 0x1110
     948:	e3403000 	movt	r3, #0
     94c:	e7d32002 	ldrb	r2, [r3, r2]
     950:	e3e0001b 	mvn	r0, #27
     954:	e51b3008 	ldr	r3, [fp, #-8]
     958:	e24bc004 	sub	ip, fp, #4
     95c:	e08c1003 	add	r1, ip, r3
     960:	e1a03000 	mov	r3, r0
     964:	e0813003 	add	r3, r1, r3
     968:	e5c32000 	strb	r2, [r3]
     96c:	e51b3008 	ldr	r3, [fp, #-8]
     970:	e2833001 	add	r3, r3, #1
     974:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     978:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     97c:	e51b0010 	ldr	r0, [fp, #-16]
     980:	e1a01003 	mov	r1, r3
     984:	eb000195 	bl	fe0 <__aeabi_uidiv>
     988:	e1a03000 	mov	r3, r0
     98c:	e50b3010 	str	r3, [fp, #-16]
     990:	e51b3010 	ldr	r3, [fp, #-16]
     994:	e3530000 	cmp	r3, #0
     998:	1affffe2 	bne	928 <printint+0x64>
    if(neg)
     99c:	e51b300c 	ldr	r3, [fp, #-12]
     9a0:	e3530000 	cmp	r3, #0
     9a4:	0a000015 	beq	a00 <printint+0x13c>
        buf[i++] = '-';
     9a8:	e3e0101b 	mvn	r1, #27
     9ac:	e51b3008 	ldr	r3, [fp, #-8]
     9b0:	e24b0004 	sub	r0, fp, #4
     9b4:	e0802003 	add	r2, r0, r3
     9b8:	e1a03001 	mov	r3, r1
     9bc:	e0823003 	add	r3, r2, r3
     9c0:	e3a0202d 	mov	r2, #45	; 0x2d
     9c4:	e5c32000 	strb	r2, [r3]
     9c8:	e51b3008 	ldr	r3, [fp, #-8]
     9cc:	e2833001 	add	r3, r3, #1
     9d0:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     9d4:	ea000009 	b	a00 <printint+0x13c>
        putc(fd, buf[i]);
     9d8:	e3e0101b 	mvn	r1, #27
     9dc:	e51b3008 	ldr	r3, [fp, #-8]
     9e0:	e24bc004 	sub	ip, fp, #4
     9e4:	e08c2003 	add	r2, ip, r3
     9e8:	e1a03001 	mov	r3, r1
     9ec:	e0823003 	add	r3, r2, r3
     9f0:	e5d33000 	ldrb	r3, [r3]
     9f4:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     9f8:	e1a01003 	mov	r1, r3
     9fc:	ebffffa3 	bl	890 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     a00:	e51b3008 	ldr	r3, [fp, #-8]
     a04:	e2433001 	sub	r3, r3, #1
     a08:	e50b3008 	str	r3, [fp, #-8]
     a0c:	e51b3008 	ldr	r3, [fp, #-8]
     a10:	e3530000 	cmp	r3, #0
     a14:	aaffffef 	bge	9d8 <printint+0x114>
        putc(fd, buf[i]);
}
     a18:	e24bd004 	sub	sp, fp, #4
     a1c:	e8bd8800 	pop	{fp, pc}

00000a20 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     a20:	e92d000e 	push	{r1, r2, r3}
     a24:	e92d4800 	push	{fp, lr}
     a28:	e28db004 	add	fp, sp, #4
     a2c:	e24dd024 	sub	sp, sp, #36	; 0x24
     a30:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     a34:	e3a03000 	mov	r3, #0
     a38:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     a3c:	e28b3008 	add	r3, fp, #8
     a40:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     a44:	e3a03000 	mov	r3, #0
     a48:	e50b3010 	str	r3, [fp, #-16]
     a4c:	ea000077 	b	c30 <printf+0x210>
        c = fmt[i] & 0xff;
     a50:	e59b2004 	ldr	r2, [fp, #4]
     a54:	e51b3010 	ldr	r3, [fp, #-16]
     a58:	e0823003 	add	r3, r2, r3
     a5c:	e5d33000 	ldrb	r3, [r3]
     a60:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     a64:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a68:	e3530000 	cmp	r3, #0
     a6c:	1a00000b 	bne	aa0 <printf+0x80>
            if(c == '%'){
     a70:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a74:	e3530025 	cmp	r3, #37	; 0x25
     a78:	1a000002 	bne	a88 <printf+0x68>
                state = '%';
     a7c:	e3a03025 	mov	r3, #37	; 0x25
     a80:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     a84:	ea000066 	b	c24 <printf+0x204>
            } else {
                putc(fd, c);
     a88:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a8c:	e6ef3073 	uxtb	r3, r3
     a90:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     a94:	e1a01003 	mov	r1, r3
     a98:	ebffff7c 	bl	890 <putc>
     a9c:	ea000060 	b	c24 <printf+0x204>
            }
        } else if(state == '%'){
     aa0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     aa4:	e3530025 	cmp	r3, #37	; 0x25
     aa8:	1a00005d 	bne	c24 <printf+0x204>
            if(c == 'd'){
     aac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ab0:	e3530064 	cmp	r3, #100	; 0x64
     ab4:	1a00000a 	bne	ae4 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     ab8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     abc:	e5933000 	ldr	r3, [r3]
     ac0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ac4:	e1a01003 	mov	r1, r3
     ac8:	e3a0200a 	mov	r2, #10
     acc:	e3a03001 	mov	r3, #1
     ad0:	ebffff7b 	bl	8c4 <printint>
                ap++;
     ad4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ad8:	e2833004 	add	r3, r3, #4
     adc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     ae0:	ea00004d 	b	c1c <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     ae4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ae8:	e3530078 	cmp	r3, #120	; 0x78
     aec:	0a000002 	beq	afc <printf+0xdc>
     af0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     af4:	e3530070 	cmp	r3, #112	; 0x70
     af8:	1a00000a 	bne	b28 <printf+0x108>
                printint(fd, *ap, 16, 0);
     afc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b00:	e5933000 	ldr	r3, [r3]
     b04:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b08:	e1a01003 	mov	r1, r3
     b0c:	e3a02010 	mov	r2, #16
     b10:	e3a03000 	mov	r3, #0
     b14:	ebffff6a 	bl	8c4 <printint>
                ap++;
     b18:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b1c:	e2833004 	add	r3, r3, #4
     b20:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b24:	ea00003c 	b	c1c <printf+0x1fc>
            } else if(c == 's'){
     b28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b2c:	e3530073 	cmp	r3, #115	; 0x73
     b30:	1a00001b 	bne	ba4 <printf+0x184>
                s = (char*)*ap;
     b34:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b38:	e5933000 	ldr	r3, [r3]
     b3c:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     b40:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b44:	e2833004 	add	r3, r3, #4
     b48:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     b4c:	e51b300c 	ldr	r3, [fp, #-12]
     b50:	e3530000 	cmp	r3, #0
     b54:	1a00000c 	bne	b8c <printf+0x16c>
                    s = "(null)";
     b58:	e3013108 	movw	r3, #4360	; 0x1108
     b5c:	e3403000 	movt	r3, #0
     b60:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     b64:	ea000008 	b	b8c <printf+0x16c>
                    putc(fd, *s);
     b68:	e51b300c 	ldr	r3, [fp, #-12]
     b6c:	e5d33000 	ldrb	r3, [r3]
     b70:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b74:	e1a01003 	mov	r1, r3
     b78:	ebffff44 	bl	890 <putc>
                    s++;
     b7c:	e51b300c 	ldr	r3, [fp, #-12]
     b80:	e2833001 	add	r3, r3, #1
     b84:	e50b300c 	str	r3, [fp, #-12]
     b88:	ea000000 	b	b90 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     b8c:	e1a00000 	nop			; (mov r0, r0)
     b90:	e51b300c 	ldr	r3, [fp, #-12]
     b94:	e5d33000 	ldrb	r3, [r3]
     b98:	e3530000 	cmp	r3, #0
     b9c:	1afffff1 	bne	b68 <printf+0x148>
     ba0:	ea00001d 	b	c1c <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     ba4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ba8:	e3530063 	cmp	r3, #99	; 0x63
     bac:	1a000009 	bne	bd8 <printf+0x1b8>
                putc(fd, *ap);
     bb0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bb4:	e5933000 	ldr	r3, [r3]
     bb8:	e6ef3073 	uxtb	r3, r3
     bbc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bc0:	e1a01003 	mov	r1, r3
     bc4:	ebffff31 	bl	890 <putc>
                ap++;
     bc8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bcc:	e2833004 	add	r3, r3, #4
     bd0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bd4:	ea000010 	b	c1c <printf+0x1fc>
            } else if(c == '%'){
     bd8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bdc:	e3530025 	cmp	r3, #37	; 0x25
     be0:	1a000005 	bne	bfc <printf+0x1dc>
                putc(fd, c);
     be4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     be8:	e6ef3073 	uxtb	r3, r3
     bec:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bf0:	e1a01003 	mov	r1, r3
     bf4:	ebffff25 	bl	890 <putc>
     bf8:	ea000007 	b	c1c <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     bfc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c00:	e3a01025 	mov	r1, #37	; 0x25
     c04:	ebffff21 	bl	890 <putc>
                putc(fd, c);
     c08:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c0c:	e6ef3073 	uxtb	r3, r3
     c10:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c14:	e1a01003 	mov	r1, r3
     c18:	ebffff1c 	bl	890 <putc>
            }
            state = 0;
     c1c:	e3a03000 	mov	r3, #0
     c20:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     c24:	e51b3010 	ldr	r3, [fp, #-16]
     c28:	e2833001 	add	r3, r3, #1
     c2c:	e50b3010 	str	r3, [fp, #-16]
     c30:	e59b2004 	ldr	r2, [fp, #4]
     c34:	e51b3010 	ldr	r3, [fp, #-16]
     c38:	e0823003 	add	r3, r2, r3
     c3c:	e5d33000 	ldrb	r3, [r3]
     c40:	e3530000 	cmp	r3, #0
     c44:	1affff81 	bne	a50 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     c48:	e24bd004 	sub	sp, fp, #4
     c4c:	e8bd4800 	pop	{fp, lr}
     c50:	e28dd00c 	add	sp, sp, #12
     c54:	e12fff1e 	bx	lr

00000c58 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c5c:	e28db000 	add	fp, sp, #0
     c60:	e24dd014 	sub	sp, sp, #20
     c64:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     c68:	e51b3010 	ldr	r3, [fp, #-16]
     c6c:	e2433008 	sub	r3, r3, #8
     c70:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c74:	e301312c 	movw	r3, #4396	; 0x112c
     c78:	e3403000 	movt	r3, #0
     c7c:	e5933000 	ldr	r3, [r3]
     c80:	e50b3008 	str	r3, [fp, #-8]
     c84:	ea000010 	b	ccc <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c88:	e51b3008 	ldr	r3, [fp, #-8]
     c8c:	e5932000 	ldr	r2, [r3]
     c90:	e51b3008 	ldr	r3, [fp, #-8]
     c94:	e1520003 	cmp	r2, r3
     c98:	8a000008 	bhi	cc0 <free+0x68>
     c9c:	e51b200c 	ldr	r2, [fp, #-12]
     ca0:	e51b3008 	ldr	r3, [fp, #-8]
     ca4:	e1520003 	cmp	r2, r3
     ca8:	8a000010 	bhi	cf0 <free+0x98>
     cac:	e51b3008 	ldr	r3, [fp, #-8]
     cb0:	e5932000 	ldr	r2, [r3]
     cb4:	e51b300c 	ldr	r3, [fp, #-12]
     cb8:	e1520003 	cmp	r2, r3
     cbc:	8a00000b 	bhi	cf0 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     cc0:	e51b3008 	ldr	r3, [fp, #-8]
     cc4:	e5933000 	ldr	r3, [r3]
     cc8:	e50b3008 	str	r3, [fp, #-8]
     ccc:	e51b200c 	ldr	r2, [fp, #-12]
     cd0:	e51b3008 	ldr	r3, [fp, #-8]
     cd4:	e1520003 	cmp	r2, r3
     cd8:	9affffea 	bls	c88 <free+0x30>
     cdc:	e51b3008 	ldr	r3, [fp, #-8]
     ce0:	e5932000 	ldr	r2, [r3]
     ce4:	e51b300c 	ldr	r3, [fp, #-12]
     ce8:	e1520003 	cmp	r2, r3
     cec:	9affffe5 	bls	c88 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     cf0:	e51b300c 	ldr	r3, [fp, #-12]
     cf4:	e5933004 	ldr	r3, [r3, #4]
     cf8:	e1a03183 	lsl	r3, r3, #3
     cfc:	e51b200c 	ldr	r2, [fp, #-12]
     d00:	e0822003 	add	r2, r2, r3
     d04:	e51b3008 	ldr	r3, [fp, #-8]
     d08:	e5933000 	ldr	r3, [r3]
     d0c:	e1520003 	cmp	r2, r3
     d10:	1a00000d 	bne	d4c <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     d14:	e51b300c 	ldr	r3, [fp, #-12]
     d18:	e5932004 	ldr	r2, [r3, #4]
     d1c:	e51b3008 	ldr	r3, [fp, #-8]
     d20:	e5933000 	ldr	r3, [r3]
     d24:	e5933004 	ldr	r3, [r3, #4]
     d28:	e0822003 	add	r2, r2, r3
     d2c:	e51b300c 	ldr	r3, [fp, #-12]
     d30:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     d34:	e51b3008 	ldr	r3, [fp, #-8]
     d38:	e5933000 	ldr	r3, [r3]
     d3c:	e5932000 	ldr	r2, [r3]
     d40:	e51b300c 	ldr	r3, [fp, #-12]
     d44:	e5832000 	str	r2, [r3]
     d48:	ea000003 	b	d5c <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     d4c:	e51b3008 	ldr	r3, [fp, #-8]
     d50:	e5932000 	ldr	r2, [r3]
     d54:	e51b300c 	ldr	r3, [fp, #-12]
     d58:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     d5c:	e51b3008 	ldr	r3, [fp, #-8]
     d60:	e5933004 	ldr	r3, [r3, #4]
     d64:	e1a03183 	lsl	r3, r3, #3
     d68:	e51b2008 	ldr	r2, [fp, #-8]
     d6c:	e0822003 	add	r2, r2, r3
     d70:	e51b300c 	ldr	r3, [fp, #-12]
     d74:	e1520003 	cmp	r2, r3
     d78:	1a00000b 	bne	dac <free+0x154>
        p->s.size += bp->s.size;
     d7c:	e51b3008 	ldr	r3, [fp, #-8]
     d80:	e5932004 	ldr	r2, [r3, #4]
     d84:	e51b300c 	ldr	r3, [fp, #-12]
     d88:	e5933004 	ldr	r3, [r3, #4]
     d8c:	e0822003 	add	r2, r2, r3
     d90:	e51b3008 	ldr	r3, [fp, #-8]
     d94:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     d98:	e51b300c 	ldr	r3, [fp, #-12]
     d9c:	e5932000 	ldr	r2, [r3]
     da0:	e51b3008 	ldr	r3, [fp, #-8]
     da4:	e5832000 	str	r2, [r3]
     da8:	ea000002 	b	db8 <free+0x160>
    } else
        p->s.ptr = bp;
     dac:	e51b3008 	ldr	r3, [fp, #-8]
     db0:	e51b200c 	ldr	r2, [fp, #-12]
     db4:	e5832000 	str	r2, [r3]
    freep = p;
     db8:	e301312c 	movw	r3, #4396	; 0x112c
     dbc:	e3403000 	movt	r3, #0
     dc0:	e51b2008 	ldr	r2, [fp, #-8]
     dc4:	e5832000 	str	r2, [r3]
}
     dc8:	e28bd000 	add	sp, fp, #0
     dcc:	e8bd0800 	pop	{fp}
     dd0:	e12fff1e 	bx	lr

00000dd4 <morecore>:

static Header*
morecore(uint nu)
{
     dd4:	e92d4800 	push	{fp, lr}
     dd8:	e28db004 	add	fp, sp, #4
     ddc:	e24dd010 	sub	sp, sp, #16
     de0:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     de4:	e51b2010 	ldr	r2, [fp, #-16]
     de8:	e3003fff 	movw	r3, #4095	; 0xfff
     dec:	e1520003 	cmp	r2, r3
     df0:	8a000001 	bhi	dfc <morecore+0x28>
        nu = 4096;
     df4:	e3a03a01 	mov	r3, #4096	; 0x1000
     df8:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     dfc:	e51b3010 	ldr	r3, [fp, #-16]
     e00:	e1a03183 	lsl	r3, r3, #3
     e04:	e1a00003 	mov	r0, r3
     e08:	ebfffe85 	bl	824 <sbrk>
     e0c:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     e10:	e51b3008 	ldr	r3, [fp, #-8]
     e14:	e3730001 	cmn	r3, #1
     e18:	1a000001 	bne	e24 <morecore+0x50>
        return 0;
     e1c:	e3a03000 	mov	r3, #0
     e20:	ea00000b 	b	e54 <morecore+0x80>
    hp = (Header*)p;
     e24:	e51b3008 	ldr	r3, [fp, #-8]
     e28:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     e2c:	e51b300c 	ldr	r3, [fp, #-12]
     e30:	e51b2010 	ldr	r2, [fp, #-16]
     e34:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     e38:	e51b300c 	ldr	r3, [fp, #-12]
     e3c:	e2833008 	add	r3, r3, #8
     e40:	e1a00003 	mov	r0, r3
     e44:	ebffff83 	bl	c58 <free>
    return freep;
     e48:	e301312c 	movw	r3, #4396	; 0x112c
     e4c:	e3403000 	movt	r3, #0
     e50:	e5933000 	ldr	r3, [r3]
}
     e54:	e1a00003 	mov	r0, r3
     e58:	e24bd004 	sub	sp, fp, #4
     e5c:	e8bd8800 	pop	{fp, pc}

00000e60 <malloc>:

void*
malloc(uint nbytes)
{
     e60:	e92d4800 	push	{fp, lr}
     e64:	e28db004 	add	fp, sp, #4
     e68:	e24dd018 	sub	sp, sp, #24
     e6c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e74:	e2833007 	add	r3, r3, #7
     e78:	e1a031a3 	lsr	r3, r3, #3
     e7c:	e2833001 	add	r3, r3, #1
     e80:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     e84:	e301312c 	movw	r3, #4396	; 0x112c
     e88:	e3403000 	movt	r3, #0
     e8c:	e5933000 	ldr	r3, [r3]
     e90:	e50b300c 	str	r3, [fp, #-12]
     e94:	e51b300c 	ldr	r3, [fp, #-12]
     e98:	e3530000 	cmp	r3, #0
     e9c:	1a000010 	bne	ee4 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     ea0:	e3013124 	movw	r3, #4388	; 0x1124
     ea4:	e3403000 	movt	r3, #0
     ea8:	e50b300c 	str	r3, [fp, #-12]
     eac:	e301312c 	movw	r3, #4396	; 0x112c
     eb0:	e3403000 	movt	r3, #0
     eb4:	e51b200c 	ldr	r2, [fp, #-12]
     eb8:	e5832000 	str	r2, [r3]
     ebc:	e301312c 	movw	r3, #4396	; 0x112c
     ec0:	e3403000 	movt	r3, #0
     ec4:	e5932000 	ldr	r2, [r3]
     ec8:	e3013124 	movw	r3, #4388	; 0x1124
     ecc:	e3403000 	movt	r3, #0
     ed0:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     ed4:	e3013124 	movw	r3, #4388	; 0x1124
     ed8:	e3403000 	movt	r3, #0
     edc:	e3a02000 	mov	r2, #0
     ee0:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     ee4:	e51b300c 	ldr	r3, [fp, #-12]
     ee8:	e5933000 	ldr	r3, [r3]
     eec:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     ef0:	e51b3008 	ldr	r3, [fp, #-8]
     ef4:	e5932004 	ldr	r2, [r3, #4]
     ef8:	e51b3010 	ldr	r3, [fp, #-16]
     efc:	e1520003 	cmp	r2, r3
     f00:	3a00001f 	bcc	f84 <malloc+0x124>
            if(p->s.size == nunits)
     f04:	e51b3008 	ldr	r3, [fp, #-8]
     f08:	e5932004 	ldr	r2, [r3, #4]
     f0c:	e51b3010 	ldr	r3, [fp, #-16]
     f10:	e1520003 	cmp	r2, r3
     f14:	1a000004 	bne	f2c <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     f18:	e51b3008 	ldr	r3, [fp, #-8]
     f1c:	e5932000 	ldr	r2, [r3]
     f20:	e51b300c 	ldr	r3, [fp, #-12]
     f24:	e5832000 	str	r2, [r3]
     f28:	ea00000e 	b	f68 <malloc+0x108>
            else {
                p->s.size -= nunits;
     f2c:	e51b3008 	ldr	r3, [fp, #-8]
     f30:	e5932004 	ldr	r2, [r3, #4]
     f34:	e51b3010 	ldr	r3, [fp, #-16]
     f38:	e0632002 	rsb	r2, r3, r2
     f3c:	e51b3008 	ldr	r3, [fp, #-8]
     f40:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     f44:	e51b3008 	ldr	r3, [fp, #-8]
     f48:	e5933004 	ldr	r3, [r3, #4]
     f4c:	e1a03183 	lsl	r3, r3, #3
     f50:	e51b2008 	ldr	r2, [fp, #-8]
     f54:	e0823003 	add	r3, r2, r3
     f58:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     f5c:	e51b3008 	ldr	r3, [fp, #-8]
     f60:	e51b2010 	ldr	r2, [fp, #-16]
     f64:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     f68:	e301312c 	movw	r3, #4396	; 0x112c
     f6c:	e3403000 	movt	r3, #0
     f70:	e51b200c 	ldr	r2, [fp, #-12]
     f74:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     f78:	e51b3008 	ldr	r3, [fp, #-8]
     f7c:	e2833008 	add	r3, r3, #8
     f80:	ea000013 	b	fd4 <malloc+0x174>
        }
        if(p == freep)
     f84:	e301312c 	movw	r3, #4396	; 0x112c
     f88:	e3403000 	movt	r3, #0
     f8c:	e5933000 	ldr	r3, [r3]
     f90:	e51b2008 	ldr	r2, [fp, #-8]
     f94:	e1520003 	cmp	r2, r3
     f98:	1a000007 	bne	fbc <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     f9c:	e51b0010 	ldr	r0, [fp, #-16]
     fa0:	ebffff8b 	bl	dd4 <morecore>
     fa4:	e50b0008 	str	r0, [fp, #-8]
     fa8:	e51b3008 	ldr	r3, [fp, #-8]
     fac:	e3530000 	cmp	r3, #0
     fb0:	1a000001 	bne	fbc <malloc+0x15c>
                return 0;
     fb4:	e3a03000 	mov	r3, #0
     fb8:	ea000005 	b	fd4 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fbc:	e51b3008 	ldr	r3, [fp, #-8]
     fc0:	e50b300c 	str	r3, [fp, #-12]
     fc4:	e51b3008 	ldr	r3, [fp, #-8]
     fc8:	e5933000 	ldr	r3, [r3]
     fcc:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
     fd0:	eaffffc6 	b	ef0 <malloc+0x90>
}
     fd4:	e1a00003 	mov	r0, r3
     fd8:	e24bd004 	sub	sp, fp, #4
     fdc:	e8bd8800 	pop	{fp, pc}

00000fe0 <__aeabi_uidiv>:
     fe0:	e2512001 	subs	r2, r1, #1
     fe4:	012fff1e 	bxeq	lr
     fe8:	3a000036 	bcc	10c8 <__aeabi_uidiv+0xe8>
     fec:	e1500001 	cmp	r0, r1
     ff0:	9a000022 	bls	1080 <__aeabi_uidiv+0xa0>
     ff4:	e1110002 	tst	r1, r2
     ff8:	0a000023 	beq	108c <__aeabi_uidiv+0xac>
     ffc:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1000:	01a01181 	lsleq	r1, r1, #3
    1004:	03a03008 	moveq	r3, #8
    1008:	13a03001 	movne	r3, #1
    100c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1010:	31510000 	cmpcc	r1, r0
    1014:	31a01201 	lslcc	r1, r1, #4
    1018:	31a03203 	lslcc	r3, r3, #4
    101c:	3afffffa 	bcc	100c <__aeabi_uidiv+0x2c>
    1020:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1024:	31510000 	cmpcc	r1, r0
    1028:	31a01081 	lslcc	r1, r1, #1
    102c:	31a03083 	lslcc	r3, r3, #1
    1030:	3afffffa 	bcc	1020 <__aeabi_uidiv+0x40>
    1034:	e3a02000 	mov	r2, #0
    1038:	e1500001 	cmp	r0, r1
    103c:	20400001 	subcs	r0, r0, r1
    1040:	21822003 	orrcs	r2, r2, r3
    1044:	e15000a1 	cmp	r0, r1, lsr #1
    1048:	204000a1 	subcs	r0, r0, r1, lsr #1
    104c:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1050:	e1500121 	cmp	r0, r1, lsr #2
    1054:	20400121 	subcs	r0, r0, r1, lsr #2
    1058:	21822123 	orrcs	r2, r2, r3, lsr #2
    105c:	e15001a1 	cmp	r0, r1, lsr #3
    1060:	204001a1 	subcs	r0, r0, r1, lsr #3
    1064:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1068:	e3500000 	cmp	r0, #0
    106c:	11b03223 	lsrsne	r3, r3, #4
    1070:	11a01221 	lsrne	r1, r1, #4
    1074:	1affffef 	bne	1038 <__aeabi_uidiv+0x58>
    1078:	e1a00002 	mov	r0, r2
    107c:	e12fff1e 	bx	lr
    1080:	03a00001 	moveq	r0, #1
    1084:	13a00000 	movne	r0, #0
    1088:	e12fff1e 	bx	lr
    108c:	e3510801 	cmp	r1, #65536	; 0x10000
    1090:	21a01821 	lsrcs	r1, r1, #16
    1094:	23a02010 	movcs	r2, #16
    1098:	33a02000 	movcc	r2, #0
    109c:	e3510c01 	cmp	r1, #256	; 0x100
    10a0:	21a01421 	lsrcs	r1, r1, #8
    10a4:	22822008 	addcs	r2, r2, #8
    10a8:	e3510010 	cmp	r1, #16
    10ac:	21a01221 	lsrcs	r1, r1, #4
    10b0:	22822004 	addcs	r2, r2, #4
    10b4:	e3510004 	cmp	r1, #4
    10b8:	82822003 	addhi	r2, r2, #3
    10bc:	908220a1 	addls	r2, r2, r1, lsr #1
    10c0:	e1a00230 	lsr	r0, r0, r2
    10c4:	e12fff1e 	bx	lr
    10c8:	e3500000 	cmp	r0, #0
    10cc:	13e00000 	mvnne	r0, #0
    10d0:	ea000007 	b	10f4 <__aeabi_idiv0>

000010d4 <__aeabi_uidivmod>:
    10d4:	e3510000 	cmp	r1, #0
    10d8:	0afffffa 	beq	10c8 <__aeabi_uidiv+0xe8>
    10dc:	e92d4003 	push	{r0, r1, lr}
    10e0:	ebffffbe 	bl	fe0 <__aeabi_uidiv>
    10e4:	e8bd4006 	pop	{r1, r2, lr}
    10e8:	e0030092 	mul	r3, r2, r0
    10ec:	e0411003 	sub	r1, r1, r3
    10f0:	e12fff1e 	bx	lr

000010f4 <__aeabi_idiv0>:
    10f4:	e12fff1e 	bx	lr
