
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
      48:	e301311c 	movw	r3, #4380	; 0x111c
      4c:	e3403000 	movt	r3, #0
      50:	ea000001 	b	5c <main+0x5c>
      54:	e3013120 	movw	r3, #4384	; 0x1120
      58:	e3403000 	movt	r3, #0
      5c:	e3a00001 	mov	r0, #1
      60:	e3011124 	movw	r1, #4388	; 0x1124
      64:	e3401000 	movt	r1, #0
      68:	eb000275 	bl	a44 <printf>
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

00000890 <kthread_create>:
     890:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     894:	e1a04003 	mov	r4, r3
     898:	e1a03002 	mov	r3, r2
     89c:	e1a02001 	mov	r2, r1
     8a0:	e1a01000 	mov	r1, r0
     8a4:	e3a00016 	mov	r0, #22
     8a8:	ef000000 	svc	0x00000000
     8ac:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8b0:	e12fff1e 	bx	lr

000008b4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     8b4:	e92d4800 	push	{fp, lr}
     8b8:	e28db004 	add	fp, sp, #4
     8bc:	e24dd008 	sub	sp, sp, #8
     8c0:	e50b0008 	str	r0, [fp, #-8]
     8c4:	e1a03001 	mov	r3, r1
     8c8:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     8cc:	e51b0008 	ldr	r0, [fp, #-8]
     8d0:	e24b3009 	sub	r3, fp, #9
     8d4:	e1a01003 	mov	r1, r3
     8d8:	e3a02001 	mov	r2, #1
     8dc:	ebffff5b 	bl	650 <write>
}
     8e0:	e24bd004 	sub	sp, fp, #4
     8e4:	e8bd8800 	pop	{fp, pc}

000008e8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     8e8:	e92d4800 	push	{fp, lr}
     8ec:	e28db004 	add	fp, sp, #4
     8f0:	e24dd030 	sub	sp, sp, #48	; 0x30
     8f4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     8f8:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     8fc:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     900:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     904:	e3a03000 	mov	r3, #0
     908:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     90c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     910:	e3530000 	cmp	r3, #0
     914:	0a000008 	beq	93c <printint+0x54>
     918:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     91c:	e3530000 	cmp	r3, #0
     920:	aa000005 	bge	93c <printint+0x54>
        neg = 1;
     924:	e3a03001 	mov	r3, #1
     928:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     92c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     930:	e2633000 	rsb	r3, r3, #0
     934:	e50b3010 	str	r3, [fp, #-16]
     938:	ea000001 	b	944 <printint+0x5c>
    } else {
        x = xx;
     93c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     940:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     944:	e3a03000 	mov	r3, #0
     948:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     94c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     950:	e51b2010 	ldr	r2, [fp, #-16]
     954:	e1a00002 	mov	r0, r2
     958:	e1a01003 	mov	r1, r3
     95c:	eb0001e5 	bl	10f8 <__aeabi_uidivmod>
     960:	e1a03001 	mov	r3, r1
     964:	e1a02003 	mov	r2, r3
     968:	e3013134 	movw	r3, #4404	; 0x1134
     96c:	e3403000 	movt	r3, #0
     970:	e7d32002 	ldrb	r2, [r3, r2]
     974:	e3e0001b 	mvn	r0, #27
     978:	e51b3008 	ldr	r3, [fp, #-8]
     97c:	e24bc004 	sub	ip, fp, #4
     980:	e08c1003 	add	r1, ip, r3
     984:	e1a03000 	mov	r3, r0
     988:	e0813003 	add	r3, r1, r3
     98c:	e5c32000 	strb	r2, [r3]
     990:	e51b3008 	ldr	r3, [fp, #-8]
     994:	e2833001 	add	r3, r3, #1
     998:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     99c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     9a0:	e51b0010 	ldr	r0, [fp, #-16]
     9a4:	e1a01003 	mov	r1, r3
     9a8:	eb000195 	bl	1004 <__aeabi_uidiv>
     9ac:	e1a03000 	mov	r3, r0
     9b0:	e50b3010 	str	r3, [fp, #-16]
     9b4:	e51b3010 	ldr	r3, [fp, #-16]
     9b8:	e3530000 	cmp	r3, #0
     9bc:	1affffe2 	bne	94c <printint+0x64>
    if(neg)
     9c0:	e51b300c 	ldr	r3, [fp, #-12]
     9c4:	e3530000 	cmp	r3, #0
     9c8:	0a000015 	beq	a24 <printint+0x13c>
        buf[i++] = '-';
     9cc:	e3e0101b 	mvn	r1, #27
     9d0:	e51b3008 	ldr	r3, [fp, #-8]
     9d4:	e24b0004 	sub	r0, fp, #4
     9d8:	e0802003 	add	r2, r0, r3
     9dc:	e1a03001 	mov	r3, r1
     9e0:	e0823003 	add	r3, r2, r3
     9e4:	e3a0202d 	mov	r2, #45	; 0x2d
     9e8:	e5c32000 	strb	r2, [r3]
     9ec:	e51b3008 	ldr	r3, [fp, #-8]
     9f0:	e2833001 	add	r3, r3, #1
     9f4:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     9f8:	ea000009 	b	a24 <printint+0x13c>
        putc(fd, buf[i]);
     9fc:	e3e0101b 	mvn	r1, #27
     a00:	e51b3008 	ldr	r3, [fp, #-8]
     a04:	e24bc004 	sub	ip, fp, #4
     a08:	e08c2003 	add	r2, ip, r3
     a0c:	e1a03001 	mov	r3, r1
     a10:	e0823003 	add	r3, r2, r3
     a14:	e5d33000 	ldrb	r3, [r3]
     a18:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     a1c:	e1a01003 	mov	r1, r3
     a20:	ebffffa3 	bl	8b4 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     a24:	e51b3008 	ldr	r3, [fp, #-8]
     a28:	e2433001 	sub	r3, r3, #1
     a2c:	e50b3008 	str	r3, [fp, #-8]
     a30:	e51b3008 	ldr	r3, [fp, #-8]
     a34:	e3530000 	cmp	r3, #0
     a38:	aaffffef 	bge	9fc <printint+0x114>
        putc(fd, buf[i]);
}
     a3c:	e24bd004 	sub	sp, fp, #4
     a40:	e8bd8800 	pop	{fp, pc}

00000a44 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     a44:	e92d000e 	push	{r1, r2, r3}
     a48:	e92d4800 	push	{fp, lr}
     a4c:	e28db004 	add	fp, sp, #4
     a50:	e24dd024 	sub	sp, sp, #36	; 0x24
     a54:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     a58:	e3a03000 	mov	r3, #0
     a5c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     a60:	e28b3008 	add	r3, fp, #8
     a64:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     a68:	e3a03000 	mov	r3, #0
     a6c:	e50b3010 	str	r3, [fp, #-16]
     a70:	ea000077 	b	c54 <printf+0x210>
        c = fmt[i] & 0xff;
     a74:	e59b2004 	ldr	r2, [fp, #4]
     a78:	e51b3010 	ldr	r3, [fp, #-16]
     a7c:	e0823003 	add	r3, r2, r3
     a80:	e5d33000 	ldrb	r3, [r3]
     a84:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     a88:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a8c:	e3530000 	cmp	r3, #0
     a90:	1a00000b 	bne	ac4 <printf+0x80>
            if(c == '%'){
     a94:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a98:	e3530025 	cmp	r3, #37	; 0x25
     a9c:	1a000002 	bne	aac <printf+0x68>
                state = '%';
     aa0:	e3a03025 	mov	r3, #37	; 0x25
     aa4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     aa8:	ea000066 	b	c48 <printf+0x204>
            } else {
                putc(fd, c);
     aac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ab0:	e6ef3073 	uxtb	r3, r3
     ab4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ab8:	e1a01003 	mov	r1, r3
     abc:	ebffff7c 	bl	8b4 <putc>
     ac0:	ea000060 	b	c48 <printf+0x204>
            }
        } else if(state == '%'){
     ac4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     ac8:	e3530025 	cmp	r3, #37	; 0x25
     acc:	1a00005d 	bne	c48 <printf+0x204>
            if(c == 'd'){
     ad0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ad4:	e3530064 	cmp	r3, #100	; 0x64
     ad8:	1a00000a 	bne	b08 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     adc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ae0:	e5933000 	ldr	r3, [r3]
     ae4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ae8:	e1a01003 	mov	r1, r3
     aec:	e3a0200a 	mov	r2, #10
     af0:	e3a03001 	mov	r3, #1
     af4:	ebffff7b 	bl	8e8 <printint>
                ap++;
     af8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     afc:	e2833004 	add	r3, r3, #4
     b00:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b04:	ea00004d 	b	c40 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     b08:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b0c:	e3530078 	cmp	r3, #120	; 0x78
     b10:	0a000002 	beq	b20 <printf+0xdc>
     b14:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b18:	e3530070 	cmp	r3, #112	; 0x70
     b1c:	1a00000a 	bne	b4c <printf+0x108>
                printint(fd, *ap, 16, 0);
     b20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b24:	e5933000 	ldr	r3, [r3]
     b28:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b2c:	e1a01003 	mov	r1, r3
     b30:	e3a02010 	mov	r2, #16
     b34:	e3a03000 	mov	r3, #0
     b38:	ebffff6a 	bl	8e8 <printint>
                ap++;
     b3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b40:	e2833004 	add	r3, r3, #4
     b44:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b48:	ea00003c 	b	c40 <printf+0x1fc>
            } else if(c == 's'){
     b4c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b50:	e3530073 	cmp	r3, #115	; 0x73
     b54:	1a00001b 	bne	bc8 <printf+0x184>
                s = (char*)*ap;
     b58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b5c:	e5933000 	ldr	r3, [r3]
     b60:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     b64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b68:	e2833004 	add	r3, r3, #4
     b6c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     b70:	e51b300c 	ldr	r3, [fp, #-12]
     b74:	e3530000 	cmp	r3, #0
     b78:	1a00000c 	bne	bb0 <printf+0x16c>
                    s = "(null)";
     b7c:	e301312c 	movw	r3, #4396	; 0x112c
     b80:	e3403000 	movt	r3, #0
     b84:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     b88:	ea000008 	b	bb0 <printf+0x16c>
                    putc(fd, *s);
     b8c:	e51b300c 	ldr	r3, [fp, #-12]
     b90:	e5d33000 	ldrb	r3, [r3]
     b94:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b98:	e1a01003 	mov	r1, r3
     b9c:	ebffff44 	bl	8b4 <putc>
                    s++;
     ba0:	e51b300c 	ldr	r3, [fp, #-12]
     ba4:	e2833001 	add	r3, r3, #1
     ba8:	e50b300c 	str	r3, [fp, #-12]
     bac:	ea000000 	b	bb4 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     bb0:	e1a00000 	nop			; (mov r0, r0)
     bb4:	e51b300c 	ldr	r3, [fp, #-12]
     bb8:	e5d33000 	ldrb	r3, [r3]
     bbc:	e3530000 	cmp	r3, #0
     bc0:	1afffff1 	bne	b8c <printf+0x148>
     bc4:	ea00001d 	b	c40 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     bc8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bcc:	e3530063 	cmp	r3, #99	; 0x63
     bd0:	1a000009 	bne	bfc <printf+0x1b8>
                putc(fd, *ap);
     bd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bd8:	e5933000 	ldr	r3, [r3]
     bdc:	e6ef3073 	uxtb	r3, r3
     be0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     be4:	e1a01003 	mov	r1, r3
     be8:	ebffff31 	bl	8b4 <putc>
                ap++;
     bec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bf0:	e2833004 	add	r3, r3, #4
     bf4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bf8:	ea000010 	b	c40 <printf+0x1fc>
            } else if(c == '%'){
     bfc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c00:	e3530025 	cmp	r3, #37	; 0x25
     c04:	1a000005 	bne	c20 <printf+0x1dc>
                putc(fd, c);
     c08:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c0c:	e6ef3073 	uxtb	r3, r3
     c10:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c14:	e1a01003 	mov	r1, r3
     c18:	ebffff25 	bl	8b4 <putc>
     c1c:	ea000007 	b	c40 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     c20:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c24:	e3a01025 	mov	r1, #37	; 0x25
     c28:	ebffff21 	bl	8b4 <putc>
                putc(fd, c);
     c2c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c30:	e6ef3073 	uxtb	r3, r3
     c34:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c38:	e1a01003 	mov	r1, r3
     c3c:	ebffff1c 	bl	8b4 <putc>
            }
            state = 0;
     c40:	e3a03000 	mov	r3, #0
     c44:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     c48:	e51b3010 	ldr	r3, [fp, #-16]
     c4c:	e2833001 	add	r3, r3, #1
     c50:	e50b3010 	str	r3, [fp, #-16]
     c54:	e59b2004 	ldr	r2, [fp, #4]
     c58:	e51b3010 	ldr	r3, [fp, #-16]
     c5c:	e0823003 	add	r3, r2, r3
     c60:	e5d33000 	ldrb	r3, [r3]
     c64:	e3530000 	cmp	r3, #0
     c68:	1affff81 	bne	a74 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     c6c:	e24bd004 	sub	sp, fp, #4
     c70:	e8bd4800 	pop	{fp, lr}
     c74:	e28dd00c 	add	sp, sp, #12
     c78:	e12fff1e 	bx	lr

00000c7c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c7c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c80:	e28db000 	add	fp, sp, #0
     c84:	e24dd014 	sub	sp, sp, #20
     c88:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     c8c:	e51b3010 	ldr	r3, [fp, #-16]
     c90:	e2433008 	sub	r3, r3, #8
     c94:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c98:	e3013150 	movw	r3, #4432	; 0x1150
     c9c:	e3403000 	movt	r3, #0
     ca0:	e5933000 	ldr	r3, [r3]
     ca4:	e50b3008 	str	r3, [fp, #-8]
     ca8:	ea000010 	b	cf0 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     cac:	e51b3008 	ldr	r3, [fp, #-8]
     cb0:	e5932000 	ldr	r2, [r3]
     cb4:	e51b3008 	ldr	r3, [fp, #-8]
     cb8:	e1520003 	cmp	r2, r3
     cbc:	8a000008 	bhi	ce4 <free+0x68>
     cc0:	e51b200c 	ldr	r2, [fp, #-12]
     cc4:	e51b3008 	ldr	r3, [fp, #-8]
     cc8:	e1520003 	cmp	r2, r3
     ccc:	8a000010 	bhi	d14 <free+0x98>
     cd0:	e51b3008 	ldr	r3, [fp, #-8]
     cd4:	e5932000 	ldr	r2, [r3]
     cd8:	e51b300c 	ldr	r3, [fp, #-12]
     cdc:	e1520003 	cmp	r2, r3
     ce0:	8a00000b 	bhi	d14 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ce4:	e51b3008 	ldr	r3, [fp, #-8]
     ce8:	e5933000 	ldr	r3, [r3]
     cec:	e50b3008 	str	r3, [fp, #-8]
     cf0:	e51b200c 	ldr	r2, [fp, #-12]
     cf4:	e51b3008 	ldr	r3, [fp, #-8]
     cf8:	e1520003 	cmp	r2, r3
     cfc:	9affffea 	bls	cac <free+0x30>
     d00:	e51b3008 	ldr	r3, [fp, #-8]
     d04:	e5932000 	ldr	r2, [r3]
     d08:	e51b300c 	ldr	r3, [fp, #-12]
     d0c:	e1520003 	cmp	r2, r3
     d10:	9affffe5 	bls	cac <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     d14:	e51b300c 	ldr	r3, [fp, #-12]
     d18:	e5933004 	ldr	r3, [r3, #4]
     d1c:	e1a03183 	lsl	r3, r3, #3
     d20:	e51b200c 	ldr	r2, [fp, #-12]
     d24:	e0822003 	add	r2, r2, r3
     d28:	e51b3008 	ldr	r3, [fp, #-8]
     d2c:	e5933000 	ldr	r3, [r3]
     d30:	e1520003 	cmp	r2, r3
     d34:	1a00000d 	bne	d70 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     d38:	e51b300c 	ldr	r3, [fp, #-12]
     d3c:	e5932004 	ldr	r2, [r3, #4]
     d40:	e51b3008 	ldr	r3, [fp, #-8]
     d44:	e5933000 	ldr	r3, [r3]
     d48:	e5933004 	ldr	r3, [r3, #4]
     d4c:	e0822003 	add	r2, r2, r3
     d50:	e51b300c 	ldr	r3, [fp, #-12]
     d54:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     d58:	e51b3008 	ldr	r3, [fp, #-8]
     d5c:	e5933000 	ldr	r3, [r3]
     d60:	e5932000 	ldr	r2, [r3]
     d64:	e51b300c 	ldr	r3, [fp, #-12]
     d68:	e5832000 	str	r2, [r3]
     d6c:	ea000003 	b	d80 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     d70:	e51b3008 	ldr	r3, [fp, #-8]
     d74:	e5932000 	ldr	r2, [r3]
     d78:	e51b300c 	ldr	r3, [fp, #-12]
     d7c:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e5933004 	ldr	r3, [r3, #4]
     d88:	e1a03183 	lsl	r3, r3, #3
     d8c:	e51b2008 	ldr	r2, [fp, #-8]
     d90:	e0822003 	add	r2, r2, r3
     d94:	e51b300c 	ldr	r3, [fp, #-12]
     d98:	e1520003 	cmp	r2, r3
     d9c:	1a00000b 	bne	dd0 <free+0x154>
        p->s.size += bp->s.size;
     da0:	e51b3008 	ldr	r3, [fp, #-8]
     da4:	e5932004 	ldr	r2, [r3, #4]
     da8:	e51b300c 	ldr	r3, [fp, #-12]
     dac:	e5933004 	ldr	r3, [r3, #4]
     db0:	e0822003 	add	r2, r2, r3
     db4:	e51b3008 	ldr	r3, [fp, #-8]
     db8:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     dbc:	e51b300c 	ldr	r3, [fp, #-12]
     dc0:	e5932000 	ldr	r2, [r3]
     dc4:	e51b3008 	ldr	r3, [fp, #-8]
     dc8:	e5832000 	str	r2, [r3]
     dcc:	ea000002 	b	ddc <free+0x160>
    } else
        p->s.ptr = bp;
     dd0:	e51b3008 	ldr	r3, [fp, #-8]
     dd4:	e51b200c 	ldr	r2, [fp, #-12]
     dd8:	e5832000 	str	r2, [r3]
    freep = p;
     ddc:	e3013150 	movw	r3, #4432	; 0x1150
     de0:	e3403000 	movt	r3, #0
     de4:	e51b2008 	ldr	r2, [fp, #-8]
     de8:	e5832000 	str	r2, [r3]
}
     dec:	e28bd000 	add	sp, fp, #0
     df0:	e8bd0800 	pop	{fp}
     df4:	e12fff1e 	bx	lr

00000df8 <morecore>:

static Header*
morecore(uint nu)
{
     df8:	e92d4800 	push	{fp, lr}
     dfc:	e28db004 	add	fp, sp, #4
     e00:	e24dd010 	sub	sp, sp, #16
     e04:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     e08:	e51b2010 	ldr	r2, [fp, #-16]
     e0c:	e3003fff 	movw	r3, #4095	; 0xfff
     e10:	e1520003 	cmp	r2, r3
     e14:	8a000001 	bhi	e20 <morecore+0x28>
        nu = 4096;
     e18:	e3a03a01 	mov	r3, #4096	; 0x1000
     e1c:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     e20:	e51b3010 	ldr	r3, [fp, #-16]
     e24:	e1a03183 	lsl	r3, r3, #3
     e28:	e1a00003 	mov	r0, r3
     e2c:	ebfffe7c 	bl	824 <sbrk>
     e30:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     e34:	e51b3008 	ldr	r3, [fp, #-8]
     e38:	e3730001 	cmn	r3, #1
     e3c:	1a000001 	bne	e48 <morecore+0x50>
        return 0;
     e40:	e3a03000 	mov	r3, #0
     e44:	ea00000b 	b	e78 <morecore+0x80>
    hp = (Header*)p;
     e48:	e51b3008 	ldr	r3, [fp, #-8]
     e4c:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     e50:	e51b300c 	ldr	r3, [fp, #-12]
     e54:	e51b2010 	ldr	r2, [fp, #-16]
     e58:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     e5c:	e51b300c 	ldr	r3, [fp, #-12]
     e60:	e2833008 	add	r3, r3, #8
     e64:	e1a00003 	mov	r0, r3
     e68:	ebffff83 	bl	c7c <free>
    return freep;
     e6c:	e3013150 	movw	r3, #4432	; 0x1150
     e70:	e3403000 	movt	r3, #0
     e74:	e5933000 	ldr	r3, [r3]
}
     e78:	e1a00003 	mov	r0, r3
     e7c:	e24bd004 	sub	sp, fp, #4
     e80:	e8bd8800 	pop	{fp, pc}

00000e84 <malloc>:

void*
malloc(uint nbytes)
{
     e84:	e92d4800 	push	{fp, lr}
     e88:	e28db004 	add	fp, sp, #4
     e8c:	e24dd018 	sub	sp, sp, #24
     e90:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e98:	e2833007 	add	r3, r3, #7
     e9c:	e1a031a3 	lsr	r3, r3, #3
     ea0:	e2833001 	add	r3, r3, #1
     ea4:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     ea8:	e3013150 	movw	r3, #4432	; 0x1150
     eac:	e3403000 	movt	r3, #0
     eb0:	e5933000 	ldr	r3, [r3]
     eb4:	e50b300c 	str	r3, [fp, #-12]
     eb8:	e51b300c 	ldr	r3, [fp, #-12]
     ebc:	e3530000 	cmp	r3, #0
     ec0:	1a000010 	bne	f08 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     ec4:	e3013148 	movw	r3, #4424	; 0x1148
     ec8:	e3403000 	movt	r3, #0
     ecc:	e50b300c 	str	r3, [fp, #-12]
     ed0:	e3013150 	movw	r3, #4432	; 0x1150
     ed4:	e3403000 	movt	r3, #0
     ed8:	e51b200c 	ldr	r2, [fp, #-12]
     edc:	e5832000 	str	r2, [r3]
     ee0:	e3013150 	movw	r3, #4432	; 0x1150
     ee4:	e3403000 	movt	r3, #0
     ee8:	e5932000 	ldr	r2, [r3]
     eec:	e3013148 	movw	r3, #4424	; 0x1148
     ef0:	e3403000 	movt	r3, #0
     ef4:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     ef8:	e3013148 	movw	r3, #4424	; 0x1148
     efc:	e3403000 	movt	r3, #0
     f00:	e3a02000 	mov	r2, #0
     f04:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f08:	e51b300c 	ldr	r3, [fp, #-12]
     f0c:	e5933000 	ldr	r3, [r3]
     f10:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     f14:	e51b3008 	ldr	r3, [fp, #-8]
     f18:	e5932004 	ldr	r2, [r3, #4]
     f1c:	e51b3010 	ldr	r3, [fp, #-16]
     f20:	e1520003 	cmp	r2, r3
     f24:	3a00001f 	bcc	fa8 <malloc+0x124>
            if(p->s.size == nunits)
     f28:	e51b3008 	ldr	r3, [fp, #-8]
     f2c:	e5932004 	ldr	r2, [r3, #4]
     f30:	e51b3010 	ldr	r3, [fp, #-16]
     f34:	e1520003 	cmp	r2, r3
     f38:	1a000004 	bne	f50 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     f3c:	e51b3008 	ldr	r3, [fp, #-8]
     f40:	e5932000 	ldr	r2, [r3]
     f44:	e51b300c 	ldr	r3, [fp, #-12]
     f48:	e5832000 	str	r2, [r3]
     f4c:	ea00000e 	b	f8c <malloc+0x108>
            else {
                p->s.size -= nunits;
     f50:	e51b3008 	ldr	r3, [fp, #-8]
     f54:	e5932004 	ldr	r2, [r3, #4]
     f58:	e51b3010 	ldr	r3, [fp, #-16]
     f5c:	e0632002 	rsb	r2, r3, r2
     f60:	e51b3008 	ldr	r3, [fp, #-8]
     f64:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     f68:	e51b3008 	ldr	r3, [fp, #-8]
     f6c:	e5933004 	ldr	r3, [r3, #4]
     f70:	e1a03183 	lsl	r3, r3, #3
     f74:	e51b2008 	ldr	r2, [fp, #-8]
     f78:	e0823003 	add	r3, r2, r3
     f7c:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     f80:	e51b3008 	ldr	r3, [fp, #-8]
     f84:	e51b2010 	ldr	r2, [fp, #-16]
     f88:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     f8c:	e3013150 	movw	r3, #4432	; 0x1150
     f90:	e3403000 	movt	r3, #0
     f94:	e51b200c 	ldr	r2, [fp, #-12]
     f98:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     f9c:	e51b3008 	ldr	r3, [fp, #-8]
     fa0:	e2833008 	add	r3, r3, #8
     fa4:	ea000013 	b	ff8 <malloc+0x174>
        }
        if(p == freep)
     fa8:	e3013150 	movw	r3, #4432	; 0x1150
     fac:	e3403000 	movt	r3, #0
     fb0:	e5933000 	ldr	r3, [r3]
     fb4:	e51b2008 	ldr	r2, [fp, #-8]
     fb8:	e1520003 	cmp	r2, r3
     fbc:	1a000007 	bne	fe0 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     fc0:	e51b0010 	ldr	r0, [fp, #-16]
     fc4:	ebffff8b 	bl	df8 <morecore>
     fc8:	e50b0008 	str	r0, [fp, #-8]
     fcc:	e51b3008 	ldr	r3, [fp, #-8]
     fd0:	e3530000 	cmp	r3, #0
     fd4:	1a000001 	bne	fe0 <malloc+0x15c>
                return 0;
     fd8:	e3a03000 	mov	r3, #0
     fdc:	ea000005 	b	ff8 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fe0:	e51b3008 	ldr	r3, [fp, #-8]
     fe4:	e50b300c 	str	r3, [fp, #-12]
     fe8:	e51b3008 	ldr	r3, [fp, #-8]
     fec:	e5933000 	ldr	r3, [r3]
     ff0:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
     ff4:	eaffffc6 	b	f14 <malloc+0x90>
}
     ff8:	e1a00003 	mov	r0, r3
     ffc:	e24bd004 	sub	sp, fp, #4
    1000:	e8bd8800 	pop	{fp, pc}

00001004 <__aeabi_uidiv>:
    1004:	e2512001 	subs	r2, r1, #1
    1008:	012fff1e 	bxeq	lr
    100c:	3a000036 	bcc	10ec <__aeabi_uidiv+0xe8>
    1010:	e1500001 	cmp	r0, r1
    1014:	9a000022 	bls	10a4 <__aeabi_uidiv+0xa0>
    1018:	e1110002 	tst	r1, r2
    101c:	0a000023 	beq	10b0 <__aeabi_uidiv+0xac>
    1020:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1024:	01a01181 	lsleq	r1, r1, #3
    1028:	03a03008 	moveq	r3, #8
    102c:	13a03001 	movne	r3, #1
    1030:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1034:	31510000 	cmpcc	r1, r0
    1038:	31a01201 	lslcc	r1, r1, #4
    103c:	31a03203 	lslcc	r3, r3, #4
    1040:	3afffffa 	bcc	1030 <__aeabi_uidiv+0x2c>
    1044:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1048:	31510000 	cmpcc	r1, r0
    104c:	31a01081 	lslcc	r1, r1, #1
    1050:	31a03083 	lslcc	r3, r3, #1
    1054:	3afffffa 	bcc	1044 <__aeabi_uidiv+0x40>
    1058:	e3a02000 	mov	r2, #0
    105c:	e1500001 	cmp	r0, r1
    1060:	20400001 	subcs	r0, r0, r1
    1064:	21822003 	orrcs	r2, r2, r3
    1068:	e15000a1 	cmp	r0, r1, lsr #1
    106c:	204000a1 	subcs	r0, r0, r1, lsr #1
    1070:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1074:	e1500121 	cmp	r0, r1, lsr #2
    1078:	20400121 	subcs	r0, r0, r1, lsr #2
    107c:	21822123 	orrcs	r2, r2, r3, lsr #2
    1080:	e15001a1 	cmp	r0, r1, lsr #3
    1084:	204001a1 	subcs	r0, r0, r1, lsr #3
    1088:	218221a3 	orrcs	r2, r2, r3, lsr #3
    108c:	e3500000 	cmp	r0, #0
    1090:	11b03223 	lsrsne	r3, r3, #4
    1094:	11a01221 	lsrne	r1, r1, #4
    1098:	1affffef 	bne	105c <__aeabi_uidiv+0x58>
    109c:	e1a00002 	mov	r0, r2
    10a0:	e12fff1e 	bx	lr
    10a4:	03a00001 	moveq	r0, #1
    10a8:	13a00000 	movne	r0, #0
    10ac:	e12fff1e 	bx	lr
    10b0:	e3510801 	cmp	r1, #65536	; 0x10000
    10b4:	21a01821 	lsrcs	r1, r1, #16
    10b8:	23a02010 	movcs	r2, #16
    10bc:	33a02000 	movcc	r2, #0
    10c0:	e3510c01 	cmp	r1, #256	; 0x100
    10c4:	21a01421 	lsrcs	r1, r1, #8
    10c8:	22822008 	addcs	r2, r2, #8
    10cc:	e3510010 	cmp	r1, #16
    10d0:	21a01221 	lsrcs	r1, r1, #4
    10d4:	22822004 	addcs	r2, r2, #4
    10d8:	e3510004 	cmp	r1, #4
    10dc:	82822003 	addhi	r2, r2, #3
    10e0:	908220a1 	addls	r2, r2, r1, lsr #1
    10e4:	e1a00230 	lsr	r0, r0, r2
    10e8:	e12fff1e 	bx	lr
    10ec:	e3500000 	cmp	r0, #0
    10f0:	13e00000 	mvnne	r0, #0
    10f4:	ea000007 	b	1118 <__aeabi_idiv0>

000010f8 <__aeabi_uidivmod>:
    10f8:	e3510000 	cmp	r1, #0
    10fc:	0afffffa 	beq	10ec <__aeabi_uidiv+0xe8>
    1100:	e92d4003 	push	{r0, r1, lr}
    1104:	ebffffbe 	bl	1004 <__aeabi_uidiv>
    1108:	e8bd4006 	pop	{r1, r2, lr}
    110c:	e0030092 	mul	r3, r2, r0
    1110:	e0411003 	sub	r1, r1, r3
    1114:	e12fff1e 	bx	lr

00001118 <__aeabi_idiv0>:
    1118:	e12fff1e 	bx	lr
