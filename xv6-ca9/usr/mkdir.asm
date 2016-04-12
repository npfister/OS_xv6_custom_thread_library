
_mkdir:     file format elf32-littlearm


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
    
    if(argc < 2){
      14:	e51b3010 	ldr	r3, [fp, #-16]
      18:	e3530001 	cmp	r3, #1
      1c:	ca000004 	bgt	34 <main+0x34>
        printf(2, "Usage: mkdir files...\n");
      20:	e3a00002 	mov	r0, #2
      24:	e3011144 	movw	r1, #4420	; 0x1144
      28:	e3401000 	movt	r1, #0
      2c:	eb00028e 	bl	a6c <printf>
        exit();
      30:	eb00016c 	bl	5e8 <exit>
    }
    
    for(i = 1; i < argc; i++){
      34:	e3a03001 	mov	r3, #1
      38:	e50b3008 	str	r3, [fp, #-8]
      3c:	ea000017 	b	a0 <main+0xa0>
        if(mkdir(argv[i]) < 0){
      40:	e51b3008 	ldr	r3, [fp, #-8]
      44:	e1a03103 	lsl	r3, r3, #2
      48:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      4c:	e0823003 	add	r3, r2, r3
      50:	e5933000 	ldr	r3, [r3]
      54:	e1a00003 	mov	r0, r3
      58:	eb0001d7 	bl	7bc <mkdir>
      5c:	e1a03000 	mov	r3, r0
      60:	e3530000 	cmp	r3, #0
      64:	aa00000a 	bge	94 <main+0x94>
            printf(2, "mkdir: %s failed to create\n", argv[i]);
      68:	e51b3008 	ldr	r3, [fp, #-8]
      6c:	e1a03103 	lsl	r3, r3, #2
      70:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      74:	e0823003 	add	r3, r2, r3
      78:	e5933000 	ldr	r3, [r3]
      7c:	e3a00002 	mov	r0, #2
      80:	e301115c 	movw	r1, #4444	; 0x115c
      84:	e3401000 	movt	r1, #0
      88:	e1a02003 	mov	r2, r3
      8c:	eb000276 	bl	a6c <printf>
            break;
      90:	ea000006 	b	b0 <main+0xb0>
    if(argc < 2){
        printf(2, "Usage: mkdir files...\n");
        exit();
    }
    
    for(i = 1; i < argc; i++){
      94:	e51b3008 	ldr	r3, [fp, #-8]
      98:	e2833001 	add	r3, r3, #1
      9c:	e50b3008 	str	r3, [fp, #-8]
      a0:	e51b2008 	ldr	r2, [fp, #-8]
      a4:	e51b3010 	ldr	r3, [fp, #-16]
      a8:	e1520003 	cmp	r2, r3
      ac:	baffffe3 	blt	40 <main+0x40>
            printf(2, "mkdir: %s failed to create\n", argv[i]);
            break;
        }
    }
    
    exit();
      b0:	eb00014c 	bl	5e8 <exit>

000000b4 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
      b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
      b8:	e28db000 	add	fp, sp, #0
      bc:	e24dd014 	sub	sp, sp, #20
      c0:	e50b0010 	str	r0, [fp, #-16]
      c4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
      c8:	e51b3010 	ldr	r3, [fp, #-16]
      cc:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
      d0:	e1a00000 	nop			; (mov r0, r0)
      d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      d8:	e5d32000 	ldrb	r2, [r3]
      dc:	e51b3010 	ldr	r3, [fp, #-16]
      e0:	e5c32000 	strb	r2, [r3]
      e4:	e51b3010 	ldr	r3, [fp, #-16]
      e8:	e5d33000 	ldrb	r3, [r3]
      ec:	e3530000 	cmp	r3, #0
      f0:	03a03000 	moveq	r3, #0
      f4:	13a03001 	movne	r3, #1
      f8:	e6ef3073 	uxtb	r3, r3
      fc:	e51b2010 	ldr	r2, [fp, #-16]
     100:	e2822001 	add	r2, r2, #1
     104:	e50b2010 	str	r2, [fp, #-16]
     108:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     10c:	e2822001 	add	r2, r2, #1
     110:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
     114:	e3530000 	cmp	r3, #0
     118:	1affffed 	bne	d4 <strcpy+0x20>
        ;
    return os;
     11c:	e51b3008 	ldr	r3, [fp, #-8]
}
     120:	e1a00003 	mov	r0, r3
     124:	e28bd000 	add	sp, fp, #0
     128:	e8bd0800 	pop	{fp}
     12c:	e12fff1e 	bx	lr

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     130:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     134:	e28db000 	add	fp, sp, #0
     138:	e24dd00c 	sub	sp, sp, #12
     13c:	e50b0008 	str	r0, [fp, #-8]
     140:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     144:	ea000005 	b	160 <strcmp+0x30>
        p++, q++;
     148:	e51b3008 	ldr	r3, [fp, #-8]
     14c:	e2833001 	add	r3, r3, #1
     150:	e50b3008 	str	r3, [fp, #-8]
     154:	e51b300c 	ldr	r3, [fp, #-12]
     158:	e2833001 	add	r3, r3, #1
     15c:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     160:	e51b3008 	ldr	r3, [fp, #-8]
     164:	e5d33000 	ldrb	r3, [r3]
     168:	e3530000 	cmp	r3, #0
     16c:	0a000005 	beq	188 <strcmp+0x58>
     170:	e51b3008 	ldr	r3, [fp, #-8]
     174:	e5d32000 	ldrb	r2, [r3]
     178:	e51b300c 	ldr	r3, [fp, #-12]
     17c:	e5d33000 	ldrb	r3, [r3]
     180:	e1520003 	cmp	r2, r3
     184:	0affffef 	beq	148 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     188:	e51b3008 	ldr	r3, [fp, #-8]
     18c:	e5d33000 	ldrb	r3, [r3]
     190:	e1a02003 	mov	r2, r3
     194:	e51b300c 	ldr	r3, [fp, #-12]
     198:	e5d33000 	ldrb	r3, [r3]
     19c:	e0633002 	rsb	r3, r3, r2
}
     1a0:	e1a00003 	mov	r0, r3
     1a4:	e28bd000 	add	sp, fp, #0
     1a8:	e8bd0800 	pop	{fp}
     1ac:	e12fff1e 	bx	lr

000001b0 <strlen>:

uint
strlen(char *s)
{
     1b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     1b4:	e28db000 	add	fp, sp, #0
     1b8:	e24dd014 	sub	sp, sp, #20
     1bc:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     1c0:	e3a03000 	mov	r3, #0
     1c4:	e50b3008 	str	r3, [fp, #-8]
     1c8:	ea000002 	b	1d8 <strlen+0x28>
     1cc:	e51b3008 	ldr	r3, [fp, #-8]
     1d0:	e2833001 	add	r3, r3, #1
     1d4:	e50b3008 	str	r3, [fp, #-8]
     1d8:	e51b3008 	ldr	r3, [fp, #-8]
     1dc:	e51b2010 	ldr	r2, [fp, #-16]
     1e0:	e0823003 	add	r3, r2, r3
     1e4:	e5d33000 	ldrb	r3, [r3]
     1e8:	e3530000 	cmp	r3, #0
     1ec:	1afffff6 	bne	1cc <strlen+0x1c>
        ;
    return n;
     1f0:	e51b3008 	ldr	r3, [fp, #-8]
}
     1f4:	e1a00003 	mov	r0, r3
     1f8:	e28bd000 	add	sp, fp, #0
     1fc:	e8bd0800 	pop	{fp}
     200:	e12fff1e 	bx	lr

00000204 <memset>:

void*
memset(void *dst, int v, uint n)
{
     204:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     208:	e28db000 	add	fp, sp, #0
     20c:	e24dd024 	sub	sp, sp, #36	; 0x24
     210:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     214:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     218:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     21c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     220:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     224:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     228:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     22c:	e55b300d 	ldrb	r3, [fp, #-13]
     230:	e1a02c03 	lsl	r2, r3, #24
     234:	e55b300d 	ldrb	r3, [fp, #-13]
     238:	e1a03803 	lsl	r3, r3, #16
     23c:	e1822003 	orr	r2, r2, r3
     240:	e55b300d 	ldrb	r3, [fp, #-13]
     244:	e1a03403 	lsl	r3, r3, #8
     248:	e1822003 	orr	r2, r2, r3
     24c:	e55b300d 	ldrb	r3, [fp, #-13]
     250:	e1823003 	orr	r3, r2, r3
     254:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     258:	ea000008 	b	280 <memset+0x7c>
		*p = c;
     25c:	e51b3008 	ldr	r3, [fp, #-8]
     260:	e55b200d 	ldrb	r2, [fp, #-13]
     264:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     268:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     26c:	e2433001 	sub	r3, r3, #1
     270:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     274:	e51b3008 	ldr	r3, [fp, #-8]
     278:	e2833001 	add	r3, r3, #1
     27c:	e50b3008 	str	r3, [fp, #-8]
     280:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     284:	e3530000 	cmp	r3, #0
     288:	0a000003 	beq	29c <memset+0x98>
     28c:	e51b3008 	ldr	r3, [fp, #-8]
     290:	e2033003 	and	r3, r3, #3
     294:	e3530000 	cmp	r3, #0
     298:	1affffef 	bne	25c <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     29c:	e51b3008 	ldr	r3, [fp, #-8]
     2a0:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     2a4:	ea000008 	b	2cc <memset+0xc8>
		*p4 = val;
     2a8:	e51b300c 	ldr	r3, [fp, #-12]
     2ac:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     2b0:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     2b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2b8:	e2433004 	sub	r3, r3, #4
     2bc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     2c0:	e51b300c 	ldr	r3, [fp, #-12]
     2c4:	e2833004 	add	r3, r3, #4
     2c8:	e50b300c 	str	r3, [fp, #-12]
     2cc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2d0:	e3530003 	cmp	r3, #3
     2d4:	8afffff3 	bhi	2a8 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     2d8:	e51b300c 	ldr	r3, [fp, #-12]
     2dc:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     2e0:	ea000008 	b	308 <memset+0x104>
		*p = c;
     2e4:	e51b3008 	ldr	r3, [fp, #-8]
     2e8:	e55b200d 	ldrb	r2, [fp, #-13]
     2ec:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     2f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2f4:	e2433001 	sub	r3, r3, #1
     2f8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     2fc:	e51b3008 	ldr	r3, [fp, #-8]
     300:	e2833001 	add	r3, r3, #1
     304:	e50b3008 	str	r3, [fp, #-8]
     308:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     30c:	e3530000 	cmp	r3, #0
     310:	1afffff3 	bne	2e4 <memset+0xe0>
		*p = c;
	}

	return dst;
     314:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     318:	e1a00003 	mov	r0, r3
     31c:	e28bd000 	add	sp, fp, #0
     320:	e8bd0800 	pop	{fp}
     324:	e12fff1e 	bx	lr

00000328 <strchr>:

char*
strchr(const char *s, char c)
{
     328:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     32c:	e28db000 	add	fp, sp, #0
     330:	e24dd00c 	sub	sp, sp, #12
     334:	e50b0008 	str	r0, [fp, #-8]
     338:	e1a03001 	mov	r3, r1
     33c:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     340:	ea000009 	b	36c <strchr+0x44>
        if(*s == c)
     344:	e51b3008 	ldr	r3, [fp, #-8]
     348:	e5d33000 	ldrb	r3, [r3]
     34c:	e55b2009 	ldrb	r2, [fp, #-9]
     350:	e1520003 	cmp	r2, r3
     354:	1a000001 	bne	360 <strchr+0x38>
            return (char*)s;
     358:	e51b3008 	ldr	r3, [fp, #-8]
     35c:	ea000007 	b	380 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     360:	e51b3008 	ldr	r3, [fp, #-8]
     364:	e2833001 	add	r3, r3, #1
     368:	e50b3008 	str	r3, [fp, #-8]
     36c:	e51b3008 	ldr	r3, [fp, #-8]
     370:	e5d33000 	ldrb	r3, [r3]
     374:	e3530000 	cmp	r3, #0
     378:	1afffff1 	bne	344 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     37c:	e3a03000 	mov	r3, #0
}
     380:	e1a00003 	mov	r0, r3
     384:	e28bd000 	add	sp, fp, #0
     388:	e8bd0800 	pop	{fp}
     38c:	e12fff1e 	bx	lr

00000390 <gets>:

char*
gets(char *buf, int max)
{
     390:	e92d4800 	push	{fp, lr}
     394:	e28db004 	add	fp, sp, #4
     398:	e24dd018 	sub	sp, sp, #24
     39c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     3a0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     3a4:	e3a03000 	mov	r3, #0
     3a8:	e50b3008 	str	r3, [fp, #-8]
     3ac:	ea000016 	b	40c <gets+0x7c>
        cc = read(0, &c, 1);
     3b0:	e3a00000 	mov	r0, #0
     3b4:	e24b300d 	sub	r3, fp, #13
     3b8:	e1a01003 	mov	r1, r3
     3bc:	e3a02001 	mov	r2, #1
     3c0:	eb0000a3 	bl	654 <read>
     3c4:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     3c8:	e51b300c 	ldr	r3, [fp, #-12]
     3cc:	e3530000 	cmp	r3, #0
     3d0:	da000013 	ble	424 <gets+0x94>
            break;
        buf[i++] = c;
     3d4:	e51b3008 	ldr	r3, [fp, #-8]
     3d8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     3dc:	e0823003 	add	r3, r2, r3
     3e0:	e55b200d 	ldrb	r2, [fp, #-13]
     3e4:	e5c32000 	strb	r2, [r3]
     3e8:	e51b3008 	ldr	r3, [fp, #-8]
     3ec:	e2833001 	add	r3, r3, #1
     3f0:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     3f4:	e55b300d 	ldrb	r3, [fp, #-13]
     3f8:	e353000a 	cmp	r3, #10
     3fc:	0a000009 	beq	428 <gets+0x98>
     400:	e55b300d 	ldrb	r3, [fp, #-13]
     404:	e353000d 	cmp	r3, #13
     408:	0a000006 	beq	428 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     40c:	e51b3008 	ldr	r3, [fp, #-8]
     410:	e2832001 	add	r2, r3, #1
     414:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     418:	e1520003 	cmp	r2, r3
     41c:	baffffe3 	blt	3b0 <gets+0x20>
     420:	ea000000 	b	428 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     424:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     428:	e51b3008 	ldr	r3, [fp, #-8]
     42c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     430:	e0823003 	add	r3, r2, r3
     434:	e3a02000 	mov	r2, #0
     438:	e5c32000 	strb	r2, [r3]
    return buf;
     43c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     440:	e1a00003 	mov	r0, r3
     444:	e24bd004 	sub	sp, fp, #4
     448:	e8bd8800 	pop	{fp, pc}

0000044c <stat>:

int
stat(char *n, struct stat *st)
{
     44c:	e92d4800 	push	{fp, lr}
     450:	e28db004 	add	fp, sp, #4
     454:	e24dd010 	sub	sp, sp, #16
     458:	e50b0010 	str	r0, [fp, #-16]
     45c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     460:	e51b0010 	ldr	r0, [fp, #-16]
     464:	e3a01000 	mov	r1, #0
     468:	eb0000a6 	bl	708 <open>
     46c:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     470:	e51b3008 	ldr	r3, [fp, #-8]
     474:	e3530000 	cmp	r3, #0
     478:	aa000001 	bge	484 <stat+0x38>
        return -1;
     47c:	e3e03000 	mvn	r3, #0
     480:	ea000006 	b	4a0 <stat+0x54>
    r = fstat(fd, st);
     484:	e51b0008 	ldr	r0, [fp, #-8]
     488:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     48c:	eb0000b8 	bl	774 <fstat>
     490:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     494:	e51b0008 	ldr	r0, [fp, #-8]
     498:	eb00007f 	bl	69c <close>
    return r;
     49c:	e51b300c 	ldr	r3, [fp, #-12]
}
     4a0:	e1a00003 	mov	r0, r3
     4a4:	e24bd004 	sub	sp, fp, #4
     4a8:	e8bd8800 	pop	{fp, pc}

000004ac <atoi>:

int
atoi(const char *s)
{
     4ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4b0:	e28db000 	add	fp, sp, #0
     4b4:	e24dd014 	sub	sp, sp, #20
     4b8:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     4bc:	e3a03000 	mov	r3, #0
     4c0:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     4c4:	ea00000d 	b	500 <atoi+0x54>
        n = n*10 + *s++ - '0';
     4c8:	e51b2008 	ldr	r2, [fp, #-8]
     4cc:	e1a03002 	mov	r3, r2
     4d0:	e1a03103 	lsl	r3, r3, #2
     4d4:	e0833002 	add	r3, r3, r2
     4d8:	e1a03083 	lsl	r3, r3, #1
     4dc:	e1a02003 	mov	r2, r3
     4e0:	e51b3010 	ldr	r3, [fp, #-16]
     4e4:	e5d33000 	ldrb	r3, [r3]
     4e8:	e0823003 	add	r3, r2, r3
     4ec:	e2433030 	sub	r3, r3, #48	; 0x30
     4f0:	e50b3008 	str	r3, [fp, #-8]
     4f4:	e51b3010 	ldr	r3, [fp, #-16]
     4f8:	e2833001 	add	r3, r3, #1
     4fc:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     500:	e51b3010 	ldr	r3, [fp, #-16]
     504:	e5d33000 	ldrb	r3, [r3]
     508:	e353002f 	cmp	r3, #47	; 0x2f
     50c:	9a000003 	bls	520 <atoi+0x74>
     510:	e51b3010 	ldr	r3, [fp, #-16]
     514:	e5d33000 	ldrb	r3, [r3]
     518:	e3530039 	cmp	r3, #57	; 0x39
     51c:	9affffe9 	bls	4c8 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     520:	e51b3008 	ldr	r3, [fp, #-8]
}
     524:	e1a00003 	mov	r0, r3
     528:	e28bd000 	add	sp, fp, #0
     52c:	e8bd0800 	pop	{fp}
     530:	e12fff1e 	bx	lr

00000534 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     534:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     538:	e28db000 	add	fp, sp, #0
     53c:	e24dd01c 	sub	sp, sp, #28
     540:	e50b0010 	str	r0, [fp, #-16]
     544:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     548:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     54c:	e51b3010 	ldr	r3, [fp, #-16]
     550:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     554:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     558:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     55c:	ea000009 	b	588 <memmove+0x54>
        *dst++ = *src++;
     560:	e51b300c 	ldr	r3, [fp, #-12]
     564:	e5d32000 	ldrb	r2, [r3]
     568:	e51b3008 	ldr	r3, [fp, #-8]
     56c:	e5c32000 	strb	r2, [r3]
     570:	e51b3008 	ldr	r3, [fp, #-8]
     574:	e2833001 	add	r3, r3, #1
     578:	e50b3008 	str	r3, [fp, #-8]
     57c:	e51b300c 	ldr	r3, [fp, #-12]
     580:	e2833001 	add	r3, r3, #1
     584:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     588:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     58c:	e3530000 	cmp	r3, #0
     590:	d3a03000 	movle	r3, #0
     594:	c3a03001 	movgt	r3, #1
     598:	e6ef3073 	uxtb	r3, r3
     59c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     5a0:	e2422001 	sub	r2, r2, #1
     5a4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     5a8:	e3530000 	cmp	r3, #0
     5ac:	1affffeb 	bne	560 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     5b0:	e51b3010 	ldr	r3, [fp, #-16]
}
     5b4:	e1a00003 	mov	r0, r3
     5b8:	e28bd000 	add	sp, fp, #0
     5bc:	e8bd0800 	pop	{fp}
     5c0:	e12fff1e 	bx	lr

000005c4 <fork>:
     5c4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5c8:	e1a04003 	mov	r4, r3
     5cc:	e1a03002 	mov	r3, r2
     5d0:	e1a02001 	mov	r2, r1
     5d4:	e1a01000 	mov	r1, r0
     5d8:	e3a00001 	mov	r0, #1
     5dc:	ef000000 	svc	0x00000000
     5e0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     5e4:	e12fff1e 	bx	lr

000005e8 <exit>:
     5e8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     5ec:	e1a04003 	mov	r4, r3
     5f0:	e1a03002 	mov	r3, r2
     5f4:	e1a02001 	mov	r2, r1
     5f8:	e1a01000 	mov	r1, r0
     5fc:	e3a00002 	mov	r0, #2
     600:	ef000000 	svc	0x00000000
     604:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     608:	e12fff1e 	bx	lr

0000060c <wait>:
     60c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     610:	e1a04003 	mov	r4, r3
     614:	e1a03002 	mov	r3, r2
     618:	e1a02001 	mov	r2, r1
     61c:	e1a01000 	mov	r1, r0
     620:	e3a00003 	mov	r0, #3
     624:	ef000000 	svc	0x00000000
     628:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     62c:	e12fff1e 	bx	lr

00000630 <pipe>:
     630:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     634:	e1a04003 	mov	r4, r3
     638:	e1a03002 	mov	r3, r2
     63c:	e1a02001 	mov	r2, r1
     640:	e1a01000 	mov	r1, r0
     644:	e3a00004 	mov	r0, #4
     648:	ef000000 	svc	0x00000000
     64c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     650:	e12fff1e 	bx	lr

00000654 <read>:
     654:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     658:	e1a04003 	mov	r4, r3
     65c:	e1a03002 	mov	r3, r2
     660:	e1a02001 	mov	r2, r1
     664:	e1a01000 	mov	r1, r0
     668:	e3a00005 	mov	r0, #5
     66c:	ef000000 	svc	0x00000000
     670:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     674:	e12fff1e 	bx	lr

00000678 <write>:
     678:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     67c:	e1a04003 	mov	r4, r3
     680:	e1a03002 	mov	r3, r2
     684:	e1a02001 	mov	r2, r1
     688:	e1a01000 	mov	r1, r0
     68c:	e3a00010 	mov	r0, #16
     690:	ef000000 	svc	0x00000000
     694:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     698:	e12fff1e 	bx	lr

0000069c <close>:
     69c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6a0:	e1a04003 	mov	r4, r3
     6a4:	e1a03002 	mov	r3, r2
     6a8:	e1a02001 	mov	r2, r1
     6ac:	e1a01000 	mov	r1, r0
     6b0:	e3a00015 	mov	r0, #21
     6b4:	ef000000 	svc	0x00000000
     6b8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6bc:	e12fff1e 	bx	lr

000006c0 <kill>:
     6c0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6c4:	e1a04003 	mov	r4, r3
     6c8:	e1a03002 	mov	r3, r2
     6cc:	e1a02001 	mov	r2, r1
     6d0:	e1a01000 	mov	r1, r0
     6d4:	e3a00006 	mov	r0, #6
     6d8:	ef000000 	svc	0x00000000
     6dc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6e0:	e12fff1e 	bx	lr

000006e4 <exec>:
     6e4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6e8:	e1a04003 	mov	r4, r3
     6ec:	e1a03002 	mov	r3, r2
     6f0:	e1a02001 	mov	r2, r1
     6f4:	e1a01000 	mov	r1, r0
     6f8:	e3a00007 	mov	r0, #7
     6fc:	ef000000 	svc	0x00000000
     700:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     704:	e12fff1e 	bx	lr

00000708 <open>:
     708:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     70c:	e1a04003 	mov	r4, r3
     710:	e1a03002 	mov	r3, r2
     714:	e1a02001 	mov	r2, r1
     718:	e1a01000 	mov	r1, r0
     71c:	e3a0000f 	mov	r0, #15
     720:	ef000000 	svc	0x00000000
     724:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     728:	e12fff1e 	bx	lr

0000072c <mknod>:
     72c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     730:	e1a04003 	mov	r4, r3
     734:	e1a03002 	mov	r3, r2
     738:	e1a02001 	mov	r2, r1
     73c:	e1a01000 	mov	r1, r0
     740:	e3a00011 	mov	r0, #17
     744:	ef000000 	svc	0x00000000
     748:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     74c:	e12fff1e 	bx	lr

00000750 <unlink>:
     750:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     754:	e1a04003 	mov	r4, r3
     758:	e1a03002 	mov	r3, r2
     75c:	e1a02001 	mov	r2, r1
     760:	e1a01000 	mov	r1, r0
     764:	e3a00012 	mov	r0, #18
     768:	ef000000 	svc	0x00000000
     76c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     770:	e12fff1e 	bx	lr

00000774 <fstat>:
     774:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     778:	e1a04003 	mov	r4, r3
     77c:	e1a03002 	mov	r3, r2
     780:	e1a02001 	mov	r2, r1
     784:	e1a01000 	mov	r1, r0
     788:	e3a00008 	mov	r0, #8
     78c:	ef000000 	svc	0x00000000
     790:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     794:	e12fff1e 	bx	lr

00000798 <link>:
     798:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     79c:	e1a04003 	mov	r4, r3
     7a0:	e1a03002 	mov	r3, r2
     7a4:	e1a02001 	mov	r2, r1
     7a8:	e1a01000 	mov	r1, r0
     7ac:	e3a00013 	mov	r0, #19
     7b0:	ef000000 	svc	0x00000000
     7b4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7b8:	e12fff1e 	bx	lr

000007bc <mkdir>:
     7bc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7c0:	e1a04003 	mov	r4, r3
     7c4:	e1a03002 	mov	r3, r2
     7c8:	e1a02001 	mov	r2, r1
     7cc:	e1a01000 	mov	r1, r0
     7d0:	e3a00014 	mov	r0, #20
     7d4:	ef000000 	svc	0x00000000
     7d8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7dc:	e12fff1e 	bx	lr

000007e0 <chdir>:
     7e0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7e4:	e1a04003 	mov	r4, r3
     7e8:	e1a03002 	mov	r3, r2
     7ec:	e1a02001 	mov	r2, r1
     7f0:	e1a01000 	mov	r1, r0
     7f4:	e3a00009 	mov	r0, #9
     7f8:	ef000000 	svc	0x00000000
     7fc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     800:	e12fff1e 	bx	lr

00000804 <dup>:
     804:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     808:	e1a04003 	mov	r4, r3
     80c:	e1a03002 	mov	r3, r2
     810:	e1a02001 	mov	r2, r1
     814:	e1a01000 	mov	r1, r0
     818:	e3a0000a 	mov	r0, #10
     81c:	ef000000 	svc	0x00000000
     820:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     824:	e12fff1e 	bx	lr

00000828 <getpid>:
     828:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     82c:	e1a04003 	mov	r4, r3
     830:	e1a03002 	mov	r3, r2
     834:	e1a02001 	mov	r2, r1
     838:	e1a01000 	mov	r1, r0
     83c:	e3a0000b 	mov	r0, #11
     840:	ef000000 	svc	0x00000000
     844:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     848:	e12fff1e 	bx	lr

0000084c <sbrk>:
     84c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     850:	e1a04003 	mov	r4, r3
     854:	e1a03002 	mov	r3, r2
     858:	e1a02001 	mov	r2, r1
     85c:	e1a01000 	mov	r1, r0
     860:	e3a0000c 	mov	r0, #12
     864:	ef000000 	svc	0x00000000
     868:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     86c:	e12fff1e 	bx	lr

00000870 <sleep>:
     870:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     874:	e1a04003 	mov	r4, r3
     878:	e1a03002 	mov	r3, r2
     87c:	e1a02001 	mov	r2, r1
     880:	e1a01000 	mov	r1, r0
     884:	e3a0000d 	mov	r0, #13
     888:	ef000000 	svc	0x00000000
     88c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     890:	e12fff1e 	bx	lr

00000894 <uptime>:
     894:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     898:	e1a04003 	mov	r4, r3
     89c:	e1a03002 	mov	r3, r2
     8a0:	e1a02001 	mov	r2, r1
     8a4:	e1a01000 	mov	r1, r0
     8a8:	e3a0000e 	mov	r0, #14
     8ac:	ef000000 	svc	0x00000000
     8b0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8b4:	e12fff1e 	bx	lr

000008b8 <kthread_create>:
     8b8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8bc:	e1a04003 	mov	r4, r3
     8c0:	e1a03002 	mov	r3, r2
     8c4:	e1a02001 	mov	r2, r1
     8c8:	e1a01000 	mov	r1, r0
     8cc:	e3a00016 	mov	r0, #22
     8d0:	ef000000 	svc	0x00000000
     8d4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8d8:	e12fff1e 	bx	lr

000008dc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     8dc:	e92d4800 	push	{fp, lr}
     8e0:	e28db004 	add	fp, sp, #4
     8e4:	e24dd008 	sub	sp, sp, #8
     8e8:	e50b0008 	str	r0, [fp, #-8]
     8ec:	e1a03001 	mov	r3, r1
     8f0:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     8f4:	e51b0008 	ldr	r0, [fp, #-8]
     8f8:	e24b3009 	sub	r3, fp, #9
     8fc:	e1a01003 	mov	r1, r3
     900:	e3a02001 	mov	r2, #1
     904:	ebffff5b 	bl	678 <write>
}
     908:	e24bd004 	sub	sp, fp, #4
     90c:	e8bd8800 	pop	{fp, pc}

00000910 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     910:	e92d4800 	push	{fp, lr}
     914:	e28db004 	add	fp, sp, #4
     918:	e24dd030 	sub	sp, sp, #48	; 0x30
     91c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     920:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     924:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     928:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     92c:	e3a03000 	mov	r3, #0
     930:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     934:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     938:	e3530000 	cmp	r3, #0
     93c:	0a000008 	beq	964 <printint+0x54>
     940:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     944:	e3530000 	cmp	r3, #0
     948:	aa000005 	bge	964 <printint+0x54>
        neg = 1;
     94c:	e3a03001 	mov	r3, #1
     950:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     954:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     958:	e2633000 	rsb	r3, r3, #0
     95c:	e50b3010 	str	r3, [fp, #-16]
     960:	ea000001 	b	96c <printint+0x5c>
    } else {
        x = xx;
     964:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     968:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     96c:	e3a03000 	mov	r3, #0
     970:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     974:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     978:	e51b2010 	ldr	r2, [fp, #-16]
     97c:	e1a00002 	mov	r0, r2
     980:	e1a01003 	mov	r1, r3
     984:	eb0001e5 	bl	1120 <__aeabi_uidivmod>
     988:	e1a03001 	mov	r3, r1
     98c:	e1a02003 	mov	r2, r3
     990:	e3013180 	movw	r3, #4480	; 0x1180
     994:	e3403000 	movt	r3, #0
     998:	e7d32002 	ldrb	r2, [r3, r2]
     99c:	e3e0001b 	mvn	r0, #27
     9a0:	e51b3008 	ldr	r3, [fp, #-8]
     9a4:	e24bc004 	sub	ip, fp, #4
     9a8:	e08c1003 	add	r1, ip, r3
     9ac:	e1a03000 	mov	r3, r0
     9b0:	e0813003 	add	r3, r1, r3
     9b4:	e5c32000 	strb	r2, [r3]
     9b8:	e51b3008 	ldr	r3, [fp, #-8]
     9bc:	e2833001 	add	r3, r3, #1
     9c0:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     9c4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     9c8:	e51b0010 	ldr	r0, [fp, #-16]
     9cc:	e1a01003 	mov	r1, r3
     9d0:	eb000195 	bl	102c <__aeabi_uidiv>
     9d4:	e1a03000 	mov	r3, r0
     9d8:	e50b3010 	str	r3, [fp, #-16]
     9dc:	e51b3010 	ldr	r3, [fp, #-16]
     9e0:	e3530000 	cmp	r3, #0
     9e4:	1affffe2 	bne	974 <printint+0x64>
    if(neg)
     9e8:	e51b300c 	ldr	r3, [fp, #-12]
     9ec:	e3530000 	cmp	r3, #0
     9f0:	0a000015 	beq	a4c <printint+0x13c>
        buf[i++] = '-';
     9f4:	e3e0101b 	mvn	r1, #27
     9f8:	e51b3008 	ldr	r3, [fp, #-8]
     9fc:	e24b0004 	sub	r0, fp, #4
     a00:	e0802003 	add	r2, r0, r3
     a04:	e1a03001 	mov	r3, r1
     a08:	e0823003 	add	r3, r2, r3
     a0c:	e3a0202d 	mov	r2, #45	; 0x2d
     a10:	e5c32000 	strb	r2, [r3]
     a14:	e51b3008 	ldr	r3, [fp, #-8]
     a18:	e2833001 	add	r3, r3, #1
     a1c:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     a20:	ea000009 	b	a4c <printint+0x13c>
        putc(fd, buf[i]);
     a24:	e3e0101b 	mvn	r1, #27
     a28:	e51b3008 	ldr	r3, [fp, #-8]
     a2c:	e24bc004 	sub	ip, fp, #4
     a30:	e08c2003 	add	r2, ip, r3
     a34:	e1a03001 	mov	r3, r1
     a38:	e0823003 	add	r3, r2, r3
     a3c:	e5d33000 	ldrb	r3, [r3]
     a40:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     a44:	e1a01003 	mov	r1, r3
     a48:	ebffffa3 	bl	8dc <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     a4c:	e51b3008 	ldr	r3, [fp, #-8]
     a50:	e2433001 	sub	r3, r3, #1
     a54:	e50b3008 	str	r3, [fp, #-8]
     a58:	e51b3008 	ldr	r3, [fp, #-8]
     a5c:	e3530000 	cmp	r3, #0
     a60:	aaffffef 	bge	a24 <printint+0x114>
        putc(fd, buf[i]);
}
     a64:	e24bd004 	sub	sp, fp, #4
     a68:	e8bd8800 	pop	{fp, pc}

00000a6c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     a6c:	e92d000e 	push	{r1, r2, r3}
     a70:	e92d4800 	push	{fp, lr}
     a74:	e28db004 	add	fp, sp, #4
     a78:	e24dd024 	sub	sp, sp, #36	; 0x24
     a7c:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     a80:	e3a03000 	mov	r3, #0
     a84:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     a88:	e28b3008 	add	r3, fp, #8
     a8c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     a90:	e3a03000 	mov	r3, #0
     a94:	e50b3010 	str	r3, [fp, #-16]
     a98:	ea000077 	b	c7c <printf+0x210>
        c = fmt[i] & 0xff;
     a9c:	e59b2004 	ldr	r2, [fp, #4]
     aa0:	e51b3010 	ldr	r3, [fp, #-16]
     aa4:	e0823003 	add	r3, r2, r3
     aa8:	e5d33000 	ldrb	r3, [r3]
     aac:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     ab0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     ab4:	e3530000 	cmp	r3, #0
     ab8:	1a00000b 	bne	aec <printf+0x80>
            if(c == '%'){
     abc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ac0:	e3530025 	cmp	r3, #37	; 0x25
     ac4:	1a000002 	bne	ad4 <printf+0x68>
                state = '%';
     ac8:	e3a03025 	mov	r3, #37	; 0x25
     acc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     ad0:	ea000066 	b	c70 <printf+0x204>
            } else {
                putc(fd, c);
     ad4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ad8:	e6ef3073 	uxtb	r3, r3
     adc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ae0:	e1a01003 	mov	r1, r3
     ae4:	ebffff7c 	bl	8dc <putc>
     ae8:	ea000060 	b	c70 <printf+0x204>
            }
        } else if(state == '%'){
     aec:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     af0:	e3530025 	cmp	r3, #37	; 0x25
     af4:	1a00005d 	bne	c70 <printf+0x204>
            if(c == 'd'){
     af8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     afc:	e3530064 	cmp	r3, #100	; 0x64
     b00:	1a00000a 	bne	b30 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     b04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b08:	e5933000 	ldr	r3, [r3]
     b0c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b10:	e1a01003 	mov	r1, r3
     b14:	e3a0200a 	mov	r2, #10
     b18:	e3a03001 	mov	r3, #1
     b1c:	ebffff7b 	bl	910 <printint>
                ap++;
     b20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b24:	e2833004 	add	r3, r3, #4
     b28:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b2c:	ea00004d 	b	c68 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     b30:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b34:	e3530078 	cmp	r3, #120	; 0x78
     b38:	0a000002 	beq	b48 <printf+0xdc>
     b3c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b40:	e3530070 	cmp	r3, #112	; 0x70
     b44:	1a00000a 	bne	b74 <printf+0x108>
                printint(fd, *ap, 16, 0);
     b48:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b4c:	e5933000 	ldr	r3, [r3]
     b50:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b54:	e1a01003 	mov	r1, r3
     b58:	e3a02010 	mov	r2, #16
     b5c:	e3a03000 	mov	r3, #0
     b60:	ebffff6a 	bl	910 <printint>
                ap++;
     b64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b68:	e2833004 	add	r3, r3, #4
     b6c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b70:	ea00003c 	b	c68 <printf+0x1fc>
            } else if(c == 's'){
     b74:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b78:	e3530073 	cmp	r3, #115	; 0x73
     b7c:	1a00001b 	bne	bf0 <printf+0x184>
                s = (char*)*ap;
     b80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b84:	e5933000 	ldr	r3, [r3]
     b88:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     b8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b90:	e2833004 	add	r3, r3, #4
     b94:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     b98:	e51b300c 	ldr	r3, [fp, #-12]
     b9c:	e3530000 	cmp	r3, #0
     ba0:	1a00000c 	bne	bd8 <printf+0x16c>
                    s = "(null)";
     ba4:	e3013178 	movw	r3, #4472	; 0x1178
     ba8:	e3403000 	movt	r3, #0
     bac:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     bb0:	ea000008 	b	bd8 <printf+0x16c>
                    putc(fd, *s);
     bb4:	e51b300c 	ldr	r3, [fp, #-12]
     bb8:	e5d33000 	ldrb	r3, [r3]
     bbc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bc0:	e1a01003 	mov	r1, r3
     bc4:	ebffff44 	bl	8dc <putc>
                    s++;
     bc8:	e51b300c 	ldr	r3, [fp, #-12]
     bcc:	e2833001 	add	r3, r3, #1
     bd0:	e50b300c 	str	r3, [fp, #-12]
     bd4:	ea000000 	b	bdc <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     bd8:	e1a00000 	nop			; (mov r0, r0)
     bdc:	e51b300c 	ldr	r3, [fp, #-12]
     be0:	e5d33000 	ldrb	r3, [r3]
     be4:	e3530000 	cmp	r3, #0
     be8:	1afffff1 	bne	bb4 <printf+0x148>
     bec:	ea00001d 	b	c68 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     bf0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bf4:	e3530063 	cmp	r3, #99	; 0x63
     bf8:	1a000009 	bne	c24 <printf+0x1b8>
                putc(fd, *ap);
     bfc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c00:	e5933000 	ldr	r3, [r3]
     c04:	e6ef3073 	uxtb	r3, r3
     c08:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c0c:	e1a01003 	mov	r1, r3
     c10:	ebffff31 	bl	8dc <putc>
                ap++;
     c14:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c18:	e2833004 	add	r3, r3, #4
     c1c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     c20:	ea000010 	b	c68 <printf+0x1fc>
            } else if(c == '%'){
     c24:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c28:	e3530025 	cmp	r3, #37	; 0x25
     c2c:	1a000005 	bne	c48 <printf+0x1dc>
                putc(fd, c);
     c30:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c34:	e6ef3073 	uxtb	r3, r3
     c38:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c3c:	e1a01003 	mov	r1, r3
     c40:	ebffff25 	bl	8dc <putc>
     c44:	ea000007 	b	c68 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     c48:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c4c:	e3a01025 	mov	r1, #37	; 0x25
     c50:	ebffff21 	bl	8dc <putc>
                putc(fd, c);
     c54:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c58:	e6ef3073 	uxtb	r3, r3
     c5c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c60:	e1a01003 	mov	r1, r3
     c64:	ebffff1c 	bl	8dc <putc>
            }
            state = 0;
     c68:	e3a03000 	mov	r3, #0
     c6c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     c70:	e51b3010 	ldr	r3, [fp, #-16]
     c74:	e2833001 	add	r3, r3, #1
     c78:	e50b3010 	str	r3, [fp, #-16]
     c7c:	e59b2004 	ldr	r2, [fp, #4]
     c80:	e51b3010 	ldr	r3, [fp, #-16]
     c84:	e0823003 	add	r3, r2, r3
     c88:	e5d33000 	ldrb	r3, [r3]
     c8c:	e3530000 	cmp	r3, #0
     c90:	1affff81 	bne	a9c <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     c94:	e24bd004 	sub	sp, fp, #4
     c98:	e8bd4800 	pop	{fp, lr}
     c9c:	e28dd00c 	add	sp, sp, #12
     ca0:	e12fff1e 	bx	lr

00000ca4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ca4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     ca8:	e28db000 	add	fp, sp, #0
     cac:	e24dd014 	sub	sp, sp, #20
     cb0:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     cb4:	e51b3010 	ldr	r3, [fp, #-16]
     cb8:	e2433008 	sub	r3, r3, #8
     cbc:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     cc0:	e301319c 	movw	r3, #4508	; 0x119c
     cc4:	e3403000 	movt	r3, #0
     cc8:	e5933000 	ldr	r3, [r3]
     ccc:	e50b3008 	str	r3, [fp, #-8]
     cd0:	ea000010 	b	d18 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     cd4:	e51b3008 	ldr	r3, [fp, #-8]
     cd8:	e5932000 	ldr	r2, [r3]
     cdc:	e51b3008 	ldr	r3, [fp, #-8]
     ce0:	e1520003 	cmp	r2, r3
     ce4:	8a000008 	bhi	d0c <free+0x68>
     ce8:	e51b200c 	ldr	r2, [fp, #-12]
     cec:	e51b3008 	ldr	r3, [fp, #-8]
     cf0:	e1520003 	cmp	r2, r3
     cf4:	8a000010 	bhi	d3c <free+0x98>
     cf8:	e51b3008 	ldr	r3, [fp, #-8]
     cfc:	e5932000 	ldr	r2, [r3]
     d00:	e51b300c 	ldr	r3, [fp, #-12]
     d04:	e1520003 	cmp	r2, r3
     d08:	8a00000b 	bhi	d3c <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d0c:	e51b3008 	ldr	r3, [fp, #-8]
     d10:	e5933000 	ldr	r3, [r3]
     d14:	e50b3008 	str	r3, [fp, #-8]
     d18:	e51b200c 	ldr	r2, [fp, #-12]
     d1c:	e51b3008 	ldr	r3, [fp, #-8]
     d20:	e1520003 	cmp	r2, r3
     d24:	9affffea 	bls	cd4 <free+0x30>
     d28:	e51b3008 	ldr	r3, [fp, #-8]
     d2c:	e5932000 	ldr	r2, [r3]
     d30:	e51b300c 	ldr	r3, [fp, #-12]
     d34:	e1520003 	cmp	r2, r3
     d38:	9affffe5 	bls	cd4 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     d3c:	e51b300c 	ldr	r3, [fp, #-12]
     d40:	e5933004 	ldr	r3, [r3, #4]
     d44:	e1a03183 	lsl	r3, r3, #3
     d48:	e51b200c 	ldr	r2, [fp, #-12]
     d4c:	e0822003 	add	r2, r2, r3
     d50:	e51b3008 	ldr	r3, [fp, #-8]
     d54:	e5933000 	ldr	r3, [r3]
     d58:	e1520003 	cmp	r2, r3
     d5c:	1a00000d 	bne	d98 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     d60:	e51b300c 	ldr	r3, [fp, #-12]
     d64:	e5932004 	ldr	r2, [r3, #4]
     d68:	e51b3008 	ldr	r3, [fp, #-8]
     d6c:	e5933000 	ldr	r3, [r3]
     d70:	e5933004 	ldr	r3, [r3, #4]
     d74:	e0822003 	add	r2, r2, r3
     d78:	e51b300c 	ldr	r3, [fp, #-12]
     d7c:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e5933000 	ldr	r3, [r3]
     d88:	e5932000 	ldr	r2, [r3]
     d8c:	e51b300c 	ldr	r3, [fp, #-12]
     d90:	e5832000 	str	r2, [r3]
     d94:	ea000003 	b	da8 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     d98:	e51b3008 	ldr	r3, [fp, #-8]
     d9c:	e5932000 	ldr	r2, [r3]
     da0:	e51b300c 	ldr	r3, [fp, #-12]
     da4:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     da8:	e51b3008 	ldr	r3, [fp, #-8]
     dac:	e5933004 	ldr	r3, [r3, #4]
     db0:	e1a03183 	lsl	r3, r3, #3
     db4:	e51b2008 	ldr	r2, [fp, #-8]
     db8:	e0822003 	add	r2, r2, r3
     dbc:	e51b300c 	ldr	r3, [fp, #-12]
     dc0:	e1520003 	cmp	r2, r3
     dc4:	1a00000b 	bne	df8 <free+0x154>
        p->s.size += bp->s.size;
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e5932004 	ldr	r2, [r3, #4]
     dd0:	e51b300c 	ldr	r3, [fp, #-12]
     dd4:	e5933004 	ldr	r3, [r3, #4]
     dd8:	e0822003 	add	r2, r2, r3
     ddc:	e51b3008 	ldr	r3, [fp, #-8]
     de0:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     de4:	e51b300c 	ldr	r3, [fp, #-12]
     de8:	e5932000 	ldr	r2, [r3]
     dec:	e51b3008 	ldr	r3, [fp, #-8]
     df0:	e5832000 	str	r2, [r3]
     df4:	ea000002 	b	e04 <free+0x160>
    } else
        p->s.ptr = bp;
     df8:	e51b3008 	ldr	r3, [fp, #-8]
     dfc:	e51b200c 	ldr	r2, [fp, #-12]
     e00:	e5832000 	str	r2, [r3]
    freep = p;
     e04:	e301319c 	movw	r3, #4508	; 0x119c
     e08:	e3403000 	movt	r3, #0
     e0c:	e51b2008 	ldr	r2, [fp, #-8]
     e10:	e5832000 	str	r2, [r3]
}
     e14:	e28bd000 	add	sp, fp, #0
     e18:	e8bd0800 	pop	{fp}
     e1c:	e12fff1e 	bx	lr

00000e20 <morecore>:

static Header*
morecore(uint nu)
{
     e20:	e92d4800 	push	{fp, lr}
     e24:	e28db004 	add	fp, sp, #4
     e28:	e24dd010 	sub	sp, sp, #16
     e2c:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     e30:	e51b2010 	ldr	r2, [fp, #-16]
     e34:	e3003fff 	movw	r3, #4095	; 0xfff
     e38:	e1520003 	cmp	r2, r3
     e3c:	8a000001 	bhi	e48 <morecore+0x28>
        nu = 4096;
     e40:	e3a03a01 	mov	r3, #4096	; 0x1000
     e44:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     e48:	e51b3010 	ldr	r3, [fp, #-16]
     e4c:	e1a03183 	lsl	r3, r3, #3
     e50:	e1a00003 	mov	r0, r3
     e54:	ebfffe7c 	bl	84c <sbrk>
     e58:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     e5c:	e51b3008 	ldr	r3, [fp, #-8]
     e60:	e3730001 	cmn	r3, #1
     e64:	1a000001 	bne	e70 <morecore+0x50>
        return 0;
     e68:	e3a03000 	mov	r3, #0
     e6c:	ea00000b 	b	ea0 <morecore+0x80>
    hp = (Header*)p;
     e70:	e51b3008 	ldr	r3, [fp, #-8]
     e74:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     e78:	e51b300c 	ldr	r3, [fp, #-12]
     e7c:	e51b2010 	ldr	r2, [fp, #-16]
     e80:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     e84:	e51b300c 	ldr	r3, [fp, #-12]
     e88:	e2833008 	add	r3, r3, #8
     e8c:	e1a00003 	mov	r0, r3
     e90:	ebffff83 	bl	ca4 <free>
    return freep;
     e94:	e301319c 	movw	r3, #4508	; 0x119c
     e98:	e3403000 	movt	r3, #0
     e9c:	e5933000 	ldr	r3, [r3]
}
     ea0:	e1a00003 	mov	r0, r3
     ea4:	e24bd004 	sub	sp, fp, #4
     ea8:	e8bd8800 	pop	{fp, pc}

00000eac <malloc>:

void*
malloc(uint nbytes)
{
     eac:	e92d4800 	push	{fp, lr}
     eb0:	e28db004 	add	fp, sp, #4
     eb4:	e24dd018 	sub	sp, sp, #24
     eb8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     ebc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ec0:	e2833007 	add	r3, r3, #7
     ec4:	e1a031a3 	lsr	r3, r3, #3
     ec8:	e2833001 	add	r3, r3, #1
     ecc:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     ed0:	e301319c 	movw	r3, #4508	; 0x119c
     ed4:	e3403000 	movt	r3, #0
     ed8:	e5933000 	ldr	r3, [r3]
     edc:	e50b300c 	str	r3, [fp, #-12]
     ee0:	e51b300c 	ldr	r3, [fp, #-12]
     ee4:	e3530000 	cmp	r3, #0
     ee8:	1a000010 	bne	f30 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     eec:	e3013194 	movw	r3, #4500	; 0x1194
     ef0:	e3403000 	movt	r3, #0
     ef4:	e50b300c 	str	r3, [fp, #-12]
     ef8:	e301319c 	movw	r3, #4508	; 0x119c
     efc:	e3403000 	movt	r3, #0
     f00:	e51b200c 	ldr	r2, [fp, #-12]
     f04:	e5832000 	str	r2, [r3]
     f08:	e301319c 	movw	r3, #4508	; 0x119c
     f0c:	e3403000 	movt	r3, #0
     f10:	e5932000 	ldr	r2, [r3]
     f14:	e3013194 	movw	r3, #4500	; 0x1194
     f18:	e3403000 	movt	r3, #0
     f1c:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     f20:	e3013194 	movw	r3, #4500	; 0x1194
     f24:	e3403000 	movt	r3, #0
     f28:	e3a02000 	mov	r2, #0
     f2c:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f30:	e51b300c 	ldr	r3, [fp, #-12]
     f34:	e5933000 	ldr	r3, [r3]
     f38:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     f3c:	e51b3008 	ldr	r3, [fp, #-8]
     f40:	e5932004 	ldr	r2, [r3, #4]
     f44:	e51b3010 	ldr	r3, [fp, #-16]
     f48:	e1520003 	cmp	r2, r3
     f4c:	3a00001f 	bcc	fd0 <malloc+0x124>
            if(p->s.size == nunits)
     f50:	e51b3008 	ldr	r3, [fp, #-8]
     f54:	e5932004 	ldr	r2, [r3, #4]
     f58:	e51b3010 	ldr	r3, [fp, #-16]
     f5c:	e1520003 	cmp	r2, r3
     f60:	1a000004 	bne	f78 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     f64:	e51b3008 	ldr	r3, [fp, #-8]
     f68:	e5932000 	ldr	r2, [r3]
     f6c:	e51b300c 	ldr	r3, [fp, #-12]
     f70:	e5832000 	str	r2, [r3]
     f74:	ea00000e 	b	fb4 <malloc+0x108>
            else {
                p->s.size -= nunits;
     f78:	e51b3008 	ldr	r3, [fp, #-8]
     f7c:	e5932004 	ldr	r2, [r3, #4]
     f80:	e51b3010 	ldr	r3, [fp, #-16]
     f84:	e0632002 	rsb	r2, r3, r2
     f88:	e51b3008 	ldr	r3, [fp, #-8]
     f8c:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     f90:	e51b3008 	ldr	r3, [fp, #-8]
     f94:	e5933004 	ldr	r3, [r3, #4]
     f98:	e1a03183 	lsl	r3, r3, #3
     f9c:	e51b2008 	ldr	r2, [fp, #-8]
     fa0:	e0823003 	add	r3, r2, r3
     fa4:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     fa8:	e51b3008 	ldr	r3, [fp, #-8]
     fac:	e51b2010 	ldr	r2, [fp, #-16]
     fb0:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     fb4:	e301319c 	movw	r3, #4508	; 0x119c
     fb8:	e3403000 	movt	r3, #0
     fbc:	e51b200c 	ldr	r2, [fp, #-12]
     fc0:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     fc4:	e51b3008 	ldr	r3, [fp, #-8]
     fc8:	e2833008 	add	r3, r3, #8
     fcc:	ea000013 	b	1020 <malloc+0x174>
        }
        if(p == freep)
     fd0:	e301319c 	movw	r3, #4508	; 0x119c
     fd4:	e3403000 	movt	r3, #0
     fd8:	e5933000 	ldr	r3, [r3]
     fdc:	e51b2008 	ldr	r2, [fp, #-8]
     fe0:	e1520003 	cmp	r2, r3
     fe4:	1a000007 	bne	1008 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
     fe8:	e51b0010 	ldr	r0, [fp, #-16]
     fec:	ebffff8b 	bl	e20 <morecore>
     ff0:	e50b0008 	str	r0, [fp, #-8]
     ff4:	e51b3008 	ldr	r3, [fp, #-8]
     ff8:	e3530000 	cmp	r3, #0
     ffc:	1a000001 	bne	1008 <malloc+0x15c>
                return 0;
    1000:	e3a03000 	mov	r3, #0
    1004:	ea000005 	b	1020 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1008:	e51b3008 	ldr	r3, [fp, #-8]
    100c:	e50b300c 	str	r3, [fp, #-12]
    1010:	e51b3008 	ldr	r3, [fp, #-8]
    1014:	e5933000 	ldr	r3, [r3]
    1018:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    101c:	eaffffc6 	b	f3c <malloc+0x90>
}
    1020:	e1a00003 	mov	r0, r3
    1024:	e24bd004 	sub	sp, fp, #4
    1028:	e8bd8800 	pop	{fp, pc}

0000102c <__aeabi_uidiv>:
    102c:	e2512001 	subs	r2, r1, #1
    1030:	012fff1e 	bxeq	lr
    1034:	3a000036 	bcc	1114 <__aeabi_uidiv+0xe8>
    1038:	e1500001 	cmp	r0, r1
    103c:	9a000022 	bls	10cc <__aeabi_uidiv+0xa0>
    1040:	e1110002 	tst	r1, r2
    1044:	0a000023 	beq	10d8 <__aeabi_uidiv+0xac>
    1048:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    104c:	01a01181 	lsleq	r1, r1, #3
    1050:	03a03008 	moveq	r3, #8
    1054:	13a03001 	movne	r3, #1
    1058:	e3510201 	cmp	r1, #268435456	; 0x10000000
    105c:	31510000 	cmpcc	r1, r0
    1060:	31a01201 	lslcc	r1, r1, #4
    1064:	31a03203 	lslcc	r3, r3, #4
    1068:	3afffffa 	bcc	1058 <__aeabi_uidiv+0x2c>
    106c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1070:	31510000 	cmpcc	r1, r0
    1074:	31a01081 	lslcc	r1, r1, #1
    1078:	31a03083 	lslcc	r3, r3, #1
    107c:	3afffffa 	bcc	106c <__aeabi_uidiv+0x40>
    1080:	e3a02000 	mov	r2, #0
    1084:	e1500001 	cmp	r0, r1
    1088:	20400001 	subcs	r0, r0, r1
    108c:	21822003 	orrcs	r2, r2, r3
    1090:	e15000a1 	cmp	r0, r1, lsr #1
    1094:	204000a1 	subcs	r0, r0, r1, lsr #1
    1098:	218220a3 	orrcs	r2, r2, r3, lsr #1
    109c:	e1500121 	cmp	r0, r1, lsr #2
    10a0:	20400121 	subcs	r0, r0, r1, lsr #2
    10a4:	21822123 	orrcs	r2, r2, r3, lsr #2
    10a8:	e15001a1 	cmp	r0, r1, lsr #3
    10ac:	204001a1 	subcs	r0, r0, r1, lsr #3
    10b0:	218221a3 	orrcs	r2, r2, r3, lsr #3
    10b4:	e3500000 	cmp	r0, #0
    10b8:	11b03223 	lsrsne	r3, r3, #4
    10bc:	11a01221 	lsrne	r1, r1, #4
    10c0:	1affffef 	bne	1084 <__aeabi_uidiv+0x58>
    10c4:	e1a00002 	mov	r0, r2
    10c8:	e12fff1e 	bx	lr
    10cc:	03a00001 	moveq	r0, #1
    10d0:	13a00000 	movne	r0, #0
    10d4:	e12fff1e 	bx	lr
    10d8:	e3510801 	cmp	r1, #65536	; 0x10000
    10dc:	21a01821 	lsrcs	r1, r1, #16
    10e0:	23a02010 	movcs	r2, #16
    10e4:	33a02000 	movcc	r2, #0
    10e8:	e3510c01 	cmp	r1, #256	; 0x100
    10ec:	21a01421 	lsrcs	r1, r1, #8
    10f0:	22822008 	addcs	r2, r2, #8
    10f4:	e3510010 	cmp	r1, #16
    10f8:	21a01221 	lsrcs	r1, r1, #4
    10fc:	22822004 	addcs	r2, r2, #4
    1100:	e3510004 	cmp	r1, #4
    1104:	82822003 	addhi	r2, r2, #3
    1108:	908220a1 	addls	r2, r2, r1, lsr #1
    110c:	e1a00230 	lsr	r0, r0, r2
    1110:	e12fff1e 	bx	lr
    1114:	e3500000 	cmp	r0, #0
    1118:	13e00000 	mvnne	r0, #0
    111c:	ea000007 	b	1140 <__aeabi_idiv0>

00001120 <__aeabi_uidivmod>:
    1120:	e3510000 	cmp	r1, #0
    1124:	0afffffa 	beq	1114 <__aeabi_uidiv+0xe8>
    1128:	e92d4003 	push	{r0, r1, lr}
    112c:	ebffffbe 	bl	102c <__aeabi_uidiv>
    1130:	e8bd4006 	pop	{r1, r2, lr}
    1134:	e0030092 	mul	r3, r2, r0
    1138:	e0411003 	sub	r1, r1, r3
    113c:	e12fff1e 	bx	lr

00001140 <__aeabi_idiv0>:
    1140:	e12fff1e 	bx	lr
