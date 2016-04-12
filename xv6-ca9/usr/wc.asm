
_wc:     file format elf32-littlearm


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd028 	sub	sp, sp, #40	; 0x28
       c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
      10:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    int i, n;
    int l, w, c, inword;
    
    l = w = c = 0;
      14:	e3a03000 	mov	r3, #0
      18:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
      1c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      20:	e50b3010 	str	r3, [fp, #-16]
      24:	e51b3010 	ldr	r3, [fp, #-16]
      28:	e50b300c 	str	r3, [fp, #-12]
    inword = 0;
      2c:	e3a03000 	mov	r3, #0
      30:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    while((n = read(fd, buf, sizeof(buf))) > 0){
      34:	ea00002d 	b	f0 <wc+0xf0>
        for(i=0; i<n; i++){
      38:	e3a03000 	mov	r3, #0
      3c:	e50b3008 	str	r3, [fp, #-8]
      40:	ea000026 	b	e0 <wc+0xe0>
            c++;
      44:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      48:	e2833001 	add	r3, r3, #1
      4c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            if(buf[i] == '\n')
      50:	e3013340 	movw	r3, #4928	; 0x1340
      54:	e3403000 	movt	r3, #0
      58:	e51b2008 	ldr	r2, [fp, #-8]
      5c:	e0833002 	add	r3, r3, r2
      60:	e5d33000 	ldrb	r3, [r3]
      64:	e353000a 	cmp	r3, #10
      68:	1a000002 	bne	78 <wc+0x78>
                l++;
      6c:	e51b300c 	ldr	r3, [fp, #-12]
      70:	e2833001 	add	r3, r3, #1
      74:	e50b300c 	str	r3, [fp, #-12]
            if(strchr(" \r\t\n\v", buf[i]))
      78:	e3013340 	movw	r3, #4928	; 0x1340
      7c:	e3403000 	movt	r3, #0
      80:	e51b2008 	ldr	r2, [fp, #-8]
      84:	e0833002 	add	r3, r3, r2
      88:	e5d33000 	ldrb	r3, [r3]
      8c:	e30102d8 	movw	r0, #4824	; 0x12d8
      90:	e3400000 	movt	r0, #0
      94:	e1a01003 	mov	r1, r3
      98:	eb000107 	bl	4bc <strchr>
      9c:	e1a03000 	mov	r3, r0
      a0:	e3530000 	cmp	r3, #0
      a4:	0a000002 	beq	b4 <wc+0xb4>
                inword = 0;
      a8:	e3a03000 	mov	r3, #0
      ac:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
      b0:	ea000007 	b	d4 <wc+0xd4>
            else if(!inword){
      b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
      b8:	e3530000 	cmp	r3, #0
      bc:	1a000004 	bne	d4 <wc+0xd4>
                w++;
      c0:	e51b3010 	ldr	r3, [fp, #-16]
      c4:	e2833001 	add	r3, r3, #1
      c8:	e50b3010 	str	r3, [fp, #-16]
                inword = 1;
      cc:	e3a03001 	mov	r3, #1
      d0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    int l, w, c, inword;
    
    l = w = c = 0;
    inword = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
        for(i=0; i<n; i++){
      d4:	e51b3008 	ldr	r3, [fp, #-8]
      d8:	e2833001 	add	r3, r3, #1
      dc:	e50b3008 	str	r3, [fp, #-8]
      e0:	e51b2008 	ldr	r2, [fp, #-8]
      e4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
      e8:	e1520003 	cmp	r2, r3
      ec:	baffffd4 	blt	44 <wc+0x44>
    int i, n;
    int l, w, c, inword;
    
    l = w = c = 0;
    inword = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      f0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
      f4:	e3011340 	movw	r1, #4928	; 0x1340
      f8:	e3401000 	movt	r1, #0
      fc:	e3a02c02 	mov	r2, #512	; 0x200
     100:	eb0001b8 	bl	7e8 <read>
     104:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
     108:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     10c:	e3530000 	cmp	r3, #0
     110:	caffffc8 	bgt	38 <wc+0x38>
                w++;
                inword = 1;
            }
        }
    }
    if(n < 0){
     114:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     118:	e3530000 	cmp	r3, #0
     11c:	aa000004 	bge	134 <wc+0x134>
        printf(1, "wc: read error\n");
     120:	e3a00001 	mov	r0, #1
     124:	e30112e0 	movw	r1, #4832	; 0x12e0
     128:	e3401000 	movt	r1, #0
     12c:	eb0002b3 	bl	c00 <printf>
        exit();
     130:	eb000191 	bl	77c <exit>
    }
    printf(1, "%d %d %d %s\n", l, w, c, name);
     134:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     138:	e58d3000 	str	r3, [sp]
     13c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     140:	e58d3004 	str	r3, [sp, #4]
     144:	e3a00001 	mov	r0, #1
     148:	e30112f0 	movw	r1, #4848	; 0x12f0
     14c:	e3401000 	movt	r1, #0
     150:	e51b200c 	ldr	r2, [fp, #-12]
     154:	e51b3010 	ldr	r3, [fp, #-16]
     158:	eb0002a8 	bl	c00 <printf>
}
     15c:	e24bd004 	sub	sp, fp, #4
     160:	e8bd8800 	pop	{fp, pc}

00000164 <main>:

int
main(int argc, char *argv[])
{
     164:	e92d4800 	push	{fp, lr}
     168:	e28db004 	add	fp, sp, #4
     16c:	e24dd010 	sub	sp, sp, #16
     170:	e50b0010 	str	r0, [fp, #-16]
     174:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd, i;
    
    if(argc <= 1){
     178:	e51b3010 	ldr	r3, [fp, #-16]
     17c:	e3530001 	cmp	r3, #1
     180:	ca000004 	bgt	198 <main+0x34>
        wc(0, "");
     184:	e3a00000 	mov	r0, #0
     188:	e3011300 	movw	r1, #4864	; 0x1300
     18c:	e3401000 	movt	r1, #0
     190:	ebffff9a 	bl	0 <wc>
        exit();
     194:	eb000178 	bl	77c <exit>
    }
    
    for(i = 1; i < argc; i++){
     198:	e3a03001 	mov	r3, #1
     19c:	e50b3008 	str	r3, [fp, #-8]
     1a0:	ea000023 	b	234 <main+0xd0>
        if((fd = open(argv[i], 0)) < 0){
     1a4:	e51b3008 	ldr	r3, [fp, #-8]
     1a8:	e1a03103 	lsl	r3, r3, #2
     1ac:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     1b0:	e0823003 	add	r3, r2, r3
     1b4:	e5933000 	ldr	r3, [r3]
     1b8:	e1a00003 	mov	r0, r3
     1bc:	e3a01000 	mov	r1, #0
     1c0:	eb0001b5 	bl	89c <open>
     1c4:	e50b000c 	str	r0, [fp, #-12]
     1c8:	e51b300c 	ldr	r3, [fp, #-12]
     1cc:	e3530000 	cmp	r3, #0
     1d0:	aa00000a 	bge	200 <main+0x9c>
            printf(1, "wc: cannot open %s\n", argv[i]);
     1d4:	e51b3008 	ldr	r3, [fp, #-8]
     1d8:	e1a03103 	lsl	r3, r3, #2
     1dc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     1e0:	e0823003 	add	r3, r2, r3
     1e4:	e5933000 	ldr	r3, [r3]
     1e8:	e3a00001 	mov	r0, #1
     1ec:	e3011304 	movw	r1, #4868	; 0x1304
     1f0:	e3401000 	movt	r1, #0
     1f4:	e1a02003 	mov	r2, r3
     1f8:	eb000280 	bl	c00 <printf>
            exit();
     1fc:	eb00015e 	bl	77c <exit>
        }
        wc(fd, argv[i]);
     200:	e51b3008 	ldr	r3, [fp, #-8]
     204:	e1a03103 	lsl	r3, r3, #2
     208:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     20c:	e0823003 	add	r3, r2, r3
     210:	e5933000 	ldr	r3, [r3]
     214:	e51b000c 	ldr	r0, [fp, #-12]
     218:	e1a01003 	mov	r1, r3
     21c:	ebffff77 	bl	0 <wc>
        close(fd);
     220:	e51b000c 	ldr	r0, [fp, #-12]
     224:	eb000181 	bl	830 <close>
    if(argc <= 1){
        wc(0, "");
        exit();
    }
    
    for(i = 1; i < argc; i++){
     228:	e51b3008 	ldr	r3, [fp, #-8]
     22c:	e2833001 	add	r3, r3, #1
     230:	e50b3008 	str	r3, [fp, #-8]
     234:	e51b2008 	ldr	r2, [fp, #-8]
     238:	e51b3010 	ldr	r3, [fp, #-16]
     23c:	e1520003 	cmp	r2, r3
     240:	baffffd7 	blt	1a4 <main+0x40>
            exit();
        }
        wc(fd, argv[i]);
        close(fd);
    }
    exit();
     244:	eb00014c 	bl	77c <exit>

00000248 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
     248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     24c:	e28db000 	add	fp, sp, #0
     250:	e24dd014 	sub	sp, sp, #20
     254:	e50b0010 	str	r0, [fp, #-16]
     258:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
     25c:	e51b3010 	ldr	r3, [fp, #-16]
     260:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
     264:	e1a00000 	nop			; (mov r0, r0)
     268:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     26c:	e5d32000 	ldrb	r2, [r3]
     270:	e51b3010 	ldr	r3, [fp, #-16]
     274:	e5c32000 	strb	r2, [r3]
     278:	e51b3010 	ldr	r3, [fp, #-16]
     27c:	e5d33000 	ldrb	r3, [r3]
     280:	e3530000 	cmp	r3, #0
     284:	03a03000 	moveq	r3, #0
     288:	13a03001 	movne	r3, #1
     28c:	e6ef3073 	uxtb	r3, r3
     290:	e51b2010 	ldr	r2, [fp, #-16]
     294:	e2822001 	add	r2, r2, #1
     298:	e50b2010 	str	r2, [fp, #-16]
     29c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     2a0:	e2822001 	add	r2, r2, #1
     2a4:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
     2a8:	e3530000 	cmp	r3, #0
     2ac:	1affffed 	bne	268 <strcpy+0x20>
        ;
    return os;
     2b0:	e51b3008 	ldr	r3, [fp, #-8]
}
     2b4:	e1a00003 	mov	r0, r3
     2b8:	e28bd000 	add	sp, fp, #0
     2bc:	e8bd0800 	pop	{fp}
     2c0:	e12fff1e 	bx	lr

000002c4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     2c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     2c8:	e28db000 	add	fp, sp, #0
     2cc:	e24dd00c 	sub	sp, sp, #12
     2d0:	e50b0008 	str	r0, [fp, #-8]
     2d4:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     2d8:	ea000005 	b	2f4 <strcmp+0x30>
        p++, q++;
     2dc:	e51b3008 	ldr	r3, [fp, #-8]
     2e0:	e2833001 	add	r3, r3, #1
     2e4:	e50b3008 	str	r3, [fp, #-8]
     2e8:	e51b300c 	ldr	r3, [fp, #-12]
     2ec:	e2833001 	add	r3, r3, #1
     2f0:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     2f4:	e51b3008 	ldr	r3, [fp, #-8]
     2f8:	e5d33000 	ldrb	r3, [r3]
     2fc:	e3530000 	cmp	r3, #0
     300:	0a000005 	beq	31c <strcmp+0x58>
     304:	e51b3008 	ldr	r3, [fp, #-8]
     308:	e5d32000 	ldrb	r2, [r3]
     30c:	e51b300c 	ldr	r3, [fp, #-12]
     310:	e5d33000 	ldrb	r3, [r3]
     314:	e1520003 	cmp	r2, r3
     318:	0affffef 	beq	2dc <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     31c:	e51b3008 	ldr	r3, [fp, #-8]
     320:	e5d33000 	ldrb	r3, [r3]
     324:	e1a02003 	mov	r2, r3
     328:	e51b300c 	ldr	r3, [fp, #-12]
     32c:	e5d33000 	ldrb	r3, [r3]
     330:	e0633002 	rsb	r3, r3, r2
}
     334:	e1a00003 	mov	r0, r3
     338:	e28bd000 	add	sp, fp, #0
     33c:	e8bd0800 	pop	{fp}
     340:	e12fff1e 	bx	lr

00000344 <strlen>:

uint
strlen(char *s)
{
     344:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     348:	e28db000 	add	fp, sp, #0
     34c:	e24dd014 	sub	sp, sp, #20
     350:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     354:	e3a03000 	mov	r3, #0
     358:	e50b3008 	str	r3, [fp, #-8]
     35c:	ea000002 	b	36c <strlen+0x28>
     360:	e51b3008 	ldr	r3, [fp, #-8]
     364:	e2833001 	add	r3, r3, #1
     368:	e50b3008 	str	r3, [fp, #-8]
     36c:	e51b3008 	ldr	r3, [fp, #-8]
     370:	e51b2010 	ldr	r2, [fp, #-16]
     374:	e0823003 	add	r3, r2, r3
     378:	e5d33000 	ldrb	r3, [r3]
     37c:	e3530000 	cmp	r3, #0
     380:	1afffff6 	bne	360 <strlen+0x1c>
        ;
    return n;
     384:	e51b3008 	ldr	r3, [fp, #-8]
}
     388:	e1a00003 	mov	r0, r3
     38c:	e28bd000 	add	sp, fp, #0
     390:	e8bd0800 	pop	{fp}
     394:	e12fff1e 	bx	lr

00000398 <memset>:

void*
memset(void *dst, int v, uint n)
{
     398:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     39c:	e28db000 	add	fp, sp, #0
     3a0:	e24dd024 	sub	sp, sp, #36	; 0x24
     3a4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     3a8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     3ac:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     3b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     3b4:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     3b8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     3bc:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     3c0:	e55b300d 	ldrb	r3, [fp, #-13]
     3c4:	e1a02c03 	lsl	r2, r3, #24
     3c8:	e55b300d 	ldrb	r3, [fp, #-13]
     3cc:	e1a03803 	lsl	r3, r3, #16
     3d0:	e1822003 	orr	r2, r2, r3
     3d4:	e55b300d 	ldrb	r3, [fp, #-13]
     3d8:	e1a03403 	lsl	r3, r3, #8
     3dc:	e1822003 	orr	r2, r2, r3
     3e0:	e55b300d 	ldrb	r3, [fp, #-13]
     3e4:	e1823003 	orr	r3, r2, r3
     3e8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     3ec:	ea000008 	b	414 <memset+0x7c>
		*p = c;
     3f0:	e51b3008 	ldr	r3, [fp, #-8]
     3f4:	e55b200d 	ldrb	r2, [fp, #-13]
     3f8:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     3fc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     400:	e2433001 	sub	r3, r3, #1
     404:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     408:	e51b3008 	ldr	r3, [fp, #-8]
     40c:	e2833001 	add	r3, r3, #1
     410:	e50b3008 	str	r3, [fp, #-8]
     414:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     418:	e3530000 	cmp	r3, #0
     41c:	0a000003 	beq	430 <memset+0x98>
     420:	e51b3008 	ldr	r3, [fp, #-8]
     424:	e2033003 	and	r3, r3, #3
     428:	e3530000 	cmp	r3, #0
     42c:	1affffef 	bne	3f0 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     430:	e51b3008 	ldr	r3, [fp, #-8]
     434:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     438:	ea000008 	b	460 <memset+0xc8>
		*p4 = val;
     43c:	e51b300c 	ldr	r3, [fp, #-12]
     440:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     444:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     448:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     44c:	e2433004 	sub	r3, r3, #4
     450:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     454:	e51b300c 	ldr	r3, [fp, #-12]
     458:	e2833004 	add	r3, r3, #4
     45c:	e50b300c 	str	r3, [fp, #-12]
     460:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     464:	e3530003 	cmp	r3, #3
     468:	8afffff3 	bhi	43c <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     46c:	e51b300c 	ldr	r3, [fp, #-12]
     470:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     474:	ea000008 	b	49c <memset+0x104>
		*p = c;
     478:	e51b3008 	ldr	r3, [fp, #-8]
     47c:	e55b200d 	ldrb	r2, [fp, #-13]
     480:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     484:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     488:	e2433001 	sub	r3, r3, #1
     48c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     490:	e51b3008 	ldr	r3, [fp, #-8]
     494:	e2833001 	add	r3, r3, #1
     498:	e50b3008 	str	r3, [fp, #-8]
     49c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     4a0:	e3530000 	cmp	r3, #0
     4a4:	1afffff3 	bne	478 <memset+0xe0>
		*p = c;
	}

	return dst;
     4a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     4ac:	e1a00003 	mov	r0, r3
     4b0:	e28bd000 	add	sp, fp, #0
     4b4:	e8bd0800 	pop	{fp}
     4b8:	e12fff1e 	bx	lr

000004bc <strchr>:

char*
strchr(const char *s, char c)
{
     4bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4c0:	e28db000 	add	fp, sp, #0
     4c4:	e24dd00c 	sub	sp, sp, #12
     4c8:	e50b0008 	str	r0, [fp, #-8]
     4cc:	e1a03001 	mov	r3, r1
     4d0:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     4d4:	ea000009 	b	500 <strchr+0x44>
        if(*s == c)
     4d8:	e51b3008 	ldr	r3, [fp, #-8]
     4dc:	e5d33000 	ldrb	r3, [r3]
     4e0:	e55b2009 	ldrb	r2, [fp, #-9]
     4e4:	e1520003 	cmp	r2, r3
     4e8:	1a000001 	bne	4f4 <strchr+0x38>
            return (char*)s;
     4ec:	e51b3008 	ldr	r3, [fp, #-8]
     4f0:	ea000007 	b	514 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     4f4:	e51b3008 	ldr	r3, [fp, #-8]
     4f8:	e2833001 	add	r3, r3, #1
     4fc:	e50b3008 	str	r3, [fp, #-8]
     500:	e51b3008 	ldr	r3, [fp, #-8]
     504:	e5d33000 	ldrb	r3, [r3]
     508:	e3530000 	cmp	r3, #0
     50c:	1afffff1 	bne	4d8 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     510:	e3a03000 	mov	r3, #0
}
     514:	e1a00003 	mov	r0, r3
     518:	e28bd000 	add	sp, fp, #0
     51c:	e8bd0800 	pop	{fp}
     520:	e12fff1e 	bx	lr

00000524 <gets>:

char*
gets(char *buf, int max)
{
     524:	e92d4800 	push	{fp, lr}
     528:	e28db004 	add	fp, sp, #4
     52c:	e24dd018 	sub	sp, sp, #24
     530:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     534:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     538:	e3a03000 	mov	r3, #0
     53c:	e50b3008 	str	r3, [fp, #-8]
     540:	ea000016 	b	5a0 <gets+0x7c>
        cc = read(0, &c, 1);
     544:	e3a00000 	mov	r0, #0
     548:	e24b300d 	sub	r3, fp, #13
     54c:	e1a01003 	mov	r1, r3
     550:	e3a02001 	mov	r2, #1
     554:	eb0000a3 	bl	7e8 <read>
     558:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     55c:	e51b300c 	ldr	r3, [fp, #-12]
     560:	e3530000 	cmp	r3, #0
     564:	da000013 	ble	5b8 <gets+0x94>
            break;
        buf[i++] = c;
     568:	e51b3008 	ldr	r3, [fp, #-8]
     56c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     570:	e0823003 	add	r3, r2, r3
     574:	e55b200d 	ldrb	r2, [fp, #-13]
     578:	e5c32000 	strb	r2, [r3]
     57c:	e51b3008 	ldr	r3, [fp, #-8]
     580:	e2833001 	add	r3, r3, #1
     584:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     588:	e55b300d 	ldrb	r3, [fp, #-13]
     58c:	e353000a 	cmp	r3, #10
     590:	0a000009 	beq	5bc <gets+0x98>
     594:	e55b300d 	ldrb	r3, [fp, #-13]
     598:	e353000d 	cmp	r3, #13
     59c:	0a000006 	beq	5bc <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     5a0:	e51b3008 	ldr	r3, [fp, #-8]
     5a4:	e2832001 	add	r2, r3, #1
     5a8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     5ac:	e1520003 	cmp	r2, r3
     5b0:	baffffe3 	blt	544 <gets+0x20>
     5b4:	ea000000 	b	5bc <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     5b8:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     5bc:	e51b3008 	ldr	r3, [fp, #-8]
     5c0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     5c4:	e0823003 	add	r3, r2, r3
     5c8:	e3a02000 	mov	r2, #0
     5cc:	e5c32000 	strb	r2, [r3]
    return buf;
     5d0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     5d4:	e1a00003 	mov	r0, r3
     5d8:	e24bd004 	sub	sp, fp, #4
     5dc:	e8bd8800 	pop	{fp, pc}

000005e0 <stat>:

int
stat(char *n, struct stat *st)
{
     5e0:	e92d4800 	push	{fp, lr}
     5e4:	e28db004 	add	fp, sp, #4
     5e8:	e24dd010 	sub	sp, sp, #16
     5ec:	e50b0010 	str	r0, [fp, #-16]
     5f0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     5f4:	e51b0010 	ldr	r0, [fp, #-16]
     5f8:	e3a01000 	mov	r1, #0
     5fc:	eb0000a6 	bl	89c <open>
     600:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     604:	e51b3008 	ldr	r3, [fp, #-8]
     608:	e3530000 	cmp	r3, #0
     60c:	aa000001 	bge	618 <stat+0x38>
        return -1;
     610:	e3e03000 	mvn	r3, #0
     614:	ea000006 	b	634 <stat+0x54>
    r = fstat(fd, st);
     618:	e51b0008 	ldr	r0, [fp, #-8]
     61c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     620:	eb0000b8 	bl	908 <fstat>
     624:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     628:	e51b0008 	ldr	r0, [fp, #-8]
     62c:	eb00007f 	bl	830 <close>
    return r;
     630:	e51b300c 	ldr	r3, [fp, #-12]
}
     634:	e1a00003 	mov	r0, r3
     638:	e24bd004 	sub	sp, fp, #4
     63c:	e8bd8800 	pop	{fp, pc}

00000640 <atoi>:

int
atoi(const char *s)
{
     640:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     644:	e28db000 	add	fp, sp, #0
     648:	e24dd014 	sub	sp, sp, #20
     64c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     650:	e3a03000 	mov	r3, #0
     654:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     658:	ea00000d 	b	694 <atoi+0x54>
        n = n*10 + *s++ - '0';
     65c:	e51b2008 	ldr	r2, [fp, #-8]
     660:	e1a03002 	mov	r3, r2
     664:	e1a03103 	lsl	r3, r3, #2
     668:	e0833002 	add	r3, r3, r2
     66c:	e1a03083 	lsl	r3, r3, #1
     670:	e1a02003 	mov	r2, r3
     674:	e51b3010 	ldr	r3, [fp, #-16]
     678:	e5d33000 	ldrb	r3, [r3]
     67c:	e0823003 	add	r3, r2, r3
     680:	e2433030 	sub	r3, r3, #48	; 0x30
     684:	e50b3008 	str	r3, [fp, #-8]
     688:	e51b3010 	ldr	r3, [fp, #-16]
     68c:	e2833001 	add	r3, r3, #1
     690:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     694:	e51b3010 	ldr	r3, [fp, #-16]
     698:	e5d33000 	ldrb	r3, [r3]
     69c:	e353002f 	cmp	r3, #47	; 0x2f
     6a0:	9a000003 	bls	6b4 <atoi+0x74>
     6a4:	e51b3010 	ldr	r3, [fp, #-16]
     6a8:	e5d33000 	ldrb	r3, [r3]
     6ac:	e3530039 	cmp	r3, #57	; 0x39
     6b0:	9affffe9 	bls	65c <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     6b4:	e51b3008 	ldr	r3, [fp, #-8]
}
     6b8:	e1a00003 	mov	r0, r3
     6bc:	e28bd000 	add	sp, fp, #0
     6c0:	e8bd0800 	pop	{fp}
     6c4:	e12fff1e 	bx	lr

000006c8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     6c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     6cc:	e28db000 	add	fp, sp, #0
     6d0:	e24dd01c 	sub	sp, sp, #28
     6d4:	e50b0010 	str	r0, [fp, #-16]
     6d8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     6dc:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     6e0:	e51b3010 	ldr	r3, [fp, #-16]
     6e4:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     6e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     6ec:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     6f0:	ea000009 	b	71c <memmove+0x54>
        *dst++ = *src++;
     6f4:	e51b300c 	ldr	r3, [fp, #-12]
     6f8:	e5d32000 	ldrb	r2, [r3]
     6fc:	e51b3008 	ldr	r3, [fp, #-8]
     700:	e5c32000 	strb	r2, [r3]
     704:	e51b3008 	ldr	r3, [fp, #-8]
     708:	e2833001 	add	r3, r3, #1
     70c:	e50b3008 	str	r3, [fp, #-8]
     710:	e51b300c 	ldr	r3, [fp, #-12]
     714:	e2833001 	add	r3, r3, #1
     718:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     71c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     720:	e3530000 	cmp	r3, #0
     724:	d3a03000 	movle	r3, #0
     728:	c3a03001 	movgt	r3, #1
     72c:	e6ef3073 	uxtb	r3, r3
     730:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     734:	e2422001 	sub	r2, r2, #1
     738:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     73c:	e3530000 	cmp	r3, #0
     740:	1affffeb 	bne	6f4 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     744:	e51b3010 	ldr	r3, [fp, #-16]
}
     748:	e1a00003 	mov	r0, r3
     74c:	e28bd000 	add	sp, fp, #0
     750:	e8bd0800 	pop	{fp}
     754:	e12fff1e 	bx	lr

00000758 <fork>:
     758:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     75c:	e1a04003 	mov	r4, r3
     760:	e1a03002 	mov	r3, r2
     764:	e1a02001 	mov	r2, r1
     768:	e1a01000 	mov	r1, r0
     76c:	e3a00001 	mov	r0, #1
     770:	ef000000 	svc	0x00000000
     774:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     778:	e12fff1e 	bx	lr

0000077c <exit>:
     77c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     780:	e1a04003 	mov	r4, r3
     784:	e1a03002 	mov	r3, r2
     788:	e1a02001 	mov	r2, r1
     78c:	e1a01000 	mov	r1, r0
     790:	e3a00002 	mov	r0, #2
     794:	ef000000 	svc	0x00000000
     798:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     79c:	e12fff1e 	bx	lr

000007a0 <wait>:
     7a0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7a4:	e1a04003 	mov	r4, r3
     7a8:	e1a03002 	mov	r3, r2
     7ac:	e1a02001 	mov	r2, r1
     7b0:	e1a01000 	mov	r1, r0
     7b4:	e3a00003 	mov	r0, #3
     7b8:	ef000000 	svc	0x00000000
     7bc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7c0:	e12fff1e 	bx	lr

000007c4 <pipe>:
     7c4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7c8:	e1a04003 	mov	r4, r3
     7cc:	e1a03002 	mov	r3, r2
     7d0:	e1a02001 	mov	r2, r1
     7d4:	e1a01000 	mov	r1, r0
     7d8:	e3a00004 	mov	r0, #4
     7dc:	ef000000 	svc	0x00000000
     7e0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7e4:	e12fff1e 	bx	lr

000007e8 <read>:
     7e8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7ec:	e1a04003 	mov	r4, r3
     7f0:	e1a03002 	mov	r3, r2
     7f4:	e1a02001 	mov	r2, r1
     7f8:	e1a01000 	mov	r1, r0
     7fc:	e3a00005 	mov	r0, #5
     800:	ef000000 	svc	0x00000000
     804:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     808:	e12fff1e 	bx	lr

0000080c <write>:
     80c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     810:	e1a04003 	mov	r4, r3
     814:	e1a03002 	mov	r3, r2
     818:	e1a02001 	mov	r2, r1
     81c:	e1a01000 	mov	r1, r0
     820:	e3a00010 	mov	r0, #16
     824:	ef000000 	svc	0x00000000
     828:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     82c:	e12fff1e 	bx	lr

00000830 <close>:
     830:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     834:	e1a04003 	mov	r4, r3
     838:	e1a03002 	mov	r3, r2
     83c:	e1a02001 	mov	r2, r1
     840:	e1a01000 	mov	r1, r0
     844:	e3a00015 	mov	r0, #21
     848:	ef000000 	svc	0x00000000
     84c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     850:	e12fff1e 	bx	lr

00000854 <kill>:
     854:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     858:	e1a04003 	mov	r4, r3
     85c:	e1a03002 	mov	r3, r2
     860:	e1a02001 	mov	r2, r1
     864:	e1a01000 	mov	r1, r0
     868:	e3a00006 	mov	r0, #6
     86c:	ef000000 	svc	0x00000000
     870:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     874:	e12fff1e 	bx	lr

00000878 <exec>:
     878:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     87c:	e1a04003 	mov	r4, r3
     880:	e1a03002 	mov	r3, r2
     884:	e1a02001 	mov	r2, r1
     888:	e1a01000 	mov	r1, r0
     88c:	e3a00007 	mov	r0, #7
     890:	ef000000 	svc	0x00000000
     894:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     898:	e12fff1e 	bx	lr

0000089c <open>:
     89c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8a0:	e1a04003 	mov	r4, r3
     8a4:	e1a03002 	mov	r3, r2
     8a8:	e1a02001 	mov	r2, r1
     8ac:	e1a01000 	mov	r1, r0
     8b0:	e3a0000f 	mov	r0, #15
     8b4:	ef000000 	svc	0x00000000
     8b8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8bc:	e12fff1e 	bx	lr

000008c0 <mknod>:
     8c0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8c4:	e1a04003 	mov	r4, r3
     8c8:	e1a03002 	mov	r3, r2
     8cc:	e1a02001 	mov	r2, r1
     8d0:	e1a01000 	mov	r1, r0
     8d4:	e3a00011 	mov	r0, #17
     8d8:	ef000000 	svc	0x00000000
     8dc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8e0:	e12fff1e 	bx	lr

000008e4 <unlink>:
     8e4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8e8:	e1a04003 	mov	r4, r3
     8ec:	e1a03002 	mov	r3, r2
     8f0:	e1a02001 	mov	r2, r1
     8f4:	e1a01000 	mov	r1, r0
     8f8:	e3a00012 	mov	r0, #18
     8fc:	ef000000 	svc	0x00000000
     900:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     904:	e12fff1e 	bx	lr

00000908 <fstat>:
     908:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     90c:	e1a04003 	mov	r4, r3
     910:	e1a03002 	mov	r3, r2
     914:	e1a02001 	mov	r2, r1
     918:	e1a01000 	mov	r1, r0
     91c:	e3a00008 	mov	r0, #8
     920:	ef000000 	svc	0x00000000
     924:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     928:	e12fff1e 	bx	lr

0000092c <link>:
     92c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     930:	e1a04003 	mov	r4, r3
     934:	e1a03002 	mov	r3, r2
     938:	e1a02001 	mov	r2, r1
     93c:	e1a01000 	mov	r1, r0
     940:	e3a00013 	mov	r0, #19
     944:	ef000000 	svc	0x00000000
     948:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     94c:	e12fff1e 	bx	lr

00000950 <mkdir>:
     950:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     954:	e1a04003 	mov	r4, r3
     958:	e1a03002 	mov	r3, r2
     95c:	e1a02001 	mov	r2, r1
     960:	e1a01000 	mov	r1, r0
     964:	e3a00014 	mov	r0, #20
     968:	ef000000 	svc	0x00000000
     96c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     970:	e12fff1e 	bx	lr

00000974 <chdir>:
     974:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     978:	e1a04003 	mov	r4, r3
     97c:	e1a03002 	mov	r3, r2
     980:	e1a02001 	mov	r2, r1
     984:	e1a01000 	mov	r1, r0
     988:	e3a00009 	mov	r0, #9
     98c:	ef000000 	svc	0x00000000
     990:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     994:	e12fff1e 	bx	lr

00000998 <dup>:
     998:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     99c:	e1a04003 	mov	r4, r3
     9a0:	e1a03002 	mov	r3, r2
     9a4:	e1a02001 	mov	r2, r1
     9a8:	e1a01000 	mov	r1, r0
     9ac:	e3a0000a 	mov	r0, #10
     9b0:	ef000000 	svc	0x00000000
     9b4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     9b8:	e12fff1e 	bx	lr

000009bc <getpid>:
     9bc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9c0:	e1a04003 	mov	r4, r3
     9c4:	e1a03002 	mov	r3, r2
     9c8:	e1a02001 	mov	r2, r1
     9cc:	e1a01000 	mov	r1, r0
     9d0:	e3a0000b 	mov	r0, #11
     9d4:	ef000000 	svc	0x00000000
     9d8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     9dc:	e12fff1e 	bx	lr

000009e0 <sbrk>:
     9e0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9e4:	e1a04003 	mov	r4, r3
     9e8:	e1a03002 	mov	r3, r2
     9ec:	e1a02001 	mov	r2, r1
     9f0:	e1a01000 	mov	r1, r0
     9f4:	e3a0000c 	mov	r0, #12
     9f8:	ef000000 	svc	0x00000000
     9fc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a00:	e12fff1e 	bx	lr

00000a04 <sleep>:
     a04:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a08:	e1a04003 	mov	r4, r3
     a0c:	e1a03002 	mov	r3, r2
     a10:	e1a02001 	mov	r2, r1
     a14:	e1a01000 	mov	r1, r0
     a18:	e3a0000d 	mov	r0, #13
     a1c:	ef000000 	svc	0x00000000
     a20:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a24:	e12fff1e 	bx	lr

00000a28 <uptime>:
     a28:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a2c:	e1a04003 	mov	r4, r3
     a30:	e1a03002 	mov	r3, r2
     a34:	e1a02001 	mov	r2, r1
     a38:	e1a01000 	mov	r1, r0
     a3c:	e3a0000e 	mov	r0, #14
     a40:	ef000000 	svc	0x00000000
     a44:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a48:	e12fff1e 	bx	lr

00000a4c <kthread_create>:
     a4c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a50:	e1a04003 	mov	r4, r3
     a54:	e1a03002 	mov	r3, r2
     a58:	e1a02001 	mov	r2, r1
     a5c:	e1a01000 	mov	r1, r0
     a60:	e3a00016 	mov	r0, #22
     a64:	ef000000 	svc	0x00000000
     a68:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a6c:	e12fff1e 	bx	lr

00000a70 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     a70:	e92d4800 	push	{fp, lr}
     a74:	e28db004 	add	fp, sp, #4
     a78:	e24dd008 	sub	sp, sp, #8
     a7c:	e50b0008 	str	r0, [fp, #-8]
     a80:	e1a03001 	mov	r3, r1
     a84:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     a88:	e51b0008 	ldr	r0, [fp, #-8]
     a8c:	e24b3009 	sub	r3, fp, #9
     a90:	e1a01003 	mov	r1, r3
     a94:	e3a02001 	mov	r2, #1
     a98:	ebffff5b 	bl	80c <write>
}
     a9c:	e24bd004 	sub	sp, fp, #4
     aa0:	e8bd8800 	pop	{fp, pc}

00000aa4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     aa4:	e92d4800 	push	{fp, lr}
     aa8:	e28db004 	add	fp, sp, #4
     aac:	e24dd030 	sub	sp, sp, #48	; 0x30
     ab0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     ab4:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     ab8:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     abc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     ac0:	e3a03000 	mov	r3, #0
     ac4:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     ac8:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     acc:	e3530000 	cmp	r3, #0
     ad0:	0a000008 	beq	af8 <printint+0x54>
     ad4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     ad8:	e3530000 	cmp	r3, #0
     adc:	aa000005 	bge	af8 <printint+0x54>
        neg = 1;
     ae0:	e3a03001 	mov	r3, #1
     ae4:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     ae8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     aec:	e2633000 	rsb	r3, r3, #0
     af0:	e50b3010 	str	r3, [fp, #-16]
     af4:	ea000001 	b	b00 <printint+0x5c>
    } else {
        x = xx;
     af8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     afc:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     b00:	e3a03000 	mov	r3, #0
     b04:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     b08:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     b0c:	e51b2010 	ldr	r2, [fp, #-16]
     b10:	e1a00002 	mov	r0, r2
     b14:	e1a01003 	mov	r1, r3
     b18:	eb0001e5 	bl	12b4 <__aeabi_uidivmod>
     b1c:	e1a03001 	mov	r3, r1
     b20:	e1a02003 	mov	r2, r3
     b24:	e3013320 	movw	r3, #4896	; 0x1320
     b28:	e3403000 	movt	r3, #0
     b2c:	e7d32002 	ldrb	r2, [r3, r2]
     b30:	e3e0001b 	mvn	r0, #27
     b34:	e51b3008 	ldr	r3, [fp, #-8]
     b38:	e24bc004 	sub	ip, fp, #4
     b3c:	e08c1003 	add	r1, ip, r3
     b40:	e1a03000 	mov	r3, r0
     b44:	e0813003 	add	r3, r1, r3
     b48:	e5c32000 	strb	r2, [r3]
     b4c:	e51b3008 	ldr	r3, [fp, #-8]
     b50:	e2833001 	add	r3, r3, #1
     b54:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     b58:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     b5c:	e51b0010 	ldr	r0, [fp, #-16]
     b60:	e1a01003 	mov	r1, r3
     b64:	eb000195 	bl	11c0 <__aeabi_uidiv>
     b68:	e1a03000 	mov	r3, r0
     b6c:	e50b3010 	str	r3, [fp, #-16]
     b70:	e51b3010 	ldr	r3, [fp, #-16]
     b74:	e3530000 	cmp	r3, #0
     b78:	1affffe2 	bne	b08 <printint+0x64>
    if(neg)
     b7c:	e51b300c 	ldr	r3, [fp, #-12]
     b80:	e3530000 	cmp	r3, #0
     b84:	0a000015 	beq	be0 <printint+0x13c>
        buf[i++] = '-';
     b88:	e3e0101b 	mvn	r1, #27
     b8c:	e51b3008 	ldr	r3, [fp, #-8]
     b90:	e24b0004 	sub	r0, fp, #4
     b94:	e0802003 	add	r2, r0, r3
     b98:	e1a03001 	mov	r3, r1
     b9c:	e0823003 	add	r3, r2, r3
     ba0:	e3a0202d 	mov	r2, #45	; 0x2d
     ba4:	e5c32000 	strb	r2, [r3]
     ba8:	e51b3008 	ldr	r3, [fp, #-8]
     bac:	e2833001 	add	r3, r3, #1
     bb0:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     bb4:	ea000009 	b	be0 <printint+0x13c>
        putc(fd, buf[i]);
     bb8:	e3e0101b 	mvn	r1, #27
     bbc:	e51b3008 	ldr	r3, [fp, #-8]
     bc0:	e24bc004 	sub	ip, fp, #4
     bc4:	e08c2003 	add	r2, ip, r3
     bc8:	e1a03001 	mov	r3, r1
     bcc:	e0823003 	add	r3, r2, r3
     bd0:	e5d33000 	ldrb	r3, [r3]
     bd4:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     bd8:	e1a01003 	mov	r1, r3
     bdc:	ebffffa3 	bl	a70 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     be0:	e51b3008 	ldr	r3, [fp, #-8]
     be4:	e2433001 	sub	r3, r3, #1
     be8:	e50b3008 	str	r3, [fp, #-8]
     bec:	e51b3008 	ldr	r3, [fp, #-8]
     bf0:	e3530000 	cmp	r3, #0
     bf4:	aaffffef 	bge	bb8 <printint+0x114>
        putc(fd, buf[i]);
}
     bf8:	e24bd004 	sub	sp, fp, #4
     bfc:	e8bd8800 	pop	{fp, pc}

00000c00 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     c00:	e92d000e 	push	{r1, r2, r3}
     c04:	e92d4800 	push	{fp, lr}
     c08:	e28db004 	add	fp, sp, #4
     c0c:	e24dd024 	sub	sp, sp, #36	; 0x24
     c10:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     c14:	e3a03000 	mov	r3, #0
     c18:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     c1c:	e28b3008 	add	r3, fp, #8
     c20:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     c24:	e3a03000 	mov	r3, #0
     c28:	e50b3010 	str	r3, [fp, #-16]
     c2c:	ea000077 	b	e10 <printf+0x210>
        c = fmt[i] & 0xff;
     c30:	e59b2004 	ldr	r2, [fp, #4]
     c34:	e51b3010 	ldr	r3, [fp, #-16]
     c38:	e0823003 	add	r3, r2, r3
     c3c:	e5d33000 	ldrb	r3, [r3]
     c40:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     c44:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     c48:	e3530000 	cmp	r3, #0
     c4c:	1a00000b 	bne	c80 <printf+0x80>
            if(c == '%'){
     c50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c54:	e3530025 	cmp	r3, #37	; 0x25
     c58:	1a000002 	bne	c68 <printf+0x68>
                state = '%';
     c5c:	e3a03025 	mov	r3, #37	; 0x25
     c60:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     c64:	ea000066 	b	e04 <printf+0x204>
            } else {
                putc(fd, c);
     c68:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c6c:	e6ef3073 	uxtb	r3, r3
     c70:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c74:	e1a01003 	mov	r1, r3
     c78:	ebffff7c 	bl	a70 <putc>
     c7c:	ea000060 	b	e04 <printf+0x204>
            }
        } else if(state == '%'){
     c80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     c84:	e3530025 	cmp	r3, #37	; 0x25
     c88:	1a00005d 	bne	e04 <printf+0x204>
            if(c == 'd'){
     c8c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c90:	e3530064 	cmp	r3, #100	; 0x64
     c94:	1a00000a 	bne	cc4 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     c98:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c9c:	e5933000 	ldr	r3, [r3]
     ca0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ca4:	e1a01003 	mov	r1, r3
     ca8:	e3a0200a 	mov	r2, #10
     cac:	e3a03001 	mov	r3, #1
     cb0:	ebffff7b 	bl	aa4 <printint>
                ap++;
     cb4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cb8:	e2833004 	add	r3, r3, #4
     cbc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     cc0:	ea00004d 	b	dfc <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     cc4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cc8:	e3530078 	cmp	r3, #120	; 0x78
     ccc:	0a000002 	beq	cdc <printf+0xdc>
     cd0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cd4:	e3530070 	cmp	r3, #112	; 0x70
     cd8:	1a00000a 	bne	d08 <printf+0x108>
                printint(fd, *ap, 16, 0);
     cdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ce0:	e5933000 	ldr	r3, [r3]
     ce4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ce8:	e1a01003 	mov	r1, r3
     cec:	e3a02010 	mov	r2, #16
     cf0:	e3a03000 	mov	r3, #0
     cf4:	ebffff6a 	bl	aa4 <printint>
                ap++;
     cf8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cfc:	e2833004 	add	r3, r3, #4
     d00:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     d04:	ea00003c 	b	dfc <printf+0x1fc>
            } else if(c == 's'){
     d08:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     d0c:	e3530073 	cmp	r3, #115	; 0x73
     d10:	1a00001b 	bne	d84 <printf+0x184>
                s = (char*)*ap;
     d14:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     d18:	e5933000 	ldr	r3, [r3]
     d1c:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     d20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     d24:	e2833004 	add	r3, r3, #4
     d28:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     d2c:	e51b300c 	ldr	r3, [fp, #-12]
     d30:	e3530000 	cmp	r3, #0
     d34:	1a00000c 	bne	d6c <printf+0x16c>
                    s = "(null)";
     d38:	e3013318 	movw	r3, #4888	; 0x1318
     d3c:	e3403000 	movt	r3, #0
     d40:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     d44:	ea000008 	b	d6c <printf+0x16c>
                    putc(fd, *s);
     d48:	e51b300c 	ldr	r3, [fp, #-12]
     d4c:	e5d33000 	ldrb	r3, [r3]
     d50:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     d54:	e1a01003 	mov	r1, r3
     d58:	ebffff44 	bl	a70 <putc>
                    s++;
     d5c:	e51b300c 	ldr	r3, [fp, #-12]
     d60:	e2833001 	add	r3, r3, #1
     d64:	e50b300c 	str	r3, [fp, #-12]
     d68:	ea000000 	b	d70 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     d6c:	e1a00000 	nop			; (mov r0, r0)
     d70:	e51b300c 	ldr	r3, [fp, #-12]
     d74:	e5d33000 	ldrb	r3, [r3]
     d78:	e3530000 	cmp	r3, #0
     d7c:	1afffff1 	bne	d48 <printf+0x148>
     d80:	ea00001d 	b	dfc <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     d84:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     d88:	e3530063 	cmp	r3, #99	; 0x63
     d8c:	1a000009 	bne	db8 <printf+0x1b8>
                putc(fd, *ap);
     d90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     d94:	e5933000 	ldr	r3, [r3]
     d98:	e6ef3073 	uxtb	r3, r3
     d9c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     da0:	e1a01003 	mov	r1, r3
     da4:	ebffff31 	bl	a70 <putc>
                ap++;
     da8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     dac:	e2833004 	add	r3, r3, #4
     db0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     db4:	ea000010 	b	dfc <printf+0x1fc>
            } else if(c == '%'){
     db8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     dbc:	e3530025 	cmp	r3, #37	; 0x25
     dc0:	1a000005 	bne	ddc <printf+0x1dc>
                putc(fd, c);
     dc4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     dc8:	e6ef3073 	uxtb	r3, r3
     dcc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     dd0:	e1a01003 	mov	r1, r3
     dd4:	ebffff25 	bl	a70 <putc>
     dd8:	ea000007 	b	dfc <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     ddc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     de0:	e3a01025 	mov	r1, #37	; 0x25
     de4:	ebffff21 	bl	a70 <putc>
                putc(fd, c);
     de8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     dec:	e6ef3073 	uxtb	r3, r3
     df0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     df4:	e1a01003 	mov	r1, r3
     df8:	ebffff1c 	bl	a70 <putc>
            }
            state = 0;
     dfc:	e3a03000 	mov	r3, #0
     e00:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     e04:	e51b3010 	ldr	r3, [fp, #-16]
     e08:	e2833001 	add	r3, r3, #1
     e0c:	e50b3010 	str	r3, [fp, #-16]
     e10:	e59b2004 	ldr	r2, [fp, #4]
     e14:	e51b3010 	ldr	r3, [fp, #-16]
     e18:	e0823003 	add	r3, r2, r3
     e1c:	e5d33000 	ldrb	r3, [r3]
     e20:	e3530000 	cmp	r3, #0
     e24:	1affff81 	bne	c30 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     e28:	e24bd004 	sub	sp, fp, #4
     e2c:	e8bd4800 	pop	{fp, lr}
     e30:	e28dd00c 	add	sp, sp, #12
     e34:	e12fff1e 	bx	lr

00000e38 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e38:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     e3c:	e28db000 	add	fp, sp, #0
     e40:	e24dd014 	sub	sp, sp, #20
     e44:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     e48:	e51b3010 	ldr	r3, [fp, #-16]
     e4c:	e2433008 	sub	r3, r3, #8
     e50:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e54:	e301333c 	movw	r3, #4924	; 0x133c
     e58:	e3403000 	movt	r3, #0
     e5c:	e5933000 	ldr	r3, [r3]
     e60:	e50b3008 	str	r3, [fp, #-8]
     e64:	ea000010 	b	eac <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e68:	e51b3008 	ldr	r3, [fp, #-8]
     e6c:	e5932000 	ldr	r2, [r3]
     e70:	e51b3008 	ldr	r3, [fp, #-8]
     e74:	e1520003 	cmp	r2, r3
     e78:	8a000008 	bhi	ea0 <free+0x68>
     e7c:	e51b200c 	ldr	r2, [fp, #-12]
     e80:	e51b3008 	ldr	r3, [fp, #-8]
     e84:	e1520003 	cmp	r2, r3
     e88:	8a000010 	bhi	ed0 <free+0x98>
     e8c:	e51b3008 	ldr	r3, [fp, #-8]
     e90:	e5932000 	ldr	r2, [r3]
     e94:	e51b300c 	ldr	r3, [fp, #-12]
     e98:	e1520003 	cmp	r2, r3
     e9c:	8a00000b 	bhi	ed0 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ea0:	e51b3008 	ldr	r3, [fp, #-8]
     ea4:	e5933000 	ldr	r3, [r3]
     ea8:	e50b3008 	str	r3, [fp, #-8]
     eac:	e51b200c 	ldr	r2, [fp, #-12]
     eb0:	e51b3008 	ldr	r3, [fp, #-8]
     eb4:	e1520003 	cmp	r2, r3
     eb8:	9affffea 	bls	e68 <free+0x30>
     ebc:	e51b3008 	ldr	r3, [fp, #-8]
     ec0:	e5932000 	ldr	r2, [r3]
     ec4:	e51b300c 	ldr	r3, [fp, #-12]
     ec8:	e1520003 	cmp	r2, r3
     ecc:	9affffe5 	bls	e68 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     ed0:	e51b300c 	ldr	r3, [fp, #-12]
     ed4:	e5933004 	ldr	r3, [r3, #4]
     ed8:	e1a03183 	lsl	r3, r3, #3
     edc:	e51b200c 	ldr	r2, [fp, #-12]
     ee0:	e0822003 	add	r2, r2, r3
     ee4:	e51b3008 	ldr	r3, [fp, #-8]
     ee8:	e5933000 	ldr	r3, [r3]
     eec:	e1520003 	cmp	r2, r3
     ef0:	1a00000d 	bne	f2c <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     ef4:	e51b300c 	ldr	r3, [fp, #-12]
     ef8:	e5932004 	ldr	r2, [r3, #4]
     efc:	e51b3008 	ldr	r3, [fp, #-8]
     f00:	e5933000 	ldr	r3, [r3]
     f04:	e5933004 	ldr	r3, [r3, #4]
     f08:	e0822003 	add	r2, r2, r3
     f0c:	e51b300c 	ldr	r3, [fp, #-12]
     f10:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     f14:	e51b3008 	ldr	r3, [fp, #-8]
     f18:	e5933000 	ldr	r3, [r3]
     f1c:	e5932000 	ldr	r2, [r3]
     f20:	e51b300c 	ldr	r3, [fp, #-12]
     f24:	e5832000 	str	r2, [r3]
     f28:	ea000003 	b	f3c <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     f2c:	e51b3008 	ldr	r3, [fp, #-8]
     f30:	e5932000 	ldr	r2, [r3]
     f34:	e51b300c 	ldr	r3, [fp, #-12]
     f38:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     f3c:	e51b3008 	ldr	r3, [fp, #-8]
     f40:	e5933004 	ldr	r3, [r3, #4]
     f44:	e1a03183 	lsl	r3, r3, #3
     f48:	e51b2008 	ldr	r2, [fp, #-8]
     f4c:	e0822003 	add	r2, r2, r3
     f50:	e51b300c 	ldr	r3, [fp, #-12]
     f54:	e1520003 	cmp	r2, r3
     f58:	1a00000b 	bne	f8c <free+0x154>
        p->s.size += bp->s.size;
     f5c:	e51b3008 	ldr	r3, [fp, #-8]
     f60:	e5932004 	ldr	r2, [r3, #4]
     f64:	e51b300c 	ldr	r3, [fp, #-12]
     f68:	e5933004 	ldr	r3, [r3, #4]
     f6c:	e0822003 	add	r2, r2, r3
     f70:	e51b3008 	ldr	r3, [fp, #-8]
     f74:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     f78:	e51b300c 	ldr	r3, [fp, #-12]
     f7c:	e5932000 	ldr	r2, [r3]
     f80:	e51b3008 	ldr	r3, [fp, #-8]
     f84:	e5832000 	str	r2, [r3]
     f88:	ea000002 	b	f98 <free+0x160>
    } else
        p->s.ptr = bp;
     f8c:	e51b3008 	ldr	r3, [fp, #-8]
     f90:	e51b200c 	ldr	r2, [fp, #-12]
     f94:	e5832000 	str	r2, [r3]
    freep = p;
     f98:	e301333c 	movw	r3, #4924	; 0x133c
     f9c:	e3403000 	movt	r3, #0
     fa0:	e51b2008 	ldr	r2, [fp, #-8]
     fa4:	e5832000 	str	r2, [r3]
}
     fa8:	e28bd000 	add	sp, fp, #0
     fac:	e8bd0800 	pop	{fp}
     fb0:	e12fff1e 	bx	lr

00000fb4 <morecore>:

static Header*
morecore(uint nu)
{
     fb4:	e92d4800 	push	{fp, lr}
     fb8:	e28db004 	add	fp, sp, #4
     fbc:	e24dd010 	sub	sp, sp, #16
     fc0:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     fc4:	e51b2010 	ldr	r2, [fp, #-16]
     fc8:	e3003fff 	movw	r3, #4095	; 0xfff
     fcc:	e1520003 	cmp	r2, r3
     fd0:	8a000001 	bhi	fdc <morecore+0x28>
        nu = 4096;
     fd4:	e3a03a01 	mov	r3, #4096	; 0x1000
     fd8:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     fdc:	e51b3010 	ldr	r3, [fp, #-16]
     fe0:	e1a03183 	lsl	r3, r3, #3
     fe4:	e1a00003 	mov	r0, r3
     fe8:	ebfffe7c 	bl	9e0 <sbrk>
     fec:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     ff0:	e51b3008 	ldr	r3, [fp, #-8]
     ff4:	e3730001 	cmn	r3, #1
     ff8:	1a000001 	bne	1004 <morecore+0x50>
        return 0;
     ffc:	e3a03000 	mov	r3, #0
    1000:	ea00000b 	b	1034 <morecore+0x80>
    hp = (Header*)p;
    1004:	e51b3008 	ldr	r3, [fp, #-8]
    1008:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
    100c:	e51b300c 	ldr	r3, [fp, #-12]
    1010:	e51b2010 	ldr	r2, [fp, #-16]
    1014:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
    1018:	e51b300c 	ldr	r3, [fp, #-12]
    101c:	e2833008 	add	r3, r3, #8
    1020:	e1a00003 	mov	r0, r3
    1024:	ebffff83 	bl	e38 <free>
    return freep;
    1028:	e301333c 	movw	r3, #4924	; 0x133c
    102c:	e3403000 	movt	r3, #0
    1030:	e5933000 	ldr	r3, [r3]
}
    1034:	e1a00003 	mov	r0, r3
    1038:	e24bd004 	sub	sp, fp, #4
    103c:	e8bd8800 	pop	{fp, pc}

00001040 <malloc>:

void*
malloc(uint nbytes)
{
    1040:	e92d4800 	push	{fp, lr}
    1044:	e28db004 	add	fp, sp, #4
    1048:	e24dd018 	sub	sp, sp, #24
    104c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1050:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1054:	e2833007 	add	r3, r3, #7
    1058:	e1a031a3 	lsr	r3, r3, #3
    105c:	e2833001 	add	r3, r3, #1
    1060:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
    1064:	e301333c 	movw	r3, #4924	; 0x133c
    1068:	e3403000 	movt	r3, #0
    106c:	e5933000 	ldr	r3, [r3]
    1070:	e50b300c 	str	r3, [fp, #-12]
    1074:	e51b300c 	ldr	r3, [fp, #-12]
    1078:	e3530000 	cmp	r3, #0
    107c:	1a000010 	bne	10c4 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
    1080:	e3013334 	movw	r3, #4916	; 0x1334
    1084:	e3403000 	movt	r3, #0
    1088:	e50b300c 	str	r3, [fp, #-12]
    108c:	e301333c 	movw	r3, #4924	; 0x133c
    1090:	e3403000 	movt	r3, #0
    1094:	e51b200c 	ldr	r2, [fp, #-12]
    1098:	e5832000 	str	r2, [r3]
    109c:	e301333c 	movw	r3, #4924	; 0x133c
    10a0:	e3403000 	movt	r3, #0
    10a4:	e5932000 	ldr	r2, [r3]
    10a8:	e3013334 	movw	r3, #4916	; 0x1334
    10ac:	e3403000 	movt	r3, #0
    10b0:	e5832000 	str	r2, [r3]
        base.s.size = 0;
    10b4:	e3013334 	movw	r3, #4916	; 0x1334
    10b8:	e3403000 	movt	r3, #0
    10bc:	e3a02000 	mov	r2, #0
    10c0:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10c4:	e51b300c 	ldr	r3, [fp, #-12]
    10c8:	e5933000 	ldr	r3, [r3]
    10cc:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
    10d0:	e51b3008 	ldr	r3, [fp, #-8]
    10d4:	e5932004 	ldr	r2, [r3, #4]
    10d8:	e51b3010 	ldr	r3, [fp, #-16]
    10dc:	e1520003 	cmp	r2, r3
    10e0:	3a00001f 	bcc	1164 <malloc+0x124>
            if(p->s.size == nunits)
    10e4:	e51b3008 	ldr	r3, [fp, #-8]
    10e8:	e5932004 	ldr	r2, [r3, #4]
    10ec:	e51b3010 	ldr	r3, [fp, #-16]
    10f0:	e1520003 	cmp	r2, r3
    10f4:	1a000004 	bne	110c <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    10f8:	e51b3008 	ldr	r3, [fp, #-8]
    10fc:	e5932000 	ldr	r2, [r3]
    1100:	e51b300c 	ldr	r3, [fp, #-12]
    1104:	e5832000 	str	r2, [r3]
    1108:	ea00000e 	b	1148 <malloc+0x108>
            else {
                p->s.size -= nunits;
    110c:	e51b3008 	ldr	r3, [fp, #-8]
    1110:	e5932004 	ldr	r2, [r3, #4]
    1114:	e51b3010 	ldr	r3, [fp, #-16]
    1118:	e0632002 	rsb	r2, r3, r2
    111c:	e51b3008 	ldr	r3, [fp, #-8]
    1120:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    1124:	e51b3008 	ldr	r3, [fp, #-8]
    1128:	e5933004 	ldr	r3, [r3, #4]
    112c:	e1a03183 	lsl	r3, r3, #3
    1130:	e51b2008 	ldr	r2, [fp, #-8]
    1134:	e0823003 	add	r3, r2, r3
    1138:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    113c:	e51b3008 	ldr	r3, [fp, #-8]
    1140:	e51b2010 	ldr	r2, [fp, #-16]
    1144:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1148:	e301333c 	movw	r3, #4924	; 0x133c
    114c:	e3403000 	movt	r3, #0
    1150:	e51b200c 	ldr	r2, [fp, #-12]
    1154:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    1158:	e51b3008 	ldr	r3, [fp, #-8]
    115c:	e2833008 	add	r3, r3, #8
    1160:	ea000013 	b	11b4 <malloc+0x174>
        }
        if(p == freep)
    1164:	e301333c 	movw	r3, #4924	; 0x133c
    1168:	e3403000 	movt	r3, #0
    116c:	e5933000 	ldr	r3, [r3]
    1170:	e51b2008 	ldr	r2, [fp, #-8]
    1174:	e1520003 	cmp	r2, r3
    1178:	1a000007 	bne	119c <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    117c:	e51b0010 	ldr	r0, [fp, #-16]
    1180:	ebffff8b 	bl	fb4 <morecore>
    1184:	e50b0008 	str	r0, [fp, #-8]
    1188:	e51b3008 	ldr	r3, [fp, #-8]
    118c:	e3530000 	cmp	r3, #0
    1190:	1a000001 	bne	119c <malloc+0x15c>
                return 0;
    1194:	e3a03000 	mov	r3, #0
    1198:	ea000005 	b	11b4 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    119c:	e51b3008 	ldr	r3, [fp, #-8]
    11a0:	e50b300c 	str	r3, [fp, #-12]
    11a4:	e51b3008 	ldr	r3, [fp, #-8]
    11a8:	e5933000 	ldr	r3, [r3]
    11ac:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    11b0:	eaffffc6 	b	10d0 <malloc+0x90>
}
    11b4:	e1a00003 	mov	r0, r3
    11b8:	e24bd004 	sub	sp, fp, #4
    11bc:	e8bd8800 	pop	{fp, pc}

000011c0 <__aeabi_uidiv>:
    11c0:	e2512001 	subs	r2, r1, #1
    11c4:	012fff1e 	bxeq	lr
    11c8:	3a000036 	bcc	12a8 <__aeabi_uidiv+0xe8>
    11cc:	e1500001 	cmp	r0, r1
    11d0:	9a000022 	bls	1260 <__aeabi_uidiv+0xa0>
    11d4:	e1110002 	tst	r1, r2
    11d8:	0a000023 	beq	126c <__aeabi_uidiv+0xac>
    11dc:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    11e0:	01a01181 	lsleq	r1, r1, #3
    11e4:	03a03008 	moveq	r3, #8
    11e8:	13a03001 	movne	r3, #1
    11ec:	e3510201 	cmp	r1, #268435456	; 0x10000000
    11f0:	31510000 	cmpcc	r1, r0
    11f4:	31a01201 	lslcc	r1, r1, #4
    11f8:	31a03203 	lslcc	r3, r3, #4
    11fc:	3afffffa 	bcc	11ec <__aeabi_uidiv+0x2c>
    1200:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1204:	31510000 	cmpcc	r1, r0
    1208:	31a01081 	lslcc	r1, r1, #1
    120c:	31a03083 	lslcc	r3, r3, #1
    1210:	3afffffa 	bcc	1200 <__aeabi_uidiv+0x40>
    1214:	e3a02000 	mov	r2, #0
    1218:	e1500001 	cmp	r0, r1
    121c:	20400001 	subcs	r0, r0, r1
    1220:	21822003 	orrcs	r2, r2, r3
    1224:	e15000a1 	cmp	r0, r1, lsr #1
    1228:	204000a1 	subcs	r0, r0, r1, lsr #1
    122c:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1230:	e1500121 	cmp	r0, r1, lsr #2
    1234:	20400121 	subcs	r0, r0, r1, lsr #2
    1238:	21822123 	orrcs	r2, r2, r3, lsr #2
    123c:	e15001a1 	cmp	r0, r1, lsr #3
    1240:	204001a1 	subcs	r0, r0, r1, lsr #3
    1244:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1248:	e3500000 	cmp	r0, #0
    124c:	11b03223 	lsrsne	r3, r3, #4
    1250:	11a01221 	lsrne	r1, r1, #4
    1254:	1affffef 	bne	1218 <__aeabi_uidiv+0x58>
    1258:	e1a00002 	mov	r0, r2
    125c:	e12fff1e 	bx	lr
    1260:	03a00001 	moveq	r0, #1
    1264:	13a00000 	movne	r0, #0
    1268:	e12fff1e 	bx	lr
    126c:	e3510801 	cmp	r1, #65536	; 0x10000
    1270:	21a01821 	lsrcs	r1, r1, #16
    1274:	23a02010 	movcs	r2, #16
    1278:	33a02000 	movcc	r2, #0
    127c:	e3510c01 	cmp	r1, #256	; 0x100
    1280:	21a01421 	lsrcs	r1, r1, #8
    1284:	22822008 	addcs	r2, r2, #8
    1288:	e3510010 	cmp	r1, #16
    128c:	21a01221 	lsrcs	r1, r1, #4
    1290:	22822004 	addcs	r2, r2, #4
    1294:	e3510004 	cmp	r1, #4
    1298:	82822003 	addhi	r2, r2, #3
    129c:	908220a1 	addls	r2, r2, r1, lsr #1
    12a0:	e1a00230 	lsr	r0, r0, r2
    12a4:	e12fff1e 	bx	lr
    12a8:	e3500000 	cmp	r0, #0
    12ac:	13e00000 	mvnne	r0, #0
    12b0:	ea000007 	b	12d4 <__aeabi_idiv0>

000012b4 <__aeabi_uidivmod>:
    12b4:	e3510000 	cmp	r1, #0
    12b8:	0afffffa 	beq	12a8 <__aeabi_uidiv+0xe8>
    12bc:	e92d4003 	push	{r0, r1, lr}
    12c0:	ebffffbe 	bl	11c0 <__aeabi_uidiv>
    12c4:	e8bd4006 	pop	{r1, r2, lr}
    12c8:	e0030092 	mul	r3, r2, r0
    12cc:	e0411003 	sub	r1, r1, r3
    12d0:	e12fff1e 	bx	lr

000012d4 <__aeabi_idiv0>:
    12d4:	e12fff1e 	bx	lr
