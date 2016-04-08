
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dde22 	sub	sp, sp, #544	; 0x220
       c:	e50b0220 	str	r0, [fp, #-544]	; 0xfffffde0
      10:	e50b1224 	str	r1, [fp, #-548]	; 0xfffffddc
    int fd, i;
    char path[] = "stressfs0";
      14:	e3012230 	movw	r2, #4656	; 0x1230
      18:	e3402000 	movt	r2, #0
      1c:	e24b3018 	sub	r3, fp, #24
      20:	e8920007 	ldm	r2, {r0, r1, r2}
      24:	e8a30003 	stmia	r3!, {r0, r1}
      28:	e1c320b0 	strh	r2, [r3]
    char data[512];
    
    printf(1, "stressfs starting\n");
      2c:	e3a00001 	mov	r0, #1
      30:	e3011208 	movw	r1, #4616	; 0x1208
      34:	e3401000 	movt	r1, #0
      38:	eb0002bc 	bl	b30 <printf>
    memset(data, 'a', sizeof(data));
      3c:	e24b3f86 	sub	r3, fp, #536	; 0x218
      40:	e1a00003 	mov	r0, r3
      44:	e3a01061 	mov	r1, #97	; 0x61
      48:	e3a02c02 	mov	r2, #512	; 0x200
      4c:	eb00009d 	bl	2c8 <memset>
    
    for(i = 0; i < 4; i++)
      50:	e3a03000 	mov	r3, #0
      54:	e50b3008 	str	r3, [fp, #-8]
      58:	ea000006 	b	78 <main+0x78>
        if(fork() > 0)
      5c:	eb000189 	bl	688 <fork>
      60:	e1a03000 	mov	r3, r0
      64:	e3530000 	cmp	r3, #0
      68:	ca000006 	bgt	88 <main+0x88>
    char data[512];
    
    printf(1, "stressfs starting\n");
    memset(data, 'a', sizeof(data));
    
    for(i = 0; i < 4; i++)
      6c:	e51b3008 	ldr	r3, [fp, #-8]
      70:	e2833001 	add	r3, r3, #1
      74:	e50b3008 	str	r3, [fp, #-8]
      78:	e51b3008 	ldr	r3, [fp, #-8]
      7c:	e3530003 	cmp	r3, #3
      80:	dafffff5 	ble	5c <main+0x5c>
      84:	ea000000 	b	8c <main+0x8c>
        if(fork() > 0)
            break;
      88:	e1a00000 	nop			; (mov r0, r0)
    
    printf(1, "write %d\n", i);
      8c:	e3a00001 	mov	r0, #1
      90:	e301121c 	movw	r1, #4636	; 0x121c
      94:	e3401000 	movt	r1, #0
      98:	e51b2008 	ldr	r2, [fp, #-8]
      9c:	eb0002a3 	bl	b30 <printf>
    
    path[8] += i;
      a0:	e55b2010 	ldrb	r2, [fp, #-16]
      a4:	e51b3008 	ldr	r3, [fp, #-8]
      a8:	e6ef3073 	uxtb	r3, r3
      ac:	e0823003 	add	r3, r2, r3
      b0:	e6ef3073 	uxtb	r3, r3
      b4:	e54b3010 	strb	r3, [fp, #-16]
    fd = open(path, O_CREATE | O_RDWR);
      b8:	e24b3018 	sub	r3, fp, #24
      bc:	e1a00003 	mov	r0, r3
      c0:	e3001202 	movw	r1, #514	; 0x202
      c4:	eb0001c0 	bl	7cc <open>
      c8:	e50b000c 	str	r0, [fp, #-12]
    for(i = 0; i < 20; i++)
      cc:	e3a03000 	mov	r3, #0
      d0:	e50b3008 	str	r3, [fp, #-8]
      d4:	ea000007 	b	f8 <main+0xf8>
        //    printf(fd, "%d\n", i);
        write(fd, data, sizeof(data));
      d8:	e51b000c 	ldr	r0, [fp, #-12]
      dc:	e24b3f86 	sub	r3, fp, #536	; 0x218
      e0:	e1a01003 	mov	r1, r3
      e4:	e3a02c02 	mov	r2, #512	; 0x200
      e8:	eb000193 	bl	73c <write>
    
    printf(1, "write %d\n", i);
    
    path[8] += i;
    fd = open(path, O_CREATE | O_RDWR);
    for(i = 0; i < 20; i++)
      ec:	e51b3008 	ldr	r3, [fp, #-8]
      f0:	e2833001 	add	r3, r3, #1
      f4:	e50b3008 	str	r3, [fp, #-8]
      f8:	e51b3008 	ldr	r3, [fp, #-8]
      fc:	e3530013 	cmp	r3, #19
     100:	dafffff4 	ble	d8 <main+0xd8>
        //    printf(fd, "%d\n", i);
        write(fd, data, sizeof(data));
    close(fd);
     104:	e51b000c 	ldr	r0, [fp, #-12]
     108:	eb000194 	bl	760 <close>
    
    printf(1, "read\n");
     10c:	e3a00001 	mov	r0, #1
     110:	e3011228 	movw	r1, #4648	; 0x1228
     114:	e3401000 	movt	r1, #0
     118:	eb000284 	bl	b30 <printf>
    
    fd = open(path, O_RDONLY);
     11c:	e24b3018 	sub	r3, fp, #24
     120:	e1a00003 	mov	r0, r3
     124:	e3a01000 	mov	r1, #0
     128:	eb0001a7 	bl	7cc <open>
     12c:	e50b000c 	str	r0, [fp, #-12]
    for (i = 0; i < 20; i++)
     130:	e3a03000 	mov	r3, #0
     134:	e50b3008 	str	r3, [fp, #-8]
     138:	ea000007 	b	15c <main+0x15c>
        read(fd, data, sizeof(data));
     13c:	e51b000c 	ldr	r0, [fp, #-12]
     140:	e24b3f86 	sub	r3, fp, #536	; 0x218
     144:	e1a01003 	mov	r1, r3
     148:	e3a02c02 	mov	r2, #512	; 0x200
     14c:	eb000171 	bl	718 <read>
    close(fd);
    
    printf(1, "read\n");
    
    fd = open(path, O_RDONLY);
    for (i = 0; i < 20; i++)
     150:	e51b3008 	ldr	r3, [fp, #-8]
     154:	e2833001 	add	r3, r3, #1
     158:	e50b3008 	str	r3, [fp, #-8]
     15c:	e51b3008 	ldr	r3, [fp, #-8]
     160:	e3530013 	cmp	r3, #19
     164:	dafffff4 	ble	13c <main+0x13c>
        read(fd, data, sizeof(data));
    close(fd);
     168:	e51b000c 	ldr	r0, [fp, #-12]
     16c:	eb00017b 	bl	760 <close>
    
    wait();
     170:	eb000156 	bl	6d0 <wait>
    
    exit();
     174:	eb00014c 	bl	6ac <exit>

00000178 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
     178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     17c:	e28db000 	add	fp, sp, #0
     180:	e24dd014 	sub	sp, sp, #20
     184:	e50b0010 	str	r0, [fp, #-16]
     188:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
     18c:	e51b3010 	ldr	r3, [fp, #-16]
     190:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
     194:	e1a00000 	nop			; (mov r0, r0)
     198:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     19c:	e5d32000 	ldrb	r2, [r3]
     1a0:	e51b3010 	ldr	r3, [fp, #-16]
     1a4:	e5c32000 	strb	r2, [r3]
     1a8:	e51b3010 	ldr	r3, [fp, #-16]
     1ac:	e5d33000 	ldrb	r3, [r3]
     1b0:	e3530000 	cmp	r3, #0
     1b4:	03a03000 	moveq	r3, #0
     1b8:	13a03001 	movne	r3, #1
     1bc:	e6ef3073 	uxtb	r3, r3
     1c0:	e51b2010 	ldr	r2, [fp, #-16]
     1c4:	e2822001 	add	r2, r2, #1
     1c8:	e50b2010 	str	r2, [fp, #-16]
     1cc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     1d0:	e2822001 	add	r2, r2, #1
     1d4:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
     1d8:	e3530000 	cmp	r3, #0
     1dc:	1affffed 	bne	198 <strcpy+0x20>
        ;
    return os;
     1e0:	e51b3008 	ldr	r3, [fp, #-8]
}
     1e4:	e1a00003 	mov	r0, r3
     1e8:	e28bd000 	add	sp, fp, #0
     1ec:	e8bd0800 	pop	{fp}
     1f0:	e12fff1e 	bx	lr

000001f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     1f8:	e28db000 	add	fp, sp, #0
     1fc:	e24dd00c 	sub	sp, sp, #12
     200:	e50b0008 	str	r0, [fp, #-8]
     204:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     208:	ea000005 	b	224 <strcmp+0x30>
        p++, q++;
     20c:	e51b3008 	ldr	r3, [fp, #-8]
     210:	e2833001 	add	r3, r3, #1
     214:	e50b3008 	str	r3, [fp, #-8]
     218:	e51b300c 	ldr	r3, [fp, #-12]
     21c:	e2833001 	add	r3, r3, #1
     220:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     224:	e51b3008 	ldr	r3, [fp, #-8]
     228:	e5d33000 	ldrb	r3, [r3]
     22c:	e3530000 	cmp	r3, #0
     230:	0a000005 	beq	24c <strcmp+0x58>
     234:	e51b3008 	ldr	r3, [fp, #-8]
     238:	e5d32000 	ldrb	r2, [r3]
     23c:	e51b300c 	ldr	r3, [fp, #-12]
     240:	e5d33000 	ldrb	r3, [r3]
     244:	e1520003 	cmp	r2, r3
     248:	0affffef 	beq	20c <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     24c:	e51b3008 	ldr	r3, [fp, #-8]
     250:	e5d33000 	ldrb	r3, [r3]
     254:	e1a02003 	mov	r2, r3
     258:	e51b300c 	ldr	r3, [fp, #-12]
     25c:	e5d33000 	ldrb	r3, [r3]
     260:	e0633002 	rsb	r3, r3, r2
}
     264:	e1a00003 	mov	r0, r3
     268:	e28bd000 	add	sp, fp, #0
     26c:	e8bd0800 	pop	{fp}
     270:	e12fff1e 	bx	lr

00000274 <strlen>:

uint
strlen(char *s)
{
     274:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     278:	e28db000 	add	fp, sp, #0
     27c:	e24dd014 	sub	sp, sp, #20
     280:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     284:	e3a03000 	mov	r3, #0
     288:	e50b3008 	str	r3, [fp, #-8]
     28c:	ea000002 	b	29c <strlen+0x28>
     290:	e51b3008 	ldr	r3, [fp, #-8]
     294:	e2833001 	add	r3, r3, #1
     298:	e50b3008 	str	r3, [fp, #-8]
     29c:	e51b3008 	ldr	r3, [fp, #-8]
     2a0:	e51b2010 	ldr	r2, [fp, #-16]
     2a4:	e0823003 	add	r3, r2, r3
     2a8:	e5d33000 	ldrb	r3, [r3]
     2ac:	e3530000 	cmp	r3, #0
     2b0:	1afffff6 	bne	290 <strlen+0x1c>
        ;
    return n;
     2b4:	e51b3008 	ldr	r3, [fp, #-8]
}
     2b8:	e1a00003 	mov	r0, r3
     2bc:	e28bd000 	add	sp, fp, #0
     2c0:	e8bd0800 	pop	{fp}
     2c4:	e12fff1e 	bx	lr

000002c8 <memset>:

void*
memset(void *dst, int v, uint n)
{
     2c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     2cc:	e28db000 	add	fp, sp, #0
     2d0:	e24dd024 	sub	sp, sp, #36	; 0x24
     2d4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     2d8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     2dc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     2e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     2e4:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     2e8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     2ec:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     2f0:	e55b300d 	ldrb	r3, [fp, #-13]
     2f4:	e1a02c03 	lsl	r2, r3, #24
     2f8:	e55b300d 	ldrb	r3, [fp, #-13]
     2fc:	e1a03803 	lsl	r3, r3, #16
     300:	e1822003 	orr	r2, r2, r3
     304:	e55b300d 	ldrb	r3, [fp, #-13]
     308:	e1a03403 	lsl	r3, r3, #8
     30c:	e1822003 	orr	r2, r2, r3
     310:	e55b300d 	ldrb	r3, [fp, #-13]
     314:	e1823003 	orr	r3, r2, r3
     318:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     31c:	ea000008 	b	344 <memset+0x7c>
		*p = c;
     320:	e51b3008 	ldr	r3, [fp, #-8]
     324:	e55b200d 	ldrb	r2, [fp, #-13]
     328:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     32c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     330:	e2433001 	sub	r3, r3, #1
     334:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     338:	e51b3008 	ldr	r3, [fp, #-8]
     33c:	e2833001 	add	r3, r3, #1
     340:	e50b3008 	str	r3, [fp, #-8]
     344:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     348:	e3530000 	cmp	r3, #0
     34c:	0a000003 	beq	360 <memset+0x98>
     350:	e51b3008 	ldr	r3, [fp, #-8]
     354:	e2033003 	and	r3, r3, #3
     358:	e3530000 	cmp	r3, #0
     35c:	1affffef 	bne	320 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     360:	e51b3008 	ldr	r3, [fp, #-8]
     364:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     368:	ea000008 	b	390 <memset+0xc8>
		*p4 = val;
     36c:	e51b300c 	ldr	r3, [fp, #-12]
     370:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     374:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     378:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     37c:	e2433004 	sub	r3, r3, #4
     380:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     384:	e51b300c 	ldr	r3, [fp, #-12]
     388:	e2833004 	add	r3, r3, #4
     38c:	e50b300c 	str	r3, [fp, #-12]
     390:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     394:	e3530003 	cmp	r3, #3
     398:	8afffff3 	bhi	36c <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     39c:	e51b300c 	ldr	r3, [fp, #-12]
     3a0:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     3a4:	ea000008 	b	3cc <memset+0x104>
		*p = c;
     3a8:	e51b3008 	ldr	r3, [fp, #-8]
     3ac:	e55b200d 	ldrb	r2, [fp, #-13]
     3b0:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     3b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     3b8:	e2433001 	sub	r3, r3, #1
     3bc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     3c0:	e51b3008 	ldr	r3, [fp, #-8]
     3c4:	e2833001 	add	r3, r3, #1
     3c8:	e50b3008 	str	r3, [fp, #-8]
     3cc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     3d0:	e3530000 	cmp	r3, #0
     3d4:	1afffff3 	bne	3a8 <memset+0xe0>
		*p = c;
	}

	return dst;
     3d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     3dc:	e1a00003 	mov	r0, r3
     3e0:	e28bd000 	add	sp, fp, #0
     3e4:	e8bd0800 	pop	{fp}
     3e8:	e12fff1e 	bx	lr

000003ec <strchr>:

char*
strchr(const char *s, char c)
{
     3ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     3f0:	e28db000 	add	fp, sp, #0
     3f4:	e24dd00c 	sub	sp, sp, #12
     3f8:	e50b0008 	str	r0, [fp, #-8]
     3fc:	e1a03001 	mov	r3, r1
     400:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     404:	ea000009 	b	430 <strchr+0x44>
        if(*s == c)
     408:	e51b3008 	ldr	r3, [fp, #-8]
     40c:	e5d33000 	ldrb	r3, [r3]
     410:	e55b2009 	ldrb	r2, [fp, #-9]
     414:	e1520003 	cmp	r2, r3
     418:	1a000001 	bne	424 <strchr+0x38>
            return (char*)s;
     41c:	e51b3008 	ldr	r3, [fp, #-8]
     420:	ea000007 	b	444 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     424:	e51b3008 	ldr	r3, [fp, #-8]
     428:	e2833001 	add	r3, r3, #1
     42c:	e50b3008 	str	r3, [fp, #-8]
     430:	e51b3008 	ldr	r3, [fp, #-8]
     434:	e5d33000 	ldrb	r3, [r3]
     438:	e3530000 	cmp	r3, #0
     43c:	1afffff1 	bne	408 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     440:	e3a03000 	mov	r3, #0
}
     444:	e1a00003 	mov	r0, r3
     448:	e28bd000 	add	sp, fp, #0
     44c:	e8bd0800 	pop	{fp}
     450:	e12fff1e 	bx	lr

00000454 <gets>:

char*
gets(char *buf, int max)
{
     454:	e92d4800 	push	{fp, lr}
     458:	e28db004 	add	fp, sp, #4
     45c:	e24dd018 	sub	sp, sp, #24
     460:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     464:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     468:	e3a03000 	mov	r3, #0
     46c:	e50b3008 	str	r3, [fp, #-8]
     470:	ea000016 	b	4d0 <gets+0x7c>
        cc = read(0, &c, 1);
     474:	e3a00000 	mov	r0, #0
     478:	e24b300d 	sub	r3, fp, #13
     47c:	e1a01003 	mov	r1, r3
     480:	e3a02001 	mov	r2, #1
     484:	eb0000a3 	bl	718 <read>
     488:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     48c:	e51b300c 	ldr	r3, [fp, #-12]
     490:	e3530000 	cmp	r3, #0
     494:	da000013 	ble	4e8 <gets+0x94>
            break;
        buf[i++] = c;
     498:	e51b3008 	ldr	r3, [fp, #-8]
     49c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     4a0:	e0823003 	add	r3, r2, r3
     4a4:	e55b200d 	ldrb	r2, [fp, #-13]
     4a8:	e5c32000 	strb	r2, [r3]
     4ac:	e51b3008 	ldr	r3, [fp, #-8]
     4b0:	e2833001 	add	r3, r3, #1
     4b4:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     4b8:	e55b300d 	ldrb	r3, [fp, #-13]
     4bc:	e353000a 	cmp	r3, #10
     4c0:	0a000009 	beq	4ec <gets+0x98>
     4c4:	e55b300d 	ldrb	r3, [fp, #-13]
     4c8:	e353000d 	cmp	r3, #13
     4cc:	0a000006 	beq	4ec <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     4d0:	e51b3008 	ldr	r3, [fp, #-8]
     4d4:	e2832001 	add	r2, r3, #1
     4d8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     4dc:	e1520003 	cmp	r2, r3
     4e0:	baffffe3 	blt	474 <gets+0x20>
     4e4:	ea000000 	b	4ec <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     4e8:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     4ec:	e51b3008 	ldr	r3, [fp, #-8]
     4f0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     4f4:	e0823003 	add	r3, r2, r3
     4f8:	e3a02000 	mov	r2, #0
     4fc:	e5c32000 	strb	r2, [r3]
    return buf;
     500:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     504:	e1a00003 	mov	r0, r3
     508:	e24bd004 	sub	sp, fp, #4
     50c:	e8bd8800 	pop	{fp, pc}

00000510 <stat>:

int
stat(char *n, struct stat *st)
{
     510:	e92d4800 	push	{fp, lr}
     514:	e28db004 	add	fp, sp, #4
     518:	e24dd010 	sub	sp, sp, #16
     51c:	e50b0010 	str	r0, [fp, #-16]
     520:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     524:	e51b0010 	ldr	r0, [fp, #-16]
     528:	e3a01000 	mov	r1, #0
     52c:	eb0000a6 	bl	7cc <open>
     530:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     534:	e51b3008 	ldr	r3, [fp, #-8]
     538:	e3530000 	cmp	r3, #0
     53c:	aa000001 	bge	548 <stat+0x38>
        return -1;
     540:	e3e03000 	mvn	r3, #0
     544:	ea000006 	b	564 <stat+0x54>
    r = fstat(fd, st);
     548:	e51b0008 	ldr	r0, [fp, #-8]
     54c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     550:	eb0000b8 	bl	838 <fstat>
     554:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     558:	e51b0008 	ldr	r0, [fp, #-8]
     55c:	eb00007f 	bl	760 <close>
    return r;
     560:	e51b300c 	ldr	r3, [fp, #-12]
}
     564:	e1a00003 	mov	r0, r3
     568:	e24bd004 	sub	sp, fp, #4
     56c:	e8bd8800 	pop	{fp, pc}

00000570 <atoi>:

int
atoi(const char *s)
{
     570:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     574:	e28db000 	add	fp, sp, #0
     578:	e24dd014 	sub	sp, sp, #20
     57c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     580:	e3a03000 	mov	r3, #0
     584:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     588:	ea00000d 	b	5c4 <atoi+0x54>
        n = n*10 + *s++ - '0';
     58c:	e51b2008 	ldr	r2, [fp, #-8]
     590:	e1a03002 	mov	r3, r2
     594:	e1a03103 	lsl	r3, r3, #2
     598:	e0833002 	add	r3, r3, r2
     59c:	e1a03083 	lsl	r3, r3, #1
     5a0:	e1a02003 	mov	r2, r3
     5a4:	e51b3010 	ldr	r3, [fp, #-16]
     5a8:	e5d33000 	ldrb	r3, [r3]
     5ac:	e0823003 	add	r3, r2, r3
     5b0:	e2433030 	sub	r3, r3, #48	; 0x30
     5b4:	e50b3008 	str	r3, [fp, #-8]
     5b8:	e51b3010 	ldr	r3, [fp, #-16]
     5bc:	e2833001 	add	r3, r3, #1
     5c0:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     5c4:	e51b3010 	ldr	r3, [fp, #-16]
     5c8:	e5d33000 	ldrb	r3, [r3]
     5cc:	e353002f 	cmp	r3, #47	; 0x2f
     5d0:	9a000003 	bls	5e4 <atoi+0x74>
     5d4:	e51b3010 	ldr	r3, [fp, #-16]
     5d8:	e5d33000 	ldrb	r3, [r3]
     5dc:	e3530039 	cmp	r3, #57	; 0x39
     5e0:	9affffe9 	bls	58c <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     5e4:	e51b3008 	ldr	r3, [fp, #-8]
}
     5e8:	e1a00003 	mov	r0, r3
     5ec:	e28bd000 	add	sp, fp, #0
     5f0:	e8bd0800 	pop	{fp}
     5f4:	e12fff1e 	bx	lr

000005f8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     5f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     5fc:	e28db000 	add	fp, sp, #0
     600:	e24dd01c 	sub	sp, sp, #28
     604:	e50b0010 	str	r0, [fp, #-16]
     608:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     60c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     610:	e51b3010 	ldr	r3, [fp, #-16]
     614:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     618:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     61c:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     620:	ea000009 	b	64c <memmove+0x54>
        *dst++ = *src++;
     624:	e51b300c 	ldr	r3, [fp, #-12]
     628:	e5d32000 	ldrb	r2, [r3]
     62c:	e51b3008 	ldr	r3, [fp, #-8]
     630:	e5c32000 	strb	r2, [r3]
     634:	e51b3008 	ldr	r3, [fp, #-8]
     638:	e2833001 	add	r3, r3, #1
     63c:	e50b3008 	str	r3, [fp, #-8]
     640:	e51b300c 	ldr	r3, [fp, #-12]
     644:	e2833001 	add	r3, r3, #1
     648:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     64c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     650:	e3530000 	cmp	r3, #0
     654:	d3a03000 	movle	r3, #0
     658:	c3a03001 	movgt	r3, #1
     65c:	e6ef3073 	uxtb	r3, r3
     660:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     664:	e2422001 	sub	r2, r2, #1
     668:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     66c:	e3530000 	cmp	r3, #0
     670:	1affffeb 	bne	624 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     674:	e51b3010 	ldr	r3, [fp, #-16]
}
     678:	e1a00003 	mov	r0, r3
     67c:	e28bd000 	add	sp, fp, #0
     680:	e8bd0800 	pop	{fp}
     684:	e12fff1e 	bx	lr

00000688 <fork>:
     688:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     68c:	e1a04003 	mov	r4, r3
     690:	e1a03002 	mov	r3, r2
     694:	e1a02001 	mov	r2, r1
     698:	e1a01000 	mov	r1, r0
     69c:	e3a00001 	mov	r0, #1
     6a0:	ef000000 	svc	0x00000000
     6a4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6a8:	e12fff1e 	bx	lr

000006ac <exit>:
     6ac:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6b0:	e1a04003 	mov	r4, r3
     6b4:	e1a03002 	mov	r3, r2
     6b8:	e1a02001 	mov	r2, r1
     6bc:	e1a01000 	mov	r1, r0
     6c0:	e3a00002 	mov	r0, #2
     6c4:	ef000000 	svc	0x00000000
     6c8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6cc:	e12fff1e 	bx	lr

000006d0 <wait>:
     6d0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6d4:	e1a04003 	mov	r4, r3
     6d8:	e1a03002 	mov	r3, r2
     6dc:	e1a02001 	mov	r2, r1
     6e0:	e1a01000 	mov	r1, r0
     6e4:	e3a00003 	mov	r0, #3
     6e8:	ef000000 	svc	0x00000000
     6ec:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6f0:	e12fff1e 	bx	lr

000006f4 <pipe>:
     6f4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6f8:	e1a04003 	mov	r4, r3
     6fc:	e1a03002 	mov	r3, r2
     700:	e1a02001 	mov	r2, r1
     704:	e1a01000 	mov	r1, r0
     708:	e3a00004 	mov	r0, #4
     70c:	ef000000 	svc	0x00000000
     710:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     714:	e12fff1e 	bx	lr

00000718 <read>:
     718:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     71c:	e1a04003 	mov	r4, r3
     720:	e1a03002 	mov	r3, r2
     724:	e1a02001 	mov	r2, r1
     728:	e1a01000 	mov	r1, r0
     72c:	e3a00005 	mov	r0, #5
     730:	ef000000 	svc	0x00000000
     734:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     738:	e12fff1e 	bx	lr

0000073c <write>:
     73c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     740:	e1a04003 	mov	r4, r3
     744:	e1a03002 	mov	r3, r2
     748:	e1a02001 	mov	r2, r1
     74c:	e1a01000 	mov	r1, r0
     750:	e3a00010 	mov	r0, #16
     754:	ef000000 	svc	0x00000000
     758:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     75c:	e12fff1e 	bx	lr

00000760 <close>:
     760:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     764:	e1a04003 	mov	r4, r3
     768:	e1a03002 	mov	r3, r2
     76c:	e1a02001 	mov	r2, r1
     770:	e1a01000 	mov	r1, r0
     774:	e3a00015 	mov	r0, #21
     778:	ef000000 	svc	0x00000000
     77c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     780:	e12fff1e 	bx	lr

00000784 <kill>:
     784:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     788:	e1a04003 	mov	r4, r3
     78c:	e1a03002 	mov	r3, r2
     790:	e1a02001 	mov	r2, r1
     794:	e1a01000 	mov	r1, r0
     798:	e3a00006 	mov	r0, #6
     79c:	ef000000 	svc	0x00000000
     7a0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7a4:	e12fff1e 	bx	lr

000007a8 <exec>:
     7a8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7ac:	e1a04003 	mov	r4, r3
     7b0:	e1a03002 	mov	r3, r2
     7b4:	e1a02001 	mov	r2, r1
     7b8:	e1a01000 	mov	r1, r0
     7bc:	e3a00007 	mov	r0, #7
     7c0:	ef000000 	svc	0x00000000
     7c4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7c8:	e12fff1e 	bx	lr

000007cc <open>:
     7cc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7d0:	e1a04003 	mov	r4, r3
     7d4:	e1a03002 	mov	r3, r2
     7d8:	e1a02001 	mov	r2, r1
     7dc:	e1a01000 	mov	r1, r0
     7e0:	e3a0000f 	mov	r0, #15
     7e4:	ef000000 	svc	0x00000000
     7e8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7ec:	e12fff1e 	bx	lr

000007f0 <mknod>:
     7f0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7f4:	e1a04003 	mov	r4, r3
     7f8:	e1a03002 	mov	r3, r2
     7fc:	e1a02001 	mov	r2, r1
     800:	e1a01000 	mov	r1, r0
     804:	e3a00011 	mov	r0, #17
     808:	ef000000 	svc	0x00000000
     80c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     810:	e12fff1e 	bx	lr

00000814 <unlink>:
     814:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     818:	e1a04003 	mov	r4, r3
     81c:	e1a03002 	mov	r3, r2
     820:	e1a02001 	mov	r2, r1
     824:	e1a01000 	mov	r1, r0
     828:	e3a00012 	mov	r0, #18
     82c:	ef000000 	svc	0x00000000
     830:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     834:	e12fff1e 	bx	lr

00000838 <fstat>:
     838:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     83c:	e1a04003 	mov	r4, r3
     840:	e1a03002 	mov	r3, r2
     844:	e1a02001 	mov	r2, r1
     848:	e1a01000 	mov	r1, r0
     84c:	e3a00008 	mov	r0, #8
     850:	ef000000 	svc	0x00000000
     854:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     858:	e12fff1e 	bx	lr

0000085c <link>:
     85c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     860:	e1a04003 	mov	r4, r3
     864:	e1a03002 	mov	r3, r2
     868:	e1a02001 	mov	r2, r1
     86c:	e1a01000 	mov	r1, r0
     870:	e3a00013 	mov	r0, #19
     874:	ef000000 	svc	0x00000000
     878:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     87c:	e12fff1e 	bx	lr

00000880 <mkdir>:
     880:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     884:	e1a04003 	mov	r4, r3
     888:	e1a03002 	mov	r3, r2
     88c:	e1a02001 	mov	r2, r1
     890:	e1a01000 	mov	r1, r0
     894:	e3a00014 	mov	r0, #20
     898:	ef000000 	svc	0x00000000
     89c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8a0:	e12fff1e 	bx	lr

000008a4 <chdir>:
     8a4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8a8:	e1a04003 	mov	r4, r3
     8ac:	e1a03002 	mov	r3, r2
     8b0:	e1a02001 	mov	r2, r1
     8b4:	e1a01000 	mov	r1, r0
     8b8:	e3a00009 	mov	r0, #9
     8bc:	ef000000 	svc	0x00000000
     8c0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8c4:	e12fff1e 	bx	lr

000008c8 <dup>:
     8c8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8cc:	e1a04003 	mov	r4, r3
     8d0:	e1a03002 	mov	r3, r2
     8d4:	e1a02001 	mov	r2, r1
     8d8:	e1a01000 	mov	r1, r0
     8dc:	e3a0000a 	mov	r0, #10
     8e0:	ef000000 	svc	0x00000000
     8e4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8e8:	e12fff1e 	bx	lr

000008ec <getpid>:
     8ec:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8f0:	e1a04003 	mov	r4, r3
     8f4:	e1a03002 	mov	r3, r2
     8f8:	e1a02001 	mov	r2, r1
     8fc:	e1a01000 	mov	r1, r0
     900:	e3a0000b 	mov	r0, #11
     904:	ef000000 	svc	0x00000000
     908:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     90c:	e12fff1e 	bx	lr

00000910 <sbrk>:
     910:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     914:	e1a04003 	mov	r4, r3
     918:	e1a03002 	mov	r3, r2
     91c:	e1a02001 	mov	r2, r1
     920:	e1a01000 	mov	r1, r0
     924:	e3a0000c 	mov	r0, #12
     928:	ef000000 	svc	0x00000000
     92c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     930:	e12fff1e 	bx	lr

00000934 <sleep>:
     934:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     938:	e1a04003 	mov	r4, r3
     93c:	e1a03002 	mov	r3, r2
     940:	e1a02001 	mov	r2, r1
     944:	e1a01000 	mov	r1, r0
     948:	e3a0000d 	mov	r0, #13
     94c:	ef000000 	svc	0x00000000
     950:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     954:	e12fff1e 	bx	lr

00000958 <uptime>:
     958:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     95c:	e1a04003 	mov	r4, r3
     960:	e1a03002 	mov	r3, r2
     964:	e1a02001 	mov	r2, r1
     968:	e1a01000 	mov	r1, r0
     96c:	e3a0000e 	mov	r0, #14
     970:	ef000000 	svc	0x00000000
     974:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     978:	e12fff1e 	bx	lr

0000097c <kthread_create>:
     97c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     980:	e1a04003 	mov	r4, r3
     984:	e1a03002 	mov	r3, r2
     988:	e1a02001 	mov	r2, r1
     98c:	e1a01000 	mov	r1, r0
     990:	e3a00016 	mov	r0, #22
     994:	ef000000 	svc	0x00000000
     998:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     99c:	e12fff1e 	bx	lr

000009a0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     9a0:	e92d4800 	push	{fp, lr}
     9a4:	e28db004 	add	fp, sp, #4
     9a8:	e24dd008 	sub	sp, sp, #8
     9ac:	e50b0008 	str	r0, [fp, #-8]
     9b0:	e1a03001 	mov	r3, r1
     9b4:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     9b8:	e51b0008 	ldr	r0, [fp, #-8]
     9bc:	e24b3009 	sub	r3, fp, #9
     9c0:	e1a01003 	mov	r1, r3
     9c4:	e3a02001 	mov	r2, #1
     9c8:	ebffff5b 	bl	73c <write>
}
     9cc:	e24bd004 	sub	sp, fp, #4
     9d0:	e8bd8800 	pop	{fp, pc}

000009d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     9d4:	e92d4800 	push	{fp, lr}
     9d8:	e28db004 	add	fp, sp, #4
     9dc:	e24dd030 	sub	sp, sp, #48	; 0x30
     9e0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     9e4:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     9e8:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     9ec:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     9f0:	e3a03000 	mov	r3, #0
     9f4:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     9f8:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     9fc:	e3530000 	cmp	r3, #0
     a00:	0a000008 	beq	a28 <printint+0x54>
     a04:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     a08:	e3530000 	cmp	r3, #0
     a0c:	aa000005 	bge	a28 <printint+0x54>
        neg = 1;
     a10:	e3a03001 	mov	r3, #1
     a14:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     a18:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     a1c:	e2633000 	rsb	r3, r3, #0
     a20:	e50b3010 	str	r3, [fp, #-16]
     a24:	ea000001 	b	a30 <printint+0x5c>
    } else {
        x = xx;
     a28:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     a2c:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     a30:	e3a03000 	mov	r3, #0
     a34:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     a38:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     a3c:	e51b2010 	ldr	r2, [fp, #-16]
     a40:	e1a00002 	mov	r0, r2
     a44:	e1a01003 	mov	r1, r3
     a48:	eb0001e5 	bl	11e4 <__aeabi_uidivmod>
     a4c:	e1a03001 	mov	r3, r1
     a50:	e1a02003 	mov	r2, r3
     a54:	e3013244 	movw	r3, #4676	; 0x1244
     a58:	e3403000 	movt	r3, #0
     a5c:	e7d32002 	ldrb	r2, [r3, r2]
     a60:	e3e0001b 	mvn	r0, #27
     a64:	e51b3008 	ldr	r3, [fp, #-8]
     a68:	e24bc004 	sub	ip, fp, #4
     a6c:	e08c1003 	add	r1, ip, r3
     a70:	e1a03000 	mov	r3, r0
     a74:	e0813003 	add	r3, r1, r3
     a78:	e5c32000 	strb	r2, [r3]
     a7c:	e51b3008 	ldr	r3, [fp, #-8]
     a80:	e2833001 	add	r3, r3, #1
     a84:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     a88:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     a8c:	e51b0010 	ldr	r0, [fp, #-16]
     a90:	e1a01003 	mov	r1, r3
     a94:	eb000195 	bl	10f0 <__aeabi_uidiv>
     a98:	e1a03000 	mov	r3, r0
     a9c:	e50b3010 	str	r3, [fp, #-16]
     aa0:	e51b3010 	ldr	r3, [fp, #-16]
     aa4:	e3530000 	cmp	r3, #0
     aa8:	1affffe2 	bne	a38 <printint+0x64>
    if(neg)
     aac:	e51b300c 	ldr	r3, [fp, #-12]
     ab0:	e3530000 	cmp	r3, #0
     ab4:	0a000015 	beq	b10 <printint+0x13c>
        buf[i++] = '-';
     ab8:	e3e0101b 	mvn	r1, #27
     abc:	e51b3008 	ldr	r3, [fp, #-8]
     ac0:	e24b0004 	sub	r0, fp, #4
     ac4:	e0802003 	add	r2, r0, r3
     ac8:	e1a03001 	mov	r3, r1
     acc:	e0823003 	add	r3, r2, r3
     ad0:	e3a0202d 	mov	r2, #45	; 0x2d
     ad4:	e5c32000 	strb	r2, [r3]
     ad8:	e51b3008 	ldr	r3, [fp, #-8]
     adc:	e2833001 	add	r3, r3, #1
     ae0:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     ae4:	ea000009 	b	b10 <printint+0x13c>
        putc(fd, buf[i]);
     ae8:	e3e0101b 	mvn	r1, #27
     aec:	e51b3008 	ldr	r3, [fp, #-8]
     af0:	e24bc004 	sub	ip, fp, #4
     af4:	e08c2003 	add	r2, ip, r3
     af8:	e1a03001 	mov	r3, r1
     afc:	e0823003 	add	r3, r2, r3
     b00:	e5d33000 	ldrb	r3, [r3]
     b04:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     b08:	e1a01003 	mov	r1, r3
     b0c:	ebffffa3 	bl	9a0 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     b10:	e51b3008 	ldr	r3, [fp, #-8]
     b14:	e2433001 	sub	r3, r3, #1
     b18:	e50b3008 	str	r3, [fp, #-8]
     b1c:	e51b3008 	ldr	r3, [fp, #-8]
     b20:	e3530000 	cmp	r3, #0
     b24:	aaffffef 	bge	ae8 <printint+0x114>
        putc(fd, buf[i]);
}
     b28:	e24bd004 	sub	sp, fp, #4
     b2c:	e8bd8800 	pop	{fp, pc}

00000b30 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     b30:	e92d000e 	push	{r1, r2, r3}
     b34:	e92d4800 	push	{fp, lr}
     b38:	e28db004 	add	fp, sp, #4
     b3c:	e24dd024 	sub	sp, sp, #36	; 0x24
     b40:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     b44:	e3a03000 	mov	r3, #0
     b48:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     b4c:	e28b3008 	add	r3, fp, #8
     b50:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     b54:	e3a03000 	mov	r3, #0
     b58:	e50b3010 	str	r3, [fp, #-16]
     b5c:	ea000077 	b	d40 <printf+0x210>
        c = fmt[i] & 0xff;
     b60:	e59b2004 	ldr	r2, [fp, #4]
     b64:	e51b3010 	ldr	r3, [fp, #-16]
     b68:	e0823003 	add	r3, r2, r3
     b6c:	e5d33000 	ldrb	r3, [r3]
     b70:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     b74:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b78:	e3530000 	cmp	r3, #0
     b7c:	1a00000b 	bne	bb0 <printf+0x80>
            if(c == '%'){
     b80:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b84:	e3530025 	cmp	r3, #37	; 0x25
     b88:	1a000002 	bne	b98 <printf+0x68>
                state = '%';
     b8c:	e3a03025 	mov	r3, #37	; 0x25
     b90:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     b94:	ea000066 	b	d34 <printf+0x204>
            } else {
                putc(fd, c);
     b98:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b9c:	e6ef3073 	uxtb	r3, r3
     ba0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ba4:	e1a01003 	mov	r1, r3
     ba8:	ebffff7c 	bl	9a0 <putc>
     bac:	ea000060 	b	d34 <printf+0x204>
            }
        } else if(state == '%'){
     bb0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     bb4:	e3530025 	cmp	r3, #37	; 0x25
     bb8:	1a00005d 	bne	d34 <printf+0x204>
            if(c == 'd'){
     bbc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bc0:	e3530064 	cmp	r3, #100	; 0x64
     bc4:	1a00000a 	bne	bf4 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     bc8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bcc:	e5933000 	ldr	r3, [r3]
     bd0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bd4:	e1a01003 	mov	r1, r3
     bd8:	e3a0200a 	mov	r2, #10
     bdc:	e3a03001 	mov	r3, #1
     be0:	ebffff7b 	bl	9d4 <printint>
                ap++;
     be4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     be8:	e2833004 	add	r3, r3, #4
     bec:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bf0:	ea00004d 	b	d2c <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     bf4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bf8:	e3530078 	cmp	r3, #120	; 0x78
     bfc:	0a000002 	beq	c0c <printf+0xdc>
     c00:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c04:	e3530070 	cmp	r3, #112	; 0x70
     c08:	1a00000a 	bne	c38 <printf+0x108>
                printint(fd, *ap, 16, 0);
     c0c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c10:	e5933000 	ldr	r3, [r3]
     c14:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c18:	e1a01003 	mov	r1, r3
     c1c:	e3a02010 	mov	r2, #16
     c20:	e3a03000 	mov	r3, #0
     c24:	ebffff6a 	bl	9d4 <printint>
                ap++;
     c28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c2c:	e2833004 	add	r3, r3, #4
     c30:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     c34:	ea00003c 	b	d2c <printf+0x1fc>
            } else if(c == 's'){
     c38:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c3c:	e3530073 	cmp	r3, #115	; 0x73
     c40:	1a00001b 	bne	cb4 <printf+0x184>
                s = (char*)*ap;
     c44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c48:	e5933000 	ldr	r3, [r3]
     c4c:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     c50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c54:	e2833004 	add	r3, r3, #4
     c58:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     c5c:	e51b300c 	ldr	r3, [fp, #-12]
     c60:	e3530000 	cmp	r3, #0
     c64:	1a00000c 	bne	c9c <printf+0x16c>
                    s = "(null)";
     c68:	e301323c 	movw	r3, #4668	; 0x123c
     c6c:	e3403000 	movt	r3, #0
     c70:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     c74:	ea000008 	b	c9c <printf+0x16c>
                    putc(fd, *s);
     c78:	e51b300c 	ldr	r3, [fp, #-12]
     c7c:	e5d33000 	ldrb	r3, [r3]
     c80:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c84:	e1a01003 	mov	r1, r3
     c88:	ebffff44 	bl	9a0 <putc>
                    s++;
     c8c:	e51b300c 	ldr	r3, [fp, #-12]
     c90:	e2833001 	add	r3, r3, #1
     c94:	e50b300c 	str	r3, [fp, #-12]
     c98:	ea000000 	b	ca0 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     c9c:	e1a00000 	nop			; (mov r0, r0)
     ca0:	e51b300c 	ldr	r3, [fp, #-12]
     ca4:	e5d33000 	ldrb	r3, [r3]
     ca8:	e3530000 	cmp	r3, #0
     cac:	1afffff1 	bne	c78 <printf+0x148>
     cb0:	ea00001d 	b	d2c <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     cb4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cb8:	e3530063 	cmp	r3, #99	; 0x63
     cbc:	1a000009 	bne	ce8 <printf+0x1b8>
                putc(fd, *ap);
     cc0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cc4:	e5933000 	ldr	r3, [r3]
     cc8:	e6ef3073 	uxtb	r3, r3
     ccc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cd0:	e1a01003 	mov	r1, r3
     cd4:	ebffff31 	bl	9a0 <putc>
                ap++;
     cd8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cdc:	e2833004 	add	r3, r3, #4
     ce0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     ce4:	ea000010 	b	d2c <printf+0x1fc>
            } else if(c == '%'){
     ce8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cec:	e3530025 	cmp	r3, #37	; 0x25
     cf0:	1a000005 	bne	d0c <printf+0x1dc>
                putc(fd, c);
     cf4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cf8:	e6ef3073 	uxtb	r3, r3
     cfc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     d00:	e1a01003 	mov	r1, r3
     d04:	ebffff25 	bl	9a0 <putc>
     d08:	ea000007 	b	d2c <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     d0c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     d10:	e3a01025 	mov	r1, #37	; 0x25
     d14:	ebffff21 	bl	9a0 <putc>
                putc(fd, c);
     d18:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     d1c:	e6ef3073 	uxtb	r3, r3
     d20:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     d24:	e1a01003 	mov	r1, r3
     d28:	ebffff1c 	bl	9a0 <putc>
            }
            state = 0;
     d2c:	e3a03000 	mov	r3, #0
     d30:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     d34:	e51b3010 	ldr	r3, [fp, #-16]
     d38:	e2833001 	add	r3, r3, #1
     d3c:	e50b3010 	str	r3, [fp, #-16]
     d40:	e59b2004 	ldr	r2, [fp, #4]
     d44:	e51b3010 	ldr	r3, [fp, #-16]
     d48:	e0823003 	add	r3, r2, r3
     d4c:	e5d33000 	ldrb	r3, [r3]
     d50:	e3530000 	cmp	r3, #0
     d54:	1affff81 	bne	b60 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     d58:	e24bd004 	sub	sp, fp, #4
     d5c:	e8bd4800 	pop	{fp, lr}
     d60:	e28dd00c 	add	sp, sp, #12
     d64:	e12fff1e 	bx	lr

00000d68 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d68:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     d6c:	e28db000 	add	fp, sp, #0
     d70:	e24dd014 	sub	sp, sp, #20
     d74:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     d78:	e51b3010 	ldr	r3, [fp, #-16]
     d7c:	e2433008 	sub	r3, r3, #8
     d80:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d84:	e3013260 	movw	r3, #4704	; 0x1260
     d88:	e3403000 	movt	r3, #0
     d8c:	e5933000 	ldr	r3, [r3]
     d90:	e50b3008 	str	r3, [fp, #-8]
     d94:	ea000010 	b	ddc <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d98:	e51b3008 	ldr	r3, [fp, #-8]
     d9c:	e5932000 	ldr	r2, [r3]
     da0:	e51b3008 	ldr	r3, [fp, #-8]
     da4:	e1520003 	cmp	r2, r3
     da8:	8a000008 	bhi	dd0 <free+0x68>
     dac:	e51b200c 	ldr	r2, [fp, #-12]
     db0:	e51b3008 	ldr	r3, [fp, #-8]
     db4:	e1520003 	cmp	r2, r3
     db8:	8a000010 	bhi	e00 <free+0x98>
     dbc:	e51b3008 	ldr	r3, [fp, #-8]
     dc0:	e5932000 	ldr	r2, [r3]
     dc4:	e51b300c 	ldr	r3, [fp, #-12]
     dc8:	e1520003 	cmp	r2, r3
     dcc:	8a00000b 	bhi	e00 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     dd0:	e51b3008 	ldr	r3, [fp, #-8]
     dd4:	e5933000 	ldr	r3, [r3]
     dd8:	e50b3008 	str	r3, [fp, #-8]
     ddc:	e51b200c 	ldr	r2, [fp, #-12]
     de0:	e51b3008 	ldr	r3, [fp, #-8]
     de4:	e1520003 	cmp	r2, r3
     de8:	9affffea 	bls	d98 <free+0x30>
     dec:	e51b3008 	ldr	r3, [fp, #-8]
     df0:	e5932000 	ldr	r2, [r3]
     df4:	e51b300c 	ldr	r3, [fp, #-12]
     df8:	e1520003 	cmp	r2, r3
     dfc:	9affffe5 	bls	d98 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     e00:	e51b300c 	ldr	r3, [fp, #-12]
     e04:	e5933004 	ldr	r3, [r3, #4]
     e08:	e1a03183 	lsl	r3, r3, #3
     e0c:	e51b200c 	ldr	r2, [fp, #-12]
     e10:	e0822003 	add	r2, r2, r3
     e14:	e51b3008 	ldr	r3, [fp, #-8]
     e18:	e5933000 	ldr	r3, [r3]
     e1c:	e1520003 	cmp	r2, r3
     e20:	1a00000d 	bne	e5c <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     e24:	e51b300c 	ldr	r3, [fp, #-12]
     e28:	e5932004 	ldr	r2, [r3, #4]
     e2c:	e51b3008 	ldr	r3, [fp, #-8]
     e30:	e5933000 	ldr	r3, [r3]
     e34:	e5933004 	ldr	r3, [r3, #4]
     e38:	e0822003 	add	r2, r2, r3
     e3c:	e51b300c 	ldr	r3, [fp, #-12]
     e40:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     e44:	e51b3008 	ldr	r3, [fp, #-8]
     e48:	e5933000 	ldr	r3, [r3]
     e4c:	e5932000 	ldr	r2, [r3]
     e50:	e51b300c 	ldr	r3, [fp, #-12]
     e54:	e5832000 	str	r2, [r3]
     e58:	ea000003 	b	e6c <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     e5c:	e51b3008 	ldr	r3, [fp, #-8]
     e60:	e5932000 	ldr	r2, [r3]
     e64:	e51b300c 	ldr	r3, [fp, #-12]
     e68:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     e6c:	e51b3008 	ldr	r3, [fp, #-8]
     e70:	e5933004 	ldr	r3, [r3, #4]
     e74:	e1a03183 	lsl	r3, r3, #3
     e78:	e51b2008 	ldr	r2, [fp, #-8]
     e7c:	e0822003 	add	r2, r2, r3
     e80:	e51b300c 	ldr	r3, [fp, #-12]
     e84:	e1520003 	cmp	r2, r3
     e88:	1a00000b 	bne	ebc <free+0x154>
        p->s.size += bp->s.size;
     e8c:	e51b3008 	ldr	r3, [fp, #-8]
     e90:	e5932004 	ldr	r2, [r3, #4]
     e94:	e51b300c 	ldr	r3, [fp, #-12]
     e98:	e5933004 	ldr	r3, [r3, #4]
     e9c:	e0822003 	add	r2, r2, r3
     ea0:	e51b3008 	ldr	r3, [fp, #-8]
     ea4:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     ea8:	e51b300c 	ldr	r3, [fp, #-12]
     eac:	e5932000 	ldr	r2, [r3]
     eb0:	e51b3008 	ldr	r3, [fp, #-8]
     eb4:	e5832000 	str	r2, [r3]
     eb8:	ea000002 	b	ec8 <free+0x160>
    } else
        p->s.ptr = bp;
     ebc:	e51b3008 	ldr	r3, [fp, #-8]
     ec0:	e51b200c 	ldr	r2, [fp, #-12]
     ec4:	e5832000 	str	r2, [r3]
    freep = p;
     ec8:	e3013260 	movw	r3, #4704	; 0x1260
     ecc:	e3403000 	movt	r3, #0
     ed0:	e51b2008 	ldr	r2, [fp, #-8]
     ed4:	e5832000 	str	r2, [r3]
}
     ed8:	e28bd000 	add	sp, fp, #0
     edc:	e8bd0800 	pop	{fp}
     ee0:	e12fff1e 	bx	lr

00000ee4 <morecore>:

static Header*
morecore(uint nu)
{
     ee4:	e92d4800 	push	{fp, lr}
     ee8:	e28db004 	add	fp, sp, #4
     eec:	e24dd010 	sub	sp, sp, #16
     ef0:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     ef4:	e51b2010 	ldr	r2, [fp, #-16]
     ef8:	e3003fff 	movw	r3, #4095	; 0xfff
     efc:	e1520003 	cmp	r2, r3
     f00:	8a000001 	bhi	f0c <morecore+0x28>
        nu = 4096;
     f04:	e3a03a01 	mov	r3, #4096	; 0x1000
     f08:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     f0c:	e51b3010 	ldr	r3, [fp, #-16]
     f10:	e1a03183 	lsl	r3, r3, #3
     f14:	e1a00003 	mov	r0, r3
     f18:	ebfffe7c 	bl	910 <sbrk>
     f1c:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     f20:	e51b3008 	ldr	r3, [fp, #-8]
     f24:	e3730001 	cmn	r3, #1
     f28:	1a000001 	bne	f34 <morecore+0x50>
        return 0;
     f2c:	e3a03000 	mov	r3, #0
     f30:	ea00000b 	b	f64 <morecore+0x80>
    hp = (Header*)p;
     f34:	e51b3008 	ldr	r3, [fp, #-8]
     f38:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     f3c:	e51b300c 	ldr	r3, [fp, #-12]
     f40:	e51b2010 	ldr	r2, [fp, #-16]
     f44:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     f48:	e51b300c 	ldr	r3, [fp, #-12]
     f4c:	e2833008 	add	r3, r3, #8
     f50:	e1a00003 	mov	r0, r3
     f54:	ebffff83 	bl	d68 <free>
    return freep;
     f58:	e3013260 	movw	r3, #4704	; 0x1260
     f5c:	e3403000 	movt	r3, #0
     f60:	e5933000 	ldr	r3, [r3]
}
     f64:	e1a00003 	mov	r0, r3
     f68:	e24bd004 	sub	sp, fp, #4
     f6c:	e8bd8800 	pop	{fp, pc}

00000f70 <malloc>:

void*
malloc(uint nbytes)
{
     f70:	e92d4800 	push	{fp, lr}
     f74:	e28db004 	add	fp, sp, #4
     f78:	e24dd018 	sub	sp, sp, #24
     f7c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f84:	e2833007 	add	r3, r3, #7
     f88:	e1a031a3 	lsr	r3, r3, #3
     f8c:	e2833001 	add	r3, r3, #1
     f90:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     f94:	e3013260 	movw	r3, #4704	; 0x1260
     f98:	e3403000 	movt	r3, #0
     f9c:	e5933000 	ldr	r3, [r3]
     fa0:	e50b300c 	str	r3, [fp, #-12]
     fa4:	e51b300c 	ldr	r3, [fp, #-12]
     fa8:	e3530000 	cmp	r3, #0
     fac:	1a000010 	bne	ff4 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     fb0:	e3013258 	movw	r3, #4696	; 0x1258
     fb4:	e3403000 	movt	r3, #0
     fb8:	e50b300c 	str	r3, [fp, #-12]
     fbc:	e3013260 	movw	r3, #4704	; 0x1260
     fc0:	e3403000 	movt	r3, #0
     fc4:	e51b200c 	ldr	r2, [fp, #-12]
     fc8:	e5832000 	str	r2, [r3]
     fcc:	e3013260 	movw	r3, #4704	; 0x1260
     fd0:	e3403000 	movt	r3, #0
     fd4:	e5932000 	ldr	r2, [r3]
     fd8:	e3013258 	movw	r3, #4696	; 0x1258
     fdc:	e3403000 	movt	r3, #0
     fe0:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     fe4:	e3013258 	movw	r3, #4696	; 0x1258
     fe8:	e3403000 	movt	r3, #0
     fec:	e3a02000 	mov	r2, #0
     ff0:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     ff4:	e51b300c 	ldr	r3, [fp, #-12]
     ff8:	e5933000 	ldr	r3, [r3]
     ffc:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
    1000:	e51b3008 	ldr	r3, [fp, #-8]
    1004:	e5932004 	ldr	r2, [r3, #4]
    1008:	e51b3010 	ldr	r3, [fp, #-16]
    100c:	e1520003 	cmp	r2, r3
    1010:	3a00001f 	bcc	1094 <malloc+0x124>
            if(p->s.size == nunits)
    1014:	e51b3008 	ldr	r3, [fp, #-8]
    1018:	e5932004 	ldr	r2, [r3, #4]
    101c:	e51b3010 	ldr	r3, [fp, #-16]
    1020:	e1520003 	cmp	r2, r3
    1024:	1a000004 	bne	103c <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    1028:	e51b3008 	ldr	r3, [fp, #-8]
    102c:	e5932000 	ldr	r2, [r3]
    1030:	e51b300c 	ldr	r3, [fp, #-12]
    1034:	e5832000 	str	r2, [r3]
    1038:	ea00000e 	b	1078 <malloc+0x108>
            else {
                p->s.size -= nunits;
    103c:	e51b3008 	ldr	r3, [fp, #-8]
    1040:	e5932004 	ldr	r2, [r3, #4]
    1044:	e51b3010 	ldr	r3, [fp, #-16]
    1048:	e0632002 	rsb	r2, r3, r2
    104c:	e51b3008 	ldr	r3, [fp, #-8]
    1050:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    1054:	e51b3008 	ldr	r3, [fp, #-8]
    1058:	e5933004 	ldr	r3, [r3, #4]
    105c:	e1a03183 	lsl	r3, r3, #3
    1060:	e51b2008 	ldr	r2, [fp, #-8]
    1064:	e0823003 	add	r3, r2, r3
    1068:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    106c:	e51b3008 	ldr	r3, [fp, #-8]
    1070:	e51b2010 	ldr	r2, [fp, #-16]
    1074:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1078:	e3013260 	movw	r3, #4704	; 0x1260
    107c:	e3403000 	movt	r3, #0
    1080:	e51b200c 	ldr	r2, [fp, #-12]
    1084:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    1088:	e51b3008 	ldr	r3, [fp, #-8]
    108c:	e2833008 	add	r3, r3, #8
    1090:	ea000013 	b	10e4 <malloc+0x174>
        }
        if(p == freep)
    1094:	e3013260 	movw	r3, #4704	; 0x1260
    1098:	e3403000 	movt	r3, #0
    109c:	e5933000 	ldr	r3, [r3]
    10a0:	e51b2008 	ldr	r2, [fp, #-8]
    10a4:	e1520003 	cmp	r2, r3
    10a8:	1a000007 	bne	10cc <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    10ac:	e51b0010 	ldr	r0, [fp, #-16]
    10b0:	ebffff8b 	bl	ee4 <morecore>
    10b4:	e50b0008 	str	r0, [fp, #-8]
    10b8:	e51b3008 	ldr	r3, [fp, #-8]
    10bc:	e3530000 	cmp	r3, #0
    10c0:	1a000001 	bne	10cc <malloc+0x15c>
                return 0;
    10c4:	e3a03000 	mov	r3, #0
    10c8:	ea000005 	b	10e4 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10cc:	e51b3008 	ldr	r3, [fp, #-8]
    10d0:	e50b300c 	str	r3, [fp, #-12]
    10d4:	e51b3008 	ldr	r3, [fp, #-8]
    10d8:	e5933000 	ldr	r3, [r3]
    10dc:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    10e0:	eaffffc6 	b	1000 <malloc+0x90>
}
    10e4:	e1a00003 	mov	r0, r3
    10e8:	e24bd004 	sub	sp, fp, #4
    10ec:	e8bd8800 	pop	{fp, pc}

000010f0 <__aeabi_uidiv>:
    10f0:	e2512001 	subs	r2, r1, #1
    10f4:	012fff1e 	bxeq	lr
    10f8:	3a000036 	bcc	11d8 <__aeabi_uidiv+0xe8>
    10fc:	e1500001 	cmp	r0, r1
    1100:	9a000022 	bls	1190 <__aeabi_uidiv+0xa0>
    1104:	e1110002 	tst	r1, r2
    1108:	0a000023 	beq	119c <__aeabi_uidiv+0xac>
    110c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1110:	01a01181 	lsleq	r1, r1, #3
    1114:	03a03008 	moveq	r3, #8
    1118:	13a03001 	movne	r3, #1
    111c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1120:	31510000 	cmpcc	r1, r0
    1124:	31a01201 	lslcc	r1, r1, #4
    1128:	31a03203 	lslcc	r3, r3, #4
    112c:	3afffffa 	bcc	111c <__aeabi_uidiv+0x2c>
    1130:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1134:	31510000 	cmpcc	r1, r0
    1138:	31a01081 	lslcc	r1, r1, #1
    113c:	31a03083 	lslcc	r3, r3, #1
    1140:	3afffffa 	bcc	1130 <__aeabi_uidiv+0x40>
    1144:	e3a02000 	mov	r2, #0
    1148:	e1500001 	cmp	r0, r1
    114c:	20400001 	subcs	r0, r0, r1
    1150:	21822003 	orrcs	r2, r2, r3
    1154:	e15000a1 	cmp	r0, r1, lsr #1
    1158:	204000a1 	subcs	r0, r0, r1, lsr #1
    115c:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1160:	e1500121 	cmp	r0, r1, lsr #2
    1164:	20400121 	subcs	r0, r0, r1, lsr #2
    1168:	21822123 	orrcs	r2, r2, r3, lsr #2
    116c:	e15001a1 	cmp	r0, r1, lsr #3
    1170:	204001a1 	subcs	r0, r0, r1, lsr #3
    1174:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1178:	e3500000 	cmp	r0, #0
    117c:	11b03223 	lsrsne	r3, r3, #4
    1180:	11a01221 	lsrne	r1, r1, #4
    1184:	1affffef 	bne	1148 <__aeabi_uidiv+0x58>
    1188:	e1a00002 	mov	r0, r2
    118c:	e12fff1e 	bx	lr
    1190:	03a00001 	moveq	r0, #1
    1194:	13a00000 	movne	r0, #0
    1198:	e12fff1e 	bx	lr
    119c:	e3510801 	cmp	r1, #65536	; 0x10000
    11a0:	21a01821 	lsrcs	r1, r1, #16
    11a4:	23a02010 	movcs	r2, #16
    11a8:	33a02000 	movcc	r2, #0
    11ac:	e3510c01 	cmp	r1, #256	; 0x100
    11b0:	21a01421 	lsrcs	r1, r1, #8
    11b4:	22822008 	addcs	r2, r2, #8
    11b8:	e3510010 	cmp	r1, #16
    11bc:	21a01221 	lsrcs	r1, r1, #4
    11c0:	22822004 	addcs	r2, r2, #4
    11c4:	e3510004 	cmp	r1, #4
    11c8:	82822003 	addhi	r2, r2, #3
    11cc:	908220a1 	addls	r2, r2, r1, lsr #1
    11d0:	e1a00230 	lsr	r0, r0, r2
    11d4:	e12fff1e 	bx	lr
    11d8:	e3500000 	cmp	r0, #0
    11dc:	13e00000 	mvnne	r0, #0
    11e0:	ea000007 	b	1204 <__aeabi_idiv0>

000011e4 <__aeabi_uidivmod>:
    11e4:	e3510000 	cmp	r1, #0
    11e8:	0afffffa 	beq	11d8 <__aeabi_uidiv+0xe8>
    11ec:	e92d4003 	push	{r0, r1, lr}
    11f0:	ebffffbe 	bl	10f0 <__aeabi_uidiv>
    11f4:	e8bd4006 	pop	{r1, r2, lr}
    11f8:	e0030092 	mul	r3, r2, r0
    11fc:	e0411003 	sub	r1, r1, r3
    1200:	e12fff1e 	bx	lr

00001204 <__aeabi_idiv0>:
    1204:	e12fff1e 	bx	lr
