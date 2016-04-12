
_kill:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd010 	sub	sp, sp, #16
       c:	e50b0010 	str	r0, [fp, #-16]
      10:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int i;
    
    if(argc < 1){
      14:	e51b3010 	ldr	r3, [fp, #-16]
      18:	e3530000 	cmp	r3, #0
      1c:	ca000004 	bgt	34 <main+0x34>
        printf(2, "usage: kill pid...\n");
      20:	e3a00002 	mov	r0, #2
      24:	e3011118 	movw	r1, #4376	; 0x1118
      28:	e3401000 	movt	r1, #0
      2c:	eb000283 	bl	a40 <printf>
        exit();
      30:	eb000161 	bl	5bc <exit>
    }
    for(i=1; i<argc; i++)
      34:	e3a03001 	mov	r3, #1
      38:	e50b3008 	str	r3, [fp, #-8]
      3c:	ea00000c 	b	74 <main+0x74>
        kill(atoi(argv[i]));
      40:	e51b3008 	ldr	r3, [fp, #-8]
      44:	e1a03103 	lsl	r3, r3, #2
      48:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      4c:	e0823003 	add	r3, r2, r3
      50:	e5933000 	ldr	r3, [r3]
      54:	e1a00003 	mov	r0, r3
      58:	eb000108 	bl	480 <atoi>
      5c:	e1a03000 	mov	r3, r0
      60:	e1a00003 	mov	r0, r3
      64:	eb00018a 	bl	694 <kill>
    
    if(argc < 1){
        printf(2, "usage: kill pid...\n");
        exit();
    }
    for(i=1; i<argc; i++)
      68:	e51b3008 	ldr	r3, [fp, #-8]
      6c:	e2833001 	add	r3, r3, #1
      70:	e50b3008 	str	r3, [fp, #-8]
      74:	e51b2008 	ldr	r2, [fp, #-8]
      78:	e51b3010 	ldr	r3, [fp, #-16]
      7c:	e1520003 	cmp	r2, r3
      80:	baffffee 	blt	40 <main+0x40>
        kill(atoi(argv[i]));
    exit();
      84:	eb00014c 	bl	5bc <exit>

00000088 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
      88:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      8c:	e28db000 	add	fp, sp, #0
      90:	e24dd014 	sub	sp, sp, #20
      94:	e50b0010 	str	r0, [fp, #-16]
      98:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
      9c:	e51b3010 	ldr	r3, [fp, #-16]
      a0:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
      a4:	e1a00000 	nop			; (mov r0, r0)
      a8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      ac:	e5d32000 	ldrb	r2, [r3]
      b0:	e51b3010 	ldr	r3, [fp, #-16]
      b4:	e5c32000 	strb	r2, [r3]
      b8:	e51b3010 	ldr	r3, [fp, #-16]
      bc:	e5d33000 	ldrb	r3, [r3]
      c0:	e3530000 	cmp	r3, #0
      c4:	03a03000 	moveq	r3, #0
      c8:	13a03001 	movne	r3, #1
      cc:	e6ef3073 	uxtb	r3, r3
      d0:	e51b2010 	ldr	r2, [fp, #-16]
      d4:	e2822001 	add	r2, r2, #1
      d8:	e50b2010 	str	r2, [fp, #-16]
      dc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      e0:	e2822001 	add	r2, r2, #1
      e4:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
      e8:	e3530000 	cmp	r3, #0
      ec:	1affffed 	bne	a8 <strcpy+0x20>
        ;
    return os;
      f0:	e51b3008 	ldr	r3, [fp, #-8]
}
      f4:	e1a00003 	mov	r0, r3
      f8:	e28bd000 	add	sp, fp, #0
      fc:	e8bd0800 	pop	{fp}
     100:	e12fff1e 	bx	lr

00000104 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     104:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     108:	e28db000 	add	fp, sp, #0
     10c:	e24dd00c 	sub	sp, sp, #12
     110:	e50b0008 	str	r0, [fp, #-8]
     114:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     118:	ea000005 	b	134 <strcmp+0x30>
        p++, q++;
     11c:	e51b3008 	ldr	r3, [fp, #-8]
     120:	e2833001 	add	r3, r3, #1
     124:	e50b3008 	str	r3, [fp, #-8]
     128:	e51b300c 	ldr	r3, [fp, #-12]
     12c:	e2833001 	add	r3, r3, #1
     130:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     134:	e51b3008 	ldr	r3, [fp, #-8]
     138:	e5d33000 	ldrb	r3, [r3]
     13c:	e3530000 	cmp	r3, #0
     140:	0a000005 	beq	15c <strcmp+0x58>
     144:	e51b3008 	ldr	r3, [fp, #-8]
     148:	e5d32000 	ldrb	r2, [r3]
     14c:	e51b300c 	ldr	r3, [fp, #-12]
     150:	e5d33000 	ldrb	r3, [r3]
     154:	e1520003 	cmp	r2, r3
     158:	0affffef 	beq	11c <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     15c:	e51b3008 	ldr	r3, [fp, #-8]
     160:	e5d33000 	ldrb	r3, [r3]
     164:	e1a02003 	mov	r2, r3
     168:	e51b300c 	ldr	r3, [fp, #-12]
     16c:	e5d33000 	ldrb	r3, [r3]
     170:	e0633002 	rsb	r3, r3, r2
}
     174:	e1a00003 	mov	r0, r3
     178:	e28bd000 	add	sp, fp, #0
     17c:	e8bd0800 	pop	{fp}
     180:	e12fff1e 	bx	lr

00000184 <strlen>:

uint
strlen(char *s)
{
     184:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     188:	e28db000 	add	fp, sp, #0
     18c:	e24dd014 	sub	sp, sp, #20
     190:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     194:	e3a03000 	mov	r3, #0
     198:	e50b3008 	str	r3, [fp, #-8]
     19c:	ea000002 	b	1ac <strlen+0x28>
     1a0:	e51b3008 	ldr	r3, [fp, #-8]
     1a4:	e2833001 	add	r3, r3, #1
     1a8:	e50b3008 	str	r3, [fp, #-8]
     1ac:	e51b3008 	ldr	r3, [fp, #-8]
     1b0:	e51b2010 	ldr	r2, [fp, #-16]
     1b4:	e0823003 	add	r3, r2, r3
     1b8:	e5d33000 	ldrb	r3, [r3]
     1bc:	e3530000 	cmp	r3, #0
     1c0:	1afffff6 	bne	1a0 <strlen+0x1c>
        ;
    return n;
     1c4:	e51b3008 	ldr	r3, [fp, #-8]
}
     1c8:	e1a00003 	mov	r0, r3
     1cc:	e28bd000 	add	sp, fp, #0
     1d0:	e8bd0800 	pop	{fp}
     1d4:	e12fff1e 	bx	lr

000001d8 <memset>:

void*
memset(void *dst, int v, uint n)
{
     1d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     1dc:	e28db000 	add	fp, sp, #0
     1e0:	e24dd024 	sub	sp, sp, #36	; 0x24
     1e4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     1e8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     1ec:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     1f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     1f4:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     1f8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     1fc:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     200:	e55b300d 	ldrb	r3, [fp, #-13]
     204:	e1a02c03 	lsl	r2, r3, #24
     208:	e55b300d 	ldrb	r3, [fp, #-13]
     20c:	e1a03803 	lsl	r3, r3, #16
     210:	e1822003 	orr	r2, r2, r3
     214:	e55b300d 	ldrb	r3, [fp, #-13]
     218:	e1a03403 	lsl	r3, r3, #8
     21c:	e1822003 	orr	r2, r2, r3
     220:	e55b300d 	ldrb	r3, [fp, #-13]
     224:	e1823003 	orr	r3, r2, r3
     228:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     22c:	ea000008 	b	254 <memset+0x7c>
		*p = c;
     230:	e51b3008 	ldr	r3, [fp, #-8]
     234:	e55b200d 	ldrb	r2, [fp, #-13]
     238:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     23c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     240:	e2433001 	sub	r3, r3, #1
     244:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     248:	e51b3008 	ldr	r3, [fp, #-8]
     24c:	e2833001 	add	r3, r3, #1
     250:	e50b3008 	str	r3, [fp, #-8]
     254:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     258:	e3530000 	cmp	r3, #0
     25c:	0a000003 	beq	270 <memset+0x98>
     260:	e51b3008 	ldr	r3, [fp, #-8]
     264:	e2033003 	and	r3, r3, #3
     268:	e3530000 	cmp	r3, #0
     26c:	1affffef 	bne	230 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     270:	e51b3008 	ldr	r3, [fp, #-8]
     274:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     278:	ea000008 	b	2a0 <memset+0xc8>
		*p4 = val;
     27c:	e51b300c 	ldr	r3, [fp, #-12]
     280:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     284:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     288:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     28c:	e2433004 	sub	r3, r3, #4
     290:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     294:	e51b300c 	ldr	r3, [fp, #-12]
     298:	e2833004 	add	r3, r3, #4
     29c:	e50b300c 	str	r3, [fp, #-12]
     2a0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2a4:	e3530003 	cmp	r3, #3
     2a8:	8afffff3 	bhi	27c <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     2ac:	e51b300c 	ldr	r3, [fp, #-12]
     2b0:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     2b4:	ea000008 	b	2dc <memset+0x104>
		*p = c;
     2b8:	e51b3008 	ldr	r3, [fp, #-8]
     2bc:	e55b200d 	ldrb	r2, [fp, #-13]
     2c0:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     2c4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2c8:	e2433001 	sub	r3, r3, #1
     2cc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     2d0:	e51b3008 	ldr	r3, [fp, #-8]
     2d4:	e2833001 	add	r3, r3, #1
     2d8:	e50b3008 	str	r3, [fp, #-8]
     2dc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2e0:	e3530000 	cmp	r3, #0
     2e4:	1afffff3 	bne	2b8 <memset+0xe0>
		*p = c;
	}

	return dst;
     2e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     2ec:	e1a00003 	mov	r0, r3
     2f0:	e28bd000 	add	sp, fp, #0
     2f4:	e8bd0800 	pop	{fp}
     2f8:	e12fff1e 	bx	lr

000002fc <strchr>:

char*
strchr(const char *s, char c)
{
     2fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     300:	e28db000 	add	fp, sp, #0
     304:	e24dd00c 	sub	sp, sp, #12
     308:	e50b0008 	str	r0, [fp, #-8]
     30c:	e1a03001 	mov	r3, r1
     310:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     314:	ea000009 	b	340 <strchr+0x44>
        if(*s == c)
     318:	e51b3008 	ldr	r3, [fp, #-8]
     31c:	e5d33000 	ldrb	r3, [r3]
     320:	e55b2009 	ldrb	r2, [fp, #-9]
     324:	e1520003 	cmp	r2, r3
     328:	1a000001 	bne	334 <strchr+0x38>
            return (char*)s;
     32c:	e51b3008 	ldr	r3, [fp, #-8]
     330:	ea000007 	b	354 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     334:	e51b3008 	ldr	r3, [fp, #-8]
     338:	e2833001 	add	r3, r3, #1
     33c:	e50b3008 	str	r3, [fp, #-8]
     340:	e51b3008 	ldr	r3, [fp, #-8]
     344:	e5d33000 	ldrb	r3, [r3]
     348:	e3530000 	cmp	r3, #0
     34c:	1afffff1 	bne	318 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     350:	e3a03000 	mov	r3, #0
}
     354:	e1a00003 	mov	r0, r3
     358:	e28bd000 	add	sp, fp, #0
     35c:	e8bd0800 	pop	{fp}
     360:	e12fff1e 	bx	lr

00000364 <gets>:

char*
gets(char *buf, int max)
{
     364:	e92d4800 	push	{fp, lr}
     368:	e28db004 	add	fp, sp, #4
     36c:	e24dd018 	sub	sp, sp, #24
     370:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     374:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     378:	e3a03000 	mov	r3, #0
     37c:	e50b3008 	str	r3, [fp, #-8]
     380:	ea000016 	b	3e0 <gets+0x7c>
        cc = read(0, &c, 1);
     384:	e3a00000 	mov	r0, #0
     388:	e24b300d 	sub	r3, fp, #13
     38c:	e1a01003 	mov	r1, r3
     390:	e3a02001 	mov	r2, #1
     394:	eb0000a3 	bl	628 <read>
     398:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     39c:	e51b300c 	ldr	r3, [fp, #-12]
     3a0:	e3530000 	cmp	r3, #0
     3a4:	da000013 	ble	3f8 <gets+0x94>
            break;
        buf[i++] = c;
     3a8:	e51b3008 	ldr	r3, [fp, #-8]
     3ac:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     3b0:	e0823003 	add	r3, r2, r3
     3b4:	e55b200d 	ldrb	r2, [fp, #-13]
     3b8:	e5c32000 	strb	r2, [r3]
     3bc:	e51b3008 	ldr	r3, [fp, #-8]
     3c0:	e2833001 	add	r3, r3, #1
     3c4:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     3c8:	e55b300d 	ldrb	r3, [fp, #-13]
     3cc:	e353000a 	cmp	r3, #10
     3d0:	0a000009 	beq	3fc <gets+0x98>
     3d4:	e55b300d 	ldrb	r3, [fp, #-13]
     3d8:	e353000d 	cmp	r3, #13
     3dc:	0a000006 	beq	3fc <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     3e0:	e51b3008 	ldr	r3, [fp, #-8]
     3e4:	e2832001 	add	r2, r3, #1
     3e8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     3ec:	e1520003 	cmp	r2, r3
     3f0:	baffffe3 	blt	384 <gets+0x20>
     3f4:	ea000000 	b	3fc <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     3f8:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     3fc:	e51b3008 	ldr	r3, [fp, #-8]
     400:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     404:	e0823003 	add	r3, r2, r3
     408:	e3a02000 	mov	r2, #0
     40c:	e5c32000 	strb	r2, [r3]
    return buf;
     410:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     414:	e1a00003 	mov	r0, r3
     418:	e24bd004 	sub	sp, fp, #4
     41c:	e8bd8800 	pop	{fp, pc}

00000420 <stat>:

int
stat(char *n, struct stat *st)
{
     420:	e92d4800 	push	{fp, lr}
     424:	e28db004 	add	fp, sp, #4
     428:	e24dd010 	sub	sp, sp, #16
     42c:	e50b0010 	str	r0, [fp, #-16]
     430:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     434:	e51b0010 	ldr	r0, [fp, #-16]
     438:	e3a01000 	mov	r1, #0
     43c:	eb0000a6 	bl	6dc <open>
     440:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     444:	e51b3008 	ldr	r3, [fp, #-8]
     448:	e3530000 	cmp	r3, #0
     44c:	aa000001 	bge	458 <stat+0x38>
        return -1;
     450:	e3e03000 	mvn	r3, #0
     454:	ea000006 	b	474 <stat+0x54>
    r = fstat(fd, st);
     458:	e51b0008 	ldr	r0, [fp, #-8]
     45c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     460:	eb0000b8 	bl	748 <fstat>
     464:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     468:	e51b0008 	ldr	r0, [fp, #-8]
     46c:	eb00007f 	bl	670 <close>
    return r;
     470:	e51b300c 	ldr	r3, [fp, #-12]
}
     474:	e1a00003 	mov	r0, r3
     478:	e24bd004 	sub	sp, fp, #4
     47c:	e8bd8800 	pop	{fp, pc}

00000480 <atoi>:

int
atoi(const char *s)
{
     480:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     484:	e28db000 	add	fp, sp, #0
     488:	e24dd014 	sub	sp, sp, #20
     48c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     490:	e3a03000 	mov	r3, #0
     494:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     498:	ea00000d 	b	4d4 <atoi+0x54>
        n = n*10 + *s++ - '0';
     49c:	e51b2008 	ldr	r2, [fp, #-8]
     4a0:	e1a03002 	mov	r3, r2
     4a4:	e1a03103 	lsl	r3, r3, #2
     4a8:	e0833002 	add	r3, r3, r2
     4ac:	e1a03083 	lsl	r3, r3, #1
     4b0:	e1a02003 	mov	r2, r3
     4b4:	e51b3010 	ldr	r3, [fp, #-16]
     4b8:	e5d33000 	ldrb	r3, [r3]
     4bc:	e0823003 	add	r3, r2, r3
     4c0:	e2433030 	sub	r3, r3, #48	; 0x30
     4c4:	e50b3008 	str	r3, [fp, #-8]
     4c8:	e51b3010 	ldr	r3, [fp, #-16]
     4cc:	e2833001 	add	r3, r3, #1
     4d0:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     4d4:	e51b3010 	ldr	r3, [fp, #-16]
     4d8:	e5d33000 	ldrb	r3, [r3]
     4dc:	e353002f 	cmp	r3, #47	; 0x2f
     4e0:	9a000003 	bls	4f4 <atoi+0x74>
     4e4:	e51b3010 	ldr	r3, [fp, #-16]
     4e8:	e5d33000 	ldrb	r3, [r3]
     4ec:	e3530039 	cmp	r3, #57	; 0x39
     4f0:	9affffe9 	bls	49c <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     4f4:	e51b3008 	ldr	r3, [fp, #-8]
}
     4f8:	e1a00003 	mov	r0, r3
     4fc:	e28bd000 	add	sp, fp, #0
     500:	e8bd0800 	pop	{fp}
     504:	e12fff1e 	bx	lr

00000508 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     508:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     50c:	e28db000 	add	fp, sp, #0
     510:	e24dd01c 	sub	sp, sp, #28
     514:	e50b0010 	str	r0, [fp, #-16]
     518:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     51c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     520:	e51b3010 	ldr	r3, [fp, #-16]
     524:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     528:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     52c:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     530:	ea000009 	b	55c <memmove+0x54>
        *dst++ = *src++;
     534:	e51b300c 	ldr	r3, [fp, #-12]
     538:	e5d32000 	ldrb	r2, [r3]
     53c:	e51b3008 	ldr	r3, [fp, #-8]
     540:	e5c32000 	strb	r2, [r3]
     544:	e51b3008 	ldr	r3, [fp, #-8]
     548:	e2833001 	add	r3, r3, #1
     54c:	e50b3008 	str	r3, [fp, #-8]
     550:	e51b300c 	ldr	r3, [fp, #-12]
     554:	e2833001 	add	r3, r3, #1
     558:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     55c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     560:	e3530000 	cmp	r3, #0
     564:	d3a03000 	movle	r3, #0
     568:	c3a03001 	movgt	r3, #1
     56c:	e6ef3073 	uxtb	r3, r3
     570:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     574:	e2422001 	sub	r2, r2, #1
     578:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     57c:	e3530000 	cmp	r3, #0
     580:	1affffeb 	bne	534 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     584:	e51b3010 	ldr	r3, [fp, #-16]
}
     588:	e1a00003 	mov	r0, r3
     58c:	e28bd000 	add	sp, fp, #0
     590:	e8bd0800 	pop	{fp}
     594:	e12fff1e 	bx	lr

00000598 <fork>:
     598:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     59c:	e1a04003 	mov	r4, r3
     5a0:	e1a03002 	mov	r3, r2
     5a4:	e1a02001 	mov	r2, r1
     5a8:	e1a01000 	mov	r1, r0
     5ac:	e3a00001 	mov	r0, #1
     5b0:	ef000000 	svc	0x00000000
     5b4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5b8:	e12fff1e 	bx	lr

000005bc <exit>:
     5bc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5c0:	e1a04003 	mov	r4, r3
     5c4:	e1a03002 	mov	r3, r2
     5c8:	e1a02001 	mov	r2, r1
     5cc:	e1a01000 	mov	r1, r0
     5d0:	e3a00002 	mov	r0, #2
     5d4:	ef000000 	svc	0x00000000
     5d8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5dc:	e12fff1e 	bx	lr

000005e0 <wait>:
     5e0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5e4:	e1a04003 	mov	r4, r3
     5e8:	e1a03002 	mov	r3, r2
     5ec:	e1a02001 	mov	r2, r1
     5f0:	e1a01000 	mov	r1, r0
     5f4:	e3a00003 	mov	r0, #3
     5f8:	ef000000 	svc	0x00000000
     5fc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     600:	e12fff1e 	bx	lr

00000604 <pipe>:
     604:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     608:	e1a04003 	mov	r4, r3
     60c:	e1a03002 	mov	r3, r2
     610:	e1a02001 	mov	r2, r1
     614:	e1a01000 	mov	r1, r0
     618:	e3a00004 	mov	r0, #4
     61c:	ef000000 	svc	0x00000000
     620:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     624:	e12fff1e 	bx	lr

00000628 <read>:
     628:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     62c:	e1a04003 	mov	r4, r3
     630:	e1a03002 	mov	r3, r2
     634:	e1a02001 	mov	r2, r1
     638:	e1a01000 	mov	r1, r0
     63c:	e3a00005 	mov	r0, #5
     640:	ef000000 	svc	0x00000000
     644:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     648:	e12fff1e 	bx	lr

0000064c <write>:
     64c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     650:	e1a04003 	mov	r4, r3
     654:	e1a03002 	mov	r3, r2
     658:	e1a02001 	mov	r2, r1
     65c:	e1a01000 	mov	r1, r0
     660:	e3a00010 	mov	r0, #16
     664:	ef000000 	svc	0x00000000
     668:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     66c:	e12fff1e 	bx	lr

00000670 <close>:
     670:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     674:	e1a04003 	mov	r4, r3
     678:	e1a03002 	mov	r3, r2
     67c:	e1a02001 	mov	r2, r1
     680:	e1a01000 	mov	r1, r0
     684:	e3a00015 	mov	r0, #21
     688:	ef000000 	svc	0x00000000
     68c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     690:	e12fff1e 	bx	lr

00000694 <kill>:
     694:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     698:	e1a04003 	mov	r4, r3
     69c:	e1a03002 	mov	r3, r2
     6a0:	e1a02001 	mov	r2, r1
     6a4:	e1a01000 	mov	r1, r0
     6a8:	e3a00006 	mov	r0, #6
     6ac:	ef000000 	svc	0x00000000
     6b0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6b4:	e12fff1e 	bx	lr

000006b8 <exec>:
     6b8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6bc:	e1a04003 	mov	r4, r3
     6c0:	e1a03002 	mov	r3, r2
     6c4:	e1a02001 	mov	r2, r1
     6c8:	e1a01000 	mov	r1, r0
     6cc:	e3a00007 	mov	r0, #7
     6d0:	ef000000 	svc	0x00000000
     6d4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6d8:	e12fff1e 	bx	lr

000006dc <open>:
     6dc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6e0:	e1a04003 	mov	r4, r3
     6e4:	e1a03002 	mov	r3, r2
     6e8:	e1a02001 	mov	r2, r1
     6ec:	e1a01000 	mov	r1, r0
     6f0:	e3a0000f 	mov	r0, #15
     6f4:	ef000000 	svc	0x00000000
     6f8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6fc:	e12fff1e 	bx	lr

00000700 <mknod>:
     700:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     704:	e1a04003 	mov	r4, r3
     708:	e1a03002 	mov	r3, r2
     70c:	e1a02001 	mov	r2, r1
     710:	e1a01000 	mov	r1, r0
     714:	e3a00011 	mov	r0, #17
     718:	ef000000 	svc	0x00000000
     71c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     720:	e12fff1e 	bx	lr

00000724 <unlink>:
     724:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     728:	e1a04003 	mov	r4, r3
     72c:	e1a03002 	mov	r3, r2
     730:	e1a02001 	mov	r2, r1
     734:	e1a01000 	mov	r1, r0
     738:	e3a00012 	mov	r0, #18
     73c:	ef000000 	svc	0x00000000
     740:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     744:	e12fff1e 	bx	lr

00000748 <fstat>:
     748:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     74c:	e1a04003 	mov	r4, r3
     750:	e1a03002 	mov	r3, r2
     754:	e1a02001 	mov	r2, r1
     758:	e1a01000 	mov	r1, r0
     75c:	e3a00008 	mov	r0, #8
     760:	ef000000 	svc	0x00000000
     764:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     768:	e12fff1e 	bx	lr

0000076c <link>:
     76c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     770:	e1a04003 	mov	r4, r3
     774:	e1a03002 	mov	r3, r2
     778:	e1a02001 	mov	r2, r1
     77c:	e1a01000 	mov	r1, r0
     780:	e3a00013 	mov	r0, #19
     784:	ef000000 	svc	0x00000000
     788:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     78c:	e12fff1e 	bx	lr

00000790 <mkdir>:
     790:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     794:	e1a04003 	mov	r4, r3
     798:	e1a03002 	mov	r3, r2
     79c:	e1a02001 	mov	r2, r1
     7a0:	e1a01000 	mov	r1, r0
     7a4:	e3a00014 	mov	r0, #20
     7a8:	ef000000 	svc	0x00000000
     7ac:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7b0:	e12fff1e 	bx	lr

000007b4 <chdir>:
     7b4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7b8:	e1a04003 	mov	r4, r3
     7bc:	e1a03002 	mov	r3, r2
     7c0:	e1a02001 	mov	r2, r1
     7c4:	e1a01000 	mov	r1, r0
     7c8:	e3a00009 	mov	r0, #9
     7cc:	ef000000 	svc	0x00000000
     7d0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7d4:	e12fff1e 	bx	lr

000007d8 <dup>:
     7d8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7dc:	e1a04003 	mov	r4, r3
     7e0:	e1a03002 	mov	r3, r2
     7e4:	e1a02001 	mov	r2, r1
     7e8:	e1a01000 	mov	r1, r0
     7ec:	e3a0000a 	mov	r0, #10
     7f0:	ef000000 	svc	0x00000000
     7f4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7f8:	e12fff1e 	bx	lr

000007fc <getpid>:
     7fc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     800:	e1a04003 	mov	r4, r3
     804:	e1a03002 	mov	r3, r2
     808:	e1a02001 	mov	r2, r1
     80c:	e1a01000 	mov	r1, r0
     810:	e3a0000b 	mov	r0, #11
     814:	ef000000 	svc	0x00000000
     818:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     81c:	e12fff1e 	bx	lr

00000820 <sbrk>:
     820:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     824:	e1a04003 	mov	r4, r3
     828:	e1a03002 	mov	r3, r2
     82c:	e1a02001 	mov	r2, r1
     830:	e1a01000 	mov	r1, r0
     834:	e3a0000c 	mov	r0, #12
     838:	ef000000 	svc	0x00000000
     83c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     840:	e12fff1e 	bx	lr

00000844 <sleep>:
     844:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     848:	e1a04003 	mov	r4, r3
     84c:	e1a03002 	mov	r3, r2
     850:	e1a02001 	mov	r2, r1
     854:	e1a01000 	mov	r1, r0
     858:	e3a0000d 	mov	r0, #13
     85c:	ef000000 	svc	0x00000000
     860:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     864:	e12fff1e 	bx	lr

00000868 <uptime>:
     868:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     86c:	e1a04003 	mov	r4, r3
     870:	e1a03002 	mov	r3, r2
     874:	e1a02001 	mov	r2, r1
     878:	e1a01000 	mov	r1, r0
     87c:	e3a0000e 	mov	r0, #14
     880:	ef000000 	svc	0x00000000
     884:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     888:	e12fff1e 	bx	lr

0000088c <kthread_create>:
     88c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     890:	e1a04003 	mov	r4, r3
     894:	e1a03002 	mov	r3, r2
     898:	e1a02001 	mov	r2, r1
     89c:	e1a01000 	mov	r1, r0
     8a0:	e3a00016 	mov	r0, #22
     8a4:	ef000000 	svc	0x00000000
     8a8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8ac:	e12fff1e 	bx	lr

000008b0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     8b0:	e92d4800 	push	{fp, lr}
     8b4:	e28db004 	add	fp, sp, #4
     8b8:	e24dd008 	sub	sp, sp, #8
     8bc:	e50b0008 	str	r0, [fp, #-8]
     8c0:	e1a03001 	mov	r3, r1
     8c4:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     8c8:	e51b0008 	ldr	r0, [fp, #-8]
     8cc:	e24b3009 	sub	r3, fp, #9
     8d0:	e1a01003 	mov	r1, r3
     8d4:	e3a02001 	mov	r2, #1
     8d8:	ebffff5b 	bl	64c <write>
}
     8dc:	e24bd004 	sub	sp, fp, #4
     8e0:	e8bd8800 	pop	{fp, pc}

000008e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     8e4:	e92d4800 	push	{fp, lr}
     8e8:	e28db004 	add	fp, sp, #4
     8ec:	e24dd030 	sub	sp, sp, #48	; 0x30
     8f0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     8f4:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     8f8:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     8fc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     900:	e3a03000 	mov	r3, #0
     904:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     908:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     90c:	e3530000 	cmp	r3, #0
     910:	0a000008 	beq	938 <printint+0x54>
     914:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     918:	e3530000 	cmp	r3, #0
     91c:	aa000005 	bge	938 <printint+0x54>
        neg = 1;
     920:	e3a03001 	mov	r3, #1
     924:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     928:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     92c:	e2633000 	rsb	r3, r3, #0
     930:	e50b3010 	str	r3, [fp, #-16]
     934:	ea000001 	b	940 <printint+0x5c>
    } else {
        x = xx;
     938:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     93c:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     940:	e3a03000 	mov	r3, #0
     944:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     948:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     94c:	e51b2010 	ldr	r2, [fp, #-16]
     950:	e1a00002 	mov	r0, r2
     954:	e1a01003 	mov	r1, r3
     958:	eb0001e5 	bl	10f4 <__aeabi_uidivmod>
     95c:	e1a03001 	mov	r3, r1
     960:	e1a02003 	mov	r2, r3
     964:	e3013134 	movw	r3, #4404	; 0x1134
     968:	e3403000 	movt	r3, #0
     96c:	e7d32002 	ldrb	r2, [r3, r2]
     970:	e3e0001b 	mvn	r0, #27
     974:	e51b3008 	ldr	r3, [fp, #-8]
     978:	e24bc004 	sub	ip, fp, #4
     97c:	e08c1003 	add	r1, ip, r3
     980:	e1a03000 	mov	r3, r0
     984:	e0813003 	add	r3, r1, r3
     988:	e5c32000 	strb	r2, [r3]
     98c:	e51b3008 	ldr	r3, [fp, #-8]
     990:	e2833001 	add	r3, r3, #1
     994:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     998:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     99c:	e51b0010 	ldr	r0, [fp, #-16]
     9a0:	e1a01003 	mov	r1, r3
     9a4:	eb000195 	bl	1000 <__aeabi_uidiv>
     9a8:	e1a03000 	mov	r3, r0
     9ac:	e50b3010 	str	r3, [fp, #-16]
     9b0:	e51b3010 	ldr	r3, [fp, #-16]
     9b4:	e3530000 	cmp	r3, #0
     9b8:	1affffe2 	bne	948 <printint+0x64>
    if(neg)
     9bc:	e51b300c 	ldr	r3, [fp, #-12]
     9c0:	e3530000 	cmp	r3, #0
     9c4:	0a000015 	beq	a20 <printint+0x13c>
        buf[i++] = '-';
     9c8:	e3e0101b 	mvn	r1, #27
     9cc:	e51b3008 	ldr	r3, [fp, #-8]
     9d0:	e24b0004 	sub	r0, fp, #4
     9d4:	e0802003 	add	r2, r0, r3
     9d8:	e1a03001 	mov	r3, r1
     9dc:	e0823003 	add	r3, r2, r3
     9e0:	e3a0202d 	mov	r2, #45	; 0x2d
     9e4:	e5c32000 	strb	r2, [r3]
     9e8:	e51b3008 	ldr	r3, [fp, #-8]
     9ec:	e2833001 	add	r3, r3, #1
     9f0:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     9f4:	ea000009 	b	a20 <printint+0x13c>
        putc(fd, buf[i]);
     9f8:	e3e0101b 	mvn	r1, #27
     9fc:	e51b3008 	ldr	r3, [fp, #-8]
     a00:	e24bc004 	sub	ip, fp, #4
     a04:	e08c2003 	add	r2, ip, r3
     a08:	e1a03001 	mov	r3, r1
     a0c:	e0823003 	add	r3, r2, r3
     a10:	e5d33000 	ldrb	r3, [r3]
     a14:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     a18:	e1a01003 	mov	r1, r3
     a1c:	ebffffa3 	bl	8b0 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     a20:	e51b3008 	ldr	r3, [fp, #-8]
     a24:	e2433001 	sub	r3, r3, #1
     a28:	e50b3008 	str	r3, [fp, #-8]
     a2c:	e51b3008 	ldr	r3, [fp, #-8]
     a30:	e3530000 	cmp	r3, #0
     a34:	aaffffef 	bge	9f8 <printint+0x114>
        putc(fd, buf[i]);
}
     a38:	e24bd004 	sub	sp, fp, #4
     a3c:	e8bd8800 	pop	{fp, pc}

00000a40 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     a40:	e92d000e 	push	{r1, r2, r3}
     a44:	e92d4800 	push	{fp, lr}
     a48:	e28db004 	add	fp, sp, #4
     a4c:	e24dd024 	sub	sp, sp, #36	; 0x24
     a50:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     a54:	e3a03000 	mov	r3, #0
     a58:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     a5c:	e28b3008 	add	r3, fp, #8
     a60:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     a64:	e3a03000 	mov	r3, #0
     a68:	e50b3010 	str	r3, [fp, #-16]
     a6c:	ea000077 	b	c50 <printf+0x210>
        c = fmt[i] & 0xff;
     a70:	e59b2004 	ldr	r2, [fp, #4]
     a74:	e51b3010 	ldr	r3, [fp, #-16]
     a78:	e0823003 	add	r3, r2, r3
     a7c:	e5d33000 	ldrb	r3, [r3]
     a80:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     a84:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a88:	e3530000 	cmp	r3, #0
     a8c:	1a00000b 	bne	ac0 <printf+0x80>
            if(c == '%'){
     a90:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     a94:	e3530025 	cmp	r3, #37	; 0x25
     a98:	1a000002 	bne	aa8 <printf+0x68>
                state = '%';
     a9c:	e3a03025 	mov	r3, #37	; 0x25
     aa0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     aa4:	ea000066 	b	c44 <printf+0x204>
            } else {
                putc(fd, c);
     aa8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     aac:	e6ef3073 	uxtb	r3, r3
     ab0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ab4:	e1a01003 	mov	r1, r3
     ab8:	ebffff7c 	bl	8b0 <putc>
     abc:	ea000060 	b	c44 <printf+0x204>
            }
        } else if(state == '%'){
     ac0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     ac4:	e3530025 	cmp	r3, #37	; 0x25
     ac8:	1a00005d 	bne	c44 <printf+0x204>
            if(c == 'd'){
     acc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ad0:	e3530064 	cmp	r3, #100	; 0x64
     ad4:	1a00000a 	bne	b04 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     ad8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     adc:	e5933000 	ldr	r3, [r3]
     ae0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ae4:	e1a01003 	mov	r1, r3
     ae8:	e3a0200a 	mov	r2, #10
     aec:	e3a03001 	mov	r3, #1
     af0:	ebffff7b 	bl	8e4 <printint>
                ap++;
     af4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     af8:	e2833004 	add	r3, r3, #4
     afc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b00:	ea00004d 	b	c3c <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     b04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b08:	e3530078 	cmp	r3, #120	; 0x78
     b0c:	0a000002 	beq	b1c <printf+0xdc>
     b10:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b14:	e3530070 	cmp	r3, #112	; 0x70
     b18:	1a00000a 	bne	b48 <printf+0x108>
                printint(fd, *ap, 16, 0);
     b1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b20:	e5933000 	ldr	r3, [r3]
     b24:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b28:	e1a01003 	mov	r1, r3
     b2c:	e3a02010 	mov	r2, #16
     b30:	e3a03000 	mov	r3, #0
     b34:	ebffff6a 	bl	8e4 <printint>
                ap++;
     b38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b3c:	e2833004 	add	r3, r3, #4
     b40:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b44:	ea00003c 	b	c3c <printf+0x1fc>
            } else if(c == 's'){
     b48:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b4c:	e3530073 	cmp	r3, #115	; 0x73
     b50:	1a00001b 	bne	bc4 <printf+0x184>
                s = (char*)*ap;
     b54:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b58:	e5933000 	ldr	r3, [r3]
     b5c:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     b60:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b64:	e2833004 	add	r3, r3, #4
     b68:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     b6c:	e51b300c 	ldr	r3, [fp, #-12]
     b70:	e3530000 	cmp	r3, #0
     b74:	1a00000c 	bne	bac <printf+0x16c>
                    s = "(null)";
     b78:	e301312c 	movw	r3, #4396	; 0x112c
     b7c:	e3403000 	movt	r3, #0
     b80:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     b84:	ea000008 	b	bac <printf+0x16c>
                    putc(fd, *s);
     b88:	e51b300c 	ldr	r3, [fp, #-12]
     b8c:	e5d33000 	ldrb	r3, [r3]
     b90:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b94:	e1a01003 	mov	r1, r3
     b98:	ebffff44 	bl	8b0 <putc>
                    s++;
     b9c:	e51b300c 	ldr	r3, [fp, #-12]
     ba0:	e2833001 	add	r3, r3, #1
     ba4:	e50b300c 	str	r3, [fp, #-12]
     ba8:	ea000000 	b	bb0 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     bac:	e1a00000 	nop			; (mov r0, r0)
     bb0:	e51b300c 	ldr	r3, [fp, #-12]
     bb4:	e5d33000 	ldrb	r3, [r3]
     bb8:	e3530000 	cmp	r3, #0
     bbc:	1afffff1 	bne	b88 <printf+0x148>
     bc0:	ea00001d 	b	c3c <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     bc4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bc8:	e3530063 	cmp	r3, #99	; 0x63
     bcc:	1a000009 	bne	bf8 <printf+0x1b8>
                putc(fd, *ap);
     bd0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bd4:	e5933000 	ldr	r3, [r3]
     bd8:	e6ef3073 	uxtb	r3, r3
     bdc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     be0:	e1a01003 	mov	r1, r3
     be4:	ebffff31 	bl	8b0 <putc>
                ap++;
     be8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bec:	e2833004 	add	r3, r3, #4
     bf0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bf4:	ea000010 	b	c3c <printf+0x1fc>
            } else if(c == '%'){
     bf8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bfc:	e3530025 	cmp	r3, #37	; 0x25
     c00:	1a000005 	bne	c1c <printf+0x1dc>
                putc(fd, c);
     c04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c08:	e6ef3073 	uxtb	r3, r3
     c0c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c10:	e1a01003 	mov	r1, r3
     c14:	ebffff25 	bl	8b0 <putc>
     c18:	ea000007 	b	c3c <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     c1c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c20:	e3a01025 	mov	r1, #37	; 0x25
     c24:	ebffff21 	bl	8b0 <putc>
                putc(fd, c);
     c28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c2c:	e6ef3073 	uxtb	r3, r3
     c30:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c34:	e1a01003 	mov	r1, r3
     c38:	ebffff1c 	bl	8b0 <putc>
            }
            state = 0;
     c3c:	e3a03000 	mov	r3, #0
     c40:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     c44:	e51b3010 	ldr	r3, [fp, #-16]
     c48:	e2833001 	add	r3, r3, #1
     c4c:	e50b3010 	str	r3, [fp, #-16]
     c50:	e59b2004 	ldr	r2, [fp, #4]
     c54:	e51b3010 	ldr	r3, [fp, #-16]
     c58:	e0823003 	add	r3, r2, r3
     c5c:	e5d33000 	ldrb	r3, [r3]
     c60:	e3530000 	cmp	r3, #0
     c64:	1affff81 	bne	a70 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     c68:	e24bd004 	sub	sp, fp, #4
     c6c:	e8bd4800 	pop	{fp, lr}
     c70:	e28dd00c 	add	sp, sp, #12
     c74:	e12fff1e 	bx	lr

00000c78 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c7c:	e28db000 	add	fp, sp, #0
     c80:	e24dd014 	sub	sp, sp, #20
     c84:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     c88:	e51b3010 	ldr	r3, [fp, #-16]
     c8c:	e2433008 	sub	r3, r3, #8
     c90:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c94:	e3013150 	movw	r3, #4432	; 0x1150
     c98:	e3403000 	movt	r3, #0
     c9c:	e5933000 	ldr	r3, [r3]
     ca0:	e50b3008 	str	r3, [fp, #-8]
     ca4:	ea000010 	b	cec <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ca8:	e51b3008 	ldr	r3, [fp, #-8]
     cac:	e5932000 	ldr	r2, [r3]
     cb0:	e51b3008 	ldr	r3, [fp, #-8]
     cb4:	e1520003 	cmp	r2, r3
     cb8:	8a000008 	bhi	ce0 <free+0x68>
     cbc:	e51b200c 	ldr	r2, [fp, #-12]
     cc0:	e51b3008 	ldr	r3, [fp, #-8]
     cc4:	e1520003 	cmp	r2, r3
     cc8:	8a000010 	bhi	d10 <free+0x98>
     ccc:	e51b3008 	ldr	r3, [fp, #-8]
     cd0:	e5932000 	ldr	r2, [r3]
     cd4:	e51b300c 	ldr	r3, [fp, #-12]
     cd8:	e1520003 	cmp	r2, r3
     cdc:	8a00000b 	bhi	d10 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ce0:	e51b3008 	ldr	r3, [fp, #-8]
     ce4:	e5933000 	ldr	r3, [r3]
     ce8:	e50b3008 	str	r3, [fp, #-8]
     cec:	e51b200c 	ldr	r2, [fp, #-12]
     cf0:	e51b3008 	ldr	r3, [fp, #-8]
     cf4:	e1520003 	cmp	r2, r3
     cf8:	9affffea 	bls	ca8 <free+0x30>
     cfc:	e51b3008 	ldr	r3, [fp, #-8]
     d00:	e5932000 	ldr	r2, [r3]
     d04:	e51b300c 	ldr	r3, [fp, #-12]
     d08:	e1520003 	cmp	r2, r3
     d0c:	9affffe5 	bls	ca8 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     d10:	e51b300c 	ldr	r3, [fp, #-12]
     d14:	e5933004 	ldr	r3, [r3, #4]
     d18:	e1a03183 	lsl	r3, r3, #3
     d1c:	e51b200c 	ldr	r2, [fp, #-12]
     d20:	e0822003 	add	r2, r2, r3
     d24:	e51b3008 	ldr	r3, [fp, #-8]
     d28:	e5933000 	ldr	r3, [r3]
     d2c:	e1520003 	cmp	r2, r3
     d30:	1a00000d 	bne	d6c <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     d34:	e51b300c 	ldr	r3, [fp, #-12]
     d38:	e5932004 	ldr	r2, [r3, #4]
     d3c:	e51b3008 	ldr	r3, [fp, #-8]
     d40:	e5933000 	ldr	r3, [r3]
     d44:	e5933004 	ldr	r3, [r3, #4]
     d48:	e0822003 	add	r2, r2, r3
     d4c:	e51b300c 	ldr	r3, [fp, #-12]
     d50:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     d54:	e51b3008 	ldr	r3, [fp, #-8]
     d58:	e5933000 	ldr	r3, [r3]
     d5c:	e5932000 	ldr	r2, [r3]
     d60:	e51b300c 	ldr	r3, [fp, #-12]
     d64:	e5832000 	str	r2, [r3]
     d68:	ea000003 	b	d7c <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     d6c:	e51b3008 	ldr	r3, [fp, #-8]
     d70:	e5932000 	ldr	r2, [r3]
     d74:	e51b300c 	ldr	r3, [fp, #-12]
     d78:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     d7c:	e51b3008 	ldr	r3, [fp, #-8]
     d80:	e5933004 	ldr	r3, [r3, #4]
     d84:	e1a03183 	lsl	r3, r3, #3
     d88:	e51b2008 	ldr	r2, [fp, #-8]
     d8c:	e0822003 	add	r2, r2, r3
     d90:	e51b300c 	ldr	r3, [fp, #-12]
     d94:	e1520003 	cmp	r2, r3
     d98:	1a00000b 	bne	dcc <free+0x154>
        p->s.size += bp->s.size;
     d9c:	e51b3008 	ldr	r3, [fp, #-8]
     da0:	e5932004 	ldr	r2, [r3, #4]
     da4:	e51b300c 	ldr	r3, [fp, #-12]
     da8:	e5933004 	ldr	r3, [r3, #4]
     dac:	e0822003 	add	r2, r2, r3
     db0:	e51b3008 	ldr	r3, [fp, #-8]
     db4:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     db8:	e51b300c 	ldr	r3, [fp, #-12]
     dbc:	e5932000 	ldr	r2, [r3]
     dc0:	e51b3008 	ldr	r3, [fp, #-8]
     dc4:	e5832000 	str	r2, [r3]
     dc8:	ea000002 	b	dd8 <free+0x160>
    } else
        p->s.ptr = bp;
     dcc:	e51b3008 	ldr	r3, [fp, #-8]
     dd0:	e51b200c 	ldr	r2, [fp, #-12]
     dd4:	e5832000 	str	r2, [r3]
    freep = p;
     dd8:	e3013150 	movw	r3, #4432	; 0x1150
     ddc:	e3403000 	movt	r3, #0
     de0:	e51b2008 	ldr	r2, [fp, #-8]
     de4:	e5832000 	str	r2, [r3]
}
     de8:	e28bd000 	add	sp, fp, #0
     dec:	e8bd0800 	pop	{fp}
     df0:	e12fff1e 	bx	lr

00000df4 <morecore>:

static Header*
morecore(uint nu)
{
     df4:	e92d4800 	push	{fp, lr}
     df8:	e28db004 	add	fp, sp, #4
     dfc:	e24dd010 	sub	sp, sp, #16
     e00:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     e04:	e51b2010 	ldr	r2, [fp, #-16]
     e08:	e3003fff 	movw	r3, #4095	; 0xfff
     e0c:	e1520003 	cmp	r2, r3
     e10:	8a000001 	bhi	e1c <morecore+0x28>
        nu = 4096;
     e14:	e3a03a01 	mov	r3, #4096	; 0x1000
     e18:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     e1c:	e51b3010 	ldr	r3, [fp, #-16]
     e20:	e1a03183 	lsl	r3, r3, #3
     e24:	e1a00003 	mov	r0, r3
     e28:	ebfffe7c 	bl	820 <sbrk>
     e2c:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     e30:	e51b3008 	ldr	r3, [fp, #-8]
     e34:	e3730001 	cmn	r3, #1
     e38:	1a000001 	bne	e44 <morecore+0x50>
        return 0;
     e3c:	e3a03000 	mov	r3, #0
     e40:	ea00000b 	b	e74 <morecore+0x80>
    hp = (Header*)p;
     e44:	e51b3008 	ldr	r3, [fp, #-8]
     e48:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     e4c:	e51b300c 	ldr	r3, [fp, #-12]
     e50:	e51b2010 	ldr	r2, [fp, #-16]
     e54:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     e58:	e51b300c 	ldr	r3, [fp, #-12]
     e5c:	e2833008 	add	r3, r3, #8
     e60:	e1a00003 	mov	r0, r3
     e64:	ebffff83 	bl	c78 <free>
    return freep;
     e68:	e3013150 	movw	r3, #4432	; 0x1150
     e6c:	e3403000 	movt	r3, #0
     e70:	e5933000 	ldr	r3, [r3]
}
     e74:	e1a00003 	mov	r0, r3
     e78:	e24bd004 	sub	sp, fp, #4
     e7c:	e8bd8800 	pop	{fp, pc}

00000e80 <malloc>:

void*
malloc(uint nbytes)
{
     e80:	e92d4800 	push	{fp, lr}
     e84:	e28db004 	add	fp, sp, #4
     e88:	e24dd018 	sub	sp, sp, #24
     e8c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e94:	e2833007 	add	r3, r3, #7
     e98:	e1a031a3 	lsr	r3, r3, #3
     e9c:	e2833001 	add	r3, r3, #1
     ea0:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     ea4:	e3013150 	movw	r3, #4432	; 0x1150
     ea8:	e3403000 	movt	r3, #0
     eac:	e5933000 	ldr	r3, [r3]
     eb0:	e50b300c 	str	r3, [fp, #-12]
     eb4:	e51b300c 	ldr	r3, [fp, #-12]
     eb8:	e3530000 	cmp	r3, #0
     ebc:	1a000010 	bne	f04 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     ec0:	e3013148 	movw	r3, #4424	; 0x1148
     ec4:	e3403000 	movt	r3, #0
     ec8:	e50b300c 	str	r3, [fp, #-12]
     ecc:	e3013150 	movw	r3, #4432	; 0x1150
     ed0:	e3403000 	movt	r3, #0
     ed4:	e51b200c 	ldr	r2, [fp, #-12]
     ed8:	e5832000 	str	r2, [r3]
     edc:	e3013150 	movw	r3, #4432	; 0x1150
     ee0:	e3403000 	movt	r3, #0
     ee4:	e5932000 	ldr	r2, [r3]
     ee8:	e3013148 	movw	r3, #4424	; 0x1148
     eec:	e3403000 	movt	r3, #0
     ef0:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     ef4:	e3013148 	movw	r3, #4424	; 0x1148
     ef8:	e3403000 	movt	r3, #0
     efc:	e3a02000 	mov	r2, #0
     f00:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f04:	e51b300c 	ldr	r3, [fp, #-12]
     f08:	e5933000 	ldr	r3, [r3]
     f0c:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     f10:	e51b3008 	ldr	r3, [fp, #-8]
     f14:	e5932004 	ldr	r2, [r3, #4]
     f18:	e51b3010 	ldr	r3, [fp, #-16]
     f1c:	e1520003 	cmp	r2, r3
     f20:	3a00001f 	bcc	fa4 <malloc+0x124>
            if(p->s.size == nunits)
     f24:	e51b3008 	ldr	r3, [fp, #-8]
     f28:	e5932004 	ldr	r2, [r3, #4]
     f2c:	e51b3010 	ldr	r3, [fp, #-16]
     f30:	e1520003 	cmp	r2, r3
     f34:	1a000004 	bne	f4c <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     f38:	e51b3008 	ldr	r3, [fp, #-8]
     f3c:	e5932000 	ldr	r2, [r3]
     f40:	e51b300c 	ldr	r3, [fp, #-12]
     f44:	e5832000 	str	r2, [r3]
     f48:	ea00000e 	b	f88 <malloc+0x108>
            else {
                p->s.size -= nunits;
     f4c:	e51b3008 	ldr	r3, [fp, #-8]
     f50:	e5932004 	ldr	r2, [r3, #4]
     f54:	e51b3010 	ldr	r3, [fp, #-16]
     f58:	e0632002 	rsb	r2, r3, r2
     f5c:	e51b3008 	ldr	r3, [fp, #-8]
     f60:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     f64:	e51b3008 	ldr	r3, [fp, #-8]
     f68:	e5933004 	ldr	r3, [r3, #4]
     f6c:	e1a03183 	lsl	r3, r3, #3
     f70:	e51b2008 	ldr	r2, [fp, #-8]
     f74:	e0823003 	add	r3, r2, r3
     f78:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     f7c:	e51b3008 	ldr	r3, [fp, #-8]
     f80:	e51b2010 	ldr	r2, [fp, #-16]
     f84:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     f88:	e3013150 	movw	r3, #4432	; 0x1150
     f8c:	e3403000 	movt	r3, #0
     f90:	e51b200c 	ldr	r2, [fp, #-12]
     f94:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     f98:	e51b3008 	ldr	r3, [fp, #-8]
     f9c:	e2833008 	add	r3, r3, #8
     fa0:	ea000013 	b	ff4 <malloc+0x174>
        }
        if(p == freep)
     fa4:	e3013150 	movw	r3, #4432	; 0x1150
     fa8:	e3403000 	movt	r3, #0
     fac:	e5933000 	ldr	r3, [r3]
     fb0:	e51b2008 	ldr	r2, [fp, #-8]
     fb4:	e1520003 	cmp	r2, r3
     fb8:	1a000007 	bne	fdc <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     fbc:	e51b0010 	ldr	r0, [fp, #-16]
     fc0:	ebffff8b 	bl	df4 <morecore>
     fc4:	e50b0008 	str	r0, [fp, #-8]
     fc8:	e51b3008 	ldr	r3, [fp, #-8]
     fcc:	e3530000 	cmp	r3, #0
     fd0:	1a000001 	bne	fdc <malloc+0x15c>
                return 0;
     fd4:	e3a03000 	mov	r3, #0
     fd8:	ea000005 	b	ff4 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fdc:	e51b3008 	ldr	r3, [fp, #-8]
     fe0:	e50b300c 	str	r3, [fp, #-12]
     fe4:	e51b3008 	ldr	r3, [fp, #-8]
     fe8:	e5933000 	ldr	r3, [r3]
     fec:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
     ff0:	eaffffc6 	b	f10 <malloc+0x90>
}
     ff4:	e1a00003 	mov	r0, r3
     ff8:	e24bd004 	sub	sp, fp, #4
     ffc:	e8bd8800 	pop	{fp, pc}

00001000 <__aeabi_uidiv>:
    1000:	e2512001 	subs	r2, r1, #1
    1004:	012fff1e 	bxeq	lr
    1008:	3a000036 	bcc	10e8 <__aeabi_uidiv+0xe8>
    100c:	e1500001 	cmp	r0, r1
    1010:	9a000022 	bls	10a0 <__aeabi_uidiv+0xa0>
    1014:	e1110002 	tst	r1, r2
    1018:	0a000023 	beq	10ac <__aeabi_uidiv+0xac>
    101c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1020:	01a01181 	lsleq	r1, r1, #3
    1024:	03a03008 	moveq	r3, #8
    1028:	13a03001 	movne	r3, #1
    102c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1030:	31510000 	cmpcc	r1, r0
    1034:	31a01201 	lslcc	r1, r1, #4
    1038:	31a03203 	lslcc	r3, r3, #4
    103c:	3afffffa 	bcc	102c <__aeabi_uidiv+0x2c>
    1040:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1044:	31510000 	cmpcc	r1, r0
    1048:	31a01081 	lslcc	r1, r1, #1
    104c:	31a03083 	lslcc	r3, r3, #1
    1050:	3afffffa 	bcc	1040 <__aeabi_uidiv+0x40>
    1054:	e3a02000 	mov	r2, #0
    1058:	e1500001 	cmp	r0, r1
    105c:	20400001 	subcs	r0, r0, r1
    1060:	21822003 	orrcs	r2, r2, r3
    1064:	e15000a1 	cmp	r0, r1, lsr #1
    1068:	204000a1 	subcs	r0, r0, r1, lsr #1
    106c:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1070:	e1500121 	cmp	r0, r1, lsr #2
    1074:	20400121 	subcs	r0, r0, r1, lsr #2
    1078:	21822123 	orrcs	r2, r2, r3, lsr #2
    107c:	e15001a1 	cmp	r0, r1, lsr #3
    1080:	204001a1 	subcs	r0, r0, r1, lsr #3
    1084:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1088:	e3500000 	cmp	r0, #0
    108c:	11b03223 	lsrsne	r3, r3, #4
    1090:	11a01221 	lsrne	r1, r1, #4
    1094:	1affffef 	bne	1058 <__aeabi_uidiv+0x58>
    1098:	e1a00002 	mov	r0, r2
    109c:	e12fff1e 	bx	lr
    10a0:	03a00001 	moveq	r0, #1
    10a4:	13a00000 	movne	r0, #0
    10a8:	e12fff1e 	bx	lr
    10ac:	e3510801 	cmp	r1, #65536	; 0x10000
    10b0:	21a01821 	lsrcs	r1, r1, #16
    10b4:	23a02010 	movcs	r2, #16
    10b8:	33a02000 	movcc	r2, #0
    10bc:	e3510c01 	cmp	r1, #256	; 0x100
    10c0:	21a01421 	lsrcs	r1, r1, #8
    10c4:	22822008 	addcs	r2, r2, #8
    10c8:	e3510010 	cmp	r1, #16
    10cc:	21a01221 	lsrcs	r1, r1, #4
    10d0:	22822004 	addcs	r2, r2, #4
    10d4:	e3510004 	cmp	r1, #4
    10d8:	82822003 	addhi	r2, r2, #3
    10dc:	908220a1 	addls	r2, r2, r1, lsr #1
    10e0:	e1a00230 	lsr	r0, r0, r2
    10e4:	e12fff1e 	bx	lr
    10e8:	e3500000 	cmp	r0, #0
    10ec:	13e00000 	mvnne	r0, #0
    10f0:	ea000007 	b	1114 <__aeabi_idiv0>

000010f4 <__aeabi_uidivmod>:
    10f4:	e3510000 	cmp	r1, #0
    10f8:	0afffffa 	beq	10e8 <__aeabi_uidiv+0xe8>
    10fc:	e92d4003 	push	{r0, r1, lr}
    1100:	ebffffbe 	bl	1000 <__aeabi_uidiv>
    1104:	e8bd4006 	pop	{r1, r2, lr}
    1108:	e0030092 	mul	r3, r2, r0
    110c:	e0411003 	sub	r1, r1, r3
    1110:	e12fff1e 	bx	lr

00001114 <__aeabi_idiv0>:
    1114:	e12fff1e 	bx	lr
