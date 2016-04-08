
_sh:     file format elf32-littlearm


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd028 	sub	sp, sp, #40	; 0x28
       c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    struct execcmd *ecmd;
    struct listcmd *lcmd;
    struct pipecmd *pcmd;
    struct redircmd *rcmd;
    
    if(cmd == 0)
      10:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
      14:	e3530000 	cmp	r3, #0
      18:	1a000000 	bne	20 <runcmd+0x20>
        exit();
      1c:	eb000563 	bl	15b0 <exit>
    
    switch(cmd->type){
      20:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
      24:	e5933000 	ldr	r3, [r3]
      28:	e2433001 	sub	r3, r3, #1
      2c:	e3530004 	cmp	r3, #4
      30:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
      34:	ea000004 	b	4c <runcmd+0x4c>
      38:	00000058 	.word	0x00000058
      3c:	000000b0 	.word	0x000000b0
      40:	00000164 	.word	0x00000164
      44:	00000124 	.word	0x00000124
      48:	0000024c 	.word	0x0000024c
        default:
            panic("runcmd");
      4c:	e302010c 	movw	r0, #8460	; 0x210c
      50:	e3400000 	movt	r0, #0
      54:	eb0000f0 	bl	41c <panic>
            
        case EXEC:
            ecmd = (struct execcmd*)cmd;
      58:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
      5c:	e50b3008 	str	r3, [fp, #-8]
            if(ecmd->argv[0] == 0)
      60:	e51b3008 	ldr	r3, [fp, #-8]
      64:	e5933004 	ldr	r3, [r3, #4]
      68:	e3530000 	cmp	r3, #0
      6c:	1a000000 	bne	74 <runcmd+0x74>
                exit();
      70:	eb00054e 	bl	15b0 <exit>
            exec(ecmd->argv[0], ecmd->argv);
      74:	e51b3008 	ldr	r3, [fp, #-8]
      78:	e5932004 	ldr	r2, [r3, #4]
      7c:	e51b3008 	ldr	r3, [fp, #-8]
      80:	e2833004 	add	r3, r3, #4
      84:	e1a00002 	mov	r0, r2
      88:	e1a01003 	mov	r1, r3
      8c:	eb000586 	bl	16ac <exec>
            printf(2, "exec %s failed\n", ecmd->argv[0]);
      90:	e51b3008 	ldr	r3, [fp, #-8]
      94:	e5933004 	ldr	r3, [r3, #4]
      98:	e3a00002 	mov	r0, #2
      9c:	e3021114 	movw	r1, #8468	; 0x2114
      a0:	e3401000 	movt	r1, #0
      a4:	e1a02003 	mov	r2, r3
      a8:	eb000661 	bl	1a34 <printf>
            break;
      ac:	ea000071 	b	278 <runcmd+0x278>
            
        case REDIR:
            rcmd = (struct redircmd*)cmd;
      b0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
      b4:	e50b300c 	str	r3, [fp, #-12]
            close(rcmd->fd);
      b8:	e51b300c 	ldr	r3, [fp, #-12]
      bc:	e5933014 	ldr	r3, [r3, #20]
      c0:	e1a00003 	mov	r0, r3
      c4:	eb000566 	bl	1664 <close>
            if(open(rcmd->file, rcmd->mode) < 0){
      c8:	e51b300c 	ldr	r3, [fp, #-12]
      cc:	e5932008 	ldr	r2, [r3, #8]
      d0:	e51b300c 	ldr	r3, [fp, #-12]
      d4:	e5933010 	ldr	r3, [r3, #16]
      d8:	e1a00002 	mov	r0, r2
      dc:	e1a01003 	mov	r1, r3
      e0:	eb00057a 	bl	16d0 <open>
      e4:	e1a03000 	mov	r3, r0
      e8:	e3530000 	cmp	r3, #0
      ec:	aa000007 	bge	110 <runcmd+0x110>
                printf(2, "open %s failed\n", rcmd->file);
      f0:	e51b300c 	ldr	r3, [fp, #-12]
      f4:	e5933008 	ldr	r3, [r3, #8]
      f8:	e3a00002 	mov	r0, #2
      fc:	e3021124 	movw	r1, #8484	; 0x2124
     100:	e3401000 	movt	r1, #0
     104:	e1a02003 	mov	r2, r3
     108:	eb000649 	bl	1a34 <printf>
                exit();
     10c:	eb000527 	bl	15b0 <exit>
            }
            runcmd(rcmd->cmd);
     110:	e51b300c 	ldr	r3, [fp, #-12]
     114:	e5933004 	ldr	r3, [r3, #4]
     118:	e1a00003 	mov	r0, r3
     11c:	ebffffb7 	bl	0 <runcmd>
            break;
     120:	ea000054 	b	278 <runcmd+0x278>
            
        case LIST:
            lcmd = (struct listcmd*)cmd;
     124:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
     128:	e50b3010 	str	r3, [fp, #-16]
            if(fork1() == 0)
     12c:	eb0000c4 	bl	444 <fork1>
     130:	e1a03000 	mov	r3, r0
     134:	e3530000 	cmp	r3, #0
     138:	1a000003 	bne	14c <runcmd+0x14c>
                runcmd(lcmd->left);
     13c:	e51b3010 	ldr	r3, [fp, #-16]
     140:	e5933004 	ldr	r3, [r3, #4]
     144:	e1a00003 	mov	r0, r3
     148:	ebffffac 	bl	0 <runcmd>
            wait();
     14c:	eb000520 	bl	15d4 <wait>
            runcmd(lcmd->right);
     150:	e51b3010 	ldr	r3, [fp, #-16]
     154:	e5933008 	ldr	r3, [r3, #8]
     158:	e1a00003 	mov	r0, r3
     15c:	ebffffa7 	bl	0 <runcmd>
            break;
     160:	ea000044 	b	278 <runcmd+0x278>
            
        case PIPE:
            pcmd = (struct pipecmd*)cmd;
     164:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
     168:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            if(pipe(p) < 0)
     16c:	e24b3020 	sub	r3, fp, #32
     170:	e1a00003 	mov	r0, r3
     174:	eb00051f 	bl	15f8 <pipe>
     178:	e1a03000 	mov	r3, r0
     17c:	e3530000 	cmp	r3, #0
     180:	aa000002 	bge	190 <runcmd+0x190>
                panic("pipe");
     184:	e3020134 	movw	r0, #8500	; 0x2134
     188:	e3400000 	movt	r0, #0
     18c:	eb0000a2 	bl	41c <panic>
            if(fork1() == 0){
     190:	eb0000ab 	bl	444 <fork1>
     194:	e1a03000 	mov	r3, r0
     198:	e3530000 	cmp	r3, #0
     19c:	1a00000e 	bne	1dc <runcmd+0x1dc>
                close(1);
     1a0:	e3a00001 	mov	r0, #1
     1a4:	eb00052e 	bl	1664 <close>
                dup(p[1]);
     1a8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     1ac:	e1a00003 	mov	r0, r3
     1b0:	eb000585 	bl	17cc <dup>
                close(p[0]);
     1b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     1b8:	e1a00003 	mov	r0, r3
     1bc:	eb000528 	bl	1664 <close>
                close(p[1]);
     1c0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     1c4:	e1a00003 	mov	r0, r3
     1c8:	eb000525 	bl	1664 <close>
                runcmd(pcmd->left);
     1cc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     1d0:	e5933004 	ldr	r3, [r3, #4]
     1d4:	e1a00003 	mov	r0, r3
     1d8:	ebffff88 	bl	0 <runcmd>
            }
            if(fork1() == 0){
     1dc:	eb000098 	bl	444 <fork1>
     1e0:	e1a03000 	mov	r3, r0
     1e4:	e3530000 	cmp	r3, #0
     1e8:	1a00000e 	bne	228 <runcmd+0x228>
                close(0);
     1ec:	e3a00000 	mov	r0, #0
     1f0:	eb00051b 	bl	1664 <close>
                dup(p[0]);
     1f4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     1f8:	e1a00003 	mov	r0, r3
     1fc:	eb000572 	bl	17cc <dup>
                close(p[0]);
     200:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     204:	e1a00003 	mov	r0, r3
     208:	eb000515 	bl	1664 <close>
                close(p[1]);
     20c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     210:	e1a00003 	mov	r0, r3
     214:	eb000512 	bl	1664 <close>
                runcmd(pcmd->right);
     218:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     21c:	e5933008 	ldr	r3, [r3, #8]
     220:	e1a00003 	mov	r0, r3
     224:	ebffff75 	bl	0 <runcmd>
            }
            close(p[0]);
     228:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     22c:	e1a00003 	mov	r0, r3
     230:	eb00050b 	bl	1664 <close>
            close(p[1]);
     234:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     238:	e1a00003 	mov	r0, r3
     23c:	eb000508 	bl	1664 <close>
            wait();
     240:	eb0004e3 	bl	15d4 <wait>
            wait();
     244:	eb0004e2 	bl	15d4 <wait>
            break;
     248:	ea00000a 	b	278 <runcmd+0x278>
            
        case BACK:
            bcmd = (struct backcmd*)cmd;
     24c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
     250:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
            if(fork1() == 0)
     254:	eb00007a 	bl	444 <fork1>
     258:	e1a03000 	mov	r3, r0
     25c:	e3530000 	cmp	r3, #0
     260:	1a000003 	bne	274 <runcmd+0x274>
                runcmd(bcmd->cmd);
     264:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     268:	e5933004 	ldr	r3, [r3, #4]
     26c:	e1a00003 	mov	r0, r3
     270:	ebffff62 	bl	0 <runcmd>
            break;
     274:	e1a00000 	nop			; (mov r0, r0)
    }
    exit();
     278:	eb0004cc 	bl	15b0 <exit>

0000027c <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     27c:	e92d4800 	push	{fp, lr}
     280:	e28db004 	add	fp, sp, #4
     284:	e24dd008 	sub	sp, sp, #8
     288:	e50b0008 	str	r0, [fp, #-8]
     28c:	e50b100c 	str	r1, [fp, #-12]
    printf(2, "$ ");
     290:	e3a00002 	mov	r0, #2
     294:	e302113c 	movw	r1, #8508	; 0x213c
     298:	e3401000 	movt	r1, #0
     29c:	eb0005e4 	bl	1a34 <printf>
    memset(buf, 0, nbuf);
     2a0:	e51b300c 	ldr	r3, [fp, #-12]
     2a4:	e51b0008 	ldr	r0, [fp, #-8]
     2a8:	e3a01000 	mov	r1, #0
     2ac:	e1a02003 	mov	r2, r3
     2b0:	eb0003c5 	bl	11cc <memset>
    gets(buf, nbuf);
     2b4:	e51b0008 	ldr	r0, [fp, #-8]
     2b8:	e51b100c 	ldr	r1, [fp, #-12]
     2bc:	eb000425 	bl	1358 <gets>
    if(buf[0] == 0) // EOF
     2c0:	e51b3008 	ldr	r3, [fp, #-8]
     2c4:	e5d33000 	ldrb	r3, [r3]
     2c8:	e3530000 	cmp	r3, #0
     2cc:	1a000001 	bne	2d8 <getcmd+0x5c>
        return -1;
     2d0:	e3e03000 	mvn	r3, #0
     2d4:	ea000000 	b	2dc <getcmd+0x60>
    return 0;
     2d8:	e3a03000 	mov	r3, #0
}
     2dc:	e1a00003 	mov	r0, r3
     2e0:	e24bd004 	sub	sp, fp, #4
     2e4:	e8bd8800 	pop	{fp, pc}

000002e8 <main>:

int
main(void)
{
     2e8:	e92d4800 	push	{fp, lr}
     2ec:	e28db004 	add	fp, sp, #4
     2f0:	e24dd008 	sub	sp, sp, #8
    static char buf[100];
    int fd;
    
    // Assumes three file descriptors open.
    while((fd = open("console", O_RDWR)) >= 0){
     2f4:	ea000006 	b	314 <main+0x2c>
        if(fd >= 3){
     2f8:	e51b3008 	ldr	r3, [fp, #-8]
     2fc:	e3530002 	cmp	r3, #2
     300:	da000003 	ble	314 <main+0x2c>
            close(fd);
     304:	e51b0008 	ldr	r0, [fp, #-8]
     308:	eb0004d5 	bl	1664 <close>
            break;
     30c:	e1a00000 	nop			; (mov r0, r0)
        }
    }
    
    // Read and run input commands.
    while(getcmd(buf, sizeof(buf)) >= 0){
     310:	ea000038 	b	3f8 <main+0x110>
{
    static char buf[100];
    int fd;
    
    // Assumes three file descriptors open.
    while((fd = open("console", O_RDWR)) >= 0){
     314:	e3020140 	movw	r0, #8512	; 0x2140
     318:	e3400000 	movt	r0, #0
     31c:	e3a01002 	mov	r1, #2
     320:	eb0004ea 	bl	16d0 <open>
     324:	e50b0008 	str	r0, [fp, #-8]
     328:	e51b3008 	ldr	r3, [fp, #-8]
     32c:	e3530000 	cmp	r3, #0
     330:	aafffff0 	bge	2f8 <main+0x10>
            break;
        }
    }
    
    // Read and run input commands.
    while(getcmd(buf, sizeof(buf)) >= 0){
     334:	ea00002f 	b	3f8 <main+0x110>
        if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     338:	e302321c 	movw	r3, #8732	; 0x221c
     33c:	e3403000 	movt	r3, #0
     340:	e5d33000 	ldrb	r3, [r3]
     344:	e3530063 	cmp	r3, #99	; 0x63
     348:	1a00001d 	bne	3c4 <main+0xdc>
     34c:	e302321c 	movw	r3, #8732	; 0x221c
     350:	e3403000 	movt	r3, #0
     354:	e5d33001 	ldrb	r3, [r3, #1]
     358:	e3530064 	cmp	r3, #100	; 0x64
     35c:	1a000018 	bne	3c4 <main+0xdc>
     360:	e302321c 	movw	r3, #8732	; 0x221c
     364:	e3403000 	movt	r3, #0
     368:	e5d33002 	ldrb	r3, [r3, #2]
     36c:	e3530020 	cmp	r3, #32
     370:	1a000013 	bne	3c4 <main+0xdc>
            // Clumsy but will have to do for now.
            // Chdir has no effect on the parent if run in the child.
            buf[strlen(buf)-1] = 0;  // chop \n
     374:	e302021c 	movw	r0, #8732	; 0x221c
     378:	e3400000 	movt	r0, #0
     37c:	eb00037d 	bl	1178 <strlen>
     380:	e1a03000 	mov	r3, r0
     384:	e2432001 	sub	r2, r3, #1
     388:	e302321c 	movw	r3, #8732	; 0x221c
     38c:	e3403000 	movt	r3, #0
     390:	e3a01000 	mov	r1, #0
     394:	e7c31002 	strb	r1, [r3, r2]
            if(chdir(buf+3) < 0)
     398:	e59f0078 	ldr	r0, [pc, #120]	; 418 <main+0x130>
     39c:	eb000501 	bl	17a8 <chdir>
     3a0:	e1a03000 	mov	r3, r0
     3a4:	e3530000 	cmp	r3, #0
     3a8:	aa000011 	bge	3f4 <main+0x10c>
                printf(2, "cannot cd %s\n", buf+3);
     3ac:	e3a00002 	mov	r0, #2
     3b0:	e3021148 	movw	r1, #8520	; 0x2148
     3b4:	e3401000 	movt	r1, #0
     3b8:	e59f2058 	ldr	r2, [pc, #88]	; 418 <main+0x130>
     3bc:	eb00059c 	bl	1a34 <printf>
            continue;
     3c0:	ea00000b 	b	3f4 <main+0x10c>
        }
        if(fork1() == 0)
     3c4:	eb00001e 	bl	444 <fork1>
     3c8:	e1a03000 	mov	r3, r0
     3cc:	e3530000 	cmp	r3, #0
     3d0:	1a000005 	bne	3ec <main+0x104>
            runcmd(parsecmd(buf));
     3d4:	e302021c 	movw	r0, #8732	; 0x221c
     3d8:	e3400000 	movt	r0, #0
     3dc:	eb00015a 	bl	94c <parsecmd>
     3e0:	e1a03000 	mov	r3, r0
     3e4:	e1a00003 	mov	r0, r3
     3e8:	ebffff04 	bl	0 <runcmd>
        wait();
     3ec:	eb000478 	bl	15d4 <wait>
     3f0:	ea000000 	b	3f8 <main+0x110>
            // Clumsy but will have to do for now.
            // Chdir has no effect on the parent if run in the child.
            buf[strlen(buf)-1] = 0;  // chop \n
            if(chdir(buf+3) < 0)
                printf(2, "cannot cd %s\n", buf+3);
            continue;
     3f4:	e1a00000 	nop			; (mov r0, r0)
            break;
        }
    }
    
    // Read and run input commands.
    while(getcmd(buf, sizeof(buf)) >= 0){
     3f8:	e302021c 	movw	r0, #8732	; 0x221c
     3fc:	e3400000 	movt	r0, #0
     400:	e3a01064 	mov	r1, #100	; 0x64
     404:	ebffff9c 	bl	27c <getcmd>
     408:	e1a03000 	mov	r3, r0
     40c:	e3530000 	cmp	r3, #0
     410:	aaffffc8 	bge	338 <main+0x50>
        }
        if(fork1() == 0)
            runcmd(parsecmd(buf));
        wait();
    }
    exit();
     414:	eb000465 	bl	15b0 <exit>
     418:	0000221f 	.word	0x0000221f

0000041c <panic>:
}

void
panic(char *s)
{
     41c:	e92d4800 	push	{fp, lr}
     420:	e28db004 	add	fp, sp, #4
     424:	e24dd008 	sub	sp, sp, #8
     428:	e50b0008 	str	r0, [fp, #-8]
    printf(2, "%s\n", s);
     42c:	e3a00002 	mov	r0, #2
     430:	e3021158 	movw	r1, #8536	; 0x2158
     434:	e3401000 	movt	r1, #0
     438:	e51b2008 	ldr	r2, [fp, #-8]
     43c:	eb00057c 	bl	1a34 <printf>
    exit();
     440:	eb00045a 	bl	15b0 <exit>

00000444 <fork1>:
}

int
fork1(void)
{
     444:	e92d4800 	push	{fp, lr}
     448:	e28db004 	add	fp, sp, #4
     44c:	e24dd008 	sub	sp, sp, #8
    int pid;
    
    pid = fork();
     450:	eb00044d 	bl	158c <fork>
     454:	e50b0008 	str	r0, [fp, #-8]
    if(pid == -1)
     458:	e51b3008 	ldr	r3, [fp, #-8]
     45c:	e3730001 	cmn	r3, #1
     460:	1a000002 	bne	470 <fork1+0x2c>
        panic("fork");
     464:	e302015c 	movw	r0, #8540	; 0x215c
     468:	e3400000 	movt	r0, #0
     46c:	ebffffea 	bl	41c <panic>
    return pid;
     470:	e51b3008 	ldr	r3, [fp, #-8]
}
     474:	e1a00003 	mov	r0, r3
     478:	e24bd004 	sub	sp, fp, #4
     47c:	e8bd8800 	pop	{fp, pc}

00000480 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     480:	e92d4800 	push	{fp, lr}
     484:	e28db004 	add	fp, sp, #4
     488:	e24dd008 	sub	sp, sp, #8
    struct execcmd *cmd;
    
    cmd = malloc(sizeof(*cmd));
     48c:	e3a00054 	mov	r0, #84	; 0x54
     490:	eb000677 	bl	1e74 <malloc>
     494:	e50b0008 	str	r0, [fp, #-8]
    memset(cmd, 0, sizeof(*cmd));
     498:	e51b0008 	ldr	r0, [fp, #-8]
     49c:	e3a01000 	mov	r1, #0
     4a0:	e3a02054 	mov	r2, #84	; 0x54
     4a4:	eb000348 	bl	11cc <memset>
    cmd->type = EXEC;
     4a8:	e51b3008 	ldr	r3, [fp, #-8]
     4ac:	e3a02001 	mov	r2, #1
     4b0:	e5832000 	str	r2, [r3]
    return (struct cmd*)cmd;
     4b4:	e51b3008 	ldr	r3, [fp, #-8]
}
     4b8:	e1a00003 	mov	r0, r3
     4bc:	e24bd004 	sub	sp, fp, #4
     4c0:	e8bd8800 	pop	{fp, pc}

000004c4 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     4c4:	e92d4800 	push	{fp, lr}
     4c8:	e28db004 	add	fp, sp, #4
     4cc:	e24dd018 	sub	sp, sp, #24
     4d0:	e50b0010 	str	r0, [fp, #-16]
     4d4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     4d8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     4dc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    struct redircmd *cmd;
    
    cmd = malloc(sizeof(*cmd));
     4e0:	e3a00018 	mov	r0, #24
     4e4:	eb000662 	bl	1e74 <malloc>
     4e8:	e50b0008 	str	r0, [fp, #-8]
    memset(cmd, 0, sizeof(*cmd));
     4ec:	e51b0008 	ldr	r0, [fp, #-8]
     4f0:	e3a01000 	mov	r1, #0
     4f4:	e3a02018 	mov	r2, #24
     4f8:	eb000333 	bl	11cc <memset>
    cmd->type = REDIR;
     4fc:	e51b3008 	ldr	r3, [fp, #-8]
     500:	e3a02002 	mov	r2, #2
     504:	e5832000 	str	r2, [r3]
    cmd->cmd = subcmd;
     508:	e51b3008 	ldr	r3, [fp, #-8]
     50c:	e51b2010 	ldr	r2, [fp, #-16]
     510:	e5832004 	str	r2, [r3, #4]
    cmd->file = file;
     514:	e51b3008 	ldr	r3, [fp, #-8]
     518:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     51c:	e5832008 	str	r2, [r3, #8]
    cmd->efile = efile;
     520:	e51b3008 	ldr	r3, [fp, #-8]
     524:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     528:	e583200c 	str	r2, [r3, #12]
    cmd->mode = mode;
     52c:	e51b3008 	ldr	r3, [fp, #-8]
     530:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
     534:	e5832010 	str	r2, [r3, #16]
    cmd->fd = fd;
     538:	e51b3008 	ldr	r3, [fp, #-8]
     53c:	e59b2004 	ldr	r2, [fp, #4]
     540:	e5832014 	str	r2, [r3, #20]
    return (struct cmd*)cmd;
     544:	e51b3008 	ldr	r3, [fp, #-8]
}
     548:	e1a00003 	mov	r0, r3
     54c:	e24bd004 	sub	sp, fp, #4
     550:	e8bd8800 	pop	{fp, pc}

00000554 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     554:	e92d4800 	push	{fp, lr}
     558:	e28db004 	add	fp, sp, #4
     55c:	e24dd010 	sub	sp, sp, #16
     560:	e50b0010 	str	r0, [fp, #-16]
     564:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct pipecmd *cmd;
    
    cmd = malloc(sizeof(*cmd));
     568:	e3a0000c 	mov	r0, #12
     56c:	eb000640 	bl	1e74 <malloc>
     570:	e50b0008 	str	r0, [fp, #-8]
    memset(cmd, 0, sizeof(*cmd));
     574:	e51b0008 	ldr	r0, [fp, #-8]
     578:	e3a01000 	mov	r1, #0
     57c:	e3a0200c 	mov	r2, #12
     580:	eb000311 	bl	11cc <memset>
    cmd->type = PIPE;
     584:	e51b3008 	ldr	r3, [fp, #-8]
     588:	e3a02003 	mov	r2, #3
     58c:	e5832000 	str	r2, [r3]
    cmd->left = left;
     590:	e51b3008 	ldr	r3, [fp, #-8]
     594:	e51b2010 	ldr	r2, [fp, #-16]
     598:	e5832004 	str	r2, [r3, #4]
    cmd->right = right;
     59c:	e51b3008 	ldr	r3, [fp, #-8]
     5a0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     5a4:	e5832008 	str	r2, [r3, #8]
    return (struct cmd*)cmd;
     5a8:	e51b3008 	ldr	r3, [fp, #-8]
}
     5ac:	e1a00003 	mov	r0, r3
     5b0:	e24bd004 	sub	sp, fp, #4
     5b4:	e8bd8800 	pop	{fp, pc}

000005b8 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5b8:	e92d4800 	push	{fp, lr}
     5bc:	e28db004 	add	fp, sp, #4
     5c0:	e24dd010 	sub	sp, sp, #16
     5c4:	e50b0010 	str	r0, [fp, #-16]
     5c8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct listcmd *cmd;
    
    cmd = malloc(sizeof(*cmd));
     5cc:	e3a0000c 	mov	r0, #12
     5d0:	eb000627 	bl	1e74 <malloc>
     5d4:	e50b0008 	str	r0, [fp, #-8]
    memset(cmd, 0, sizeof(*cmd));
     5d8:	e51b0008 	ldr	r0, [fp, #-8]
     5dc:	e3a01000 	mov	r1, #0
     5e0:	e3a0200c 	mov	r2, #12
     5e4:	eb0002f8 	bl	11cc <memset>
    cmd->type = LIST;
     5e8:	e51b3008 	ldr	r3, [fp, #-8]
     5ec:	e3a02004 	mov	r2, #4
     5f0:	e5832000 	str	r2, [r3]
    cmd->left = left;
     5f4:	e51b3008 	ldr	r3, [fp, #-8]
     5f8:	e51b2010 	ldr	r2, [fp, #-16]
     5fc:	e5832004 	str	r2, [r3, #4]
    cmd->right = right;
     600:	e51b3008 	ldr	r3, [fp, #-8]
     604:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     608:	e5832008 	str	r2, [r3, #8]
    return (struct cmd*)cmd;
     60c:	e51b3008 	ldr	r3, [fp, #-8]
}
     610:	e1a00003 	mov	r0, r3
     614:	e24bd004 	sub	sp, fp, #4
     618:	e8bd8800 	pop	{fp, pc}

0000061c <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     61c:	e92d4800 	push	{fp, lr}
     620:	e28db004 	add	fp, sp, #4
     624:	e24dd010 	sub	sp, sp, #16
     628:	e50b0010 	str	r0, [fp, #-16]
    struct backcmd *cmd;
    
    cmd = malloc(sizeof(*cmd));
     62c:	e3a00008 	mov	r0, #8
     630:	eb00060f 	bl	1e74 <malloc>
     634:	e50b0008 	str	r0, [fp, #-8]
    memset(cmd, 0, sizeof(*cmd));
     638:	e51b0008 	ldr	r0, [fp, #-8]
     63c:	e3a01000 	mov	r1, #0
     640:	e3a02008 	mov	r2, #8
     644:	eb0002e0 	bl	11cc <memset>
    cmd->type = BACK;
     648:	e51b3008 	ldr	r3, [fp, #-8]
     64c:	e3a02005 	mov	r2, #5
     650:	e5832000 	str	r2, [r3]
    cmd->cmd = subcmd;
     654:	e51b3008 	ldr	r3, [fp, #-8]
     658:	e51b2010 	ldr	r2, [fp, #-16]
     65c:	e5832004 	str	r2, [r3, #4]
    return (struct cmd*)cmd;
     660:	e51b3008 	ldr	r3, [fp, #-8]
}
     664:	e1a00003 	mov	r0, r3
     668:	e24bd004 	sub	sp, fp, #4
     66c:	e8bd8800 	pop	{fp, pc}

00000670 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     670:	e92d4800 	push	{fp, lr}
     674:	e28db004 	add	fp, sp, #4
     678:	e24dd018 	sub	sp, sp, #24
     67c:	e50b0010 	str	r0, [fp, #-16]
     680:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     684:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
     688:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    char *s;
    int ret;
    
    s = *ps;
     68c:	e51b3010 	ldr	r3, [fp, #-16]
     690:	e5933000 	ldr	r3, [r3]
     694:	e50b3008 	str	r3, [fp, #-8]
    while(s < es && strchr(whitespace, *s))
     698:	ea000002 	b	6a8 <gettoken+0x38>
        s++;
     69c:	e51b3008 	ldr	r3, [fp, #-8]
     6a0:	e2833001 	add	r3, r3, #1
     6a4:	e50b3008 	str	r3, [fp, #-8]
{
    char *s;
    int ret;
    
    s = *ps;
    while(s < es && strchr(whitespace, *s))
     6a8:	e51b2008 	ldr	r2, [fp, #-8]
     6ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     6b0:	e1520003 	cmp	r2, r3
     6b4:	2a000008 	bcs	6dc <gettoken+0x6c>
     6b8:	e51b3008 	ldr	r3, [fp, #-8]
     6bc:	e5d33000 	ldrb	r3, [r3]
     6c0:	e30201f8 	movw	r0, #8696	; 0x21f8
     6c4:	e3400000 	movt	r0, #0
     6c8:	e1a01003 	mov	r1, r3
     6cc:	eb000307 	bl	12f0 <strchr>
     6d0:	e1a03000 	mov	r3, r0
     6d4:	e3530000 	cmp	r3, #0
     6d8:	1affffef 	bne	69c <gettoken+0x2c>
        s++;
    if(q)
     6dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     6e0:	e3530000 	cmp	r3, #0
     6e4:	0a000002 	beq	6f4 <gettoken+0x84>
        *q = s;
     6e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     6ec:	e51b2008 	ldr	r2, [fp, #-8]
     6f0:	e5832000 	str	r2, [r3]
    ret = *s;
     6f4:	e51b3008 	ldr	r3, [fp, #-8]
     6f8:	e5d33000 	ldrb	r3, [r3]
     6fc:	e50b300c 	str	r3, [fp, #-12]
    switch(*s){
     700:	e51b3008 	ldr	r3, [fp, #-8]
     704:	e5d33000 	ldrb	r3, [r3]
     708:	e353003c 	cmp	r3, #60	; 0x3c
     70c:	ca00000a 	bgt	73c <gettoken+0xcc>
     710:	e353003b 	cmp	r3, #59	; 0x3b
     714:	aa00000c 	bge	74c <gettoken+0xdc>
     718:	e3530029 	cmp	r3, #41	; 0x29
     71c:	ca00001b 	bgt	790 <gettoken+0x120>
     720:	e3530028 	cmp	r3, #40	; 0x28
     724:	aa000008 	bge	74c <gettoken+0xdc>
     728:	e3530000 	cmp	r3, #0
     72c:	0a000034 	beq	804 <gettoken+0x194>
     730:	e3530026 	cmp	r3, #38	; 0x26
     734:	0a000004 	beq	74c <gettoken+0xdc>
     738:	ea000014 	b	790 <gettoken+0x120>
     73c:	e353003e 	cmp	r3, #62	; 0x3e
     740:	0a000005 	beq	75c <gettoken+0xec>
     744:	e353007c 	cmp	r3, #124	; 0x7c
     748:	1a000010 	bne	790 <gettoken+0x120>
        case '(':
        case ')':
        case ';':
        case '&':
        case '<':
            s++;
     74c:	e51b3008 	ldr	r3, [fp, #-8]
     750:	e2833001 	add	r3, r3, #1
     754:	e50b3008 	str	r3, [fp, #-8]
            break;
     758:	ea00002e 	b	818 <gettoken+0x1a8>
        case '>':
            s++;
     75c:	e51b3008 	ldr	r3, [fp, #-8]
     760:	e2833001 	add	r3, r3, #1
     764:	e50b3008 	str	r3, [fp, #-8]
            if(*s == '>'){
     768:	e51b3008 	ldr	r3, [fp, #-8]
     76c:	e5d33000 	ldrb	r3, [r3]
     770:	e353003e 	cmp	r3, #62	; 0x3e
     774:	1a000024 	bne	80c <gettoken+0x19c>
                ret = '+';
     778:	e3a0302b 	mov	r3, #43	; 0x2b
     77c:	e50b300c 	str	r3, [fp, #-12]
                s++;
     780:	e51b3008 	ldr	r3, [fp, #-8]
     784:	e2833001 	add	r3, r3, #1
     788:	e50b3008 	str	r3, [fp, #-8]
            }
            break;
     78c:	ea00001e 	b	80c <gettoken+0x19c>
        default:
            ret = 'a';
     790:	e3a03061 	mov	r3, #97	; 0x61
     794:	e50b300c 	str	r3, [fp, #-12]
            while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     798:	ea000002 	b	7a8 <gettoken+0x138>
                s++;
     79c:	e51b3008 	ldr	r3, [fp, #-8]
     7a0:	e2833001 	add	r3, r3, #1
     7a4:	e50b3008 	str	r3, [fp, #-8]
                s++;
            }
            break;
        default:
            ret = 'a';
            while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7a8:	e51b2008 	ldr	r2, [fp, #-8]
     7ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     7b0:	e1520003 	cmp	r2, r3
     7b4:	2a000016 	bcs	814 <gettoken+0x1a4>
     7b8:	e51b3008 	ldr	r3, [fp, #-8]
     7bc:	e5d33000 	ldrb	r3, [r3]
     7c0:	e30201f8 	movw	r0, #8696	; 0x21f8
     7c4:	e3400000 	movt	r0, #0
     7c8:	e1a01003 	mov	r1, r3
     7cc:	eb0002c7 	bl	12f0 <strchr>
     7d0:	e1a03000 	mov	r3, r0
     7d4:	e3530000 	cmp	r3, #0
     7d8:	1a00000d 	bne	814 <gettoken+0x1a4>
     7dc:	e51b3008 	ldr	r3, [fp, #-8]
     7e0:	e5d33000 	ldrb	r3, [r3]
     7e4:	e3020200 	movw	r0, #8704	; 0x2200
     7e8:	e3400000 	movt	r0, #0
     7ec:	e1a01003 	mov	r1, r3
     7f0:	eb0002be 	bl	12f0 <strchr>
     7f4:	e1a03000 	mov	r3, r0
     7f8:	e3530000 	cmp	r3, #0
     7fc:	0affffe6 	beq	79c <gettoken+0x12c>
                s++;
            break;
     800:	ea000003 	b	814 <gettoken+0x1a4>
    if(q)
        *q = s;
    ret = *s;
    switch(*s){
        case 0:
            break;
     804:	e1a00000 	nop			; (mov r0, r0)
     808:	ea000002 	b	818 <gettoken+0x1a8>
            s++;
            if(*s == '>'){
                ret = '+';
                s++;
            }
            break;
     80c:	e1a00000 	nop			; (mov r0, r0)
     810:	ea000000 	b	818 <gettoken+0x1a8>
        default:
            ret = 'a';
            while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
                s++;
            break;
     814:	e1a00000 	nop			; (mov r0, r0)
    }
    if(eq)
     818:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     81c:	e3530000 	cmp	r3, #0
     820:	0a000006 	beq	840 <gettoken+0x1d0>
        *eq = s;
     824:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     828:	e51b2008 	ldr	r2, [fp, #-8]
     82c:	e5832000 	str	r2, [r3]
    
    while(s < es && strchr(whitespace, *s))
     830:	ea000002 	b	840 <gettoken+0x1d0>
        s++;
     834:	e51b3008 	ldr	r3, [fp, #-8]
     838:	e2833001 	add	r3, r3, #1
     83c:	e50b3008 	str	r3, [fp, #-8]
            break;
    }
    if(eq)
        *eq = s;
    
    while(s < es && strchr(whitespace, *s))
     840:	e51b2008 	ldr	r2, [fp, #-8]
     844:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     848:	e1520003 	cmp	r2, r3
     84c:	2a000008 	bcs	874 <gettoken+0x204>
     850:	e51b3008 	ldr	r3, [fp, #-8]
     854:	e5d33000 	ldrb	r3, [r3]
     858:	e30201f8 	movw	r0, #8696	; 0x21f8
     85c:	e3400000 	movt	r0, #0
     860:	e1a01003 	mov	r1, r3
     864:	eb0002a1 	bl	12f0 <strchr>
     868:	e1a03000 	mov	r3, r0
     86c:	e3530000 	cmp	r3, #0
     870:	1affffef 	bne	834 <gettoken+0x1c4>
        s++;
    *ps = s;
     874:	e51b3010 	ldr	r3, [fp, #-16]
     878:	e51b2008 	ldr	r2, [fp, #-8]
     87c:	e5832000 	str	r2, [r3]
    return ret;
     880:	e51b300c 	ldr	r3, [fp, #-12]
}
     884:	e1a00003 	mov	r0, r3
     888:	e24bd004 	sub	sp, fp, #4
     88c:	e8bd8800 	pop	{fp, pc}

00000890 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     890:	e92d4800 	push	{fp, lr}
     894:	e28db004 	add	fp, sp, #4
     898:	e24dd018 	sub	sp, sp, #24
     89c:	e50b0010 	str	r0, [fp, #-16]
     8a0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     8a4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *s;
    
    s = *ps;
     8a8:	e51b3010 	ldr	r3, [fp, #-16]
     8ac:	e5933000 	ldr	r3, [r3]
     8b0:	e50b3008 	str	r3, [fp, #-8]
    while(s < es && strchr(whitespace, *s))
     8b4:	ea000002 	b	8c4 <peek+0x34>
        s++;
     8b8:	e51b3008 	ldr	r3, [fp, #-8]
     8bc:	e2833001 	add	r3, r3, #1
     8c0:	e50b3008 	str	r3, [fp, #-8]
peek(char **ps, char *es, char *toks)
{
    char *s;
    
    s = *ps;
    while(s < es && strchr(whitespace, *s))
     8c4:	e51b2008 	ldr	r2, [fp, #-8]
     8c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     8cc:	e1520003 	cmp	r2, r3
     8d0:	2a000008 	bcs	8f8 <peek+0x68>
     8d4:	e51b3008 	ldr	r3, [fp, #-8]
     8d8:	e5d33000 	ldrb	r3, [r3]
     8dc:	e30201f8 	movw	r0, #8696	; 0x21f8
     8e0:	e3400000 	movt	r0, #0
     8e4:	e1a01003 	mov	r1, r3
     8e8:	eb000280 	bl	12f0 <strchr>
     8ec:	e1a03000 	mov	r3, r0
     8f0:	e3530000 	cmp	r3, #0
     8f4:	1affffef 	bne	8b8 <peek+0x28>
        s++;
    *ps = s;
     8f8:	e51b3010 	ldr	r3, [fp, #-16]
     8fc:	e51b2008 	ldr	r2, [fp, #-8]
     900:	e5832000 	str	r2, [r3]
    return *s && strchr(toks, *s);
     904:	e51b3008 	ldr	r3, [fp, #-8]
     908:	e5d33000 	ldrb	r3, [r3]
     90c:	e3530000 	cmp	r3, #0
     910:	0a000009 	beq	93c <peek+0xac>
     914:	e51b3008 	ldr	r3, [fp, #-8]
     918:	e5d33000 	ldrb	r3, [r3]
     91c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     920:	e1a01003 	mov	r1, r3
     924:	eb000271 	bl	12f0 <strchr>
     928:	e1a03000 	mov	r3, r0
     92c:	e3530000 	cmp	r3, #0
     930:	0a000001 	beq	93c <peek+0xac>
     934:	e3a03001 	mov	r3, #1
     938:	ea000000 	b	940 <peek+0xb0>
     93c:	e3a03000 	mov	r3, #0
}
     940:	e1a00003 	mov	r0, r3
     944:	e24bd004 	sub	sp, fp, #4
     948:	e8bd8800 	pop	{fp, pc}

0000094c <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     94c:	e92d4810 	push	{r4, fp, lr}
     950:	e28db008 	add	fp, sp, #8
     954:	e24dd014 	sub	sp, sp, #20
     958:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    char *es;
    struct cmd *cmd;
    
    es = s + strlen(s);
     95c:	e51b4018 	ldr	r4, [fp, #-24]	; 0xffffffe8
     960:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     964:	e1a00003 	mov	r0, r3
     968:	eb000202 	bl	1178 <strlen>
     96c:	e1a03000 	mov	r3, r0
     970:	e0843003 	add	r3, r4, r3
     974:	e50b3010 	str	r3, [fp, #-16]
    cmd = parseline(&s, es);
     978:	e24b3018 	sub	r3, fp, #24
     97c:	e1a00003 	mov	r0, r3
     980:	e51b1010 	ldr	r1, [fp, #-16]
     984:	eb000019 	bl	9f0 <parseline>
     988:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    peek(&s, es, "");
     98c:	e24b3018 	sub	r3, fp, #24
     990:	e1a00003 	mov	r0, r3
     994:	e51b1010 	ldr	r1, [fp, #-16]
     998:	e3022164 	movw	r2, #8548	; 0x2164
     99c:	e3402000 	movt	r2, #0
     9a0:	ebffffba 	bl	890 <peek>
    if(s != es){
     9a4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     9a8:	e51b3010 	ldr	r3, [fp, #-16]
     9ac:	e1520003 	cmp	r2, r3
     9b0:	0a000008 	beq	9d8 <parsecmd+0x8c>
        printf(2, "leftovers: %s\n", s);
     9b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     9b8:	e3a00002 	mov	r0, #2
     9bc:	e3021168 	movw	r1, #8552	; 0x2168
     9c0:	e3401000 	movt	r1, #0
     9c4:	e1a02003 	mov	r2, r3
     9c8:	eb000419 	bl	1a34 <printf>
        panic("syntax");
     9cc:	e3020178 	movw	r0, #8568	; 0x2178
     9d0:	e3400000 	movt	r0, #0
     9d4:	ebfffe90 	bl	41c <panic>
    }
    nulterminate(cmd);
     9d8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     9dc:	eb000148 	bl	f04 <nulterminate>
    return cmd;
     9e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
}
     9e4:	e1a00003 	mov	r0, r3
     9e8:	e24bd008 	sub	sp, fp, #8
     9ec:	e8bd8810 	pop	{r4, fp, pc}

000009f0 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     9f0:	e92d4800 	push	{fp, lr}
     9f4:	e28db004 	add	fp, sp, #4
     9f8:	e24dd010 	sub	sp, sp, #16
     9fc:	e50b0010 	str	r0, [fp, #-16]
     a00:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct cmd *cmd;
    
    cmd = parsepipe(ps, es);
     a04:	e51b0010 	ldr	r0, [fp, #-16]
     a08:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     a0c:	eb00002a 	bl	abc <parsepipe>
     a10:	e50b0008 	str	r0, [fp, #-8]
    while(peek(ps, es, "&")){
     a14:	ea000007 	b	a38 <parseline+0x48>
        gettoken(ps, es, 0, 0);
     a18:	e51b0010 	ldr	r0, [fp, #-16]
     a1c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     a20:	e3a02000 	mov	r2, #0
     a24:	e3a03000 	mov	r3, #0
     a28:	ebffff10 	bl	670 <gettoken>
        cmd = backcmd(cmd);
     a2c:	e51b0008 	ldr	r0, [fp, #-8]
     a30:	ebfffef9 	bl	61c <backcmd>
     a34:	e50b0008 	str	r0, [fp, #-8]
parseline(char **ps, char *es)
{
    struct cmd *cmd;
    
    cmd = parsepipe(ps, es);
    while(peek(ps, es, "&")){
     a38:	e51b0010 	ldr	r0, [fp, #-16]
     a3c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     a40:	e3022180 	movw	r2, #8576	; 0x2180
     a44:	e3402000 	movt	r2, #0
     a48:	ebffff90 	bl	890 <peek>
     a4c:	e1a03000 	mov	r3, r0
     a50:	e3530000 	cmp	r3, #0
     a54:	1affffef 	bne	a18 <parseline+0x28>
        gettoken(ps, es, 0, 0);
        cmd = backcmd(cmd);
    }
    if(peek(ps, es, ";")){
     a58:	e51b0010 	ldr	r0, [fp, #-16]
     a5c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     a60:	e3022184 	movw	r2, #8580	; 0x2184
     a64:	e3402000 	movt	r2, #0
     a68:	ebffff88 	bl	890 <peek>
     a6c:	e1a03000 	mov	r3, r0
     a70:	e3530000 	cmp	r3, #0
     a74:	0a00000c 	beq	aac <parseline+0xbc>
        gettoken(ps, es, 0, 0);
     a78:	e51b0010 	ldr	r0, [fp, #-16]
     a7c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     a80:	e3a02000 	mov	r2, #0
     a84:	e3a03000 	mov	r3, #0
     a88:	ebfffef8 	bl	670 <gettoken>
        cmd = listcmd(cmd, parseline(ps, es));
     a8c:	e51b0010 	ldr	r0, [fp, #-16]
     a90:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     a94:	ebffffd5 	bl	9f0 <parseline>
     a98:	e1a03000 	mov	r3, r0
     a9c:	e51b0008 	ldr	r0, [fp, #-8]
     aa0:	e1a01003 	mov	r1, r3
     aa4:	ebfffec3 	bl	5b8 <listcmd>
     aa8:	e50b0008 	str	r0, [fp, #-8]
    }
    return cmd;
     aac:	e51b3008 	ldr	r3, [fp, #-8]
}
     ab0:	e1a00003 	mov	r0, r3
     ab4:	e24bd004 	sub	sp, fp, #4
     ab8:	e8bd8800 	pop	{fp, pc}

00000abc <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     abc:	e92d4800 	push	{fp, lr}
     ac0:	e28db004 	add	fp, sp, #4
     ac4:	e24dd010 	sub	sp, sp, #16
     ac8:	e50b0010 	str	r0, [fp, #-16]
     acc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct cmd *cmd;
    
    cmd = parseexec(ps, es);
     ad0:	e51b0010 	ldr	r0, [fp, #-16]
     ad4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     ad8:	eb000099 	bl	d44 <parseexec>
     adc:	e50b0008 	str	r0, [fp, #-8]
    if(peek(ps, es, "|")){
     ae0:	e51b0010 	ldr	r0, [fp, #-16]
     ae4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     ae8:	e3022188 	movw	r2, #8584	; 0x2188
     aec:	e3402000 	movt	r2, #0
     af0:	ebffff66 	bl	890 <peek>
     af4:	e1a03000 	mov	r3, r0
     af8:	e3530000 	cmp	r3, #0
     afc:	0a00000c 	beq	b34 <parsepipe+0x78>
        gettoken(ps, es, 0, 0);
     b00:	e51b0010 	ldr	r0, [fp, #-16]
     b04:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     b08:	e3a02000 	mov	r2, #0
     b0c:	e3a03000 	mov	r3, #0
     b10:	ebfffed6 	bl	670 <gettoken>
        cmd = pipecmd(cmd, parsepipe(ps, es));
     b14:	e51b0010 	ldr	r0, [fp, #-16]
     b18:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     b1c:	ebffffe6 	bl	abc <parsepipe>
     b20:	e1a03000 	mov	r3, r0
     b24:	e51b0008 	ldr	r0, [fp, #-8]
     b28:	e1a01003 	mov	r1, r3
     b2c:	ebfffe88 	bl	554 <pipecmd>
     b30:	e50b0008 	str	r0, [fp, #-8]
    }
    return cmd;
     b34:	e51b3008 	ldr	r3, [fp, #-8]
}
     b38:	e1a00003 	mov	r0, r3
     b3c:	e24bd004 	sub	sp, fp, #4
     b40:	e8bd8800 	pop	{fp, pc}

00000b44 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     b44:	e92d4800 	push	{fp, lr}
     b48:	e28db004 	add	fp, sp, #4
     b4c:	e24dd028 	sub	sp, sp, #40	; 0x28
     b50:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
     b54:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
     b58:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    int tok;
    char *q, *eq;
    
    while(peek(ps, es, "<>")){
     b5c:	ea00003a 	b	c4c <parseredirs+0x108>
        tok = gettoken(ps, es, 0, 0);
     b60:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     b64:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
     b68:	e3a02000 	mov	r2, #0
     b6c:	e3a03000 	mov	r3, #0
     b70:	ebfffebe 	bl	670 <gettoken>
     b74:	e50b0008 	str	r0, [fp, #-8]
        if(gettoken(ps, es, &q, &eq) != 'a')
     b78:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     b7c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
     b80:	e24b300c 	sub	r3, fp, #12
     b84:	e1a02003 	mov	r2, r3
     b88:	e24b3010 	sub	r3, fp, #16
     b8c:	ebfffeb7 	bl	670 <gettoken>
     b90:	e1a03000 	mov	r3, r0
     b94:	e3530061 	cmp	r3, #97	; 0x61
     b98:	0a000002 	beq	ba8 <parseredirs+0x64>
            panic("missing file for redirection");
     b9c:	e302018c 	movw	r0, #8588	; 0x218c
     ba0:	e3400000 	movt	r0, #0
     ba4:	ebfffe1c 	bl	41c <panic>
        switch(tok){
     ba8:	e51b3008 	ldr	r3, [fp, #-8]
     bac:	e353003c 	cmp	r3, #60	; 0x3c
     bb0:	0a000004 	beq	bc8 <parseredirs+0x84>
     bb4:	e353003e 	cmp	r3, #62	; 0x3e
     bb8:	0a00000d 	beq	bf4 <parseredirs+0xb0>
     bbc:	e353002b 	cmp	r3, #43	; 0x2b
     bc0:	0a000016 	beq	c20 <parseredirs+0xdc>
     bc4:	ea000020 	b	c4c <parseredirs+0x108>
            case '<':
                cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     bc8:	e51b200c 	ldr	r2, [fp, #-12]
     bcc:	e51b3010 	ldr	r3, [fp, #-16]
     bd0:	e3a01000 	mov	r1, #0
     bd4:	e58d1000 	str	r1, [sp]
     bd8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     bdc:	e1a01002 	mov	r1, r2
     be0:	e1a02003 	mov	r2, r3
     be4:	e3a03000 	mov	r3, #0
     be8:	ebfffe35 	bl	4c4 <redircmd>
     bec:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
                break;
     bf0:	ea000015 	b	c4c <parseredirs+0x108>
            case '>':
                cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     bf4:	e51b200c 	ldr	r2, [fp, #-12]
     bf8:	e51b3010 	ldr	r3, [fp, #-16]
     bfc:	e3a01001 	mov	r1, #1
     c00:	e58d1000 	str	r1, [sp]
     c04:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     c08:	e1a01002 	mov	r1, r2
     c0c:	e1a02003 	mov	r2, r3
     c10:	e3003201 	movw	r3, #513	; 0x201
     c14:	ebfffe2a 	bl	4c4 <redircmd>
     c18:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
                break;
     c1c:	ea00000a 	b	c4c <parseredirs+0x108>
            case '+':  // >>
                cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     c20:	e51b200c 	ldr	r2, [fp, #-12]
     c24:	e51b3010 	ldr	r3, [fp, #-16]
     c28:	e3a01001 	mov	r1, #1
     c2c:	e58d1000 	str	r1, [sp]
     c30:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     c34:	e1a01002 	mov	r1, r2
     c38:	e1a02003 	mov	r2, r3
     c3c:	e3003201 	movw	r3, #513	; 0x201
     c40:	ebfffe1f 	bl	4c4 <redircmd>
     c44:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
                break;
     c48:	e1a00000 	nop			; (mov r0, r0)
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    int tok;
    char *q, *eq;
    
    while(peek(ps, es, "<>")){
     c4c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     c50:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
     c54:	e30221ac 	movw	r2, #8620	; 0x21ac
     c58:	e3402000 	movt	r2, #0
     c5c:	ebffff0b 	bl	890 <peek>
     c60:	e1a03000 	mov	r3, r0
     c64:	e3530000 	cmp	r3, #0
     c68:	1affffbc 	bne	b60 <parseredirs+0x1c>
            case '+':  // >>
                cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
                break;
        }
    }
    return cmd;
     c6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
     c70:	e1a00003 	mov	r0, r3
     c74:	e24bd004 	sub	sp, fp, #4
     c78:	e8bd8800 	pop	{fp, pc}

00000c7c <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     c7c:	e92d4800 	push	{fp, lr}
     c80:	e28db004 	add	fp, sp, #4
     c84:	e24dd010 	sub	sp, sp, #16
     c88:	e50b0010 	str	r0, [fp, #-16]
     c8c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct cmd *cmd;
    
    if(!peek(ps, es, "("))
     c90:	e51b0010 	ldr	r0, [fp, #-16]
     c94:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     c98:	e30221b0 	movw	r2, #8624	; 0x21b0
     c9c:	e3402000 	movt	r2, #0
     ca0:	ebfffefa 	bl	890 <peek>
     ca4:	e1a03000 	mov	r3, r0
     ca8:	e3530000 	cmp	r3, #0
     cac:	1a000002 	bne	cbc <parseblock+0x40>
        panic("parseblock");
     cb0:	e30201b4 	movw	r0, #8628	; 0x21b4
     cb4:	e3400000 	movt	r0, #0
     cb8:	ebfffdd7 	bl	41c <panic>
    gettoken(ps, es, 0, 0);
     cbc:	e51b0010 	ldr	r0, [fp, #-16]
     cc0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     cc4:	e3a02000 	mov	r2, #0
     cc8:	e3a03000 	mov	r3, #0
     ccc:	ebfffe67 	bl	670 <gettoken>
    cmd = parseline(ps, es);
     cd0:	e51b0010 	ldr	r0, [fp, #-16]
     cd4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     cd8:	ebffff44 	bl	9f0 <parseline>
     cdc:	e50b0008 	str	r0, [fp, #-8]
    if(!peek(ps, es, ")"))
     ce0:	e51b0010 	ldr	r0, [fp, #-16]
     ce4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     ce8:	e30221c0 	movw	r2, #8640	; 0x21c0
     cec:	e3402000 	movt	r2, #0
     cf0:	ebfffee6 	bl	890 <peek>
     cf4:	e1a03000 	mov	r3, r0
     cf8:	e3530000 	cmp	r3, #0
     cfc:	1a000002 	bne	d0c <parseblock+0x90>
        panic("syntax - missing )");
     d00:	e30201c4 	movw	r0, #8644	; 0x21c4
     d04:	e3400000 	movt	r0, #0
     d08:	ebfffdc3 	bl	41c <panic>
    gettoken(ps, es, 0, 0);
     d0c:	e51b0010 	ldr	r0, [fp, #-16]
     d10:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     d14:	e3a02000 	mov	r2, #0
     d18:	e3a03000 	mov	r3, #0
     d1c:	ebfffe53 	bl	670 <gettoken>
    cmd = parseredirs(cmd, ps, es);
     d20:	e51b0008 	ldr	r0, [fp, #-8]
     d24:	e51b1010 	ldr	r1, [fp, #-16]
     d28:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     d2c:	ebffff84 	bl	b44 <parseredirs>
     d30:	e50b0008 	str	r0, [fp, #-8]
    return cmd;
     d34:	e51b3008 	ldr	r3, [fp, #-8]
}
     d38:	e1a00003 	mov	r0, r3
     d3c:	e24bd004 	sub	sp, fp, #4
     d40:	e8bd8800 	pop	{fp, pc}

00000d44 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     d44:	e92d4800 	push	{fp, lr}
     d48:	e28db004 	add	fp, sp, #4
     d4c:	e24dd020 	sub	sp, sp, #32
     d50:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
     d54:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    char *q, *eq;
    int tok, argc;
    struct execcmd *cmd;
    struct cmd *ret;
    
    if(peek(ps, es, "("))
     d58:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     d5c:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     d60:	e30221b0 	movw	r2, #8624	; 0x21b0
     d64:	e3402000 	movt	r2, #0
     d68:	ebfffec8 	bl	890 <peek>
     d6c:	e1a03000 	mov	r3, r0
     d70:	e3530000 	cmp	r3, #0
     d74:	0a000004 	beq	d8c <parseexec+0x48>
        return parseblock(ps, es);
     d78:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     d7c:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     d80:	ebffffbd 	bl	c7c <parseblock>
     d84:	e1a03000 	mov	r3, r0
     d88:	ea00005a 	b	ef8 <parseexec+0x1b4>
    
    ret = execcmd();
     d8c:	ebfffdbb 	bl	480 <execcmd>
     d90:	e50b000c 	str	r0, [fp, #-12]
    cmd = (struct execcmd*)ret;
     d94:	e51b300c 	ldr	r3, [fp, #-12]
     d98:	e50b3010 	str	r3, [fp, #-16]
    
    argc = 0;
     d9c:	e3a03000 	mov	r3, #0
     da0:	e50b3008 	str	r3, [fp, #-8]
    ret = parseredirs(ret, ps, es);
     da4:	e51b000c 	ldr	r0, [fp, #-12]
     da8:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
     dac:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
     db0:	ebffff63 	bl	b44 <parseredirs>
     db4:	e50b000c 	str	r0, [fp, #-12]
    while(!peek(ps, es, "|)&;")){
     db8:	ea000030 	b	e80 <parseexec+0x13c>
        if((tok=gettoken(ps, es, &q, &eq)) == 0)
     dbc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     dc0:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     dc4:	e24b3018 	sub	r3, fp, #24
     dc8:	e1a02003 	mov	r2, r3
     dcc:	e24b301c 	sub	r3, fp, #28
     dd0:	ebfffe26 	bl	670 <gettoken>
     dd4:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
     dd8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     ddc:	e3530000 	cmp	r3, #0
     de0:	0a00002f 	beq	ea4 <parseexec+0x160>
            break;
        if(tok != 'a')
     de4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     de8:	e3530061 	cmp	r3, #97	; 0x61
     dec:	0a000002 	beq	dfc <parseexec+0xb8>
            panic("syntax");
     df0:	e3020178 	movw	r0, #8568	; 0x2178
     df4:	e3400000 	movt	r0, #0
     df8:	ebfffd87 	bl	41c <panic>
        cmd->argv[argc] = q;
     dfc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     e00:	e51b1010 	ldr	r1, [fp, #-16]
     e04:	e51b3008 	ldr	r3, [fp, #-8]
     e08:	e3a00004 	mov	r0, #4
     e0c:	e1a03103 	lsl	r3, r3, #2
     e10:	e0811003 	add	r1, r1, r3
     e14:	e1a03000 	mov	r3, r0
     e18:	e0813003 	add	r3, r1, r3
     e1c:	e5832000 	str	r2, [r3]
        cmd->eargv[argc] = eq;
     e20:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
     e24:	e51b1010 	ldr	r1, [fp, #-16]
     e28:	e51b3008 	ldr	r3, [fp, #-8]
     e2c:	e283300a 	add	r3, r3, #10
     e30:	e3a00004 	mov	r0, #4
     e34:	e1a03103 	lsl	r3, r3, #2
     e38:	e0811003 	add	r1, r1, r3
     e3c:	e1a03000 	mov	r3, r0
     e40:	e0813003 	add	r3, r1, r3
     e44:	e5832000 	str	r2, [r3]
        argc++;
     e48:	e51b3008 	ldr	r3, [fp, #-8]
     e4c:	e2833001 	add	r3, r3, #1
     e50:	e50b3008 	str	r3, [fp, #-8]
        if(argc >= MAXARGS)
     e54:	e51b3008 	ldr	r3, [fp, #-8]
     e58:	e3530009 	cmp	r3, #9
     e5c:	da000002 	ble	e6c <parseexec+0x128>
            panic("too many args");
     e60:	e30201d8 	movw	r0, #8664	; 0x21d8
     e64:	e3400000 	movt	r0, #0
     e68:	ebfffd6b 	bl	41c <panic>
        ret = parseredirs(ret, ps, es);
     e6c:	e51b000c 	ldr	r0, [fp, #-12]
     e70:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
     e74:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
     e78:	ebffff31 	bl	b44 <parseredirs>
     e7c:	e50b000c 	str	r0, [fp, #-12]
    ret = execcmd();
    cmd = (struct execcmd*)ret;
    
    argc = 0;
    ret = parseredirs(ret, ps, es);
    while(!peek(ps, es, "|)&;")){
     e80:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     e84:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     e88:	e30221e8 	movw	r2, #8680	; 0x21e8
     e8c:	e3402000 	movt	r2, #0
     e90:	ebfffe7e 	bl	890 <peek>
     e94:	e1a03000 	mov	r3, r0
     e98:	e3530000 	cmp	r3, #0
     e9c:	0affffc6 	beq	dbc <parseexec+0x78>
     ea0:	ea000000 	b	ea8 <parseexec+0x164>
        if((tok=gettoken(ps, es, &q, &eq)) == 0)
            break;
     ea4:	e1a00000 	nop			; (mov r0, r0)
        argc++;
        if(argc >= MAXARGS)
            panic("too many args");
        ret = parseredirs(ret, ps, es);
    }
    cmd->argv[argc] = 0;
     ea8:	e51b2010 	ldr	r2, [fp, #-16]
     eac:	e51b3008 	ldr	r3, [fp, #-8]
     eb0:	e3a01004 	mov	r1, #4
     eb4:	e1a03103 	lsl	r3, r3, #2
     eb8:	e0822003 	add	r2, r2, r3
     ebc:	e1a03001 	mov	r3, r1
     ec0:	e0823003 	add	r3, r2, r3
     ec4:	e3a02000 	mov	r2, #0
     ec8:	e5832000 	str	r2, [r3]
    cmd->eargv[argc] = 0;
     ecc:	e51b2010 	ldr	r2, [fp, #-16]
     ed0:	e51b3008 	ldr	r3, [fp, #-8]
     ed4:	e283300a 	add	r3, r3, #10
     ed8:	e3a01004 	mov	r1, #4
     edc:	e1a03103 	lsl	r3, r3, #2
     ee0:	e0822003 	add	r2, r2, r3
     ee4:	e1a03001 	mov	r3, r1
     ee8:	e0823003 	add	r3, r2, r3
     eec:	e3a02000 	mov	r2, #0
     ef0:	e5832000 	str	r2, [r3]
    return ret;
     ef4:	e51b300c 	ldr	r3, [fp, #-12]
}
     ef8:	e1a00003 	mov	r0, r3
     efc:	e24bd004 	sub	sp, fp, #4
     f00:	e8bd8800 	pop	{fp, pc}

00000f04 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     f04:	e92d4800 	push	{fp, lr}
     f08:	e28db004 	add	fp, sp, #4
     f0c:	e24dd020 	sub	sp, sp, #32
     f10:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    struct execcmd *ecmd;
    struct listcmd *lcmd;
    struct pipecmd *pcmd;
    struct redircmd *rcmd;
    
    if(cmd == 0)
     f14:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     f18:	e3530000 	cmp	r3, #0
     f1c:	1a000001 	bne	f28 <nulterminate+0x24>
        return 0;
     f20:	e3a03000 	mov	r3, #0
     f24:	ea000051 	b	1070 <nulterminate+0x16c>
    
    switch(cmd->type){
     f28:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     f2c:	e5933000 	ldr	r3, [r3]
     f30:	e2433001 	sub	r3, r3, #1
     f34:	e3530004 	cmp	r3, #4
     f38:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     f3c:	ea00004a 	b	106c <nulterminate+0x168>
     f40:	00000f54 	.word	0x00000f54
     f44:	00000fcc 	.word	0x00000fcc
     f48:	00000ff8 	.word	0x00000ff8
     f4c:	00001024 	.word	0x00001024
     f50:	00001050 	.word	0x00001050
        case EXEC:
            ecmd = (struct execcmd*)cmd;
     f54:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     f58:	e50b300c 	str	r3, [fp, #-12]
            for(i=0; ecmd->argv[i]; i++)
     f5c:	e3a03000 	mov	r3, #0
     f60:	e50b3008 	str	r3, [fp, #-8]
     f64:	ea00000d 	b	fa0 <nulterminate+0x9c>
                *ecmd->eargv[i] = 0;
     f68:	e51b200c 	ldr	r2, [fp, #-12]
     f6c:	e51b3008 	ldr	r3, [fp, #-8]
     f70:	e283300a 	add	r3, r3, #10
     f74:	e3a01004 	mov	r1, #4
     f78:	e1a03103 	lsl	r3, r3, #2
     f7c:	e0822003 	add	r2, r2, r3
     f80:	e1a03001 	mov	r3, r1
     f84:	e0823003 	add	r3, r2, r3
     f88:	e5933000 	ldr	r3, [r3]
     f8c:	e3a02000 	mov	r2, #0
     f90:	e5c32000 	strb	r2, [r3]
        return 0;
    
    switch(cmd->type){
        case EXEC:
            ecmd = (struct execcmd*)cmd;
            for(i=0; ecmd->argv[i]; i++)
     f94:	e51b3008 	ldr	r3, [fp, #-8]
     f98:	e2833001 	add	r3, r3, #1
     f9c:	e50b3008 	str	r3, [fp, #-8]
     fa0:	e51b200c 	ldr	r2, [fp, #-12]
     fa4:	e51b3008 	ldr	r3, [fp, #-8]
     fa8:	e3a01004 	mov	r1, #4
     fac:	e1a03103 	lsl	r3, r3, #2
     fb0:	e0822003 	add	r2, r2, r3
     fb4:	e1a03001 	mov	r3, r1
     fb8:	e0823003 	add	r3, r2, r3
     fbc:	e5933000 	ldr	r3, [r3]
     fc0:	e3530000 	cmp	r3, #0
     fc4:	1affffe7 	bne	f68 <nulterminate+0x64>
                *ecmd->eargv[i] = 0;
            break;
     fc8:	ea000027 	b	106c <nulterminate+0x168>
            
        case REDIR:
            rcmd = (struct redircmd*)cmd;
     fcc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     fd0:	e50b3010 	str	r3, [fp, #-16]
            nulterminate(rcmd->cmd);
     fd4:	e51b3010 	ldr	r3, [fp, #-16]
     fd8:	e5933004 	ldr	r3, [r3, #4]
     fdc:	e1a00003 	mov	r0, r3
     fe0:	ebffffc7 	bl	f04 <nulterminate>
            *rcmd->efile = 0;
     fe4:	e51b3010 	ldr	r3, [fp, #-16]
     fe8:	e593300c 	ldr	r3, [r3, #12]
     fec:	e3a02000 	mov	r2, #0
     ff0:	e5c32000 	strb	r2, [r3]
            break;
     ff4:	ea00001c 	b	106c <nulterminate+0x168>
            
        case PIPE:
            pcmd = (struct pipecmd*)cmd;
     ff8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     ffc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            nulterminate(pcmd->left);
    1000:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1004:	e5933004 	ldr	r3, [r3, #4]
    1008:	e1a00003 	mov	r0, r3
    100c:	ebffffbc 	bl	f04 <nulterminate>
            nulterminate(pcmd->right);
    1010:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1014:	e5933008 	ldr	r3, [r3, #8]
    1018:	e1a00003 	mov	r0, r3
    101c:	ebffffb8 	bl	f04 <nulterminate>
            break;
    1020:	ea000011 	b	106c <nulterminate+0x168>
            
        case LIST:
            lcmd = (struct listcmd*)cmd;
    1024:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    1028:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
            nulterminate(lcmd->left);
    102c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1030:	e5933004 	ldr	r3, [r3, #4]
    1034:	e1a00003 	mov	r0, r3
    1038:	ebffffb1 	bl	f04 <nulterminate>
            nulterminate(lcmd->right);
    103c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1040:	e5933008 	ldr	r3, [r3, #8]
    1044:	e1a00003 	mov	r0, r3
    1048:	ebffffad 	bl	f04 <nulterminate>
            break;
    104c:	ea000006 	b	106c <nulterminate+0x168>
            
        case BACK:
            bcmd = (struct backcmd*)cmd;
    1050:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    1054:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
            nulterminate(bcmd->cmd);
    1058:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    105c:	e5933004 	ldr	r3, [r3, #4]
    1060:	e1a00003 	mov	r0, r3
    1064:	ebffffa6 	bl	f04 <nulterminate>
            break;
    1068:	e1a00000 	nop			; (mov r0, r0)
    }
    return cmd;
    106c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
    1070:	e1a00003 	mov	r0, r3
    1074:	e24bd004 	sub	sp, fp, #4
    1078:	e8bd8800 	pop	{fp, pc}

0000107c <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
    107c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1080:	e28db000 	add	fp, sp, #0
    1084:	e24dd014 	sub	sp, sp, #20
    1088:	e50b0010 	str	r0, [fp, #-16]
    108c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
    1090:	e51b3010 	ldr	r3, [fp, #-16]
    1094:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
    1098:	e1a00000 	nop			; (mov r0, r0)
    109c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    10a0:	e5d32000 	ldrb	r2, [r3]
    10a4:	e51b3010 	ldr	r3, [fp, #-16]
    10a8:	e5c32000 	strb	r2, [r3]
    10ac:	e51b3010 	ldr	r3, [fp, #-16]
    10b0:	e5d33000 	ldrb	r3, [r3]
    10b4:	e3530000 	cmp	r3, #0
    10b8:	03a03000 	moveq	r3, #0
    10bc:	13a03001 	movne	r3, #1
    10c0:	e6ef3073 	uxtb	r3, r3
    10c4:	e51b2010 	ldr	r2, [fp, #-16]
    10c8:	e2822001 	add	r2, r2, #1
    10cc:	e50b2010 	str	r2, [fp, #-16]
    10d0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    10d4:	e2822001 	add	r2, r2, #1
    10d8:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
    10dc:	e3530000 	cmp	r3, #0
    10e0:	1affffed 	bne	109c <strcpy+0x20>
        ;
    return os;
    10e4:	e51b3008 	ldr	r3, [fp, #-8]
}
    10e8:	e1a00003 	mov	r0, r3
    10ec:	e28bd000 	add	sp, fp, #0
    10f0:	e8bd0800 	pop	{fp}
    10f4:	e12fff1e 	bx	lr

000010f8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    10fc:	e28db000 	add	fp, sp, #0
    1100:	e24dd00c 	sub	sp, sp, #12
    1104:	e50b0008 	str	r0, [fp, #-8]
    1108:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
    110c:	ea000005 	b	1128 <strcmp+0x30>
        p++, q++;
    1110:	e51b3008 	ldr	r3, [fp, #-8]
    1114:	e2833001 	add	r3, r3, #1
    1118:	e50b3008 	str	r3, [fp, #-8]
    111c:	e51b300c 	ldr	r3, [fp, #-12]
    1120:	e2833001 	add	r3, r3, #1
    1124:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
    1128:	e51b3008 	ldr	r3, [fp, #-8]
    112c:	e5d33000 	ldrb	r3, [r3]
    1130:	e3530000 	cmp	r3, #0
    1134:	0a000005 	beq	1150 <strcmp+0x58>
    1138:	e51b3008 	ldr	r3, [fp, #-8]
    113c:	e5d32000 	ldrb	r2, [r3]
    1140:	e51b300c 	ldr	r3, [fp, #-12]
    1144:	e5d33000 	ldrb	r3, [r3]
    1148:	e1520003 	cmp	r2, r3
    114c:	0affffef 	beq	1110 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
    1150:	e51b3008 	ldr	r3, [fp, #-8]
    1154:	e5d33000 	ldrb	r3, [r3]
    1158:	e1a02003 	mov	r2, r3
    115c:	e51b300c 	ldr	r3, [fp, #-12]
    1160:	e5d33000 	ldrb	r3, [r3]
    1164:	e0633002 	rsb	r3, r3, r2
}
    1168:	e1a00003 	mov	r0, r3
    116c:	e28bd000 	add	sp, fp, #0
    1170:	e8bd0800 	pop	{fp}
    1174:	e12fff1e 	bx	lr

00001178 <strlen>:

uint
strlen(char *s)
{
    1178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    117c:	e28db000 	add	fp, sp, #0
    1180:	e24dd014 	sub	sp, sp, #20
    1184:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
    1188:	e3a03000 	mov	r3, #0
    118c:	e50b3008 	str	r3, [fp, #-8]
    1190:	ea000002 	b	11a0 <strlen+0x28>
    1194:	e51b3008 	ldr	r3, [fp, #-8]
    1198:	e2833001 	add	r3, r3, #1
    119c:	e50b3008 	str	r3, [fp, #-8]
    11a0:	e51b3008 	ldr	r3, [fp, #-8]
    11a4:	e51b2010 	ldr	r2, [fp, #-16]
    11a8:	e0823003 	add	r3, r2, r3
    11ac:	e5d33000 	ldrb	r3, [r3]
    11b0:	e3530000 	cmp	r3, #0
    11b4:	1afffff6 	bne	1194 <strlen+0x1c>
        ;
    return n;
    11b8:	e51b3008 	ldr	r3, [fp, #-8]
}
    11bc:	e1a00003 	mov	r0, r3
    11c0:	e28bd000 	add	sp, fp, #0
    11c4:	e8bd0800 	pop	{fp}
    11c8:	e12fff1e 	bx	lr

000011cc <memset>:

void*
memset(void *dst, int v, uint n)
{
    11cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    11d0:	e28db000 	add	fp, sp, #0
    11d4:	e24dd024 	sub	sp, sp, #36	; 0x24
    11d8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    11dc:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    11e0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
    11e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    11e8:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
    11ec:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    11f0:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
    11f4:	e55b300d 	ldrb	r3, [fp, #-13]
    11f8:	e1a02c03 	lsl	r2, r3, #24
    11fc:	e55b300d 	ldrb	r3, [fp, #-13]
    1200:	e1a03803 	lsl	r3, r3, #16
    1204:	e1822003 	orr	r2, r2, r3
    1208:	e55b300d 	ldrb	r3, [fp, #-13]
    120c:	e1a03403 	lsl	r3, r3, #8
    1210:	e1822003 	orr	r2, r2, r3
    1214:	e55b300d 	ldrb	r3, [fp, #-13]
    1218:	e1823003 	orr	r3, r2, r3
    121c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
    1220:	ea000008 	b	1248 <memset+0x7c>
		*p = c;
    1224:	e51b3008 	ldr	r3, [fp, #-8]
    1228:	e55b200d 	ldrb	r2, [fp, #-13]
    122c:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
    1230:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    1234:	e2433001 	sub	r3, r3, #1
    1238:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    123c:	e51b3008 	ldr	r3, [fp, #-8]
    1240:	e2833001 	add	r3, r3, #1
    1244:	e50b3008 	str	r3, [fp, #-8]
    1248:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    124c:	e3530000 	cmp	r3, #0
    1250:	0a000003 	beq	1264 <memset+0x98>
    1254:	e51b3008 	ldr	r3, [fp, #-8]
    1258:	e2033003 	and	r3, r3, #3
    125c:	e3530000 	cmp	r3, #0
    1260:	1affffef 	bne	1224 <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
    1264:	e51b3008 	ldr	r3, [fp, #-8]
    1268:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
    126c:	ea000008 	b	1294 <memset+0xc8>
		*p4 = val;
    1270:	e51b300c 	ldr	r3, [fp, #-12]
    1274:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    1278:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
    127c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    1280:	e2433004 	sub	r3, r3, #4
    1284:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    1288:	e51b300c 	ldr	r3, [fp, #-12]
    128c:	e2833004 	add	r3, r3, #4
    1290:	e50b300c 	str	r3, [fp, #-12]
    1294:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    1298:	e3530003 	cmp	r3, #3
    129c:	8afffff3 	bhi	1270 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
    12a0:	e51b300c 	ldr	r3, [fp, #-12]
    12a4:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
    12a8:	ea000008 	b	12d0 <memset+0x104>
		*p = c;
    12ac:	e51b3008 	ldr	r3, [fp, #-8]
    12b0:	e55b200d 	ldrb	r2, [fp, #-13]
    12b4:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
    12b8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    12bc:	e2433001 	sub	r3, r3, #1
    12c0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    12c4:	e51b3008 	ldr	r3, [fp, #-8]
    12c8:	e2833001 	add	r3, r3, #1
    12cc:	e50b3008 	str	r3, [fp, #-8]
    12d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    12d4:	e3530000 	cmp	r3, #0
    12d8:	1afffff3 	bne	12ac <memset+0xe0>
		*p = c;
	}

	return dst;
    12dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    12e0:	e1a00003 	mov	r0, r3
    12e4:	e28bd000 	add	sp, fp, #0
    12e8:	e8bd0800 	pop	{fp}
    12ec:	e12fff1e 	bx	lr

000012f0 <strchr>:

char*
strchr(const char *s, char c)
{
    12f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    12f4:	e28db000 	add	fp, sp, #0
    12f8:	e24dd00c 	sub	sp, sp, #12
    12fc:	e50b0008 	str	r0, [fp, #-8]
    1300:	e1a03001 	mov	r3, r1
    1304:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
    1308:	ea000009 	b	1334 <strchr+0x44>
        if(*s == c)
    130c:	e51b3008 	ldr	r3, [fp, #-8]
    1310:	e5d33000 	ldrb	r3, [r3]
    1314:	e55b2009 	ldrb	r2, [fp, #-9]
    1318:	e1520003 	cmp	r2, r3
    131c:	1a000001 	bne	1328 <strchr+0x38>
            return (char*)s;
    1320:	e51b3008 	ldr	r3, [fp, #-8]
    1324:	ea000007 	b	1348 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
    1328:	e51b3008 	ldr	r3, [fp, #-8]
    132c:	e2833001 	add	r3, r3, #1
    1330:	e50b3008 	str	r3, [fp, #-8]
    1334:	e51b3008 	ldr	r3, [fp, #-8]
    1338:	e5d33000 	ldrb	r3, [r3]
    133c:	e3530000 	cmp	r3, #0
    1340:	1afffff1 	bne	130c <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
    1344:	e3a03000 	mov	r3, #0
}
    1348:	e1a00003 	mov	r0, r3
    134c:	e28bd000 	add	sp, fp, #0
    1350:	e8bd0800 	pop	{fp}
    1354:	e12fff1e 	bx	lr

00001358 <gets>:

char*
gets(char *buf, int max)
{
    1358:	e92d4800 	push	{fp, lr}
    135c:	e28db004 	add	fp, sp, #4
    1360:	e24dd018 	sub	sp, sp, #24
    1364:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    1368:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
    136c:	e3a03000 	mov	r3, #0
    1370:	e50b3008 	str	r3, [fp, #-8]
    1374:	ea000016 	b	13d4 <gets+0x7c>
        cc = read(0, &c, 1);
    1378:	e3a00000 	mov	r0, #0
    137c:	e24b300d 	sub	r3, fp, #13
    1380:	e1a01003 	mov	r1, r3
    1384:	e3a02001 	mov	r2, #1
    1388:	eb0000a3 	bl	161c <read>
    138c:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
    1390:	e51b300c 	ldr	r3, [fp, #-12]
    1394:	e3530000 	cmp	r3, #0
    1398:	da000013 	ble	13ec <gets+0x94>
            break;
        buf[i++] = c;
    139c:	e51b3008 	ldr	r3, [fp, #-8]
    13a0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    13a4:	e0823003 	add	r3, r2, r3
    13a8:	e55b200d 	ldrb	r2, [fp, #-13]
    13ac:	e5c32000 	strb	r2, [r3]
    13b0:	e51b3008 	ldr	r3, [fp, #-8]
    13b4:	e2833001 	add	r3, r3, #1
    13b8:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
    13bc:	e55b300d 	ldrb	r3, [fp, #-13]
    13c0:	e353000a 	cmp	r3, #10
    13c4:	0a000009 	beq	13f0 <gets+0x98>
    13c8:	e55b300d 	ldrb	r3, [fp, #-13]
    13cc:	e353000d 	cmp	r3, #13
    13d0:	0a000006 	beq	13f0 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
    13d4:	e51b3008 	ldr	r3, [fp, #-8]
    13d8:	e2832001 	add	r2, r3, #1
    13dc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    13e0:	e1520003 	cmp	r2, r3
    13e4:	baffffe3 	blt	1378 <gets+0x20>
    13e8:	ea000000 	b	13f0 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
    13ec:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
    13f0:	e51b3008 	ldr	r3, [fp, #-8]
    13f4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    13f8:	e0823003 	add	r3, r2, r3
    13fc:	e3a02000 	mov	r2, #0
    1400:	e5c32000 	strb	r2, [r3]
    return buf;
    1404:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    1408:	e1a00003 	mov	r0, r3
    140c:	e24bd004 	sub	sp, fp, #4
    1410:	e8bd8800 	pop	{fp, pc}

00001414 <stat>:

int
stat(char *n, struct stat *st)
{
    1414:	e92d4800 	push	{fp, lr}
    1418:	e28db004 	add	fp, sp, #4
    141c:	e24dd010 	sub	sp, sp, #16
    1420:	e50b0010 	str	r0, [fp, #-16]
    1424:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
    1428:	e51b0010 	ldr	r0, [fp, #-16]
    142c:	e3a01000 	mov	r1, #0
    1430:	eb0000a6 	bl	16d0 <open>
    1434:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
    1438:	e51b3008 	ldr	r3, [fp, #-8]
    143c:	e3530000 	cmp	r3, #0
    1440:	aa000001 	bge	144c <stat+0x38>
        return -1;
    1444:	e3e03000 	mvn	r3, #0
    1448:	ea000006 	b	1468 <stat+0x54>
    r = fstat(fd, st);
    144c:	e51b0008 	ldr	r0, [fp, #-8]
    1450:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    1454:	eb0000b8 	bl	173c <fstat>
    1458:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
    145c:	e51b0008 	ldr	r0, [fp, #-8]
    1460:	eb00007f 	bl	1664 <close>
    return r;
    1464:	e51b300c 	ldr	r3, [fp, #-12]
}
    1468:	e1a00003 	mov	r0, r3
    146c:	e24bd004 	sub	sp, fp, #4
    1470:	e8bd8800 	pop	{fp, pc}

00001474 <atoi>:

int
atoi(const char *s)
{
    1474:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1478:	e28db000 	add	fp, sp, #0
    147c:	e24dd014 	sub	sp, sp, #20
    1480:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
    1484:	e3a03000 	mov	r3, #0
    1488:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
    148c:	ea00000d 	b	14c8 <atoi+0x54>
        n = n*10 + *s++ - '0';
    1490:	e51b2008 	ldr	r2, [fp, #-8]
    1494:	e1a03002 	mov	r3, r2
    1498:	e1a03103 	lsl	r3, r3, #2
    149c:	e0833002 	add	r3, r3, r2
    14a0:	e1a03083 	lsl	r3, r3, #1
    14a4:	e1a02003 	mov	r2, r3
    14a8:	e51b3010 	ldr	r3, [fp, #-16]
    14ac:	e5d33000 	ldrb	r3, [r3]
    14b0:	e0823003 	add	r3, r2, r3
    14b4:	e2433030 	sub	r3, r3, #48	; 0x30
    14b8:	e50b3008 	str	r3, [fp, #-8]
    14bc:	e51b3010 	ldr	r3, [fp, #-16]
    14c0:	e2833001 	add	r3, r3, #1
    14c4:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
    14c8:	e51b3010 	ldr	r3, [fp, #-16]
    14cc:	e5d33000 	ldrb	r3, [r3]
    14d0:	e353002f 	cmp	r3, #47	; 0x2f
    14d4:	9a000003 	bls	14e8 <atoi+0x74>
    14d8:	e51b3010 	ldr	r3, [fp, #-16]
    14dc:	e5d33000 	ldrb	r3, [r3]
    14e0:	e3530039 	cmp	r3, #57	; 0x39
    14e4:	9affffe9 	bls	1490 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
    14e8:	e51b3008 	ldr	r3, [fp, #-8]
}
    14ec:	e1a00003 	mov	r0, r3
    14f0:	e28bd000 	add	sp, fp, #0
    14f4:	e8bd0800 	pop	{fp}
    14f8:	e12fff1e 	bx	lr

000014fc <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    14fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1500:	e28db000 	add	fp, sp, #0
    1504:	e24dd01c 	sub	sp, sp, #28
    1508:	e50b0010 	str	r0, [fp, #-16]
    150c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    1510:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
    1514:	e51b3010 	ldr	r3, [fp, #-16]
    1518:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
    151c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1520:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
    1524:	ea000009 	b	1550 <memmove+0x54>
        *dst++ = *src++;
    1528:	e51b300c 	ldr	r3, [fp, #-12]
    152c:	e5d32000 	ldrb	r2, [r3]
    1530:	e51b3008 	ldr	r3, [fp, #-8]
    1534:	e5c32000 	strb	r2, [r3]
    1538:	e51b3008 	ldr	r3, [fp, #-8]
    153c:	e2833001 	add	r3, r3, #1
    1540:	e50b3008 	str	r3, [fp, #-8]
    1544:	e51b300c 	ldr	r3, [fp, #-12]
    1548:	e2833001 	add	r3, r3, #1
    154c:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
    1550:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1554:	e3530000 	cmp	r3, #0
    1558:	d3a03000 	movle	r3, #0
    155c:	c3a03001 	movgt	r3, #1
    1560:	e6ef3073 	uxtb	r3, r3
    1564:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    1568:	e2422001 	sub	r2, r2, #1
    156c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    1570:	e3530000 	cmp	r3, #0
    1574:	1affffeb 	bne	1528 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
    1578:	e51b3010 	ldr	r3, [fp, #-16]
}
    157c:	e1a00003 	mov	r0, r3
    1580:	e28bd000 	add	sp, fp, #0
    1584:	e8bd0800 	pop	{fp}
    1588:	e12fff1e 	bx	lr

0000158c <fork>:
    158c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1590:	e1a04003 	mov	r4, r3
    1594:	e1a03002 	mov	r3, r2
    1598:	e1a02001 	mov	r2, r1
    159c:	e1a01000 	mov	r1, r0
    15a0:	e3a00001 	mov	r0, #1
    15a4:	ef000000 	svc	0x00000000
    15a8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    15ac:	e12fff1e 	bx	lr

000015b0 <exit>:
    15b0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    15b4:	e1a04003 	mov	r4, r3
    15b8:	e1a03002 	mov	r3, r2
    15bc:	e1a02001 	mov	r2, r1
    15c0:	e1a01000 	mov	r1, r0
    15c4:	e3a00002 	mov	r0, #2
    15c8:	ef000000 	svc	0x00000000
    15cc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    15d0:	e12fff1e 	bx	lr

000015d4 <wait>:
    15d4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    15d8:	e1a04003 	mov	r4, r3
    15dc:	e1a03002 	mov	r3, r2
    15e0:	e1a02001 	mov	r2, r1
    15e4:	e1a01000 	mov	r1, r0
    15e8:	e3a00003 	mov	r0, #3
    15ec:	ef000000 	svc	0x00000000
    15f0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    15f4:	e12fff1e 	bx	lr

000015f8 <pipe>:
    15f8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    15fc:	e1a04003 	mov	r4, r3
    1600:	e1a03002 	mov	r3, r2
    1604:	e1a02001 	mov	r2, r1
    1608:	e1a01000 	mov	r1, r0
    160c:	e3a00004 	mov	r0, #4
    1610:	ef000000 	svc	0x00000000
    1614:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1618:	e12fff1e 	bx	lr

0000161c <read>:
    161c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1620:	e1a04003 	mov	r4, r3
    1624:	e1a03002 	mov	r3, r2
    1628:	e1a02001 	mov	r2, r1
    162c:	e1a01000 	mov	r1, r0
    1630:	e3a00005 	mov	r0, #5
    1634:	ef000000 	svc	0x00000000
    1638:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    163c:	e12fff1e 	bx	lr

00001640 <write>:
    1640:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1644:	e1a04003 	mov	r4, r3
    1648:	e1a03002 	mov	r3, r2
    164c:	e1a02001 	mov	r2, r1
    1650:	e1a01000 	mov	r1, r0
    1654:	e3a00010 	mov	r0, #16
    1658:	ef000000 	svc	0x00000000
    165c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1660:	e12fff1e 	bx	lr

00001664 <close>:
    1664:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1668:	e1a04003 	mov	r4, r3
    166c:	e1a03002 	mov	r3, r2
    1670:	e1a02001 	mov	r2, r1
    1674:	e1a01000 	mov	r1, r0
    1678:	e3a00015 	mov	r0, #21
    167c:	ef000000 	svc	0x00000000
    1680:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1684:	e12fff1e 	bx	lr

00001688 <kill>:
    1688:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    168c:	e1a04003 	mov	r4, r3
    1690:	e1a03002 	mov	r3, r2
    1694:	e1a02001 	mov	r2, r1
    1698:	e1a01000 	mov	r1, r0
    169c:	e3a00006 	mov	r0, #6
    16a0:	ef000000 	svc	0x00000000
    16a4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    16a8:	e12fff1e 	bx	lr

000016ac <exec>:
    16ac:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    16b0:	e1a04003 	mov	r4, r3
    16b4:	e1a03002 	mov	r3, r2
    16b8:	e1a02001 	mov	r2, r1
    16bc:	e1a01000 	mov	r1, r0
    16c0:	e3a00007 	mov	r0, #7
    16c4:	ef000000 	svc	0x00000000
    16c8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    16cc:	e12fff1e 	bx	lr

000016d0 <open>:
    16d0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    16d4:	e1a04003 	mov	r4, r3
    16d8:	e1a03002 	mov	r3, r2
    16dc:	e1a02001 	mov	r2, r1
    16e0:	e1a01000 	mov	r1, r0
    16e4:	e3a0000f 	mov	r0, #15
    16e8:	ef000000 	svc	0x00000000
    16ec:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    16f0:	e12fff1e 	bx	lr

000016f4 <mknod>:
    16f4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    16f8:	e1a04003 	mov	r4, r3
    16fc:	e1a03002 	mov	r3, r2
    1700:	e1a02001 	mov	r2, r1
    1704:	e1a01000 	mov	r1, r0
    1708:	e3a00011 	mov	r0, #17
    170c:	ef000000 	svc	0x00000000
    1710:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1714:	e12fff1e 	bx	lr

00001718 <unlink>:
    1718:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    171c:	e1a04003 	mov	r4, r3
    1720:	e1a03002 	mov	r3, r2
    1724:	e1a02001 	mov	r2, r1
    1728:	e1a01000 	mov	r1, r0
    172c:	e3a00012 	mov	r0, #18
    1730:	ef000000 	svc	0x00000000
    1734:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1738:	e12fff1e 	bx	lr

0000173c <fstat>:
    173c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1740:	e1a04003 	mov	r4, r3
    1744:	e1a03002 	mov	r3, r2
    1748:	e1a02001 	mov	r2, r1
    174c:	e1a01000 	mov	r1, r0
    1750:	e3a00008 	mov	r0, #8
    1754:	ef000000 	svc	0x00000000
    1758:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    175c:	e12fff1e 	bx	lr

00001760 <link>:
    1760:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1764:	e1a04003 	mov	r4, r3
    1768:	e1a03002 	mov	r3, r2
    176c:	e1a02001 	mov	r2, r1
    1770:	e1a01000 	mov	r1, r0
    1774:	e3a00013 	mov	r0, #19
    1778:	ef000000 	svc	0x00000000
    177c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1780:	e12fff1e 	bx	lr

00001784 <mkdir>:
    1784:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1788:	e1a04003 	mov	r4, r3
    178c:	e1a03002 	mov	r3, r2
    1790:	e1a02001 	mov	r2, r1
    1794:	e1a01000 	mov	r1, r0
    1798:	e3a00014 	mov	r0, #20
    179c:	ef000000 	svc	0x00000000
    17a0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    17a4:	e12fff1e 	bx	lr

000017a8 <chdir>:
    17a8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    17ac:	e1a04003 	mov	r4, r3
    17b0:	e1a03002 	mov	r3, r2
    17b4:	e1a02001 	mov	r2, r1
    17b8:	e1a01000 	mov	r1, r0
    17bc:	e3a00009 	mov	r0, #9
    17c0:	ef000000 	svc	0x00000000
    17c4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    17c8:	e12fff1e 	bx	lr

000017cc <dup>:
    17cc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    17d0:	e1a04003 	mov	r4, r3
    17d4:	e1a03002 	mov	r3, r2
    17d8:	e1a02001 	mov	r2, r1
    17dc:	e1a01000 	mov	r1, r0
    17e0:	e3a0000a 	mov	r0, #10
    17e4:	ef000000 	svc	0x00000000
    17e8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    17ec:	e12fff1e 	bx	lr

000017f0 <getpid>:
    17f0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    17f4:	e1a04003 	mov	r4, r3
    17f8:	e1a03002 	mov	r3, r2
    17fc:	e1a02001 	mov	r2, r1
    1800:	e1a01000 	mov	r1, r0
    1804:	e3a0000b 	mov	r0, #11
    1808:	ef000000 	svc	0x00000000
    180c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1810:	e12fff1e 	bx	lr

00001814 <sbrk>:
    1814:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1818:	e1a04003 	mov	r4, r3
    181c:	e1a03002 	mov	r3, r2
    1820:	e1a02001 	mov	r2, r1
    1824:	e1a01000 	mov	r1, r0
    1828:	e3a0000c 	mov	r0, #12
    182c:	ef000000 	svc	0x00000000
    1830:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1834:	e12fff1e 	bx	lr

00001838 <sleep>:
    1838:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    183c:	e1a04003 	mov	r4, r3
    1840:	e1a03002 	mov	r3, r2
    1844:	e1a02001 	mov	r2, r1
    1848:	e1a01000 	mov	r1, r0
    184c:	e3a0000d 	mov	r0, #13
    1850:	ef000000 	svc	0x00000000
    1854:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    1858:	e12fff1e 	bx	lr

0000185c <uptime>:
    185c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1860:	e1a04003 	mov	r4, r3
    1864:	e1a03002 	mov	r3, r2
    1868:	e1a02001 	mov	r2, r1
    186c:	e1a01000 	mov	r1, r0
    1870:	e3a0000e 	mov	r0, #14
    1874:	ef000000 	svc	0x00000000
    1878:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    187c:	e12fff1e 	bx	lr

00001880 <kthread_create>:
    1880:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    1884:	e1a04003 	mov	r4, r3
    1888:	e1a03002 	mov	r3, r2
    188c:	e1a02001 	mov	r2, r1
    1890:	e1a01000 	mov	r1, r0
    1894:	e3a00016 	mov	r0, #22
    1898:	ef000000 	svc	0x00000000
    189c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    18a0:	e12fff1e 	bx	lr

000018a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    18a4:	e92d4800 	push	{fp, lr}
    18a8:	e28db004 	add	fp, sp, #4
    18ac:	e24dd008 	sub	sp, sp, #8
    18b0:	e50b0008 	str	r0, [fp, #-8]
    18b4:	e1a03001 	mov	r3, r1
    18b8:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
    18bc:	e51b0008 	ldr	r0, [fp, #-8]
    18c0:	e24b3009 	sub	r3, fp, #9
    18c4:	e1a01003 	mov	r1, r3
    18c8:	e3a02001 	mov	r2, #1
    18cc:	ebffff5b 	bl	1640 <write>
}
    18d0:	e24bd004 	sub	sp, fp, #4
    18d4:	e8bd8800 	pop	{fp, pc}

000018d8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    18d8:	e92d4800 	push	{fp, lr}
    18dc:	e28db004 	add	fp, sp, #4
    18e0:	e24dd030 	sub	sp, sp, #48	; 0x30
    18e4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    18e8:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    18ec:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    18f0:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
    18f4:	e3a03000 	mov	r3, #0
    18f8:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
    18fc:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    1900:	e3530000 	cmp	r3, #0
    1904:	0a000008 	beq	192c <printint+0x54>
    1908:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    190c:	e3530000 	cmp	r3, #0
    1910:	aa000005 	bge	192c <printint+0x54>
        neg = 1;
    1914:	e3a03001 	mov	r3, #1
    1918:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
    191c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    1920:	e2633000 	rsb	r3, r3, #0
    1924:	e50b3010 	str	r3, [fp, #-16]
    1928:	ea000001 	b	1934 <printint+0x5c>
    } else {
        x = xx;
    192c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    1930:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
    1934:	e3a03000 	mov	r3, #0
    1938:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
    193c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    1940:	e51b2010 	ldr	r2, [fp, #-16]
    1944:	e1a00002 	mov	r0, r2
    1948:	e1a01003 	mov	r1, r3
    194c:	eb0001e5 	bl	20e8 <__aeabi_uidivmod>
    1950:	e1a03001 	mov	r3, r1
    1954:	e1a02003 	mov	r2, r3
    1958:	e3023208 	movw	r3, #8712	; 0x2208
    195c:	e3403000 	movt	r3, #0
    1960:	e7d32002 	ldrb	r2, [r3, r2]
    1964:	e3e0001b 	mvn	r0, #27
    1968:	e51b3008 	ldr	r3, [fp, #-8]
    196c:	e24bc004 	sub	ip, fp, #4
    1970:	e08c1003 	add	r1, ip, r3
    1974:	e1a03000 	mov	r3, r0
    1978:	e0813003 	add	r3, r1, r3
    197c:	e5c32000 	strb	r2, [r3]
    1980:	e51b3008 	ldr	r3, [fp, #-8]
    1984:	e2833001 	add	r3, r3, #1
    1988:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
    198c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    1990:	e51b0010 	ldr	r0, [fp, #-16]
    1994:	e1a01003 	mov	r1, r3
    1998:	eb000195 	bl	1ff4 <__aeabi_uidiv>
    199c:	e1a03000 	mov	r3, r0
    19a0:	e50b3010 	str	r3, [fp, #-16]
    19a4:	e51b3010 	ldr	r3, [fp, #-16]
    19a8:	e3530000 	cmp	r3, #0
    19ac:	1affffe2 	bne	193c <printint+0x64>
    if(neg)
    19b0:	e51b300c 	ldr	r3, [fp, #-12]
    19b4:	e3530000 	cmp	r3, #0
    19b8:	0a000015 	beq	1a14 <printint+0x13c>
        buf[i++] = '-';
    19bc:	e3e0101b 	mvn	r1, #27
    19c0:	e51b3008 	ldr	r3, [fp, #-8]
    19c4:	e24b0004 	sub	r0, fp, #4
    19c8:	e0802003 	add	r2, r0, r3
    19cc:	e1a03001 	mov	r3, r1
    19d0:	e0823003 	add	r3, r2, r3
    19d4:	e3a0202d 	mov	r2, #45	; 0x2d
    19d8:	e5c32000 	strb	r2, [r3]
    19dc:	e51b3008 	ldr	r3, [fp, #-8]
    19e0:	e2833001 	add	r3, r3, #1
    19e4:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
    19e8:	ea000009 	b	1a14 <printint+0x13c>
        putc(fd, buf[i]);
    19ec:	e3e0101b 	mvn	r1, #27
    19f0:	e51b3008 	ldr	r3, [fp, #-8]
    19f4:	e24bc004 	sub	ip, fp, #4
    19f8:	e08c2003 	add	r2, ip, r3
    19fc:	e1a03001 	mov	r3, r1
    1a00:	e0823003 	add	r3, r2, r3
    1a04:	e5d33000 	ldrb	r3, [r3]
    1a08:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    1a0c:	e1a01003 	mov	r1, r3
    1a10:	ebffffa3 	bl	18a4 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
    1a14:	e51b3008 	ldr	r3, [fp, #-8]
    1a18:	e2433001 	sub	r3, r3, #1
    1a1c:	e50b3008 	str	r3, [fp, #-8]
    1a20:	e51b3008 	ldr	r3, [fp, #-8]
    1a24:	e3530000 	cmp	r3, #0
    1a28:	aaffffef 	bge	19ec <printint+0x114>
        putc(fd, buf[i]);
}
    1a2c:	e24bd004 	sub	sp, fp, #4
    1a30:	e8bd8800 	pop	{fp, pc}

00001a34 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1a34:	e92d000e 	push	{r1, r2, r3}
    1a38:	e92d4800 	push	{fp, lr}
    1a3c:	e28db004 	add	fp, sp, #4
    1a40:	e24dd024 	sub	sp, sp, #36	; 0x24
    1a44:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
    1a48:	e3a03000 	mov	r3, #0
    1a4c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
    1a50:	e28b3008 	add	r3, fp, #8
    1a54:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
    1a58:	e3a03000 	mov	r3, #0
    1a5c:	e50b3010 	str	r3, [fp, #-16]
    1a60:	ea000077 	b	1c44 <printf+0x210>
        c = fmt[i] & 0xff;
    1a64:	e59b2004 	ldr	r2, [fp, #4]
    1a68:	e51b3010 	ldr	r3, [fp, #-16]
    1a6c:	e0823003 	add	r3, r2, r3
    1a70:	e5d33000 	ldrb	r3, [r3]
    1a74:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
    1a78:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1a7c:	e3530000 	cmp	r3, #0
    1a80:	1a00000b 	bne	1ab4 <printf+0x80>
            if(c == '%'){
    1a84:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1a88:	e3530025 	cmp	r3, #37	; 0x25
    1a8c:	1a000002 	bne	1a9c <printf+0x68>
                state = '%';
    1a90:	e3a03025 	mov	r3, #37	; 0x25
    1a94:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    1a98:	ea000066 	b	1c38 <printf+0x204>
            } else {
                putc(fd, c);
    1a9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1aa0:	e6ef3073 	uxtb	r3, r3
    1aa4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1aa8:	e1a01003 	mov	r1, r3
    1aac:	ebffff7c 	bl	18a4 <putc>
    1ab0:	ea000060 	b	1c38 <printf+0x204>
            }
        } else if(state == '%'){
    1ab4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1ab8:	e3530025 	cmp	r3, #37	; 0x25
    1abc:	1a00005d 	bne	1c38 <printf+0x204>
            if(c == 'd'){
    1ac0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1ac4:	e3530064 	cmp	r3, #100	; 0x64
    1ac8:	1a00000a 	bne	1af8 <printf+0xc4>
                printint(fd, *ap, 10, 1);
    1acc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1ad0:	e5933000 	ldr	r3, [r3]
    1ad4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1ad8:	e1a01003 	mov	r1, r3
    1adc:	e3a0200a 	mov	r2, #10
    1ae0:	e3a03001 	mov	r3, #1
    1ae4:	ebffff7b 	bl	18d8 <printint>
                ap++;
    1ae8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1aec:	e2833004 	add	r3, r3, #4
    1af0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    1af4:	ea00004d 	b	1c30 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
    1af8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1afc:	e3530078 	cmp	r3, #120	; 0x78
    1b00:	0a000002 	beq	1b10 <printf+0xdc>
    1b04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1b08:	e3530070 	cmp	r3, #112	; 0x70
    1b0c:	1a00000a 	bne	1b3c <printf+0x108>
                printint(fd, *ap, 16, 0);
    1b10:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1b14:	e5933000 	ldr	r3, [r3]
    1b18:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1b1c:	e1a01003 	mov	r1, r3
    1b20:	e3a02010 	mov	r2, #16
    1b24:	e3a03000 	mov	r3, #0
    1b28:	ebffff6a 	bl	18d8 <printint>
                ap++;
    1b2c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1b30:	e2833004 	add	r3, r3, #4
    1b34:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    1b38:	ea00003c 	b	1c30 <printf+0x1fc>
            } else if(c == 's'){
    1b3c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1b40:	e3530073 	cmp	r3, #115	; 0x73
    1b44:	1a00001b 	bne	1bb8 <printf+0x184>
                s = (char*)*ap;
    1b48:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1b4c:	e5933000 	ldr	r3, [r3]
    1b50:	e50b300c 	str	r3, [fp, #-12]
                ap++;
    1b54:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1b58:	e2833004 	add	r3, r3, #4
    1b5c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
    1b60:	e51b300c 	ldr	r3, [fp, #-12]
    1b64:	e3530000 	cmp	r3, #0
    1b68:	1a00000c 	bne	1ba0 <printf+0x16c>
                    s = "(null)";
    1b6c:	e30231f0 	movw	r3, #8688	; 0x21f0
    1b70:	e3403000 	movt	r3, #0
    1b74:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
    1b78:	ea000008 	b	1ba0 <printf+0x16c>
                    putc(fd, *s);
    1b7c:	e51b300c 	ldr	r3, [fp, #-12]
    1b80:	e5d33000 	ldrb	r3, [r3]
    1b84:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1b88:	e1a01003 	mov	r1, r3
    1b8c:	ebffff44 	bl	18a4 <putc>
                    s++;
    1b90:	e51b300c 	ldr	r3, [fp, #-12]
    1b94:	e2833001 	add	r3, r3, #1
    1b98:	e50b300c 	str	r3, [fp, #-12]
    1b9c:	ea000000 	b	1ba4 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
    1ba0:	e1a00000 	nop			; (mov r0, r0)
    1ba4:	e51b300c 	ldr	r3, [fp, #-12]
    1ba8:	e5d33000 	ldrb	r3, [r3]
    1bac:	e3530000 	cmp	r3, #0
    1bb0:	1afffff1 	bne	1b7c <printf+0x148>
    1bb4:	ea00001d 	b	1c30 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
    1bb8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1bbc:	e3530063 	cmp	r3, #99	; 0x63
    1bc0:	1a000009 	bne	1bec <printf+0x1b8>
                putc(fd, *ap);
    1bc4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1bc8:	e5933000 	ldr	r3, [r3]
    1bcc:	e6ef3073 	uxtb	r3, r3
    1bd0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1bd4:	e1a01003 	mov	r1, r3
    1bd8:	ebffff31 	bl	18a4 <putc>
                ap++;
    1bdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1be0:	e2833004 	add	r3, r3, #4
    1be4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    1be8:	ea000010 	b	1c30 <printf+0x1fc>
            } else if(c == '%'){
    1bec:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1bf0:	e3530025 	cmp	r3, #37	; 0x25
    1bf4:	1a000005 	bne	1c10 <printf+0x1dc>
                putc(fd, c);
    1bf8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1bfc:	e6ef3073 	uxtb	r3, r3
    1c00:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1c04:	e1a01003 	mov	r1, r3
    1c08:	ebffff25 	bl	18a4 <putc>
    1c0c:	ea000007 	b	1c30 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
    1c10:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1c14:	e3a01025 	mov	r1, #37	; 0x25
    1c18:	ebffff21 	bl	18a4 <putc>
                putc(fd, c);
    1c1c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1c20:	e6ef3073 	uxtb	r3, r3
    1c24:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    1c28:	e1a01003 	mov	r1, r3
    1c2c:	ebffff1c 	bl	18a4 <putc>
            }
            state = 0;
    1c30:	e3a03000 	mov	r3, #0
    1c34:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
    1c38:	e51b3010 	ldr	r3, [fp, #-16]
    1c3c:	e2833001 	add	r3, r3, #1
    1c40:	e50b3010 	str	r3, [fp, #-16]
    1c44:	e59b2004 	ldr	r2, [fp, #4]
    1c48:	e51b3010 	ldr	r3, [fp, #-16]
    1c4c:	e0823003 	add	r3, r2, r3
    1c50:	e5d33000 	ldrb	r3, [r3]
    1c54:	e3530000 	cmp	r3, #0
    1c58:	1affff81 	bne	1a64 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
    1c5c:	e24bd004 	sub	sp, fp, #4
    1c60:	e8bd4800 	pop	{fp, lr}
    1c64:	e28dd00c 	add	sp, sp, #12
    1c68:	e12fff1e 	bx	lr

00001c6c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1c6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1c70:	e28db000 	add	fp, sp, #0
    1c74:	e24dd014 	sub	sp, sp, #20
    1c78:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    1c7c:	e51b3010 	ldr	r3, [fp, #-16]
    1c80:	e2433008 	sub	r3, r3, #8
    1c84:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1c88:	e3023288 	movw	r3, #8840	; 0x2288
    1c8c:	e3403000 	movt	r3, #0
    1c90:	e5933000 	ldr	r3, [r3]
    1c94:	e50b3008 	str	r3, [fp, #-8]
    1c98:	ea000010 	b	1ce0 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1c9c:	e51b3008 	ldr	r3, [fp, #-8]
    1ca0:	e5932000 	ldr	r2, [r3]
    1ca4:	e51b3008 	ldr	r3, [fp, #-8]
    1ca8:	e1520003 	cmp	r2, r3
    1cac:	8a000008 	bhi	1cd4 <free+0x68>
    1cb0:	e51b200c 	ldr	r2, [fp, #-12]
    1cb4:	e51b3008 	ldr	r3, [fp, #-8]
    1cb8:	e1520003 	cmp	r2, r3
    1cbc:	8a000010 	bhi	1d04 <free+0x98>
    1cc0:	e51b3008 	ldr	r3, [fp, #-8]
    1cc4:	e5932000 	ldr	r2, [r3]
    1cc8:	e51b300c 	ldr	r3, [fp, #-12]
    1ccc:	e1520003 	cmp	r2, r3
    1cd0:	8a00000b 	bhi	1d04 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1cd4:	e51b3008 	ldr	r3, [fp, #-8]
    1cd8:	e5933000 	ldr	r3, [r3]
    1cdc:	e50b3008 	str	r3, [fp, #-8]
    1ce0:	e51b200c 	ldr	r2, [fp, #-12]
    1ce4:	e51b3008 	ldr	r3, [fp, #-8]
    1ce8:	e1520003 	cmp	r2, r3
    1cec:	9affffea 	bls	1c9c <free+0x30>
    1cf0:	e51b3008 	ldr	r3, [fp, #-8]
    1cf4:	e5932000 	ldr	r2, [r3]
    1cf8:	e51b300c 	ldr	r3, [fp, #-12]
    1cfc:	e1520003 	cmp	r2, r3
    1d00:	9affffe5 	bls	1c9c <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
    1d04:	e51b300c 	ldr	r3, [fp, #-12]
    1d08:	e5933004 	ldr	r3, [r3, #4]
    1d0c:	e1a03183 	lsl	r3, r3, #3
    1d10:	e51b200c 	ldr	r2, [fp, #-12]
    1d14:	e0822003 	add	r2, r2, r3
    1d18:	e51b3008 	ldr	r3, [fp, #-8]
    1d1c:	e5933000 	ldr	r3, [r3]
    1d20:	e1520003 	cmp	r2, r3
    1d24:	1a00000d 	bne	1d60 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
    1d28:	e51b300c 	ldr	r3, [fp, #-12]
    1d2c:	e5932004 	ldr	r2, [r3, #4]
    1d30:	e51b3008 	ldr	r3, [fp, #-8]
    1d34:	e5933000 	ldr	r3, [r3]
    1d38:	e5933004 	ldr	r3, [r3, #4]
    1d3c:	e0822003 	add	r2, r2, r3
    1d40:	e51b300c 	ldr	r3, [fp, #-12]
    1d44:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
    1d48:	e51b3008 	ldr	r3, [fp, #-8]
    1d4c:	e5933000 	ldr	r3, [r3]
    1d50:	e5932000 	ldr	r2, [r3]
    1d54:	e51b300c 	ldr	r3, [fp, #-12]
    1d58:	e5832000 	str	r2, [r3]
    1d5c:	ea000003 	b	1d70 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
    1d60:	e51b3008 	ldr	r3, [fp, #-8]
    1d64:	e5932000 	ldr	r2, [r3]
    1d68:	e51b300c 	ldr	r3, [fp, #-12]
    1d6c:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
    1d70:	e51b3008 	ldr	r3, [fp, #-8]
    1d74:	e5933004 	ldr	r3, [r3, #4]
    1d78:	e1a03183 	lsl	r3, r3, #3
    1d7c:	e51b2008 	ldr	r2, [fp, #-8]
    1d80:	e0822003 	add	r2, r2, r3
    1d84:	e51b300c 	ldr	r3, [fp, #-12]
    1d88:	e1520003 	cmp	r2, r3
    1d8c:	1a00000b 	bne	1dc0 <free+0x154>
        p->s.size += bp->s.size;
    1d90:	e51b3008 	ldr	r3, [fp, #-8]
    1d94:	e5932004 	ldr	r2, [r3, #4]
    1d98:	e51b300c 	ldr	r3, [fp, #-12]
    1d9c:	e5933004 	ldr	r3, [r3, #4]
    1da0:	e0822003 	add	r2, r2, r3
    1da4:	e51b3008 	ldr	r3, [fp, #-8]
    1da8:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
    1dac:	e51b300c 	ldr	r3, [fp, #-12]
    1db0:	e5932000 	ldr	r2, [r3]
    1db4:	e51b3008 	ldr	r3, [fp, #-8]
    1db8:	e5832000 	str	r2, [r3]
    1dbc:	ea000002 	b	1dcc <free+0x160>
    } else
        p->s.ptr = bp;
    1dc0:	e51b3008 	ldr	r3, [fp, #-8]
    1dc4:	e51b200c 	ldr	r2, [fp, #-12]
    1dc8:	e5832000 	str	r2, [r3]
    freep = p;
    1dcc:	e3023288 	movw	r3, #8840	; 0x2288
    1dd0:	e3403000 	movt	r3, #0
    1dd4:	e51b2008 	ldr	r2, [fp, #-8]
    1dd8:	e5832000 	str	r2, [r3]
}
    1ddc:	e28bd000 	add	sp, fp, #0
    1de0:	e8bd0800 	pop	{fp}
    1de4:	e12fff1e 	bx	lr

00001de8 <morecore>:

static Header*
morecore(uint nu)
{
    1de8:	e92d4800 	push	{fp, lr}
    1dec:	e28db004 	add	fp, sp, #4
    1df0:	e24dd010 	sub	sp, sp, #16
    1df4:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
    1df8:	e51b2010 	ldr	r2, [fp, #-16]
    1dfc:	e3003fff 	movw	r3, #4095	; 0xfff
    1e00:	e1520003 	cmp	r2, r3
    1e04:	8a000001 	bhi	1e10 <morecore+0x28>
        nu = 4096;
    1e08:	e3a03a01 	mov	r3, #4096	; 0x1000
    1e0c:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
    1e10:	e51b3010 	ldr	r3, [fp, #-16]
    1e14:	e1a03183 	lsl	r3, r3, #3
    1e18:	e1a00003 	mov	r0, r3
    1e1c:	ebfffe7c 	bl	1814 <sbrk>
    1e20:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
    1e24:	e51b3008 	ldr	r3, [fp, #-8]
    1e28:	e3730001 	cmn	r3, #1
    1e2c:	1a000001 	bne	1e38 <morecore+0x50>
        return 0;
    1e30:	e3a03000 	mov	r3, #0
    1e34:	ea00000b 	b	1e68 <morecore+0x80>
    hp = (Header*)p;
    1e38:	e51b3008 	ldr	r3, [fp, #-8]
    1e3c:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
    1e40:	e51b300c 	ldr	r3, [fp, #-12]
    1e44:	e51b2010 	ldr	r2, [fp, #-16]
    1e48:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
    1e4c:	e51b300c 	ldr	r3, [fp, #-12]
    1e50:	e2833008 	add	r3, r3, #8
    1e54:	e1a00003 	mov	r0, r3
    1e58:	ebffff83 	bl	1c6c <free>
    return freep;
    1e5c:	e3023288 	movw	r3, #8840	; 0x2288
    1e60:	e3403000 	movt	r3, #0
    1e64:	e5933000 	ldr	r3, [r3]
}
    1e68:	e1a00003 	mov	r0, r3
    1e6c:	e24bd004 	sub	sp, fp, #4
    1e70:	e8bd8800 	pop	{fp, pc}

00001e74 <malloc>:

void*
malloc(uint nbytes)
{
    1e74:	e92d4800 	push	{fp, lr}
    1e78:	e28db004 	add	fp, sp, #4
    1e7c:	e24dd018 	sub	sp, sp, #24
    1e80:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1e84:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1e88:	e2833007 	add	r3, r3, #7
    1e8c:	e1a031a3 	lsr	r3, r3, #3
    1e90:	e2833001 	add	r3, r3, #1
    1e94:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
    1e98:	e3023288 	movw	r3, #8840	; 0x2288
    1e9c:	e3403000 	movt	r3, #0
    1ea0:	e5933000 	ldr	r3, [r3]
    1ea4:	e50b300c 	str	r3, [fp, #-12]
    1ea8:	e51b300c 	ldr	r3, [fp, #-12]
    1eac:	e3530000 	cmp	r3, #0
    1eb0:	1a000010 	bne	1ef8 <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
    1eb4:	e3023280 	movw	r3, #8832	; 0x2280
    1eb8:	e3403000 	movt	r3, #0
    1ebc:	e50b300c 	str	r3, [fp, #-12]
    1ec0:	e3023288 	movw	r3, #8840	; 0x2288
    1ec4:	e3403000 	movt	r3, #0
    1ec8:	e51b200c 	ldr	r2, [fp, #-12]
    1ecc:	e5832000 	str	r2, [r3]
    1ed0:	e3023288 	movw	r3, #8840	; 0x2288
    1ed4:	e3403000 	movt	r3, #0
    1ed8:	e5932000 	ldr	r2, [r3]
    1edc:	e3023280 	movw	r3, #8832	; 0x2280
    1ee0:	e3403000 	movt	r3, #0
    1ee4:	e5832000 	str	r2, [r3]
        base.s.size = 0;
    1ee8:	e3023280 	movw	r3, #8832	; 0x2280
    1eec:	e3403000 	movt	r3, #0
    1ef0:	e3a02000 	mov	r2, #0
    1ef4:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1ef8:	e51b300c 	ldr	r3, [fp, #-12]
    1efc:	e5933000 	ldr	r3, [r3]
    1f00:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
    1f04:	e51b3008 	ldr	r3, [fp, #-8]
    1f08:	e5932004 	ldr	r2, [r3, #4]
    1f0c:	e51b3010 	ldr	r3, [fp, #-16]
    1f10:	e1520003 	cmp	r2, r3
    1f14:	3a00001f 	bcc	1f98 <malloc+0x124>
            if(p->s.size == nunits)
    1f18:	e51b3008 	ldr	r3, [fp, #-8]
    1f1c:	e5932004 	ldr	r2, [r3, #4]
    1f20:	e51b3010 	ldr	r3, [fp, #-16]
    1f24:	e1520003 	cmp	r2, r3
    1f28:	1a000004 	bne	1f40 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    1f2c:	e51b3008 	ldr	r3, [fp, #-8]
    1f30:	e5932000 	ldr	r2, [r3]
    1f34:	e51b300c 	ldr	r3, [fp, #-12]
    1f38:	e5832000 	str	r2, [r3]
    1f3c:	ea00000e 	b	1f7c <malloc+0x108>
            else {
                p->s.size -= nunits;
    1f40:	e51b3008 	ldr	r3, [fp, #-8]
    1f44:	e5932004 	ldr	r2, [r3, #4]
    1f48:	e51b3010 	ldr	r3, [fp, #-16]
    1f4c:	e0632002 	rsb	r2, r3, r2
    1f50:	e51b3008 	ldr	r3, [fp, #-8]
    1f54:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    1f58:	e51b3008 	ldr	r3, [fp, #-8]
    1f5c:	e5933004 	ldr	r3, [r3, #4]
    1f60:	e1a03183 	lsl	r3, r3, #3
    1f64:	e51b2008 	ldr	r2, [fp, #-8]
    1f68:	e0823003 	add	r3, r2, r3
    1f6c:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    1f70:	e51b3008 	ldr	r3, [fp, #-8]
    1f74:	e51b2010 	ldr	r2, [fp, #-16]
    1f78:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    1f7c:	e3023288 	movw	r3, #8840	; 0x2288
    1f80:	e3403000 	movt	r3, #0
    1f84:	e51b200c 	ldr	r2, [fp, #-12]
    1f88:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    1f8c:	e51b3008 	ldr	r3, [fp, #-8]
    1f90:	e2833008 	add	r3, r3, #8
    1f94:	ea000013 	b	1fe8 <malloc+0x174>
        }
        if(p == freep)
    1f98:	e3023288 	movw	r3, #8840	; 0x2288
    1f9c:	e3403000 	movt	r3, #0
    1fa0:	e5933000 	ldr	r3, [r3]
    1fa4:	e51b2008 	ldr	r2, [fp, #-8]
    1fa8:	e1520003 	cmp	r2, r3
    1fac:	1a000007 	bne	1fd0 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    1fb0:	e51b0010 	ldr	r0, [fp, #-16]
    1fb4:	ebffff8b 	bl	1de8 <morecore>
    1fb8:	e50b0008 	str	r0, [fp, #-8]
    1fbc:	e51b3008 	ldr	r3, [fp, #-8]
    1fc0:	e3530000 	cmp	r3, #0
    1fc4:	1a000001 	bne	1fd0 <malloc+0x15c>
                return 0;
    1fc8:	e3a03000 	mov	r3, #0
    1fcc:	ea000005 	b	1fe8 <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1fd0:	e51b3008 	ldr	r3, [fp, #-8]
    1fd4:	e50b300c 	str	r3, [fp, #-12]
    1fd8:	e51b3008 	ldr	r3, [fp, #-8]
    1fdc:	e5933000 	ldr	r3, [r3]
    1fe0:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    1fe4:	eaffffc6 	b	1f04 <malloc+0x90>
}
    1fe8:	e1a00003 	mov	r0, r3
    1fec:	e24bd004 	sub	sp, fp, #4
    1ff0:	e8bd8800 	pop	{fp, pc}

00001ff4 <__aeabi_uidiv>:
    1ff4:	e2512001 	subs	r2, r1, #1
    1ff8:	012fff1e 	bxeq	lr
    1ffc:	3a000036 	bcc	20dc <__aeabi_uidiv+0xe8>
    2000:	e1500001 	cmp	r0, r1
    2004:	9a000022 	bls	2094 <__aeabi_uidiv+0xa0>
    2008:	e1110002 	tst	r1, r2
    200c:	0a000023 	beq	20a0 <__aeabi_uidiv+0xac>
    2010:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    2014:	01a01181 	lsleq	r1, r1, #3
    2018:	03a03008 	moveq	r3, #8
    201c:	13a03001 	movne	r3, #1
    2020:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2024:	31510000 	cmpcc	r1, r0
    2028:	31a01201 	lslcc	r1, r1, #4
    202c:	31a03203 	lslcc	r3, r3, #4
    2030:	3afffffa 	bcc	2020 <__aeabi_uidiv+0x2c>
    2034:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2038:	31510000 	cmpcc	r1, r0
    203c:	31a01081 	lslcc	r1, r1, #1
    2040:	31a03083 	lslcc	r3, r3, #1
    2044:	3afffffa 	bcc	2034 <__aeabi_uidiv+0x40>
    2048:	e3a02000 	mov	r2, #0
    204c:	e1500001 	cmp	r0, r1
    2050:	20400001 	subcs	r0, r0, r1
    2054:	21822003 	orrcs	r2, r2, r3
    2058:	e15000a1 	cmp	r0, r1, lsr #1
    205c:	204000a1 	subcs	r0, r0, r1, lsr #1
    2060:	218220a3 	orrcs	r2, r2, r3, lsr #1
    2064:	e1500121 	cmp	r0, r1, lsr #2
    2068:	20400121 	subcs	r0, r0, r1, lsr #2
    206c:	21822123 	orrcs	r2, r2, r3, lsr #2
    2070:	e15001a1 	cmp	r0, r1, lsr #3
    2074:	204001a1 	subcs	r0, r0, r1, lsr #3
    2078:	218221a3 	orrcs	r2, r2, r3, lsr #3
    207c:	e3500000 	cmp	r0, #0
    2080:	11b03223 	lsrsne	r3, r3, #4
    2084:	11a01221 	lsrne	r1, r1, #4
    2088:	1affffef 	bne	204c <__aeabi_uidiv+0x58>
    208c:	e1a00002 	mov	r0, r2
    2090:	e12fff1e 	bx	lr
    2094:	03a00001 	moveq	r0, #1
    2098:	13a00000 	movne	r0, #0
    209c:	e12fff1e 	bx	lr
    20a0:	e3510801 	cmp	r1, #65536	; 0x10000
    20a4:	21a01821 	lsrcs	r1, r1, #16
    20a8:	23a02010 	movcs	r2, #16
    20ac:	33a02000 	movcc	r2, #0
    20b0:	e3510c01 	cmp	r1, #256	; 0x100
    20b4:	21a01421 	lsrcs	r1, r1, #8
    20b8:	22822008 	addcs	r2, r2, #8
    20bc:	e3510010 	cmp	r1, #16
    20c0:	21a01221 	lsrcs	r1, r1, #4
    20c4:	22822004 	addcs	r2, r2, #4
    20c8:	e3510004 	cmp	r1, #4
    20cc:	82822003 	addhi	r2, r2, #3
    20d0:	908220a1 	addls	r2, r2, r1, lsr #1
    20d4:	e1a00230 	lsr	r0, r0, r2
    20d8:	e12fff1e 	bx	lr
    20dc:	e3500000 	cmp	r0, #0
    20e0:	13e00000 	mvnne	r0, #0
    20e4:	ea000007 	b	2108 <__aeabi_idiv0>

000020e8 <__aeabi_uidivmod>:
    20e8:	e3510000 	cmp	r1, #0
    20ec:	0afffffa 	beq	20dc <__aeabi_uidiv+0xe8>
    20f0:	e92d4003 	push	{r0, r1, lr}
    20f4:	ebffffbe 	bl	1ff4 <__aeabi_uidiv>
    20f8:	e8bd4006 	pop	{r1, r2, lr}
    20fc:	e0030092 	mul	r3, r2, r0
    2100:	e0411003 	sub	r1, r1, r3
    2104:	e12fff1e 	bx	lr

00002108 <__aeabi_idiv0>:
    2108:	e12fff1e 	bx	lr
