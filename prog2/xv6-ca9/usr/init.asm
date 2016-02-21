
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
       c:	e3010178 	movw	r0, #4472	; 0x1178
      10:	e3400000 	movt	r0, #0
      14:	e3a01002 	mov	r1, #2
      18:	eb0001cf 	bl	75c <open>
      1c:	e1a03000 	mov	r3, r0
      20:	e3530000 	cmp	r3, #0
      24:	aa000008 	bge	4c <main+0x4c>
        mknod("console", 1, 1);
      28:	e3010178 	movw	r0, #4472	; 0x1178
      2c:	e3400000 	movt	r0, #0
      30:	e3a01001 	mov	r1, #1
      34:	e3a02001 	mov	r2, #1
      38:	eb0001d0 	bl	780 <mknod>
        open("console", O_RDWR);
      3c:	e3010178 	movw	r0, #4472	; 0x1178
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
      68:	e3011180 	movw	r1, #4480	; 0x1180
      6c:	e3401000 	movt	r1, #0
      70:	eb000289 	bl	a9c <printf>
        pid = fork();
      74:	eb000167 	bl	618 <fork>
      78:	e50b0008 	str	r0, [fp, #-8]
        if(pid < 0){
      7c:	e51b3008 	ldr	r3, [fp, #-8]
      80:	e3530000 	cmp	r3, #0
      84:	aa000004 	bge	9c <main+0x9c>
            printf(1, "init: fork failed\n");
      88:	e3a00001 	mov	r0, #1
      8c:	e3011194 	movw	r1, #4500	; 0x1194
      90:	e3401000 	movt	r1, #0
      94:	eb000280 	bl	a9c <printf>
            exit();
      98:	eb000167 	bl	63c <exit>
        }
        if(pid == 0){
      9c:	e51b3008 	ldr	r3, [fp, #-8]
      a0:	e3530000 	cmp	r3, #0
      a4:	1a00000d 	bne	e0 <main+0xe0>
            exec("sh", argv);
      a8:	e3010174 	movw	r0, #4468	; 0x1174
      ac:	e3400000 	movt	r0, #0
      b0:	e30111d4 	movw	r1, #4564	; 0x11d4
      b4:	e3401000 	movt	r1, #0
      b8:	eb00019e 	bl	738 <exec>
            printf(1, "init: exec sh failed\n");
      bc:	e3a00001 	mov	r0, #1
      c0:	e30111a8 	movw	r1, #4520	; 0x11a8
      c4:	e3401000 	movt	r1, #0
      c8:	eb000273 	bl	a9c <printf>
            exit();
      cc:	eb00015a 	bl	63c <exit>
        }
        while((wpid=wait()) >= 0 && wpid != pid)
            printf(1, "zombie!\n");
      d0:	e3a00001 	mov	r0, #1
      d4:	e30111c0 	movw	r1, #4544	; 0x11c0
      d8:	e3401000 	movt	r1, #0
      dc:	eb00026e 	bl	a9c <printf>
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

0000090c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     90c:	e92d4800 	push	{fp, lr}
     910:	e28db004 	add	fp, sp, #4
     914:	e24dd008 	sub	sp, sp, #8
     918:	e50b0008 	str	r0, [fp, #-8]
     91c:	e1a03001 	mov	r3, r1
     920:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     924:	e51b0008 	ldr	r0, [fp, #-8]
     928:	e24b3009 	sub	r3, fp, #9
     92c:	e1a01003 	mov	r1, r3
     930:	e3a02001 	mov	r2, #1
     934:	ebffff64 	bl	6cc <write>
}
     938:	e24bd004 	sub	sp, fp, #4
     93c:	e8bd8800 	pop	{fp, pc}

00000940 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     940:	e92d4800 	push	{fp, lr}
     944:	e28db004 	add	fp, sp, #4
     948:	e24dd030 	sub	sp, sp, #48	; 0x30
     94c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     950:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     954:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     958:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     95c:	e3a03000 	mov	r3, #0
     960:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     964:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     968:	e3530000 	cmp	r3, #0
     96c:	0a000008 	beq	994 <printint+0x54>
     970:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     974:	e3530000 	cmp	r3, #0
     978:	aa000005 	bge	994 <printint+0x54>
        neg = 1;
     97c:	e3a03001 	mov	r3, #1
     980:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     984:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     988:	e2633000 	rsb	r3, r3, #0
     98c:	e50b3010 	str	r3, [fp, #-16]
     990:	ea000001 	b	99c <printint+0x5c>
    } else {
        x = xx;
     994:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     998:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     99c:	e3a03000 	mov	r3, #0
     9a0:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     9a4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     9a8:	e51b2010 	ldr	r2, [fp, #-16]
     9ac:	e1a00002 	mov	r0, r2
     9b0:	e1a01003 	mov	r1, r3
     9b4:	eb0001e5 	bl	1150 <__aeabi_uidivmod>
     9b8:	e1a03001 	mov	r3, r1
     9bc:	e1a02003 	mov	r2, r3
     9c0:	e30131dc 	movw	r3, #4572	; 0x11dc
     9c4:	e3403000 	movt	r3, #0
     9c8:	e7d32002 	ldrb	r2, [r3, r2]
     9cc:	e3e0001b 	mvn	r0, #27
     9d0:	e51b3008 	ldr	r3, [fp, #-8]
     9d4:	e24bc004 	sub	ip, fp, #4
     9d8:	e08c1003 	add	r1, ip, r3
     9dc:	e1a03000 	mov	r3, r0
     9e0:	e0813003 	add	r3, r1, r3
     9e4:	e5c32000 	strb	r2, [r3]
     9e8:	e51b3008 	ldr	r3, [fp, #-8]
     9ec:	e2833001 	add	r3, r3, #1
     9f0:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     9f4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     9f8:	e51b0010 	ldr	r0, [fp, #-16]
     9fc:	e1a01003 	mov	r1, r3
     a00:	eb000195 	bl	105c <__aeabi_uidiv>
     a04:	e1a03000 	mov	r3, r0
     a08:	e50b3010 	str	r3, [fp, #-16]
     a0c:	e51b3010 	ldr	r3, [fp, #-16]
     a10:	e3530000 	cmp	r3, #0
     a14:	1affffe2 	bne	9a4 <printint+0x64>
    if(neg)
     a18:	e51b300c 	ldr	r3, [fp, #-12]
     a1c:	e3530000 	cmp	r3, #0
     a20:	0a000015 	beq	a7c <printint+0x13c>
        buf[i++] = '-';
     a24:	e3e0101b 	mvn	r1, #27
     a28:	e51b3008 	ldr	r3, [fp, #-8]
     a2c:	e24b0004 	sub	r0, fp, #4
     a30:	e0802003 	add	r2, r0, r3
     a34:	e1a03001 	mov	r3, r1
     a38:	e0823003 	add	r3, r2, r3
     a3c:	e3a0202d 	mov	r2, #45	; 0x2d
     a40:	e5c32000 	strb	r2, [r3]
     a44:	e51b3008 	ldr	r3, [fp, #-8]
     a48:	e2833001 	add	r3, r3, #1
     a4c:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     a50:	ea000009 	b	a7c <printint+0x13c>
        putc(fd, buf[i]);
     a54:	e3e0101b 	mvn	r1, #27
     a58:	e51b3008 	ldr	r3, [fp, #-8]
     a5c:	e24bc004 	sub	ip, fp, #4
     a60:	e08c2003 	add	r2, ip, r3
     a64:	e1a03001 	mov	r3, r1
     a68:	e0823003 	add	r3, r2, r3
     a6c:	e5d33000 	ldrb	r3, [r3]
     a70:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     a74:	e1a01003 	mov	r1, r3
     a78:	ebffffa3 	bl	90c <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     a7c:	e51b3008 	ldr	r3, [fp, #-8]
     a80:	e2433001 	sub	r3, r3, #1
     a84:	e50b3008 	str	r3, [fp, #-8]
     a88:	e51b3008 	ldr	r3, [fp, #-8]
     a8c:	e3530000 	cmp	r3, #0
     a90:	aaffffef 	bge	a54 <printint+0x114>
        putc(fd, buf[i]);
}
     a94:	e24bd004 	sub	sp, fp, #4
     a98:	e8bd8800 	pop	{fp, pc}

00000a9c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     a9c:	e92d000e 	push	{r1, r2, r3}
     aa0:	e92d4800 	push	{fp, lr}
     aa4:	e28db004 	add	fp, sp, #4
     aa8:	e24dd024 	sub	sp, sp, #36	; 0x24
     aac:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     ab0:	e3a03000 	mov	r3, #0
     ab4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     ab8:	e28b3008 	add	r3, fp, #8
     abc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     ac0:	e3a03000 	mov	r3, #0
     ac4:	e50b3010 	str	r3, [fp, #-16]
     ac8:	ea000077 	b	cac <printf+0x210>
        c = fmt[i] & 0xff;
     acc:	e59b2004 	ldr	r2, [fp, #4]
     ad0:	e51b3010 	ldr	r3, [fp, #-16]
     ad4:	e0823003 	add	r3, r2, r3
     ad8:	e5d33000 	ldrb	r3, [r3]
     adc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     ae0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     ae4:	e3530000 	cmp	r3, #0
     ae8:	1a00000b 	bne	b1c <printf+0x80>
            if(c == '%'){
     aec:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     af0:	e3530025 	cmp	r3, #37	; 0x25
     af4:	1a000002 	bne	b04 <printf+0x68>
                state = '%';
     af8:	e3a03025 	mov	r3, #37	; 0x25
     afc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     b00:	ea000066 	b	ca0 <printf+0x204>
            } else {
                putc(fd, c);
     b04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b08:	e6ef3073 	uxtb	r3, r3
     b0c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b10:	e1a01003 	mov	r1, r3
     b14:	ebffff7c 	bl	90c <putc>
     b18:	ea000060 	b	ca0 <printf+0x204>
            }
        } else if(state == '%'){
     b1c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b20:	e3530025 	cmp	r3, #37	; 0x25
     b24:	1a00005d 	bne	ca0 <printf+0x204>
            if(c == 'd'){
     b28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b2c:	e3530064 	cmp	r3, #100	; 0x64
     b30:	1a00000a 	bne	b60 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     b34:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b38:	e5933000 	ldr	r3, [r3]
     b3c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b40:	e1a01003 	mov	r1, r3
     b44:	e3a0200a 	mov	r2, #10
     b48:	e3a03001 	mov	r3, #1
     b4c:	ebffff7b 	bl	940 <printint>
                ap++;
     b50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b54:	e2833004 	add	r3, r3, #4
     b58:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     b5c:	ea00004d 	b	c98 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     b60:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b64:	e3530078 	cmp	r3, #120	; 0x78
     b68:	0a000002 	beq	b78 <printf+0xdc>
     b6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     b70:	e3530070 	cmp	r3, #112	; 0x70
     b74:	1a00000a 	bne	ba4 <printf+0x108>
                printint(fd, *ap, 16, 0);
     b78:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b7c:	e5933000 	ldr	r3, [r3]
     b80:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     b84:	e1a01003 	mov	r1, r3
     b88:	e3a02010 	mov	r2, #16
     b8c:	e3a03000 	mov	r3, #0
     b90:	ebffff6a 	bl	940 <printint>
                ap++;
     b94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b98:	e2833004 	add	r3, r3, #4
     b9c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     ba0:	ea00003c 	b	c98 <printf+0x1fc>
            } else if(c == 's'){
     ba4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ba8:	e3530073 	cmp	r3, #115	; 0x73
     bac:	1a00001b 	bne	c20 <printf+0x184>
                s = (char*)*ap;
     bb0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bb4:	e5933000 	ldr	r3, [r3]
     bb8:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     bbc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bc0:	e2833004 	add	r3, r3, #4
     bc4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     bc8:	e51b300c 	ldr	r3, [fp, #-12]
     bcc:	e3530000 	cmp	r3, #0
     bd0:	1a00000c 	bne	c08 <printf+0x16c>
                    s = "(null)";
     bd4:	e30131cc 	movw	r3, #4556	; 0x11cc
     bd8:	e3403000 	movt	r3, #0
     bdc:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     be0:	ea000008 	b	c08 <printf+0x16c>
                    putc(fd, *s);
     be4:	e51b300c 	ldr	r3, [fp, #-12]
     be8:	e5d33000 	ldrb	r3, [r3]
     bec:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     bf0:	e1a01003 	mov	r1, r3
     bf4:	ebffff44 	bl	90c <putc>
                    s++;
     bf8:	e51b300c 	ldr	r3, [fp, #-12]
     bfc:	e2833001 	add	r3, r3, #1
     c00:	e50b300c 	str	r3, [fp, #-12]
     c04:	ea000000 	b	c0c <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     c08:	e1a00000 	nop			; (mov r0, r0)
     c0c:	e51b300c 	ldr	r3, [fp, #-12]
     c10:	e5d33000 	ldrb	r3, [r3]
     c14:	e3530000 	cmp	r3, #0
     c18:	1afffff1 	bne	be4 <printf+0x148>
     c1c:	ea00001d 	b	c98 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     c20:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c24:	e3530063 	cmp	r3, #99	; 0x63
     c28:	1a000009 	bne	c54 <printf+0x1b8>
                putc(fd, *ap);
     c2c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c30:	e5933000 	ldr	r3, [r3]
     c34:	e6ef3073 	uxtb	r3, r3
     c38:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c3c:	e1a01003 	mov	r1, r3
     c40:	ebffff31 	bl	90c <putc>
                ap++;
     c44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c48:	e2833004 	add	r3, r3, #4
     c4c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     c50:	ea000010 	b	c98 <printf+0x1fc>
            } else if(c == '%'){
     c54:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c58:	e3530025 	cmp	r3, #37	; 0x25
     c5c:	1a000005 	bne	c78 <printf+0x1dc>
                putc(fd, c);
     c60:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c64:	e6ef3073 	uxtb	r3, r3
     c68:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c6c:	e1a01003 	mov	r1, r3
     c70:	ebffff25 	bl	90c <putc>
     c74:	ea000007 	b	c98 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     c78:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c7c:	e3a01025 	mov	r1, #37	; 0x25
     c80:	ebffff21 	bl	90c <putc>
                putc(fd, c);
     c84:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     c88:	e6ef3073 	uxtb	r3, r3
     c8c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     c90:	e1a01003 	mov	r1, r3
     c94:	ebffff1c 	bl	90c <putc>
            }
            state = 0;
     c98:	e3a03000 	mov	r3, #0
     c9c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     ca0:	e51b3010 	ldr	r3, [fp, #-16]
     ca4:	e2833001 	add	r3, r3, #1
     ca8:	e50b3010 	str	r3, [fp, #-16]
     cac:	e59b2004 	ldr	r2, [fp, #4]
     cb0:	e51b3010 	ldr	r3, [fp, #-16]
     cb4:	e0823003 	add	r3, r2, r3
     cb8:	e5d33000 	ldrb	r3, [r3]
     cbc:	e3530000 	cmp	r3, #0
     cc0:	1affff81 	bne	acc <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     cc4:	e24bd004 	sub	sp, fp, #4
     cc8:	e8bd4800 	pop	{fp, lr}
     ccc:	e28dd00c 	add	sp, sp, #12
     cd0:	e12fff1e 	bx	lr

00000cd4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     cd4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     cd8:	e28db000 	add	fp, sp, #0
     cdc:	e24dd014 	sub	sp, sp, #20
     ce0:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     ce4:	e51b3010 	ldr	r3, [fp, #-16]
     ce8:	e2433008 	sub	r3, r3, #8
     cec:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     cf0:	e30131f8 	movw	r3, #4600	; 0x11f8
     cf4:	e3403000 	movt	r3, #0
     cf8:	e5933000 	ldr	r3, [r3]
     cfc:	e50b3008 	str	r3, [fp, #-8]
     d00:	ea000010 	b	d48 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d04:	e51b3008 	ldr	r3, [fp, #-8]
     d08:	e5932000 	ldr	r2, [r3]
     d0c:	e51b3008 	ldr	r3, [fp, #-8]
     d10:	e1520003 	cmp	r2, r3
     d14:	8a000008 	bhi	d3c <free+0x68>
     d18:	e51b200c 	ldr	r2, [fp, #-12]
     d1c:	e51b3008 	ldr	r3, [fp, #-8]
     d20:	e1520003 	cmp	r2, r3
     d24:	8a000010 	bhi	d6c <free+0x98>
     d28:	e51b3008 	ldr	r3, [fp, #-8]
     d2c:	e5932000 	ldr	r2, [r3]
     d30:	e51b300c 	ldr	r3, [fp, #-12]
     d34:	e1520003 	cmp	r2, r3
     d38:	8a00000b 	bhi	d6c <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d3c:	e51b3008 	ldr	r3, [fp, #-8]
     d40:	e5933000 	ldr	r3, [r3]
     d44:	e50b3008 	str	r3, [fp, #-8]
     d48:	e51b200c 	ldr	r2, [fp, #-12]
     d4c:	e51b3008 	ldr	r3, [fp, #-8]
     d50:	e1520003 	cmp	r2, r3
     d54:	9affffea 	bls	d04 <free+0x30>
     d58:	e51b3008 	ldr	r3, [fp, #-8]
     d5c:	e5932000 	ldr	r2, [r3]
     d60:	e51b300c 	ldr	r3, [fp, #-12]
     d64:	e1520003 	cmp	r2, r3
     d68:	9affffe5 	bls	d04 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
     d6c:	e51b300c 	ldr	r3, [fp, #-12]
     d70:	e5933004 	ldr	r3, [r3, #4]
     d74:	e1a03183 	lsl	r3, r3, #3
     d78:	e51b200c 	ldr	r2, [fp, #-12]
     d7c:	e0822003 	add	r2, r2, r3
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e5933000 	ldr	r3, [r3]
     d88:	e1520003 	cmp	r2, r3
     d8c:	1a00000d 	bne	dc8 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
     d90:	e51b300c 	ldr	r3, [fp, #-12]
     d94:	e5932004 	ldr	r2, [r3, #4]
     d98:	e51b3008 	ldr	r3, [fp, #-8]
     d9c:	e5933000 	ldr	r3, [r3]
     da0:	e5933004 	ldr	r3, [r3, #4]
     da4:	e0822003 	add	r2, r2, r3
     da8:	e51b300c 	ldr	r3, [fp, #-12]
     dac:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
     db0:	e51b3008 	ldr	r3, [fp, #-8]
     db4:	e5933000 	ldr	r3, [r3]
     db8:	e5932000 	ldr	r2, [r3]
     dbc:	e51b300c 	ldr	r3, [fp, #-12]
     dc0:	e5832000 	str	r2, [r3]
     dc4:	ea000003 	b	dd8 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e5932000 	ldr	r2, [r3]
     dd0:	e51b300c 	ldr	r3, [fp, #-12]
     dd4:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
     dd8:	e51b3008 	ldr	r3, [fp, #-8]
     ddc:	e5933004 	ldr	r3, [r3, #4]
     de0:	e1a03183 	lsl	r3, r3, #3
     de4:	e51b2008 	ldr	r2, [fp, #-8]
     de8:	e0822003 	add	r2, r2, r3
     dec:	e51b300c 	ldr	r3, [fp, #-12]
     df0:	e1520003 	cmp	r2, r3
     df4:	1a00000b 	bne	e28 <free+0x154>
        p->s.size += bp->s.size;
     df8:	e51b3008 	ldr	r3, [fp, #-8]
     dfc:	e5932004 	ldr	r2, [r3, #4]
     e00:	e51b300c 	ldr	r3, [fp, #-12]
     e04:	e5933004 	ldr	r3, [r3, #4]
     e08:	e0822003 	add	r2, r2, r3
     e0c:	e51b3008 	ldr	r3, [fp, #-8]
     e10:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
     e14:	e51b300c 	ldr	r3, [fp, #-12]
     e18:	e5932000 	ldr	r2, [r3]
     e1c:	e51b3008 	ldr	r3, [fp, #-8]
     e20:	e5832000 	str	r2, [r3]
     e24:	ea000002 	b	e34 <free+0x160>
    } else
        p->s.ptr = bp;
     e28:	e51b3008 	ldr	r3, [fp, #-8]
     e2c:	e51b200c 	ldr	r2, [fp, #-12]
     e30:	e5832000 	str	r2, [r3]
    freep = p;
     e34:	e30131f8 	movw	r3, #4600	; 0x11f8
     e38:	e3403000 	movt	r3, #0
     e3c:	e51b2008 	ldr	r2, [fp, #-8]
     e40:	e5832000 	str	r2, [r3]
}
     e44:	e28bd000 	add	sp, fp, #0
     e48:	e8bd0800 	pop	{fp}
     e4c:	e12fff1e 	bx	lr

00000e50 <morecore>:

static Header*
morecore(uint nu)
{
     e50:	e92d4800 	push	{fp, lr}
     e54:	e28db004 	add	fp, sp, #4
     e58:	e24dd010 	sub	sp, sp, #16
     e5c:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
     e60:	e51b2010 	ldr	r2, [fp, #-16]
     e64:	e3003fff 	movw	r3, #4095	; 0xfff
     e68:	e1520003 	cmp	r2, r3
     e6c:	8a000001 	bhi	e78 <morecore+0x28>
        nu = 4096;
     e70:	e3a03a01 	mov	r3, #4096	; 0x1000
     e74:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
     e78:	e51b3010 	ldr	r3, [fp, #-16]
     e7c:	e1a03183 	lsl	r3, r3, #3
     e80:	e1a00003 	mov	r0, r3
     e84:	ebfffe85 	bl	8a0 <sbrk>
     e88:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
     e8c:	e51b3008 	ldr	r3, [fp, #-8]
     e90:	e3730001 	cmn	r3, #1
     e94:	1a000001 	bne	ea0 <morecore+0x50>
        return 0;
     e98:	e3a03000 	mov	r3, #0
     e9c:	ea00000b 	b	ed0 <morecore+0x80>
    hp = (Header*)p;
     ea0:	e51b3008 	ldr	r3, [fp, #-8]
     ea4:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
     ea8:	e51b300c 	ldr	r3, [fp, #-12]
     eac:	e51b2010 	ldr	r2, [fp, #-16]
     eb0:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
     eb4:	e51b300c 	ldr	r3, [fp, #-12]
     eb8:	e2833008 	add	r3, r3, #8
     ebc:	e1a00003 	mov	r0, r3
     ec0:	ebffff83 	bl	cd4 <free>
    return freep;
     ec4:	e30131f8 	movw	r3, #4600	; 0x11f8
     ec8:	e3403000 	movt	r3, #0
     ecc:	e5933000 	ldr	r3, [r3]
}
     ed0:	e1a00003 	mov	r0, r3
     ed4:	e24bd004 	sub	sp, fp, #4
     ed8:	e8bd8800 	pop	{fp, pc}

00000edc <malloc>:

void*
malloc(uint nbytes)
{
     edc:	e92d4800 	push	{fp, lr}
     ee0:	e28db004 	add	fp, sp, #4
     ee4:	e24dd018 	sub	sp, sp, #24
     ee8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     eec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ef0:	e2833007 	add	r3, r3, #7
     ef4:	e1a031a3 	lsr	r3, r3, #3
     ef8:	e2833001 	add	r3, r3, #1
     efc:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
     f00:	e30131f8 	movw	r3, #4600	; 0x11f8
     f04:	e3403000 	movt	r3, #0
     f08:	e5933000 	ldr	r3, [r3]
     f0c:	e50b300c 	str	r3, [fp, #-12]
     f10:	e51b300c 	ldr	r3, [fp, #-12]
     f14:	e3530000 	cmp	r3, #0
     f18:	1a000010 	bne	f60 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
     f1c:	e30131f0 	movw	r3, #4592	; 0x11f0
     f20:	e3403000 	movt	r3, #0
     f24:	e50b300c 	str	r3, [fp, #-12]
     f28:	e30131f8 	movw	r3, #4600	; 0x11f8
     f2c:	e3403000 	movt	r3, #0
     f30:	e51b200c 	ldr	r2, [fp, #-12]
     f34:	e5832000 	str	r2, [r3]
     f38:	e30131f8 	movw	r3, #4600	; 0x11f8
     f3c:	e3403000 	movt	r3, #0
     f40:	e5932000 	ldr	r2, [r3]
     f44:	e30131f0 	movw	r3, #4592	; 0x11f0
     f48:	e3403000 	movt	r3, #0
     f4c:	e5832000 	str	r2, [r3]
        base.s.size = 0;
     f50:	e30131f0 	movw	r3, #4592	; 0x11f0
     f54:	e3403000 	movt	r3, #0
     f58:	e3a02000 	mov	r2, #0
     f5c:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f60:	e51b300c 	ldr	r3, [fp, #-12]
     f64:	e5933000 	ldr	r3, [r3]
     f68:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
     f6c:	e51b3008 	ldr	r3, [fp, #-8]
     f70:	e5932004 	ldr	r2, [r3, #4]
     f74:	e51b3010 	ldr	r3, [fp, #-16]
     f78:	e1520003 	cmp	r2, r3
     f7c:	3a00001f 	bcc	1000 <malloc+0x124>
            if(p->s.size == nunits)
     f80:	e51b3008 	ldr	r3, [fp, #-8]
     f84:	e5932004 	ldr	r2, [r3, #4]
     f88:	e51b3010 	ldr	r3, [fp, #-16]
     f8c:	e1520003 	cmp	r2, r3
     f90:	1a000004 	bne	fa8 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
     f94:	e51b3008 	ldr	r3, [fp, #-8]
     f98:	e5932000 	ldr	r2, [r3]
     f9c:	e51b300c 	ldr	r3, [fp, #-12]
     fa0:	e5832000 	str	r2, [r3]
     fa4:	ea00000e 	b	fe4 <malloc+0x108>
            else {
                p->s.size -= nunits;
     fa8:	e51b3008 	ldr	r3, [fp, #-8]
     fac:	e5932004 	ldr	r2, [r3, #4]
     fb0:	e51b3010 	ldr	r3, [fp, #-16]
     fb4:	e0632002 	rsb	r2, r3, r2
     fb8:	e51b3008 	ldr	r3, [fp, #-8]
     fbc:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
     fc0:	e51b3008 	ldr	r3, [fp, #-8]
     fc4:	e5933004 	ldr	r3, [r3, #4]
     fc8:	e1a03183 	lsl	r3, r3, #3
     fcc:	e51b2008 	ldr	r2, [fp, #-8]
     fd0:	e0823003 	add	r3, r2, r3
     fd4:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
     fd8:	e51b3008 	ldr	r3, [fp, #-8]
     fdc:	e51b2010 	ldr	r2, [fp, #-16]
     fe0:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
     fe4:	e30131f8 	movw	r3, #4600	; 0x11f8
     fe8:	e3403000 	movt	r3, #0
     fec:	e51b200c 	ldr	r2, [fp, #-12]
     ff0:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
     ff4:	e51b3008 	ldr	r3, [fp, #-8]
     ff8:	e2833008 	add	r3, r3, #8
     ffc:	ea000013 	b	1050 <malloc+0x174>
        }
        if(p == freep)
    1000:	e30131f8 	movw	r3, #4600	; 0x11f8
    1004:	e3403000 	movt	r3, #0
    1008:	e5933000 	ldr	r3, [r3]
    100c:	e51b2008 	ldr	r2, [fp, #-8]
    1010:	e1520003 	cmp	r2, r3
    1014:	1a000007 	bne	1038 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    1018:	e51b0010 	ldr	r0, [fp, #-16]
    101c:	ebffff8b 	bl	e50 <morecore>
    1020:	e50b0008 	str	r0, [fp, #-8]
    1024:	e51b3008 	ldr	r3, [fp, #-8]
    1028:	e3530000 	cmp	r3, #0
    102c:	1a000001 	bne	1038 <malloc+0x15c>
                return 0;
    1030:	e3a03000 	mov	r3, #0
    1034:	ea000005 	b	1050 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1038:	e51b3008 	ldr	r3, [fp, #-8]
    103c:	e50b300c 	str	r3, [fp, #-12]
    1040:	e51b3008 	ldr	r3, [fp, #-8]
    1044:	e5933000 	ldr	r3, [r3]
    1048:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    104c:	eaffffc6 	b	f6c <malloc+0x90>
}
    1050:	e1a00003 	mov	r0, r3
    1054:	e24bd004 	sub	sp, fp, #4
    1058:	e8bd8800 	pop	{fp, pc}

0000105c <__aeabi_uidiv>:
    105c:	e2512001 	subs	r2, r1, #1
    1060:	012fff1e 	bxeq	lr
    1064:	3a000036 	bcc	1144 <__aeabi_uidiv+0xe8>
    1068:	e1500001 	cmp	r0, r1
    106c:	9a000022 	bls	10fc <__aeabi_uidiv+0xa0>
    1070:	e1110002 	tst	r1, r2
    1074:	0a000023 	beq	1108 <__aeabi_uidiv+0xac>
    1078:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    107c:	01a01181 	lsleq	r1, r1, #3
    1080:	03a03008 	moveq	r3, #8
    1084:	13a03001 	movne	r3, #1
    1088:	e3510201 	cmp	r1, #268435456	; 0x10000000
    108c:	31510000 	cmpcc	r1, r0
    1090:	31a01201 	lslcc	r1, r1, #4
    1094:	31a03203 	lslcc	r3, r3, #4
    1098:	3afffffa 	bcc	1088 <__aeabi_uidiv+0x2c>
    109c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    10a0:	31510000 	cmpcc	r1, r0
    10a4:	31a01081 	lslcc	r1, r1, #1
    10a8:	31a03083 	lslcc	r3, r3, #1
    10ac:	3afffffa 	bcc	109c <__aeabi_uidiv+0x40>
    10b0:	e3a02000 	mov	r2, #0
    10b4:	e1500001 	cmp	r0, r1
    10b8:	20400001 	subcs	r0, r0, r1
    10bc:	21822003 	orrcs	r2, r2, r3
    10c0:	e15000a1 	cmp	r0, r1, lsr #1
    10c4:	204000a1 	subcs	r0, r0, r1, lsr #1
    10c8:	218220a3 	orrcs	r2, r2, r3, lsr #1
    10cc:	e1500121 	cmp	r0, r1, lsr #2
    10d0:	20400121 	subcs	r0, r0, r1, lsr #2
    10d4:	21822123 	orrcs	r2, r2, r3, lsr #2
    10d8:	e15001a1 	cmp	r0, r1, lsr #3
    10dc:	204001a1 	subcs	r0, r0, r1, lsr #3
    10e0:	218221a3 	orrcs	r2, r2, r3, lsr #3
    10e4:	e3500000 	cmp	r0, #0
    10e8:	11b03223 	lsrsne	r3, r3, #4
    10ec:	11a01221 	lsrne	r1, r1, #4
    10f0:	1affffef 	bne	10b4 <__aeabi_uidiv+0x58>
    10f4:	e1a00002 	mov	r0, r2
    10f8:	e12fff1e 	bx	lr
    10fc:	03a00001 	moveq	r0, #1
    1100:	13a00000 	movne	r0, #0
    1104:	e12fff1e 	bx	lr
    1108:	e3510801 	cmp	r1, #65536	; 0x10000
    110c:	21a01821 	lsrcs	r1, r1, #16
    1110:	23a02010 	movcs	r2, #16
    1114:	33a02000 	movcc	r2, #0
    1118:	e3510c01 	cmp	r1, #256	; 0x100
    111c:	21a01421 	lsrcs	r1, r1, #8
    1120:	22822008 	addcs	r2, r2, #8
    1124:	e3510010 	cmp	r1, #16
    1128:	21a01221 	lsrcs	r1, r1, #4
    112c:	22822004 	addcs	r2, r2, #4
    1130:	e3510004 	cmp	r1, #4
    1134:	82822003 	addhi	r2, r2, #3
    1138:	908220a1 	addls	r2, r2, r1, lsr #1
    113c:	e1a00230 	lsr	r0, r0, r2
    1140:	e12fff1e 	bx	lr
    1144:	e3500000 	cmp	r0, #0
    1148:	13e00000 	mvnne	r0, #0
    114c:	ea000007 	b	1170 <__aeabi_idiv0>

00001150 <__aeabi_uidivmod>:
    1150:	e3510000 	cmp	r1, #0
    1154:	0afffffa 	beq	1144 <__aeabi_uidiv+0xe8>
    1158:	e92d4003 	push	{r0, r1, lr}
    115c:	ebffffbe 	bl	105c <__aeabi_uidiv>
    1160:	e8bd4006 	pop	{r1, r2, lr}
    1164:	e0030092 	mul	r3, r2, r0
    1168:	e0411003 	sub	r1, r1, r3
    116c:	e12fff1e 	bx	lr

00001170 <__aeabi_idiv0>:
    1170:	e12fff1e 	bx	lr
