
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
      14:	e301220c 	movw	r2, #4620	; 0x120c
      18:	e3402000 	movt	r2, #0
      1c:	e24b3018 	sub	r3, fp, #24
      20:	e8920007 	ldm	r2, {r0, r1, r2}
      24:	e8a30003 	stmia	r3!, {r0, r1}
      28:	e1c320b0 	strh	r2, [r3]
    char data[512];
    
    printf(1, "stressfs starting\n");
      2c:	e3a00001 	mov	r0, #1
      30:	e30111e4 	movw	r1, #4580	; 0x11e4
      34:	e3401000 	movt	r1, #0
      38:	eb0002b3 	bl	b0c <printf>
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
      90:	e30111f8 	movw	r1, #4600	; 0x11f8
      94:	e3401000 	movt	r1, #0
      98:	e51b2008 	ldr	r2, [fp, #-8]
      9c:	eb00029a 	bl	b0c <printf>
    
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
     110:	e3011204 	movw	r1, #4612	; 0x1204
     114:	e3401000 	movt	r1, #0
     118:	eb00027b 	bl	b0c <printf>
    
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

0000097c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     97c:	e92d4800 	push	{fp, lr}
     980:	e28db004 	add	fp, sp, #4
     984:	e24dd008 	sub	sp, sp, #8
     988:	e50b0008 	str	r0, [fp, #-8]
     98c:	e1a03001 	mov	r3, r1
     990:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     994:	e51b0008 	ldr	r0, [fp, #-8]
     998:	e24b3009 	sub	r3, fp, #9
     99c:	e1a01003 	mov	r1, r3
     9a0:	e3a02001 	mov	r2, #1
     9a4:	ebffff64 	bl	73c <write>
}
     9a8:	e24bd004 	sub	sp, fp, #4
     9ac:	e8bd8800 	pop	{fp, pc}

000009b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     9b0:	e92d4800 	push	{fp, lr}
     9b4:	e28db004 	add	fp, sp, #4
     9b8:	e24dd030 	sub	sp, sp, #48	; 0x30
     9bc:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     9c0:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     9c4:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     9c8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     9cc:	e3a03000 	mov	r3, #0
     9d0:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     9d4:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     9d8:	e3530000 	cmp	r3, #0
     9dc:	0a000008 	beq	a04 <printint+0x54>
     9e0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     9e4:	e3530000 	cmp	r3, #0
     9e8:	aa000005 	bge	a04 <printint+0x54>
        neg = 1;
     9ec:	e3a03001 	mov	r3, #1
     9f0:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     9f4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     9f8:	e2633000 	rsb	r3, r3, #0
     9fc:	e50b3010 	str	r3, [fp, #-16]
     a00:	ea000001 	b	a0c <printint+0x5c>
    } else {
        x = xx;
     a04:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     a08:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     a0c:	e3a03000 	mov	r3, #0
     a10:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     a14:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     a18:	e51b2010 	ldr	r2, [fp, #-16]
     a1c:	e1a00002 	mov	r0, r2
     a20:	e1a01003 	mov	r1, r3
     a24:	eb0001e5 	bl	11c0 <__aeabi_uidivmod>
     a28:	e1a03001 	mov	r3, r1
     a2c:	e1a02003 	mov	r2, r3
     a30:	e3013220 	movw	r3, #4640	; 0x1220
     a34:	e3403000 	movt	r3, #0
     a38:	e7d32002 	ldrb	r2, [r3, r2]
     a3c:	e3e0001b 	mvn	r0, #27
     a40:	e51b3008 	ldr	r3, [fp, #-8]
     a44:	e24bc004 	sub	ip, fp, #4
     a48:	e08c1003 	add	r1, ip, r3
     a4c:	e1a03000 	mov	r3, r0
     a50:	e0813003 	add	r3, r1, r3
     a54:	e5c32000 	strb	r2, [r3]
     a58:	e51b3008 	ldr	r3, [fp, #-8]
     a5c:	e2833001 	add	r3, r3, #1
     a60:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     a64:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     a68:	e51b0010 	ldr	r0, [fp, #-16]
     a6c:	e1a01003 	mov	r1, r3
     a70:	eb000195 	bl	10cc <__aeabi_uidiv>
     a74:	e1a03000 	mov	r3, r0
     a78:	e50b3010 	str	r3, [fp, #-16]
     a7c:	e51b3010 	ldr	r3, [fp, #-16]
     a80:	e3530000 	cmp	r3, #0
     a84:	1affffe2 	bne	a14 <printint+0x64>
    if(neg)
     a88:	e51b300c 	ldr	r3, [fp, #-12]
     a8c:	e3530000 	cmp	r3, #0
     a90:	0a000015 	beq	aec <printint+0x13c>
        buf[i++] = '-';
     a94:	e3e0101b 	mvn	r1, #27
     a98:	e51b3008 	ldr	r3, [fp, #-8]
     a9c:	e24b0004 	sub	r0, fp, #4
     aa0:	e0802003 	add	r2, r0, r3
     aa4:	e1a03001 	mov	r3, r1
     aa8:	e0823003 	add	r3, r2, r3
     aac:	e3a0202d 	mov	r2, #45	; 0x2d
     ab0:	e5c32000 	strb	r2, [r3]
     ab4:	e51b3008 	ldr	r3, [fp, #-8]
     ab8:	e2833001 	add	r3, r3, #1
     abc:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     ac0:	ea000009 	b	aec <printint+0x13c>
        putc(fd, buf[i]);
     ac4:	e3e0101b 	mvn	r1, #27
     ac8:	e51b3008 	ldr	r3, [fp, #-8]
     acc:	e24bc004 	sub	ip, fp, #4
     ad0:	e08c2003 	add	r2, ip, r3
     ad4:	e1a03001 	mov	r3, r1
     ad8:	e0823003 	add	r3, r2, r3
     adc:	e5d33000 	ldrb	r3, [r3]
     ae0:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     ae4:	e1a01003 	mov	r1, r3
     ae8:	ebffffa3 	bl	97c <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     aec:	e51b3008 	ldr	r3, [fp, #-8]
     af0:	e2433001 	sub	r3, r3, #1
     af4:	e50b3008 	str	r3, [fp, #-8]
     af8:	e51b3008 	ldr	r3, [fp, #-8]
     afc:	e3530000 	cmp	r3, #0
     b00:	aaffffef 	bge	ac4 <printint+0x114>
        putc(fd, buf[i]);
}
     b04:	e24bd004 	sub	sp, fp, #4
     b08:	e8bd8800 	pop	{fp, pc}

00000b0c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     b0c:	e92d000e 	push	{r1, r2, r3}
     b10:	e92d4800 	push	{fp, lr}
     b14:	e28db004 	add	fp, sp, #4
     b18:	e24dd024 	sub	sp, sp, #36	; 0x24
     b1c:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     b20:	e3a03000 	mov	r3, #0
     b24:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     b28:	e28b3008 	add	r3, fp, #8
     b2c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     b30:	e3a03000 	mov	r3, #0
     b34:	e50b3010 	str	r3, [fp, #-16]
     b38:	ea000077 	b	d1c <printf+0x210>
        c = fmt[i] & 0xff;
     b3c:	e59b2004 	ldr	r2, [fp, #4]
     b40:	e51b3010 	ldr	r3, [fp, #-16]
     b44:	e0823003 	add	r3, r2, r3
     b48:	e5d33000 	ldrb	r3, [r3]
     b4c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     b50:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b54:	e3530000 	cmp	r3, #0
     b58:	1a00000b 	bne	b8c <printf+0x80>
            if(c == '%'){
     b5c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b60:	e3530025 	cmp	r3, #37	; 0x25
     b64:	1a000002 	bne	b74 <printf+0x68>
                state = '%';
     b68:	e3a03025 	mov	r3, #37	; 0x25
     b6c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     b70:	ea000066 	b	d10 <printf+0x204>
            } else {
                putc(fd, c);
     b74:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b78:	e6ef3073 	uxtb	r3, r3
     b7c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b80:	e1a01003 	mov	r1, r3
     b84:	ebffff7c 	bl	97c <putc>
     b88:	ea000060 	b	d10 <printf+0x204>
            }
        } else if(state == '%'){
     b8c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b90:	e3530025 	cmp	r3, #37	; 0x25
     b94:	1a00005d 	bne	d10 <printf+0x204>
            if(c == 'd'){
     b98:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b9c:	e3530064 	cmp	r3, #100	; 0x64
     ba0:	1a00000a 	bne	bd0 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     ba4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ba8:	e5933000 	ldr	r3, [r3]
     bac:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bb0:	e1a01003 	mov	r1, r3
     bb4:	e3a0200a 	mov	r2, #10
     bb8:	e3a03001 	mov	r3, #1
     bbc:	ebffff7b 	bl	9b0 <printint>
                ap++;
     bc0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bc4:	e2833004 	add	r3, r3, #4
     bc8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bcc:	ea00004d 	b	d08 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     bd0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bd4:	e3530078 	cmp	r3, #120	; 0x78
     bd8:	0a000002 	beq	be8 <printf+0xdc>
     bdc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     be0:	e3530070 	cmp	r3, #112	; 0x70
     be4:	1a00000a 	bne	c14 <printf+0x108>
                printint(fd, *ap, 16, 0);
     be8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bec:	e5933000 	ldr	r3, [r3]
     bf0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bf4:	e1a01003 	mov	r1, r3
     bf8:	e3a02010 	mov	r2, #16
     bfc:	e3a03000 	mov	r3, #0
     c00:	ebffff6a 	bl	9b0 <printint>
                ap++;
     c04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c08:	e2833004 	add	r3, r3, #4
     c0c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     c10:	ea00003c 	b	d08 <printf+0x1fc>
            } else if(c == 's'){
     c14:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c18:	e3530073 	cmp	r3, #115	; 0x73
     c1c:	1a00001b 	bne	c90 <printf+0x184>
                s = (char*)*ap;
     c20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c24:	e5933000 	ldr	r3, [r3]
     c28:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     c2c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c30:	e2833004 	add	r3, r3, #4
     c34:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     c38:	e51b300c 	ldr	r3, [fp, #-12]
     c3c:	e3530000 	cmp	r3, #0
     c40:	1a00000c 	bne	c78 <printf+0x16c>
                    s = "(null)";
     c44:	e3013218 	movw	r3, #4632	; 0x1218
     c48:	e3403000 	movt	r3, #0
     c4c:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     c50:	ea000008 	b	c78 <printf+0x16c>
                    putc(fd, *s);
     c54:	e51b300c 	ldr	r3, [fp, #-12]
     c58:	e5d33000 	ldrb	r3, [r3]
     c5c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c60:	e1a01003 	mov	r1, r3
     c64:	ebffff44 	bl	97c <putc>
                    s++;
     c68:	e51b300c 	ldr	r3, [fp, #-12]
     c6c:	e2833001 	add	r3, r3, #1
     c70:	e50b300c 	str	r3, [fp, #-12]
     c74:	ea000000 	b	c7c <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     c78:	e1a00000 	nop			; (mov r0, r0)
     c7c:	e51b300c 	ldr	r3, [fp, #-12]
     c80:	e5d33000 	ldrb	r3, [r3]
     c84:	e3530000 	cmp	r3, #0
     c88:	1afffff1 	bne	c54 <printf+0x148>
     c8c:	ea00001d 	b	d08 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     c90:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c94:	e3530063 	cmp	r3, #99	; 0x63
     c98:	1a000009 	bne	cc4 <printf+0x1b8>
                putc(fd, *ap);
     c9c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ca0:	e5933000 	ldr	r3, [r3]
     ca4:	e6ef3073 	uxtb	r3, r3
     ca8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cac:	e1a01003 	mov	r1, r3
     cb0:	ebffff31 	bl	97c <putc>
                ap++;
     cb4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     cb8:	e2833004 	add	r3, r3, #4
     cbc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     cc0:	ea000010 	b	d08 <printf+0x1fc>
            } else if(c == '%'){
     cc4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cc8:	e3530025 	cmp	r3, #37	; 0x25
     ccc:	1a000005 	bne	ce8 <printf+0x1dc>
                putc(fd, c);
     cd0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cd4:	e6ef3073 	uxtb	r3, r3
     cd8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cdc:	e1a01003 	mov	r1, r3
     ce0:	ebffff25 	bl	97c <putc>
     ce4:	ea000007 	b	d08 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     ce8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cec:	e3a01025 	mov	r1, #37	; 0x25
     cf0:	ebffff21 	bl	97c <putc>
                putc(fd, c);
     cf4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cf8:	e6ef3073 	uxtb	r3, r3
     cfc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     d00:	e1a01003 	mov	r1, r3
     d04:	ebffff1c 	bl	97c <putc>
            }
            state = 0;
     d08:	e3a03000 	mov	r3, #0
     d0c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     d10:	e51b3010 	ldr	r3, [fp, #-16]
     d14:	e2833001 	add	r3, r3, #1
     d18:	e50b3010 	str	r3, [fp, #-16]
     d1c:	e59b2004 	ldr	r2, [fp, #4]
     d20:	e51b3010 	ldr	r3, [fp, #-16]
     d24:	e0823003 	add	r3, r2, r3
     d28:	e5d33000 	ldrb	r3, [r3]
     d2c:	e3530000 	cmp	r3, #0
     d30:	1affff81 	bne	b3c <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     d34:	e24bd004 	sub	sp, fp, #4
     d38:	e8bd4800 	pop	{fp, lr}
     d3c:	e28dd00c 	add	sp, sp, #12
     d40:	e12fff1e 	bx	lr

00000d44 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d44:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     d48:	e28db000 	add	fp, sp, #0
     d4c:	e24dd014 	sub	sp, sp, #20
     d50:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     d54:	e51b3010 	ldr	r3, [fp, #-16]
     d58:	e2433008 	sub	r3, r3, #8
     d5c:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d60:	e301323c 	movw	r3, #4668	; 0x123c
     d64:	e3403000 	movt	r3, #0
     d68:	e5933000 	ldr	r3, [r3]
     d6c:	e50b3008 	str	r3, [fp, #-8]
     d70:	ea000010 	b	db8 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d74:	e51b3008 	ldr	r3, [fp, #-8]
     d78:	e5932000 	ldr	r2, [r3]
     d7c:	e51b3008 	ldr	r3, [fp, #-8]
     d80:	e1520003 	cmp	r2, r3
     d84:	8a000008 	bhi	dac <free+0x68>
     d88:	e51b200c 	ldr	r2, [fp, #-12]
     d8c:	e51b3008 	ldr	r3, [fp, #-8]
     d90:	e1520003 	cmp	r2, r3
     d94:	8a000010 	bhi	ddc <free+0x98>
     d98:	e51b3008 	ldr	r3, [fp, #-8]
     d9c:	e5932000 	ldr	r2, [r3]
     da0:	e51b300c 	ldr	r3, [fp, #-12]
     da4:	e1520003 	cmp	r2, r3
     da8:	8a00000b 	bhi	ddc <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     dac:	e51b3008 	ldr	r3, [fp, #-8]
     db0:	e5933000 	ldr	r3, [r3]
     db4:	e50b3008 	str	r3, [fp, #-8]
     db8:	e51b200c 	ldr	r2, [fp, #-12]
     dbc:	e51b3008 	ldr	r3, [fp, #-8]
     dc0:	e1520003 	cmp	r2, r3
     dc4:	9affffea 	bls	d74 <free+0x30>
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e5932000 	ldr	r2, [r3]
     dd0:	e51b300c 	ldr	r3, [fp, #-12]
     dd4:	e1520003 	cmp	r2, r3
     dd8:	9affffe5 	bls	d74 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     ddc:	e51b300c 	ldr	r3, [fp, #-12]
     de0:	e5933004 	ldr	r3, [r3, #4]
     de4:	e1a03183 	lsl	r3, r3, #3
     de8:	e51b200c 	ldr	r2, [fp, #-12]
     dec:	e0822003 	add	r2, r2, r3
     df0:	e51b3008 	ldr	r3, [fp, #-8]
     df4:	e5933000 	ldr	r3, [r3]
     df8:	e1520003 	cmp	r2, r3
     dfc:	1a00000d 	bne	e38 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     e00:	e51b300c 	ldr	r3, [fp, #-12]
     e04:	e5932004 	ldr	r2, [r3, #4]
     e08:	e51b3008 	ldr	r3, [fp, #-8]
     e0c:	e5933000 	ldr	r3, [r3]
     e10:	e5933004 	ldr	r3, [r3, #4]
     e14:	e0822003 	add	r2, r2, r3
     e18:	e51b300c 	ldr	r3, [fp, #-12]
     e1c:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     e20:	e51b3008 	ldr	r3, [fp, #-8]
     e24:	e5933000 	ldr	r3, [r3]
     e28:	e5932000 	ldr	r2, [r3]
     e2c:	e51b300c 	ldr	r3, [fp, #-12]
     e30:	e5832000 	str	r2, [r3]
     e34:	ea000003 	b	e48 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     e38:	e51b3008 	ldr	r3, [fp, #-8]
     e3c:	e5932000 	ldr	r2, [r3]
     e40:	e51b300c 	ldr	r3, [fp, #-12]
     e44:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     e48:	e51b3008 	ldr	r3, [fp, #-8]
     e4c:	e5933004 	ldr	r3, [r3, #4]
     e50:	e1a03183 	lsl	r3, r3, #3
     e54:	e51b2008 	ldr	r2, [fp, #-8]
     e58:	e0822003 	add	r2, r2, r3
     e5c:	e51b300c 	ldr	r3, [fp, #-12]
     e60:	e1520003 	cmp	r2, r3
     e64:	1a00000b 	bne	e98 <free+0x154>
        p->s.size += bp->s.size;
     e68:	e51b3008 	ldr	r3, [fp, #-8]
     e6c:	e5932004 	ldr	r2, [r3, #4]
     e70:	e51b300c 	ldr	r3, [fp, #-12]
     e74:	e5933004 	ldr	r3, [r3, #4]
     e78:	e0822003 	add	r2, r2, r3
     e7c:	e51b3008 	ldr	r3, [fp, #-8]
     e80:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     e84:	e51b300c 	ldr	r3, [fp, #-12]
     e88:	e5932000 	ldr	r2, [r3]
     e8c:	e51b3008 	ldr	r3, [fp, #-8]
     e90:	e5832000 	str	r2, [r3]
     e94:	ea000002 	b	ea4 <free+0x160>
    } else
        p->s.ptr = bp;
     e98:	e51b3008 	ldr	r3, [fp, #-8]
     e9c:	e51b200c 	ldr	r2, [fp, #-12]
     ea0:	e5832000 	str	r2, [r3]
    freep = p;
     ea4:	e301323c 	movw	r3, #4668	; 0x123c
     ea8:	e3403000 	movt	r3, #0
     eac:	e51b2008 	ldr	r2, [fp, #-8]
     eb0:	e5832000 	str	r2, [r3]
}
     eb4:	e28bd000 	add	sp, fp, #0
     eb8:	e8bd0800 	pop	{fp}
     ebc:	e12fff1e 	bx	lr

00000ec0 <morecore>:

static Header*
morecore(uint nu)
{
     ec0:	e92d4800 	push	{fp, lr}
     ec4:	e28db004 	add	fp, sp, #4
     ec8:	e24dd010 	sub	sp, sp, #16
     ecc:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     ed0:	e51b2010 	ldr	r2, [fp, #-16]
     ed4:	e3003fff 	movw	r3, #4095	; 0xfff
     ed8:	e1520003 	cmp	r2, r3
     edc:	8a000001 	bhi	ee8 <morecore+0x28>
        nu = 4096;
     ee0:	e3a03a01 	mov	r3, #4096	; 0x1000
     ee4:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     ee8:	e51b3010 	ldr	r3, [fp, #-16]
     eec:	e1a03183 	lsl	r3, r3, #3
     ef0:	e1a00003 	mov	r0, r3
     ef4:	ebfffe85 	bl	910 <sbrk>
     ef8:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     efc:	e51b3008 	ldr	r3, [fp, #-8]
     f00:	e3730001 	cmn	r3, #1
     f04:	1a000001 	bne	f10 <morecore+0x50>
        return 0;
     f08:	e3a03000 	mov	r3, #0
     f0c:	ea00000b 	b	f40 <morecore+0x80>
    hp = (Header*)p;
     f10:	e51b3008 	ldr	r3, [fp, #-8]
     f14:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     f18:	e51b300c 	ldr	r3, [fp, #-12]
     f1c:	e51b2010 	ldr	r2, [fp, #-16]
     f20:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     f24:	e51b300c 	ldr	r3, [fp, #-12]
     f28:	e2833008 	add	r3, r3, #8
     f2c:	e1a00003 	mov	r0, r3
     f30:	ebffff83 	bl	d44 <free>
    return freep;
     f34:	e301323c 	movw	r3, #4668	; 0x123c
     f38:	e3403000 	movt	r3, #0
     f3c:	e5933000 	ldr	r3, [r3]
}
     f40:	e1a00003 	mov	r0, r3
     f44:	e24bd004 	sub	sp, fp, #4
     f48:	e8bd8800 	pop	{fp, pc}

00000f4c <malloc>:

void*
malloc(uint nbytes)
{
     f4c:	e92d4800 	push	{fp, lr}
     f50:	e28db004 	add	fp, sp, #4
     f54:	e24dd018 	sub	sp, sp, #24
     f58:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f60:	e2833007 	add	r3, r3, #7
     f64:	e1a031a3 	lsr	r3, r3, #3
     f68:	e2833001 	add	r3, r3, #1
     f6c:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     f70:	e301323c 	movw	r3, #4668	; 0x123c
     f74:	e3403000 	movt	r3, #0
     f78:	e5933000 	ldr	r3, [r3]
     f7c:	e50b300c 	str	r3, [fp, #-12]
     f80:	e51b300c 	ldr	r3, [fp, #-12]
     f84:	e3530000 	cmp	r3, #0
     f88:	1a000010 	bne	fd0 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     f8c:	e3013234 	movw	r3, #4660	; 0x1234
     f90:	e3403000 	movt	r3, #0
     f94:	e50b300c 	str	r3, [fp, #-12]
     f98:	e301323c 	movw	r3, #4668	; 0x123c
     f9c:	e3403000 	movt	r3, #0
     fa0:	e51b200c 	ldr	r2, [fp, #-12]
     fa4:	e5832000 	str	r2, [r3]
     fa8:	e301323c 	movw	r3, #4668	; 0x123c
     fac:	e3403000 	movt	r3, #0
     fb0:	e5932000 	ldr	r2, [r3]
     fb4:	e3013234 	movw	r3, #4660	; 0x1234
     fb8:	e3403000 	movt	r3, #0
     fbc:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     fc0:	e3013234 	movw	r3, #4660	; 0x1234
     fc4:	e3403000 	movt	r3, #0
     fc8:	e3a02000 	mov	r2, #0
     fcc:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fd0:	e51b300c 	ldr	r3, [fp, #-12]
     fd4:	e5933000 	ldr	r3, [r3]
     fd8:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     fdc:	e51b3008 	ldr	r3, [fp, #-8]
     fe0:	e5932004 	ldr	r2, [r3, #4]
     fe4:	e51b3010 	ldr	r3, [fp, #-16]
     fe8:	e1520003 	cmp	r2, r3
     fec:	3a00001f 	bcc	1070 <malloc+0x124>
            if(p->s.size == nunits)
     ff0:	e51b3008 	ldr	r3, [fp, #-8]
     ff4:	e5932004 	ldr	r2, [r3, #4]
     ff8:	e51b3010 	ldr	r3, [fp, #-16]
     ffc:	e1520003 	cmp	r2, r3
    1000:	1a000004 	bne	1018 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    1004:	e51b3008 	ldr	r3, [fp, #-8]
    1008:	e5932000 	ldr	r2, [r3]
    100c:	e51b300c 	ldr	r3, [fp, #-12]
    1010:	e5832000 	str	r2, [r3]
    1014:	ea00000e 	b	1054 <malloc+0x108>
            else {
                p->s.size -= nunits;
    1018:	e51b3008 	ldr	r3, [fp, #-8]
    101c:	e5932004 	ldr	r2, [r3, #4]
    1020:	e51b3010 	ldr	r3, [fp, #-16]
    1024:	e0632002 	rsb	r2, r3, r2
    1028:	e51b3008 	ldr	r3, [fp, #-8]
    102c:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    1030:	e51b3008 	ldr	r3, [fp, #-8]
    1034:	e5933004 	ldr	r3, [r3, #4]
    1038:	e1a03183 	lsl	r3, r3, #3
    103c:	e51b2008 	ldr	r2, [fp, #-8]
    1040:	e0823003 	add	r3, r2, r3
    1044:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    1048:	e51b3008 	ldr	r3, [fp, #-8]
    104c:	e51b2010 	ldr	r2, [fp, #-16]
    1050:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1054:	e301323c 	movw	r3, #4668	; 0x123c
    1058:	e3403000 	movt	r3, #0
    105c:	e51b200c 	ldr	r2, [fp, #-12]
    1060:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    1064:	e51b3008 	ldr	r3, [fp, #-8]
    1068:	e2833008 	add	r3, r3, #8
    106c:	ea000013 	b	10c0 <malloc+0x174>
        }
        if(p == freep)
    1070:	e301323c 	movw	r3, #4668	; 0x123c
    1074:	e3403000 	movt	r3, #0
    1078:	e5933000 	ldr	r3, [r3]
    107c:	e51b2008 	ldr	r2, [fp, #-8]
    1080:	e1520003 	cmp	r2, r3
    1084:	1a000007 	bne	10a8 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    1088:	e51b0010 	ldr	r0, [fp, #-16]
    108c:	ebffff8b 	bl	ec0 <morecore>
    1090:	e50b0008 	str	r0, [fp, #-8]
    1094:	e51b3008 	ldr	r3, [fp, #-8]
    1098:	e3530000 	cmp	r3, #0
    109c:	1a000001 	bne	10a8 <malloc+0x15c>
                return 0;
    10a0:	e3a03000 	mov	r3, #0
    10a4:	ea000005 	b	10c0 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10a8:	e51b3008 	ldr	r3, [fp, #-8]
    10ac:	e50b300c 	str	r3, [fp, #-12]
    10b0:	e51b3008 	ldr	r3, [fp, #-8]
    10b4:	e5933000 	ldr	r3, [r3]
    10b8:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    10bc:	eaffffc6 	b	fdc <malloc+0x90>
}
    10c0:	e1a00003 	mov	r0, r3
    10c4:	e24bd004 	sub	sp, fp, #4
    10c8:	e8bd8800 	pop	{fp, pc}

000010cc <__aeabi_uidiv>:
    10cc:	e2512001 	subs	r2, r1, #1
    10d0:	012fff1e 	bxeq	lr
    10d4:	3a000036 	bcc	11b4 <__aeabi_uidiv+0xe8>
    10d8:	e1500001 	cmp	r0, r1
    10dc:	9a000022 	bls	116c <__aeabi_uidiv+0xa0>
    10e0:	e1110002 	tst	r1, r2
    10e4:	0a000023 	beq	1178 <__aeabi_uidiv+0xac>
    10e8:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    10ec:	01a01181 	lsleq	r1, r1, #3
    10f0:	03a03008 	moveq	r3, #8
    10f4:	13a03001 	movne	r3, #1
    10f8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    10fc:	31510000 	cmpcc	r1, r0
    1100:	31a01201 	lslcc	r1, r1, #4
    1104:	31a03203 	lslcc	r3, r3, #4
    1108:	3afffffa 	bcc	10f8 <__aeabi_uidiv+0x2c>
    110c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1110:	31510000 	cmpcc	r1, r0
    1114:	31a01081 	lslcc	r1, r1, #1
    1118:	31a03083 	lslcc	r3, r3, #1
    111c:	3afffffa 	bcc	110c <__aeabi_uidiv+0x40>
    1120:	e3a02000 	mov	r2, #0
    1124:	e1500001 	cmp	r0, r1
    1128:	20400001 	subcs	r0, r0, r1
    112c:	21822003 	orrcs	r2, r2, r3
    1130:	e15000a1 	cmp	r0, r1, lsr #1
    1134:	204000a1 	subcs	r0, r0, r1, lsr #1
    1138:	218220a3 	orrcs	r2, r2, r3, lsr #1
    113c:	e1500121 	cmp	r0, r1, lsr #2
    1140:	20400121 	subcs	r0, r0, r1, lsr #2
    1144:	21822123 	orrcs	r2, r2, r3, lsr #2
    1148:	e15001a1 	cmp	r0, r1, lsr #3
    114c:	204001a1 	subcs	r0, r0, r1, lsr #3
    1150:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1154:	e3500000 	cmp	r0, #0
    1158:	11b03223 	lsrsne	r3, r3, #4
    115c:	11a01221 	lsrne	r1, r1, #4
    1160:	1affffef 	bne	1124 <__aeabi_uidiv+0x58>
    1164:	e1a00002 	mov	r0, r2
    1168:	e12fff1e 	bx	lr
    116c:	03a00001 	moveq	r0, #1
    1170:	13a00000 	movne	r0, #0
    1174:	e12fff1e 	bx	lr
    1178:	e3510801 	cmp	r1, #65536	; 0x10000
    117c:	21a01821 	lsrcs	r1, r1, #16
    1180:	23a02010 	movcs	r2, #16
    1184:	33a02000 	movcc	r2, #0
    1188:	e3510c01 	cmp	r1, #256	; 0x100
    118c:	21a01421 	lsrcs	r1, r1, #8
    1190:	22822008 	addcs	r2, r2, #8
    1194:	e3510010 	cmp	r1, #16
    1198:	21a01221 	lsrcs	r1, r1, #4
    119c:	22822004 	addcs	r2, r2, #4
    11a0:	e3510004 	cmp	r1, #4
    11a4:	82822003 	addhi	r2, r2, #3
    11a8:	908220a1 	addls	r2, r2, r1, lsr #1
    11ac:	e1a00230 	lsr	r0, r0, r2
    11b0:	e12fff1e 	bx	lr
    11b4:	e3500000 	cmp	r0, #0
    11b8:	13e00000 	mvnne	r0, #0
    11bc:	ea000007 	b	11e0 <__aeabi_idiv0>

000011c0 <__aeabi_uidivmod>:
    11c0:	e3510000 	cmp	r1, #0
    11c4:	0afffffa 	beq	11b4 <__aeabi_uidiv+0xe8>
    11c8:	e92d4003 	push	{r0, r1, lr}
    11cc:	ebffffbe 	bl	10cc <__aeabi_uidiv>
    11d0:	e8bd4006 	pop	{r1, r2, lr}
    11d4:	e0030092 	mul	r3, r2, r0
    11d8:	e0411003 	sub	r1, r1, r3
    11dc:	e12fff1e 	bx	lr

000011e0 <__aeabi_idiv0>:
    11e0:	e12fff1e 	bx	lr
