
_grep:     file format elf32-littlearm


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd018 	sub	sp, sp, #24
       c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
      10:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int n, m;
    char *p, *q;
    
    m = 0;
      14:	e3a03000 	mov	r3, #0
      18:	e50b3008 	str	r3, [fp, #-8]
    while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
      1c:	ea00003c 	b	114 <grep+0x114>
        m += n;
      20:	e51b2008 	ldr	r2, [fp, #-8]
      24:	e51b3010 	ldr	r3, [fp, #-16]
      28:	e0823003 	add	r3, r2, r3
      2c:	e50b3008 	str	r3, [fp, #-8]
        p = buf;
      30:	e3013584 	movw	r3, #5508	; 0x1584
      34:	e3403000 	movt	r3, #0
      38:	e50b300c 	str	r3, [fp, #-12]
        while((q = strchr(p, '\n')) != 0){
      3c:	ea000017 	b	a0 <grep+0xa0>
            *q = 0;
      40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      44:	e3a02000 	mov	r2, #0
      48:	e5c32000 	strb	r2, [r3]
            if(match(pattern, p)){
      4c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
      50:	e51b100c 	ldr	r1, [fp, #-12]
      54:	eb00007c 	bl	24c <match>
      58:	e1a03000 	mov	r3, r0
      5c:	e3530000 	cmp	r3, #0
      60:	0a00000b 	beq	94 <grep+0x94>
                *q = '\n';
      64:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      68:	e3a0200a 	mov	r2, #10
      6c:	e5c32000 	strb	r2, [r3]
                write(1, p, q+1 - p);
      70:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      74:	e2833001 	add	r3, r3, #1
      78:	e1a02003 	mov	r2, r3
      7c:	e51b300c 	ldr	r3, [fp, #-12]
      80:	e0633002 	rsb	r3, r3, r2
      84:	e3a00001 	mov	r0, #1
      88:	e51b100c 	ldr	r1, [fp, #-12]
      8c:	e1a02003 	mov	r2, r3
      90:	eb000270 	bl	a58 <write>
            }
            p = q+1;
      94:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      98:	e2833001 	add	r3, r3, #1
      9c:	e50b300c 	str	r3, [fp, #-12]
    
    m = 0;
    while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
        m += n;
        p = buf;
        while((q = strchr(p, '\n')) != 0){
      a0:	e51b000c 	ldr	r0, [fp, #-12]
      a4:	e3a0100a 	mov	r1, #10
      a8:	eb000196 	bl	708 <strchr>
      ac:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
      b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
      b4:	e3530000 	cmp	r3, #0
      b8:	1affffe0 	bne	40 <grep+0x40>
                *q = '\n';
                write(1, p, q+1 - p);
            }
            p = q+1;
        }
        if(p == buf)
      bc:	e51b200c 	ldr	r2, [fp, #-12]
      c0:	e3013584 	movw	r3, #5508	; 0x1584
      c4:	e3403000 	movt	r3, #0
      c8:	e1520003 	cmp	r2, r3
      cc:	1a000001 	bne	d8 <grep+0xd8>
            m = 0;
      d0:	e3a03000 	mov	r3, #0
      d4:	e50b3008 	str	r3, [fp, #-8]
        if(m > 0){
      d8:	e51b3008 	ldr	r3, [fp, #-8]
      dc:	e3530000 	cmp	r3, #0
      e0:	da00000b 	ble	114 <grep+0x114>
            m -= p - buf;
      e4:	e3013584 	movw	r3, #5508	; 0x1584
      e8:	e3403000 	movt	r3, #0
      ec:	e51b200c 	ldr	r2, [fp, #-12]
      f0:	e0623003 	rsb	r3, r2, r3
      f4:	e51b2008 	ldr	r2, [fp, #-8]
      f8:	e0823003 	add	r3, r2, r3
      fc:	e50b3008 	str	r3, [fp, #-8]
            memmove(buf, p, m);
     100:	e3010584 	movw	r0, #5508	; 0x1584
     104:	e3400000 	movt	r0, #0
     108:	e51b100c 	ldr	r1, [fp, #-12]
     10c:	e51b2008 	ldr	r2, [fp, #-8]
     110:	eb0001ff 	bl	914 <memmove>
{
    int n, m;
    char *p, *q;
    
    m = 0;
    while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
     114:	e51b2008 	ldr	r2, [fp, #-8]
     118:	e3013584 	movw	r3, #5508	; 0x1584
     11c:	e3403000 	movt	r3, #0
     120:	e0822003 	add	r2, r2, r3
     124:	e51b3008 	ldr	r3, [fp, #-8]
     128:	e2633b01 	rsb	r3, r3, #1024	; 0x400
     12c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     130:	e1a01002 	mov	r1, r2
     134:	e1a02003 	mov	r2, r3
     138:	eb00023d 	bl	a34 <read>
     13c:	e50b0010 	str	r0, [fp, #-16]
     140:	e51b3010 	ldr	r3, [fp, #-16]
     144:	e3530000 	cmp	r3, #0
     148:	caffffb4 	bgt	20 <grep+0x20>
        if(m > 0){
            m -= p - buf;
            memmove(buf, p, m);
        }
    }
}
     14c:	e24bd004 	sub	sp, fp, #4
     150:	e8bd8800 	pop	{fp, pc}

00000154 <main>:

int
main(int argc, char *argv[])
{
     154:	e92d4800 	push	{fp, lr}
     158:	e28db004 	add	fp, sp, #4
     15c:	e24dd018 	sub	sp, sp, #24
     160:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     164:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int fd, i;
    char *pattern;
    
    if(argc <= 1){
     168:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     16c:	e3530001 	cmp	r3, #1
     170:	ca000004 	bgt	188 <main+0x34>
        printf(2, "usage: grep pattern [file ...]\n");
     174:	e3a00002 	mov	r0, #2
     178:	e3011524 	movw	r1, #5412	; 0x1524
     17c:	e3401000 	movt	r1, #0
     180:	eb000331 	bl	e4c <printf>
        exit();
     184:	eb00020f 	bl	9c8 <exit>
    }
    pattern = argv[1];
     188:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     18c:	e5933004 	ldr	r3, [r3, #4]
     190:	e50b300c 	str	r3, [fp, #-12]
    
    if(argc <= 2){
     194:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     198:	e3530002 	cmp	r3, #2
     19c:	ca000003 	bgt	1b0 <main+0x5c>
        grep(pattern, 0);
     1a0:	e51b000c 	ldr	r0, [fp, #-12]
     1a4:	e3a01000 	mov	r1, #0
     1a8:	ebffff94 	bl	0 <grep>
        exit();
     1ac:	eb000205 	bl	9c8 <exit>
    }
    
    for(i = 2; i < argc; i++){
     1b0:	e3a03002 	mov	r3, #2
     1b4:	e50b3008 	str	r3, [fp, #-8]
     1b8:	ea00001e 	b	238 <main+0xe4>
        if((fd = open(argv[i], 0)) < 0){
     1bc:	e51b3008 	ldr	r3, [fp, #-8]
     1c0:	e1a03103 	lsl	r3, r3, #2
     1c4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
     1c8:	e0823003 	add	r3, r2, r3
     1cc:	e5933000 	ldr	r3, [r3]
     1d0:	e1a00003 	mov	r0, r3
     1d4:	e3a01000 	mov	r1, #0
     1d8:	eb000242 	bl	ae8 <open>
     1dc:	e50b0010 	str	r0, [fp, #-16]
     1e0:	e51b3010 	ldr	r3, [fp, #-16]
     1e4:	e3530000 	cmp	r3, #0
     1e8:	aa00000a 	bge	218 <main+0xc4>
            printf(1, "grep: cannot open %s\n", argv[i]);
     1ec:	e51b3008 	ldr	r3, [fp, #-8]
     1f0:	e1a03103 	lsl	r3, r3, #2
     1f4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
     1f8:	e0823003 	add	r3, r2, r3
     1fc:	e5933000 	ldr	r3, [r3]
     200:	e3a00001 	mov	r0, #1
     204:	e3011544 	movw	r1, #5444	; 0x1544
     208:	e3401000 	movt	r1, #0
     20c:	e1a02003 	mov	r2, r3
     210:	eb00030d 	bl	e4c <printf>
            exit();
     214:	eb0001eb 	bl	9c8 <exit>
        }
        grep(pattern, fd);
     218:	e51b000c 	ldr	r0, [fp, #-12]
     21c:	e51b1010 	ldr	r1, [fp, #-16]
     220:	ebffff76 	bl	0 <grep>
        close(fd);
     224:	e51b0010 	ldr	r0, [fp, #-16]
     228:	eb000213 	bl	a7c <close>
    if(argc <= 2){
        grep(pattern, 0);
        exit();
    }
    
    for(i = 2; i < argc; i++){
     22c:	e51b3008 	ldr	r3, [fp, #-8]
     230:	e2833001 	add	r3, r3, #1
     234:	e50b3008 	str	r3, [fp, #-8]
     238:	e51b2008 	ldr	r2, [fp, #-8]
     23c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     240:	e1520003 	cmp	r2, r3
     244:	baffffdc 	blt	1bc <main+0x68>
            exit();
        }
        grep(pattern, fd);
        close(fd);
    }
    exit();
     248:	eb0001de 	bl	9c8 <exit>

0000024c <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     24c:	e92d4800 	push	{fp, lr}
     250:	e28db004 	add	fp, sp, #4
     254:	e24dd008 	sub	sp, sp, #8
     258:	e50b0008 	str	r0, [fp, #-8]
     25c:	e50b100c 	str	r1, [fp, #-12]
    if(re[0] == '^')
     260:	e51b3008 	ldr	r3, [fp, #-8]
     264:	e5d33000 	ldrb	r3, [r3]
     268:	e353005e 	cmp	r3, #94	; 0x5e
     26c:	1a000006 	bne	28c <match+0x40>
        return matchhere(re+1, text);
     270:	e51b3008 	ldr	r3, [fp, #-8]
     274:	e2833001 	add	r3, r3, #1
     278:	e1a00003 	mov	r0, r3
     27c:	e51b100c 	ldr	r1, [fp, #-12]
     280:	eb000018 	bl	2e8 <matchhere>
     284:	e1a03000 	mov	r3, r0
     288:	ea000013 	b	2dc <match+0x90>
    do{  // must look at empty string
        if(matchhere(re, text))
     28c:	e51b0008 	ldr	r0, [fp, #-8]
     290:	e51b100c 	ldr	r1, [fp, #-12]
     294:	eb000013 	bl	2e8 <matchhere>
     298:	e1a03000 	mov	r3, r0
     29c:	e3530000 	cmp	r3, #0
     2a0:	0a000001 	beq	2ac <match+0x60>
            return 1;
     2a4:	e3a03001 	mov	r3, #1
     2a8:	ea00000b 	b	2dc <match+0x90>
    }while(*text++ != '\0');
     2ac:	e51b300c 	ldr	r3, [fp, #-12]
     2b0:	e5d33000 	ldrb	r3, [r3]
     2b4:	e3530000 	cmp	r3, #0
     2b8:	03a03000 	moveq	r3, #0
     2bc:	13a03001 	movne	r3, #1
     2c0:	e6ef3073 	uxtb	r3, r3
     2c4:	e51b200c 	ldr	r2, [fp, #-12]
     2c8:	e2822001 	add	r2, r2, #1
     2cc:	e50b200c 	str	r2, [fp, #-12]
     2d0:	e3530000 	cmp	r3, #0
     2d4:	1affffec 	bne	28c <match+0x40>
    return 0;
     2d8:	e3a03000 	mov	r3, #0
}
     2dc:	e1a00003 	mov	r0, r3
     2e0:	e24bd004 	sub	sp, fp, #4
     2e4:	e8bd8800 	pop	{fp, pc}

000002e8 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     2e8:	e92d4800 	push	{fp, lr}
     2ec:	e28db004 	add	fp, sp, #4
     2f0:	e24dd008 	sub	sp, sp, #8
     2f4:	e50b0008 	str	r0, [fp, #-8]
     2f8:	e50b100c 	str	r1, [fp, #-12]
    if(re[0] == '\0')
     2fc:	e51b3008 	ldr	r3, [fp, #-8]
     300:	e5d33000 	ldrb	r3, [r3]
     304:	e3530000 	cmp	r3, #0
     308:	1a000001 	bne	314 <matchhere+0x2c>
        return 1;
     30c:	e3a03001 	mov	r3, #1
     310:	ea000036 	b	3f0 <matchhere+0x108>
    if(re[1] == '*')
     314:	e51b3008 	ldr	r3, [fp, #-8]
     318:	e2833001 	add	r3, r3, #1
     31c:	e5d33000 	ldrb	r3, [r3]
     320:	e353002a 	cmp	r3, #42	; 0x2a
     324:	1a00000a 	bne	354 <matchhere+0x6c>
        return matchstar(re[0], re+2, text);
     328:	e51b3008 	ldr	r3, [fp, #-8]
     32c:	e5d33000 	ldrb	r3, [r3]
     330:	e1a02003 	mov	r2, r3
     334:	e51b3008 	ldr	r3, [fp, #-8]
     338:	e2833002 	add	r3, r3, #2
     33c:	e1a00002 	mov	r0, r2
     340:	e1a01003 	mov	r1, r3
     344:	e51b200c 	ldr	r2, [fp, #-12]
     348:	eb00002b 	bl	3fc <matchstar>
     34c:	e1a03000 	mov	r3, r0
     350:	ea000026 	b	3f0 <matchhere+0x108>
    if(re[0] == '$' && re[1] == '\0')
     354:	e51b3008 	ldr	r3, [fp, #-8]
     358:	e5d33000 	ldrb	r3, [r3]
     35c:	e3530024 	cmp	r3, #36	; 0x24
     360:	1a00000a 	bne	390 <matchhere+0xa8>
     364:	e51b3008 	ldr	r3, [fp, #-8]
     368:	e2833001 	add	r3, r3, #1
     36c:	e5d33000 	ldrb	r3, [r3]
     370:	e3530000 	cmp	r3, #0
     374:	1a000005 	bne	390 <matchhere+0xa8>
        return *text == '\0';
     378:	e51b300c 	ldr	r3, [fp, #-12]
     37c:	e5d33000 	ldrb	r3, [r3]
     380:	e3530000 	cmp	r3, #0
     384:	13a03000 	movne	r3, #0
     388:	03a03001 	moveq	r3, #1
     38c:	ea000017 	b	3f0 <matchhere+0x108>
    if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     390:	e51b300c 	ldr	r3, [fp, #-12]
     394:	e5d33000 	ldrb	r3, [r3]
     398:	e3530000 	cmp	r3, #0
     39c:	0a000012 	beq	3ec <matchhere+0x104>
     3a0:	e51b3008 	ldr	r3, [fp, #-8]
     3a4:	e5d33000 	ldrb	r3, [r3]
     3a8:	e353002e 	cmp	r3, #46	; 0x2e
     3ac:	0a000005 	beq	3c8 <matchhere+0xe0>
     3b0:	e51b3008 	ldr	r3, [fp, #-8]
     3b4:	e5d32000 	ldrb	r2, [r3]
     3b8:	e51b300c 	ldr	r3, [fp, #-12]
     3bc:	e5d33000 	ldrb	r3, [r3]
     3c0:	e1520003 	cmp	r2, r3
     3c4:	1a000008 	bne	3ec <matchhere+0x104>
        return matchhere(re+1, text+1);
     3c8:	e51b3008 	ldr	r3, [fp, #-8]
     3cc:	e2832001 	add	r2, r3, #1
     3d0:	e51b300c 	ldr	r3, [fp, #-12]
     3d4:	e2833001 	add	r3, r3, #1
     3d8:	e1a00002 	mov	r0, r2
     3dc:	e1a01003 	mov	r1, r3
     3e0:	ebffffc0 	bl	2e8 <matchhere>
     3e4:	e1a03000 	mov	r3, r0
     3e8:	ea000000 	b	3f0 <matchhere+0x108>
    return 0;
     3ec:	e3a03000 	mov	r3, #0
}
     3f0:	e1a00003 	mov	r0, r3
     3f4:	e24bd004 	sub	sp, fp, #4
     3f8:	e8bd8800 	pop	{fp, pc}

000003fc <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     3fc:	e92d4800 	push	{fp, lr}
     400:	e28db004 	add	fp, sp, #4
     404:	e24dd010 	sub	sp, sp, #16
     408:	e50b0008 	str	r0, [fp, #-8]
     40c:	e50b100c 	str	r1, [fp, #-12]
     410:	e50b2010 	str	r2, [fp, #-16]
    do{  // a * matches zero or more instances
        if(matchhere(re, text))
     414:	e51b000c 	ldr	r0, [fp, #-12]
     418:	e51b1010 	ldr	r1, [fp, #-16]
     41c:	ebffffb1 	bl	2e8 <matchhere>
     420:	e1a03000 	mov	r3, r0
     424:	e3530000 	cmp	r3, #0
     428:	0a000001 	beq	434 <matchstar+0x38>
            return 1;
     42c:	e3a03001 	mov	r3, #1
     430:	ea000014 	b	488 <matchstar+0x8c>
    }while(*text!='\0' && (*text++==c || c=='.'));
     434:	e51b3010 	ldr	r3, [fp, #-16]
     438:	e5d33000 	ldrb	r3, [r3]
     43c:	e3530000 	cmp	r3, #0
     440:	0a00000f 	beq	484 <matchstar+0x88>
     444:	e51b3010 	ldr	r3, [fp, #-16]
     448:	e5d33000 	ldrb	r3, [r3]
     44c:	e1a02003 	mov	r2, r3
     450:	e51b3008 	ldr	r3, [fp, #-8]
     454:	e1520003 	cmp	r2, r3
     458:	13a03000 	movne	r3, #0
     45c:	03a03001 	moveq	r3, #1
     460:	e6ef3073 	uxtb	r3, r3
     464:	e51b2010 	ldr	r2, [fp, #-16]
     468:	e2822001 	add	r2, r2, #1
     46c:	e50b2010 	str	r2, [fp, #-16]
     470:	e3530000 	cmp	r3, #0
     474:	1affffe6 	bne	414 <matchstar+0x18>
     478:	e51b3008 	ldr	r3, [fp, #-8]
     47c:	e353002e 	cmp	r3, #46	; 0x2e
     480:	0affffe3 	beq	414 <matchstar+0x18>
    return 0;
     484:	e3a03000 	mov	r3, #0
}
     488:	e1a00003 	mov	r0, r3
     48c:	e24bd004 	sub	sp, fp, #4
     490:	e8bd8800 	pop	{fp, pc}

00000494 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
     494:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     498:	e28db000 	add	fp, sp, #0
     49c:	e24dd014 	sub	sp, sp, #20
     4a0:	e50b0010 	str	r0, [fp, #-16]
     4a4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
     4a8:	e51b3010 	ldr	r3, [fp, #-16]
     4ac:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
     4b0:	e1a00000 	nop			; (mov r0, r0)
     4b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     4b8:	e5d32000 	ldrb	r2, [r3]
     4bc:	e51b3010 	ldr	r3, [fp, #-16]
     4c0:	e5c32000 	strb	r2, [r3]
     4c4:	e51b3010 	ldr	r3, [fp, #-16]
     4c8:	e5d33000 	ldrb	r3, [r3]
     4cc:	e3530000 	cmp	r3, #0
     4d0:	03a03000 	moveq	r3, #0
     4d4:	13a03001 	movne	r3, #1
     4d8:	e6ef3073 	uxtb	r3, r3
     4dc:	e51b2010 	ldr	r2, [fp, #-16]
     4e0:	e2822001 	add	r2, r2, #1
     4e4:	e50b2010 	str	r2, [fp, #-16]
     4e8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     4ec:	e2822001 	add	r2, r2, #1
     4f0:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
     4f4:	e3530000 	cmp	r3, #0
     4f8:	1affffed 	bne	4b4 <strcpy+0x20>
        ;
    return os;
     4fc:	e51b3008 	ldr	r3, [fp, #-8]
}
     500:	e1a00003 	mov	r0, r3
     504:	e28bd000 	add	sp, fp, #0
     508:	e8bd0800 	pop	{fp}
     50c:	e12fff1e 	bx	lr

00000510 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     510:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     514:	e28db000 	add	fp, sp, #0
     518:	e24dd00c 	sub	sp, sp, #12
     51c:	e50b0008 	str	r0, [fp, #-8]
     520:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     524:	ea000005 	b	540 <strcmp+0x30>
        p++, q++;
     528:	e51b3008 	ldr	r3, [fp, #-8]
     52c:	e2833001 	add	r3, r3, #1
     530:	e50b3008 	str	r3, [fp, #-8]
     534:	e51b300c 	ldr	r3, [fp, #-12]
     538:	e2833001 	add	r3, r3, #1
     53c:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     540:	e51b3008 	ldr	r3, [fp, #-8]
     544:	e5d33000 	ldrb	r3, [r3]
     548:	e3530000 	cmp	r3, #0
     54c:	0a000005 	beq	568 <strcmp+0x58>
     550:	e51b3008 	ldr	r3, [fp, #-8]
     554:	e5d32000 	ldrb	r2, [r3]
     558:	e51b300c 	ldr	r3, [fp, #-12]
     55c:	e5d33000 	ldrb	r3, [r3]
     560:	e1520003 	cmp	r2, r3
     564:	0affffef 	beq	528 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     568:	e51b3008 	ldr	r3, [fp, #-8]
     56c:	e5d33000 	ldrb	r3, [r3]
     570:	e1a02003 	mov	r2, r3
     574:	e51b300c 	ldr	r3, [fp, #-12]
     578:	e5d33000 	ldrb	r3, [r3]
     57c:	e0633002 	rsb	r3, r3, r2
}
     580:	e1a00003 	mov	r0, r3
     584:	e28bd000 	add	sp, fp, #0
     588:	e8bd0800 	pop	{fp}
     58c:	e12fff1e 	bx	lr

00000590 <strlen>:

uint
strlen(char *s)
{
     590:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     594:	e28db000 	add	fp, sp, #0
     598:	e24dd014 	sub	sp, sp, #20
     59c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     5a0:	e3a03000 	mov	r3, #0
     5a4:	e50b3008 	str	r3, [fp, #-8]
     5a8:	ea000002 	b	5b8 <strlen+0x28>
     5ac:	e51b3008 	ldr	r3, [fp, #-8]
     5b0:	e2833001 	add	r3, r3, #1
     5b4:	e50b3008 	str	r3, [fp, #-8]
     5b8:	e51b3008 	ldr	r3, [fp, #-8]
     5bc:	e51b2010 	ldr	r2, [fp, #-16]
     5c0:	e0823003 	add	r3, r2, r3
     5c4:	e5d33000 	ldrb	r3, [r3]
     5c8:	e3530000 	cmp	r3, #0
     5cc:	1afffff6 	bne	5ac <strlen+0x1c>
        ;
    return n;
     5d0:	e51b3008 	ldr	r3, [fp, #-8]
}
     5d4:	e1a00003 	mov	r0, r3
     5d8:	e28bd000 	add	sp, fp, #0
     5dc:	e8bd0800 	pop	{fp}
     5e0:	e12fff1e 	bx	lr

000005e4 <memset>:

void*
memset(void *dst, int v, uint n)
{
     5e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     5e8:	e28db000 	add	fp, sp, #0
     5ec:	e24dd024 	sub	sp, sp, #36	; 0x24
     5f0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     5f4:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     5f8:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     5fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     600:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     604:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     608:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     60c:	e55b300d 	ldrb	r3, [fp, #-13]
     610:	e1a02c03 	lsl	r2, r3, #24
     614:	e55b300d 	ldrb	r3, [fp, #-13]
     618:	e1a03803 	lsl	r3, r3, #16
     61c:	e1822003 	orr	r2, r2, r3
     620:	e55b300d 	ldrb	r3, [fp, #-13]
     624:	e1a03403 	lsl	r3, r3, #8
     628:	e1822003 	orr	r2, r2, r3
     62c:	e55b300d 	ldrb	r3, [fp, #-13]
     630:	e1823003 	orr	r3, r2, r3
     634:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     638:	ea000008 	b	660 <memset+0x7c>
		*p = c;
     63c:	e51b3008 	ldr	r3, [fp, #-8]
     640:	e55b200d 	ldrb	r2, [fp, #-13]
     644:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     648:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     64c:	e2433001 	sub	r3, r3, #1
     650:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     654:	e51b3008 	ldr	r3, [fp, #-8]
     658:	e2833001 	add	r3, r3, #1
     65c:	e50b3008 	str	r3, [fp, #-8]
     660:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     664:	e3530000 	cmp	r3, #0
     668:	0a000003 	beq	67c <memset+0x98>
     66c:	e51b3008 	ldr	r3, [fp, #-8]
     670:	e2033003 	and	r3, r3, #3
     674:	e3530000 	cmp	r3, #0
     678:	1affffef 	bne	63c <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     67c:	e51b3008 	ldr	r3, [fp, #-8]
     680:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     684:	ea000008 	b	6ac <memset+0xc8>
		*p4 = val;
     688:	e51b300c 	ldr	r3, [fp, #-12]
     68c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     690:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     694:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     698:	e2433004 	sub	r3, r3, #4
     69c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     6a0:	e51b300c 	ldr	r3, [fp, #-12]
     6a4:	e2833004 	add	r3, r3, #4
     6a8:	e50b300c 	str	r3, [fp, #-12]
     6ac:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     6b0:	e3530003 	cmp	r3, #3
     6b4:	8afffff3 	bhi	688 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     6b8:	e51b300c 	ldr	r3, [fp, #-12]
     6bc:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     6c0:	ea000008 	b	6e8 <memset+0x104>
		*p = c;
     6c4:	e51b3008 	ldr	r3, [fp, #-8]
     6c8:	e55b200d 	ldrb	r2, [fp, #-13]
     6cc:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     6d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     6d4:	e2433001 	sub	r3, r3, #1
     6d8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     6dc:	e51b3008 	ldr	r3, [fp, #-8]
     6e0:	e2833001 	add	r3, r3, #1
     6e4:	e50b3008 	str	r3, [fp, #-8]
     6e8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     6ec:	e3530000 	cmp	r3, #0
     6f0:	1afffff3 	bne	6c4 <memset+0xe0>
		*p = c;
	}

	return dst;
     6f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     6f8:	e1a00003 	mov	r0, r3
     6fc:	e28bd000 	add	sp, fp, #0
     700:	e8bd0800 	pop	{fp}
     704:	e12fff1e 	bx	lr

00000708 <strchr>:

char*
strchr(const char *s, char c)
{
     708:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     70c:	e28db000 	add	fp, sp, #0
     710:	e24dd00c 	sub	sp, sp, #12
     714:	e50b0008 	str	r0, [fp, #-8]
     718:	e1a03001 	mov	r3, r1
     71c:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     720:	ea000009 	b	74c <strchr+0x44>
        if(*s == c)
     724:	e51b3008 	ldr	r3, [fp, #-8]
     728:	e5d33000 	ldrb	r3, [r3]
     72c:	e55b2009 	ldrb	r2, [fp, #-9]
     730:	e1520003 	cmp	r2, r3
     734:	1a000001 	bne	740 <strchr+0x38>
            return (char*)s;
     738:	e51b3008 	ldr	r3, [fp, #-8]
     73c:	ea000007 	b	760 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     740:	e51b3008 	ldr	r3, [fp, #-8]
     744:	e2833001 	add	r3, r3, #1
     748:	e50b3008 	str	r3, [fp, #-8]
     74c:	e51b3008 	ldr	r3, [fp, #-8]
     750:	e5d33000 	ldrb	r3, [r3]
     754:	e3530000 	cmp	r3, #0
     758:	1afffff1 	bne	724 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     75c:	e3a03000 	mov	r3, #0
}
     760:	e1a00003 	mov	r0, r3
     764:	e28bd000 	add	sp, fp, #0
     768:	e8bd0800 	pop	{fp}
     76c:	e12fff1e 	bx	lr

00000770 <gets>:

char*
gets(char *buf, int max)
{
     770:	e92d4800 	push	{fp, lr}
     774:	e28db004 	add	fp, sp, #4
     778:	e24dd018 	sub	sp, sp, #24
     77c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     780:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     784:	e3a03000 	mov	r3, #0
     788:	e50b3008 	str	r3, [fp, #-8]
     78c:	ea000016 	b	7ec <gets+0x7c>
        cc = read(0, &c, 1);
     790:	e3a00000 	mov	r0, #0
     794:	e24b300d 	sub	r3, fp, #13
     798:	e1a01003 	mov	r1, r3
     79c:	e3a02001 	mov	r2, #1
     7a0:	eb0000a3 	bl	a34 <read>
     7a4:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     7a8:	e51b300c 	ldr	r3, [fp, #-12]
     7ac:	e3530000 	cmp	r3, #0
     7b0:	da000013 	ble	804 <gets+0x94>
            break;
        buf[i++] = c;
     7b4:	e51b3008 	ldr	r3, [fp, #-8]
     7b8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     7bc:	e0823003 	add	r3, r2, r3
     7c0:	e55b200d 	ldrb	r2, [fp, #-13]
     7c4:	e5c32000 	strb	r2, [r3]
     7c8:	e51b3008 	ldr	r3, [fp, #-8]
     7cc:	e2833001 	add	r3, r3, #1
     7d0:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     7d4:	e55b300d 	ldrb	r3, [fp, #-13]
     7d8:	e353000a 	cmp	r3, #10
     7dc:	0a000009 	beq	808 <gets+0x98>
     7e0:	e55b300d 	ldrb	r3, [fp, #-13]
     7e4:	e353000d 	cmp	r3, #13
     7e8:	0a000006 	beq	808 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     7ec:	e51b3008 	ldr	r3, [fp, #-8]
     7f0:	e2832001 	add	r2, r3, #1
     7f4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     7f8:	e1520003 	cmp	r2, r3
     7fc:	baffffe3 	blt	790 <gets+0x20>
     800:	ea000000 	b	808 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     804:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     808:	e51b3008 	ldr	r3, [fp, #-8]
     80c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     810:	e0823003 	add	r3, r2, r3
     814:	e3a02000 	mov	r2, #0
     818:	e5c32000 	strb	r2, [r3]
    return buf;
     81c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     820:	e1a00003 	mov	r0, r3
     824:	e24bd004 	sub	sp, fp, #4
     828:	e8bd8800 	pop	{fp, pc}

0000082c <stat>:

int
stat(char *n, struct stat *st)
{
     82c:	e92d4800 	push	{fp, lr}
     830:	e28db004 	add	fp, sp, #4
     834:	e24dd010 	sub	sp, sp, #16
     838:	e50b0010 	str	r0, [fp, #-16]
     83c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     840:	e51b0010 	ldr	r0, [fp, #-16]
     844:	e3a01000 	mov	r1, #0
     848:	eb0000a6 	bl	ae8 <open>
     84c:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     850:	e51b3008 	ldr	r3, [fp, #-8]
     854:	e3530000 	cmp	r3, #0
     858:	aa000001 	bge	864 <stat+0x38>
        return -1;
     85c:	e3e03000 	mvn	r3, #0
     860:	ea000006 	b	880 <stat+0x54>
    r = fstat(fd, st);
     864:	e51b0008 	ldr	r0, [fp, #-8]
     868:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     86c:	eb0000b8 	bl	b54 <fstat>
     870:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     874:	e51b0008 	ldr	r0, [fp, #-8]
     878:	eb00007f 	bl	a7c <close>
    return r;
     87c:	e51b300c 	ldr	r3, [fp, #-12]
}
     880:	e1a00003 	mov	r0, r3
     884:	e24bd004 	sub	sp, fp, #4
     888:	e8bd8800 	pop	{fp, pc}

0000088c <atoi>:

int
atoi(const char *s)
{
     88c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     890:	e28db000 	add	fp, sp, #0
     894:	e24dd014 	sub	sp, sp, #20
     898:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     89c:	e3a03000 	mov	r3, #0
     8a0:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     8a4:	ea00000d 	b	8e0 <atoi+0x54>
        n = n*10 + *s++ - '0';
     8a8:	e51b2008 	ldr	r2, [fp, #-8]
     8ac:	e1a03002 	mov	r3, r2
     8b0:	e1a03103 	lsl	r3, r3, #2
     8b4:	e0833002 	add	r3, r3, r2
     8b8:	e1a03083 	lsl	r3, r3, #1
     8bc:	e1a02003 	mov	r2, r3
     8c0:	e51b3010 	ldr	r3, [fp, #-16]
     8c4:	e5d33000 	ldrb	r3, [r3]
     8c8:	e0823003 	add	r3, r2, r3
     8cc:	e2433030 	sub	r3, r3, #48	; 0x30
     8d0:	e50b3008 	str	r3, [fp, #-8]
     8d4:	e51b3010 	ldr	r3, [fp, #-16]
     8d8:	e2833001 	add	r3, r3, #1
     8dc:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     8e0:	e51b3010 	ldr	r3, [fp, #-16]
     8e4:	e5d33000 	ldrb	r3, [r3]
     8e8:	e353002f 	cmp	r3, #47	; 0x2f
     8ec:	9a000003 	bls	900 <atoi+0x74>
     8f0:	e51b3010 	ldr	r3, [fp, #-16]
     8f4:	e5d33000 	ldrb	r3, [r3]
     8f8:	e3530039 	cmp	r3, #57	; 0x39
     8fc:	9affffe9 	bls	8a8 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     900:	e51b3008 	ldr	r3, [fp, #-8]
}
     904:	e1a00003 	mov	r0, r3
     908:	e28bd000 	add	sp, fp, #0
     90c:	e8bd0800 	pop	{fp}
     910:	e12fff1e 	bx	lr

00000914 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     914:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     918:	e28db000 	add	fp, sp, #0
     91c:	e24dd01c 	sub	sp, sp, #28
     920:	e50b0010 	str	r0, [fp, #-16]
     924:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     928:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     92c:	e51b3010 	ldr	r3, [fp, #-16]
     930:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     934:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     938:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     93c:	ea000009 	b	968 <memmove+0x54>
        *dst++ = *src++;
     940:	e51b300c 	ldr	r3, [fp, #-12]
     944:	e5d32000 	ldrb	r2, [r3]
     948:	e51b3008 	ldr	r3, [fp, #-8]
     94c:	e5c32000 	strb	r2, [r3]
     950:	e51b3008 	ldr	r3, [fp, #-8]
     954:	e2833001 	add	r3, r3, #1
     958:	e50b3008 	str	r3, [fp, #-8]
     95c:	e51b300c 	ldr	r3, [fp, #-12]
     960:	e2833001 	add	r3, r3, #1
     964:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     968:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     96c:	e3530000 	cmp	r3, #0
     970:	d3a03000 	movle	r3, #0
     974:	c3a03001 	movgt	r3, #1
     978:	e6ef3073 	uxtb	r3, r3
     97c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     980:	e2422001 	sub	r2, r2, #1
     984:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     988:	e3530000 	cmp	r3, #0
     98c:	1affffeb 	bne	940 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     990:	e51b3010 	ldr	r3, [fp, #-16]
}
     994:	e1a00003 	mov	r0, r3
     998:	e28bd000 	add	sp, fp, #0
     99c:	e8bd0800 	pop	{fp}
     9a0:	e12fff1e 	bx	lr

000009a4 <fork>:
     9a4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9a8:	e1a04003 	mov	r4, r3
     9ac:	e1a03002 	mov	r3, r2
     9b0:	e1a02001 	mov	r2, r1
     9b4:	e1a01000 	mov	r1, r0
     9b8:	e3a00001 	mov	r0, #1
     9bc:	ef000000 	svc	0x00000000
     9c0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     9c4:	e12fff1e 	bx	lr

000009c8 <exit>:
     9c8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9cc:	e1a04003 	mov	r4, r3
     9d0:	e1a03002 	mov	r3, r2
     9d4:	e1a02001 	mov	r2, r1
     9d8:	e1a01000 	mov	r1, r0
     9dc:	e3a00002 	mov	r0, #2
     9e0:	ef000000 	svc	0x00000000
     9e4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     9e8:	e12fff1e 	bx	lr

000009ec <wait>:
     9ec:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9f0:	e1a04003 	mov	r4, r3
     9f4:	e1a03002 	mov	r3, r2
     9f8:	e1a02001 	mov	r2, r1
     9fc:	e1a01000 	mov	r1, r0
     a00:	e3a00003 	mov	r0, #3
     a04:	ef000000 	svc	0x00000000
     a08:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a0c:	e12fff1e 	bx	lr

00000a10 <pipe>:
     a10:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a14:	e1a04003 	mov	r4, r3
     a18:	e1a03002 	mov	r3, r2
     a1c:	e1a02001 	mov	r2, r1
     a20:	e1a01000 	mov	r1, r0
     a24:	e3a00004 	mov	r0, #4
     a28:	ef000000 	svc	0x00000000
     a2c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a30:	e12fff1e 	bx	lr

00000a34 <read>:
     a34:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a38:	e1a04003 	mov	r4, r3
     a3c:	e1a03002 	mov	r3, r2
     a40:	e1a02001 	mov	r2, r1
     a44:	e1a01000 	mov	r1, r0
     a48:	e3a00005 	mov	r0, #5
     a4c:	ef000000 	svc	0x00000000
     a50:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a54:	e12fff1e 	bx	lr

00000a58 <write>:
     a58:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a5c:	e1a04003 	mov	r4, r3
     a60:	e1a03002 	mov	r3, r2
     a64:	e1a02001 	mov	r2, r1
     a68:	e1a01000 	mov	r1, r0
     a6c:	e3a00010 	mov	r0, #16
     a70:	ef000000 	svc	0x00000000
     a74:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a78:	e12fff1e 	bx	lr

00000a7c <close>:
     a7c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a80:	e1a04003 	mov	r4, r3
     a84:	e1a03002 	mov	r3, r2
     a88:	e1a02001 	mov	r2, r1
     a8c:	e1a01000 	mov	r1, r0
     a90:	e3a00015 	mov	r0, #21
     a94:	ef000000 	svc	0x00000000
     a98:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a9c:	e12fff1e 	bx	lr

00000aa0 <kill>:
     aa0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     aa4:	e1a04003 	mov	r4, r3
     aa8:	e1a03002 	mov	r3, r2
     aac:	e1a02001 	mov	r2, r1
     ab0:	e1a01000 	mov	r1, r0
     ab4:	e3a00006 	mov	r0, #6
     ab8:	ef000000 	svc	0x00000000
     abc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     ac0:	e12fff1e 	bx	lr

00000ac4 <exec>:
     ac4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     ac8:	e1a04003 	mov	r4, r3
     acc:	e1a03002 	mov	r3, r2
     ad0:	e1a02001 	mov	r2, r1
     ad4:	e1a01000 	mov	r1, r0
     ad8:	e3a00007 	mov	r0, #7
     adc:	ef000000 	svc	0x00000000
     ae0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     ae4:	e12fff1e 	bx	lr

00000ae8 <open>:
     ae8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     aec:	e1a04003 	mov	r4, r3
     af0:	e1a03002 	mov	r3, r2
     af4:	e1a02001 	mov	r2, r1
     af8:	e1a01000 	mov	r1, r0
     afc:	e3a0000f 	mov	r0, #15
     b00:	ef000000 	svc	0x00000000
     b04:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b08:	e12fff1e 	bx	lr

00000b0c <mknod>:
     b0c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b10:	e1a04003 	mov	r4, r3
     b14:	e1a03002 	mov	r3, r2
     b18:	e1a02001 	mov	r2, r1
     b1c:	e1a01000 	mov	r1, r0
     b20:	e3a00011 	mov	r0, #17
     b24:	ef000000 	svc	0x00000000
     b28:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b2c:	e12fff1e 	bx	lr

00000b30 <unlink>:
     b30:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b34:	e1a04003 	mov	r4, r3
     b38:	e1a03002 	mov	r3, r2
     b3c:	e1a02001 	mov	r2, r1
     b40:	e1a01000 	mov	r1, r0
     b44:	e3a00012 	mov	r0, #18
     b48:	ef000000 	svc	0x00000000
     b4c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b50:	e12fff1e 	bx	lr

00000b54 <fstat>:
     b54:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b58:	e1a04003 	mov	r4, r3
     b5c:	e1a03002 	mov	r3, r2
     b60:	e1a02001 	mov	r2, r1
     b64:	e1a01000 	mov	r1, r0
     b68:	e3a00008 	mov	r0, #8
     b6c:	ef000000 	svc	0x00000000
     b70:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b74:	e12fff1e 	bx	lr

00000b78 <link>:
     b78:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b7c:	e1a04003 	mov	r4, r3
     b80:	e1a03002 	mov	r3, r2
     b84:	e1a02001 	mov	r2, r1
     b88:	e1a01000 	mov	r1, r0
     b8c:	e3a00013 	mov	r0, #19
     b90:	ef000000 	svc	0x00000000
     b94:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b98:	e12fff1e 	bx	lr

00000b9c <mkdir>:
     b9c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     ba0:	e1a04003 	mov	r4, r3
     ba4:	e1a03002 	mov	r3, r2
     ba8:	e1a02001 	mov	r2, r1
     bac:	e1a01000 	mov	r1, r0
     bb0:	e3a00014 	mov	r0, #20
     bb4:	ef000000 	svc	0x00000000
     bb8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     bbc:	e12fff1e 	bx	lr

00000bc0 <chdir>:
     bc0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     bc4:	e1a04003 	mov	r4, r3
     bc8:	e1a03002 	mov	r3, r2
     bcc:	e1a02001 	mov	r2, r1
     bd0:	e1a01000 	mov	r1, r0
     bd4:	e3a00009 	mov	r0, #9
     bd8:	ef000000 	svc	0x00000000
     bdc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     be0:	e12fff1e 	bx	lr

00000be4 <dup>:
     be4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     be8:	e1a04003 	mov	r4, r3
     bec:	e1a03002 	mov	r3, r2
     bf0:	e1a02001 	mov	r2, r1
     bf4:	e1a01000 	mov	r1, r0
     bf8:	e3a0000a 	mov	r0, #10
     bfc:	ef000000 	svc	0x00000000
     c00:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     c04:	e12fff1e 	bx	lr

00000c08 <getpid>:
     c08:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     c0c:	e1a04003 	mov	r4, r3
     c10:	e1a03002 	mov	r3, r2
     c14:	e1a02001 	mov	r2, r1
     c18:	e1a01000 	mov	r1, r0
     c1c:	e3a0000b 	mov	r0, #11
     c20:	ef000000 	svc	0x00000000
     c24:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     c28:	e12fff1e 	bx	lr

00000c2c <sbrk>:
     c2c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     c30:	e1a04003 	mov	r4, r3
     c34:	e1a03002 	mov	r3, r2
     c38:	e1a02001 	mov	r2, r1
     c3c:	e1a01000 	mov	r1, r0
     c40:	e3a0000c 	mov	r0, #12
     c44:	ef000000 	svc	0x00000000
     c48:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     c4c:	e12fff1e 	bx	lr

00000c50 <sleep>:
     c50:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     c54:	e1a04003 	mov	r4, r3
     c58:	e1a03002 	mov	r3, r2
     c5c:	e1a02001 	mov	r2, r1
     c60:	e1a01000 	mov	r1, r0
     c64:	e3a0000d 	mov	r0, #13
     c68:	ef000000 	svc	0x00000000
     c6c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     c70:	e12fff1e 	bx	lr

00000c74 <uptime>:
     c74:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     c78:	e1a04003 	mov	r4, r3
     c7c:	e1a03002 	mov	r3, r2
     c80:	e1a02001 	mov	r2, r1
     c84:	e1a01000 	mov	r1, r0
     c88:	e3a0000e 	mov	r0, #14
     c8c:	ef000000 	svc	0x00000000
     c90:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     c94:	e12fff1e 	bx	lr

00000c98 <kthread_create>:
     c98:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     c9c:	e1a04003 	mov	r4, r3
     ca0:	e1a03002 	mov	r3, r2
     ca4:	e1a02001 	mov	r2, r1
     ca8:	e1a01000 	mov	r1, r0
     cac:	e3a00016 	mov	r0, #22
     cb0:	ef000000 	svc	0x00000000
     cb4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     cb8:	e12fff1e 	bx	lr

00000cbc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     cbc:	e92d4800 	push	{fp, lr}
     cc0:	e28db004 	add	fp, sp, #4
     cc4:	e24dd008 	sub	sp, sp, #8
     cc8:	e50b0008 	str	r0, [fp, #-8]
     ccc:	e1a03001 	mov	r3, r1
     cd0:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     cd4:	e51b0008 	ldr	r0, [fp, #-8]
     cd8:	e24b3009 	sub	r3, fp, #9
     cdc:	e1a01003 	mov	r1, r3
     ce0:	e3a02001 	mov	r2, #1
     ce4:	ebffff5b 	bl	a58 <write>
}
     ce8:	e24bd004 	sub	sp, fp, #4
     cec:	e8bd8800 	pop	{fp, pc}

00000cf0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     cf0:	e92d4800 	push	{fp, lr}
     cf4:	e28db004 	add	fp, sp, #4
     cf8:	e24dd030 	sub	sp, sp, #48	; 0x30
     cfc:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     d00:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     d04:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     d08:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     d0c:	e3a03000 	mov	r3, #0
     d10:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     d14:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     d18:	e3530000 	cmp	r3, #0
     d1c:	0a000008 	beq	d44 <printint+0x54>
     d20:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     d24:	e3530000 	cmp	r3, #0
     d28:	aa000005 	bge	d44 <printint+0x54>
        neg = 1;
     d2c:	e3a03001 	mov	r3, #1
     d30:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     d34:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     d38:	e2633000 	rsb	r3, r3, #0
     d3c:	e50b3010 	str	r3, [fp, #-16]
     d40:	ea000001 	b	d4c <printint+0x5c>
    } else {
        x = xx;
     d44:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     d48:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     d4c:	e3a03000 	mov	r3, #0
     d50:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     d54:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     d58:	e51b2010 	ldr	r2, [fp, #-16]
     d5c:	e1a00002 	mov	r0, r2
     d60:	e1a01003 	mov	r1, r3
     d64:	eb0001e5 	bl	1500 <__aeabi_uidivmod>
     d68:	e1a03001 	mov	r3, r1
     d6c:	e1a02003 	mov	r2, r3
     d70:	e3013564 	movw	r3, #5476	; 0x1564
     d74:	e3403000 	movt	r3, #0
     d78:	e7d32002 	ldrb	r2, [r3, r2]
     d7c:	e3e0001b 	mvn	r0, #27
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e24bc004 	sub	ip, fp, #4
     d88:	e08c1003 	add	r1, ip, r3
     d8c:	e1a03000 	mov	r3, r0
     d90:	e0813003 	add	r3, r1, r3
     d94:	e5c32000 	strb	r2, [r3]
     d98:	e51b3008 	ldr	r3, [fp, #-8]
     d9c:	e2833001 	add	r3, r3, #1
     da0:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     da4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     da8:	e51b0010 	ldr	r0, [fp, #-16]
     dac:	e1a01003 	mov	r1, r3
     db0:	eb000195 	bl	140c <__aeabi_uidiv>
     db4:	e1a03000 	mov	r3, r0
     db8:	e50b3010 	str	r3, [fp, #-16]
     dbc:	e51b3010 	ldr	r3, [fp, #-16]
     dc0:	e3530000 	cmp	r3, #0
     dc4:	1affffe2 	bne	d54 <printint+0x64>
    if(neg)
     dc8:	e51b300c 	ldr	r3, [fp, #-12]
     dcc:	e3530000 	cmp	r3, #0
     dd0:	0a000015 	beq	e2c <printint+0x13c>
        buf[i++] = '-';
     dd4:	e3e0101b 	mvn	r1, #27
     dd8:	e51b3008 	ldr	r3, [fp, #-8]
     ddc:	e24b0004 	sub	r0, fp, #4
     de0:	e0802003 	add	r2, r0, r3
     de4:	e1a03001 	mov	r3, r1
     de8:	e0823003 	add	r3, r2, r3
     dec:	e3a0202d 	mov	r2, #45	; 0x2d
     df0:	e5c32000 	strb	r2, [r3]
     df4:	e51b3008 	ldr	r3, [fp, #-8]
     df8:	e2833001 	add	r3, r3, #1
     dfc:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     e00:	ea000009 	b	e2c <printint+0x13c>
        putc(fd, buf[i]);
     e04:	e3e0101b 	mvn	r1, #27
     e08:	e51b3008 	ldr	r3, [fp, #-8]
     e0c:	e24bc004 	sub	ip, fp, #4
     e10:	e08c2003 	add	r2, ip, r3
     e14:	e1a03001 	mov	r3, r1
     e18:	e0823003 	add	r3, r2, r3
     e1c:	e5d33000 	ldrb	r3, [r3]
     e20:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     e24:	e1a01003 	mov	r1, r3
     e28:	ebffffa3 	bl	cbc <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     e2c:	e51b3008 	ldr	r3, [fp, #-8]
     e30:	e2433001 	sub	r3, r3, #1
     e34:	e50b3008 	str	r3, [fp, #-8]
     e38:	e51b3008 	ldr	r3, [fp, #-8]
     e3c:	e3530000 	cmp	r3, #0
     e40:	aaffffef 	bge	e04 <printint+0x114>
        putc(fd, buf[i]);
}
     e44:	e24bd004 	sub	sp, fp, #4
     e48:	e8bd8800 	pop	{fp, pc}

00000e4c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e4c:	e92d000e 	push	{r1, r2, r3}
     e50:	e92d4800 	push	{fp, lr}
     e54:	e28db004 	add	fp, sp, #4
     e58:	e24dd024 	sub	sp, sp, #36	; 0x24
     e5c:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     e60:	e3a03000 	mov	r3, #0
     e64:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     e68:	e28b3008 	add	r3, fp, #8
     e6c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     e70:	e3a03000 	mov	r3, #0
     e74:	e50b3010 	str	r3, [fp, #-16]
     e78:	ea000077 	b	105c <printf+0x210>
        c = fmt[i] & 0xff;
     e7c:	e59b2004 	ldr	r2, [fp, #4]
     e80:	e51b3010 	ldr	r3, [fp, #-16]
     e84:	e0823003 	add	r3, r2, r3
     e88:	e5d33000 	ldrb	r3, [r3]
     e8c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     e90:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     e94:	e3530000 	cmp	r3, #0
     e98:	1a00000b 	bne	ecc <printf+0x80>
            if(c == '%'){
     e9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ea0:	e3530025 	cmp	r3, #37	; 0x25
     ea4:	1a000002 	bne	eb4 <printf+0x68>
                state = '%';
     ea8:	e3a03025 	mov	r3, #37	; 0x25
     eac:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     eb0:	ea000066 	b	1050 <printf+0x204>
            } else {
                putc(fd, c);
     eb4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     eb8:	e6ef3073 	uxtb	r3, r3
     ebc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ec0:	e1a01003 	mov	r1, r3
     ec4:	ebffff7c 	bl	cbc <putc>
     ec8:	ea000060 	b	1050 <printf+0x204>
            }
        } else if(state == '%'){
     ecc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     ed0:	e3530025 	cmp	r3, #37	; 0x25
     ed4:	1a00005d 	bne	1050 <printf+0x204>
            if(c == 'd'){
     ed8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     edc:	e3530064 	cmp	r3, #100	; 0x64
     ee0:	1a00000a 	bne	f10 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     ee4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ee8:	e5933000 	ldr	r3, [r3]
     eec:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ef0:	e1a01003 	mov	r1, r3
     ef4:	e3a0200a 	mov	r2, #10
     ef8:	e3a03001 	mov	r3, #1
     efc:	ebffff7b 	bl	cf0 <printint>
                ap++;
     f00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f04:	e2833004 	add	r3, r3, #4
     f08:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     f0c:	ea00004d 	b	1048 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     f10:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     f14:	e3530078 	cmp	r3, #120	; 0x78
     f18:	0a000002 	beq	f28 <printf+0xdc>
     f1c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     f20:	e3530070 	cmp	r3, #112	; 0x70
     f24:	1a00000a 	bne	f54 <printf+0x108>
                printint(fd, *ap, 16, 0);
     f28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f2c:	e5933000 	ldr	r3, [r3]
     f30:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     f34:	e1a01003 	mov	r1, r3
     f38:	e3a02010 	mov	r2, #16
     f3c:	e3a03000 	mov	r3, #0
     f40:	ebffff6a 	bl	cf0 <printint>
                ap++;
     f44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f48:	e2833004 	add	r3, r3, #4
     f4c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     f50:	ea00003c 	b	1048 <printf+0x1fc>
            } else if(c == 's'){
     f54:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     f58:	e3530073 	cmp	r3, #115	; 0x73
     f5c:	1a00001b 	bne	fd0 <printf+0x184>
                s = (char*)*ap;
     f60:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f64:	e5933000 	ldr	r3, [r3]
     f68:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     f6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f70:	e2833004 	add	r3, r3, #4
     f74:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     f78:	e51b300c 	ldr	r3, [fp, #-12]
     f7c:	e3530000 	cmp	r3, #0
     f80:	1a00000c 	bne	fb8 <printf+0x16c>
                    s = "(null)";
     f84:	e301355c 	movw	r3, #5468	; 0x155c
     f88:	e3403000 	movt	r3, #0
     f8c:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     f90:	ea000008 	b	fb8 <printf+0x16c>
                    putc(fd, *s);
     f94:	e51b300c 	ldr	r3, [fp, #-12]
     f98:	e5d33000 	ldrb	r3, [r3]
     f9c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     fa0:	e1a01003 	mov	r1, r3
     fa4:	ebffff44 	bl	cbc <putc>
                    s++;
     fa8:	e51b300c 	ldr	r3, [fp, #-12]
     fac:	e2833001 	add	r3, r3, #1
     fb0:	e50b300c 	str	r3, [fp, #-12]
     fb4:	ea000000 	b	fbc <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     fb8:	e1a00000 	nop			; (mov r0, r0)
     fbc:	e51b300c 	ldr	r3, [fp, #-12]
     fc0:	e5d33000 	ldrb	r3, [r3]
     fc4:	e3530000 	cmp	r3, #0
     fc8:	1afffff1 	bne	f94 <printf+0x148>
     fcc:	ea00001d 	b	1048 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     fd0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     fd4:	e3530063 	cmp	r3, #99	; 0x63
     fd8:	1a000009 	bne	1004 <printf+0x1b8>
                putc(fd, *ap);
     fdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     fe0:	e5933000 	ldr	r3, [r3]
     fe4:	e6ef3073 	uxtb	r3, r3
     fe8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     fec:	e1a01003 	mov	r1, r3
     ff0:	ebffff31 	bl	cbc <putc>
                ap++;
     ff4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     ff8:	e2833004 	add	r3, r3, #4
     ffc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    1000:	ea000010 	b	1048 <printf+0x1fc>
            } else if(c == '%'){
    1004:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1008:	e3530025 	cmp	r3, #37	; 0x25
    100c:	1a000005 	bne	1028 <printf+0x1dc>
                putc(fd, c);
    1010:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1014:	e6ef3073 	uxtb	r3, r3
    1018:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    101c:	e1a01003 	mov	r1, r3
    1020:	ebffff25 	bl	cbc <putc>
    1024:	ea000007 	b	1048 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
    1028:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    102c:	e3a01025 	mov	r1, #37	; 0x25
    1030:	ebffff21 	bl	cbc <putc>
                putc(fd, c);
    1034:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1038:	e6ef3073 	uxtb	r3, r3
    103c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1040:	e1a01003 	mov	r1, r3
    1044:	ebffff1c 	bl	cbc <putc>
            }
            state = 0;
    1048:	e3a03000 	mov	r3, #0
    104c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
    1050:	e51b3010 	ldr	r3, [fp, #-16]
    1054:	e2833001 	add	r3, r3, #1
    1058:	e50b3010 	str	r3, [fp, #-16]
    105c:	e59b2004 	ldr	r2, [fp, #4]
    1060:	e51b3010 	ldr	r3, [fp, #-16]
    1064:	e0823003 	add	r3, r2, r3
    1068:	e5d33000 	ldrb	r3, [r3]
    106c:	e3530000 	cmp	r3, #0
    1070:	1affff81 	bne	e7c <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
    1074:	e24bd004 	sub	sp, fp, #4
    1078:	e8bd4800 	pop	{fp, lr}
    107c:	e28dd00c 	add	sp, sp, #12
    1080:	e12fff1e 	bx	lr

00001084 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1084:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1088:	e28db000 	add	fp, sp, #0
    108c:	e24dd014 	sub	sp, sp, #20
    1090:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    1094:	e51b3010 	ldr	r3, [fp, #-16]
    1098:	e2433008 	sub	r3, r3, #8
    109c:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10a0:	e3013580 	movw	r3, #5504	; 0x1580
    10a4:	e3403000 	movt	r3, #0
    10a8:	e5933000 	ldr	r3, [r3]
    10ac:	e50b3008 	str	r3, [fp, #-8]
    10b0:	ea000010 	b	10f8 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10b4:	e51b3008 	ldr	r3, [fp, #-8]
    10b8:	e5932000 	ldr	r2, [r3]
    10bc:	e51b3008 	ldr	r3, [fp, #-8]
    10c0:	e1520003 	cmp	r2, r3
    10c4:	8a000008 	bhi	10ec <free+0x68>
    10c8:	e51b200c 	ldr	r2, [fp, #-12]
    10cc:	e51b3008 	ldr	r3, [fp, #-8]
    10d0:	e1520003 	cmp	r2, r3
    10d4:	8a000010 	bhi	111c <free+0x98>
    10d8:	e51b3008 	ldr	r3, [fp, #-8]
    10dc:	e5932000 	ldr	r2, [r3]
    10e0:	e51b300c 	ldr	r3, [fp, #-12]
    10e4:	e1520003 	cmp	r2, r3
    10e8:	8a00000b 	bhi	111c <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10ec:	e51b3008 	ldr	r3, [fp, #-8]
    10f0:	e5933000 	ldr	r3, [r3]
    10f4:	e50b3008 	str	r3, [fp, #-8]
    10f8:	e51b200c 	ldr	r2, [fp, #-12]
    10fc:	e51b3008 	ldr	r3, [fp, #-8]
    1100:	e1520003 	cmp	r2, r3
    1104:	9affffea 	bls	10b4 <free+0x30>
    1108:	e51b3008 	ldr	r3, [fp, #-8]
    110c:	e5932000 	ldr	r2, [r3]
    1110:	e51b300c 	ldr	r3, [fp, #-12]
    1114:	e1520003 	cmp	r2, r3
    1118:	9affffe5 	bls	10b4 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
    111c:	e51b300c 	ldr	r3, [fp, #-12]
    1120:	e5933004 	ldr	r3, [r3, #4]
    1124:	e1a03183 	lsl	r3, r3, #3
    1128:	e51b200c 	ldr	r2, [fp, #-12]
    112c:	e0822003 	add	r2, r2, r3
    1130:	e51b3008 	ldr	r3, [fp, #-8]
    1134:	e5933000 	ldr	r3, [r3]
    1138:	e1520003 	cmp	r2, r3
    113c:	1a00000d 	bne	1178 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
    1140:	e51b300c 	ldr	r3, [fp, #-12]
    1144:	e5932004 	ldr	r2, [r3, #4]
    1148:	e51b3008 	ldr	r3, [fp, #-8]
    114c:	e5933000 	ldr	r3, [r3]
    1150:	e5933004 	ldr	r3, [r3, #4]
    1154:	e0822003 	add	r2, r2, r3
    1158:	e51b300c 	ldr	r3, [fp, #-12]
    115c:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
    1160:	e51b3008 	ldr	r3, [fp, #-8]
    1164:	e5933000 	ldr	r3, [r3]
    1168:	e5932000 	ldr	r2, [r3]
    116c:	e51b300c 	ldr	r3, [fp, #-12]
    1170:	e5832000 	str	r2, [r3]
    1174:	ea000003 	b	1188 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
    1178:	e51b3008 	ldr	r3, [fp, #-8]
    117c:	e5932000 	ldr	r2, [r3]
    1180:	e51b300c 	ldr	r3, [fp, #-12]
    1184:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
    1188:	e51b3008 	ldr	r3, [fp, #-8]
    118c:	e5933004 	ldr	r3, [r3, #4]
    1190:	e1a03183 	lsl	r3, r3, #3
    1194:	e51b2008 	ldr	r2, [fp, #-8]
    1198:	e0822003 	add	r2, r2, r3
    119c:	e51b300c 	ldr	r3, [fp, #-12]
    11a0:	e1520003 	cmp	r2, r3
    11a4:	1a00000b 	bne	11d8 <free+0x154>
        p->s.size += bp->s.size;
    11a8:	e51b3008 	ldr	r3, [fp, #-8]
    11ac:	e5932004 	ldr	r2, [r3, #4]
    11b0:	e51b300c 	ldr	r3, [fp, #-12]
    11b4:	e5933004 	ldr	r3, [r3, #4]
    11b8:	e0822003 	add	r2, r2, r3
    11bc:	e51b3008 	ldr	r3, [fp, #-8]
    11c0:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
    11c4:	e51b300c 	ldr	r3, [fp, #-12]
    11c8:	e5932000 	ldr	r2, [r3]
    11cc:	e51b3008 	ldr	r3, [fp, #-8]
    11d0:	e5832000 	str	r2, [r3]
    11d4:	ea000002 	b	11e4 <free+0x160>
    } else
        p->s.ptr = bp;
    11d8:	e51b3008 	ldr	r3, [fp, #-8]
    11dc:	e51b200c 	ldr	r2, [fp, #-12]
    11e0:	e5832000 	str	r2, [r3]
    freep = p;
    11e4:	e3013580 	movw	r3, #5504	; 0x1580
    11e8:	e3403000 	movt	r3, #0
    11ec:	e51b2008 	ldr	r2, [fp, #-8]
    11f0:	e5832000 	str	r2, [r3]
}
    11f4:	e28bd000 	add	sp, fp, #0
    11f8:	e8bd0800 	pop	{fp}
    11fc:	e12fff1e 	bx	lr

00001200 <morecore>:

static Header*
morecore(uint nu)
{
    1200:	e92d4800 	push	{fp, lr}
    1204:	e28db004 	add	fp, sp, #4
    1208:	e24dd010 	sub	sp, sp, #16
    120c:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
    1210:	e51b2010 	ldr	r2, [fp, #-16]
    1214:	e3003fff 	movw	r3, #4095	; 0xfff
    1218:	e1520003 	cmp	r2, r3
    121c:	8a000001 	bhi	1228 <morecore+0x28>
        nu = 4096;
    1220:	e3a03a01 	mov	r3, #4096	; 0x1000
    1224:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
    1228:	e51b3010 	ldr	r3, [fp, #-16]
    122c:	e1a03183 	lsl	r3, r3, #3
    1230:	e1a00003 	mov	r0, r3
    1234:	ebfffe7c 	bl	c2c <sbrk>
    1238:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
    123c:	e51b3008 	ldr	r3, [fp, #-8]
    1240:	e3730001 	cmn	r3, #1
    1244:	1a000001 	bne	1250 <morecore+0x50>
        return 0;
    1248:	e3a03000 	mov	r3, #0
    124c:	ea00000b 	b	1280 <morecore+0x80>
    hp = (Header*)p;
    1250:	e51b3008 	ldr	r3, [fp, #-8]
    1254:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
    1258:	e51b300c 	ldr	r3, [fp, #-12]
    125c:	e51b2010 	ldr	r2, [fp, #-16]
    1260:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
    1264:	e51b300c 	ldr	r3, [fp, #-12]
    1268:	e2833008 	add	r3, r3, #8
    126c:	e1a00003 	mov	r0, r3
    1270:	ebffff83 	bl	1084 <free>
    return freep;
    1274:	e3013580 	movw	r3, #5504	; 0x1580
    1278:	e3403000 	movt	r3, #0
    127c:	e5933000 	ldr	r3, [r3]
}
    1280:	e1a00003 	mov	r0, r3
    1284:	e24bd004 	sub	sp, fp, #4
    1288:	e8bd8800 	pop	{fp, pc}

0000128c <malloc>:

void*
malloc(uint nbytes)
{
    128c:	e92d4800 	push	{fp, lr}
    1290:	e28db004 	add	fp, sp, #4
    1294:	e24dd018 	sub	sp, sp, #24
    1298:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    129c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    12a0:	e2833007 	add	r3, r3, #7
    12a4:	e1a031a3 	lsr	r3, r3, #3
    12a8:	e2833001 	add	r3, r3, #1
    12ac:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
    12b0:	e3013580 	movw	r3, #5504	; 0x1580
    12b4:	e3403000 	movt	r3, #0
    12b8:	e5933000 	ldr	r3, [r3]
    12bc:	e50b300c 	str	r3, [fp, #-12]
    12c0:	e51b300c 	ldr	r3, [fp, #-12]
    12c4:	e3530000 	cmp	r3, #0
    12c8:	1a000010 	bne	1310 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
    12cc:	e3013578 	movw	r3, #5496	; 0x1578
    12d0:	e3403000 	movt	r3, #0
    12d4:	e50b300c 	str	r3, [fp, #-12]
    12d8:	e3013580 	movw	r3, #5504	; 0x1580
    12dc:	e3403000 	movt	r3, #0
    12e0:	e51b200c 	ldr	r2, [fp, #-12]
    12e4:	e5832000 	str	r2, [r3]
    12e8:	e3013580 	movw	r3, #5504	; 0x1580
    12ec:	e3403000 	movt	r3, #0
    12f0:	e5932000 	ldr	r2, [r3]
    12f4:	e3013578 	movw	r3, #5496	; 0x1578
    12f8:	e3403000 	movt	r3, #0
    12fc:	e5832000 	str	r2, [r3]
        base.s.size = 0;
    1300:	e3013578 	movw	r3, #5496	; 0x1578
    1304:	e3403000 	movt	r3, #0
    1308:	e3a02000 	mov	r2, #0
    130c:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1310:	e51b300c 	ldr	r3, [fp, #-12]
    1314:	e5933000 	ldr	r3, [r3]
    1318:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
    131c:	e51b3008 	ldr	r3, [fp, #-8]
    1320:	e5932004 	ldr	r2, [r3, #4]
    1324:	e51b3010 	ldr	r3, [fp, #-16]
    1328:	e1520003 	cmp	r2, r3
    132c:	3a00001f 	bcc	13b0 <malloc+0x124>
            if(p->s.size == nunits)
    1330:	e51b3008 	ldr	r3, [fp, #-8]
    1334:	e5932004 	ldr	r2, [r3, #4]
    1338:	e51b3010 	ldr	r3, [fp, #-16]
    133c:	e1520003 	cmp	r2, r3
    1340:	1a000004 	bne	1358 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    1344:	e51b3008 	ldr	r3, [fp, #-8]
    1348:	e5932000 	ldr	r2, [r3]
    134c:	e51b300c 	ldr	r3, [fp, #-12]
    1350:	e5832000 	str	r2, [r3]
    1354:	ea00000e 	b	1394 <malloc+0x108>
            else {
                p->s.size -= nunits;
    1358:	e51b3008 	ldr	r3, [fp, #-8]
    135c:	e5932004 	ldr	r2, [r3, #4]
    1360:	e51b3010 	ldr	r3, [fp, #-16]
    1364:	e0632002 	rsb	r2, r3, r2
    1368:	e51b3008 	ldr	r3, [fp, #-8]
    136c:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    1370:	e51b3008 	ldr	r3, [fp, #-8]
    1374:	e5933004 	ldr	r3, [r3, #4]
    1378:	e1a03183 	lsl	r3, r3, #3
    137c:	e51b2008 	ldr	r2, [fp, #-8]
    1380:	e0823003 	add	r3, r2, r3
    1384:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    1388:	e51b3008 	ldr	r3, [fp, #-8]
    138c:	e51b2010 	ldr	r2, [fp, #-16]
    1390:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1394:	e3013580 	movw	r3, #5504	; 0x1580
    1398:	e3403000 	movt	r3, #0
    139c:	e51b200c 	ldr	r2, [fp, #-12]
    13a0:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    13a4:	e51b3008 	ldr	r3, [fp, #-8]
    13a8:	e2833008 	add	r3, r3, #8
    13ac:	ea000013 	b	1400 <malloc+0x174>
        }
        if(p == freep)
    13b0:	e3013580 	movw	r3, #5504	; 0x1580
    13b4:	e3403000 	movt	r3, #0
    13b8:	e5933000 	ldr	r3, [r3]
    13bc:	e51b2008 	ldr	r2, [fp, #-8]
    13c0:	e1520003 	cmp	r2, r3
    13c4:	1a000007 	bne	13e8 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    13c8:	e51b0010 	ldr	r0, [fp, #-16]
    13cc:	ebffff8b 	bl	1200 <morecore>
    13d0:	e50b0008 	str	r0, [fp, #-8]
    13d4:	e51b3008 	ldr	r3, [fp, #-8]
    13d8:	e3530000 	cmp	r3, #0
    13dc:	1a000001 	bne	13e8 <malloc+0x15c>
                return 0;
    13e0:	e3a03000 	mov	r3, #0
    13e4:	ea000005 	b	1400 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13e8:	e51b3008 	ldr	r3, [fp, #-8]
    13ec:	e50b300c 	str	r3, [fp, #-12]
    13f0:	e51b3008 	ldr	r3, [fp, #-8]
    13f4:	e5933000 	ldr	r3, [r3]
    13f8:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    13fc:	eaffffc6 	b	131c <malloc+0x90>
}
    1400:	e1a00003 	mov	r0, r3
    1404:	e24bd004 	sub	sp, fp, #4
    1408:	e8bd8800 	pop	{fp, pc}

0000140c <__aeabi_uidiv>:
    140c:	e2512001 	subs	r2, r1, #1
    1410:	012fff1e 	bxeq	lr
    1414:	3a000036 	bcc	14f4 <__aeabi_uidiv+0xe8>
    1418:	e1500001 	cmp	r0, r1
    141c:	9a000022 	bls	14ac <__aeabi_uidiv+0xa0>
    1420:	e1110002 	tst	r1, r2
    1424:	0a000023 	beq	14b8 <__aeabi_uidiv+0xac>
    1428:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    142c:	01a01181 	lsleq	r1, r1, #3
    1430:	03a03008 	moveq	r3, #8
    1434:	13a03001 	movne	r3, #1
    1438:	e3510201 	cmp	r1, #268435456	; 0x10000000
    143c:	31510000 	cmpcc	r1, r0
    1440:	31a01201 	lslcc	r1, r1, #4
    1444:	31a03203 	lslcc	r3, r3, #4
    1448:	3afffffa 	bcc	1438 <__aeabi_uidiv+0x2c>
    144c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1450:	31510000 	cmpcc	r1, r0
    1454:	31a01081 	lslcc	r1, r1, #1
    1458:	31a03083 	lslcc	r3, r3, #1
    145c:	3afffffa 	bcc	144c <__aeabi_uidiv+0x40>
    1460:	e3a02000 	mov	r2, #0
    1464:	e1500001 	cmp	r0, r1
    1468:	20400001 	subcs	r0, r0, r1
    146c:	21822003 	orrcs	r2, r2, r3
    1470:	e15000a1 	cmp	r0, r1, lsr #1
    1474:	204000a1 	subcs	r0, r0, r1, lsr #1
    1478:	218220a3 	orrcs	r2, r2, r3, lsr #1
    147c:	e1500121 	cmp	r0, r1, lsr #2
    1480:	20400121 	subcs	r0, r0, r1, lsr #2
    1484:	21822123 	orrcs	r2, r2, r3, lsr #2
    1488:	e15001a1 	cmp	r0, r1, lsr #3
    148c:	204001a1 	subcs	r0, r0, r1, lsr #3
    1490:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1494:	e3500000 	cmp	r0, #0
    1498:	11b03223 	lsrsne	r3, r3, #4
    149c:	11a01221 	lsrne	r1, r1, #4
    14a0:	1affffef 	bne	1464 <__aeabi_uidiv+0x58>
    14a4:	e1a00002 	mov	r0, r2
    14a8:	e12fff1e 	bx	lr
    14ac:	03a00001 	moveq	r0, #1
    14b0:	13a00000 	movne	r0, #0
    14b4:	e12fff1e 	bx	lr
    14b8:	e3510801 	cmp	r1, #65536	; 0x10000
    14bc:	21a01821 	lsrcs	r1, r1, #16
    14c0:	23a02010 	movcs	r2, #16
    14c4:	33a02000 	movcc	r2, #0
    14c8:	e3510c01 	cmp	r1, #256	; 0x100
    14cc:	21a01421 	lsrcs	r1, r1, #8
    14d0:	22822008 	addcs	r2, r2, #8
    14d4:	e3510010 	cmp	r1, #16
    14d8:	21a01221 	lsrcs	r1, r1, #4
    14dc:	22822004 	addcs	r2, r2, #4
    14e0:	e3510004 	cmp	r1, #4
    14e4:	82822003 	addhi	r2, r2, #3
    14e8:	908220a1 	addls	r2, r2, r1, lsr #1
    14ec:	e1a00230 	lsr	r0, r0, r2
    14f0:	e12fff1e 	bx	lr
    14f4:	e3500000 	cmp	r0, #0
    14f8:	13e00000 	mvnne	r0, #0
    14fc:	ea000007 	b	1520 <__aeabi_idiv0>

00001500 <__aeabi_uidivmod>:
    1500:	e3510000 	cmp	r1, #0
    1504:	0afffffa 	beq	14f4 <__aeabi_uidiv+0xe8>
    1508:	e92d4003 	push	{r0, r1, lr}
    150c:	ebffffbe 	bl	140c <__aeabi_uidiv>
    1510:	e8bd4006 	pop	{r1, r2, lr}
    1514:	e0030092 	mul	r3, r2, r0
    1518:	e0411003 	sub	r1, r1, r3
    151c:	e12fff1e 	bx	lr

00001520 <__aeabi_idiv0>:
    1520:	e12fff1e 	bx	lr
