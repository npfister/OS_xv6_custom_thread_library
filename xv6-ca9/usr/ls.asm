
_ls:     file format elf32-littlearm


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
       0:	e92d4810 	push	{r4, fp, lr}
       4:	e28db008 	add	fp, sp, #8
       8:	e24dd014 	sub	sp, sp, #20
       c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    static char buf[DIRSIZ+1];
    char *p;
    
    // Find first character after last slash.
    for(p=path+strlen(path); p >= path && *p != '/'; p--)
      10:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
      14:	eb000127 	bl	4b8 <strlen>
      18:	e1a03000 	mov	r3, r0
      1c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
      20:	e0823003 	add	r3, r2, r3
      24:	e50b3010 	str	r3, [fp, #-16]
      28:	ea000002 	b	38 <fmtname+0x38>
      2c:	e51b3010 	ldr	r3, [fp, #-16]
      30:	e2433001 	sub	r3, r3, #1
      34:	e50b3010 	str	r3, [fp, #-16]
      38:	e51b2010 	ldr	r2, [fp, #-16]
      3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
      40:	e1520003 	cmp	r2, r3
      44:	3a000003 	bcc	58 <fmtname+0x58>
      48:	e51b3010 	ldr	r3, [fp, #-16]
      4c:	e5d33000 	ldrb	r3, [r3]
      50:	e353002f 	cmp	r3, #47	; 0x2f
      54:	1afffff4 	bne	2c <fmtname+0x2c>
        ;
    p++;
      58:	e51b3010 	ldr	r3, [fp, #-16]
      5c:	e2833001 	add	r3, r3, #1
      60:	e50b3010 	str	r3, [fp, #-16]
    
    // Return blank-padded name.
    if(strlen(p) >= DIRSIZ)
      64:	e51b0010 	ldr	r0, [fp, #-16]
      68:	eb000112 	bl	4b8 <strlen>
      6c:	e1a03000 	mov	r3, r0
      70:	e353000d 	cmp	r3, #13
      74:	9a000001 	bls	80 <fmtname+0x80>
        return p;
      78:	e51b3010 	ldr	r3, [fp, #-16]
      7c:	ea000017 	b	e0 <fmtname+0xe0>
    memmove(buf, p, strlen(p));
      80:	e51b0010 	ldr	r0, [fp, #-16]
      84:	eb00010b 	bl	4b8 <strlen>
      88:	e1a03000 	mov	r3, r0
      8c:	e30104b8 	movw	r0, #5304	; 0x14b8
      90:	e3400000 	movt	r0, #0
      94:	e51b1010 	ldr	r1, [fp, #-16]
      98:	e1a02003 	mov	r2, r3
      9c:	eb0001e6 	bl	83c <memmove>
    memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      a0:	e51b0010 	ldr	r0, [fp, #-16]
      a4:	eb000103 	bl	4b8 <strlen>
      a8:	e1a02000 	mov	r2, r0
      ac:	e30134b8 	movw	r3, #5304	; 0x14b8
      b0:	e3403000 	movt	r3, #0
      b4:	e0824003 	add	r4, r2, r3
      b8:	e51b0010 	ldr	r0, [fp, #-16]
      bc:	eb0000fd 	bl	4b8 <strlen>
      c0:	e1a03000 	mov	r3, r0
      c4:	e263300e 	rsb	r3, r3, #14
      c8:	e1a00004 	mov	r0, r4
      cc:	e3a01020 	mov	r1, #32
      d0:	e1a02003 	mov	r2, r3
      d4:	eb00010c 	bl	50c <memset>
    return buf;
      d8:	e30134b8 	movw	r3, #5304	; 0x14b8
      dc:	e3403000 	movt	r3, #0
}
      e0:	e1a00003 	mov	r0, r3
      e4:	e24bd008 	sub	sp, fp, #8
      e8:	e8bd8810 	pop	{r4, fp, pc}

000000ec <ls>:

void
ls(char *path)
{
      ec:	e92d4800 	push	{fp, lr}
      f0:	e28db004 	add	fp, sp, #4
      f4:	e24ddd09 	sub	sp, sp, #576	; 0x240
      f8:	e50b0238 	str	r0, [fp, #-568]	; 0xfffffdc8
    char buf[512], *p;
    int fd;
    struct dirent de;
    struct stat st;
    
    if((fd = open(path, 0)) < 0){
      fc:	e51b0238 	ldr	r0, [fp, #-568]	; 0xfffffdc8
     100:	e3a01000 	mov	r1, #0
     104:	eb000241 	bl	a10 <open>
     108:	e50b0008 	str	r0, [fp, #-8]
     10c:	e51b3008 	ldr	r3, [fp, #-8]
     110:	e3530000 	cmp	r3, #0
     114:	aa000005 	bge	130 <ls+0x44>
        printf(2, "ls: cannot open %s\n", path);
     118:	e3a00002 	mov	r0, #2
     11c:	e301144c 	movw	r1, #5196	; 0x144c
     120:	e3401000 	movt	r1, #0
     124:	e51b2238 	ldr	r2, [fp, #-568]	; 0xfffffdc8
     128:	eb000311 	bl	d74 <printf>
        return;
     12c:	ea000082 	b	33c <ls+0x250>
    }
    
    if(fstat(fd, &st) < 0){
     130:	e51b0008 	ldr	r0, [fp, #-8]
     134:	e24b3e23 	sub	r3, fp, #560	; 0x230
     138:	e1a01003 	mov	r1, r3
     13c:	eb00024e 	bl	a7c <fstat>
     140:	e1a03000 	mov	r3, r0
     144:	e3530000 	cmp	r3, #0
     148:	aa000007 	bge	16c <ls+0x80>
        printf(2, "ls: cannot stat %s\n", path);
     14c:	e3a00002 	mov	r0, #2
     150:	e3011460 	movw	r1, #5216	; 0x1460
     154:	e3401000 	movt	r1, #0
     158:	e51b2238 	ldr	r2, [fp, #-568]	; 0xfffffdc8
     15c:	eb000304 	bl	d74 <printf>
        close(fd);
     160:	e51b0008 	ldr	r0, [fp, #-8]
     164:	eb00020e 	bl	9a4 <close>
        return;
     168:	ea000073 	b	33c <ls+0x250>
    }
    
    switch(st.type){
     16c:	e30f3dd4 	movw	r3, #64980	; 0xfdd4
     170:	e34f3fff 	movt	r3, #65535	; 0xffff
     174:	e24b1004 	sub	r1, fp, #4
     178:	e19130b3 	ldrh	r3, [r1, r3]
     17c:	e6bf3073 	sxth	r3, r3
     180:	e3530001 	cmp	r3, #1
     184:	0a000012 	beq	1d4 <ls+0xe8>
     188:	e3530002 	cmp	r3, #2
     18c:	1a000068 	bne	334 <ls+0x248>
        case T_FILE:
            printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     190:	e51b0238 	ldr	r0, [fp, #-568]	; 0xfffffdc8
     194:	ebffff99 	bl	0 <fmtname>
     198:	e1a02000 	mov	r2, r0
     19c:	e30f3dd4 	movw	r3, #64980	; 0xfdd4
     1a0:	e34f3fff 	movt	r3, #65535	; 0xffff
     1a4:	e24b1004 	sub	r1, fp, #4
     1a8:	e19130b3 	ldrh	r3, [r1, r3]
     1ac:	e6bf3073 	sxth	r3, r3
     1b0:	e51b0228 	ldr	r0, [fp, #-552]	; 0xfffffdd8
     1b4:	e51b1220 	ldr	r1, [fp, #-544]	; 0xfffffde0
     1b8:	e58d0000 	str	r0, [sp]
     1bc:	e58d1004 	str	r1, [sp, #4]
     1c0:	e3a00001 	mov	r0, #1
     1c4:	e3011474 	movw	r1, #5236	; 0x1474
     1c8:	e3401000 	movt	r1, #0
     1cc:	eb0002e8 	bl	d74 <printf>
            break;
     1d0:	ea000057 	b	334 <ls+0x248>
            
        case T_DIR:
            if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     1d4:	e51b0238 	ldr	r0, [fp, #-568]	; 0xfffffdc8
     1d8:	eb0000b6 	bl	4b8 <strlen>
     1dc:	e1a03000 	mov	r3, r0
     1e0:	e2833010 	add	r3, r3, #16
     1e4:	e3530c02 	cmp	r3, #512	; 0x200
     1e8:	9a000004 	bls	200 <ls+0x114>
                printf(1, "ls: path too long\n");
     1ec:	e3a00001 	mov	r0, #1
     1f0:	e3011484 	movw	r1, #5252	; 0x1484
     1f4:	e3401000 	movt	r1, #0
     1f8:	eb0002dd 	bl	d74 <printf>
                break;
     1fc:	ea00004c 	b	334 <ls+0x248>
            }
            strcpy(buf, path);
     200:	e24b3f83 	sub	r3, fp, #524	; 0x20c
     204:	e1a00003 	mov	r0, r3
     208:	e51b1238 	ldr	r1, [fp, #-568]	; 0xfffffdc8
     20c:	eb00006a 	bl	3bc <strcpy>
            p = buf+strlen(buf);
     210:	e24b3f83 	sub	r3, fp, #524	; 0x20c
     214:	e1a00003 	mov	r0, r3
     218:	eb0000a6 	bl	4b8 <strlen>
     21c:	e1a03000 	mov	r3, r0
     220:	e24b2f83 	sub	r2, fp, #524	; 0x20c
     224:	e0823003 	add	r3, r2, r3
     228:	e50b300c 	str	r3, [fp, #-12]
            *p++ = '/';
     22c:	e51b300c 	ldr	r3, [fp, #-12]
     230:	e3a0202f 	mov	r2, #47	; 0x2f
     234:	e5c32000 	strb	r2, [r3]
     238:	e51b300c 	ldr	r3, [fp, #-12]
     23c:	e2833001 	add	r3, r3, #1
     240:	e50b300c 	str	r3, [fp, #-12]
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
     244:	ea000031 	b	310 <ls+0x224>
                if(de.inum == 0)
     248:	e30f3de8 	movw	r3, #65000	; 0xfde8
     24c:	e34f3fff 	movt	r3, #65535	; 0xffff
     250:	e24b2004 	sub	r2, fp, #4
     254:	e19230b3 	ldrh	r3, [r2, r3]
     258:	e3530000 	cmp	r3, #0
     25c:	0a00002a 	beq	30c <ls+0x220>
                    continue;
                memmove(p, de.name, DIRSIZ);
     260:	e24b3f87 	sub	r3, fp, #540	; 0x21c
     264:	e2833002 	add	r3, r3, #2
     268:	e51b000c 	ldr	r0, [fp, #-12]
     26c:	e1a01003 	mov	r1, r3
     270:	e3a0200e 	mov	r2, #14
     274:	eb000170 	bl	83c <memmove>
                p[DIRSIZ] = 0;
     278:	e51b300c 	ldr	r3, [fp, #-12]
     27c:	e283300e 	add	r3, r3, #14
     280:	e3a02000 	mov	r2, #0
     284:	e5c32000 	strb	r2, [r3]
                if(stat(buf, &st) < 0){
     288:	e24b3f83 	sub	r3, fp, #524	; 0x20c
     28c:	e1a00003 	mov	r0, r3
     290:	e24b3e23 	sub	r3, fp, #560	; 0x230
     294:	e1a01003 	mov	r1, r3
     298:	eb00012d 	bl	754 <stat>
     29c:	e1a03000 	mov	r3, r0
     2a0:	e3530000 	cmp	r3, #0
     2a4:	aa000006 	bge	2c4 <ls+0x1d8>
                    printf(1, "ls: cannot stat %s\n", buf);
     2a8:	e3a00001 	mov	r0, #1
     2ac:	e3011460 	movw	r1, #5216	; 0x1460
     2b0:	e3401000 	movt	r1, #0
     2b4:	e24b3f83 	sub	r3, fp, #524	; 0x20c
     2b8:	e1a02003 	mov	r2, r3
     2bc:	eb0002ac 	bl	d74 <printf>
                    continue;
     2c0:	ea000012 	b	310 <ls+0x224>
                }
                printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     2c4:	e24b3f83 	sub	r3, fp, #524	; 0x20c
     2c8:	e1a00003 	mov	r0, r3
     2cc:	ebffff4b 	bl	0 <fmtname>
     2d0:	e1a02000 	mov	r2, r0
     2d4:	e30f3dd4 	movw	r3, #64980	; 0xfdd4
     2d8:	e34f3fff 	movt	r3, #65535	; 0xffff
     2dc:	e24b1004 	sub	r1, fp, #4
     2e0:	e19130b3 	ldrh	r3, [r1, r3]
     2e4:	e6bf3073 	sxth	r3, r3
     2e8:	e51b0228 	ldr	r0, [fp, #-552]	; 0xfffffdd8
     2ec:	e51b1220 	ldr	r1, [fp, #-544]	; 0xfffffde0
     2f0:	e58d0000 	str	r0, [sp]
     2f4:	e58d1004 	str	r1, [sp, #4]
     2f8:	e3a00001 	mov	r0, #1
     2fc:	e3011474 	movw	r1, #5236	; 0x1474
     300:	e3401000 	movt	r1, #0
     304:	eb00029a 	bl	d74 <printf>
     308:	ea000000 	b	310 <ls+0x224>
            strcpy(buf, path);
            p = buf+strlen(buf);
            *p++ = '/';
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
                if(de.inum == 0)
                    continue;
     30c:	e1a00000 	nop			; (mov r0, r0)
                break;
            }
            strcpy(buf, path);
            p = buf+strlen(buf);
            *p++ = '/';
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
     310:	e51b0008 	ldr	r0, [fp, #-8]
     314:	e24b3f87 	sub	r3, fp, #540	; 0x21c
     318:	e1a01003 	mov	r1, r3
     31c:	e3a02010 	mov	r2, #16
     320:	eb00018d 	bl	95c <read>
     324:	e1a03000 	mov	r3, r0
     328:	e3530010 	cmp	r3, #16
     32c:	0affffc5 	beq	248 <ls+0x15c>
                    printf(1, "ls: cannot stat %s\n", buf);
                    continue;
                }
                printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
            }
            break;
     330:	e1a00000 	nop			; (mov r0, r0)
    }
    close(fd);
     334:	e51b0008 	ldr	r0, [fp, #-8]
     338:	eb000199 	bl	9a4 <close>
}
     33c:	e24bd004 	sub	sp, fp, #4
     340:	e8bd8800 	pop	{fp, pc}

00000344 <main>:

int
main(int argc, char *argv[])
{
     344:	e92d4800 	push	{fp, lr}
     348:	e28db004 	add	fp, sp, #4
     34c:	e24dd010 	sub	sp, sp, #16
     350:	e50b0010 	str	r0, [fp, #-16]
     354:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int i;
    
    if(argc < 2){
     358:	e51b3010 	ldr	r3, [fp, #-16]
     35c:	e3530001 	cmp	r3, #1
     360:	ca000003 	bgt	374 <main+0x30>
        ls(".");
     364:	e3010498 	movw	r0, #5272	; 0x1498
     368:	e3400000 	movt	r0, #0
     36c:	ebffff5e 	bl	ec <ls>
        exit();
     370:	eb00015e 	bl	8f0 <exit>
    }
    for(i=1; i<argc; i++)
     374:	e3a03001 	mov	r3, #1
     378:	e50b3008 	str	r3, [fp, #-8]
     37c:	ea000009 	b	3a8 <main+0x64>
        ls(argv[i]);
     380:	e51b3008 	ldr	r3, [fp, #-8]
     384:	e1a03103 	lsl	r3, r3, #2
     388:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     38c:	e0823003 	add	r3, r2, r3
     390:	e5933000 	ldr	r3, [r3]
     394:	e1a00003 	mov	r0, r3
     398:	ebffff53 	bl	ec <ls>
    
    if(argc < 2){
        ls(".");
        exit();
    }
    for(i=1; i<argc; i++)
     39c:	e51b3008 	ldr	r3, [fp, #-8]
     3a0:	e2833001 	add	r3, r3, #1
     3a4:	e50b3008 	str	r3, [fp, #-8]
     3a8:	e51b2008 	ldr	r2, [fp, #-8]
     3ac:	e51b3010 	ldr	r3, [fp, #-16]
     3b0:	e1520003 	cmp	r2, r3
     3b4:	bafffff1 	blt	380 <main+0x3c>
        ls(argv[i]);
    exit();
     3b8:	eb00014c 	bl	8f0 <exit>

000003bc <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
     3bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     3c0:	e28db000 	add	fp, sp, #0
     3c4:	e24dd014 	sub	sp, sp, #20
     3c8:	e50b0010 	str	r0, [fp, #-16]
     3cc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
     3d0:	e51b3010 	ldr	r3, [fp, #-16]
     3d4:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
     3d8:	e1a00000 	nop			; (mov r0, r0)
     3dc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     3e0:	e5d32000 	ldrb	r2, [r3]
     3e4:	e51b3010 	ldr	r3, [fp, #-16]
     3e8:	e5c32000 	strb	r2, [r3]
     3ec:	e51b3010 	ldr	r3, [fp, #-16]
     3f0:	e5d33000 	ldrb	r3, [r3]
     3f4:	e3530000 	cmp	r3, #0
     3f8:	03a03000 	moveq	r3, #0
     3fc:	13a03001 	movne	r3, #1
     400:	e6ef3073 	uxtb	r3, r3
     404:	e51b2010 	ldr	r2, [fp, #-16]
     408:	e2822001 	add	r2, r2, #1
     40c:	e50b2010 	str	r2, [fp, #-16]
     410:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     414:	e2822001 	add	r2, r2, #1
     418:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
     41c:	e3530000 	cmp	r3, #0
     420:	1affffed 	bne	3dc <strcpy+0x20>
        ;
    return os;
     424:	e51b3008 	ldr	r3, [fp, #-8]
}
     428:	e1a00003 	mov	r0, r3
     42c:	e28bd000 	add	sp, fp, #0
     430:	e8bd0800 	pop	{fp}
     434:	e12fff1e 	bx	lr

00000438 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     438:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     43c:	e28db000 	add	fp, sp, #0
     440:	e24dd00c 	sub	sp, sp, #12
     444:	e50b0008 	str	r0, [fp, #-8]
     448:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
     44c:	ea000005 	b	468 <strcmp+0x30>
        p++, q++;
     450:	e51b3008 	ldr	r3, [fp, #-8]
     454:	e2833001 	add	r3, r3, #1
     458:	e50b3008 	str	r3, [fp, #-8]
     45c:	e51b300c 	ldr	r3, [fp, #-12]
     460:	e2833001 	add	r3, r3, #1
     464:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
     468:	e51b3008 	ldr	r3, [fp, #-8]
     46c:	e5d33000 	ldrb	r3, [r3]
     470:	e3530000 	cmp	r3, #0
     474:	0a000005 	beq	490 <strcmp+0x58>
     478:	e51b3008 	ldr	r3, [fp, #-8]
     47c:	e5d32000 	ldrb	r2, [r3]
     480:	e51b300c 	ldr	r3, [fp, #-12]
     484:	e5d33000 	ldrb	r3, [r3]
     488:	e1520003 	cmp	r2, r3
     48c:	0affffef 	beq	450 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
     490:	e51b3008 	ldr	r3, [fp, #-8]
     494:	e5d33000 	ldrb	r3, [r3]
     498:	e1a02003 	mov	r2, r3
     49c:	e51b300c 	ldr	r3, [fp, #-12]
     4a0:	e5d33000 	ldrb	r3, [r3]
     4a4:	e0633002 	rsb	r3, r3, r2
}
     4a8:	e1a00003 	mov	r0, r3
     4ac:	e28bd000 	add	sp, fp, #0
     4b0:	e8bd0800 	pop	{fp}
     4b4:	e12fff1e 	bx	lr

000004b8 <strlen>:

uint
strlen(char *s)
{
     4b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4bc:	e28db000 	add	fp, sp, #0
     4c0:	e24dd014 	sub	sp, sp, #20
     4c4:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
     4c8:	e3a03000 	mov	r3, #0
     4cc:	e50b3008 	str	r3, [fp, #-8]
     4d0:	ea000002 	b	4e0 <strlen+0x28>
     4d4:	e51b3008 	ldr	r3, [fp, #-8]
     4d8:	e2833001 	add	r3, r3, #1
     4dc:	e50b3008 	str	r3, [fp, #-8]
     4e0:	e51b3008 	ldr	r3, [fp, #-8]
     4e4:	e51b2010 	ldr	r2, [fp, #-16]
     4e8:	e0823003 	add	r3, r2, r3
     4ec:	e5d33000 	ldrb	r3, [r3]
     4f0:	e3530000 	cmp	r3, #0
     4f4:	1afffff6 	bne	4d4 <strlen+0x1c>
        ;
    return n;
     4f8:	e51b3008 	ldr	r3, [fp, #-8]
}
     4fc:	e1a00003 	mov	r0, r3
     500:	e28bd000 	add	sp, fp, #0
     504:	e8bd0800 	pop	{fp}
     508:	e12fff1e 	bx	lr

0000050c <memset>:

void*
memset(void *dst, int v, uint n)
{
     50c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     510:	e28db000 	add	fp, sp, #0
     514:	e24dd024 	sub	sp, sp, #36	; 0x24
     518:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     51c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     520:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
     524:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     528:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
     52c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     530:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
     534:	e55b300d 	ldrb	r3, [fp, #-13]
     538:	e1a02c03 	lsl	r2, r3, #24
     53c:	e55b300d 	ldrb	r3, [fp, #-13]
     540:	e1a03803 	lsl	r3, r3, #16
     544:	e1822003 	orr	r2, r2, r3
     548:	e55b300d 	ldrb	r3, [fp, #-13]
     54c:	e1a03403 	lsl	r3, r3, #8
     550:	e1822003 	orr	r2, r2, r3
     554:	e55b300d 	ldrb	r3, [fp, #-13]
     558:	e1823003 	orr	r3, r2, r3
     55c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     560:	ea000008 	b	588 <memset+0x7c>
		*p = c;
     564:	e51b3008 	ldr	r3, [fp, #-8]
     568:	e55b200d 	ldrb	r2, [fp, #-13]
     56c:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
     570:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     574:	e2433001 	sub	r3, r3, #1
     578:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     57c:	e51b3008 	ldr	r3, [fp, #-8]
     580:	e2833001 	add	r3, r3, #1
     584:	e50b3008 	str	r3, [fp, #-8]
     588:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     58c:	e3530000 	cmp	r3, #0
     590:	0a000003 	beq	5a4 <memset+0x98>
     594:	e51b3008 	ldr	r3, [fp, #-8]
     598:	e2033003 	and	r3, r3, #3
     59c:	e3530000 	cmp	r3, #0
     5a0:	1affffef 	bne	564 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
     5a4:	e51b3008 	ldr	r3, [fp, #-8]
     5a8:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
     5ac:	ea000008 	b	5d4 <memset+0xc8>
		*p4 = val;
     5b0:	e51b300c 	ldr	r3, [fp, #-12]
     5b4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     5b8:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
     5bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     5c0:	e2433004 	sub	r3, r3, #4
     5c4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     5c8:	e51b300c 	ldr	r3, [fp, #-12]
     5cc:	e2833004 	add	r3, r3, #4
     5d0:	e50b300c 	str	r3, [fp, #-12]
     5d4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     5d8:	e3530003 	cmp	r3, #3
     5dc:	8afffff3 	bhi	5b0 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
     5e0:	e51b300c 	ldr	r3, [fp, #-12]
     5e4:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
     5e8:	ea000008 	b	610 <memset+0x104>
		*p = c;
     5ec:	e51b3008 	ldr	r3, [fp, #-8]
     5f0:	e55b200d 	ldrb	r2, [fp, #-13]
     5f4:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
     5f8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     5fc:	e2433001 	sub	r3, r3, #1
     600:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     604:	e51b3008 	ldr	r3, [fp, #-8]
     608:	e2833001 	add	r3, r3, #1
     60c:	e50b3008 	str	r3, [fp, #-8]
     610:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     614:	e3530000 	cmp	r3, #0
     618:	1afffff3 	bne	5ec <memset+0xe0>
		*p = c;
	}

	return dst;
     61c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     620:	e1a00003 	mov	r0, r3
     624:	e28bd000 	add	sp, fp, #0
     628:	e8bd0800 	pop	{fp}
     62c:	e12fff1e 	bx	lr

00000630 <strchr>:

char*
strchr(const char *s, char c)
{
     630:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     634:	e28db000 	add	fp, sp, #0
     638:	e24dd00c 	sub	sp, sp, #12
     63c:	e50b0008 	str	r0, [fp, #-8]
     640:	e1a03001 	mov	r3, r1
     644:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
     648:	ea000009 	b	674 <strchr+0x44>
        if(*s == c)
     64c:	e51b3008 	ldr	r3, [fp, #-8]
     650:	e5d33000 	ldrb	r3, [r3]
     654:	e55b2009 	ldrb	r2, [fp, #-9]
     658:	e1520003 	cmp	r2, r3
     65c:	1a000001 	bne	668 <strchr+0x38>
            return (char*)s;
     660:	e51b3008 	ldr	r3, [fp, #-8]
     664:	ea000007 	b	688 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
     668:	e51b3008 	ldr	r3, [fp, #-8]
     66c:	e2833001 	add	r3, r3, #1
     670:	e50b3008 	str	r3, [fp, #-8]
     674:	e51b3008 	ldr	r3, [fp, #-8]
     678:	e5d33000 	ldrb	r3, [r3]
     67c:	e3530000 	cmp	r3, #0
     680:	1afffff1 	bne	64c <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
     684:	e3a03000 	mov	r3, #0
}
     688:	e1a00003 	mov	r0, r3
     68c:	e28bd000 	add	sp, fp, #0
     690:	e8bd0800 	pop	{fp}
     694:	e12fff1e 	bx	lr

00000698 <gets>:

char*
gets(char *buf, int max)
{
     698:	e92d4800 	push	{fp, lr}
     69c:	e28db004 	add	fp, sp, #4
     6a0:	e24dd018 	sub	sp, sp, #24
     6a4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     6a8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     6ac:	e3a03000 	mov	r3, #0
     6b0:	e50b3008 	str	r3, [fp, #-8]
     6b4:	ea000016 	b	714 <gets+0x7c>
        cc = read(0, &c, 1);
     6b8:	e3a00000 	mov	r0, #0
     6bc:	e24b300d 	sub	r3, fp, #13
     6c0:	e1a01003 	mov	r1, r3
     6c4:	e3a02001 	mov	r2, #1
     6c8:	eb0000a3 	bl	95c <read>
     6cc:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
     6d0:	e51b300c 	ldr	r3, [fp, #-12]
     6d4:	e3530000 	cmp	r3, #0
     6d8:	da000013 	ble	72c <gets+0x94>
            break;
        buf[i++] = c;
     6dc:	e51b3008 	ldr	r3, [fp, #-8]
     6e0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     6e4:	e0823003 	add	r3, r2, r3
     6e8:	e55b200d 	ldrb	r2, [fp, #-13]
     6ec:	e5c32000 	strb	r2, [r3]
     6f0:	e51b3008 	ldr	r3, [fp, #-8]
     6f4:	e2833001 	add	r3, r3, #1
     6f8:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
     6fc:	e55b300d 	ldrb	r3, [fp, #-13]
     700:	e353000a 	cmp	r3, #10
     704:	0a000009 	beq	730 <gets+0x98>
     708:	e55b300d 	ldrb	r3, [fp, #-13]
     70c:	e353000d 	cmp	r3, #13
     710:	0a000006 	beq	730 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
     714:	e51b3008 	ldr	r3, [fp, #-8]
     718:	e2832001 	add	r2, r3, #1
     71c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     720:	e1520003 	cmp	r2, r3
     724:	baffffe3 	blt	6b8 <gets+0x20>
     728:	ea000000 	b	730 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
     72c:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
     730:	e51b3008 	ldr	r3, [fp, #-8]
     734:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     738:	e0823003 	add	r3, r2, r3
     73c:	e3a02000 	mov	r2, #0
     740:	e5c32000 	strb	r2, [r3]
    return buf;
     744:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     748:	e1a00003 	mov	r0, r3
     74c:	e24bd004 	sub	sp, fp, #4
     750:	e8bd8800 	pop	{fp, pc}

00000754 <stat>:

int
stat(char *n, struct stat *st)
{
     754:	e92d4800 	push	{fp, lr}
     758:	e28db004 	add	fp, sp, #4
     75c:	e24dd010 	sub	sp, sp, #16
     760:	e50b0010 	str	r0, [fp, #-16]
     764:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
     768:	e51b0010 	ldr	r0, [fp, #-16]
     76c:	e3a01000 	mov	r1, #0
     770:	eb0000a6 	bl	a10 <open>
     774:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
     778:	e51b3008 	ldr	r3, [fp, #-8]
     77c:	e3530000 	cmp	r3, #0
     780:	aa000001 	bge	78c <stat+0x38>
        return -1;
     784:	e3e03000 	mvn	r3, #0
     788:	ea000006 	b	7a8 <stat+0x54>
    r = fstat(fd, st);
     78c:	e51b0008 	ldr	r0, [fp, #-8]
     790:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     794:	eb0000b8 	bl	a7c <fstat>
     798:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     79c:	e51b0008 	ldr	r0, [fp, #-8]
     7a0:	eb00007f 	bl	9a4 <close>
    return r;
     7a4:	e51b300c 	ldr	r3, [fp, #-12]
}
     7a8:	e1a00003 	mov	r0, r3
     7ac:	e24bd004 	sub	sp, fp, #4
     7b0:	e8bd8800 	pop	{fp, pc}

000007b4 <atoi>:

int
atoi(const char *s)
{
     7b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     7b8:	e28db000 	add	fp, sp, #0
     7bc:	e24dd014 	sub	sp, sp, #20
     7c0:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
     7c4:	e3a03000 	mov	r3, #0
     7c8:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
     7cc:	ea00000d 	b	808 <atoi+0x54>
        n = n*10 + *s++ - '0';
     7d0:	e51b2008 	ldr	r2, [fp, #-8]
     7d4:	e1a03002 	mov	r3, r2
     7d8:	e1a03103 	lsl	r3, r3, #2
     7dc:	e0833002 	add	r3, r3, r2
     7e0:	e1a03083 	lsl	r3, r3, #1
     7e4:	e1a02003 	mov	r2, r3
     7e8:	e51b3010 	ldr	r3, [fp, #-16]
     7ec:	e5d33000 	ldrb	r3, [r3]
     7f0:	e0823003 	add	r3, r2, r3
     7f4:	e2433030 	sub	r3, r3, #48	; 0x30
     7f8:	e50b3008 	str	r3, [fp, #-8]
     7fc:	e51b3010 	ldr	r3, [fp, #-16]
     800:	e2833001 	add	r3, r3, #1
     804:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
     808:	e51b3010 	ldr	r3, [fp, #-16]
     80c:	e5d33000 	ldrb	r3, [r3]
     810:	e353002f 	cmp	r3, #47	; 0x2f
     814:	9a000003 	bls	828 <atoi+0x74>
     818:	e51b3010 	ldr	r3, [fp, #-16]
     81c:	e5d33000 	ldrb	r3, [r3]
     820:	e3530039 	cmp	r3, #57	; 0x39
     824:	9affffe9 	bls	7d0 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
     828:	e51b3008 	ldr	r3, [fp, #-8]
}
     82c:	e1a00003 	mov	r0, r3
     830:	e28bd000 	add	sp, fp, #0
     834:	e8bd0800 	pop	{fp}
     838:	e12fff1e 	bx	lr

0000083c <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     83c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     840:	e28db000 	add	fp, sp, #0
     844:	e24dd01c 	sub	sp, sp, #28
     848:	e50b0010 	str	r0, [fp, #-16]
     84c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     850:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
     854:	e51b3010 	ldr	r3, [fp, #-16]
     858:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
     85c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     860:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
     864:	ea000009 	b	890 <memmove+0x54>
        *dst++ = *src++;
     868:	e51b300c 	ldr	r3, [fp, #-12]
     86c:	e5d32000 	ldrb	r2, [r3]
     870:	e51b3008 	ldr	r3, [fp, #-8]
     874:	e5c32000 	strb	r2, [r3]
     878:	e51b3008 	ldr	r3, [fp, #-8]
     87c:	e2833001 	add	r3, r3, #1
     880:	e50b3008 	str	r3, [fp, #-8]
     884:	e51b300c 	ldr	r3, [fp, #-12]
     888:	e2833001 	add	r3, r3, #1
     88c:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
     890:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     894:	e3530000 	cmp	r3, #0
     898:	d3a03000 	movle	r3, #0
     89c:	c3a03001 	movgt	r3, #1
     8a0:	e6ef3073 	uxtb	r3, r3
     8a4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     8a8:	e2422001 	sub	r2, r2, #1
     8ac:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     8b0:	e3530000 	cmp	r3, #0
     8b4:	1affffeb 	bne	868 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
     8b8:	e51b3010 	ldr	r3, [fp, #-16]
}
     8bc:	e1a00003 	mov	r0, r3
     8c0:	e28bd000 	add	sp, fp, #0
     8c4:	e8bd0800 	pop	{fp}
     8c8:	e12fff1e 	bx	lr

000008cc <fork>:
     8cc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8d0:	e1a04003 	mov	r4, r3
     8d4:	e1a03002 	mov	r3, r2
     8d8:	e1a02001 	mov	r2, r1
     8dc:	e1a01000 	mov	r1, r0
     8e0:	e3a00001 	mov	r0, #1
     8e4:	ef000000 	svc	0x00000000
     8e8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     8ec:	e12fff1e 	bx	lr

000008f0 <exit>:
     8f0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     8f4:	e1a04003 	mov	r4, r3
     8f8:	e1a03002 	mov	r3, r2
     8fc:	e1a02001 	mov	r2, r1
     900:	e1a01000 	mov	r1, r0
     904:	e3a00002 	mov	r0, #2
     908:	ef000000 	svc	0x00000000
     90c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     910:	e12fff1e 	bx	lr

00000914 <wait>:
     914:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     918:	e1a04003 	mov	r4, r3
     91c:	e1a03002 	mov	r3, r2
     920:	e1a02001 	mov	r2, r1
     924:	e1a01000 	mov	r1, r0
     928:	e3a00003 	mov	r0, #3
     92c:	ef000000 	svc	0x00000000
     930:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     934:	e12fff1e 	bx	lr

00000938 <pipe>:
     938:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     93c:	e1a04003 	mov	r4, r3
     940:	e1a03002 	mov	r3, r2
     944:	e1a02001 	mov	r2, r1
     948:	e1a01000 	mov	r1, r0
     94c:	e3a00004 	mov	r0, #4
     950:	ef000000 	svc	0x00000000
     954:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     958:	e12fff1e 	bx	lr

0000095c <read>:
     95c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     960:	e1a04003 	mov	r4, r3
     964:	e1a03002 	mov	r3, r2
     968:	e1a02001 	mov	r2, r1
     96c:	e1a01000 	mov	r1, r0
     970:	e3a00005 	mov	r0, #5
     974:	ef000000 	svc	0x00000000
     978:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     97c:	e12fff1e 	bx	lr

00000980 <write>:
     980:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     984:	e1a04003 	mov	r4, r3
     988:	e1a03002 	mov	r3, r2
     98c:	e1a02001 	mov	r2, r1
     990:	e1a01000 	mov	r1, r0
     994:	e3a00010 	mov	r0, #16
     998:	ef000000 	svc	0x00000000
     99c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     9a0:	e12fff1e 	bx	lr

000009a4 <close>:
     9a4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9a8:	e1a04003 	mov	r4, r3
     9ac:	e1a03002 	mov	r3, r2
     9b0:	e1a02001 	mov	r2, r1
     9b4:	e1a01000 	mov	r1, r0
     9b8:	e3a00015 	mov	r0, #21
     9bc:	ef000000 	svc	0x00000000
     9c0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     9c4:	e12fff1e 	bx	lr

000009c8 <kill>:
     9c8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9cc:	e1a04003 	mov	r4, r3
     9d0:	e1a03002 	mov	r3, r2
     9d4:	e1a02001 	mov	r2, r1
     9d8:	e1a01000 	mov	r1, r0
     9dc:	e3a00006 	mov	r0, #6
     9e0:	ef000000 	svc	0x00000000
     9e4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     9e8:	e12fff1e 	bx	lr

000009ec <exec>:
     9ec:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     9f0:	e1a04003 	mov	r4, r3
     9f4:	e1a03002 	mov	r3, r2
     9f8:	e1a02001 	mov	r2, r1
     9fc:	e1a01000 	mov	r1, r0
     a00:	e3a00007 	mov	r0, #7
     a04:	ef000000 	svc	0x00000000
     a08:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a0c:	e12fff1e 	bx	lr

00000a10 <open>:
     a10:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a14:	e1a04003 	mov	r4, r3
     a18:	e1a03002 	mov	r3, r2
     a1c:	e1a02001 	mov	r2, r1
     a20:	e1a01000 	mov	r1, r0
     a24:	e3a0000f 	mov	r0, #15
     a28:	ef000000 	svc	0x00000000
     a2c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a30:	e12fff1e 	bx	lr

00000a34 <mknod>:
     a34:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a38:	e1a04003 	mov	r4, r3
     a3c:	e1a03002 	mov	r3, r2
     a40:	e1a02001 	mov	r2, r1
     a44:	e1a01000 	mov	r1, r0
     a48:	e3a00011 	mov	r0, #17
     a4c:	ef000000 	svc	0x00000000
     a50:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a54:	e12fff1e 	bx	lr

00000a58 <unlink>:
     a58:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a5c:	e1a04003 	mov	r4, r3
     a60:	e1a03002 	mov	r3, r2
     a64:	e1a02001 	mov	r2, r1
     a68:	e1a01000 	mov	r1, r0
     a6c:	e3a00012 	mov	r0, #18
     a70:	ef000000 	svc	0x00000000
     a74:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a78:	e12fff1e 	bx	lr

00000a7c <fstat>:
     a7c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     a80:	e1a04003 	mov	r4, r3
     a84:	e1a03002 	mov	r3, r2
     a88:	e1a02001 	mov	r2, r1
     a8c:	e1a01000 	mov	r1, r0
     a90:	e3a00008 	mov	r0, #8
     a94:	ef000000 	svc	0x00000000
     a98:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     a9c:	e12fff1e 	bx	lr

00000aa0 <link>:
     aa0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     aa4:	e1a04003 	mov	r4, r3
     aa8:	e1a03002 	mov	r3, r2
     aac:	e1a02001 	mov	r2, r1
     ab0:	e1a01000 	mov	r1, r0
     ab4:	e3a00013 	mov	r0, #19
     ab8:	ef000000 	svc	0x00000000
     abc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     ac0:	e12fff1e 	bx	lr

00000ac4 <mkdir>:
     ac4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     ac8:	e1a04003 	mov	r4, r3
     acc:	e1a03002 	mov	r3, r2
     ad0:	e1a02001 	mov	r2, r1
     ad4:	e1a01000 	mov	r1, r0
     ad8:	e3a00014 	mov	r0, #20
     adc:	ef000000 	svc	0x00000000
     ae0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     ae4:	e12fff1e 	bx	lr

00000ae8 <chdir>:
     ae8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     aec:	e1a04003 	mov	r4, r3
     af0:	e1a03002 	mov	r3, r2
     af4:	e1a02001 	mov	r2, r1
     af8:	e1a01000 	mov	r1, r0
     afc:	e3a00009 	mov	r0, #9
     b00:	ef000000 	svc	0x00000000
     b04:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b08:	e12fff1e 	bx	lr

00000b0c <dup>:
     b0c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b10:	e1a04003 	mov	r4, r3
     b14:	e1a03002 	mov	r3, r2
     b18:	e1a02001 	mov	r2, r1
     b1c:	e1a01000 	mov	r1, r0
     b20:	e3a0000a 	mov	r0, #10
     b24:	ef000000 	svc	0x00000000
     b28:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b2c:	e12fff1e 	bx	lr

00000b30 <getpid>:
     b30:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b34:	e1a04003 	mov	r4, r3
     b38:	e1a03002 	mov	r3, r2
     b3c:	e1a02001 	mov	r2, r1
     b40:	e1a01000 	mov	r1, r0
     b44:	e3a0000b 	mov	r0, #11
     b48:	ef000000 	svc	0x00000000
     b4c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b50:	e12fff1e 	bx	lr

00000b54 <sbrk>:
     b54:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b58:	e1a04003 	mov	r4, r3
     b5c:	e1a03002 	mov	r3, r2
     b60:	e1a02001 	mov	r2, r1
     b64:	e1a01000 	mov	r1, r0
     b68:	e3a0000c 	mov	r0, #12
     b6c:	ef000000 	svc	0x00000000
     b70:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b74:	e12fff1e 	bx	lr

00000b78 <sleep>:
     b78:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     b7c:	e1a04003 	mov	r4, r3
     b80:	e1a03002 	mov	r3, r2
     b84:	e1a02001 	mov	r2, r1
     b88:	e1a01000 	mov	r1, r0
     b8c:	e3a0000d 	mov	r0, #13
     b90:	ef000000 	svc	0x00000000
     b94:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     b98:	e12fff1e 	bx	lr

00000b9c <uptime>:
     b9c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     ba0:	e1a04003 	mov	r4, r3
     ba4:	e1a03002 	mov	r3, r2
     ba8:	e1a02001 	mov	r2, r1
     bac:	e1a01000 	mov	r1, r0
     bb0:	e3a0000e 	mov	r0, #14
     bb4:	ef000000 	svc	0x00000000
     bb8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     bbc:	e12fff1e 	bx	lr

00000bc0 <kthread_create>:
     bc0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
     bc4:	e1a04003 	mov	r4, r3
     bc8:	e1a03002 	mov	r3, r2
     bcc:	e1a02001 	mov	r2, r1
     bd0:	e1a01000 	mov	r1, r0
     bd4:	e3a00016 	mov	r0, #22
     bd8:	ef000000 	svc	0x00000000
     bdc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
     be0:	e12fff1e 	bx	lr

00000be4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     be4:	e92d4800 	push	{fp, lr}
     be8:	e28db004 	add	fp, sp, #4
     bec:	e24dd008 	sub	sp, sp, #8
     bf0:	e50b0008 	str	r0, [fp, #-8]
     bf4:	e1a03001 	mov	r3, r1
     bf8:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
     bfc:	e51b0008 	ldr	r0, [fp, #-8]
     c00:	e24b3009 	sub	r3, fp, #9
     c04:	e1a01003 	mov	r1, r3
     c08:	e3a02001 	mov	r2, #1
     c0c:	ebffff5b 	bl	980 <write>
}
     c10:	e24bd004 	sub	sp, fp, #4
     c14:	e8bd8800 	pop	{fp, pc}

00000c18 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     c18:	e92d4800 	push	{fp, lr}
     c1c:	e28db004 	add	fp, sp, #4
     c20:	e24dd030 	sub	sp, sp, #48	; 0x30
     c24:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     c28:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
     c2c:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
     c30:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
     c34:	e3a03000 	mov	r3, #0
     c38:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
     c3c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     c40:	e3530000 	cmp	r3, #0
     c44:	0a000008 	beq	c6c <printint+0x54>
     c48:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     c4c:	e3530000 	cmp	r3, #0
     c50:	aa000005 	bge	c6c <printint+0x54>
        neg = 1;
     c54:	e3a03001 	mov	r3, #1
     c58:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
     c5c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     c60:	e2633000 	rsb	r3, r3, #0
     c64:	e50b3010 	str	r3, [fp, #-16]
     c68:	ea000001 	b	c74 <printint+0x5c>
    } else {
        x = xx;
     c6c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     c70:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
     c74:	e3a03000 	mov	r3, #0
     c78:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
     c7c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     c80:	e51b2010 	ldr	r2, [fp, #-16]
     c84:	e1a00002 	mov	r0, r2
     c88:	e1a01003 	mov	r1, r3
     c8c:	eb0001e5 	bl	1428 <__aeabi_uidivmod>
     c90:	e1a03001 	mov	r3, r1
     c94:	e1a02003 	mov	r2, r3
     c98:	e30134a4 	movw	r3, #5284	; 0x14a4
     c9c:	e3403000 	movt	r3, #0
     ca0:	e7d32002 	ldrb	r2, [r3, r2]
     ca4:	e3e0001b 	mvn	r0, #27
     ca8:	e51b3008 	ldr	r3, [fp, #-8]
     cac:	e24bc004 	sub	ip, fp, #4
     cb0:	e08c1003 	add	r1, ip, r3
     cb4:	e1a03000 	mov	r3, r0
     cb8:	e0813003 	add	r3, r1, r3
     cbc:	e5c32000 	strb	r2, [r3]
     cc0:	e51b3008 	ldr	r3, [fp, #-8]
     cc4:	e2833001 	add	r3, r3, #1
     cc8:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
     ccc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     cd0:	e51b0010 	ldr	r0, [fp, #-16]
     cd4:	e1a01003 	mov	r1, r3
     cd8:	eb000195 	bl	1334 <__aeabi_uidiv>
     cdc:	e1a03000 	mov	r3, r0
     ce0:	e50b3010 	str	r3, [fp, #-16]
     ce4:	e51b3010 	ldr	r3, [fp, #-16]
     ce8:	e3530000 	cmp	r3, #0
     cec:	1affffe2 	bne	c7c <printint+0x64>
    if(neg)
     cf0:	e51b300c 	ldr	r3, [fp, #-12]
     cf4:	e3530000 	cmp	r3, #0
     cf8:	0a000015 	beq	d54 <printint+0x13c>
        buf[i++] = '-';
     cfc:	e3e0101b 	mvn	r1, #27
     d00:	e51b3008 	ldr	r3, [fp, #-8]
     d04:	e24b0004 	sub	r0, fp, #4
     d08:	e0802003 	add	r2, r0, r3
     d0c:	e1a03001 	mov	r3, r1
     d10:	e0823003 	add	r3, r2, r3
     d14:	e3a0202d 	mov	r2, #45	; 0x2d
     d18:	e5c32000 	strb	r2, [r3]
     d1c:	e51b3008 	ldr	r3, [fp, #-8]
     d20:	e2833001 	add	r3, r3, #1
     d24:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
     d28:	ea000009 	b	d54 <printint+0x13c>
        putc(fd, buf[i]);
     d2c:	e3e0101b 	mvn	r1, #27
     d30:	e51b3008 	ldr	r3, [fp, #-8]
     d34:	e24bc004 	sub	ip, fp, #4
     d38:	e08c2003 	add	r2, ip, r3
     d3c:	e1a03001 	mov	r3, r1
     d40:	e0823003 	add	r3, r2, r3
     d44:	e5d33000 	ldrb	r3, [r3]
     d48:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
     d4c:	e1a01003 	mov	r1, r3
     d50:	ebffffa3 	bl	be4 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
     d54:	e51b3008 	ldr	r3, [fp, #-8]
     d58:	e2433001 	sub	r3, r3, #1
     d5c:	e50b3008 	str	r3, [fp, #-8]
     d60:	e51b3008 	ldr	r3, [fp, #-8]
     d64:	e3530000 	cmp	r3, #0
     d68:	aaffffef 	bge	d2c <printint+0x114>
        putc(fd, buf[i]);
}
     d6c:	e24bd004 	sub	sp, fp, #4
     d70:	e8bd8800 	pop	{fp, pc}

00000d74 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     d74:	e92d000e 	push	{r1, r2, r3}
     d78:	e92d4800 	push	{fp, lr}
     d7c:	e28db004 	add	fp, sp, #4
     d80:	e24dd024 	sub	sp, sp, #36	; 0x24
     d84:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
     d88:	e3a03000 	mov	r3, #0
     d8c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
     d90:	e28b3008 	add	r3, fp, #8
     d94:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
     d98:	e3a03000 	mov	r3, #0
     d9c:	e50b3010 	str	r3, [fp, #-16]
     da0:	ea000077 	b	f84 <printf+0x210>
        c = fmt[i] & 0xff;
     da4:	e59b2004 	ldr	r2, [fp, #4]
     da8:	e51b3010 	ldr	r3, [fp, #-16]
     dac:	e0823003 	add	r3, r2, r3
     db0:	e5d33000 	ldrb	r3, [r3]
     db4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
     db8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     dbc:	e3530000 	cmp	r3, #0
     dc0:	1a00000b 	bne	df4 <printf+0x80>
            if(c == '%'){
     dc4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     dc8:	e3530025 	cmp	r3, #37	; 0x25
     dcc:	1a000002 	bne	ddc <printf+0x68>
                state = '%';
     dd0:	e3a03025 	mov	r3, #37	; 0x25
     dd4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     dd8:	ea000066 	b	f78 <printf+0x204>
            } else {
                putc(fd, c);
     ddc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     de0:	e6ef3073 	uxtb	r3, r3
     de4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     de8:	e1a01003 	mov	r1, r3
     dec:	ebffff7c 	bl	be4 <putc>
     df0:	ea000060 	b	f78 <printf+0x204>
            }
        } else if(state == '%'){
     df4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     df8:	e3530025 	cmp	r3, #37	; 0x25
     dfc:	1a00005d 	bne	f78 <printf+0x204>
            if(c == 'd'){
     e00:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     e04:	e3530064 	cmp	r3, #100	; 0x64
     e08:	1a00000a 	bne	e38 <printf+0xc4>
                printint(fd, *ap, 10, 1);
     e0c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e10:	e5933000 	ldr	r3, [r3]
     e14:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     e18:	e1a01003 	mov	r1, r3
     e1c:	e3a0200a 	mov	r2, #10
     e20:	e3a03001 	mov	r3, #1
     e24:	ebffff7b 	bl	c18 <printint>
                ap++;
     e28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e2c:	e2833004 	add	r3, r3, #4
     e30:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     e34:	ea00004d 	b	f70 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
     e38:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     e3c:	e3530078 	cmp	r3, #120	; 0x78
     e40:	0a000002 	beq	e50 <printf+0xdc>
     e44:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     e48:	e3530070 	cmp	r3, #112	; 0x70
     e4c:	1a00000a 	bne	e7c <printf+0x108>
                printint(fd, *ap, 16, 0);
     e50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e54:	e5933000 	ldr	r3, [r3]
     e58:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     e5c:	e1a01003 	mov	r1, r3
     e60:	e3a02010 	mov	r2, #16
     e64:	e3a03000 	mov	r3, #0
     e68:	ebffff6a 	bl	c18 <printint>
                ap++;
     e6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e70:	e2833004 	add	r3, r3, #4
     e74:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     e78:	ea00003c 	b	f70 <printf+0x1fc>
            } else if(c == 's'){
     e7c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     e80:	e3530073 	cmp	r3, #115	; 0x73
     e84:	1a00001b 	bne	ef8 <printf+0x184>
                s = (char*)*ap;
     e88:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e8c:	e5933000 	ldr	r3, [r3]
     e90:	e50b300c 	str	r3, [fp, #-12]
                ap++;
     e94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e98:	e2833004 	add	r3, r3, #4
     e9c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
     ea0:	e51b300c 	ldr	r3, [fp, #-12]
     ea4:	e3530000 	cmp	r3, #0
     ea8:	1a00000c 	bne	ee0 <printf+0x16c>
                    s = "(null)";
     eac:	e301349c 	movw	r3, #5276	; 0x149c
     eb0:	e3403000 	movt	r3, #0
     eb4:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
     eb8:	ea000008 	b	ee0 <printf+0x16c>
                    putc(fd, *s);
     ebc:	e51b300c 	ldr	r3, [fp, #-12]
     ec0:	e5d33000 	ldrb	r3, [r3]
     ec4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     ec8:	e1a01003 	mov	r1, r3
     ecc:	ebffff44 	bl	be4 <putc>
                    s++;
     ed0:	e51b300c 	ldr	r3, [fp, #-12]
     ed4:	e2833001 	add	r3, r3, #1
     ed8:	e50b300c 	str	r3, [fp, #-12]
     edc:	ea000000 	b	ee4 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
     ee0:	e1a00000 	nop			; (mov r0, r0)
     ee4:	e51b300c 	ldr	r3, [fp, #-12]
     ee8:	e5d33000 	ldrb	r3, [r3]
     eec:	e3530000 	cmp	r3, #0
     ef0:	1afffff1 	bne	ebc <printf+0x148>
     ef4:	ea00001d 	b	f70 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
     ef8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     efc:	e3530063 	cmp	r3, #99	; 0x63
     f00:	1a000009 	bne	f2c <printf+0x1b8>
                putc(fd, *ap);
     f04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f08:	e5933000 	ldr	r3, [r3]
     f0c:	e6ef3073 	uxtb	r3, r3
     f10:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     f14:	e1a01003 	mov	r1, r3
     f18:	ebffff31 	bl	be4 <putc>
                ap++;
     f1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     f20:	e2833004 	add	r3, r3, #4
     f24:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
     f28:	ea000010 	b	f70 <printf+0x1fc>
            } else if(c == '%'){
     f2c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     f30:	e3530025 	cmp	r3, #37	; 0x25
     f34:	1a000005 	bne	f50 <printf+0x1dc>
                putc(fd, c);
     f38:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     f3c:	e6ef3073 	uxtb	r3, r3
     f40:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     f44:	e1a01003 	mov	r1, r3
     f48:	ebffff25 	bl	be4 <putc>
     f4c:	ea000007 	b	f70 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
     f50:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     f54:	e3a01025 	mov	r1, #37	; 0x25
     f58:	ebffff21 	bl	be4 <putc>
                putc(fd, c);
     f5c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     f60:	e6ef3073 	uxtb	r3, r3
     f64:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     f68:	e1a01003 	mov	r1, r3
     f6c:	ebffff1c 	bl	be4 <putc>
            }
            state = 0;
     f70:	e3a03000 	mov	r3, #0
     f74:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
     f78:	e51b3010 	ldr	r3, [fp, #-16]
     f7c:	e2833001 	add	r3, r3, #1
     f80:	e50b3010 	str	r3, [fp, #-16]
     f84:	e59b2004 	ldr	r2, [fp, #4]
     f88:	e51b3010 	ldr	r3, [fp, #-16]
     f8c:	e0823003 	add	r3, r2, r3
     f90:	e5d33000 	ldrb	r3, [r3]
     f94:	e3530000 	cmp	r3, #0
     f98:	1affff81 	bne	da4 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
     f9c:	e24bd004 	sub	sp, fp, #4
     fa0:	e8bd4800 	pop	{fp, lr}
     fa4:	e28dd00c 	add	sp, sp, #12
     fa8:	e12fff1e 	bx	lr

00000fac <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     fac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     fb0:	e28db000 	add	fp, sp, #0
     fb4:	e24dd014 	sub	sp, sp, #20
     fb8:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
     fbc:	e51b3010 	ldr	r3, [fp, #-16]
     fc0:	e2433008 	sub	r3, r3, #8
     fc4:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fc8:	e30134d0 	movw	r3, #5328	; 0x14d0
     fcc:	e3403000 	movt	r3, #0
     fd0:	e5933000 	ldr	r3, [r3]
     fd4:	e50b3008 	str	r3, [fp, #-8]
     fd8:	ea000010 	b	1020 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fdc:	e51b3008 	ldr	r3, [fp, #-8]
     fe0:	e5932000 	ldr	r2, [r3]
     fe4:	e51b3008 	ldr	r3, [fp, #-8]
     fe8:	e1520003 	cmp	r2, r3
     fec:	8a000008 	bhi	1014 <free+0x68>
     ff0:	e51b200c 	ldr	r2, [fp, #-12]
     ff4:	e51b3008 	ldr	r3, [fp, #-8]
     ff8:	e1520003 	cmp	r2, r3
     ffc:	8a000010 	bhi	1044 <free+0x98>
    1000:	e51b3008 	ldr	r3, [fp, #-8]
    1004:	e5932000 	ldr	r2, [r3]
    1008:	e51b300c 	ldr	r3, [fp, #-12]
    100c:	e1520003 	cmp	r2, r3
    1010:	8a00000b 	bhi	1044 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1014:	e51b3008 	ldr	r3, [fp, #-8]
    1018:	e5933000 	ldr	r3, [r3]
    101c:	e50b3008 	str	r3, [fp, #-8]
    1020:	e51b200c 	ldr	r2, [fp, #-12]
    1024:	e51b3008 	ldr	r3, [fp, #-8]
    1028:	e1520003 	cmp	r2, r3
    102c:	9affffea 	bls	fdc <free+0x30>
    1030:	e51b3008 	ldr	r3, [fp, #-8]
    1034:	e5932000 	ldr	r2, [r3]
    1038:	e51b300c 	ldr	r3, [fp, #-12]
    103c:	e1520003 	cmp	r2, r3
    1040:	9affffe5 	bls	fdc <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
    1044:	e51b300c 	ldr	r3, [fp, #-12]
    1048:	e5933004 	ldr	r3, [r3, #4]
    104c:	e1a03183 	lsl	r3, r3, #3
    1050:	e51b200c 	ldr	r2, [fp, #-12]
    1054:	e0822003 	add	r2, r2, r3
    1058:	e51b3008 	ldr	r3, [fp, #-8]
    105c:	e5933000 	ldr	r3, [r3]
    1060:	e1520003 	cmp	r2, r3
    1064:	1a00000d 	bne	10a0 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
    1068:	e51b300c 	ldr	r3, [fp, #-12]
    106c:	e5932004 	ldr	r2, [r3, #4]
    1070:	e51b3008 	ldr	r3, [fp, #-8]
    1074:	e5933000 	ldr	r3, [r3]
    1078:	e5933004 	ldr	r3, [r3, #4]
    107c:	e0822003 	add	r2, r2, r3
    1080:	e51b300c 	ldr	r3, [fp, #-12]
    1084:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
    1088:	e51b3008 	ldr	r3, [fp, #-8]
    108c:	e5933000 	ldr	r3, [r3]
    1090:	e5932000 	ldr	r2, [r3]
    1094:	e51b300c 	ldr	r3, [fp, #-12]
    1098:	e5832000 	str	r2, [r3]
    109c:	ea000003 	b	10b0 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
    10a0:	e51b3008 	ldr	r3, [fp, #-8]
    10a4:	e5932000 	ldr	r2, [r3]
    10a8:	e51b300c 	ldr	r3, [fp, #-12]
    10ac:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
    10b0:	e51b3008 	ldr	r3, [fp, #-8]
    10b4:	e5933004 	ldr	r3, [r3, #4]
    10b8:	e1a03183 	lsl	r3, r3, #3
    10bc:	e51b2008 	ldr	r2, [fp, #-8]
    10c0:	e0822003 	add	r2, r2, r3
    10c4:	e51b300c 	ldr	r3, [fp, #-12]
    10c8:	e1520003 	cmp	r2, r3
    10cc:	1a00000b 	bne	1100 <free+0x154>
        p->s.size += bp->s.size;
    10d0:	e51b3008 	ldr	r3, [fp, #-8]
    10d4:	e5932004 	ldr	r2, [r3, #4]
    10d8:	e51b300c 	ldr	r3, [fp, #-12]
    10dc:	e5933004 	ldr	r3, [r3, #4]
    10e0:	e0822003 	add	r2, r2, r3
    10e4:	e51b3008 	ldr	r3, [fp, #-8]
    10e8:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
    10ec:	e51b300c 	ldr	r3, [fp, #-12]
    10f0:	e5932000 	ldr	r2, [r3]
    10f4:	e51b3008 	ldr	r3, [fp, #-8]
    10f8:	e5832000 	str	r2, [r3]
    10fc:	ea000002 	b	110c <free+0x160>
    } else
        p->s.ptr = bp;
    1100:	e51b3008 	ldr	r3, [fp, #-8]
    1104:	e51b200c 	ldr	r2, [fp, #-12]
    1108:	e5832000 	str	r2, [r3]
    freep = p;
    110c:	e30134d0 	movw	r3, #5328	; 0x14d0
    1110:	e3403000 	movt	r3, #0
    1114:	e51b2008 	ldr	r2, [fp, #-8]
    1118:	e5832000 	str	r2, [r3]
}
    111c:	e28bd000 	add	sp, fp, #0
    1120:	e8bd0800 	pop	{fp}
    1124:	e12fff1e 	bx	lr

00001128 <morecore>:

static Header*
morecore(uint nu)
{
    1128:	e92d4800 	push	{fp, lr}
    112c:	e28db004 	add	fp, sp, #4
    1130:	e24dd010 	sub	sp, sp, #16
    1134:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
    1138:	e51b2010 	ldr	r2, [fp, #-16]
    113c:	e3003fff 	movw	r3, #4095	; 0xfff
    1140:	e1520003 	cmp	r2, r3
    1144:	8a000001 	bhi	1150 <morecore+0x28>
        nu = 4096;
    1148:	e3a03a01 	mov	r3, #4096	; 0x1000
    114c:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
    1150:	e51b3010 	ldr	r3, [fp, #-16]
    1154:	e1a03183 	lsl	r3, r3, #3
    1158:	e1a00003 	mov	r0, r3
    115c:	ebfffe7c 	bl	b54 <sbrk>
    1160:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
    1164:	e51b3008 	ldr	r3, [fp, #-8]
    1168:	e3730001 	cmn	r3, #1
    116c:	1a000001 	bne	1178 <morecore+0x50>
        return 0;
    1170:	e3a03000 	mov	r3, #0
    1174:	ea00000b 	b	11a8 <morecore+0x80>
    hp = (Header*)p;
    1178:	e51b3008 	ldr	r3, [fp, #-8]
    117c:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
    1180:	e51b300c 	ldr	r3, [fp, #-12]
    1184:	e51b2010 	ldr	r2, [fp, #-16]
    1188:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
    118c:	e51b300c 	ldr	r3, [fp, #-12]
    1190:	e2833008 	add	r3, r3, #8
    1194:	e1a00003 	mov	r0, r3
    1198:	ebffff83 	bl	fac <free>
    return freep;
    119c:	e30134d0 	movw	r3, #5328	; 0x14d0
    11a0:	e3403000 	movt	r3, #0
    11a4:	e5933000 	ldr	r3, [r3]
}
    11a8:	e1a00003 	mov	r0, r3
    11ac:	e24bd004 	sub	sp, fp, #4
    11b0:	e8bd8800 	pop	{fp, pc}

000011b4 <malloc>:

void*
malloc(uint nbytes)
{
    11b4:	e92d4800 	push	{fp, lr}
    11b8:	e28db004 	add	fp, sp, #4
    11bc:	e24dd018 	sub	sp, sp, #24
    11c0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11c4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    11c8:	e2833007 	add	r3, r3, #7
    11cc:	e1a031a3 	lsr	r3, r3, #3
    11d0:	e2833001 	add	r3, r3, #1
    11d4:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
    11d8:	e30134d0 	movw	r3, #5328	; 0x14d0
    11dc:	e3403000 	movt	r3, #0
    11e0:	e5933000 	ldr	r3, [r3]
    11e4:	e50b300c 	str	r3, [fp, #-12]
    11e8:	e51b300c 	ldr	r3, [fp, #-12]
    11ec:	e3530000 	cmp	r3, #0
    11f0:	1a000010 	bne	1238 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
    11f4:	e30134c8 	movw	r3, #5320	; 0x14c8
    11f8:	e3403000 	movt	r3, #0
    11fc:	e50b300c 	str	r3, [fp, #-12]
    1200:	e30134d0 	movw	r3, #5328	; 0x14d0
    1204:	e3403000 	movt	r3, #0
    1208:	e51b200c 	ldr	r2, [fp, #-12]
    120c:	e5832000 	str	r2, [r3]
    1210:	e30134d0 	movw	r3, #5328	; 0x14d0
    1214:	e3403000 	movt	r3, #0
    1218:	e5932000 	ldr	r2, [r3]
    121c:	e30134c8 	movw	r3, #5320	; 0x14c8
    1220:	e3403000 	movt	r3, #0
    1224:	e5832000 	str	r2, [r3]
        base.s.size = 0;
    1228:	e30134c8 	movw	r3, #5320	; 0x14c8
    122c:	e3403000 	movt	r3, #0
    1230:	e3a02000 	mov	r2, #0
    1234:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1238:	e51b300c 	ldr	r3, [fp, #-12]
    123c:	e5933000 	ldr	r3, [r3]
    1240:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
    1244:	e51b3008 	ldr	r3, [fp, #-8]
    1248:	e5932004 	ldr	r2, [r3, #4]
    124c:	e51b3010 	ldr	r3, [fp, #-16]
    1250:	e1520003 	cmp	r2, r3
    1254:	3a00001f 	bcc	12d8 <malloc+0x124>
            if(p->s.size == nunits)
    1258:	e51b3008 	ldr	r3, [fp, #-8]
    125c:	e5932004 	ldr	r2, [r3, #4]
    1260:	e51b3010 	ldr	r3, [fp, #-16]
    1264:	e1520003 	cmp	r2, r3
    1268:	1a000004 	bne	1280 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    126c:	e51b3008 	ldr	r3, [fp, #-8]
    1270:	e5932000 	ldr	r2, [r3]
    1274:	e51b300c 	ldr	r3, [fp, #-12]
    1278:	e5832000 	str	r2, [r3]
    127c:	ea00000e 	b	12bc <malloc+0x108>
            else {
                p->s.size -= nunits;
    1280:	e51b3008 	ldr	r3, [fp, #-8]
    1284:	e5932004 	ldr	r2, [r3, #4]
    1288:	e51b3010 	ldr	r3, [fp, #-16]
    128c:	e0632002 	rsb	r2, r3, r2
    1290:	e51b3008 	ldr	r3, [fp, #-8]
    1294:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    1298:	e51b3008 	ldr	r3, [fp, #-8]
    129c:	e5933004 	ldr	r3, [r3, #4]
    12a0:	e1a03183 	lsl	r3, r3, #3
    12a4:	e51b2008 	ldr	r2, [fp, #-8]
    12a8:	e0823003 	add	r3, r2, r3
    12ac:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    12b0:	e51b3008 	ldr	r3, [fp, #-8]
    12b4:	e51b2010 	ldr	r2, [fp, #-16]
    12b8:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    12bc:	e30134d0 	movw	r3, #5328	; 0x14d0
    12c0:	e3403000 	movt	r3, #0
    12c4:	e51b200c 	ldr	r2, [fp, #-12]
    12c8:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    12cc:	e51b3008 	ldr	r3, [fp, #-8]
    12d0:	e2833008 	add	r3, r3, #8
    12d4:	ea000013 	b	1328 <malloc+0x174>
        }
        if(p == freep)
    12d8:	e30134d0 	movw	r3, #5328	; 0x14d0
    12dc:	e3403000 	movt	r3, #0
    12e0:	e5933000 	ldr	r3, [r3]
    12e4:	e51b2008 	ldr	r2, [fp, #-8]
    12e8:	e1520003 	cmp	r2, r3
    12ec:	1a000007 	bne	1310 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    12f0:	e51b0010 	ldr	r0, [fp, #-16]
    12f4:	ebffff8b 	bl	1128 <morecore>
    12f8:	e50b0008 	str	r0, [fp, #-8]
    12fc:	e51b3008 	ldr	r3, [fp, #-8]
    1300:	e3530000 	cmp	r3, #0
    1304:	1a000001 	bne	1310 <malloc+0x15c>
                return 0;
    1308:	e3a03000 	mov	r3, #0
    130c:	ea000005 	b	1328 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1310:	e51b3008 	ldr	r3, [fp, #-8]
    1314:	e50b300c 	str	r3, [fp, #-12]
    1318:	e51b3008 	ldr	r3, [fp, #-8]
    131c:	e5933000 	ldr	r3, [r3]
    1320:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    1324:	eaffffc6 	b	1244 <malloc+0x90>
}
    1328:	e1a00003 	mov	r0, r3
    132c:	e24bd004 	sub	sp, fp, #4
    1330:	e8bd8800 	pop	{fp, pc}

00001334 <__aeabi_uidiv>:
    1334:	e2512001 	subs	r2, r1, #1
    1338:	012fff1e 	bxeq	lr
    133c:	3a000036 	bcc	141c <__aeabi_uidiv+0xe8>
    1340:	e1500001 	cmp	r0, r1
    1344:	9a000022 	bls	13d4 <__aeabi_uidiv+0xa0>
    1348:	e1110002 	tst	r1, r2
    134c:	0a000023 	beq	13e0 <__aeabi_uidiv+0xac>
    1350:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1354:	01a01181 	lsleq	r1, r1, #3
    1358:	03a03008 	moveq	r3, #8
    135c:	13a03001 	movne	r3, #1
    1360:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1364:	31510000 	cmpcc	r1, r0
    1368:	31a01201 	lslcc	r1, r1, #4
    136c:	31a03203 	lslcc	r3, r3, #4
    1370:	3afffffa 	bcc	1360 <__aeabi_uidiv+0x2c>
    1374:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1378:	31510000 	cmpcc	r1, r0
    137c:	31a01081 	lslcc	r1, r1, #1
    1380:	31a03083 	lslcc	r3, r3, #1
    1384:	3afffffa 	bcc	1374 <__aeabi_uidiv+0x40>
    1388:	e3a02000 	mov	r2, #0
    138c:	e1500001 	cmp	r0, r1
    1390:	20400001 	subcs	r0, r0, r1
    1394:	21822003 	orrcs	r2, r2, r3
    1398:	e15000a1 	cmp	r0, r1, lsr #1
    139c:	204000a1 	subcs	r0, r0, r1, lsr #1
    13a0:	218220a3 	orrcs	r2, r2, r3, lsr #1
    13a4:	e1500121 	cmp	r0, r1, lsr #2
    13a8:	20400121 	subcs	r0, r0, r1, lsr #2
    13ac:	21822123 	orrcs	r2, r2, r3, lsr #2
    13b0:	e15001a1 	cmp	r0, r1, lsr #3
    13b4:	204001a1 	subcs	r0, r0, r1, lsr #3
    13b8:	218221a3 	orrcs	r2, r2, r3, lsr #3
    13bc:	e3500000 	cmp	r0, #0
    13c0:	11b03223 	lsrsne	r3, r3, #4
    13c4:	11a01221 	lsrne	r1, r1, #4
    13c8:	1affffef 	bne	138c <__aeabi_uidiv+0x58>
    13cc:	e1a00002 	mov	r0, r2
    13d0:	e12fff1e 	bx	lr
    13d4:	03a00001 	moveq	r0, #1
    13d8:	13a00000 	movne	r0, #0
    13dc:	e12fff1e 	bx	lr
    13e0:	e3510801 	cmp	r1, #65536	; 0x10000
    13e4:	21a01821 	lsrcs	r1, r1, #16
    13e8:	23a02010 	movcs	r2, #16
    13ec:	33a02000 	movcc	r2, #0
    13f0:	e3510c01 	cmp	r1, #256	; 0x100
    13f4:	21a01421 	lsrcs	r1, r1, #8
    13f8:	22822008 	addcs	r2, r2, #8
    13fc:	e3510010 	cmp	r1, #16
    1400:	21a01221 	lsrcs	r1, r1, #4
    1404:	22822004 	addcs	r2, r2, #4
    1408:	e3510004 	cmp	r1, #4
    140c:	82822003 	addhi	r2, r2, #3
    1410:	908220a1 	addls	r2, r2, r1, lsr #1
    1414:	e1a00230 	lsr	r0, r0, r2
    1418:	e12fff1e 	bx	lr
    141c:	e3500000 	cmp	r0, #0
    1420:	13e00000 	mvnne	r0, #0
    1424:	ea000007 	b	1448 <__aeabi_idiv0>

00001428 <__aeabi_uidivmod>:
    1428:	e3510000 	cmp	r1, #0
    142c:	0afffffa 	beq	141c <__aeabi_uidiv+0xe8>
    1430:	e92d4003 	push	{r0, r1, lr}
    1434:	ebffffbe 	bl	1334 <__aeabi_uidiv>
    1438:	e8bd4006 	pop	{r1, r2, lr}
    143c:	e0030092 	mul	r3, r2, r0
    1440:	e0411003 	sub	r1, r1, r3
    1444:	e12fff1e 	bx	lr

00001448 <__aeabi_idiv0>:
    1448:	e12fff1e 	bx	lr
