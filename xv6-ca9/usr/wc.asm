
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
      50:	e301331c 	movw	r3, #4892	; 0x131c
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
      78:	e301331c 	movw	r3, #4892	; 0x131c
      7c:	e3403000 	movt	r3, #0
      80:	e51b2008 	ldr	r2, [fp, #-8]
      84:	e0833002 	add	r3, r3, r2
      88:	e5d33000 	ldrb	r3, [r3]
      8c:	e30102b4 	movw	r0, #4788	; 0x12b4
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
      f4:	e301131c 	movw	r1, #4892	; 0x131c
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
     124:	e30112bc 	movw	r1, #4796	; 0x12bc
     128:	e3401000 	movt	r1, #0
     12c:	eb0002aa 	bl	bdc <printf>
        exit();
     130:	eb000191 	bl	77c <exit>
    }
    printf(1, "%d %d %d %s\n", l, w, c, name);
     134:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     138:	e58d3000 	str	r3, [sp]
     13c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     140:	e58d3004 	str	r3, [sp, #4]
     144:	e3a00001 	mov	r0, #1
     148:	e30112cc 	movw	r1, #4812	; 0x12cc
     14c:	e3401000 	movt	r1, #0
     150:	e51b200c 	ldr	r2, [fp, #-12]
     154:	e51b3010 	ldr	r3, [fp, #-16]
     158:	eb00029f 	bl	bdc <printf>
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
     188:	e30112dc 	movw	r1, #4828	; 0x12dc
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
     1ec:	e30112e0 	movw	r1, #4832	; 0x12e0
     1f0:	e3401000 	movt	r1, #0
     1f4:	e1a02003 	mov	r2, r3
     1f8:	eb000277 	bl	bdc <printf>
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

00000a4c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     a4c:	e92d4800 	push	{fp, lr}
     a50:	e28db004 	add	fp, sp, #4
     a54:	e24dd008 	sub	sp, sp, #8
     a58:	e50b0008 	str	r0, [fp, #-8]
     a5c:	e1a03001 	mov	r3, r1
     a60:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     a64:	e51b0008 	ldr	r0, [fp, #-8]
     a68:	e24b3009 	sub	r3, fp, #9
     a6c:	e1a01003 	mov	r1, r3
     a70:	e3a02001 	mov	r2, #1
     a74:	ebffff64 	bl	80c <write>
}
     a78:	e24bd004 	sub	sp, fp, #4
     a7c:	e8bd8800 	pop	{fp, pc}

00000a80 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     a80:	e92d4800 	push	{fp, lr}
     a84:	e28db004 	add	fp, sp, #4
     a88:	e24dd030 	sub	sp, sp, #48	; 0x30
     a8c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     a90:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     a94:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     a98:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     a9c:	e3a03000 	mov	r3, #0
     aa0:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     aa4:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     aa8:	e3530000 	cmp	r3, #0
     aac:	0a000008 	beq	ad4 <printint+0x54>
     ab0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     ab4:	e3530000 	cmp	r3, #0
     ab8:	aa000005 	bge	ad4 <printint+0x54>
        neg = 1;
     abc:	e3a03001 	mov	r3, #1
     ac0:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     ac4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     ac8:	e2633000 	rsb	r3, r3, #0
     acc:	e50b3010 	str	r3, [fp, #-16]
     ad0:	ea000001 	b	adc <printint+0x5c>
    } else {
        x = xx;
     ad4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     ad8:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     adc:	e3a03000 	mov	r3, #0
     ae0:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     ae4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     ae8:	e51b2010 	ldr	r2, [fp, #-16]
     aec:	e1a00002 	mov	r0, r2
     af0:	e1a01003 	mov	r1, r3
     af4:	eb0001e5 	bl	1290 <__aeabi_uidivmod>
     af8:	e1a03001 	mov	r3, r1
     afc:	e1a02003 	mov	r2, r3
     b00:	e30132fc 	movw	r3, #4860	; 0x12fc
     b04:	e3403000 	movt	r3, #0
     b08:	e7d32002 	ldrb	r2, [r3, r2]
     b0c:	e3e0001b 	mvn	r0, #27
     b10:	e51b3008 	ldr	r3, [fp, #-8]
     b14:	e24bc004 	sub	ip, fp, #4
     b18:	e08c1003 	add	r1, ip, r3
     b1c:	e1a03000 	mov	r3, r0
     b20:	e0813003 	add	r3, r1, r3
     b24:	e5c32000 	strb	r2, [r3]
     b28:	e51b3008 	ldr	r3, [fp, #-8]
     b2c:	e2833001 	add	r3, r3, #1
     b30:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     b34:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     b38:	e51b0010 	ldr	r0, [fp, #-16]
     b3c:	e1a01003 	mov	r1, r3
     b40:	eb000195 	bl	119c <__aeabi_uidiv>
     b44:	e1a03000 	mov	r3, r0
     b48:	e50b3010 	str	r3, [fp, #-16]
     b4c:	e51b3010 	ldr	r3, [fp, #-16]
     b50:	e3530000 	cmp	r3, #0
     b54:	1affffe2 	bne	ae4 <printint+0x64>
    if(neg)
     b58:	e51b300c 	ldr	r3, [fp, #-12]
     b5c:	e3530000 	cmp	r3, #0
     b60:	0a000015 	beq	bbc <printint+0x13c>
        buf[i++] = '-';
     b64:	e3e0101b 	mvn	r1, #27
     b68:	e51b3008 	ldr	r3, [fp, #-8]
     b6c:	e24b0004 	sub	r0, fp, #4
     b70:	e0802003 	add	r2, r0, r3
     b74:	e1a03001 	mov	r3, r1
     b78:	e0823003 	add	r3, r2, r3
     b7c:	e3a0202d 	mov	r2, #45	; 0x2d
     b80:	e5c32000 	strb	r2, [r3]
     b84:	e51b3008 	ldr	r3, [fp, #-8]
     b88:	e2833001 	add	r3, r3, #1
     b8c:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     b90:	ea000009 	b	bbc <printint+0x13c>
        putc(fd, buf[i]);
     b94:	e3e0101b 	mvn	r1, #27
     b98:	e51b3008 	ldr	r3, [fp, #-8]
     b9c:	e24bc004 	sub	ip, fp, #4
     ba0:	e08c2003 	add	r2, ip, r3
     ba4:	e1a03001 	mov	r3, r1
     ba8:	e0823003 	add	r3, r2, r3
     bac:	e5d33000 	ldrb	r3, [r3]
     bb0:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     bb4:	e1a01003 	mov	r1, r3
     bb8:	ebffffa3 	bl	a4c <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     bbc:	e51b3008 	ldr	r3, [fp, #-8]
     bc0:	e2433001 	sub	r3, r3, #1
     bc4:	e50b3008 	str	r3, [fp, #-8]
     bc8:	e51b3008 	ldr	r3, [fp, #-8]
     bcc:	e3530000 	cmp	r3, #0
     bd0:	aaffffef 	bge	b94 <printint+0x114>
        putc(fd, buf[i]);
}
     bd4:	e24bd004 	sub	sp, fp, #4
     bd8:	e8bd8800 	pop	{fp, pc}

00000bdc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     bdc:	e92d000e 	push	{r1, r2, r3}
     be0:	e92d4800 	push	{fp, lr}
     be4:	e28db004 	add	fp, sp, #4
     be8:	e24dd024 	sub	sp, sp, #36	; 0x24
     bec:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     bf0:	e3a03000 	mov	r3, #0
     bf4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     bf8:	e28b3008 	add	r3, fp, #8
     bfc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     c00:	e3a03000 	mov	r3, #0
     c04:	e50b3010 	str	r3, [fp, #-16]
     c08:	ea000077 	b	dec <printf+0x210>
        c = fmt[i] & 0xff;
     c0c:	e59b2004 	ldr	r2, [fp, #4]
     c10:	e51b3010 	ldr	r3, [fp, #-16]
     c14:	e0823003 	add	r3, r2, r3
     c18:	e5d33000 	ldrb	r3, [r3]
     c1c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     c20:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     c24:	e3530000 	cmp	r3, #0
     c28:	1a00000b 	bne	c5c <printf+0x80>
            if(c == '%'){
     c2c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c30:	e3530025 	cmp	r3, #37	; 0x25
     c34:	1a000002 	bne	c44 <printf+0x68>
                state = '%';
     c38:	e3a03025 	mov	r3, #37	; 0x25
     c3c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     c40:	ea000066 	b	de0 <printf+0x204>
            } else {
                putc(fd, c);
     c44:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c48:	e6ef3073 	uxtb	r3, r3
     c4c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c50:	e1a01003 	mov	r1, r3
     c54:	ebffff7c 	bl	a4c <putc>
     c58:	ea000060 	b	de0 <printf+0x204>
            }
        } else if(state == '%'){
     c5c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     c60:	e3530025 	cmp	r3, #37	; 0x25
     c64:	1a00005d 	bne	de0 <printf+0x204>
            if(c == 'd'){
     c68:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c6c:	e3530064 	cmp	r3, #100	; 0x64
     c70:	1a00000a 	bne	ca0 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     c74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c78:	e5933000 	ldr	r3, [r3]
     c7c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c80:	e1a01003 	mov	r1, r3
     c84:	e3a0200a 	mov	r2, #10
     c88:	e3a03001 	mov	r3, #1
     c8c:	ebffff7b 	bl	a80 <printint>
                ap++;
     c90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c94:	e2833004 	add	r3, r3, #4
     c98:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     c9c:	ea00004d 	b	dd8 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     ca0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ca4:	e3530078 	cmp	r3, #120	; 0x78
     ca8:	0a000002 	beq	cb8 <printf+0xdc>
     cac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cb0:	e3530070 	cmp	r3, #112	; 0x70
     cb4:	1a00000a 	bne	ce4 <printf+0x108>
                printint(fd, *ap, 16, 0);
     cb8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cbc:	e5933000 	ldr	r3, [r3]
     cc0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cc4:	e1a01003 	mov	r1, r3
     cc8:	e3a02010 	mov	r2, #16
     ccc:	e3a03000 	mov	r3, #0
     cd0:	ebffff6a 	bl	a80 <printint>
                ap++;
     cd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cd8:	e2833004 	add	r3, r3, #4
     cdc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     ce0:	ea00003c 	b	dd8 <printf+0x1fc>
            } else if(c == 's'){
     ce4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ce8:	e3530073 	cmp	r3, #115	; 0x73
     cec:	1a00001b 	bne	d60 <printf+0x184>
                s = (char*)*ap;
     cf0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cf4:	e5933000 	ldr	r3, [r3]
     cf8:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     cfc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     d00:	e2833004 	add	r3, r3, #4
     d04:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     d08:	e51b300c 	ldr	r3, [fp, #-12]
     d0c:	e3530000 	cmp	r3, #0
     d10:	1a00000c 	bne	d48 <printf+0x16c>
                    s = "(null)";
     d14:	e30132f4 	movw	r3, #4852	; 0x12f4
     d18:	e3403000 	movt	r3, #0
     d1c:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     d20:	ea000008 	b	d48 <printf+0x16c>
                    putc(fd, *s);
     d24:	e51b300c 	ldr	r3, [fp, #-12]
     d28:	e5d33000 	ldrb	r3, [r3]
     d2c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     d30:	e1a01003 	mov	r1, r3
     d34:	ebffff44 	bl	a4c <putc>
                    s++;
     d38:	e51b300c 	ldr	r3, [fp, #-12]
     d3c:	e2833001 	add	r3, r3, #1
     d40:	e50b300c 	str	r3, [fp, #-12]
     d44:	ea000000 	b	d4c <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     d48:	e1a00000 	nop			; (mov r0, r0)
     d4c:	e51b300c 	ldr	r3, [fp, #-12]
     d50:	e5d33000 	ldrb	r3, [r3]
     d54:	e3530000 	cmp	r3, #0
     d58:	1afffff1 	bne	d24 <printf+0x148>
     d5c:	ea00001d 	b	dd8 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     d60:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     d64:	e3530063 	cmp	r3, #99	; 0x63
     d68:	1a000009 	bne	d94 <printf+0x1b8>
                putc(fd, *ap);
     d6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     d70:	e5933000 	ldr	r3, [r3]
     d74:	e6ef3073 	uxtb	r3, r3
     d78:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     d7c:	e1a01003 	mov	r1, r3
     d80:	ebffff31 	bl	a4c <putc>
                ap++;
     d84:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     d88:	e2833004 	add	r3, r3, #4
     d8c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     d90:	ea000010 	b	dd8 <printf+0x1fc>
            } else if(c == '%'){
     d94:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     d98:	e3530025 	cmp	r3, #37	; 0x25
     d9c:	1a000005 	bne	db8 <printf+0x1dc>
                putc(fd, c);
     da0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     da4:	e6ef3073 	uxtb	r3, r3
     da8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     dac:	e1a01003 	mov	r1, r3
     db0:	ebffff25 	bl	a4c <putc>
     db4:	ea000007 	b	dd8 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     db8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     dbc:	e3a01025 	mov	r1, #37	; 0x25
     dc0:	ebffff21 	bl	a4c <putc>
                putc(fd, c);
     dc4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     dc8:	e6ef3073 	uxtb	r3, r3
     dcc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     dd0:	e1a01003 	mov	r1, r3
     dd4:	ebffff1c 	bl	a4c <putc>
            }
            state = 0;
     dd8:	e3a03000 	mov	r3, #0
     ddc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     de0:	e51b3010 	ldr	r3, [fp, #-16]
     de4:	e2833001 	add	r3, r3, #1
     de8:	e50b3010 	str	r3, [fp, #-16]
     dec:	e59b2004 	ldr	r2, [fp, #4]
     df0:	e51b3010 	ldr	r3, [fp, #-16]
     df4:	e0823003 	add	r3, r2, r3
     df8:	e5d33000 	ldrb	r3, [r3]
     dfc:	e3530000 	cmp	r3, #0
     e00:	1affff81 	bne	c0c <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     e04:	e24bd004 	sub	sp, fp, #4
     e08:	e8bd4800 	pop	{fp, lr}
     e0c:	e28dd00c 	add	sp, sp, #12
     e10:	e12fff1e 	bx	lr

00000e14 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e14:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     e18:	e28db000 	add	fp, sp, #0
     e1c:	e24dd014 	sub	sp, sp, #20
     e20:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     e24:	e51b3010 	ldr	r3, [fp, #-16]
     e28:	e2433008 	sub	r3, r3, #8
     e2c:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e30:	e3013318 	movw	r3, #4888	; 0x1318
     e34:	e3403000 	movt	r3, #0
     e38:	e5933000 	ldr	r3, [r3]
     e3c:	e50b3008 	str	r3, [fp, #-8]
     e40:	ea000010 	b	e88 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e44:	e51b3008 	ldr	r3, [fp, #-8]
     e48:	e5932000 	ldr	r2, [r3]
     e4c:	e51b3008 	ldr	r3, [fp, #-8]
     e50:	e1520003 	cmp	r2, r3
     e54:	8a000008 	bhi	e7c <free+0x68>
     e58:	e51b200c 	ldr	r2, [fp, #-12]
     e5c:	e51b3008 	ldr	r3, [fp, #-8]
     e60:	e1520003 	cmp	r2, r3
     e64:	8a000010 	bhi	eac <free+0x98>
     e68:	e51b3008 	ldr	r3, [fp, #-8]
     e6c:	e5932000 	ldr	r2, [r3]
     e70:	e51b300c 	ldr	r3, [fp, #-12]
     e74:	e1520003 	cmp	r2, r3
     e78:	8a00000b 	bhi	eac <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e7c:	e51b3008 	ldr	r3, [fp, #-8]
     e80:	e5933000 	ldr	r3, [r3]
     e84:	e50b3008 	str	r3, [fp, #-8]
     e88:	e51b200c 	ldr	r2, [fp, #-12]
     e8c:	e51b3008 	ldr	r3, [fp, #-8]
     e90:	e1520003 	cmp	r2, r3
     e94:	9affffea 	bls	e44 <free+0x30>
     e98:	e51b3008 	ldr	r3, [fp, #-8]
     e9c:	e5932000 	ldr	r2, [r3]
     ea0:	e51b300c 	ldr	r3, [fp, #-12]
     ea4:	e1520003 	cmp	r2, r3
     ea8:	9affffe5 	bls	e44 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     eac:	e51b300c 	ldr	r3, [fp, #-12]
     eb0:	e5933004 	ldr	r3, [r3, #4]
     eb4:	e1a03183 	lsl	r3, r3, #3
     eb8:	e51b200c 	ldr	r2, [fp, #-12]
     ebc:	e0822003 	add	r2, r2, r3
     ec0:	e51b3008 	ldr	r3, [fp, #-8]
     ec4:	e5933000 	ldr	r3, [r3]
     ec8:	e1520003 	cmp	r2, r3
     ecc:	1a00000d 	bne	f08 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     ed0:	e51b300c 	ldr	r3, [fp, #-12]
     ed4:	e5932004 	ldr	r2, [r3, #4]
     ed8:	e51b3008 	ldr	r3, [fp, #-8]
     edc:	e5933000 	ldr	r3, [r3]
     ee0:	e5933004 	ldr	r3, [r3, #4]
     ee4:	e0822003 	add	r2, r2, r3
     ee8:	e51b300c 	ldr	r3, [fp, #-12]
     eec:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     ef0:	e51b3008 	ldr	r3, [fp, #-8]
     ef4:	e5933000 	ldr	r3, [r3]
     ef8:	e5932000 	ldr	r2, [r3]
     efc:	e51b300c 	ldr	r3, [fp, #-12]
     f00:	e5832000 	str	r2, [r3]
     f04:	ea000003 	b	f18 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     f08:	e51b3008 	ldr	r3, [fp, #-8]
     f0c:	e5932000 	ldr	r2, [r3]
     f10:	e51b300c 	ldr	r3, [fp, #-12]
     f14:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     f18:	e51b3008 	ldr	r3, [fp, #-8]
     f1c:	e5933004 	ldr	r3, [r3, #4]
     f20:	e1a03183 	lsl	r3, r3, #3
     f24:	e51b2008 	ldr	r2, [fp, #-8]
     f28:	e0822003 	add	r2, r2, r3
     f2c:	e51b300c 	ldr	r3, [fp, #-12]
     f30:	e1520003 	cmp	r2, r3
     f34:	1a00000b 	bne	f68 <free+0x154>
        p->s.size += bp->s.size;
     f38:	e51b3008 	ldr	r3, [fp, #-8]
     f3c:	e5932004 	ldr	r2, [r3, #4]
     f40:	e51b300c 	ldr	r3, [fp, #-12]
     f44:	e5933004 	ldr	r3, [r3, #4]
     f48:	e0822003 	add	r2, r2, r3
     f4c:	e51b3008 	ldr	r3, [fp, #-8]
     f50:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     f54:	e51b300c 	ldr	r3, [fp, #-12]
     f58:	e5932000 	ldr	r2, [r3]
     f5c:	e51b3008 	ldr	r3, [fp, #-8]
     f60:	e5832000 	str	r2, [r3]
     f64:	ea000002 	b	f74 <free+0x160>
    } else
        p->s.ptr = bp;
     f68:	e51b3008 	ldr	r3, [fp, #-8]
     f6c:	e51b200c 	ldr	r2, [fp, #-12]
     f70:	e5832000 	str	r2, [r3]
    freep = p;
     f74:	e3013318 	movw	r3, #4888	; 0x1318
     f78:	e3403000 	movt	r3, #0
     f7c:	e51b2008 	ldr	r2, [fp, #-8]
     f80:	e5832000 	str	r2, [r3]
}
     f84:	e28bd000 	add	sp, fp, #0
     f88:	e8bd0800 	pop	{fp}
     f8c:	e12fff1e 	bx	lr

00000f90 <morecore>:

static Header*
morecore(uint nu)
{
     f90:	e92d4800 	push	{fp, lr}
     f94:	e28db004 	add	fp, sp, #4
     f98:	e24dd010 	sub	sp, sp, #16
     f9c:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     fa0:	e51b2010 	ldr	r2, [fp, #-16]
     fa4:	e3003fff 	movw	r3, #4095	; 0xfff
     fa8:	e1520003 	cmp	r2, r3
     fac:	8a000001 	bhi	fb8 <morecore+0x28>
        nu = 4096;
     fb0:	e3a03a01 	mov	r3, #4096	; 0x1000
     fb4:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     fb8:	e51b3010 	ldr	r3, [fp, #-16]
     fbc:	e1a03183 	lsl	r3, r3, #3
     fc0:	e1a00003 	mov	r0, r3
     fc4:	ebfffe85 	bl	9e0 <sbrk>
     fc8:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     fcc:	e51b3008 	ldr	r3, [fp, #-8]
     fd0:	e3730001 	cmn	r3, #1
     fd4:	1a000001 	bne	fe0 <morecore+0x50>
        return 0;
     fd8:	e3a03000 	mov	r3, #0
     fdc:	ea00000b 	b	1010 <morecore+0x80>
    hp = (Header*)p;
     fe0:	e51b3008 	ldr	r3, [fp, #-8]
     fe4:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     fe8:	e51b300c 	ldr	r3, [fp, #-12]
     fec:	e51b2010 	ldr	r2, [fp, #-16]
     ff0:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     ff4:	e51b300c 	ldr	r3, [fp, #-12]
     ff8:	e2833008 	add	r3, r3, #8
     ffc:	e1a00003 	mov	r0, r3
    1000:	ebffff83 	bl	e14 <free>
    return freep;
    1004:	e3013318 	movw	r3, #4888	; 0x1318
    1008:	e3403000 	movt	r3, #0
    100c:	e5933000 	ldr	r3, [r3]
}
    1010:	e1a00003 	mov	r0, r3
    1014:	e24bd004 	sub	sp, fp, #4
    1018:	e8bd8800 	pop	{fp, pc}

0000101c <malloc>:

void*
malloc(uint nbytes)
{
    101c:	e92d4800 	push	{fp, lr}
    1020:	e28db004 	add	fp, sp, #4
    1024:	e24dd018 	sub	sp, sp, #24
    1028:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    102c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1030:	e2833007 	add	r3, r3, #7
    1034:	e1a031a3 	lsr	r3, r3, #3
    1038:	e2833001 	add	r3, r3, #1
    103c:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
    1040:	e3013318 	movw	r3, #4888	; 0x1318
    1044:	e3403000 	movt	r3, #0
    1048:	e5933000 	ldr	r3, [r3]
    104c:	e50b300c 	str	r3, [fp, #-12]
    1050:	e51b300c 	ldr	r3, [fp, #-12]
    1054:	e3530000 	cmp	r3, #0
    1058:	1a000010 	bne	10a0 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
    105c:	e3013310 	movw	r3, #4880	; 0x1310
    1060:	e3403000 	movt	r3, #0
    1064:	e50b300c 	str	r3, [fp, #-12]
    1068:	e3013318 	movw	r3, #4888	; 0x1318
    106c:	e3403000 	movt	r3, #0
    1070:	e51b200c 	ldr	r2, [fp, #-12]
    1074:	e5832000 	str	r2, [r3]
    1078:	e3013318 	movw	r3, #4888	; 0x1318
    107c:	e3403000 	movt	r3, #0
    1080:	e5932000 	ldr	r2, [r3]
    1084:	e3013310 	movw	r3, #4880	; 0x1310
    1088:	e3403000 	movt	r3, #0
    108c:	e5832000 	str	r2, [r3]
        base.s.size = 0;
    1090:	e3013310 	movw	r3, #4880	; 0x1310
    1094:	e3403000 	movt	r3, #0
    1098:	e3a02000 	mov	r2, #0
    109c:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10a0:	e51b300c 	ldr	r3, [fp, #-12]
    10a4:	e5933000 	ldr	r3, [r3]
    10a8:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
    10ac:	e51b3008 	ldr	r3, [fp, #-8]
    10b0:	e5932004 	ldr	r2, [r3, #4]
    10b4:	e51b3010 	ldr	r3, [fp, #-16]
    10b8:	e1520003 	cmp	r2, r3
    10bc:	3a00001f 	bcc	1140 <malloc+0x124>
            if(p->s.size == nunits)
    10c0:	e51b3008 	ldr	r3, [fp, #-8]
    10c4:	e5932004 	ldr	r2, [r3, #4]
    10c8:	e51b3010 	ldr	r3, [fp, #-16]
    10cc:	e1520003 	cmp	r2, r3
    10d0:	1a000004 	bne	10e8 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    10d4:	e51b3008 	ldr	r3, [fp, #-8]
    10d8:	e5932000 	ldr	r2, [r3]
    10dc:	e51b300c 	ldr	r3, [fp, #-12]
    10e0:	e5832000 	str	r2, [r3]
    10e4:	ea00000e 	b	1124 <malloc+0x108>
            else {
                p->s.size -= nunits;
    10e8:	e51b3008 	ldr	r3, [fp, #-8]
    10ec:	e5932004 	ldr	r2, [r3, #4]
    10f0:	e51b3010 	ldr	r3, [fp, #-16]
    10f4:	e0632002 	rsb	r2, r3, r2
    10f8:	e51b3008 	ldr	r3, [fp, #-8]
    10fc:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    1100:	e51b3008 	ldr	r3, [fp, #-8]
    1104:	e5933004 	ldr	r3, [r3, #4]
    1108:	e1a03183 	lsl	r3, r3, #3
    110c:	e51b2008 	ldr	r2, [fp, #-8]
    1110:	e0823003 	add	r3, r2, r3
    1114:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    1118:	e51b3008 	ldr	r3, [fp, #-8]
    111c:	e51b2010 	ldr	r2, [fp, #-16]
    1120:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1124:	e3013318 	movw	r3, #4888	; 0x1318
    1128:	e3403000 	movt	r3, #0
    112c:	e51b200c 	ldr	r2, [fp, #-12]
    1130:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    1134:	e51b3008 	ldr	r3, [fp, #-8]
    1138:	e2833008 	add	r3, r3, #8
    113c:	ea000013 	b	1190 <malloc+0x174>
        }
        if(p == freep)
    1140:	e3013318 	movw	r3, #4888	; 0x1318
    1144:	e3403000 	movt	r3, #0
    1148:	e5933000 	ldr	r3, [r3]
    114c:	e51b2008 	ldr	r2, [fp, #-8]
    1150:	e1520003 	cmp	r2, r3
    1154:	1a000007 	bne	1178 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    1158:	e51b0010 	ldr	r0, [fp, #-16]
    115c:	ebffff8b 	bl	f90 <morecore>
    1160:	e50b0008 	str	r0, [fp, #-8]
    1164:	e51b3008 	ldr	r3, [fp, #-8]
    1168:	e3530000 	cmp	r3, #0
    116c:	1a000001 	bne	1178 <malloc+0x15c>
                return 0;
    1170:	e3a03000 	mov	r3, #0
    1174:	ea000005 	b	1190 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1178:	e51b3008 	ldr	r3, [fp, #-8]
    117c:	e50b300c 	str	r3, [fp, #-12]
    1180:	e51b3008 	ldr	r3, [fp, #-8]
    1184:	e5933000 	ldr	r3, [r3]
    1188:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    118c:	eaffffc6 	b	10ac <malloc+0x90>
}
    1190:	e1a00003 	mov	r0, r3
    1194:	e24bd004 	sub	sp, fp, #4
    1198:	e8bd8800 	pop	{fp, pc}

0000119c <__aeabi_uidiv>:
    119c:	e2512001 	subs	r2, r1, #1
    11a0:	012fff1e 	bxeq	lr
    11a4:	3a000036 	bcc	1284 <__aeabi_uidiv+0xe8>
    11a8:	e1500001 	cmp	r0, r1
    11ac:	9a000022 	bls	123c <__aeabi_uidiv+0xa0>
    11b0:	e1110002 	tst	r1, r2
    11b4:	0a000023 	beq	1248 <__aeabi_uidiv+0xac>
    11b8:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    11bc:	01a01181 	lsleq	r1, r1, #3
    11c0:	03a03008 	moveq	r3, #8
    11c4:	13a03001 	movne	r3, #1
    11c8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    11cc:	31510000 	cmpcc	r1, r0
    11d0:	31a01201 	lslcc	r1, r1, #4
    11d4:	31a03203 	lslcc	r3, r3, #4
    11d8:	3afffffa 	bcc	11c8 <__aeabi_uidiv+0x2c>
    11dc:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    11e0:	31510000 	cmpcc	r1, r0
    11e4:	31a01081 	lslcc	r1, r1, #1
    11e8:	31a03083 	lslcc	r3, r3, #1
    11ec:	3afffffa 	bcc	11dc <__aeabi_uidiv+0x40>
    11f0:	e3a02000 	mov	r2, #0
    11f4:	e1500001 	cmp	r0, r1
    11f8:	20400001 	subcs	r0, r0, r1
    11fc:	21822003 	orrcs	r2, r2, r3
    1200:	e15000a1 	cmp	r0, r1, lsr #1
    1204:	204000a1 	subcs	r0, r0, r1, lsr #1
    1208:	218220a3 	orrcs	r2, r2, r3, lsr #1
    120c:	e1500121 	cmp	r0, r1, lsr #2
    1210:	20400121 	subcs	r0, r0, r1, lsr #2
    1214:	21822123 	orrcs	r2, r2, r3, lsr #2
    1218:	e15001a1 	cmp	r0, r1, lsr #3
    121c:	204001a1 	subcs	r0, r0, r1, lsr #3
    1220:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1224:	e3500000 	cmp	r0, #0
    1228:	11b03223 	lsrsne	r3, r3, #4
    122c:	11a01221 	lsrne	r1, r1, #4
    1230:	1affffef 	bne	11f4 <__aeabi_uidiv+0x58>
    1234:	e1a00002 	mov	r0, r2
    1238:	e12fff1e 	bx	lr
    123c:	03a00001 	moveq	r0, #1
    1240:	13a00000 	movne	r0, #0
    1244:	e12fff1e 	bx	lr
    1248:	e3510801 	cmp	r1, #65536	; 0x10000
    124c:	21a01821 	lsrcs	r1, r1, #16
    1250:	23a02010 	movcs	r2, #16
    1254:	33a02000 	movcc	r2, #0
    1258:	e3510c01 	cmp	r1, #256	; 0x100
    125c:	21a01421 	lsrcs	r1, r1, #8
    1260:	22822008 	addcs	r2, r2, #8
    1264:	e3510010 	cmp	r1, #16
    1268:	21a01221 	lsrcs	r1, r1, #4
    126c:	22822004 	addcs	r2, r2, #4
    1270:	e3510004 	cmp	r1, #4
    1274:	82822003 	addhi	r2, r2, #3
    1278:	908220a1 	addls	r2, r2, r1, lsr #1
    127c:	e1a00230 	lsr	r0, r0, r2
    1280:	e12fff1e 	bx	lr
    1284:	e3500000 	cmp	r0, #0
    1288:	13e00000 	mvnne	r0, #0
    128c:	ea000007 	b	12b0 <__aeabi_idiv0>

00001290 <__aeabi_uidivmod>:
    1290:	e3510000 	cmp	r1, #0
    1294:	0afffffa 	beq	1284 <__aeabi_uidiv+0xe8>
    1298:	e92d4003 	push	{r0, r1, lr}
    129c:	ebffffbe 	bl	119c <__aeabi_uidiv>
    12a0:	e8bd4006 	pop	{r1, r2, lr}
    12a4:	e0030092 	mul	r3, r2, r0
    12a8:	e0411003 	sub	r1, r1, r3
    12ac:	e12fff1e 	bx	lr

000012b0 <__aeabi_idiv0>:
    12b0:	e12fff1e 	bx	lr
