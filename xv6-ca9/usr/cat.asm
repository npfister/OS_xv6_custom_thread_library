
_cat:     file format elf32-littlearm


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd010 	sub	sp, sp, #16
       c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    while((n = read(fd, buf, sizeof(buf))) > 0)
      10:	ea000004 	b	28 <cat+0x28>
        write(1, buf, n);
      14:	e3a00001 	mov	r0, #1
      18:	e30111f8 	movw	r1, #4600	; 0x11f8
      1c:	e3401000 	movt	r1, #0
      20:	e51b2008 	ldr	r2, [fp, #-8]
      24:	eb0001b4 	bl	6fc <write>
void
cat(int fd)
{
    int n;
    
    while((n = read(fd, buf, sizeof(buf))) > 0)
      28:	e51b0010 	ldr	r0, [fp, #-16]
      2c:	e30111f8 	movw	r1, #4600	; 0x11f8
      30:	e3401000 	movt	r1, #0
      34:	e3a02c02 	mov	r2, #512	; 0x200
      38:	eb0001a6 	bl	6d8 <read>
      3c:	e50b0008 	str	r0, [fp, #-8]
      40:	e51b3008 	ldr	r3, [fp, #-8]
      44:	e3530000 	cmp	r3, #0
      48:	cafffff1 	bgt	14 <cat+0x14>
        write(1, buf, n);
    if(n < 0){
      4c:	e51b3008 	ldr	r3, [fp, #-8]
      50:	e3530000 	cmp	r3, #0
      54:	aa000004 	bge	6c <cat+0x6c>
        printf(1, "cat: read error\n");
      58:	e3a00001 	mov	r0, #1
      5c:	e30111a4 	movw	r1, #4516	; 0x11a4
      60:	e3401000 	movt	r1, #0
      64:	eb000298 	bl	acc <printf>
        exit();
      68:	eb00017f 	bl	66c <exit>
    }
}
      6c:	e24bd004 	sub	sp, fp, #4
      70:	e8bd8800 	pop	{fp, pc}

00000074 <main>:

int
main(int argc, char *argv[])
{
      74:	e92d4800 	push	{fp, lr}
      78:	e28db004 	add	fp, sp, #4
      7c:	e24dd010 	sub	sp, sp, #16
      80:	e50b0010 	str	r0, [fp, #-16]
      84:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd, i;
    
    if(argc <= 1){
      88:	e51b3010 	ldr	r3, [fp, #-16]
      8c:	e3530001 	cmp	r3, #1
      90:	ca000002 	bgt	a0 <main+0x2c>
        cat(0);
      94:	e3a00000 	mov	r0, #0
      98:	ebffffd8 	bl	0 <cat>
        exit();
      9c:	eb000172 	bl	66c <exit>
    }
    
    for(i = 1; i < argc; i++){
      a0:	e3a03001 	mov	r3, #1
      a4:	e50b3008 	str	r3, [fp, #-8]
      a8:	ea00001d 	b	124 <main+0xb0>
        if((fd = open(argv[i], 0)) < 0){
      ac:	e51b3008 	ldr	r3, [fp, #-8]
      b0:	e1a03103 	lsl	r3, r3, #2
      b4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      b8:	e0823003 	add	r3, r2, r3
      bc:	e5933000 	ldr	r3, [r3]
      c0:	e1a00003 	mov	r0, r3
      c4:	e3a01000 	mov	r1, #0
      c8:	eb0001af 	bl	78c <open>
      cc:	e50b000c 	str	r0, [fp, #-12]
      d0:	e51b300c 	ldr	r3, [fp, #-12]
      d4:	e3530000 	cmp	r3, #0
      d8:	aa00000a 	bge	108 <main+0x94>
            printf(1, "cat: cannot open %s\n", argv[i]);
      dc:	e51b3008 	ldr	r3, [fp, #-8]
      e0:	e1a03103 	lsl	r3, r3, #2
      e4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
      e8:	e0823003 	add	r3, r2, r3
      ec:	e5933000 	ldr	r3, [r3]
      f0:	e3a00001 	mov	r0, #1
      f4:	e30111b8 	movw	r1, #4536	; 0x11b8
      f8:	e3401000 	movt	r1, #0
      fc:	e1a02003 	mov	r2, r3
     100:	eb000271 	bl	acc <printf>
            exit();
     104:	eb000158 	bl	66c <exit>
        }
        cat(fd);
     108:	e51b000c 	ldr	r0, [fp, #-12]
     10c:	ebffffbb 	bl	0 <cat>
        close(fd);
     110:	e51b000c 	ldr	r0, [fp, #-12]
     114:	eb000181 	bl	720 <close>
    if(argc <= 1){
        cat(0);
        exit();
    }
    
    for(i = 1; i < argc; i++){
     118:	e51b3008 	ldr	r3, [fp, #-8]
     11c:	e2833001 	add	r3, r3, #1
     120:	e50b3008 	str	r3, [fp, #-8]
     124:	e51b2008 	ldr	r2, [fp, #-8]
     128:	e51b3010 	ldr	r3, [fp, #-16]
     12c:	e1520003 	cmp	r2, r3
     130:	baffffdd 	blt	ac <main+0x38>
            exit();
        }
        cat(fd);
        close(fd);
    }
    exit();
     134:	eb00014c 	bl	66c <exit>

00000138 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
     138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     13c:	e28db000 	add	fp, sp, #0
     140:	e24dd014 	sub	sp, sp, #20
     144:	e50b0010 	str	r0, [fp, #-16]
     148:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
     14c:	e51b3010 	ldr	r3, [fp, #-16]
     150:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
     154:	e1a00000 	nop			; (mov r0, r0)
     158:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     15c:	e5d32000 	ldrb	r2, [r3]
     160:	e51b3010 	ldr	r3, [fp, #-16]
     164:	e5c32000 	strb	r2, [r3]
     168:	e51b3010 	ldr	r3, [fp, #-16]
     16c:	e5d33000 	ldrb	r3, [r3]
     170:	e3530000 	cmp	r3, #0
     174:	03a03000 	moveq	r3, #0
     178:	13a03001 	movne	r3, #1
     17c:	e6ef3073 	uxtb	r3, r3
     180:	e51b2010 	ldr	r2, [fp, #-16]
     184:	e2822001 	add	r2, r2, #1
     188:	e50b2010 	str	r2, [fp, #-16]
     18c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     190:	e2822001 	add	r2, r2, #1
     194:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
     198:	e3530000 	cmp	r3, #0
     19c:	1affffed 	bne	158 <strcpy+0x20>
        ;
    return os;
     1a0:	e51b3008 	ldr	r3, [fp, #-8]
}
     1a4:	e1a00003 	mov	r0, r3
     1a8:	e28bd000 	add	sp, fp, #0
     1ac:	e8bd0800 	pop	{fp}
     1b0:	e12fff1e 	bx	lr

000001b4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     1b8:	e28db000 	add	fp, sp, #0
     1bc:	e24dd00c 	sub	sp, sp, #12
     1c0:	e50b0008 	str	r0, [fp, #-8]
     1c4:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     1c8:	ea000005 	b	1e4 <strcmp+0x30>
        p++, q++;
     1cc:	e51b3008 	ldr	r3, [fp, #-8]
     1d0:	e2833001 	add	r3, r3, #1
     1d4:	e50b3008 	str	r3, [fp, #-8]
     1d8:	e51b300c 	ldr	r3, [fp, #-12]
     1dc:	e2833001 	add	r3, r3, #1
     1e0:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     1e4:	e51b3008 	ldr	r3, [fp, #-8]
     1e8:	e5d33000 	ldrb	r3, [r3]
     1ec:	e3530000 	cmp	r3, #0
     1f0:	0a000005 	beq	20c <strcmp+0x58>
     1f4:	e51b3008 	ldr	r3, [fp, #-8]
     1f8:	e5d32000 	ldrb	r2, [r3]
     1fc:	e51b300c 	ldr	r3, [fp, #-12]
     200:	e5d33000 	ldrb	r3, [r3]
     204:	e1520003 	cmp	r2, r3
     208:	0affffef 	beq	1cc <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     20c:	e51b3008 	ldr	r3, [fp, #-8]
     210:	e5d33000 	ldrb	r3, [r3]
     214:	e1a02003 	mov	r2, r3
     218:	e51b300c 	ldr	r3, [fp, #-12]
     21c:	e5d33000 	ldrb	r3, [r3]
     220:	e0633002 	rsb	r3, r3, r2
}
     224:	e1a00003 	mov	r0, r3
     228:	e28bd000 	add	sp, fp, #0
     22c:	e8bd0800 	pop	{fp}
     230:	e12fff1e 	bx	lr

00000234 <strlen>:

uint
strlen(char *s)
{
     234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     238:	e28db000 	add	fp, sp, #0
     23c:	e24dd014 	sub	sp, sp, #20
     240:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     244:	e3a03000 	mov	r3, #0
     248:	e50b3008 	str	r3, [fp, #-8]
     24c:	ea000002 	b	25c <strlen+0x28>
     250:	e51b3008 	ldr	r3, [fp, #-8]
     254:	e2833001 	add	r3, r3, #1
     258:	e50b3008 	str	r3, [fp, #-8]
     25c:	e51b3008 	ldr	r3, [fp, #-8]
     260:	e51b2010 	ldr	r2, [fp, #-16]
     264:	e0823003 	add	r3, r2, r3
     268:	e5d33000 	ldrb	r3, [r3]
     26c:	e3530000 	cmp	r3, #0
     270:	1afffff6 	bne	250 <strlen+0x1c>
        ;
    return n;
     274:	e51b3008 	ldr	r3, [fp, #-8]
}
     278:	e1a00003 	mov	r0, r3
     27c:	e28bd000 	add	sp, fp, #0
     280:	e8bd0800 	pop	{fp}
     284:	e12fff1e 	bx	lr

00000288 <memset>:

void*
memset(void *dst, int v, uint n)
{
     288:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     28c:	e28db000 	add	fp, sp, #0
     290:	e24dd024 	sub	sp, sp, #36	; 0x24
     294:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     298:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     29c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     2a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     2a4:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     2a8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     2ac:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     2b0:	e55b300d 	ldrb	r3, [fp, #-13]
     2b4:	e1a02c03 	lsl	r2, r3, #24
     2b8:	e55b300d 	ldrb	r3, [fp, #-13]
     2bc:	e1a03803 	lsl	r3, r3, #16
     2c0:	e1822003 	orr	r2, r2, r3
     2c4:	e55b300d 	ldrb	r3, [fp, #-13]
     2c8:	e1a03403 	lsl	r3, r3, #8
     2cc:	e1822003 	orr	r2, r2, r3
     2d0:	e55b300d 	ldrb	r3, [fp, #-13]
     2d4:	e1823003 	orr	r3, r2, r3
     2d8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     2dc:	ea000008 	b	304 <memset+0x7c>
		*p = c;
     2e0:	e51b3008 	ldr	r3, [fp, #-8]
     2e4:	e55b200d 	ldrb	r2, [fp, #-13]
     2e8:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     2ec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2f0:	e2433001 	sub	r3, r3, #1
     2f4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     2f8:	e51b3008 	ldr	r3, [fp, #-8]
     2fc:	e2833001 	add	r3, r3, #1
     300:	e50b3008 	str	r3, [fp, #-8]
     304:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     308:	e3530000 	cmp	r3, #0
     30c:	0a000003 	beq	320 <memset+0x98>
     310:	e51b3008 	ldr	r3, [fp, #-8]
     314:	e2033003 	and	r3, r3, #3
     318:	e3530000 	cmp	r3, #0
     31c:	1affffef 	bne	2e0 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     320:	e51b3008 	ldr	r3, [fp, #-8]
     324:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     328:	ea000008 	b	350 <memset+0xc8>
		*p4 = val;
     32c:	e51b300c 	ldr	r3, [fp, #-12]
     330:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     334:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     338:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     33c:	e2433004 	sub	r3, r3, #4
     340:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     344:	e51b300c 	ldr	r3, [fp, #-12]
     348:	e2833004 	add	r3, r3, #4
     34c:	e50b300c 	str	r3, [fp, #-12]
     350:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     354:	e3530003 	cmp	r3, #3
     358:	8afffff3 	bhi	32c <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     35c:	e51b300c 	ldr	r3, [fp, #-12]
     360:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     364:	ea000008 	b	38c <memset+0x104>
		*p = c;
     368:	e51b3008 	ldr	r3, [fp, #-8]
     36c:	e55b200d 	ldrb	r2, [fp, #-13]
     370:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     374:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     378:	e2433001 	sub	r3, r3, #1
     37c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     380:	e51b3008 	ldr	r3, [fp, #-8]
     384:	e2833001 	add	r3, r3, #1
     388:	e50b3008 	str	r3, [fp, #-8]
     38c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     390:	e3530000 	cmp	r3, #0
     394:	1afffff3 	bne	368 <memset+0xe0>
		*p = c;
	}

	return dst;
     398:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     39c:	e1a00003 	mov	r0, r3
     3a0:	e28bd000 	add	sp, fp, #0
     3a4:	e8bd0800 	pop	{fp}
     3a8:	e12fff1e 	bx	lr

000003ac <strchr>:

char*
strchr(const char *s, char c)
{
     3ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     3b0:	e28db000 	add	fp, sp, #0
     3b4:	e24dd00c 	sub	sp, sp, #12
     3b8:	e50b0008 	str	r0, [fp, #-8]
     3bc:	e1a03001 	mov	r3, r1
     3c0:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     3c4:	ea000009 	b	3f0 <strchr+0x44>
        if(*s == c)
     3c8:	e51b3008 	ldr	r3, [fp, #-8]
     3cc:	e5d33000 	ldrb	r3, [r3]
     3d0:	e55b2009 	ldrb	r2, [fp, #-9]
     3d4:	e1520003 	cmp	r2, r3
     3d8:	1a000001 	bne	3e4 <strchr+0x38>
            return (char*)s;
     3dc:	e51b3008 	ldr	r3, [fp, #-8]
     3e0:	ea000007 	b	404 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     3e4:	e51b3008 	ldr	r3, [fp, #-8]
     3e8:	e2833001 	add	r3, r3, #1
     3ec:	e50b3008 	str	r3, [fp, #-8]
     3f0:	e51b3008 	ldr	r3, [fp, #-8]
     3f4:	e5d33000 	ldrb	r3, [r3]
     3f8:	e3530000 	cmp	r3, #0
     3fc:	1afffff1 	bne	3c8 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     400:	e3a03000 	mov	r3, #0
}
     404:	e1a00003 	mov	r0, r3
     408:	e28bd000 	add	sp, fp, #0
     40c:	e8bd0800 	pop	{fp}
     410:	e12fff1e 	bx	lr

00000414 <gets>:

char*
gets(char *buf, int max)
{
     414:	e92d4800 	push	{fp, lr}
     418:	e28db004 	add	fp, sp, #4
     41c:	e24dd018 	sub	sp, sp, #24
     420:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     424:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     428:	e3a03000 	mov	r3, #0
     42c:	e50b3008 	str	r3, [fp, #-8]
     430:	ea000016 	b	490 <gets+0x7c>
        cc = read(0, &c, 1);
     434:	e3a00000 	mov	r0, #0
     438:	e24b300d 	sub	r3, fp, #13
     43c:	e1a01003 	mov	r1, r3
     440:	e3a02001 	mov	r2, #1
     444:	eb0000a3 	bl	6d8 <read>
     448:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     44c:	e51b300c 	ldr	r3, [fp, #-12]
     450:	e3530000 	cmp	r3, #0
     454:	da000013 	ble	4a8 <gets+0x94>
            break;
        buf[i++] = c;
     458:	e51b3008 	ldr	r3, [fp, #-8]
     45c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     460:	e0823003 	add	r3, r2, r3
     464:	e55b200d 	ldrb	r2, [fp, #-13]
     468:	e5c32000 	strb	r2, [r3]
     46c:	e51b3008 	ldr	r3, [fp, #-8]
     470:	e2833001 	add	r3, r3, #1
     474:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     478:	e55b300d 	ldrb	r3, [fp, #-13]
     47c:	e353000a 	cmp	r3, #10
     480:	0a000009 	beq	4ac <gets+0x98>
     484:	e55b300d 	ldrb	r3, [fp, #-13]
     488:	e353000d 	cmp	r3, #13
     48c:	0a000006 	beq	4ac <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     490:	e51b3008 	ldr	r3, [fp, #-8]
     494:	e2832001 	add	r2, r3, #1
     498:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     49c:	e1520003 	cmp	r2, r3
     4a0:	baffffe3 	blt	434 <gets+0x20>
     4a4:	ea000000 	b	4ac <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     4a8:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     4ac:	e51b3008 	ldr	r3, [fp, #-8]
     4b0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     4b4:	e0823003 	add	r3, r2, r3
     4b8:	e3a02000 	mov	r2, #0
     4bc:	e5c32000 	strb	r2, [r3]
    return buf;
     4c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     4c4:	e1a00003 	mov	r0, r3
     4c8:	e24bd004 	sub	sp, fp, #4
     4cc:	e8bd8800 	pop	{fp, pc}

000004d0 <stat>:

int
stat(char *n, struct stat *st)
{
     4d0:	e92d4800 	push	{fp, lr}
     4d4:	e28db004 	add	fp, sp, #4
     4d8:	e24dd010 	sub	sp, sp, #16
     4dc:	e50b0010 	str	r0, [fp, #-16]
     4e0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     4e4:	e51b0010 	ldr	r0, [fp, #-16]
     4e8:	e3a01000 	mov	r1, #0
     4ec:	eb0000a6 	bl	78c <open>
     4f0:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     4f4:	e51b3008 	ldr	r3, [fp, #-8]
     4f8:	e3530000 	cmp	r3, #0
     4fc:	aa000001 	bge	508 <stat+0x38>
        return -1;
     500:	e3e03000 	mvn	r3, #0
     504:	ea000006 	b	524 <stat+0x54>
    r = fstat(fd, st);
     508:	e51b0008 	ldr	r0, [fp, #-8]
     50c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     510:	eb0000b8 	bl	7f8 <fstat>
     514:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     518:	e51b0008 	ldr	r0, [fp, #-8]
     51c:	eb00007f 	bl	720 <close>
    return r;
     520:	e51b300c 	ldr	r3, [fp, #-12]
}
     524:	e1a00003 	mov	r0, r3
     528:	e24bd004 	sub	sp, fp, #4
     52c:	e8bd8800 	pop	{fp, pc}

00000530 <atoi>:

int
atoi(const char *s)
{
     530:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     534:	e28db000 	add	fp, sp, #0
     538:	e24dd014 	sub	sp, sp, #20
     53c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     540:	e3a03000 	mov	r3, #0
     544:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     548:	ea00000d 	b	584 <atoi+0x54>
        n = n*10 + *s++ - '0';
     54c:	e51b2008 	ldr	r2, [fp, #-8]
     550:	e1a03002 	mov	r3, r2
     554:	e1a03103 	lsl	r3, r3, #2
     558:	e0833002 	add	r3, r3, r2
     55c:	e1a03083 	lsl	r3, r3, #1
     560:	e1a02003 	mov	r2, r3
     564:	e51b3010 	ldr	r3, [fp, #-16]
     568:	e5d33000 	ldrb	r3, [r3]
     56c:	e0823003 	add	r3, r2, r3
     570:	e2433030 	sub	r3, r3, #48	; 0x30
     574:	e50b3008 	str	r3, [fp, #-8]
     578:	e51b3010 	ldr	r3, [fp, #-16]
     57c:	e2833001 	add	r3, r3, #1
     580:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     584:	e51b3010 	ldr	r3, [fp, #-16]
     588:	e5d33000 	ldrb	r3, [r3]
     58c:	e353002f 	cmp	r3, #47	; 0x2f
     590:	9a000003 	bls	5a4 <atoi+0x74>
     594:	e51b3010 	ldr	r3, [fp, #-16]
     598:	e5d33000 	ldrb	r3, [r3]
     59c:	e3530039 	cmp	r3, #57	; 0x39
     5a0:	9affffe9 	bls	54c <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     5a4:	e51b3008 	ldr	r3, [fp, #-8]
}
     5a8:	e1a00003 	mov	r0, r3
     5ac:	e28bd000 	add	sp, fp, #0
     5b0:	e8bd0800 	pop	{fp}
     5b4:	e12fff1e 	bx	lr

000005b8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     5b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     5bc:	e28db000 	add	fp, sp, #0
     5c0:	e24dd01c 	sub	sp, sp, #28
     5c4:	e50b0010 	str	r0, [fp, #-16]
     5c8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     5cc:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     5d0:	e51b3010 	ldr	r3, [fp, #-16]
     5d4:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     5d8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     5dc:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     5e0:	ea000009 	b	60c <memmove+0x54>
        *dst++ = *src++;
     5e4:	e51b300c 	ldr	r3, [fp, #-12]
     5e8:	e5d32000 	ldrb	r2, [r3]
     5ec:	e51b3008 	ldr	r3, [fp, #-8]
     5f0:	e5c32000 	strb	r2, [r3]
     5f4:	e51b3008 	ldr	r3, [fp, #-8]
     5f8:	e2833001 	add	r3, r3, #1
     5fc:	e50b3008 	str	r3, [fp, #-8]
     600:	e51b300c 	ldr	r3, [fp, #-12]
     604:	e2833001 	add	r3, r3, #1
     608:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     60c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     610:	e3530000 	cmp	r3, #0
     614:	d3a03000 	movle	r3, #0
     618:	c3a03001 	movgt	r3, #1
     61c:	e6ef3073 	uxtb	r3, r3
     620:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     624:	e2422001 	sub	r2, r2, #1
     628:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     62c:	e3530000 	cmp	r3, #0
     630:	1affffeb 	bne	5e4 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     634:	e51b3010 	ldr	r3, [fp, #-16]
}
     638:	e1a00003 	mov	r0, r3
     63c:	e28bd000 	add	sp, fp, #0
     640:	e8bd0800 	pop	{fp}
     644:	e12fff1e 	bx	lr

00000648 <fork>:
     648:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     64c:	e1a04003 	mov	r4, r3
     650:	e1a03002 	mov	r3, r2
     654:	e1a02001 	mov	r2, r1
     658:	e1a01000 	mov	r1, r0
     65c:	e3a00001 	mov	r0, #1
     660:	ef000000 	svc	0x00000000
     664:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     668:	e12fff1e 	bx	lr

0000066c <exit>:
     66c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     670:	e1a04003 	mov	r4, r3
     674:	e1a03002 	mov	r3, r2
     678:	e1a02001 	mov	r2, r1
     67c:	e1a01000 	mov	r1, r0
     680:	e3a00002 	mov	r0, #2
     684:	ef000000 	svc	0x00000000
     688:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     68c:	e12fff1e 	bx	lr

00000690 <wait>:
     690:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     694:	e1a04003 	mov	r4, r3
     698:	e1a03002 	mov	r3, r2
     69c:	e1a02001 	mov	r2, r1
     6a0:	e1a01000 	mov	r1, r0
     6a4:	e3a00003 	mov	r0, #3
     6a8:	ef000000 	svc	0x00000000
     6ac:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6b0:	e12fff1e 	bx	lr

000006b4 <pipe>:
     6b4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6b8:	e1a04003 	mov	r4, r3
     6bc:	e1a03002 	mov	r3, r2
     6c0:	e1a02001 	mov	r2, r1
     6c4:	e1a01000 	mov	r1, r0
     6c8:	e3a00004 	mov	r0, #4
     6cc:	ef000000 	svc	0x00000000
     6d0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6d4:	e12fff1e 	bx	lr

000006d8 <read>:
     6d8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6dc:	e1a04003 	mov	r4, r3
     6e0:	e1a03002 	mov	r3, r2
     6e4:	e1a02001 	mov	r2, r1
     6e8:	e1a01000 	mov	r1, r0
     6ec:	e3a00005 	mov	r0, #5
     6f0:	ef000000 	svc	0x00000000
     6f4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6f8:	e12fff1e 	bx	lr

000006fc <write>:
     6fc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     700:	e1a04003 	mov	r4, r3
     704:	e1a03002 	mov	r3, r2
     708:	e1a02001 	mov	r2, r1
     70c:	e1a01000 	mov	r1, r0
     710:	e3a00010 	mov	r0, #16
     714:	ef000000 	svc	0x00000000
     718:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     71c:	e12fff1e 	bx	lr

00000720 <close>:
     720:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     724:	e1a04003 	mov	r4, r3
     728:	e1a03002 	mov	r3, r2
     72c:	e1a02001 	mov	r2, r1
     730:	e1a01000 	mov	r1, r0
     734:	e3a00015 	mov	r0, #21
     738:	ef000000 	svc	0x00000000
     73c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     740:	e12fff1e 	bx	lr

00000744 <kill>:
     744:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     748:	e1a04003 	mov	r4, r3
     74c:	e1a03002 	mov	r3, r2
     750:	e1a02001 	mov	r2, r1
     754:	e1a01000 	mov	r1, r0
     758:	e3a00006 	mov	r0, #6
     75c:	ef000000 	svc	0x00000000
     760:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     764:	e12fff1e 	bx	lr

00000768 <exec>:
     768:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     76c:	e1a04003 	mov	r4, r3
     770:	e1a03002 	mov	r3, r2
     774:	e1a02001 	mov	r2, r1
     778:	e1a01000 	mov	r1, r0
     77c:	e3a00007 	mov	r0, #7
     780:	ef000000 	svc	0x00000000
     784:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     788:	e12fff1e 	bx	lr

0000078c <open>:
     78c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     790:	e1a04003 	mov	r4, r3
     794:	e1a03002 	mov	r3, r2
     798:	e1a02001 	mov	r2, r1
     79c:	e1a01000 	mov	r1, r0
     7a0:	e3a0000f 	mov	r0, #15
     7a4:	ef000000 	svc	0x00000000
     7a8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7ac:	e12fff1e 	bx	lr

000007b0 <mknod>:
     7b0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7b4:	e1a04003 	mov	r4, r3
     7b8:	e1a03002 	mov	r3, r2
     7bc:	e1a02001 	mov	r2, r1
     7c0:	e1a01000 	mov	r1, r0
     7c4:	e3a00011 	mov	r0, #17
     7c8:	ef000000 	svc	0x00000000
     7cc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7d0:	e12fff1e 	bx	lr

000007d4 <unlink>:
     7d4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7d8:	e1a04003 	mov	r4, r3
     7dc:	e1a03002 	mov	r3, r2
     7e0:	e1a02001 	mov	r2, r1
     7e4:	e1a01000 	mov	r1, r0
     7e8:	e3a00012 	mov	r0, #18
     7ec:	ef000000 	svc	0x00000000
     7f0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7f4:	e12fff1e 	bx	lr

000007f8 <fstat>:
     7f8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7fc:	e1a04003 	mov	r4, r3
     800:	e1a03002 	mov	r3, r2
     804:	e1a02001 	mov	r2, r1
     808:	e1a01000 	mov	r1, r0
     80c:	e3a00008 	mov	r0, #8
     810:	ef000000 	svc	0x00000000
     814:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     818:	e12fff1e 	bx	lr

0000081c <link>:
     81c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     820:	e1a04003 	mov	r4, r3
     824:	e1a03002 	mov	r3, r2
     828:	e1a02001 	mov	r2, r1
     82c:	e1a01000 	mov	r1, r0
     830:	e3a00013 	mov	r0, #19
     834:	ef000000 	svc	0x00000000
     838:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     83c:	e12fff1e 	bx	lr

00000840 <mkdir>:
     840:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     844:	e1a04003 	mov	r4, r3
     848:	e1a03002 	mov	r3, r2
     84c:	e1a02001 	mov	r2, r1
     850:	e1a01000 	mov	r1, r0
     854:	e3a00014 	mov	r0, #20
     858:	ef000000 	svc	0x00000000
     85c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     860:	e12fff1e 	bx	lr

00000864 <chdir>:
     864:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     868:	e1a04003 	mov	r4, r3
     86c:	e1a03002 	mov	r3, r2
     870:	e1a02001 	mov	r2, r1
     874:	e1a01000 	mov	r1, r0
     878:	e3a00009 	mov	r0, #9
     87c:	ef000000 	svc	0x00000000
     880:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     884:	e12fff1e 	bx	lr

00000888 <dup>:
     888:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     88c:	e1a04003 	mov	r4, r3
     890:	e1a03002 	mov	r3, r2
     894:	e1a02001 	mov	r2, r1
     898:	e1a01000 	mov	r1, r0
     89c:	e3a0000a 	mov	r0, #10
     8a0:	ef000000 	svc	0x00000000
     8a4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8a8:	e12fff1e 	bx	lr

000008ac <getpid>:
     8ac:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8b0:	e1a04003 	mov	r4, r3
     8b4:	e1a03002 	mov	r3, r2
     8b8:	e1a02001 	mov	r2, r1
     8bc:	e1a01000 	mov	r1, r0
     8c0:	e3a0000b 	mov	r0, #11
     8c4:	ef000000 	svc	0x00000000
     8c8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8cc:	e12fff1e 	bx	lr

000008d0 <sbrk>:
     8d0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8d4:	e1a04003 	mov	r4, r3
     8d8:	e1a03002 	mov	r3, r2
     8dc:	e1a02001 	mov	r2, r1
     8e0:	e1a01000 	mov	r1, r0
     8e4:	e3a0000c 	mov	r0, #12
     8e8:	ef000000 	svc	0x00000000
     8ec:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8f0:	e12fff1e 	bx	lr

000008f4 <sleep>:
     8f4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8f8:	e1a04003 	mov	r4, r3
     8fc:	e1a03002 	mov	r3, r2
     900:	e1a02001 	mov	r2, r1
     904:	e1a01000 	mov	r1, r0
     908:	e3a0000d 	mov	r0, #13
     90c:	ef000000 	svc	0x00000000
     910:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     914:	e12fff1e 	bx	lr

00000918 <uptime>:
     918:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     91c:	e1a04003 	mov	r4, r3
     920:	e1a03002 	mov	r3, r2
     924:	e1a02001 	mov	r2, r1
     928:	e1a01000 	mov	r1, r0
     92c:	e3a0000e 	mov	r0, #14
     930:	ef000000 	svc	0x00000000
     934:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     938:	e12fff1e 	bx	lr

0000093c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     93c:	e92d4800 	push	{fp, lr}
     940:	e28db004 	add	fp, sp, #4
     944:	e24dd008 	sub	sp, sp, #8
     948:	e50b0008 	str	r0, [fp, #-8]
     94c:	e1a03001 	mov	r3, r1
     950:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     954:	e51b0008 	ldr	r0, [fp, #-8]
     958:	e24b3009 	sub	r3, fp, #9
     95c:	e1a01003 	mov	r1, r3
     960:	e3a02001 	mov	r2, #1
     964:	ebffff64 	bl	6fc <write>
}
     968:	e24bd004 	sub	sp, fp, #4
     96c:	e8bd8800 	pop	{fp, pc}

00000970 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     970:	e92d4800 	push	{fp, lr}
     974:	e28db004 	add	fp, sp, #4
     978:	e24dd030 	sub	sp, sp, #48	; 0x30
     97c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     980:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     984:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     988:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     98c:	e3a03000 	mov	r3, #0
     990:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     994:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     998:	e3530000 	cmp	r3, #0
     99c:	0a000008 	beq	9c4 <printint+0x54>
     9a0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     9a4:	e3530000 	cmp	r3, #0
     9a8:	aa000005 	bge	9c4 <printint+0x54>
        neg = 1;
     9ac:	e3a03001 	mov	r3, #1
     9b0:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     9b4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     9b8:	e2633000 	rsb	r3, r3, #0
     9bc:	e50b3010 	str	r3, [fp, #-16]
     9c0:	ea000001 	b	9cc <printint+0x5c>
    } else {
        x = xx;
     9c4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     9c8:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     9cc:	e3a03000 	mov	r3, #0
     9d0:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     9d4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     9d8:	e51b2010 	ldr	r2, [fp, #-16]
     9dc:	e1a00002 	mov	r0, r2
     9e0:	e1a01003 	mov	r1, r3
     9e4:	eb0001e5 	bl	1180 <__aeabi_uidivmod>
     9e8:	e1a03001 	mov	r3, r1
     9ec:	e1a02003 	mov	r2, r3
     9f0:	e30131d8 	movw	r3, #4568	; 0x11d8
     9f4:	e3403000 	movt	r3, #0
     9f8:	e7d32002 	ldrb	r2, [r3, r2]
     9fc:	e3e0001b 	mvn	r0, #27
     a00:	e51b3008 	ldr	r3, [fp, #-8]
     a04:	e24bc004 	sub	ip, fp, #4
     a08:	e08c1003 	add	r1, ip, r3
     a0c:	e1a03000 	mov	r3, r0
     a10:	e0813003 	add	r3, r1, r3
     a14:	e5c32000 	strb	r2, [r3]
     a18:	e51b3008 	ldr	r3, [fp, #-8]
     a1c:	e2833001 	add	r3, r3, #1
     a20:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     a24:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     a28:	e51b0010 	ldr	r0, [fp, #-16]
     a2c:	e1a01003 	mov	r1, r3
     a30:	eb000195 	bl	108c <__aeabi_uidiv>
     a34:	e1a03000 	mov	r3, r0
     a38:	e50b3010 	str	r3, [fp, #-16]
     a3c:	e51b3010 	ldr	r3, [fp, #-16]
     a40:	e3530000 	cmp	r3, #0
     a44:	1affffe2 	bne	9d4 <printint+0x64>
    if(neg)
     a48:	e51b300c 	ldr	r3, [fp, #-12]
     a4c:	e3530000 	cmp	r3, #0
     a50:	0a000015 	beq	aac <printint+0x13c>
        buf[i++] = '-';
     a54:	e3e0101b 	mvn	r1, #27
     a58:	e51b3008 	ldr	r3, [fp, #-8]
     a5c:	e24b0004 	sub	r0, fp, #4
     a60:	e0802003 	add	r2, r0, r3
     a64:	e1a03001 	mov	r3, r1
     a68:	e0823003 	add	r3, r2, r3
     a6c:	e3a0202d 	mov	r2, #45	; 0x2d
     a70:	e5c32000 	strb	r2, [r3]
     a74:	e51b3008 	ldr	r3, [fp, #-8]
     a78:	e2833001 	add	r3, r3, #1
     a7c:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     a80:	ea000009 	b	aac <printint+0x13c>
        putc(fd, buf[i]);
     a84:	e3e0101b 	mvn	r1, #27
     a88:	e51b3008 	ldr	r3, [fp, #-8]
     a8c:	e24bc004 	sub	ip, fp, #4
     a90:	e08c2003 	add	r2, ip, r3
     a94:	e1a03001 	mov	r3, r1
     a98:	e0823003 	add	r3, r2, r3
     a9c:	e5d33000 	ldrb	r3, [r3]
     aa0:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     aa4:	e1a01003 	mov	r1, r3
     aa8:	ebffffa3 	bl	93c <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     aac:	e51b3008 	ldr	r3, [fp, #-8]
     ab0:	e2433001 	sub	r3, r3, #1
     ab4:	e50b3008 	str	r3, [fp, #-8]
     ab8:	e51b3008 	ldr	r3, [fp, #-8]
     abc:	e3530000 	cmp	r3, #0
     ac0:	aaffffef 	bge	a84 <printint+0x114>
        putc(fd, buf[i]);
}
     ac4:	e24bd004 	sub	sp, fp, #4
     ac8:	e8bd8800 	pop	{fp, pc}

00000acc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     acc:	e92d000e 	push	{r1, r2, r3}
     ad0:	e92d4800 	push	{fp, lr}
     ad4:	e28db004 	add	fp, sp, #4
     ad8:	e24dd024 	sub	sp, sp, #36	; 0x24
     adc:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     ae0:	e3a03000 	mov	r3, #0
     ae4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     ae8:	e28b3008 	add	r3, fp, #8
     aec:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     af0:	e3a03000 	mov	r3, #0
     af4:	e50b3010 	str	r3, [fp, #-16]
     af8:	ea000077 	b	cdc <printf+0x210>
        c = fmt[i] & 0xff;
     afc:	e59b2004 	ldr	r2, [fp, #4]
     b00:	e51b3010 	ldr	r3, [fp, #-16]
     b04:	e0823003 	add	r3, r2, r3
     b08:	e5d33000 	ldrb	r3, [r3]
     b0c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     b10:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b14:	e3530000 	cmp	r3, #0
     b18:	1a00000b 	bne	b4c <printf+0x80>
            if(c == '%'){
     b1c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b20:	e3530025 	cmp	r3, #37	; 0x25
     b24:	1a000002 	bne	b34 <printf+0x68>
                state = '%';
     b28:	e3a03025 	mov	r3, #37	; 0x25
     b2c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     b30:	ea000066 	b	cd0 <printf+0x204>
            } else {
                putc(fd, c);
     b34:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b38:	e6ef3073 	uxtb	r3, r3
     b3c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b40:	e1a01003 	mov	r1, r3
     b44:	ebffff7c 	bl	93c <putc>
     b48:	ea000060 	b	cd0 <printf+0x204>
            }
        } else if(state == '%'){
     b4c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b50:	e3530025 	cmp	r3, #37	; 0x25
     b54:	1a00005d 	bne	cd0 <printf+0x204>
            if(c == 'd'){
     b58:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b5c:	e3530064 	cmp	r3, #100	; 0x64
     b60:	1a00000a 	bne	b90 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     b64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b68:	e5933000 	ldr	r3, [r3]
     b6c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b70:	e1a01003 	mov	r1, r3
     b74:	e3a0200a 	mov	r2, #10
     b78:	e3a03001 	mov	r3, #1
     b7c:	ebffff7b 	bl	970 <printint>
                ap++;
     b80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b84:	e2833004 	add	r3, r3, #4
     b88:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b8c:	ea00004d 	b	cc8 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     b90:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b94:	e3530078 	cmp	r3, #120	; 0x78
     b98:	0a000002 	beq	ba8 <printf+0xdc>
     b9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ba0:	e3530070 	cmp	r3, #112	; 0x70
     ba4:	1a00000a 	bne	bd4 <printf+0x108>
                printint(fd, *ap, 16, 0);
     ba8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bac:	e5933000 	ldr	r3, [r3]
     bb0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bb4:	e1a01003 	mov	r1, r3
     bb8:	e3a02010 	mov	r2, #16
     bbc:	e3a03000 	mov	r3, #0
     bc0:	ebffff6a 	bl	970 <printint>
                ap++;
     bc4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bc8:	e2833004 	add	r3, r3, #4
     bcc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bd0:	ea00003c 	b	cc8 <printf+0x1fc>
            } else if(c == 's'){
     bd4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bd8:	e3530073 	cmp	r3, #115	; 0x73
     bdc:	1a00001b 	bne	c50 <printf+0x184>
                s = (char*)*ap;
     be0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     be4:	e5933000 	ldr	r3, [r3]
     be8:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     bec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bf0:	e2833004 	add	r3, r3, #4
     bf4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     bf8:	e51b300c 	ldr	r3, [fp, #-12]
     bfc:	e3530000 	cmp	r3, #0
     c00:	1a00000c 	bne	c38 <printf+0x16c>
                    s = "(null)";
     c04:	e30131d0 	movw	r3, #4560	; 0x11d0
     c08:	e3403000 	movt	r3, #0
     c0c:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     c10:	ea000008 	b	c38 <printf+0x16c>
                    putc(fd, *s);
     c14:	e51b300c 	ldr	r3, [fp, #-12]
     c18:	e5d33000 	ldrb	r3, [r3]
     c1c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c20:	e1a01003 	mov	r1, r3
     c24:	ebffff44 	bl	93c <putc>
                    s++;
     c28:	e51b300c 	ldr	r3, [fp, #-12]
     c2c:	e2833001 	add	r3, r3, #1
     c30:	e50b300c 	str	r3, [fp, #-12]
     c34:	ea000000 	b	c3c <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     c38:	e1a00000 	nop			; (mov r0, r0)
     c3c:	e51b300c 	ldr	r3, [fp, #-12]
     c40:	e5d33000 	ldrb	r3, [r3]
     c44:	e3530000 	cmp	r3, #0
     c48:	1afffff1 	bne	c14 <printf+0x148>
     c4c:	ea00001d 	b	cc8 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     c50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c54:	e3530063 	cmp	r3, #99	; 0x63
     c58:	1a000009 	bne	c84 <printf+0x1b8>
                putc(fd, *ap);
     c5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c60:	e5933000 	ldr	r3, [r3]
     c64:	e6ef3073 	uxtb	r3, r3
     c68:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c6c:	e1a01003 	mov	r1, r3
     c70:	ebffff31 	bl	93c <putc>
                ap++;
     c74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c78:	e2833004 	add	r3, r3, #4
     c7c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     c80:	ea000010 	b	cc8 <printf+0x1fc>
            } else if(c == '%'){
     c84:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c88:	e3530025 	cmp	r3, #37	; 0x25
     c8c:	1a000005 	bne	ca8 <printf+0x1dc>
                putc(fd, c);
     c90:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c94:	e6ef3073 	uxtb	r3, r3
     c98:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c9c:	e1a01003 	mov	r1, r3
     ca0:	ebffff25 	bl	93c <putc>
     ca4:	ea000007 	b	cc8 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     ca8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cac:	e3a01025 	mov	r1, #37	; 0x25
     cb0:	ebffff21 	bl	93c <putc>
                putc(fd, c);
     cb4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cb8:	e6ef3073 	uxtb	r3, r3
     cbc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cc0:	e1a01003 	mov	r1, r3
     cc4:	ebffff1c 	bl	93c <putc>
            }
            state = 0;
     cc8:	e3a03000 	mov	r3, #0
     ccc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     cd0:	e51b3010 	ldr	r3, [fp, #-16]
     cd4:	e2833001 	add	r3, r3, #1
     cd8:	e50b3010 	str	r3, [fp, #-16]
     cdc:	e59b2004 	ldr	r2, [fp, #4]
     ce0:	e51b3010 	ldr	r3, [fp, #-16]
     ce4:	e0823003 	add	r3, r2, r3
     ce8:	e5d33000 	ldrb	r3, [r3]
     cec:	e3530000 	cmp	r3, #0
     cf0:	1affff81 	bne	afc <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     cf4:	e24bd004 	sub	sp, fp, #4
     cf8:	e8bd4800 	pop	{fp, lr}
     cfc:	e28dd00c 	add	sp, sp, #12
     d00:	e12fff1e 	bx	lr

00000d04 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d04:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     d08:	e28db000 	add	fp, sp, #0
     d0c:	e24dd014 	sub	sp, sp, #20
     d10:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     d14:	e51b3010 	ldr	r3, [fp, #-16]
     d18:	e2433008 	sub	r3, r3, #8
     d1c:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d20:	e30131f4 	movw	r3, #4596	; 0x11f4
     d24:	e3403000 	movt	r3, #0
     d28:	e5933000 	ldr	r3, [r3]
     d2c:	e50b3008 	str	r3, [fp, #-8]
     d30:	ea000010 	b	d78 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d34:	e51b3008 	ldr	r3, [fp, #-8]
     d38:	e5932000 	ldr	r2, [r3]
     d3c:	e51b3008 	ldr	r3, [fp, #-8]
     d40:	e1520003 	cmp	r2, r3
     d44:	8a000008 	bhi	d6c <free+0x68>
     d48:	e51b200c 	ldr	r2, [fp, #-12]
     d4c:	e51b3008 	ldr	r3, [fp, #-8]
     d50:	e1520003 	cmp	r2, r3
     d54:	8a000010 	bhi	d9c <free+0x98>
     d58:	e51b3008 	ldr	r3, [fp, #-8]
     d5c:	e5932000 	ldr	r2, [r3]
     d60:	e51b300c 	ldr	r3, [fp, #-12]
     d64:	e1520003 	cmp	r2, r3
     d68:	8a00000b 	bhi	d9c <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d6c:	e51b3008 	ldr	r3, [fp, #-8]
     d70:	e5933000 	ldr	r3, [r3]
     d74:	e50b3008 	str	r3, [fp, #-8]
     d78:	e51b200c 	ldr	r2, [fp, #-12]
     d7c:	e51b3008 	ldr	r3, [fp, #-8]
     d80:	e1520003 	cmp	r2, r3
     d84:	9affffea 	bls	d34 <free+0x30>
     d88:	e51b3008 	ldr	r3, [fp, #-8]
     d8c:	e5932000 	ldr	r2, [r3]
     d90:	e51b300c 	ldr	r3, [fp, #-12]
     d94:	e1520003 	cmp	r2, r3
     d98:	9affffe5 	bls	d34 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     d9c:	e51b300c 	ldr	r3, [fp, #-12]
     da0:	e5933004 	ldr	r3, [r3, #4]
     da4:	e1a03183 	lsl	r3, r3, #3
     da8:	e51b200c 	ldr	r2, [fp, #-12]
     dac:	e0822003 	add	r2, r2, r3
     db0:	e51b3008 	ldr	r3, [fp, #-8]
     db4:	e5933000 	ldr	r3, [r3]
     db8:	e1520003 	cmp	r2, r3
     dbc:	1a00000d 	bne	df8 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     dc0:	e51b300c 	ldr	r3, [fp, #-12]
     dc4:	e5932004 	ldr	r2, [r3, #4]
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e5933000 	ldr	r3, [r3]
     dd0:	e5933004 	ldr	r3, [r3, #4]
     dd4:	e0822003 	add	r2, r2, r3
     dd8:	e51b300c 	ldr	r3, [fp, #-12]
     ddc:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     de0:	e51b3008 	ldr	r3, [fp, #-8]
     de4:	e5933000 	ldr	r3, [r3]
     de8:	e5932000 	ldr	r2, [r3]
     dec:	e51b300c 	ldr	r3, [fp, #-12]
     df0:	e5832000 	str	r2, [r3]
     df4:	ea000003 	b	e08 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     df8:	e51b3008 	ldr	r3, [fp, #-8]
     dfc:	e5932000 	ldr	r2, [r3]
     e00:	e51b300c 	ldr	r3, [fp, #-12]
     e04:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     e08:	e51b3008 	ldr	r3, [fp, #-8]
     e0c:	e5933004 	ldr	r3, [r3, #4]
     e10:	e1a03183 	lsl	r3, r3, #3
     e14:	e51b2008 	ldr	r2, [fp, #-8]
     e18:	e0822003 	add	r2, r2, r3
     e1c:	e51b300c 	ldr	r3, [fp, #-12]
     e20:	e1520003 	cmp	r2, r3
     e24:	1a00000b 	bne	e58 <free+0x154>
        p->s.size += bp->s.size;
     e28:	e51b3008 	ldr	r3, [fp, #-8]
     e2c:	e5932004 	ldr	r2, [r3, #4]
     e30:	e51b300c 	ldr	r3, [fp, #-12]
     e34:	e5933004 	ldr	r3, [r3, #4]
     e38:	e0822003 	add	r2, r2, r3
     e3c:	e51b3008 	ldr	r3, [fp, #-8]
     e40:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     e44:	e51b300c 	ldr	r3, [fp, #-12]
     e48:	e5932000 	ldr	r2, [r3]
     e4c:	e51b3008 	ldr	r3, [fp, #-8]
     e50:	e5832000 	str	r2, [r3]
     e54:	ea000002 	b	e64 <free+0x160>
    } else
        p->s.ptr = bp;
     e58:	e51b3008 	ldr	r3, [fp, #-8]
     e5c:	e51b200c 	ldr	r2, [fp, #-12]
     e60:	e5832000 	str	r2, [r3]
    freep = p;
     e64:	e30131f4 	movw	r3, #4596	; 0x11f4
     e68:	e3403000 	movt	r3, #0
     e6c:	e51b2008 	ldr	r2, [fp, #-8]
     e70:	e5832000 	str	r2, [r3]
}
     e74:	e28bd000 	add	sp, fp, #0
     e78:	e8bd0800 	pop	{fp}
     e7c:	e12fff1e 	bx	lr

00000e80 <morecore>:

static Header*
morecore(uint nu)
{
     e80:	e92d4800 	push	{fp, lr}
     e84:	e28db004 	add	fp, sp, #4
     e88:	e24dd010 	sub	sp, sp, #16
     e8c:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     e90:	e51b2010 	ldr	r2, [fp, #-16]
     e94:	e3003fff 	movw	r3, #4095	; 0xfff
     e98:	e1520003 	cmp	r2, r3
     e9c:	8a000001 	bhi	ea8 <morecore+0x28>
        nu = 4096;
     ea0:	e3a03a01 	mov	r3, #4096	; 0x1000
     ea4:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     ea8:	e51b3010 	ldr	r3, [fp, #-16]
     eac:	e1a03183 	lsl	r3, r3, #3
     eb0:	e1a00003 	mov	r0, r3
     eb4:	ebfffe85 	bl	8d0 <sbrk>
     eb8:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     ebc:	e51b3008 	ldr	r3, [fp, #-8]
     ec0:	e3730001 	cmn	r3, #1
     ec4:	1a000001 	bne	ed0 <morecore+0x50>
        return 0;
     ec8:	e3a03000 	mov	r3, #0
     ecc:	ea00000b 	b	f00 <morecore+0x80>
    hp = (Header*)p;
     ed0:	e51b3008 	ldr	r3, [fp, #-8]
     ed4:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     ed8:	e51b300c 	ldr	r3, [fp, #-12]
     edc:	e51b2010 	ldr	r2, [fp, #-16]
     ee0:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     ee4:	e51b300c 	ldr	r3, [fp, #-12]
     ee8:	e2833008 	add	r3, r3, #8
     eec:	e1a00003 	mov	r0, r3
     ef0:	ebffff83 	bl	d04 <free>
    return freep;
     ef4:	e30131f4 	movw	r3, #4596	; 0x11f4
     ef8:	e3403000 	movt	r3, #0
     efc:	e5933000 	ldr	r3, [r3]
}
     f00:	e1a00003 	mov	r0, r3
     f04:	e24bd004 	sub	sp, fp, #4
     f08:	e8bd8800 	pop	{fp, pc}

00000f0c <malloc>:

void*
malloc(uint nbytes)
{
     f0c:	e92d4800 	push	{fp, lr}
     f10:	e28db004 	add	fp, sp, #4
     f14:	e24dd018 	sub	sp, sp, #24
     f18:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f20:	e2833007 	add	r3, r3, #7
     f24:	e1a031a3 	lsr	r3, r3, #3
     f28:	e2833001 	add	r3, r3, #1
     f2c:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     f30:	e30131f4 	movw	r3, #4596	; 0x11f4
     f34:	e3403000 	movt	r3, #0
     f38:	e5933000 	ldr	r3, [r3]
     f3c:	e50b300c 	str	r3, [fp, #-12]
     f40:	e51b300c 	ldr	r3, [fp, #-12]
     f44:	e3530000 	cmp	r3, #0
     f48:	1a000010 	bne	f90 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     f4c:	e30131ec 	movw	r3, #4588	; 0x11ec
     f50:	e3403000 	movt	r3, #0
     f54:	e50b300c 	str	r3, [fp, #-12]
     f58:	e30131f4 	movw	r3, #4596	; 0x11f4
     f5c:	e3403000 	movt	r3, #0
     f60:	e51b200c 	ldr	r2, [fp, #-12]
     f64:	e5832000 	str	r2, [r3]
     f68:	e30131f4 	movw	r3, #4596	; 0x11f4
     f6c:	e3403000 	movt	r3, #0
     f70:	e5932000 	ldr	r2, [r3]
     f74:	e30131ec 	movw	r3, #4588	; 0x11ec
     f78:	e3403000 	movt	r3, #0
     f7c:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     f80:	e30131ec 	movw	r3, #4588	; 0x11ec
     f84:	e3403000 	movt	r3, #0
     f88:	e3a02000 	mov	r2, #0
     f8c:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f90:	e51b300c 	ldr	r3, [fp, #-12]
     f94:	e5933000 	ldr	r3, [r3]
     f98:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     f9c:	e51b3008 	ldr	r3, [fp, #-8]
     fa0:	e5932004 	ldr	r2, [r3, #4]
     fa4:	e51b3010 	ldr	r3, [fp, #-16]
     fa8:	e1520003 	cmp	r2, r3
     fac:	3a00001f 	bcc	1030 <malloc+0x124>
            if(p->s.size == nunits)
     fb0:	e51b3008 	ldr	r3, [fp, #-8]
     fb4:	e5932004 	ldr	r2, [r3, #4]
     fb8:	e51b3010 	ldr	r3, [fp, #-16]
     fbc:	e1520003 	cmp	r2, r3
     fc0:	1a000004 	bne	fd8 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     fc4:	e51b3008 	ldr	r3, [fp, #-8]
     fc8:	e5932000 	ldr	r2, [r3]
     fcc:	e51b300c 	ldr	r3, [fp, #-12]
     fd0:	e5832000 	str	r2, [r3]
     fd4:	ea00000e 	b	1014 <malloc+0x108>
            else {
                p->s.size -= nunits;
     fd8:	e51b3008 	ldr	r3, [fp, #-8]
     fdc:	e5932004 	ldr	r2, [r3, #4]
     fe0:	e51b3010 	ldr	r3, [fp, #-16]
     fe4:	e0632002 	rsb	r2, r3, r2
     fe8:	e51b3008 	ldr	r3, [fp, #-8]
     fec:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     ff0:	e51b3008 	ldr	r3, [fp, #-8]
     ff4:	e5933004 	ldr	r3, [r3, #4]
     ff8:	e1a03183 	lsl	r3, r3, #3
     ffc:	e51b2008 	ldr	r2, [fp, #-8]
    1000:	e0823003 	add	r3, r2, r3
    1004:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    1008:	e51b3008 	ldr	r3, [fp, #-8]
    100c:	e51b2010 	ldr	r2, [fp, #-16]
    1010:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1014:	e30131f4 	movw	r3, #4596	; 0x11f4
    1018:	e3403000 	movt	r3, #0
    101c:	e51b200c 	ldr	r2, [fp, #-12]
    1020:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    1024:	e51b3008 	ldr	r3, [fp, #-8]
    1028:	e2833008 	add	r3, r3, #8
    102c:	ea000013 	b	1080 <malloc+0x174>
        }
        if(p == freep)
    1030:	e30131f4 	movw	r3, #4596	; 0x11f4
    1034:	e3403000 	movt	r3, #0
    1038:	e5933000 	ldr	r3, [r3]
    103c:	e51b2008 	ldr	r2, [fp, #-8]
    1040:	e1520003 	cmp	r2, r3
    1044:	1a000007 	bne	1068 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    1048:	e51b0010 	ldr	r0, [fp, #-16]
    104c:	ebffff8b 	bl	e80 <morecore>
    1050:	e50b0008 	str	r0, [fp, #-8]
    1054:	e51b3008 	ldr	r3, [fp, #-8]
    1058:	e3530000 	cmp	r3, #0
    105c:	1a000001 	bne	1068 <malloc+0x15c>
                return 0;
    1060:	e3a03000 	mov	r3, #0
    1064:	ea000005 	b	1080 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1068:	e51b3008 	ldr	r3, [fp, #-8]
    106c:	e50b300c 	str	r3, [fp, #-12]
    1070:	e51b3008 	ldr	r3, [fp, #-8]
    1074:	e5933000 	ldr	r3, [r3]
    1078:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    107c:	eaffffc6 	b	f9c <malloc+0x90>
}
    1080:	e1a00003 	mov	r0, r3
    1084:	e24bd004 	sub	sp, fp, #4
    1088:	e8bd8800 	pop	{fp, pc}

0000108c <__aeabi_uidiv>:
    108c:	e2512001 	subs	r2, r1, #1
    1090:	012fff1e 	bxeq	lr
    1094:	3a000036 	bcc	1174 <__aeabi_uidiv+0xe8>
    1098:	e1500001 	cmp	r0, r1
    109c:	9a000022 	bls	112c <__aeabi_uidiv+0xa0>
    10a0:	e1110002 	tst	r1, r2
    10a4:	0a000023 	beq	1138 <__aeabi_uidiv+0xac>
    10a8:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    10ac:	01a01181 	lsleq	r1, r1, #3
    10b0:	03a03008 	moveq	r3, #8
    10b4:	13a03001 	movne	r3, #1
    10b8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    10bc:	31510000 	cmpcc	r1, r0
    10c0:	31a01201 	lslcc	r1, r1, #4
    10c4:	31a03203 	lslcc	r3, r3, #4
    10c8:	3afffffa 	bcc	10b8 <__aeabi_uidiv+0x2c>
    10cc:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    10d0:	31510000 	cmpcc	r1, r0
    10d4:	31a01081 	lslcc	r1, r1, #1
    10d8:	31a03083 	lslcc	r3, r3, #1
    10dc:	3afffffa 	bcc	10cc <__aeabi_uidiv+0x40>
    10e0:	e3a02000 	mov	r2, #0
    10e4:	e1500001 	cmp	r0, r1
    10e8:	20400001 	subcs	r0, r0, r1
    10ec:	21822003 	orrcs	r2, r2, r3
    10f0:	e15000a1 	cmp	r0, r1, lsr #1
    10f4:	204000a1 	subcs	r0, r0, r1, lsr #1
    10f8:	218220a3 	orrcs	r2, r2, r3, lsr #1
    10fc:	e1500121 	cmp	r0, r1, lsr #2
    1100:	20400121 	subcs	r0, r0, r1, lsr #2
    1104:	21822123 	orrcs	r2, r2, r3, lsr #2
    1108:	e15001a1 	cmp	r0, r1, lsr #3
    110c:	204001a1 	subcs	r0, r0, r1, lsr #3
    1110:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1114:	e3500000 	cmp	r0, #0
    1118:	11b03223 	lsrsne	r3, r3, #4
    111c:	11a01221 	lsrne	r1, r1, #4
    1120:	1affffef 	bne	10e4 <__aeabi_uidiv+0x58>
    1124:	e1a00002 	mov	r0, r2
    1128:	e12fff1e 	bx	lr
    112c:	03a00001 	moveq	r0, #1
    1130:	13a00000 	movne	r0, #0
    1134:	e12fff1e 	bx	lr
    1138:	e3510801 	cmp	r1, #65536	; 0x10000
    113c:	21a01821 	lsrcs	r1, r1, #16
    1140:	23a02010 	movcs	r2, #16
    1144:	33a02000 	movcc	r2, #0
    1148:	e3510c01 	cmp	r1, #256	; 0x100
    114c:	21a01421 	lsrcs	r1, r1, #8
    1150:	22822008 	addcs	r2, r2, #8
    1154:	e3510010 	cmp	r1, #16
    1158:	21a01221 	lsrcs	r1, r1, #4
    115c:	22822004 	addcs	r2, r2, #4
    1160:	e3510004 	cmp	r1, #4
    1164:	82822003 	addhi	r2, r2, #3
    1168:	908220a1 	addls	r2, r2, r1, lsr #1
    116c:	e1a00230 	lsr	r0, r0, r2
    1170:	e12fff1e 	bx	lr
    1174:	e3500000 	cmp	r0, #0
    1178:	13e00000 	mvnne	r0, #0
    117c:	ea000007 	b	11a0 <__aeabi_idiv0>

00001180 <__aeabi_uidivmod>:
    1180:	e3510000 	cmp	r1, #0
    1184:	0afffffa 	beq	1174 <__aeabi_uidiv+0xe8>
    1188:	e92d4003 	push	{r0, r1, lr}
    118c:	ebffffbe 	bl	108c <__aeabi_uidiv>
    1190:	e8bd4006 	pop	{r1, r2, lr}
    1194:	e0030092 	mul	r3, r2, r0
    1198:	e0411003 	sub	r1, r1, r3
    119c:	e12fff1e 	bx	lr

000011a0 <__aeabi_idiv0>:
    11a0:	e12fff1e 	bx	lr
