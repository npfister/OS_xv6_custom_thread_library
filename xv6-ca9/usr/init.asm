
_init:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd008 	sub	sp, sp, #8
    int pid, wpid;
    
    if(open("console", O_RDWR) < 0){
       c:	e301019c 	movw	r0, #4508	; 0x119c
      10:	e3400000 	movt	r0, #0
      14:	e3a01002 	mov	r1, #2
      18:	eb0001cf 	bl	75c <open>
      1c:	e1a03000 	mov	r3, r0
      20:	e3530000 	cmp	r3, #0
      24:	aa000008 	bge	4c <main+0x4c>
        mknod("console", 1, 1);
      28:	e301019c 	movw	r0, #4508	; 0x119c
      2c:	e3400000 	movt	r0, #0
      30:	e3a01001 	mov	r1, #1
      34:	e3a02001 	mov	r2, #1
      38:	eb0001d0 	bl	780 <mknod>
        open("console", O_RDWR);
      3c:	e301019c 	movw	r0, #4508	; 0x119c
      40:	e3400000 	movt	r0, #0
      44:	e3a01002 	mov	r1, #2
      48:	eb0001c3 	bl	75c <open>
    }
    dup(0);  // stdout
      4c:	e3a00000 	mov	r0, #0
      50:	eb000200 	bl	858 <dup>
    dup(0);  // stderr
      54:	e3a00000 	mov	r0, #0
      58:	eb0001fe 	bl	858 <dup>
      5c:	ea000000 	b	64 <main+0x64>
            printf(1, "init: exec sh failed\n");
            exit();
        }
        while((wpid=wait()) >= 0 && wpid != pid)
            printf(1, "zombie!\n");
    }
      60:	e1a00000 	nop			; (mov r0, r0)
    }
    dup(0);  // stdout
    dup(0);  // stderr
    
    for(;;){
        printf(1, "init: starting sh\n");
      64:	e3a00001 	mov	r0, #1
      68:	e30111a4 	movw	r1, #4516	; 0x11a4
      6c:	e3401000 	movt	r1, #0
      70:	eb000292 	bl	ac0 <printf>
        pid = fork();
      74:	eb000167 	bl	618 <fork>
      78:	e50b0008 	str	r0, [fp, #-8]
        if(pid < 0){
      7c:	e51b3008 	ldr	r3, [fp, #-8]
      80:	e3530000 	cmp	r3, #0
      84:	aa000004 	bge	9c <main+0x9c>
            printf(1, "init: fork failed\n");
      88:	e3a00001 	mov	r0, #1
      8c:	e30111b8 	movw	r1, #4536	; 0x11b8
      90:	e3401000 	movt	r1, #0
      94:	eb000289 	bl	ac0 <printf>
            exit();
      98:	eb000167 	bl	63c <exit>
        }
        if(pid == 0){
      9c:	e51b3008 	ldr	r3, [fp, #-8]
      a0:	e3530000 	cmp	r3, #0
      a4:	1a00000d 	bne	e0 <main+0xe0>
            exec("sh", argv);
      a8:	e3010198 	movw	r0, #4504	; 0x1198
      ac:	e3400000 	movt	r0, #0
      b0:	e30111f8 	movw	r1, #4600	; 0x11f8
      b4:	e3401000 	movt	r1, #0
      b8:	eb00019e 	bl	738 <exec>
            printf(1, "init: exec sh failed\n");
      bc:	e3a00001 	mov	r0, #1
      c0:	e30111cc 	movw	r1, #4556	; 0x11cc
      c4:	e3401000 	movt	r1, #0
      c8:	eb00027c 	bl	ac0 <printf>
            exit();
      cc:	eb00015a 	bl	63c <exit>
        }
        while((wpid=wait()) >= 0 && wpid != pid)
            printf(1, "zombie!\n");
      d0:	e3a00001 	mov	r0, #1
      d4:	e30111e4 	movw	r1, #4580	; 0x11e4
      d8:	e3401000 	movt	r1, #0
      dc:	eb000277 	bl	ac0 <printf>
        if(pid == 0){
            exec("sh", argv);
            printf(1, "init: exec sh failed\n");
            exit();
        }
        while((wpid=wait()) >= 0 && wpid != pid)
      e0:	eb00015e 	bl	660 <wait>
      e4:	e50b000c 	str	r0, [fp, #-12]
      e8:	e51b300c 	ldr	r3, [fp, #-12]
      ec:	e3530000 	cmp	r3, #0
      f0:	baffffda 	blt	60 <main+0x60>
      f4:	e51b200c 	ldr	r2, [fp, #-12]
      f8:	e51b3008 	ldr	r3, [fp, #-8]
      fc:	e1520003 	cmp	r2, r3
     100:	1afffff2 	bne	d0 <main+0xd0>
            printf(1, "zombie!\n");
    }
     104:	eaffffd5 	b	60 <main+0x60>

00000108 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
     108:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     10c:	e28db000 	add	fp, sp, #0
     110:	e24dd014 	sub	sp, sp, #20
     114:	e50b0010 	str	r0, [fp, #-16]
     118:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
     11c:	e51b3010 	ldr	r3, [fp, #-16]
     120:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
     124:	e1a00000 	nop			; (mov r0, r0)
     128:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     12c:	e5d32000 	ldrb	r2, [r3]
     130:	e51b3010 	ldr	r3, [fp, #-16]
     134:	e5c32000 	strb	r2, [r3]
     138:	e51b3010 	ldr	r3, [fp, #-16]
     13c:	e5d33000 	ldrb	r3, [r3]
     140:	e3530000 	cmp	r3, #0
     144:	03a03000 	moveq	r3, #0
     148:	13a03001 	movne	r3, #1
     14c:	e6ef3073 	uxtb	r3, r3
     150:	e51b2010 	ldr	r2, [fp, #-16]
     154:	e2822001 	add	r2, r2, #1
     158:	e50b2010 	str	r2, [fp, #-16]
     15c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     160:	e2822001 	add	r2, r2, #1
     164:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
     168:	e3530000 	cmp	r3, #0
     16c:	1affffed 	bne	128 <strcpy+0x20>
        ;
    return os;
     170:	e51b3008 	ldr	r3, [fp, #-8]
}
     174:	e1a00003 	mov	r0, r3
     178:	e28bd000 	add	sp, fp, #0
     17c:	e8bd0800 	pop	{fp}
     180:	e12fff1e 	bx	lr

00000184 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     184:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     188:	e28db000 	add	fp, sp, #0
     18c:	e24dd00c 	sub	sp, sp, #12
     190:	e50b0008 	str	r0, [fp, #-8]
     194:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     198:	ea000005 	b	1b4 <strcmp+0x30>
        p++, q++;
     19c:	e51b3008 	ldr	r3, [fp, #-8]
     1a0:	e2833001 	add	r3, r3, #1
     1a4:	e50b3008 	str	r3, [fp, #-8]
     1a8:	e51b300c 	ldr	r3, [fp, #-12]
     1ac:	e2833001 	add	r3, r3, #1
     1b0:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     1b4:	e51b3008 	ldr	r3, [fp, #-8]
     1b8:	e5d33000 	ldrb	r3, [r3]
     1bc:	e3530000 	cmp	r3, #0
     1c0:	0a000005 	beq	1dc <strcmp+0x58>
     1c4:	e51b3008 	ldr	r3, [fp, #-8]
     1c8:	e5d32000 	ldrb	r2, [r3]
     1cc:	e51b300c 	ldr	r3, [fp, #-12]
     1d0:	e5d33000 	ldrb	r3, [r3]
     1d4:	e1520003 	cmp	r2, r3
     1d8:	0affffef 	beq	19c <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     1dc:	e51b3008 	ldr	r3, [fp, #-8]
     1e0:	e5d33000 	ldrb	r3, [r3]
     1e4:	e1a02003 	mov	r2, r3
     1e8:	e51b300c 	ldr	r3, [fp, #-12]
     1ec:	e5d33000 	ldrb	r3, [r3]
     1f0:	e0633002 	rsb	r3, r3, r2
}
     1f4:	e1a00003 	mov	r0, r3
     1f8:	e28bd000 	add	sp, fp, #0
     1fc:	e8bd0800 	pop	{fp}
     200:	e12fff1e 	bx	lr

00000204 <strlen>:

uint
strlen(char *s)
{
     204:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     208:	e28db000 	add	fp, sp, #0
     20c:	e24dd014 	sub	sp, sp, #20
     210:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     214:	e3a03000 	mov	r3, #0
     218:	e50b3008 	str	r3, [fp, #-8]
     21c:	ea000002 	b	22c <strlen+0x28>
     220:	e51b3008 	ldr	r3, [fp, #-8]
     224:	e2833001 	add	r3, r3, #1
     228:	e50b3008 	str	r3, [fp, #-8]
     22c:	e51b3008 	ldr	r3, [fp, #-8]
     230:	e51b2010 	ldr	r2, [fp, #-16]
     234:	e0823003 	add	r3, r2, r3
     238:	e5d33000 	ldrb	r3, [r3]
     23c:	e3530000 	cmp	r3, #0
     240:	1afffff6 	bne	220 <strlen+0x1c>
        ;
    return n;
     244:	e51b3008 	ldr	r3, [fp, #-8]
}
     248:	e1a00003 	mov	r0, r3
     24c:	e28bd000 	add	sp, fp, #0
     250:	e8bd0800 	pop	{fp}
     254:	e12fff1e 	bx	lr

00000258 <memset>:

void*
memset(void *dst, int v, uint n)
{
     258:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     25c:	e28db000 	add	fp, sp, #0
     260:	e24dd024 	sub	sp, sp, #36	; 0x24
     264:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     268:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     26c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     270:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     274:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     278:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     27c:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     280:	e55b300d 	ldrb	r3, [fp, #-13]
     284:	e1a02c03 	lsl	r2, r3, #24
     288:	e55b300d 	ldrb	r3, [fp, #-13]
     28c:	e1a03803 	lsl	r3, r3, #16
     290:	e1822003 	orr	r2, r2, r3
     294:	e55b300d 	ldrb	r3, [fp, #-13]
     298:	e1a03403 	lsl	r3, r3, #8
     29c:	e1822003 	orr	r2, r2, r3
     2a0:	e55b300d 	ldrb	r3, [fp, #-13]
     2a4:	e1823003 	orr	r3, r2, r3
     2a8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     2ac:	ea000008 	b	2d4 <memset+0x7c>
		*p = c;
     2b0:	e51b3008 	ldr	r3, [fp, #-8]
     2b4:	e55b200d 	ldrb	r2, [fp, #-13]
     2b8:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     2bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2c0:	e2433001 	sub	r3, r3, #1
     2c4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     2c8:	e51b3008 	ldr	r3, [fp, #-8]
     2cc:	e2833001 	add	r3, r3, #1
     2d0:	e50b3008 	str	r3, [fp, #-8]
     2d4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     2d8:	e3530000 	cmp	r3, #0
     2dc:	0a000003 	beq	2f0 <memset+0x98>
     2e0:	e51b3008 	ldr	r3, [fp, #-8]
     2e4:	e2033003 	and	r3, r3, #3
     2e8:	e3530000 	cmp	r3, #0
     2ec:	1affffef 	bne	2b0 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     2f0:	e51b3008 	ldr	r3, [fp, #-8]
     2f4:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     2f8:	ea000008 	b	320 <memset+0xc8>
		*p4 = val;
     2fc:	e51b300c 	ldr	r3, [fp, #-12]
     300:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     304:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     308:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     30c:	e2433004 	sub	r3, r3, #4
     310:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     314:	e51b300c 	ldr	r3, [fp, #-12]
     318:	e2833004 	add	r3, r3, #4
     31c:	e50b300c 	str	r3, [fp, #-12]
     320:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     324:	e3530003 	cmp	r3, #3
     328:	8afffff3 	bhi	2fc <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     32c:	e51b300c 	ldr	r3, [fp, #-12]
     330:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     334:	ea000008 	b	35c <memset+0x104>
		*p = c;
     338:	e51b3008 	ldr	r3, [fp, #-8]
     33c:	e55b200d 	ldrb	r2, [fp, #-13]
     340:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     344:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     348:	e2433001 	sub	r3, r3, #1
     34c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     350:	e51b3008 	ldr	r3, [fp, #-8]
     354:	e2833001 	add	r3, r3, #1
     358:	e50b3008 	str	r3, [fp, #-8]
     35c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     360:	e3530000 	cmp	r3, #0
     364:	1afffff3 	bne	338 <memset+0xe0>
		*p = c;
	}

	return dst;
     368:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     36c:	e1a00003 	mov	r0, r3
     370:	e28bd000 	add	sp, fp, #0
     374:	e8bd0800 	pop	{fp}
     378:	e12fff1e 	bx	lr

0000037c <strchr>:

char*
strchr(const char *s, char c)
{
     37c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     380:	e28db000 	add	fp, sp, #0
     384:	e24dd00c 	sub	sp, sp, #12
     388:	e50b0008 	str	r0, [fp, #-8]
     38c:	e1a03001 	mov	r3, r1
     390:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     394:	ea000009 	b	3c0 <strchr+0x44>
        if(*s == c)
     398:	e51b3008 	ldr	r3, [fp, #-8]
     39c:	e5d33000 	ldrb	r3, [r3]
     3a0:	e55b2009 	ldrb	r2, [fp, #-9]
     3a4:	e1520003 	cmp	r2, r3
     3a8:	1a000001 	bne	3b4 <strchr+0x38>
            return (char*)s;
     3ac:	e51b3008 	ldr	r3, [fp, #-8]
     3b0:	ea000007 	b	3d4 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     3b4:	e51b3008 	ldr	r3, [fp, #-8]
     3b8:	e2833001 	add	r3, r3, #1
     3bc:	e50b3008 	str	r3, [fp, #-8]
     3c0:	e51b3008 	ldr	r3, [fp, #-8]
     3c4:	e5d33000 	ldrb	r3, [r3]
     3c8:	e3530000 	cmp	r3, #0
     3cc:	1afffff1 	bne	398 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     3d0:	e3a03000 	mov	r3, #0
}
     3d4:	e1a00003 	mov	r0, r3
     3d8:	e28bd000 	add	sp, fp, #0
     3dc:	e8bd0800 	pop	{fp}
     3e0:	e12fff1e 	bx	lr

000003e4 <gets>:

char*
gets(char *buf, int max)
{
     3e4:	e92d4800 	push	{fp, lr}
     3e8:	e28db004 	add	fp, sp, #4
     3ec:	e24dd018 	sub	sp, sp, #24
     3f0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     3f4:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     3f8:	e3a03000 	mov	r3, #0
     3fc:	e50b3008 	str	r3, [fp, #-8]
     400:	ea000016 	b	460 <gets+0x7c>
        cc = read(0, &c, 1);
     404:	e3a00000 	mov	r0, #0
     408:	e24b300d 	sub	r3, fp, #13
     40c:	e1a01003 	mov	r1, r3
     410:	e3a02001 	mov	r2, #1
     414:	eb0000a3 	bl	6a8 <read>
     418:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     41c:	e51b300c 	ldr	r3, [fp, #-12]
     420:	e3530000 	cmp	r3, #0
     424:	da000013 	ble	478 <gets+0x94>
            break;
        buf[i++] = c;
     428:	e51b3008 	ldr	r3, [fp, #-8]
     42c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     430:	e0823003 	add	r3, r2, r3
     434:	e55b200d 	ldrb	r2, [fp, #-13]
     438:	e5c32000 	strb	r2, [r3]
     43c:	e51b3008 	ldr	r3, [fp, #-8]
     440:	e2833001 	add	r3, r3, #1
     444:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     448:	e55b300d 	ldrb	r3, [fp, #-13]
     44c:	e353000a 	cmp	r3, #10
     450:	0a000009 	beq	47c <gets+0x98>
     454:	e55b300d 	ldrb	r3, [fp, #-13]
     458:	e353000d 	cmp	r3, #13
     45c:	0a000006 	beq	47c <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     460:	e51b3008 	ldr	r3, [fp, #-8]
     464:	e2832001 	add	r2, r3, #1
     468:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     46c:	e1520003 	cmp	r2, r3
     470:	baffffe3 	blt	404 <gets+0x20>
     474:	ea000000 	b	47c <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     478:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     47c:	e51b3008 	ldr	r3, [fp, #-8]
     480:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     484:	e0823003 	add	r3, r2, r3
     488:	e3a02000 	mov	r2, #0
     48c:	e5c32000 	strb	r2, [r3]
    return buf;
     490:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     494:	e1a00003 	mov	r0, r3
     498:	e24bd004 	sub	sp, fp, #4
     49c:	e8bd8800 	pop	{fp, pc}

000004a0 <stat>:

int
stat(char *n, struct stat *st)
{
     4a0:	e92d4800 	push	{fp, lr}
     4a4:	e28db004 	add	fp, sp, #4
     4a8:	e24dd010 	sub	sp, sp, #16
     4ac:	e50b0010 	str	r0, [fp, #-16]
     4b0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     4b4:	e51b0010 	ldr	r0, [fp, #-16]
     4b8:	e3a01000 	mov	r1, #0
     4bc:	eb0000a6 	bl	75c <open>
     4c0:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     4c4:	e51b3008 	ldr	r3, [fp, #-8]
     4c8:	e3530000 	cmp	r3, #0
     4cc:	aa000001 	bge	4d8 <stat+0x38>
        return -1;
     4d0:	e3e03000 	mvn	r3, #0
     4d4:	ea000006 	b	4f4 <stat+0x54>
    r = fstat(fd, st);
     4d8:	e51b0008 	ldr	r0, [fp, #-8]
     4dc:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     4e0:	eb0000b8 	bl	7c8 <fstat>
     4e4:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     4e8:	e51b0008 	ldr	r0, [fp, #-8]
     4ec:	eb00007f 	bl	6f0 <close>
    return r;
     4f0:	e51b300c 	ldr	r3, [fp, #-12]
}
     4f4:	e1a00003 	mov	r0, r3
     4f8:	e24bd004 	sub	sp, fp, #4
     4fc:	e8bd8800 	pop	{fp, pc}

00000500 <atoi>:

int
atoi(const char *s)
{
     500:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     504:	e28db000 	add	fp, sp, #0
     508:	e24dd014 	sub	sp, sp, #20
     50c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     510:	e3a03000 	mov	r3, #0
     514:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     518:	ea00000d 	b	554 <atoi+0x54>
        n = n*10 + *s++ - '0';
     51c:	e51b2008 	ldr	r2, [fp, #-8]
     520:	e1a03002 	mov	r3, r2
     524:	e1a03103 	lsl	r3, r3, #2
     528:	e0833002 	add	r3, r3, r2
     52c:	e1a03083 	lsl	r3, r3, #1
     530:	e1a02003 	mov	r2, r3
     534:	e51b3010 	ldr	r3, [fp, #-16]
     538:	e5d33000 	ldrb	r3, [r3]
     53c:	e0823003 	add	r3, r2, r3
     540:	e2433030 	sub	r3, r3, #48	; 0x30
     544:	e50b3008 	str	r3, [fp, #-8]
     548:	e51b3010 	ldr	r3, [fp, #-16]
     54c:	e2833001 	add	r3, r3, #1
     550:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     554:	e51b3010 	ldr	r3, [fp, #-16]
     558:	e5d33000 	ldrb	r3, [r3]
     55c:	e353002f 	cmp	r3, #47	; 0x2f
     560:	9a000003 	bls	574 <atoi+0x74>
     564:	e51b3010 	ldr	r3, [fp, #-16]
     568:	e5d33000 	ldrb	r3, [r3]
     56c:	e3530039 	cmp	r3, #57	; 0x39
     570:	9affffe9 	bls	51c <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     574:	e51b3008 	ldr	r3, [fp, #-8]
}
     578:	e1a00003 	mov	r0, r3
     57c:	e28bd000 	add	sp, fp, #0
     580:	e8bd0800 	pop	{fp}
     584:	e12fff1e 	bx	lr

00000588 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     588:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     58c:	e28db000 	add	fp, sp, #0
     590:	e24dd01c 	sub	sp, sp, #28
     594:	e50b0010 	str	r0, [fp, #-16]
     598:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     59c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     5a0:	e51b3010 	ldr	r3, [fp, #-16]
     5a4:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     5a8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     5ac:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     5b0:	ea000009 	b	5dc <memmove+0x54>
        *dst++ = *src++;
     5b4:	e51b300c 	ldr	r3, [fp, #-12]
     5b8:	e5d32000 	ldrb	r2, [r3]
     5bc:	e51b3008 	ldr	r3, [fp, #-8]
     5c0:	e5c32000 	strb	r2, [r3]
     5c4:	e51b3008 	ldr	r3, [fp, #-8]
     5c8:	e2833001 	add	r3, r3, #1
     5cc:	e50b3008 	str	r3, [fp, #-8]
     5d0:	e51b300c 	ldr	r3, [fp, #-12]
     5d4:	e2833001 	add	r3, r3, #1
     5d8:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     5dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     5e0:	e3530000 	cmp	r3, #0
     5e4:	d3a03000 	movle	r3, #0
     5e8:	c3a03001 	movgt	r3, #1
     5ec:	e6ef3073 	uxtb	r3, r3
     5f0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     5f4:	e2422001 	sub	r2, r2, #1
     5f8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     5fc:	e3530000 	cmp	r3, #0
     600:	1affffeb 	bne	5b4 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     604:	e51b3010 	ldr	r3, [fp, #-16]
}
     608:	e1a00003 	mov	r0, r3
     60c:	e28bd000 	add	sp, fp, #0
     610:	e8bd0800 	pop	{fp}
     614:	e12fff1e 	bx	lr

00000618 <fork>:
     618:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     61c:	e1a04003 	mov	r4, r3
     620:	e1a03002 	mov	r3, r2
     624:	e1a02001 	mov	r2, r1
     628:	e1a01000 	mov	r1, r0
     62c:	e3a00001 	mov	r0, #1
     630:	ef000000 	svc	0x00000000
     634:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     638:	e12fff1e 	bx	lr

0000063c <exit>:
     63c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     640:	e1a04003 	mov	r4, r3
     644:	e1a03002 	mov	r3, r2
     648:	e1a02001 	mov	r2, r1
     64c:	e1a01000 	mov	r1, r0
     650:	e3a00002 	mov	r0, #2
     654:	ef000000 	svc	0x00000000
     658:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     65c:	e12fff1e 	bx	lr

00000660 <wait>:
     660:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     664:	e1a04003 	mov	r4, r3
     668:	e1a03002 	mov	r3, r2
     66c:	e1a02001 	mov	r2, r1
     670:	e1a01000 	mov	r1, r0
     674:	e3a00003 	mov	r0, #3
     678:	ef000000 	svc	0x00000000
     67c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     680:	e12fff1e 	bx	lr

00000684 <pipe>:
     684:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     688:	e1a04003 	mov	r4, r3
     68c:	e1a03002 	mov	r3, r2
     690:	e1a02001 	mov	r2, r1
     694:	e1a01000 	mov	r1, r0
     698:	e3a00004 	mov	r0, #4
     69c:	ef000000 	svc	0x00000000
     6a0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6a4:	e12fff1e 	bx	lr

000006a8 <read>:
     6a8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6ac:	e1a04003 	mov	r4, r3
     6b0:	e1a03002 	mov	r3, r2
     6b4:	e1a02001 	mov	r2, r1
     6b8:	e1a01000 	mov	r1, r0
     6bc:	e3a00005 	mov	r0, #5
     6c0:	ef000000 	svc	0x00000000
     6c4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6c8:	e12fff1e 	bx	lr

000006cc <write>:
     6cc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6d0:	e1a04003 	mov	r4, r3
     6d4:	e1a03002 	mov	r3, r2
     6d8:	e1a02001 	mov	r2, r1
     6dc:	e1a01000 	mov	r1, r0
     6e0:	e3a00010 	mov	r0, #16
     6e4:	ef000000 	svc	0x00000000
     6e8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     6ec:	e12fff1e 	bx	lr

000006f0 <close>:
     6f0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     6f4:	e1a04003 	mov	r4, r3
     6f8:	e1a03002 	mov	r3, r2
     6fc:	e1a02001 	mov	r2, r1
     700:	e1a01000 	mov	r1, r0
     704:	e3a00015 	mov	r0, #21
     708:	ef000000 	svc	0x00000000
     70c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     710:	e12fff1e 	bx	lr

00000714 <kill>:
     714:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     718:	e1a04003 	mov	r4, r3
     71c:	e1a03002 	mov	r3, r2
     720:	e1a02001 	mov	r2, r1
     724:	e1a01000 	mov	r1, r0
     728:	e3a00006 	mov	r0, #6
     72c:	ef000000 	svc	0x00000000
     730:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     734:	e12fff1e 	bx	lr

00000738 <exec>:
     738:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     73c:	e1a04003 	mov	r4, r3
     740:	e1a03002 	mov	r3, r2
     744:	e1a02001 	mov	r2, r1
     748:	e1a01000 	mov	r1, r0
     74c:	e3a00007 	mov	r0, #7
     750:	ef000000 	svc	0x00000000
     754:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     758:	e12fff1e 	bx	lr

0000075c <open>:
     75c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     760:	e1a04003 	mov	r4, r3
     764:	e1a03002 	mov	r3, r2
     768:	e1a02001 	mov	r2, r1
     76c:	e1a01000 	mov	r1, r0
     770:	e3a0000f 	mov	r0, #15
     774:	ef000000 	svc	0x00000000
     778:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     77c:	e12fff1e 	bx	lr

00000780 <mknod>:
     780:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     784:	e1a04003 	mov	r4, r3
     788:	e1a03002 	mov	r3, r2
     78c:	e1a02001 	mov	r2, r1
     790:	e1a01000 	mov	r1, r0
     794:	e3a00011 	mov	r0, #17
     798:	ef000000 	svc	0x00000000
     79c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7a0:	e12fff1e 	bx	lr

000007a4 <unlink>:
     7a4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7a8:	e1a04003 	mov	r4, r3
     7ac:	e1a03002 	mov	r3, r2
     7b0:	e1a02001 	mov	r2, r1
     7b4:	e1a01000 	mov	r1, r0
     7b8:	e3a00012 	mov	r0, #18
     7bc:	ef000000 	svc	0x00000000
     7c0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7c4:	e12fff1e 	bx	lr

000007c8 <fstat>:
     7c8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7cc:	e1a04003 	mov	r4, r3
     7d0:	e1a03002 	mov	r3, r2
     7d4:	e1a02001 	mov	r2, r1
     7d8:	e1a01000 	mov	r1, r0
     7dc:	e3a00008 	mov	r0, #8
     7e0:	ef000000 	svc	0x00000000
     7e4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     7e8:	e12fff1e 	bx	lr

000007ec <link>:
     7ec:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     7f0:	e1a04003 	mov	r4, r3
     7f4:	e1a03002 	mov	r3, r2
     7f8:	e1a02001 	mov	r2, r1
     7fc:	e1a01000 	mov	r1, r0
     800:	e3a00013 	mov	r0, #19
     804:	ef000000 	svc	0x00000000
     808:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     80c:	e12fff1e 	bx	lr

00000810 <mkdir>:
     810:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     814:	e1a04003 	mov	r4, r3
     818:	e1a03002 	mov	r3, r2
     81c:	e1a02001 	mov	r2, r1
     820:	e1a01000 	mov	r1, r0
     824:	e3a00014 	mov	r0, #20
     828:	ef000000 	svc	0x00000000
     82c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     830:	e12fff1e 	bx	lr

00000834 <chdir>:
     834:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     838:	e1a04003 	mov	r4, r3
     83c:	e1a03002 	mov	r3, r2
     840:	e1a02001 	mov	r2, r1
     844:	e1a01000 	mov	r1, r0
     848:	e3a00009 	mov	r0, #9
     84c:	ef000000 	svc	0x00000000
     850:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     854:	e12fff1e 	bx	lr

00000858 <dup>:
     858:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     85c:	e1a04003 	mov	r4, r3
     860:	e1a03002 	mov	r3, r2
     864:	e1a02001 	mov	r2, r1
     868:	e1a01000 	mov	r1, r0
     86c:	e3a0000a 	mov	r0, #10
     870:	ef000000 	svc	0x00000000
     874:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     878:	e12fff1e 	bx	lr

0000087c <getpid>:
     87c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     880:	e1a04003 	mov	r4, r3
     884:	e1a03002 	mov	r3, r2
     888:	e1a02001 	mov	r2, r1
     88c:	e1a01000 	mov	r1, r0
     890:	e3a0000b 	mov	r0, #11
     894:	ef000000 	svc	0x00000000
     898:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     89c:	e12fff1e 	bx	lr

000008a0 <sbrk>:
     8a0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8a4:	e1a04003 	mov	r4, r3
     8a8:	e1a03002 	mov	r3, r2
     8ac:	e1a02001 	mov	r2, r1
     8b0:	e1a01000 	mov	r1, r0
     8b4:	e3a0000c 	mov	r0, #12
     8b8:	ef000000 	svc	0x00000000
     8bc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8c0:	e12fff1e 	bx	lr

000008c4 <sleep>:
     8c4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8c8:	e1a04003 	mov	r4, r3
     8cc:	e1a03002 	mov	r3, r2
     8d0:	e1a02001 	mov	r2, r1
     8d4:	e1a01000 	mov	r1, r0
     8d8:	e3a0000d 	mov	r0, #13
     8dc:	ef000000 	svc	0x00000000
     8e0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8e4:	e12fff1e 	bx	lr

000008e8 <uptime>:
     8e8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8ec:	e1a04003 	mov	r4, r3
     8f0:	e1a03002 	mov	r3, r2
     8f4:	e1a02001 	mov	r2, r1
     8f8:	e1a01000 	mov	r1, r0
     8fc:	e3a0000e 	mov	r0, #14
     900:	ef000000 	svc	0x00000000
     904:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     908:	e12fff1e 	bx	lr

0000090c <kthread_create>:
     90c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     910:	e1a04003 	mov	r4, r3
     914:	e1a03002 	mov	r3, r2
     918:	e1a02001 	mov	r2, r1
     91c:	e1a01000 	mov	r1, r0
     920:	e3a00016 	mov	r0, #22
     924:	ef000000 	svc	0x00000000
     928:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     92c:	e12fff1e 	bx	lr

00000930 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     930:	e92d4800 	push	{fp, lr}
     934:	e28db004 	add	fp, sp, #4
     938:	e24dd008 	sub	sp, sp, #8
     93c:	e50b0008 	str	r0, [fp, #-8]
     940:	e1a03001 	mov	r3, r1
     944:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     948:	e51b0008 	ldr	r0, [fp, #-8]
     94c:	e24b3009 	sub	r3, fp, #9
     950:	e1a01003 	mov	r1, r3
     954:	e3a02001 	mov	r2, #1
     958:	ebffff5b 	bl	6cc <write>
}
     95c:	e24bd004 	sub	sp, fp, #4
     960:	e8bd8800 	pop	{fp, pc}

00000964 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     964:	e92d4800 	push	{fp, lr}
     968:	e28db004 	add	fp, sp, #4
     96c:	e24dd030 	sub	sp, sp, #48	; 0x30
     970:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     974:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     978:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     97c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     980:	e3a03000 	mov	r3, #0
     984:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     988:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     98c:	e3530000 	cmp	r3, #0
     990:	0a000008 	beq	9b8 <printint+0x54>
     994:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     998:	e3530000 	cmp	r3, #0
     99c:	aa000005 	bge	9b8 <printint+0x54>
        neg = 1;
     9a0:	e3a03001 	mov	r3, #1
     9a4:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     9a8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     9ac:	e2633000 	rsb	r3, r3, #0
     9b0:	e50b3010 	str	r3, [fp, #-16]
     9b4:	ea000001 	b	9c0 <printint+0x5c>
    } else {
        x = xx;
     9b8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     9bc:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     9c0:	e3a03000 	mov	r3, #0
     9c4:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     9c8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     9cc:	e51b2010 	ldr	r2, [fp, #-16]
     9d0:	e1a00002 	mov	r0, r2
     9d4:	e1a01003 	mov	r1, r3
     9d8:	eb0001e5 	bl	1174 <__aeabi_uidivmod>
     9dc:	e1a03001 	mov	r3, r1
     9e0:	e1a02003 	mov	r2, r3
     9e4:	e3013200 	movw	r3, #4608	; 0x1200
     9e8:	e3403000 	movt	r3, #0
     9ec:	e7d32002 	ldrb	r2, [r3, r2]
     9f0:	e3e0001b 	mvn	r0, #27
     9f4:	e51b3008 	ldr	r3, [fp, #-8]
     9f8:	e24bc004 	sub	ip, fp, #4
     9fc:	e08c1003 	add	r1, ip, r3
     a00:	e1a03000 	mov	r3, r0
     a04:	e0813003 	add	r3, r1, r3
     a08:	e5c32000 	strb	r2, [r3]
     a0c:	e51b3008 	ldr	r3, [fp, #-8]
     a10:	e2833001 	add	r3, r3, #1
     a14:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     a18:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     a1c:	e51b0010 	ldr	r0, [fp, #-16]
     a20:	e1a01003 	mov	r1, r3
     a24:	eb000195 	bl	1080 <__aeabi_uidiv>
     a28:	e1a03000 	mov	r3, r0
     a2c:	e50b3010 	str	r3, [fp, #-16]
     a30:	e51b3010 	ldr	r3, [fp, #-16]
     a34:	e3530000 	cmp	r3, #0
     a38:	1affffe2 	bne	9c8 <printint+0x64>
    if(neg)
     a3c:	e51b300c 	ldr	r3, [fp, #-12]
     a40:	e3530000 	cmp	r3, #0
     a44:	0a000015 	beq	aa0 <printint+0x13c>
        buf[i++] = '-';
     a48:	e3e0101b 	mvn	r1, #27
     a4c:	e51b3008 	ldr	r3, [fp, #-8]
     a50:	e24b0004 	sub	r0, fp, #4
     a54:	e0802003 	add	r2, r0, r3
     a58:	e1a03001 	mov	r3, r1
     a5c:	e0823003 	add	r3, r2, r3
     a60:	e3a0202d 	mov	r2, #45	; 0x2d
     a64:	e5c32000 	strb	r2, [r3]
     a68:	e51b3008 	ldr	r3, [fp, #-8]
     a6c:	e2833001 	add	r3, r3, #1
     a70:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     a74:	ea000009 	b	aa0 <printint+0x13c>
        putc(fd, buf[i]);
     a78:	e3e0101b 	mvn	r1, #27
     a7c:	e51b3008 	ldr	r3, [fp, #-8]
     a80:	e24bc004 	sub	ip, fp, #4
     a84:	e08c2003 	add	r2, ip, r3
     a88:	e1a03001 	mov	r3, r1
     a8c:	e0823003 	add	r3, r2, r3
     a90:	e5d33000 	ldrb	r3, [r3]
     a94:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     a98:	e1a01003 	mov	r1, r3
     a9c:	ebffffa3 	bl	930 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     aa0:	e51b3008 	ldr	r3, [fp, #-8]
     aa4:	e2433001 	sub	r3, r3, #1
     aa8:	e50b3008 	str	r3, [fp, #-8]
     aac:	e51b3008 	ldr	r3, [fp, #-8]
     ab0:	e3530000 	cmp	r3, #0
     ab4:	aaffffef 	bge	a78 <printint+0x114>
        putc(fd, buf[i]);
}
     ab8:	e24bd004 	sub	sp, fp, #4
     abc:	e8bd8800 	pop	{fp, pc}

00000ac0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     ac0:	e92d000e 	push	{r1, r2, r3}
     ac4:	e92d4800 	push	{fp, lr}
     ac8:	e28db004 	add	fp, sp, #4
     acc:	e24dd024 	sub	sp, sp, #36	; 0x24
     ad0:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     ad4:	e3a03000 	mov	r3, #0
     ad8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     adc:	e28b3008 	add	r3, fp, #8
     ae0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     ae4:	e3a03000 	mov	r3, #0
     ae8:	e50b3010 	str	r3, [fp, #-16]
     aec:	ea000077 	b	cd0 <printf+0x210>
        c = fmt[i] & 0xff;
     af0:	e59b2004 	ldr	r2, [fp, #4]
     af4:	e51b3010 	ldr	r3, [fp, #-16]
     af8:	e0823003 	add	r3, r2, r3
     afc:	e5d33000 	ldrb	r3, [r3]
     b00:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     b04:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b08:	e3530000 	cmp	r3, #0
     b0c:	1a00000b 	bne	b40 <printf+0x80>
            if(c == '%'){
     b10:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b14:	e3530025 	cmp	r3, #37	; 0x25
     b18:	1a000002 	bne	b28 <printf+0x68>
                state = '%';
     b1c:	e3a03025 	mov	r3, #37	; 0x25
     b20:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     b24:	ea000066 	b	cc4 <printf+0x204>
            } else {
                putc(fd, c);
     b28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b2c:	e6ef3073 	uxtb	r3, r3
     b30:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b34:	e1a01003 	mov	r1, r3
     b38:	ebffff7c 	bl	930 <putc>
     b3c:	ea000060 	b	cc4 <printf+0x204>
            }
        } else if(state == '%'){
     b40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b44:	e3530025 	cmp	r3, #37	; 0x25
     b48:	1a00005d 	bne	cc4 <printf+0x204>
            if(c == 'd'){
     b4c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b50:	e3530064 	cmp	r3, #100	; 0x64
     b54:	1a00000a 	bne	b84 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     b58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b5c:	e5933000 	ldr	r3, [r3]
     b60:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b64:	e1a01003 	mov	r1, r3
     b68:	e3a0200a 	mov	r2, #10
     b6c:	e3a03001 	mov	r3, #1
     b70:	ebffff7b 	bl	964 <printint>
                ap++;
     b74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b78:	e2833004 	add	r3, r3, #4
     b7c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b80:	ea00004d 	b	cbc <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     b84:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b88:	e3530078 	cmp	r3, #120	; 0x78
     b8c:	0a000002 	beq	b9c <printf+0xdc>
     b90:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b94:	e3530070 	cmp	r3, #112	; 0x70
     b98:	1a00000a 	bne	bc8 <printf+0x108>
                printint(fd, *ap, 16, 0);
     b9c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ba0:	e5933000 	ldr	r3, [r3]
     ba4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ba8:	e1a01003 	mov	r1, r3
     bac:	e3a02010 	mov	r2, #16
     bb0:	e3a03000 	mov	r3, #0
     bb4:	ebffff6a 	bl	964 <printint>
                ap++;
     bb8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bbc:	e2833004 	add	r3, r3, #4
     bc0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     bc4:	ea00003c 	b	cbc <printf+0x1fc>
            } else if(c == 's'){
     bc8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     bcc:	e3530073 	cmp	r3, #115	; 0x73
     bd0:	1a00001b 	bne	c44 <printf+0x184>
                s = (char*)*ap;
     bd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bd8:	e5933000 	ldr	r3, [r3]
     bdc:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     be0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     be4:	e2833004 	add	r3, r3, #4
     be8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     bec:	e51b300c 	ldr	r3, [fp, #-12]
     bf0:	e3530000 	cmp	r3, #0
     bf4:	1a00000c 	bne	c2c <printf+0x16c>
                    s = "(null)";
     bf8:	e30131f0 	movw	r3, #4592	; 0x11f0
     bfc:	e3403000 	movt	r3, #0
     c00:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     c04:	ea000008 	b	c2c <printf+0x16c>
                    putc(fd, *s);
     c08:	e51b300c 	ldr	r3, [fp, #-12]
     c0c:	e5d33000 	ldrb	r3, [r3]
     c10:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c14:	e1a01003 	mov	r1, r3
     c18:	ebffff44 	bl	930 <putc>
                    s++;
     c1c:	e51b300c 	ldr	r3, [fp, #-12]
     c20:	e2833001 	add	r3, r3, #1
     c24:	e50b300c 	str	r3, [fp, #-12]
     c28:	ea000000 	b	c30 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     c2c:	e1a00000 	nop			; (mov r0, r0)
     c30:	e51b300c 	ldr	r3, [fp, #-12]
     c34:	e5d33000 	ldrb	r3, [r3]
     c38:	e3530000 	cmp	r3, #0
     c3c:	1afffff1 	bne	c08 <printf+0x148>
     c40:	ea00001d 	b	cbc <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     c44:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c48:	e3530063 	cmp	r3, #99	; 0x63
     c4c:	1a000009 	bne	c78 <printf+0x1b8>
                putc(fd, *ap);
     c50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c54:	e5933000 	ldr	r3, [r3]
     c58:	e6ef3073 	uxtb	r3, r3
     c5c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c60:	e1a01003 	mov	r1, r3
     c64:	ebffff31 	bl	930 <putc>
                ap++;
     c68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c6c:	e2833004 	add	r3, r3, #4
     c70:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     c74:	ea000010 	b	cbc <printf+0x1fc>
            } else if(c == '%'){
     c78:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c7c:	e3530025 	cmp	r3, #37	; 0x25
     c80:	1a000005 	bne	c9c <printf+0x1dc>
                putc(fd, c);
     c84:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c88:	e6ef3073 	uxtb	r3, r3
     c8c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c90:	e1a01003 	mov	r1, r3
     c94:	ebffff25 	bl	930 <putc>
     c98:	ea000007 	b	cbc <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     c9c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ca0:	e3a01025 	mov	r1, #37	; 0x25
     ca4:	ebffff21 	bl	930 <putc>
                putc(fd, c);
     ca8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     cac:	e6ef3073 	uxtb	r3, r3
     cb0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     cb4:	e1a01003 	mov	r1, r3
     cb8:	ebffff1c 	bl	930 <putc>
            }
            state = 0;
     cbc:	e3a03000 	mov	r3, #0
     cc0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     cc4:	e51b3010 	ldr	r3, [fp, #-16]
     cc8:	e2833001 	add	r3, r3, #1
     ccc:	e50b3010 	str	r3, [fp, #-16]
     cd0:	e59b2004 	ldr	r2, [fp, #4]
     cd4:	e51b3010 	ldr	r3, [fp, #-16]
     cd8:	e0823003 	add	r3, r2, r3
     cdc:	e5d33000 	ldrb	r3, [r3]
     ce0:	e3530000 	cmp	r3, #0
     ce4:	1affff81 	bne	af0 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     ce8:	e24bd004 	sub	sp, fp, #4
     cec:	e8bd4800 	pop	{fp, lr}
     cf0:	e28dd00c 	add	sp, sp, #12
     cf4:	e12fff1e 	bx	lr

00000cf8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     cf8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     cfc:	e28db000 	add	fp, sp, #0
     d00:	e24dd014 	sub	sp, sp, #20
     d04:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     d08:	e51b3010 	ldr	r3, [fp, #-16]
     d0c:	e2433008 	sub	r3, r3, #8
     d10:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d14:	e301321c 	movw	r3, #4636	; 0x121c
     d18:	e3403000 	movt	r3, #0
     d1c:	e5933000 	ldr	r3, [r3]
     d20:	e50b3008 	str	r3, [fp, #-8]
     d24:	ea000010 	b	d6c <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d28:	e51b3008 	ldr	r3, [fp, #-8]
     d2c:	e5932000 	ldr	r2, [r3]
     d30:	e51b3008 	ldr	r3, [fp, #-8]
     d34:	e1520003 	cmp	r2, r3
     d38:	8a000008 	bhi	d60 <free+0x68>
     d3c:	e51b200c 	ldr	r2, [fp, #-12]
     d40:	e51b3008 	ldr	r3, [fp, #-8]
     d44:	e1520003 	cmp	r2, r3
     d48:	8a000010 	bhi	d90 <free+0x98>
     d4c:	e51b3008 	ldr	r3, [fp, #-8]
     d50:	e5932000 	ldr	r2, [r3]
     d54:	e51b300c 	ldr	r3, [fp, #-12]
     d58:	e1520003 	cmp	r2, r3
     d5c:	8a00000b 	bhi	d90 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d60:	e51b3008 	ldr	r3, [fp, #-8]
     d64:	e5933000 	ldr	r3, [r3]
     d68:	e50b3008 	str	r3, [fp, #-8]
     d6c:	e51b200c 	ldr	r2, [fp, #-12]
     d70:	e51b3008 	ldr	r3, [fp, #-8]
     d74:	e1520003 	cmp	r2, r3
     d78:	9affffea 	bls	d28 <free+0x30>
     d7c:	e51b3008 	ldr	r3, [fp, #-8]
     d80:	e5932000 	ldr	r2, [r3]
     d84:	e51b300c 	ldr	r3, [fp, #-12]
     d88:	e1520003 	cmp	r2, r3
     d8c:	9affffe5 	bls	d28 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     d90:	e51b300c 	ldr	r3, [fp, #-12]
     d94:	e5933004 	ldr	r3, [r3, #4]
     d98:	e1a03183 	lsl	r3, r3, #3
     d9c:	e51b200c 	ldr	r2, [fp, #-12]
     da0:	e0822003 	add	r2, r2, r3
     da4:	e51b3008 	ldr	r3, [fp, #-8]
     da8:	e5933000 	ldr	r3, [r3]
     dac:	e1520003 	cmp	r2, r3
     db0:	1a00000d 	bne	dec <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     db4:	e51b300c 	ldr	r3, [fp, #-12]
     db8:	e5932004 	ldr	r2, [r3, #4]
     dbc:	e51b3008 	ldr	r3, [fp, #-8]
     dc0:	e5933000 	ldr	r3, [r3]
     dc4:	e5933004 	ldr	r3, [r3, #4]
     dc8:	e0822003 	add	r2, r2, r3
     dcc:	e51b300c 	ldr	r3, [fp, #-12]
     dd0:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     dd4:	e51b3008 	ldr	r3, [fp, #-8]
     dd8:	e5933000 	ldr	r3, [r3]
     ddc:	e5932000 	ldr	r2, [r3]
     de0:	e51b300c 	ldr	r3, [fp, #-12]
     de4:	e5832000 	str	r2, [r3]
     de8:	ea000003 	b	dfc <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     dec:	e51b3008 	ldr	r3, [fp, #-8]
     df0:	e5932000 	ldr	r2, [r3]
     df4:	e51b300c 	ldr	r3, [fp, #-12]
     df8:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     dfc:	e51b3008 	ldr	r3, [fp, #-8]
     e00:	e5933004 	ldr	r3, [r3, #4]
     e04:	e1a03183 	lsl	r3, r3, #3
     e08:	e51b2008 	ldr	r2, [fp, #-8]
     e0c:	e0822003 	add	r2, r2, r3
     e10:	e51b300c 	ldr	r3, [fp, #-12]
     e14:	e1520003 	cmp	r2, r3
     e18:	1a00000b 	bne	e4c <free+0x154>
        p->s.size += bp->s.size;
     e1c:	e51b3008 	ldr	r3, [fp, #-8]
     e20:	e5932004 	ldr	r2, [r3, #4]
     e24:	e51b300c 	ldr	r3, [fp, #-12]
     e28:	e5933004 	ldr	r3, [r3, #4]
     e2c:	e0822003 	add	r2, r2, r3
     e30:	e51b3008 	ldr	r3, [fp, #-8]
     e34:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     e38:	e51b300c 	ldr	r3, [fp, #-12]
     e3c:	e5932000 	ldr	r2, [r3]
     e40:	e51b3008 	ldr	r3, [fp, #-8]
     e44:	e5832000 	str	r2, [r3]
     e48:	ea000002 	b	e58 <free+0x160>
    } else
        p->s.ptr = bp;
     e4c:	e51b3008 	ldr	r3, [fp, #-8]
     e50:	e51b200c 	ldr	r2, [fp, #-12]
     e54:	e5832000 	str	r2, [r3]
    freep = p;
     e58:	e301321c 	movw	r3, #4636	; 0x121c
     e5c:	e3403000 	movt	r3, #0
     e60:	e51b2008 	ldr	r2, [fp, #-8]
     e64:	e5832000 	str	r2, [r3]
}
     e68:	e28bd000 	add	sp, fp, #0
     e6c:	e8bd0800 	pop	{fp}
     e70:	e12fff1e 	bx	lr

00000e74 <morecore>:

static Header*
morecore(uint nu)
{
     e74:	e92d4800 	push	{fp, lr}
     e78:	e28db004 	add	fp, sp, #4
     e7c:	e24dd010 	sub	sp, sp, #16
     e80:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     e84:	e51b2010 	ldr	r2, [fp, #-16]
     e88:	e3003fff 	movw	r3, #4095	; 0xfff
     e8c:	e1520003 	cmp	r2, r3
     e90:	8a000001 	bhi	e9c <morecore+0x28>
        nu = 4096;
     e94:	e3a03a01 	mov	r3, #4096	; 0x1000
     e98:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     e9c:	e51b3010 	ldr	r3, [fp, #-16]
     ea0:	e1a03183 	lsl	r3, r3, #3
     ea4:	e1a00003 	mov	r0, r3
     ea8:	ebfffe7c 	bl	8a0 <sbrk>
     eac:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     eb0:	e51b3008 	ldr	r3, [fp, #-8]
     eb4:	e3730001 	cmn	r3, #1
     eb8:	1a000001 	bne	ec4 <morecore+0x50>
        return 0;
     ebc:	e3a03000 	mov	r3, #0
     ec0:	ea00000b 	b	ef4 <morecore+0x80>
    hp = (Header*)p;
     ec4:	e51b3008 	ldr	r3, [fp, #-8]
     ec8:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     ecc:	e51b300c 	ldr	r3, [fp, #-12]
     ed0:	e51b2010 	ldr	r2, [fp, #-16]
     ed4:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     ed8:	e51b300c 	ldr	r3, [fp, #-12]
     edc:	e2833008 	add	r3, r3, #8
     ee0:	e1a00003 	mov	r0, r3
     ee4:	ebffff83 	bl	cf8 <free>
    return freep;
     ee8:	e301321c 	movw	r3, #4636	; 0x121c
     eec:	e3403000 	movt	r3, #0
     ef0:	e5933000 	ldr	r3, [r3]
}
     ef4:	e1a00003 	mov	r0, r3
     ef8:	e24bd004 	sub	sp, fp, #4
     efc:	e8bd8800 	pop	{fp, pc}

00000f00 <malloc>:

void*
malloc(uint nbytes)
{
     f00:	e92d4800 	push	{fp, lr}
     f04:	e28db004 	add	fp, sp, #4
     f08:	e24dd018 	sub	sp, sp, #24
     f0c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f10:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f14:	e2833007 	add	r3, r3, #7
     f18:	e1a031a3 	lsr	r3, r3, #3
     f1c:	e2833001 	add	r3, r3, #1
     f20:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     f24:	e301321c 	movw	r3, #4636	; 0x121c
     f28:	e3403000 	movt	r3, #0
     f2c:	e5933000 	ldr	r3, [r3]
     f30:	e50b300c 	str	r3, [fp, #-12]
     f34:	e51b300c 	ldr	r3, [fp, #-12]
     f38:	e3530000 	cmp	r3, #0
     f3c:	1a000010 	bne	f84 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     f40:	e3013214 	movw	r3, #4628	; 0x1214
     f44:	e3403000 	movt	r3, #0
     f48:	e50b300c 	str	r3, [fp, #-12]
     f4c:	e301321c 	movw	r3, #4636	; 0x121c
     f50:	e3403000 	movt	r3, #0
     f54:	e51b200c 	ldr	r2, [fp, #-12]
     f58:	e5832000 	str	r2, [r3]
     f5c:	e301321c 	movw	r3, #4636	; 0x121c
     f60:	e3403000 	movt	r3, #0
     f64:	e5932000 	ldr	r2, [r3]
     f68:	e3013214 	movw	r3, #4628	; 0x1214
     f6c:	e3403000 	movt	r3, #0
     f70:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     f74:	e3013214 	movw	r3, #4628	; 0x1214
     f78:	e3403000 	movt	r3, #0
     f7c:	e3a02000 	mov	r2, #0
     f80:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f84:	e51b300c 	ldr	r3, [fp, #-12]
     f88:	e5933000 	ldr	r3, [r3]
     f8c:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     f90:	e51b3008 	ldr	r3, [fp, #-8]
     f94:	e5932004 	ldr	r2, [r3, #4]
     f98:	e51b3010 	ldr	r3, [fp, #-16]
     f9c:	e1520003 	cmp	r2, r3
     fa0:	3a00001f 	bcc	1024 <malloc+0x124>
            if(p->s.size == nunits)
     fa4:	e51b3008 	ldr	r3, [fp, #-8]
     fa8:	e5932004 	ldr	r2, [r3, #4]
     fac:	e51b3010 	ldr	r3, [fp, #-16]
     fb0:	e1520003 	cmp	r2, r3
     fb4:	1a000004 	bne	fcc <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     fb8:	e51b3008 	ldr	r3, [fp, #-8]
     fbc:	e5932000 	ldr	r2, [r3]
     fc0:	e51b300c 	ldr	r3, [fp, #-12]
     fc4:	e5832000 	str	r2, [r3]
     fc8:	ea00000e 	b	1008 <malloc+0x108>
            else {
                p->s.size -= nunits;
     fcc:	e51b3008 	ldr	r3, [fp, #-8]
     fd0:	e5932004 	ldr	r2, [r3, #4]
     fd4:	e51b3010 	ldr	r3, [fp, #-16]
     fd8:	e0632002 	rsb	r2, r3, r2
     fdc:	e51b3008 	ldr	r3, [fp, #-8]
     fe0:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     fe4:	e51b3008 	ldr	r3, [fp, #-8]
     fe8:	e5933004 	ldr	r3, [r3, #4]
     fec:	e1a03183 	lsl	r3, r3, #3
     ff0:	e51b2008 	ldr	r2, [fp, #-8]
     ff4:	e0823003 	add	r3, r2, r3
     ff8:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     ffc:	e51b3008 	ldr	r3, [fp, #-8]
    1000:	e51b2010 	ldr	r2, [fp, #-16]
    1004:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1008:	e301321c 	movw	r3, #4636	; 0x121c
    100c:	e3403000 	movt	r3, #0
    1010:	e51b200c 	ldr	r2, [fp, #-12]
    1014:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    1018:	e51b3008 	ldr	r3, [fp, #-8]
    101c:	e2833008 	add	r3, r3, #8
    1020:	ea000013 	b	1074 <malloc+0x174>
        }
        if(p == freep)
    1024:	e301321c 	movw	r3, #4636	; 0x121c
    1028:	e3403000 	movt	r3, #0
    102c:	e5933000 	ldr	r3, [r3]
    1030:	e51b2008 	ldr	r2, [fp, #-8]
    1034:	e1520003 	cmp	r2, r3
    1038:	1a000007 	bne	105c <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    103c:	e51b0010 	ldr	r0, [fp, #-16]
    1040:	ebffff8b 	bl	e74 <morecore>
    1044:	e50b0008 	str	r0, [fp, #-8]
    1048:	e51b3008 	ldr	r3, [fp, #-8]
    104c:	e3530000 	cmp	r3, #0
    1050:	1a000001 	bne	105c <malloc+0x15c>
                return 0;
    1054:	e3a03000 	mov	r3, #0
    1058:	ea000005 	b	1074 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    105c:	e51b3008 	ldr	r3, [fp, #-8]
    1060:	e50b300c 	str	r3, [fp, #-12]
    1064:	e51b3008 	ldr	r3, [fp, #-8]
    1068:	e5933000 	ldr	r3, [r3]
    106c:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    1070:	eaffffc6 	b	f90 <malloc+0x90>
}
    1074:	e1a00003 	mov	r0, r3
    1078:	e24bd004 	sub	sp, fp, #4
    107c:	e8bd8800 	pop	{fp, pc}

00001080 <__aeabi_uidiv>:
    1080:	e2512001 	subs	r2, r1, #1
    1084:	012fff1e 	bxeq	lr
    1088:	3a000036 	bcc	1168 <__aeabi_uidiv+0xe8>
    108c:	e1500001 	cmp	r0, r1
    1090:	9a000022 	bls	1120 <__aeabi_uidiv+0xa0>
    1094:	e1110002 	tst	r1, r2
    1098:	0a000023 	beq	112c <__aeabi_uidiv+0xac>
    109c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    10a0:	01a01181 	lsleq	r1, r1, #3
    10a4:	03a03008 	moveq	r3, #8
    10a8:	13a03001 	movne	r3, #1
    10ac:	e3510201 	cmp	r1, #268435456	; 0x10000000
    10b0:	31510000 	cmpcc	r1, r0
    10b4:	31a01201 	lslcc	r1, r1, #4
    10b8:	31a03203 	lslcc	r3, r3, #4
    10bc:	3afffffa 	bcc	10ac <__aeabi_uidiv+0x2c>
    10c0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    10c4:	31510000 	cmpcc	r1, r0
    10c8:	31a01081 	lslcc	r1, r1, #1
    10cc:	31a03083 	lslcc	r3, r3, #1
    10d0:	3afffffa 	bcc	10c0 <__aeabi_uidiv+0x40>
    10d4:	e3a02000 	mov	r2, #0
    10d8:	e1500001 	cmp	r0, r1
    10dc:	20400001 	subcs	r0, r0, r1
    10e0:	21822003 	orrcs	r2, r2, r3
    10e4:	e15000a1 	cmp	r0, r1, lsr #1
    10e8:	204000a1 	subcs	r0, r0, r1, lsr #1
    10ec:	218220a3 	orrcs	r2, r2, r3, lsr #1
    10f0:	e1500121 	cmp	r0, r1, lsr #2
    10f4:	20400121 	subcs	r0, r0, r1, lsr #2
    10f8:	21822123 	orrcs	r2, r2, r3, lsr #2
    10fc:	e15001a1 	cmp	r0, r1, lsr #3
    1100:	204001a1 	subcs	r0, r0, r1, lsr #3
    1104:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1108:	e3500000 	cmp	r0, #0
    110c:	11b03223 	lsrsne	r3, r3, #4
    1110:	11a01221 	lsrne	r1, r1, #4
    1114:	1affffef 	bne	10d8 <__aeabi_uidiv+0x58>
    1118:	e1a00002 	mov	r0, r2
    111c:	e12fff1e 	bx	lr
    1120:	03a00001 	moveq	r0, #1
    1124:	13a00000 	movne	r0, #0
    1128:	e12fff1e 	bx	lr
    112c:	e3510801 	cmp	r1, #65536	; 0x10000
    1130:	21a01821 	lsrcs	r1, r1, #16
    1134:	23a02010 	movcs	r2, #16
    1138:	33a02000 	movcc	r2, #0
    113c:	e3510c01 	cmp	r1, #256	; 0x100
    1140:	21a01421 	lsrcs	r1, r1, #8
    1144:	22822008 	addcs	r2, r2, #8
    1148:	e3510010 	cmp	r1, #16
    114c:	21a01221 	lsrcs	r1, r1, #4
    1150:	22822004 	addcs	r2, r2, #4
    1154:	e3510004 	cmp	r1, #4
    1158:	82822003 	addhi	r2, r2, #3
    115c:	908220a1 	addls	r2, r2, r1, lsr #1
    1160:	e1a00230 	lsr	r0, r0, r2
    1164:	e12fff1e 	bx	lr
    1168:	e3500000 	cmp	r0, #0
    116c:	13e00000 	mvnne	r0, #0
    1170:	ea000007 	b	1194 <__aeabi_idiv0>

00001174 <__aeabi_uidivmod>:
    1174:	e3510000 	cmp	r1, #0
    1178:	0afffffa 	beq	1168 <__aeabi_uidiv+0xe8>
    117c:	e92d4003 	push	{r0, r1, lr}
    1180:	ebffffbe 	bl	1080 <__aeabi_uidiv>
    1184:	e8bd4006 	pop	{r1, r2, lr}
    1188:	e0030092 	mul	r3, r2, r0
    118c:	e0411003 	sub	r1, r1, r3
    1190:	e12fff1e 	bx	lr

00001194 <__aeabi_idiv0>:
    1194:	e12fff1e 	bx	lr
