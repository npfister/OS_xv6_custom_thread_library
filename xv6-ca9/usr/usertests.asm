
_usertests:     file format elf32-littlearm


Disassembly of section .text:

00000000 <opentest>:

// simple file system tests

void
opentest(void)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd008 	sub	sp, sp, #8
    int fd;

    printf(stdout, "open test\n");
       c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
      10:	e3403000 	movt	r3, #0
      14:	e5933000 	ldr	r3, [r3]
      18:	e1a00003 	mov	r0, r3
      1c:	e305138c 	movw	r1, #21388	; 0x538c
      20:	e3401000 	movt	r1, #0
      24:	eb00131b 	bl	4c98 <printf>
    fd = open("echo", 0);
      28:	e3050370 	movw	r0, #21360	; 0x5370
      2c:	e3400000 	movt	r0, #0
      30:	e3a01000 	mov	r1, #0
      34:	eb001247 	bl	4958 <open>
      38:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
      3c:	e51b3008 	ldr	r3, [fp, #-8]
      40:	e3530000 	cmp	r3, #0
      44:	aa000007 	bge	68 <opentest+0x68>
        printf(stdout, "open echo failed!\n");
      48:	e3063bbc 	movw	r3, #27580	; 0x6bbc
      4c:	e3403000 	movt	r3, #0
      50:	e5933000 	ldr	r3, [r3]
      54:	e1a00003 	mov	r0, r3
      58:	e3051398 	movw	r1, #21400	; 0x5398
      5c:	e3401000 	movt	r1, #0
      60:	eb00130c 	bl	4c98 <printf>
        exit();
      64:	eb0011f3 	bl	4838 <exit>
    }
    close(fd);
      68:	e51b0008 	ldr	r0, [fp, #-8]
      6c:	eb00121e 	bl	48ec <close>
    fd = open("doesnotexist", 0);
      70:	e30503ac 	movw	r0, #21420	; 0x53ac
      74:	e3400000 	movt	r0, #0
      78:	e3a01000 	mov	r1, #0
      7c:	eb001235 	bl	4958 <open>
      80:	e50b0008 	str	r0, [fp, #-8]
    if(fd >= 0){
      84:	e51b3008 	ldr	r3, [fp, #-8]
      88:	e3530000 	cmp	r3, #0
      8c:	ba000007 	blt	b0 <opentest+0xb0>
        printf(stdout, "open doesnotexist succeeded!\n");
      90:	e3063bbc 	movw	r3, #27580	; 0x6bbc
      94:	e3403000 	movt	r3, #0
      98:	e5933000 	ldr	r3, [r3]
      9c:	e1a00003 	mov	r0, r3
      a0:	e30513bc 	movw	r1, #21436	; 0x53bc
      a4:	e3401000 	movt	r1, #0
      a8:	eb0012fa 	bl	4c98 <printf>
        exit();
      ac:	eb0011e1 	bl	4838 <exit>
    }
    printf(stdout, "open test ok\n");
      b0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
      b4:	e3403000 	movt	r3, #0
      b8:	e5933000 	ldr	r3, [r3]
      bc:	e1a00003 	mov	r0, r3
      c0:	e30513dc 	movw	r1, #21468	; 0x53dc
      c4:	e3401000 	movt	r1, #0
      c8:	eb0012f2 	bl	4c98 <printf>
}
      cc:	e24bd004 	sub	sp, fp, #4
      d0:	e8bd8800 	pop	{fp, pc}

000000d4 <writetest>:

void
writetest(void)
{
      d4:	e92d4800 	push	{fp, lr}
      d8:	e28db004 	add	fp, sp, #4
      dc:	e24dd008 	sub	sp, sp, #8
    int fd;
    int i;

    printf(stdout, "small file test\n");
      e0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
      e4:	e3403000 	movt	r3, #0
      e8:	e5933000 	ldr	r3, [r3]
      ec:	e1a00003 	mov	r0, r3
      f0:	e30513ec 	movw	r1, #21484	; 0x53ec
      f4:	e3401000 	movt	r1, #0
      f8:	eb0012e6 	bl	4c98 <printf>
    fd = open("small", O_CREATE|O_RDWR);
      fc:	e3050400 	movw	r0, #21504	; 0x5400
     100:	e3400000 	movt	r0, #0
     104:	e3001202 	movw	r1, #514	; 0x202
     108:	eb001212 	bl	4958 <open>
     10c:	e50b000c 	str	r0, [fp, #-12]
    if(fd >= 0){
     110:	e51b300c 	ldr	r3, [fp, #-12]
     114:	e3530000 	cmp	r3, #0
     118:	ba000009 	blt	144 <writetest+0x70>
        printf(stdout, "creat small succeeded; ok\n");
     11c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     120:	e3403000 	movt	r3, #0
     124:	e5933000 	ldr	r3, [r3]
     128:	e1a00003 	mov	r0, r3
     12c:	e3051408 	movw	r1, #21512	; 0x5408
     130:	e3401000 	movt	r1, #0
     134:	eb0012d7 	bl	4c98 <printf>
    } else {
        printf(stdout, "error: creat small failed!\n");
        exit();
    }
    for(i = 0; i < 100; i++){
     138:	e3a03000 	mov	r3, #0
     13c:	e50b3008 	str	r3, [fp, #-8]
     140:	ea00002c 	b	1f8 <writetest+0x124>
    printf(stdout, "small file test\n");
    fd = open("small", O_CREATE|O_RDWR);
    if(fd >= 0){
        printf(stdout, "creat small succeeded; ok\n");
    } else {
        printf(stdout, "error: creat small failed!\n");
     144:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     148:	e3403000 	movt	r3, #0
     14c:	e5933000 	ldr	r3, [r3]
     150:	e1a00003 	mov	r0, r3
     154:	e3051424 	movw	r1, #21540	; 0x5424
     158:	e3401000 	movt	r1, #0
     15c:	eb0012cd 	bl	4c98 <printf>
        exit();
     160:	eb0011b4 	bl	4838 <exit>
    }
    for(i = 0; i < 100; i++){
        if(write(fd, "aaaaaaaaaa", 10) != 10){
     164:	e51b000c 	ldr	r0, [fp, #-12]
     168:	e3051440 	movw	r1, #21568	; 0x5440
     16c:	e3401000 	movt	r1, #0
     170:	e3a0200a 	mov	r2, #10
     174:	eb0011d3 	bl	48c8 <write>
     178:	e1a03000 	mov	r3, r0
     17c:	e353000a 	cmp	r3, #10
     180:	0a000008 	beq	1a8 <writetest+0xd4>
            printf(stdout, "error: write aa %d new file failed\n", i);
     184:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     188:	e3403000 	movt	r3, #0
     18c:	e5933000 	ldr	r3, [r3]
     190:	e1a00003 	mov	r0, r3
     194:	e305144c 	movw	r1, #21580	; 0x544c
     198:	e3401000 	movt	r1, #0
     19c:	e51b2008 	ldr	r2, [fp, #-8]
     1a0:	eb0012bc 	bl	4c98 <printf>
            exit();
     1a4:	eb0011a3 	bl	4838 <exit>
        }
        if(write(fd, "bbbbbbbbbb", 10) != 10){
     1a8:	e51b000c 	ldr	r0, [fp, #-12]
     1ac:	e3051470 	movw	r1, #21616	; 0x5470
     1b0:	e3401000 	movt	r1, #0
     1b4:	e3a0200a 	mov	r2, #10
     1b8:	eb0011c2 	bl	48c8 <write>
     1bc:	e1a03000 	mov	r3, r0
     1c0:	e353000a 	cmp	r3, #10
     1c4:	0a000008 	beq	1ec <writetest+0x118>
            printf(stdout, "error: write bb %d new file failed\n", i);
     1c8:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     1cc:	e3403000 	movt	r3, #0
     1d0:	e5933000 	ldr	r3, [r3]
     1d4:	e1a00003 	mov	r0, r3
     1d8:	e305147c 	movw	r1, #21628	; 0x547c
     1dc:	e3401000 	movt	r1, #0
     1e0:	e51b2008 	ldr	r2, [fp, #-8]
     1e4:	eb0012ab 	bl	4c98 <printf>
            exit();
     1e8:	eb001192 	bl	4838 <exit>
        printf(stdout, "creat small succeeded; ok\n");
    } else {
        printf(stdout, "error: creat small failed!\n");
        exit();
    }
    for(i = 0; i < 100; i++){
     1ec:	e51b3008 	ldr	r3, [fp, #-8]
     1f0:	e2833001 	add	r3, r3, #1
     1f4:	e50b3008 	str	r3, [fp, #-8]
     1f8:	e51b3008 	ldr	r3, [fp, #-8]
     1fc:	e3530063 	cmp	r3, #99	; 0x63
     200:	daffffd7 	ble	164 <writetest+0x90>
        if(write(fd, "bbbbbbbbbb", 10) != 10){
            printf(stdout, "error: write bb %d new file failed\n", i);
            exit();
        }
    }
    printf(stdout, "writes ok\n");
     204:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     208:	e3403000 	movt	r3, #0
     20c:	e5933000 	ldr	r3, [r3]
     210:	e1a00003 	mov	r0, r3
     214:	e30514a0 	movw	r1, #21664	; 0x54a0
     218:	e3401000 	movt	r1, #0
     21c:	eb00129d 	bl	4c98 <printf>
    close(fd);
     220:	e51b000c 	ldr	r0, [fp, #-12]
     224:	eb0011b0 	bl	48ec <close>
    fd = open("small", O_RDONLY);
     228:	e3050400 	movw	r0, #21504	; 0x5400
     22c:	e3400000 	movt	r0, #0
     230:	e3a01000 	mov	r1, #0
     234:	eb0011c7 	bl	4958 <open>
     238:	e50b000c 	str	r0, [fp, #-12]
    if(fd >= 0){
     23c:	e51b300c 	ldr	r3, [fp, #-12]
     240:	e3530000 	cmp	r3, #0
     244:	ba000010 	blt	28c <writetest+0x1b8>
        printf(stdout, "open small succeeded ok\n");
     248:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     24c:	e3403000 	movt	r3, #0
     250:	e5933000 	ldr	r3, [r3]
     254:	e1a00003 	mov	r0, r3
     258:	e30514ac 	movw	r1, #21676	; 0x54ac
     25c:	e3401000 	movt	r1, #0
     260:	eb00128c 	bl	4c98 <printf>
    } else {
        printf(stdout, "error: open small failed!\n");
        exit();
    }
    i = read(fd, buf, 2000);
     264:	e51b000c 	ldr	r0, [fp, #-12]
     268:	e3091374 	movw	r1, #37748	; 0x9374
     26c:	e3401000 	movt	r1, #0
     270:	e3a02e7d 	mov	r2, #2000	; 0x7d0
     274:	eb00118a 	bl	48a4 <read>
     278:	e50b0008 	str	r0, [fp, #-8]
    if(i == 2000){
     27c:	e51b3008 	ldr	r3, [fp, #-8]
     280:	e3530e7d 	cmp	r3, #2000	; 0x7d0
     284:	0a000008 	beq	2ac <writetest+0x1d8>
     288:	ea000017 	b	2ec <writetest+0x218>
    close(fd);
    fd = open("small", O_RDONLY);
    if(fd >= 0){
        printf(stdout, "open small succeeded ok\n");
    } else {
        printf(stdout, "error: open small failed!\n");
     28c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     290:	e3403000 	movt	r3, #0
     294:	e5933000 	ldr	r3, [r3]
     298:	e1a00003 	mov	r0, r3
     29c:	e30514c8 	movw	r1, #21704	; 0x54c8
     2a0:	e3401000 	movt	r1, #0
     2a4:	eb00127b 	bl	4c98 <printf>
        exit();
     2a8:	eb001162 	bl	4838 <exit>
    }
    i = read(fd, buf, 2000);
    if(i == 2000){
        printf(stdout, "read succeeded ok\n");
     2ac:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     2b0:	e3403000 	movt	r3, #0
     2b4:	e5933000 	ldr	r3, [r3]
     2b8:	e1a00003 	mov	r0, r3
     2bc:	e30514e4 	movw	r1, #21732	; 0x54e4
     2c0:	e3401000 	movt	r1, #0
     2c4:	eb001273 	bl	4c98 <printf>
    } else {
        printf(stdout, "read failed\n");
        exit();
    }
    close(fd);
     2c8:	e51b000c 	ldr	r0, [fp, #-12]
     2cc:	eb001186 	bl	48ec <close>

    if(unlink("small") < 0){
     2d0:	e3050400 	movw	r0, #21504	; 0x5400
     2d4:	e3400000 	movt	r0, #0
     2d8:	eb0011b0 	bl	49a0 <unlink>
     2dc:	e1a03000 	mov	r3, r0
     2e0:	e3530000 	cmp	r3, #0
     2e4:	ba000008 	blt	30c <writetest+0x238>
     2e8:	ea00000f 	b	32c <writetest+0x258>
    }
    i = read(fd, buf, 2000);
    if(i == 2000){
        printf(stdout, "read succeeded ok\n");
    } else {
        printf(stdout, "read failed\n");
     2ec:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     2f0:	e3403000 	movt	r3, #0
     2f4:	e5933000 	ldr	r3, [r3]
     2f8:	e1a00003 	mov	r0, r3
     2fc:	e30514f8 	movw	r1, #21752	; 0x54f8
     300:	e3401000 	movt	r1, #0
     304:	eb001263 	bl	4c98 <printf>
        exit();
     308:	eb00114a 	bl	4838 <exit>
    }
    close(fd);

    if(unlink("small") < 0){
        printf(stdout, "unlink small failed\n");
     30c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     310:	e3403000 	movt	r3, #0
     314:	e5933000 	ldr	r3, [r3]
     318:	e1a00003 	mov	r0, r3
     31c:	e3051508 	movw	r1, #21768	; 0x5508
     320:	e3401000 	movt	r1, #0
     324:	eb00125b 	bl	4c98 <printf>
        exit();
     328:	eb001142 	bl	4838 <exit>
    }
    printf(stdout, "small file test ok\n");
     32c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     330:	e3403000 	movt	r3, #0
     334:	e5933000 	ldr	r3, [r3]
     338:	e1a00003 	mov	r0, r3
     33c:	e3051520 	movw	r1, #21792	; 0x5520
     340:	e3401000 	movt	r1, #0
     344:	eb001253 	bl	4c98 <printf>
}
     348:	e24bd004 	sub	sp, fp, #4
     34c:	e8bd8800 	pop	{fp, pc}

00000350 <writetest1>:

void
writetest1(void)
{
     350:	e92d4800 	push	{fp, lr}
     354:	e28db004 	add	fp, sp, #4
     358:	e24dd010 	sub	sp, sp, #16
    int i, fd, n;

    printf(stdout, "big files test\n");
     35c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     360:	e3403000 	movt	r3, #0
     364:	e5933000 	ldr	r3, [r3]
     368:	e1a00003 	mov	r0, r3
     36c:	e3051534 	movw	r1, #21812	; 0x5534
     370:	e3401000 	movt	r1, #0
     374:	eb001247 	bl	4c98 <printf>

    fd = open("big", O_CREATE|O_RDWR);
     378:	e3050544 	movw	r0, #21828	; 0x5544
     37c:	e3400000 	movt	r0, #0
     380:	e3001202 	movw	r1, #514	; 0x202
     384:	eb001173 	bl	4958 <open>
     388:	e50b0010 	str	r0, [fp, #-16]
    if(fd < 0){
     38c:	e51b3010 	ldr	r3, [fp, #-16]
     390:	e3530000 	cmp	r3, #0
     394:	aa000007 	bge	3b8 <writetest1+0x68>
        printf(stdout, "error: creat big failed!\n");
     398:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     39c:	e3403000 	movt	r3, #0
     3a0:	e5933000 	ldr	r3, [r3]
     3a4:	e1a00003 	mov	r0, r3
     3a8:	e3051548 	movw	r1, #21832	; 0x5548
     3ac:	e3401000 	movt	r1, #0
     3b0:	eb001238 	bl	4c98 <printf>
        exit();
     3b4:	eb00111f 	bl	4838 <exit>
    }

    for(i = 0; i < MAXFILE; i++){
     3b8:	e3a03000 	mov	r3, #0
     3bc:	e50b3008 	str	r3, [fp, #-8]
     3c0:	ea000017 	b	424 <writetest1+0xd4>
        ((int*)buf)[0] = i;
     3c4:	e3093374 	movw	r3, #37748	; 0x9374
     3c8:	e3403000 	movt	r3, #0
     3cc:	e51b2008 	ldr	r2, [fp, #-8]
     3d0:	e5832000 	str	r2, [r3]
        if(write(fd, buf, 512) != 512){
     3d4:	e51b0010 	ldr	r0, [fp, #-16]
     3d8:	e3091374 	movw	r1, #37748	; 0x9374
     3dc:	e3401000 	movt	r1, #0
     3e0:	e3a02c02 	mov	r2, #512	; 0x200
     3e4:	eb001137 	bl	48c8 <write>
     3e8:	e1a03000 	mov	r3, r0
     3ec:	e3530c02 	cmp	r3, #512	; 0x200
     3f0:	0a000008 	beq	418 <writetest1+0xc8>
            printf(stdout, "error: write big file failed\n", i);
     3f4:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     3f8:	e3403000 	movt	r3, #0
     3fc:	e5933000 	ldr	r3, [r3]
     400:	e1a00003 	mov	r0, r3
     404:	e3051564 	movw	r1, #21860	; 0x5564
     408:	e3401000 	movt	r1, #0
     40c:	e51b2008 	ldr	r2, [fp, #-8]
     410:	eb001220 	bl	4c98 <printf>
            exit();
     414:	eb001107 	bl	4838 <exit>
    if(fd < 0){
        printf(stdout, "error: creat big failed!\n");
        exit();
    }

    for(i = 0; i < MAXFILE; i++){
     418:	e51b3008 	ldr	r3, [fp, #-8]
     41c:	e2833001 	add	r3, r3, #1
     420:	e50b3008 	str	r3, [fp, #-8]
     424:	e51b3008 	ldr	r3, [fp, #-8]
     428:	e353008b 	cmp	r3, #139	; 0x8b
     42c:	9affffe4 	bls	3c4 <writetest1+0x74>
            printf(stdout, "error: write big file failed\n", i);
            exit();
        }
    }

    close(fd);
     430:	e51b0010 	ldr	r0, [fp, #-16]
     434:	eb00112c 	bl	48ec <close>

    fd = open("big", O_RDONLY);
     438:	e3050544 	movw	r0, #21828	; 0x5544
     43c:	e3400000 	movt	r0, #0
     440:	e3a01000 	mov	r1, #0
     444:	eb001143 	bl	4958 <open>
     448:	e50b0010 	str	r0, [fp, #-16]
    if(fd < 0){
     44c:	e51b3010 	ldr	r3, [fp, #-16]
     450:	e3530000 	cmp	r3, #0
     454:	aa000007 	bge	478 <writetest1+0x128>
        printf(stdout, "error: open big failed!\n");
     458:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     45c:	e3403000 	movt	r3, #0
     460:	e5933000 	ldr	r3, [r3]
     464:	e1a00003 	mov	r0, r3
     468:	e3051584 	movw	r1, #21892	; 0x5584
     46c:	e3401000 	movt	r1, #0
     470:	eb001208 	bl	4c98 <printf>
        exit();
     474:	eb0010ef 	bl	4838 <exit>
    }

    n = 0;
     478:	e3a03000 	mov	r3, #0
     47c:	e50b300c 	str	r3, [fp, #-12]
    for(;;){
        i = read(fd, buf, 512);
     480:	e51b0010 	ldr	r0, [fp, #-16]
     484:	e3091374 	movw	r1, #37748	; 0x9374
     488:	e3401000 	movt	r1, #0
     48c:	e3a02c02 	mov	r2, #512	; 0x200
     490:	eb001103 	bl	48a4 <read>
     494:	e50b0008 	str	r0, [fp, #-8]
        if(i == 0){
     498:	e51b3008 	ldr	r3, [fp, #-8]
     49c:	e3530000 	cmp	r3, #0
     4a0:	1a00000b 	bne	4d4 <writetest1+0x184>
            if(n == MAXFILE - 1){
     4a4:	e51b300c 	ldr	r3, [fp, #-12]
     4a8:	e353008b 	cmp	r3, #139	; 0x8b
     4ac:	1a00002a 	bne	55c <writetest1+0x20c>
                printf(stdout, "read only %d blocks from big", n);
     4b0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     4b4:	e3403000 	movt	r3, #0
     4b8:	e5933000 	ldr	r3, [r3]
     4bc:	e1a00003 	mov	r0, r3
     4c0:	e30515a0 	movw	r1, #21920	; 0x55a0
     4c4:	e3401000 	movt	r1, #0
     4c8:	e51b200c 	ldr	r2, [fp, #-12]
     4cc:	eb0011f1 	bl	4c98 <printf>
                exit();
     4d0:	eb0010d8 	bl	4838 <exit>
            }
            break;
        } else if(i != 512){
     4d4:	e51b3008 	ldr	r3, [fp, #-8]
     4d8:	e3530c02 	cmp	r3, #512	; 0x200
     4dc:	0a000008 	beq	504 <writetest1+0x1b4>
            printf(stdout, "read failed %d\n", i);
     4e0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     4e4:	e3403000 	movt	r3, #0
     4e8:	e5933000 	ldr	r3, [r3]
     4ec:	e1a00003 	mov	r0, r3
     4f0:	e30515c0 	movw	r1, #21952	; 0x55c0
     4f4:	e3401000 	movt	r1, #0
     4f8:	e51b2008 	ldr	r2, [fp, #-8]
     4fc:	eb0011e5 	bl	4c98 <printf>
            exit();
     500:	eb0010cc 	bl	4838 <exit>
        }
        if(((int*)buf)[0] != n){
     504:	e3093374 	movw	r3, #37748	; 0x9374
     508:	e3403000 	movt	r3, #0
     50c:	e5932000 	ldr	r2, [r3]
     510:	e51b300c 	ldr	r3, [fp, #-12]
     514:	e1520003 	cmp	r2, r3
     518:	0a00000b 	beq	54c <writetest1+0x1fc>
            printf(stdout, "read content of block %d is %d\n",
     51c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     520:	e3403000 	movt	r3, #0
     524:	e5932000 	ldr	r2, [r3]
                   n, ((int*)buf)[0]);
     528:	e3093374 	movw	r3, #37748	; 0x9374
     52c:	e3403000 	movt	r3, #0
        } else if(i != 512){
            printf(stdout, "read failed %d\n", i);
            exit();
        }
        if(((int*)buf)[0] != n){
            printf(stdout, "read content of block %d is %d\n",
     530:	e5933000 	ldr	r3, [r3]
     534:	e1a00002 	mov	r0, r2
     538:	e30515d0 	movw	r1, #21968	; 0x55d0
     53c:	e3401000 	movt	r1, #0
     540:	e51b200c 	ldr	r2, [fp, #-12]
     544:	eb0011d3 	bl	4c98 <printf>
                   n, ((int*)buf)[0]);
            exit();
     548:	eb0010ba 	bl	4838 <exit>
        }
        n++;
     54c:	e51b300c 	ldr	r3, [fp, #-12]
     550:	e2833001 	add	r3, r3, #1
     554:	e50b300c 	str	r3, [fp, #-12]
    }
     558:	eaffffc8 	b	480 <writetest1+0x130>
        if(i == 0){
            if(n == MAXFILE - 1){
                printf(stdout, "read only %d blocks from big", n);
                exit();
            }
            break;
     55c:	e1a00000 	nop			; (mov r0, r0)
                   n, ((int*)buf)[0]);
            exit();
        }
        n++;
    }
    close(fd);
     560:	e51b0010 	ldr	r0, [fp, #-16]
     564:	eb0010e0 	bl	48ec <close>
    if(unlink("big") < 0){
     568:	e3050544 	movw	r0, #21828	; 0x5544
     56c:	e3400000 	movt	r0, #0
     570:	eb00110a 	bl	49a0 <unlink>
     574:	e1a03000 	mov	r3, r0
     578:	e3530000 	cmp	r3, #0
     57c:	aa000007 	bge	5a0 <writetest1+0x250>
        printf(stdout, "unlink big failed\n");
     580:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     584:	e3403000 	movt	r3, #0
     588:	e5933000 	ldr	r3, [r3]
     58c:	e1a00003 	mov	r0, r3
     590:	e30515f0 	movw	r1, #22000	; 0x55f0
     594:	e3401000 	movt	r1, #0
     598:	eb0011be 	bl	4c98 <printf>
        exit();
     59c:	eb0010a5 	bl	4838 <exit>
    }
    printf(stdout, "big files ok\n");
     5a0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     5a4:	e3403000 	movt	r3, #0
     5a8:	e5933000 	ldr	r3, [r3]
     5ac:	e1a00003 	mov	r0, r3
     5b0:	e3051604 	movw	r1, #22020	; 0x5604
     5b4:	e3401000 	movt	r1, #0
     5b8:	eb0011b6 	bl	4c98 <printf>
}
     5bc:	e24bd004 	sub	sp, fp, #4
     5c0:	e8bd8800 	pop	{fp, pc}

000005c4 <createtest>:

void
createtest(void)
{
     5c4:	e92d4800 	push	{fp, lr}
     5c8:	e28db004 	add	fp, sp, #4
     5cc:	e24dd008 	sub	sp, sp, #8
    int i, fd;

    printf(stdout, "many creates, followed by unlink test\n");
     5d0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     5d4:	e3403000 	movt	r3, #0
     5d8:	e5933000 	ldr	r3, [r3]
     5dc:	e1a00003 	mov	r0, r3
     5e0:	e3051614 	movw	r1, #22036	; 0x5614
     5e4:	e3401000 	movt	r1, #0
     5e8:	eb0011aa 	bl	4c98 <printf>

    name[0] = 'a';
     5ec:	e30b3374 	movw	r3, #45940	; 0xb374
     5f0:	e3403000 	movt	r3, #0
     5f4:	e3a02061 	mov	r2, #97	; 0x61
     5f8:	e5c32000 	strb	r2, [r3]
    name[2] = '\0';
     5fc:	e30b3374 	movw	r3, #45940	; 0xb374
     600:	e3403000 	movt	r3, #0
     604:	e3a02000 	mov	r2, #0
     608:	e5c32002 	strb	r2, [r3, #2]
    for(i = 0; i < 52; i++){
     60c:	e3a03000 	mov	r3, #0
     610:	e50b3008 	str	r3, [fp, #-8]
     614:	ea000010 	b	65c <createtest+0x98>
        name[1] = '0' + i;
     618:	e51b3008 	ldr	r3, [fp, #-8]
     61c:	e6ef3073 	uxtb	r3, r3
     620:	e2833030 	add	r3, r3, #48	; 0x30
     624:	e6ef2073 	uxtb	r2, r3
     628:	e30b3374 	movw	r3, #45940	; 0xb374
     62c:	e3403000 	movt	r3, #0
     630:	e5c32001 	strb	r2, [r3, #1]
        fd = open(name, O_CREATE|O_RDWR);
     634:	e30b0374 	movw	r0, #45940	; 0xb374
     638:	e3400000 	movt	r0, #0
     63c:	e3001202 	movw	r1, #514	; 0x202
     640:	eb0010c4 	bl	4958 <open>
     644:	e50b000c 	str	r0, [fp, #-12]
        close(fd);
     648:	e51b000c 	ldr	r0, [fp, #-12]
     64c:	eb0010a6 	bl	48ec <close>

    printf(stdout, "many creates, followed by unlink test\n");

    name[0] = 'a';
    name[2] = '\0';
    for(i = 0; i < 52; i++){
     650:	e51b3008 	ldr	r3, [fp, #-8]
     654:	e2833001 	add	r3, r3, #1
     658:	e50b3008 	str	r3, [fp, #-8]
     65c:	e51b3008 	ldr	r3, [fp, #-8]
     660:	e3530033 	cmp	r3, #51	; 0x33
     664:	daffffeb 	ble	618 <createtest+0x54>
        name[1] = '0' + i;
        fd = open(name, O_CREATE|O_RDWR);
        close(fd);
    }
    name[0] = 'a';
     668:	e30b3374 	movw	r3, #45940	; 0xb374
     66c:	e3403000 	movt	r3, #0
     670:	e3a02061 	mov	r2, #97	; 0x61
     674:	e5c32000 	strb	r2, [r3]
    name[2] = '\0';
     678:	e30b3374 	movw	r3, #45940	; 0xb374
     67c:	e3403000 	movt	r3, #0
     680:	e3a02000 	mov	r2, #0
     684:	e5c32002 	strb	r2, [r3, #2]
    for(i = 0; i < 52; i++){
     688:	e3a03000 	mov	r3, #0
     68c:	e50b3008 	str	r3, [fp, #-8]
     690:	ea00000c 	b	6c8 <createtest+0x104>
        name[1] = '0' + i;
     694:	e51b3008 	ldr	r3, [fp, #-8]
     698:	e6ef3073 	uxtb	r3, r3
     69c:	e2833030 	add	r3, r3, #48	; 0x30
     6a0:	e6ef2073 	uxtb	r2, r3
     6a4:	e30b3374 	movw	r3, #45940	; 0xb374
     6a8:	e3403000 	movt	r3, #0
     6ac:	e5c32001 	strb	r2, [r3, #1]
        unlink(name);
     6b0:	e30b0374 	movw	r0, #45940	; 0xb374
     6b4:	e3400000 	movt	r0, #0
     6b8:	eb0010b8 	bl	49a0 <unlink>
        fd = open(name, O_CREATE|O_RDWR);
        close(fd);
    }
    name[0] = 'a';
    name[2] = '\0';
    for(i = 0; i < 52; i++){
     6bc:	e51b3008 	ldr	r3, [fp, #-8]
     6c0:	e2833001 	add	r3, r3, #1
     6c4:	e50b3008 	str	r3, [fp, #-8]
     6c8:	e51b3008 	ldr	r3, [fp, #-8]
     6cc:	e3530033 	cmp	r3, #51	; 0x33
     6d0:	daffffef 	ble	694 <createtest+0xd0>
        name[1] = '0' + i;
        unlink(name);
    }
    printf(stdout, "many creates, followed by unlink; ok\n");
     6d4:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     6d8:	e3403000 	movt	r3, #0
     6dc:	e5933000 	ldr	r3, [r3]
     6e0:	e1a00003 	mov	r0, r3
     6e4:	e305163c 	movw	r1, #22076	; 0x563c
     6e8:	e3401000 	movt	r1, #0
     6ec:	eb001169 	bl	4c98 <printf>
}
     6f0:	e24bd004 	sub	sp, fp, #4
     6f4:	e8bd8800 	pop	{fp, pc}

000006f8 <dirtest>:

void dirtest(void)
{
     6f8:	e92d4800 	push	{fp, lr}
     6fc:	e28db004 	add	fp, sp, #4
    printf(stdout, "mkdir test\n");
     700:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     704:	e3403000 	movt	r3, #0
     708:	e5933000 	ldr	r3, [r3]
     70c:	e1a00003 	mov	r0, r3
     710:	e3051664 	movw	r1, #22116	; 0x5664
     714:	e3401000 	movt	r1, #0
     718:	eb00115e 	bl	4c98 <printf>

    if(mkdir("dir0") < 0){
     71c:	e3050670 	movw	r0, #22128	; 0x5670
     720:	e3400000 	movt	r0, #0
     724:	eb0010b8 	bl	4a0c <mkdir>
     728:	e1a03000 	mov	r3, r0
     72c:	e3530000 	cmp	r3, #0
     730:	aa000007 	bge	754 <dirtest+0x5c>
        printf(stdout, "mkdir failed\n");
     734:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     738:	e3403000 	movt	r3, #0
     73c:	e5933000 	ldr	r3, [r3]
     740:	e1a00003 	mov	r0, r3
     744:	e3051678 	movw	r1, #22136	; 0x5678
     748:	e3401000 	movt	r1, #0
     74c:	eb001151 	bl	4c98 <printf>
        exit();
     750:	eb001038 	bl	4838 <exit>
    }

    if(chdir("dir0") < 0){
     754:	e3050670 	movw	r0, #22128	; 0x5670
     758:	e3400000 	movt	r0, #0
     75c:	eb0010b3 	bl	4a30 <chdir>
     760:	e1a03000 	mov	r3, r0
     764:	e3530000 	cmp	r3, #0
     768:	aa000007 	bge	78c <dirtest+0x94>
        printf(stdout, "chdir dir0 failed\n");
     76c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     770:	e3403000 	movt	r3, #0
     774:	e5933000 	ldr	r3, [r3]
     778:	e1a00003 	mov	r0, r3
     77c:	e3051688 	movw	r1, #22152	; 0x5688
     780:	e3401000 	movt	r1, #0
     784:	eb001143 	bl	4c98 <printf>
        exit();
     788:	eb00102a 	bl	4838 <exit>
    }

    if(chdir("..") < 0){
     78c:	e305069c 	movw	r0, #22172	; 0x569c
     790:	e3400000 	movt	r0, #0
     794:	eb0010a5 	bl	4a30 <chdir>
     798:	e1a03000 	mov	r3, r0
     79c:	e3530000 	cmp	r3, #0
     7a0:	aa000007 	bge	7c4 <dirtest+0xcc>
        printf(stdout, "chdir .. failed\n");
     7a4:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     7a8:	e3403000 	movt	r3, #0
     7ac:	e5933000 	ldr	r3, [r3]
     7b0:	e1a00003 	mov	r0, r3
     7b4:	e30516a0 	movw	r1, #22176	; 0x56a0
     7b8:	e3401000 	movt	r1, #0
     7bc:	eb001135 	bl	4c98 <printf>
        exit();
     7c0:	eb00101c 	bl	4838 <exit>
    }

    if(unlink("dir0") < 0){
     7c4:	e3050670 	movw	r0, #22128	; 0x5670
     7c8:	e3400000 	movt	r0, #0
     7cc:	eb001073 	bl	49a0 <unlink>
     7d0:	e1a03000 	mov	r3, r0
     7d4:	e3530000 	cmp	r3, #0
     7d8:	aa000007 	bge	7fc <dirtest+0x104>
        printf(stdout, "unlink dir0 failed\n");
     7dc:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     7e0:	e3403000 	movt	r3, #0
     7e4:	e5933000 	ldr	r3, [r3]
     7e8:	e1a00003 	mov	r0, r3
     7ec:	e30516b4 	movw	r1, #22196	; 0x56b4
     7f0:	e3401000 	movt	r1, #0
     7f4:	eb001127 	bl	4c98 <printf>
        exit();
     7f8:	eb00100e 	bl	4838 <exit>
    }
    printf(stdout, "mkdir test\n");
     7fc:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     800:	e3403000 	movt	r3, #0
     804:	e5933000 	ldr	r3, [r3]
     808:	e1a00003 	mov	r0, r3
     80c:	e3051664 	movw	r1, #22116	; 0x5664
     810:	e3401000 	movt	r1, #0
     814:	eb00111f 	bl	4c98 <printf>
}
     818:	e8bd8800 	pop	{fp, pc}

0000081c <exectest>:

void
exectest(void)
{
     81c:	e92d4800 	push	{fp, lr}
     820:	e28db004 	add	fp, sp, #4
    printf(stdout, "exec test\n");
     824:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     828:	e3403000 	movt	r3, #0
     82c:	e5933000 	ldr	r3, [r3]
     830:	e1a00003 	mov	r0, r3
     834:	e30516c8 	movw	r1, #22216	; 0x56c8
     838:	e3401000 	movt	r1, #0
     83c:	eb001115 	bl	4c98 <printf>
    if(exec("echo", echoargv) < 0){
     840:	e3050370 	movw	r0, #21360	; 0x5370
     844:	e3400000 	movt	r0, #0
     848:	e3061ba8 	movw	r1, #27560	; 0x6ba8
     84c:	e3401000 	movt	r1, #0
     850:	eb001037 	bl	4934 <exec>
     854:	e1a03000 	mov	r3, r0
     858:	e3530000 	cmp	r3, #0
     85c:	aa000007 	bge	880 <exectest+0x64>
        printf(stdout, "exec echo failed\n");
     860:	e3063bbc 	movw	r3, #27580	; 0x6bbc
     864:	e3403000 	movt	r3, #0
     868:	e5933000 	ldr	r3, [r3]
     86c:	e1a00003 	mov	r0, r3
     870:	e30516d4 	movw	r1, #22228	; 0x56d4
     874:	e3401000 	movt	r1, #0
     878:	eb001106 	bl	4c98 <printf>
        exit();
     87c:	eb000fed 	bl	4838 <exit>
    }
}
     880:	e8bd8800 	pop	{fp, pc}

00000884 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     884:	e92d4800 	push	{fp, lr}
     888:	e28db004 	add	fp, sp, #4
     88c:	e24dd020 	sub	sp, sp, #32
    int fds[2], pid;
    int seq, i, n, cc, total;

    if(pipe(fds) != 0){
     890:	e24b3024 	sub	r3, fp, #36	; 0x24
     894:	e1a00003 	mov	r0, r3
     898:	eb000ff8 	bl	4880 <pipe>
     89c:	e1a03000 	mov	r3, r0
     8a0:	e3530000 	cmp	r3, #0
     8a4:	0a000004 	beq	8bc <pipe1+0x38>
        printf(1, "pipe() failed\n");
     8a8:	e3a00001 	mov	r0, #1
     8ac:	e30516e8 	movw	r1, #22248	; 0x56e8
     8b0:	e3401000 	movt	r1, #0
     8b4:	eb0010f7 	bl	4c98 <printf>
        exit();
     8b8:	eb000fde 	bl	4838 <exit>
    }
    pid = fork();
     8bc:	eb000fd4 	bl	4814 <fork>
     8c0:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    seq = 0;
     8c4:	e3a03000 	mov	r3, #0
     8c8:	e50b3008 	str	r3, [fp, #-8]
    if(pid == 0){
     8cc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     8d0:	e3530000 	cmp	r3, #0
     8d4:	1a00002f 	bne	998 <pipe1+0x114>
        close(fds[0]);
     8d8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     8dc:	e1a00003 	mov	r0, r3
     8e0:	eb001001 	bl	48ec <close>
        for(n = 0; n < 5; n++){
     8e4:	e3a03000 	mov	r3, #0
     8e8:	e50b3010 	str	r3, [fp, #-16]
     8ec:	ea000025 	b	988 <pipe1+0x104>
            for(i = 0; i < 1033; i++)
     8f0:	e3a03000 	mov	r3, #0
     8f4:	e50b300c 	str	r3, [fp, #-12]
     8f8:	ea00000c 	b	930 <pipe1+0xac>
                buf[i] = seq++;
     8fc:	e51b3008 	ldr	r3, [fp, #-8]
     900:	e6ef2073 	uxtb	r2, r3
     904:	e3093374 	movw	r3, #37748	; 0x9374
     908:	e3403000 	movt	r3, #0
     90c:	e51b100c 	ldr	r1, [fp, #-12]
     910:	e0833001 	add	r3, r3, r1
     914:	e5c32000 	strb	r2, [r3]
     918:	e51b3008 	ldr	r3, [fp, #-8]
     91c:	e2833001 	add	r3, r3, #1
     920:	e50b3008 	str	r3, [fp, #-8]
    pid = fork();
    seq = 0;
    if(pid == 0){
        close(fds[0]);
        for(n = 0; n < 5; n++){
            for(i = 0; i < 1033; i++)
     924:	e51b300c 	ldr	r3, [fp, #-12]
     928:	e2833001 	add	r3, r3, #1
     92c:	e50b300c 	str	r3, [fp, #-12]
     930:	e51b200c 	ldr	r2, [fp, #-12]
     934:	e3003408 	movw	r3, #1032	; 0x408
     938:	e1520003 	cmp	r2, r3
     93c:	daffffee 	ble	8fc <pipe1+0x78>
                buf[i] = seq++;
            if(write(fds[1], buf, 1033) != 1033){
     940:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     944:	e1a00003 	mov	r0, r3
     948:	e3091374 	movw	r1, #37748	; 0x9374
     94c:	e3401000 	movt	r1, #0
     950:	e3002409 	movw	r2, #1033	; 0x409
     954:	eb000fdb 	bl	48c8 <write>
     958:	e1a02000 	mov	r2, r0
     95c:	e3003409 	movw	r3, #1033	; 0x409
     960:	e1520003 	cmp	r2, r3
     964:	0a000004 	beq	97c <pipe1+0xf8>
                printf(1, "pipe1 oops 1\n");
     968:	e3a00001 	mov	r0, #1
     96c:	e30516f8 	movw	r1, #22264	; 0x56f8
     970:	e3401000 	movt	r1, #0
     974:	eb0010c7 	bl	4c98 <printf>
                exit();
     978:	eb000fae 	bl	4838 <exit>
    }
    pid = fork();
    seq = 0;
    if(pid == 0){
        close(fds[0]);
        for(n = 0; n < 5; n++){
     97c:	e51b3010 	ldr	r3, [fp, #-16]
     980:	e2833001 	add	r3, r3, #1
     984:	e50b3010 	str	r3, [fp, #-16]
     988:	e51b3010 	ldr	r3, [fp, #-16]
     98c:	e3530004 	cmp	r3, #4
     990:	daffffd6 	ble	8f0 <pipe1+0x6c>
            if(write(fds[1], buf, 1033) != 1033){
                printf(1, "pipe1 oops 1\n");
                exit();
            }
        }
        exit();
     994:	eb000fa7 	bl	4838 <exit>
    } else if(pid > 0){
     998:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     99c:	e3530000 	cmp	r3, #0
     9a0:	da000050 	ble	ae8 <pipe1+0x264>
        close(fds[1]);
     9a4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     9a8:	e1a00003 	mov	r0, r3
     9ac:	eb000fce 	bl	48ec <close>
        total = 0;
     9b0:	e3a03000 	mov	r3, #0
     9b4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        cc = 1;
     9b8:	e3a03001 	mov	r3, #1
     9bc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        while((n = read(fds[0], buf, cc)) > 0){
     9c0:	ea00002b 	b	a74 <pipe1+0x1f0>
            for(i = 0; i < n; i++){
     9c4:	e3a03000 	mov	r3, #0
     9c8:	e50b300c 	str	r3, [fp, #-12]
     9cc:	ea000018 	b	a34 <pipe1+0x1b0>
                if((buf[i] & 0xff) != (seq++ & 0xff)){
     9d0:	e3093374 	movw	r3, #37748	; 0x9374
     9d4:	e3403000 	movt	r3, #0
     9d8:	e51b200c 	ldr	r2, [fp, #-12]
     9dc:	e0833002 	add	r3, r3, r2
     9e0:	e5d33000 	ldrb	r3, [r3]
     9e4:	e1a02003 	mov	r2, r3
     9e8:	e51b3008 	ldr	r3, [fp, #-8]
     9ec:	e6ef3073 	uxtb	r3, r3
     9f0:	e1520003 	cmp	r2, r3
     9f4:	03a03000 	moveq	r3, #0
     9f8:	13a03001 	movne	r3, #1
     9fc:	e6ef3073 	uxtb	r3, r3
     a00:	e51b2008 	ldr	r2, [fp, #-8]
     a04:	e2822001 	add	r2, r2, #1
     a08:	e50b2008 	str	r2, [fp, #-8]
     a0c:	e3530000 	cmp	r3, #0
     a10:	0a000004 	beq	a28 <pipe1+0x1a4>
                    printf(1, "pipe1 oops 2\n");
     a14:	e3a00001 	mov	r0, #1
     a18:	e3051708 	movw	r1, #22280	; 0x5708
     a1c:	e3401000 	movt	r1, #0
     a20:	eb00109c 	bl	4c98 <printf>
                    return;
     a24:	ea000034 	b	afc <pipe1+0x278>
    } else if(pid > 0){
        close(fds[1]);
        total = 0;
        cc = 1;
        while((n = read(fds[0], buf, cc)) > 0){
            for(i = 0; i < n; i++){
     a28:	e51b300c 	ldr	r3, [fp, #-12]
     a2c:	e2833001 	add	r3, r3, #1
     a30:	e50b300c 	str	r3, [fp, #-12]
     a34:	e51b200c 	ldr	r2, [fp, #-12]
     a38:	e51b3010 	ldr	r3, [fp, #-16]
     a3c:	e1520003 	cmp	r2, r3
     a40:	baffffe2 	blt	9d0 <pipe1+0x14c>
                if((buf[i] & 0xff) != (seq++ & 0xff)){
                    printf(1, "pipe1 oops 2\n");
                    return;
                }
            }
            total += n;
     a44:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     a48:	e51b3010 	ldr	r3, [fp, #-16]
     a4c:	e0823003 	add	r3, r2, r3
     a50:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
            cc = cc * 2;
     a54:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a58:	e1a03083 	lsl	r3, r3, #1
     a5c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            if(cc > sizeof(buf))
     a60:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     a64:	e3530a02 	cmp	r3, #8192	; 0x2000
     a68:	9a000001 	bls	a74 <pipe1+0x1f0>
                cc = sizeof(buf);
     a6c:	e3a03a02 	mov	r3, #8192	; 0x2000
     a70:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        exit();
    } else if(pid > 0){
        close(fds[1]);
        total = 0;
        cc = 1;
        while((n = read(fds[0], buf, cc)) > 0){
     a74:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     a78:	e1a00003 	mov	r0, r3
     a7c:	e3091374 	movw	r1, #37748	; 0x9374
     a80:	e3401000 	movt	r1, #0
     a84:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     a88:	eb000f85 	bl	48a4 <read>
     a8c:	e50b0010 	str	r0, [fp, #-16]
     a90:	e51b3010 	ldr	r3, [fp, #-16]
     a94:	e3530000 	cmp	r3, #0
     a98:	caffffc9 	bgt	9c4 <pipe1+0x140>
            total += n;
            cc = cc * 2;
            if(cc > sizeof(buf))
                cc = sizeof(buf);
        }
        if(total != 5 * 1033){
     a9c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     aa0:	e301342d 	movw	r3, #5165	; 0x142d
     aa4:	e1520003 	cmp	r2, r3
     aa8:	0a000005 	beq	ac4 <pipe1+0x240>
            printf(1, "pipe1 oops 3 total %d\n", total);
     aac:	e3a00001 	mov	r0, #1
     ab0:	e3051718 	movw	r1, #22296	; 0x5718
     ab4:	e3401000 	movt	r1, #0
     ab8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     abc:	eb001075 	bl	4c98 <printf>
            exit();
     ac0:	eb000f5c 	bl	4838 <exit>
        }
        close(fds[0]);
     ac4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     ac8:	e1a00003 	mov	r0, r3
     acc:	eb000f86 	bl	48ec <close>
        wait();
     ad0:	eb000f61 	bl	485c <wait>
    } else {
        printf(1, "fork() failed\n");
        exit();
    }
    printf(1, "pipe1 ok\n");
     ad4:	e3a00001 	mov	r0, #1
     ad8:	e3051730 	movw	r1, #22320	; 0x5730
     adc:	e3401000 	movt	r1, #0
     ae0:	eb00106c 	bl	4c98 <printf>
     ae4:	ea000004 	b	afc <pipe1+0x278>
            exit();
        }
        close(fds[0]);
        wait();
    } else {
        printf(1, "fork() failed\n");
     ae8:	e3a00001 	mov	r0, #1
     aec:	e305173c 	movw	r1, #22332	; 0x573c
     af0:	e3401000 	movt	r1, #0
     af4:	eb001067 	bl	4c98 <printf>
        exit();
     af8:	eb000f4e 	bl	4838 <exit>
    }
    printf(1, "pipe1 ok\n");
}
     afc:	e24bd004 	sub	sp, fp, #4
     b00:	e8bd8800 	pop	{fp, pc}

00000b04 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     b04:	e92d4800 	push	{fp, lr}
     b08:	e28db004 	add	fp, sp, #4
     b0c:	e24dd018 	sub	sp, sp, #24
    int pid1, pid2, pid3;
    int pfds[2];

    printf(1, "preempt: ");
     b10:	e3a00001 	mov	r0, #1
     b14:	e305174c 	movw	r1, #22348	; 0x574c
     b18:	e3401000 	movt	r1, #0
     b1c:	eb00105d 	bl	4c98 <printf>
    pid1 = fork();
     b20:	eb000f3b 	bl	4814 <fork>
     b24:	e50b0008 	str	r0, [fp, #-8]
    if(pid1 == 0)
     b28:	e51b3008 	ldr	r3, [fp, #-8]
     b2c:	e3530000 	cmp	r3, #0
     b30:	1a000000 	bne	b38 <preempt+0x34>
        for(;;)
            ;
     b34:	eafffffe 	b	b34 <preempt+0x30>

    pid2 = fork();
     b38:	eb000f35 	bl	4814 <fork>
     b3c:	e50b000c 	str	r0, [fp, #-12]
    if(pid2 == 0)
     b40:	e51b300c 	ldr	r3, [fp, #-12]
     b44:	e3530000 	cmp	r3, #0
     b48:	1a000000 	bne	b50 <preempt+0x4c>
        for(;;)
            ;
     b4c:	eafffffe 	b	b4c <preempt+0x48>

    pipe(pfds);
     b50:	e24b3018 	sub	r3, fp, #24
     b54:	e1a00003 	mov	r0, r3
     b58:	eb000f48 	bl	4880 <pipe>
    pid3 = fork();
     b5c:	eb000f2c 	bl	4814 <fork>
     b60:	e50b0010 	str	r0, [fp, #-16]
    if(pid3 == 0){
     b64:	e51b3010 	ldr	r3, [fp, #-16]
     b68:	e3530000 	cmp	r3, #0
     b6c:	1a000013 	bne	bc0 <preempt+0xbc>
        close(pfds[0]);
     b70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     b74:	e1a00003 	mov	r0, r3
     b78:	eb000f5b 	bl	48ec <close>
        if(write(pfds[1], "x", 1) != 1)
     b7c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     b80:	e1a00003 	mov	r0, r3
     b84:	e3051758 	movw	r1, #22360	; 0x5758
     b88:	e3401000 	movt	r1, #0
     b8c:	e3a02001 	mov	r2, #1
     b90:	eb000f4c 	bl	48c8 <write>
     b94:	e1a03000 	mov	r3, r0
     b98:	e3530001 	cmp	r3, #1
     b9c:	0a000003 	beq	bb0 <preempt+0xac>
            printf(1, "preempt write error");
     ba0:	e3a00001 	mov	r0, #1
     ba4:	e305175c 	movw	r1, #22364	; 0x575c
     ba8:	e3401000 	movt	r1, #0
     bac:	eb001039 	bl	4c98 <printf>
        close(pfds[1]);
     bb0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     bb4:	e1a00003 	mov	r0, r3
     bb8:	eb000f4b 	bl	48ec <close>
        for(;;)
            ;
     bbc:	eafffffe 	b	bbc <preempt+0xb8>
    }

    close(pfds[1]);
     bc0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     bc4:	e1a00003 	mov	r0, r3
     bc8:	eb000f47 	bl	48ec <close>
    if(read(pfds[0], buf, sizeof(buf)) != 1){
     bcc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     bd0:	e1a00003 	mov	r0, r3
     bd4:	e3091374 	movw	r1, #37748	; 0x9374
     bd8:	e3401000 	movt	r1, #0
     bdc:	e3a02a02 	mov	r2, #8192	; 0x2000
     be0:	eb000f2f 	bl	48a4 <read>
     be4:	e1a03000 	mov	r3, r0
     be8:	e3530001 	cmp	r3, #1
     bec:	0a000004 	beq	c04 <preempt+0x100>
        printf(1, "preempt read error");
     bf0:	e3a00001 	mov	r0, #1
     bf4:	e3051770 	movw	r1, #22384	; 0x5770
     bf8:	e3401000 	movt	r1, #0
     bfc:	eb001025 	bl	4c98 <printf>
        return;
     c00:	ea000017 	b	c64 <preempt+0x160>
    }
    close(pfds[0]);
     c04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     c08:	e1a00003 	mov	r0, r3
     c0c:	eb000f36 	bl	48ec <close>
    printf(1, "kill... ");
     c10:	e3a00001 	mov	r0, #1
     c14:	e3051784 	movw	r1, #22404	; 0x5784
     c18:	e3401000 	movt	r1, #0
     c1c:	eb00101d 	bl	4c98 <printf>
    kill(pid1);
     c20:	e51b0008 	ldr	r0, [fp, #-8]
     c24:	eb000f39 	bl	4910 <kill>
    kill(pid2);
     c28:	e51b000c 	ldr	r0, [fp, #-12]
     c2c:	eb000f37 	bl	4910 <kill>
    kill(pid3);
     c30:	e51b0010 	ldr	r0, [fp, #-16]
     c34:	eb000f35 	bl	4910 <kill>
    printf(1, "wait... ");
     c38:	e3a00001 	mov	r0, #1
     c3c:	e3051790 	movw	r1, #22416	; 0x5790
     c40:	e3401000 	movt	r1, #0
     c44:	eb001013 	bl	4c98 <printf>
    wait();
     c48:	eb000f03 	bl	485c <wait>
    wait();
     c4c:	eb000f02 	bl	485c <wait>
    wait();
     c50:	eb000f01 	bl	485c <wait>
    printf(1, "preempt ok\n");
     c54:	e3a00001 	mov	r0, #1
     c58:	e305179c 	movw	r1, #22428	; 0x579c
     c5c:	e3401000 	movt	r1, #0
     c60:	eb00100c 	bl	4c98 <printf>
}
     c64:	e24bd004 	sub	sp, fp, #4
     c68:	e8bd8800 	pop	{fp, pc}

00000c6c <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     c6c:	e92d4800 	push	{fp, lr}
     c70:	e28db004 	add	fp, sp, #4
     c74:	e24dd008 	sub	sp, sp, #8
    int i, pid;

    for(i = 0; i < 100; i++){
     c78:	e3a03000 	mov	r3, #0
     c7c:	e50b3008 	str	r3, [fp, #-8]
     c80:	ea00001a 	b	cf0 <exitwait+0x84>
        pid = fork();
     c84:	eb000ee2 	bl	4814 <fork>
     c88:	e50b000c 	str	r0, [fp, #-12]
        if(pid < 0){
     c8c:	e51b300c 	ldr	r3, [fp, #-12]
     c90:	e3530000 	cmp	r3, #0
     c94:	aa000004 	bge	cac <exitwait+0x40>
            printf(1, "fork failed\n");
     c98:	e3a00001 	mov	r0, #1
     c9c:	e30517a8 	movw	r1, #22440	; 0x57a8
     ca0:	e3401000 	movt	r1, #0
     ca4:	eb000ffb 	bl	4c98 <printf>
            return;
     ca8:	ea000017 	b	d0c <exitwait+0xa0>
        }
        if(pid){
     cac:	e51b300c 	ldr	r3, [fp, #-12]
     cb0:	e3530000 	cmp	r3, #0
     cb4:	0a000009 	beq	ce0 <exitwait+0x74>
            if(wait() != pid){
     cb8:	eb000ee7 	bl	485c <wait>
     cbc:	e1a02000 	mov	r2, r0
     cc0:	e51b300c 	ldr	r3, [fp, #-12]
     cc4:	e1520003 	cmp	r2, r3
     cc8:	0a000005 	beq	ce4 <exitwait+0x78>
                printf(1, "wait wrong pid\n");
     ccc:	e3a00001 	mov	r0, #1
     cd0:	e30517b8 	movw	r1, #22456	; 0x57b8
     cd4:	e3401000 	movt	r1, #0
     cd8:	eb000fee 	bl	4c98 <printf>
                return;
     cdc:	ea00000a 	b	d0c <exitwait+0xa0>
            }
        } else {
            exit();
     ce0:	eb000ed4 	bl	4838 <exit>
void
exitwait(void)
{
    int i, pid;

    for(i = 0; i < 100; i++){
     ce4:	e51b3008 	ldr	r3, [fp, #-8]
     ce8:	e2833001 	add	r3, r3, #1
     cec:	e50b3008 	str	r3, [fp, #-8]
     cf0:	e51b3008 	ldr	r3, [fp, #-8]
     cf4:	e3530063 	cmp	r3, #99	; 0x63
     cf8:	daffffe1 	ble	c84 <exitwait+0x18>
            }
        } else {
            exit();
        }
    }
    printf(1, "exitwait ok\n");
     cfc:	e3a00001 	mov	r0, #1
     d00:	e30517c8 	movw	r1, #22472	; 0x57c8
     d04:	e3401000 	movt	r1, #0
     d08:	eb000fe2 	bl	4c98 <printf>
}
     d0c:	e24bd004 	sub	sp, fp, #4
     d10:	e8bd8800 	pop	{fp, pc}

00000d14 <mem>:

void
mem(void)
{
     d14:	e92d4800 	push	{fp, lr}
     d18:	e28db004 	add	fp, sp, #4
     d1c:	e24dd010 	sub	sp, sp, #16
    void *m1, *m2;
    int pid, ppid;

    printf(1, "mem test\n");
     d20:	e3a00001 	mov	r0, #1
     d24:	e30517d8 	movw	r1, #22488	; 0x57d8
     d28:	e3401000 	movt	r1, #0
     d2c:	eb000fd9 	bl	4c98 <printf>
    ppid = getpid();
     d30:	eb000f50 	bl	4a78 <getpid>
     d34:	e50b000c 	str	r0, [fp, #-12]
    if((pid = fork()) == 0){
     d38:	eb000eb5 	bl	4814 <fork>
     d3c:	e50b0010 	str	r0, [fp, #-16]
     d40:	e51b3010 	ldr	r3, [fp, #-16]
     d44:	e3530000 	cmp	r3, #0
     d48:	1a00002c 	bne	e00 <mem+0xec>
        m1 = 0;
     d4c:	e3a03000 	mov	r3, #0
     d50:	e50b3008 	str	r3, [fp, #-8]
        while((m2 = malloc(10001)) != 0){
     d54:	ea000004 	b	d6c <mem+0x58>
            *(char**)m2 = m1;
     d58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     d5c:	e51b2008 	ldr	r2, [fp, #-8]
     d60:	e5832000 	str	r2, [r3]
            m1 = m2;
     d64:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     d68:	e50b3008 	str	r3, [fp, #-8]

    printf(1, "mem test\n");
    ppid = getpid();
    if((pid = fork()) == 0){
        m1 = 0;
        while((m2 = malloc(10001)) != 0){
     d6c:	e3020711 	movw	r0, #10001	; 0x2711
     d70:	eb0010d8 	bl	50d8 <malloc>
     d74:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
     d78:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     d7c:	e3530000 	cmp	r3, #0
     d80:	1afffff4 	bne	d58 <mem+0x44>
            *(char**)m2 = m1;
            m1 = m2;
        }
        while(m1){
     d84:	ea000006 	b	da4 <mem+0x90>
            m2 = *(char**)m1;
     d88:	e51b3008 	ldr	r3, [fp, #-8]
     d8c:	e5933000 	ldr	r3, [r3]
     d90:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            free(m1);
     d94:	e51b0008 	ldr	r0, [fp, #-8]
     d98:	eb00104c 	bl	4ed0 <free>
            m1 = m2;
     d9c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     da0:	e50b3008 	str	r3, [fp, #-8]
        m1 = 0;
        while((m2 = malloc(10001)) != 0){
            *(char**)m2 = m1;
            m1 = m2;
        }
        while(m1){
     da4:	e51b3008 	ldr	r3, [fp, #-8]
     da8:	e3530000 	cmp	r3, #0
     dac:	1afffff5 	bne	d88 <mem+0x74>
            m2 = *(char**)m1;
            free(m1);
            m1 = m2;
        }
        m1 = malloc(1024*20);
     db0:	e3a00a05 	mov	r0, #20480	; 0x5000
     db4:	eb0010c7 	bl	50d8 <malloc>
     db8:	e50b0008 	str	r0, [fp, #-8]
        if(m1 == 0){
     dbc:	e51b3008 	ldr	r3, [fp, #-8]
     dc0:	e3530000 	cmp	r3, #0
     dc4:	1a000006 	bne	de4 <mem+0xd0>
            printf(1, "couldn't allocate mem?!!\n");
     dc8:	e3a00001 	mov	r0, #1
     dcc:	e30517e4 	movw	r1, #22500	; 0x57e4
     dd0:	e3401000 	movt	r1, #0
     dd4:	eb000faf 	bl	4c98 <printf>
            kill(ppid);
     dd8:	e51b000c 	ldr	r0, [fp, #-12]
     ddc:	eb000ecb 	bl	4910 <kill>
            exit();
     de0:	eb000e94 	bl	4838 <exit>
        }
        free(m1);
     de4:	e51b0008 	ldr	r0, [fp, #-8]
     de8:	eb001038 	bl	4ed0 <free>
        printf(1, "mem ok\n");
     dec:	e3a00001 	mov	r0, #1
     df0:	e3051800 	movw	r1, #22528	; 0x5800
     df4:	e3401000 	movt	r1, #0
     df8:	eb000fa6 	bl	4c98 <printf>
        exit();
     dfc:	eb000e8d 	bl	4838 <exit>
    } else {
        wait();
     e00:	eb000e95 	bl	485c <wait>
    }
}
     e04:	e24bd004 	sub	sp, fp, #4
     e08:	e8bd8800 	pop	{fp, pc}

00000e0c <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e0c:	e92d4800 	push	{fp, lr}
     e10:	e28db004 	add	fp, sp, #4
     e14:	e24dd028 	sub	sp, sp, #40	; 0x28
    int fd, pid, i, n, nc, np;
    char buf[10];

    printf(1, "sharedfd test\n");
     e18:	e3a00001 	mov	r0, #1
     e1c:	e3051808 	movw	r1, #22536	; 0x5808
     e20:	e3401000 	movt	r1, #0
     e24:	eb000f9b 	bl	4c98 <printf>

    unlink("sharedfd");
     e28:	e3050818 	movw	r0, #22552	; 0x5818
     e2c:	e3400000 	movt	r0, #0
     e30:	eb000eda 	bl	49a0 <unlink>
    fd = open("sharedfd", O_CREATE|O_RDWR);
     e34:	e3050818 	movw	r0, #22552	; 0x5818
     e38:	e3400000 	movt	r0, #0
     e3c:	e3001202 	movw	r1, #514	; 0x202
     e40:	eb000ec4 	bl	4958 <open>
     e44:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    if(fd < 0){
     e48:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     e4c:	e3530000 	cmp	r3, #0
     e50:	aa000004 	bge	e68 <sharedfd+0x5c>
        printf(1, "fstests: cannot open sharedfd for writing");
     e54:	e3a00001 	mov	r0, #1
     e58:	e3051824 	movw	r1, #22564	; 0x5824
     e5c:	e3401000 	movt	r1, #0
     e60:	eb000f8c 	bl	4c98 <printf>
        return;
     e64:	ea00007f 	b	1068 <sharedfd+0x25c>
    }
    pid = fork();
     e68:	eb000e69 	bl	4814 <fork>
     e6c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    memset(buf, pid==0?'c':'p', sizeof(buf));
     e70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     e74:	e3530000 	cmp	r3, #0
     e78:	1a000001 	bne	e84 <sharedfd+0x78>
     e7c:	e3a03063 	mov	r3, #99	; 0x63
     e80:	ea000000 	b	e88 <sharedfd+0x7c>
     e84:	e3a03070 	mov	r3, #112	; 0x70
     e88:	e24b2028 	sub	r2, fp, #40	; 0x28
     e8c:	e1a00002 	mov	r0, r2
     e90:	e1a01003 	mov	r1, r3
     e94:	e3a0200a 	mov	r2, #10
     e98:	eb000d6d 	bl	4454 <memset>
    for(i = 0; i < 1000; i++){
     e9c:	e3a03000 	mov	r3, #0
     ea0:	e50b3008 	str	r3, [fp, #-8]
     ea4:	ea00000f 	b	ee8 <sharedfd+0xdc>
        if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ea8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     eac:	e24b3028 	sub	r3, fp, #40	; 0x28
     eb0:	e1a01003 	mov	r1, r3
     eb4:	e3a0200a 	mov	r2, #10
     eb8:	eb000e82 	bl	48c8 <write>
     ebc:	e1a03000 	mov	r3, r0
     ec0:	e353000a 	cmp	r3, #10
     ec4:	0a000004 	beq	edc <sharedfd+0xd0>
            printf(1, "fstests: write sharedfd failed\n");
     ec8:	e3a00001 	mov	r0, #1
     ecc:	e3051850 	movw	r1, #22608	; 0x5850
     ed0:	e3401000 	movt	r1, #0
     ed4:	eb000f6f 	bl	4c98 <printf>
            break;
     ed8:	ea000006 	b	ef8 <sharedfd+0xec>
        printf(1, "fstests: cannot open sharedfd for writing");
        return;
    }
    pid = fork();
    memset(buf, pid==0?'c':'p', sizeof(buf));
    for(i = 0; i < 1000; i++){
     edc:	e51b3008 	ldr	r3, [fp, #-8]
     ee0:	e2833001 	add	r3, r3, #1
     ee4:	e50b3008 	str	r3, [fp, #-8]
     ee8:	e51b2008 	ldr	r2, [fp, #-8]
     eec:	e30033e7 	movw	r3, #999	; 0x3e7
     ef0:	e1520003 	cmp	r2, r3
     ef4:	daffffeb 	ble	ea8 <sharedfd+0x9c>
        if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
            printf(1, "fstests: write sharedfd failed\n");
            break;
        }
    }
    if(pid == 0)
     ef8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
     efc:	e3530000 	cmp	r3, #0
     f00:	1a000000 	bne	f08 <sharedfd+0xfc>
        exit();
     f04:	eb000e4b 	bl	4838 <exit>
    else
        wait();
     f08:	eb000e53 	bl	485c <wait>
    close(fd);
     f0c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     f10:	eb000e75 	bl	48ec <close>
    fd = open("sharedfd", 0);
     f14:	e3050818 	movw	r0, #22552	; 0x5818
     f18:	e3400000 	movt	r0, #0
     f1c:	e3a01000 	mov	r1, #0
     f20:	eb000e8c 	bl	4958 <open>
     f24:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    if(fd < 0){
     f28:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
     f2c:	e3530000 	cmp	r3, #0
     f30:	aa000004 	bge	f48 <sharedfd+0x13c>
        printf(1, "fstests: cannot open sharedfd for reading\n");
     f34:	e3a00001 	mov	r0, #1
     f38:	e3051870 	movw	r1, #22640	; 0x5870
     f3c:	e3401000 	movt	r1, #0
     f40:	eb000f54 	bl	4c98 <printf>
        return;
     f44:	ea000047 	b	1068 <sharedfd+0x25c>
    }
    nc = np = 0;
     f48:	e3a03000 	mov	r3, #0
     f4c:	e50b3010 	str	r3, [fp, #-16]
     f50:	e51b3010 	ldr	r3, [fp, #-16]
     f54:	e50b300c 	str	r3, [fp, #-12]
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f58:	ea000020 	b	fe0 <sharedfd+0x1d4>
        for(i = 0; i < sizeof(buf); i++){
     f5c:	e3a03000 	mov	r3, #0
     f60:	e50b3008 	str	r3, [fp, #-8]
     f64:	ea00001a 	b	fd4 <sharedfd+0x1c8>
            if(buf[i] == 'c')
     f68:	e3e01023 	mvn	r1, #35	; 0x23
     f6c:	e51b3008 	ldr	r3, [fp, #-8]
     f70:	e24b0004 	sub	r0, fp, #4
     f74:	e0802003 	add	r2, r0, r3
     f78:	e1a03001 	mov	r3, r1
     f7c:	e0823003 	add	r3, r2, r3
     f80:	e5d33000 	ldrb	r3, [r3]
     f84:	e3530063 	cmp	r3, #99	; 0x63
     f88:	1a000002 	bne	f98 <sharedfd+0x18c>
                nc++;
     f8c:	e51b300c 	ldr	r3, [fp, #-12]
     f90:	e2833001 	add	r3, r3, #1
     f94:	e50b300c 	str	r3, [fp, #-12]
            if(buf[i] == 'p')
     f98:	e3e01023 	mvn	r1, #35	; 0x23
     f9c:	e51b3008 	ldr	r3, [fp, #-8]
     fa0:	e24b0004 	sub	r0, fp, #4
     fa4:	e0802003 	add	r2, r0, r3
     fa8:	e1a03001 	mov	r3, r1
     fac:	e0823003 	add	r3, r2, r3
     fb0:	e5d33000 	ldrb	r3, [r3]
     fb4:	e3530070 	cmp	r3, #112	; 0x70
     fb8:	1a000002 	bne	fc8 <sharedfd+0x1bc>
                np++;
     fbc:	e51b3010 	ldr	r3, [fp, #-16]
     fc0:	e2833001 	add	r3, r3, #1
     fc4:	e50b3010 	str	r3, [fp, #-16]
        printf(1, "fstests: cannot open sharedfd for reading\n");
        return;
    }
    nc = np = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
        for(i = 0; i < sizeof(buf); i++){
     fc8:	e51b3008 	ldr	r3, [fp, #-8]
     fcc:	e2833001 	add	r3, r3, #1
     fd0:	e50b3008 	str	r3, [fp, #-8]
     fd4:	e51b3008 	ldr	r3, [fp, #-8]
     fd8:	e3530009 	cmp	r3, #9
     fdc:	9affffe1 	bls	f68 <sharedfd+0x15c>
    if(fd < 0){
        printf(1, "fstests: cannot open sharedfd for reading\n");
        return;
    }
    nc = np = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fe0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     fe4:	e24b3028 	sub	r3, fp, #40	; 0x28
     fe8:	e1a01003 	mov	r1, r3
     fec:	e3a0200a 	mov	r2, #10
     ff0:	eb000e2b 	bl	48a4 <read>
     ff4:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
     ff8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     ffc:	e3530000 	cmp	r3, #0
    1000:	caffffd5 	bgt	f5c <sharedfd+0x150>
                nc++;
            if(buf[i] == 'p')
                np++;
        }
    }
    close(fd);
    1004:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    1008:	eb000e37 	bl	48ec <close>
    unlink("sharedfd");
    100c:	e3050818 	movw	r0, #22552	; 0x5818
    1010:	e3400000 	movt	r0, #0
    1014:	eb000e61 	bl	49a0 <unlink>
    if(nc == 10000 && np == 10000){
    1018:	e51b200c 	ldr	r2, [fp, #-12]
    101c:	e3023710 	movw	r3, #10000	; 0x2710
    1020:	e1520003 	cmp	r2, r3
    1024:	1a000008 	bne	104c <sharedfd+0x240>
    1028:	e51b2010 	ldr	r2, [fp, #-16]
    102c:	e3023710 	movw	r3, #10000	; 0x2710
    1030:	e1520003 	cmp	r2, r3
    1034:	1a000004 	bne	104c <sharedfd+0x240>
        printf(1, "sharedfd ok\n");
    1038:	e3a00001 	mov	r0, #1
    103c:	e305189c 	movw	r1, #22684	; 0x589c
    1040:	e3401000 	movt	r1, #0
    1044:	eb000f13 	bl	4c98 <printf>
    1048:	ea000006 	b	1068 <sharedfd+0x25c>
    } else {
        printf(1, "sharedfd oops %d %d\n", nc, np);
    104c:	e3a00001 	mov	r0, #1
    1050:	e30518ac 	movw	r1, #22700	; 0x58ac
    1054:	e3401000 	movt	r1, #0
    1058:	e51b200c 	ldr	r2, [fp, #-12]
    105c:	e51b3010 	ldr	r3, [fp, #-16]
    1060:	eb000f0c 	bl	4c98 <printf>
        exit();
    1064:	eb000df3 	bl	4838 <exit>
    }
}
    1068:	e24bd004 	sub	sp, fp, #4
    106c:	e8bd8800 	pop	{fp, pc}

00001070 <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
    1070:	e92d4800 	push	{fp, lr}
    1074:	e28db004 	add	fp, sp, #4
    1078:	e24dd020 	sub	sp, sp, #32
    int fd, pid, i, j, n, total;
    char *fname;

    printf(1, "twofiles test\n");
    107c:	e3a00001 	mov	r0, #1
    1080:	e30518c4 	movw	r1, #22724	; 0x58c4
    1084:	e3401000 	movt	r1, #0
    1088:	eb000f02 	bl	4c98 <printf>

    unlink("f1");
    108c:	e30508d4 	movw	r0, #22740	; 0x58d4
    1090:	e3400000 	movt	r0, #0
    1094:	eb000e41 	bl	49a0 <unlink>
    unlink("f2");
    1098:	e30508d8 	movw	r0, #22744	; 0x58d8
    109c:	e3400000 	movt	r0, #0
    10a0:	eb000e3e 	bl	49a0 <unlink>

    pid = fork();
    10a4:	eb000dda 	bl	4814 <fork>
    10a8:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    if(pid < 0){
    10ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    10b0:	e3530000 	cmp	r3, #0
    10b4:	aa000004 	bge	10cc <twofiles+0x5c>
        printf(1, "fork failed\n");
    10b8:	e3a00001 	mov	r0, #1
    10bc:	e30517a8 	movw	r1, #22440	; 0x57a8
    10c0:	e3401000 	movt	r1, #0
    10c4:	eb000ef3 	bl	4c98 <printf>
        exit();
    10c8:	eb000dda 	bl	4838 <exit>
    }

    fname = pid ? "f1" : "f2";
    10cc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    10d0:	e3530000 	cmp	r3, #0
    10d4:	0a000002 	beq	10e4 <twofiles+0x74>
    10d8:	e30538d4 	movw	r3, #22740	; 0x58d4
    10dc:	e3403000 	movt	r3, #0
    10e0:	ea000001 	b	10ec <twofiles+0x7c>
    10e4:	e30538d8 	movw	r3, #22744	; 0x58d8
    10e8:	e3403000 	movt	r3, #0
    10ec:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    fd = open(fname, O_CREATE | O_RDWR);
    10f0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    10f4:	e3001202 	movw	r1, #514	; 0x202
    10f8:	eb000e16 	bl	4958 <open>
    10fc:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if(fd < 0){
    1100:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1104:	e3530000 	cmp	r3, #0
    1108:	aa000004 	bge	1120 <twofiles+0xb0>
        printf(1, "create failed\n");
    110c:	e3a00001 	mov	r0, #1
    1110:	e30518dc 	movw	r1, #22748	; 0x58dc
    1114:	e3401000 	movt	r1, #0
    1118:	eb000ede 	bl	4c98 <printf>
        exit();
    111c:	eb000dc5 	bl	4838 <exit>
    }

    memset(buf, pid?'p':'c', 512);
    1120:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1124:	e3530000 	cmp	r3, #0
    1128:	0a000001 	beq	1134 <twofiles+0xc4>
    112c:	e3a03070 	mov	r3, #112	; 0x70
    1130:	ea000000 	b	1138 <twofiles+0xc8>
    1134:	e3a03063 	mov	r3, #99	; 0x63
    1138:	e3090374 	movw	r0, #37748	; 0x9374
    113c:	e3400000 	movt	r0, #0
    1140:	e1a01003 	mov	r1, r3
    1144:	e3a02c02 	mov	r2, #512	; 0x200
    1148:	eb000cc1 	bl	4454 <memset>
    for(i = 0; i < 12; i++){
    114c:	e3a03000 	mov	r3, #0
    1150:	e50b3008 	str	r3, [fp, #-8]
    1154:	ea000011 	b	11a0 <twofiles+0x130>
        if((n = write(fd, buf, 500)) != 500){
    1158:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    115c:	e3091374 	movw	r1, #37748	; 0x9374
    1160:	e3401000 	movt	r1, #0
    1164:	e3a02f7d 	mov	r2, #500	; 0x1f4
    1168:	eb000dd6 	bl	48c8 <write>
    116c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    1170:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    1174:	e3530f7d 	cmp	r3, #500	; 0x1f4
    1178:	0a000005 	beq	1194 <twofiles+0x124>
            printf(1, "write failed %d\n", n);
    117c:	e3a00001 	mov	r0, #1
    1180:	e30518ec 	movw	r1, #22764	; 0x58ec
    1184:	e3401000 	movt	r1, #0
    1188:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    118c:	eb000ec1 	bl	4c98 <printf>
            exit();
    1190:	eb000da8 	bl	4838 <exit>
        printf(1, "create failed\n");
        exit();
    }

    memset(buf, pid?'p':'c', 512);
    for(i = 0; i < 12; i++){
    1194:	e51b3008 	ldr	r3, [fp, #-8]
    1198:	e2833001 	add	r3, r3, #1
    119c:	e50b3008 	str	r3, [fp, #-8]
    11a0:	e51b3008 	ldr	r3, [fp, #-8]
    11a4:	e353000b 	cmp	r3, #11
    11a8:	daffffea 	ble	1158 <twofiles+0xe8>
        if((n = write(fd, buf, 500)) != 500){
            printf(1, "write failed %d\n", n);
            exit();
        }
    }
    close(fd);
    11ac:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    11b0:	eb000dcd 	bl	48ec <close>
    if(pid)
    11b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    11b8:	e3530000 	cmp	r3, #0
    11bc:	0a000003 	beq	11d0 <twofiles+0x160>
        wait();
    11c0:	eb000da5 	bl	485c <wait>
    else
        exit();

    for(i = 0; i < 2; i++){
    11c4:	e3a03000 	mov	r3, #0
    11c8:	e50b3008 	str	r3, [fp, #-8]
    11cc:	ea000048 	b	12f4 <twofiles+0x284>
    }
    close(fd);
    if(pid)
        wait();
    else
        exit();
    11d0:	eb000d98 	bl	4838 <exit>

    for(i = 0; i < 2; i++){
        fd = open(i?"f1":"f2", 0);
    11d4:	e51b3008 	ldr	r3, [fp, #-8]
    11d8:	e3530000 	cmp	r3, #0
    11dc:	0a000002 	beq	11ec <twofiles+0x17c>
    11e0:	e30538d4 	movw	r3, #22740	; 0x58d4
    11e4:	e3403000 	movt	r3, #0
    11e8:	ea000001 	b	11f4 <twofiles+0x184>
    11ec:	e30538d8 	movw	r3, #22744	; 0x58d8
    11f0:	e3403000 	movt	r3, #0
    11f4:	e1a00003 	mov	r0, r3
    11f8:	e3a01000 	mov	r1, #0
    11fc:	eb000dd5 	bl	4958 <open>
    1200:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
        total = 0;
    1204:	e3a03000 	mov	r3, #0
    1208:	e50b3010 	str	r3, [fp, #-16]
        while((n = read(fd, buf, sizeof(buf))) > 0){
    120c:	ea000020 	b	1294 <twofiles+0x224>
            for(j = 0; j < n; j++){
    1210:	e3a03000 	mov	r3, #0
    1214:	e50b300c 	str	r3, [fp, #-12]
    1218:	ea000015 	b	1274 <twofiles+0x204>
                if(buf[j] != (i?'p':'c')){
    121c:	e3093374 	movw	r3, #37748	; 0x9374
    1220:	e3403000 	movt	r3, #0
    1224:	e51b200c 	ldr	r2, [fp, #-12]
    1228:	e0833002 	add	r3, r3, r2
    122c:	e5d33000 	ldrb	r3, [r3]
    1230:	e1a02003 	mov	r2, r3
    1234:	e51b3008 	ldr	r3, [fp, #-8]
    1238:	e3530000 	cmp	r3, #0
    123c:	0a000001 	beq	1248 <twofiles+0x1d8>
    1240:	e3a03070 	mov	r3, #112	; 0x70
    1244:	ea000000 	b	124c <twofiles+0x1dc>
    1248:	e3a03063 	mov	r3, #99	; 0x63
    124c:	e1520003 	cmp	r2, r3
    1250:	0a000004 	beq	1268 <twofiles+0x1f8>
                    printf(1, "wrong char\n");
    1254:	e3a00001 	mov	r0, #1
    1258:	e3051900 	movw	r1, #22784	; 0x5900
    125c:	e3401000 	movt	r1, #0
    1260:	eb000e8c 	bl	4c98 <printf>
                    exit();
    1264:	eb000d73 	bl	4838 <exit>

    for(i = 0; i < 2; i++){
        fd = open(i?"f1":"f2", 0);
        total = 0;
        while((n = read(fd, buf, sizeof(buf))) > 0){
            for(j = 0; j < n; j++){
    1268:	e51b300c 	ldr	r3, [fp, #-12]
    126c:	e2833001 	add	r3, r3, #1
    1270:	e50b300c 	str	r3, [fp, #-12]
    1274:	e51b200c 	ldr	r2, [fp, #-12]
    1278:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    127c:	e1520003 	cmp	r2, r3
    1280:	baffffe5 	blt	121c <twofiles+0x1ac>
                if(buf[j] != (i?'p':'c')){
                    printf(1, "wrong char\n");
                    exit();
                }
            }
            total += n;
    1284:	e51b2010 	ldr	r2, [fp, #-16]
    1288:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    128c:	e0823003 	add	r3, r2, r3
    1290:	e50b3010 	str	r3, [fp, #-16]
        exit();

    for(i = 0; i < 2; i++){
        fd = open(i?"f1":"f2", 0);
        total = 0;
        while((n = read(fd, buf, sizeof(buf))) > 0){
    1294:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    1298:	e3091374 	movw	r1, #37748	; 0x9374
    129c:	e3401000 	movt	r1, #0
    12a0:	e3a02a02 	mov	r2, #8192	; 0x2000
    12a4:	eb000d7e 	bl	48a4 <read>
    12a8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    12ac:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    12b0:	e3530000 	cmp	r3, #0
    12b4:	caffffd5 	bgt	1210 <twofiles+0x1a0>
                    exit();
                }
            }
            total += n;
        }
        close(fd);
    12b8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    12bc:	eb000d8a 	bl	48ec <close>
        if(total != 12*500){
    12c0:	e51b2010 	ldr	r2, [fp, #-16]
    12c4:	e3013770 	movw	r3, #6000	; 0x1770
    12c8:	e1520003 	cmp	r2, r3
    12cc:	0a000005 	beq	12e8 <twofiles+0x278>
            printf(1, "wrong length %d\n", total);
    12d0:	e3a00001 	mov	r0, #1
    12d4:	e305190c 	movw	r1, #22796	; 0x590c
    12d8:	e3401000 	movt	r1, #0
    12dc:	e51b2010 	ldr	r2, [fp, #-16]
    12e0:	eb000e6c 	bl	4c98 <printf>
            exit();
    12e4:	eb000d53 	bl	4838 <exit>
    if(pid)
        wait();
    else
        exit();

    for(i = 0; i < 2; i++){
    12e8:	e51b3008 	ldr	r3, [fp, #-8]
    12ec:	e2833001 	add	r3, r3, #1
    12f0:	e50b3008 	str	r3, [fp, #-8]
    12f4:	e51b3008 	ldr	r3, [fp, #-8]
    12f8:	e3530001 	cmp	r3, #1
    12fc:	daffffb4 	ble	11d4 <twofiles+0x164>
            printf(1, "wrong length %d\n", total);
            exit();
        }
    }

    unlink("f1");
    1300:	e30508d4 	movw	r0, #22740	; 0x58d4
    1304:	e3400000 	movt	r0, #0
    1308:	eb000da4 	bl	49a0 <unlink>
    unlink("f2");
    130c:	e30508d8 	movw	r0, #22744	; 0x58d8
    1310:	e3400000 	movt	r0, #0
    1314:	eb000da1 	bl	49a0 <unlink>

    printf(1, "twofiles ok\n");
    1318:	e3a00001 	mov	r0, #1
    131c:	e3051920 	movw	r1, #22816	; 0x5920
    1320:	e3401000 	movt	r1, #0
    1324:	eb000e5b 	bl	4c98 <printf>
}
    1328:	e24bd004 	sub	sp, fp, #4
    132c:	e8bd8800 	pop	{fp, pc}

00001330 <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
    1330:	e92d4800 	push	{fp, lr}
    1334:	e28db004 	add	fp, sp, #4
    1338:	e24dd030 	sub	sp, sp, #48	; 0x30
    enum { N = 20 };
    int pid, i, fd;
    char name[32];

    printf(1, "createdelete test\n");
    133c:	e3a00001 	mov	r0, #1
    1340:	e3051930 	movw	r1, #22832	; 0x5930
    1344:	e3401000 	movt	r1, #0
    1348:	eb000e52 	bl	4c98 <printf>
    pid = fork();
    134c:	eb000d30 	bl	4814 <fork>
    1350:	e50b000c 	str	r0, [fp, #-12]
    if(pid < 0){
    1354:	e51b300c 	ldr	r3, [fp, #-12]
    1358:	e3530000 	cmp	r3, #0
    135c:	aa000004 	bge	1374 <createdelete+0x44>
        printf(1, "fork failed\n");
    1360:	e3a00001 	mov	r0, #1
    1364:	e30517a8 	movw	r1, #22440	; 0x57a8
    1368:	e3401000 	movt	r1, #0
    136c:	eb000e49 	bl	4c98 <printf>
        exit();
    1370:	eb000d30 	bl	4838 <exit>
    }

    name[0] = pid ? 'p' : 'c';
    1374:	e51b300c 	ldr	r3, [fp, #-12]
    1378:	e3530000 	cmp	r3, #0
    137c:	0a000001 	beq	1388 <createdelete+0x58>
    1380:	e3a03070 	mov	r3, #112	; 0x70
    1384:	ea000000 	b	138c <createdelete+0x5c>
    1388:	e3a03063 	mov	r3, #99	; 0x63
    138c:	e54b3030 	strb	r3, [fp, #-48]	; 0xffffffd0
    name[2] = '\0';
    1390:	e3a03000 	mov	r3, #0
    1394:	e54b302e 	strb	r3, [fp, #-46]	; 0xffffffd2
    for(i = 0; i < N; i++){
    1398:	e3a03000 	mov	r3, #0
    139c:	e50b3008 	str	r3, [fp, #-8]
    13a0:	ea000030 	b	1468 <createdelete+0x138>
        name[1] = '0' + i;
    13a4:	e51b3008 	ldr	r3, [fp, #-8]
    13a8:	e6ef3073 	uxtb	r3, r3
    13ac:	e2833030 	add	r3, r3, #48	; 0x30
    13b0:	e6ef3073 	uxtb	r3, r3
    13b4:	e54b302f 	strb	r3, [fp, #-47]	; 0xffffffd1
        fd = open(name, O_CREATE | O_RDWR);
    13b8:	e24b3030 	sub	r3, fp, #48	; 0x30
    13bc:	e1a00003 	mov	r0, r3
    13c0:	e3001202 	movw	r1, #514	; 0x202
    13c4:	eb000d63 	bl	4958 <open>
    13c8:	e50b0010 	str	r0, [fp, #-16]
        if(fd < 0){
    13cc:	e51b3010 	ldr	r3, [fp, #-16]
    13d0:	e3530000 	cmp	r3, #0
    13d4:	aa000004 	bge	13ec <createdelete+0xbc>
            printf(1, "create failed\n");
    13d8:	e3a00001 	mov	r0, #1
    13dc:	e30518dc 	movw	r1, #22748	; 0x58dc
    13e0:	e3401000 	movt	r1, #0
    13e4:	eb000e2b 	bl	4c98 <printf>
            exit();
    13e8:	eb000d12 	bl	4838 <exit>
        }
        close(fd);
    13ec:	e51b0010 	ldr	r0, [fp, #-16]
    13f0:	eb000d3d 	bl	48ec <close>
        if(i > 0 && (i % 2 ) == 0){
    13f4:	e51b3008 	ldr	r3, [fp, #-8]
    13f8:	e3530000 	cmp	r3, #0
    13fc:	da000016 	ble	145c <createdelete+0x12c>
    1400:	e51b3008 	ldr	r3, [fp, #-8]
    1404:	e2033001 	and	r3, r3, #1
    1408:	e3530000 	cmp	r3, #0
    140c:	1a000012 	bne	145c <createdelete+0x12c>
            name[1] = '0' + (i / 2);
    1410:	e51b3008 	ldr	r3, [fp, #-8]
    1414:	e1a02fa3 	lsr	r2, r3, #31
    1418:	e0823003 	add	r3, r2, r3
    141c:	e1a030c3 	asr	r3, r3, #1
    1420:	e6ef3073 	uxtb	r3, r3
    1424:	e2833030 	add	r3, r3, #48	; 0x30
    1428:	e6ef3073 	uxtb	r3, r3
    142c:	e54b302f 	strb	r3, [fp, #-47]	; 0xffffffd1
            if(unlink(name) < 0){
    1430:	e24b3030 	sub	r3, fp, #48	; 0x30
    1434:	e1a00003 	mov	r0, r3
    1438:	eb000d58 	bl	49a0 <unlink>
    143c:	e1a03000 	mov	r3, r0
    1440:	e3530000 	cmp	r3, #0
    1444:	aa000004 	bge	145c <createdelete+0x12c>
                printf(1, "unlink failed\n");
    1448:	e3a00001 	mov	r0, #1
    144c:	e3051944 	movw	r1, #22852	; 0x5944
    1450:	e3401000 	movt	r1, #0
    1454:	eb000e0f 	bl	4c98 <printf>
                exit();
    1458:	eb000cf6 	bl	4838 <exit>
        exit();
    }

    name[0] = pid ? 'p' : 'c';
    name[2] = '\0';
    for(i = 0; i < N; i++){
    145c:	e51b3008 	ldr	r3, [fp, #-8]
    1460:	e2833001 	add	r3, r3, #1
    1464:	e50b3008 	str	r3, [fp, #-8]
    1468:	e51b3008 	ldr	r3, [fp, #-8]
    146c:	e3530013 	cmp	r3, #19
    1470:	daffffcb 	ble	13a4 <createdelete+0x74>
                exit();
            }
        }
    }

    if(pid==0)
    1474:	e51b300c 	ldr	r3, [fp, #-12]
    1478:	e3530000 	cmp	r3, #0
    147c:	1a000000 	bne	1484 <createdelete+0x154>
        exit();
    1480:	eb000cec 	bl	4838 <exit>
    else
        wait();
    1484:	eb000cf4 	bl	485c <wait>

    for(i = 0; i < N; i++){
    1488:	e3a03000 	mov	r3, #0
    148c:	e50b3008 	str	r3, [fp, #-8]
    1490:	ea000064 	b	1628 <createdelete+0x2f8>
        name[0] = 'p';
    1494:	e3a03070 	mov	r3, #112	; 0x70
    1498:	e54b3030 	strb	r3, [fp, #-48]	; 0xffffffd0
        name[1] = '0' + i;
    149c:	e51b3008 	ldr	r3, [fp, #-8]
    14a0:	e6ef3073 	uxtb	r3, r3
    14a4:	e2833030 	add	r3, r3, #48	; 0x30
    14a8:	e6ef3073 	uxtb	r3, r3
    14ac:	e54b302f 	strb	r3, [fp, #-47]	; 0xffffffd1
        fd = open(name, 0);
    14b0:	e24b3030 	sub	r3, fp, #48	; 0x30
    14b4:	e1a00003 	mov	r0, r3
    14b8:	e3a01000 	mov	r1, #0
    14bc:	eb000d25 	bl	4958 <open>
    14c0:	e50b0010 	str	r0, [fp, #-16]
        if((i == 0 || i >= N/2) && fd < 0){
    14c4:	e51b3008 	ldr	r3, [fp, #-8]
    14c8:	e3530000 	cmp	r3, #0
    14cc:	0a000002 	beq	14dc <createdelete+0x1ac>
    14d0:	e51b3008 	ldr	r3, [fp, #-8]
    14d4:	e3530009 	cmp	r3, #9
    14d8:	da000009 	ble	1504 <createdelete+0x1d4>
    14dc:	e51b3010 	ldr	r3, [fp, #-16]
    14e0:	e3530000 	cmp	r3, #0
    14e4:	aa000006 	bge	1504 <createdelete+0x1d4>
            printf(1, "oops createdelete %s didn't exist\n", name);
    14e8:	e3a00001 	mov	r0, #1
    14ec:	e3051954 	movw	r1, #22868	; 0x5954
    14f0:	e3401000 	movt	r1, #0
    14f4:	e24b3030 	sub	r3, fp, #48	; 0x30
    14f8:	e1a02003 	mov	r2, r3
    14fc:	eb000de5 	bl	4c98 <printf>
            exit();
    1500:	eb000ccc 	bl	4838 <exit>
        } else if((i >= 1 && i < N/2) && fd >= 0){
    1504:	e51b3008 	ldr	r3, [fp, #-8]
    1508:	e3530000 	cmp	r3, #0
    150c:	da00000c 	ble	1544 <createdelete+0x214>
    1510:	e51b3008 	ldr	r3, [fp, #-8]
    1514:	e3530009 	cmp	r3, #9
    1518:	ca000009 	bgt	1544 <createdelete+0x214>
    151c:	e51b3010 	ldr	r3, [fp, #-16]
    1520:	e3530000 	cmp	r3, #0
    1524:	ba000006 	blt	1544 <createdelete+0x214>
            printf(1, "oops createdelete %s did exist\n", name);
    1528:	e3a00001 	mov	r0, #1
    152c:	e3051978 	movw	r1, #22904	; 0x5978
    1530:	e3401000 	movt	r1, #0
    1534:	e24b3030 	sub	r3, fp, #48	; 0x30
    1538:	e1a02003 	mov	r2, r3
    153c:	eb000dd5 	bl	4c98 <printf>
            exit();
    1540:	eb000cbc 	bl	4838 <exit>
        }
        if(fd >= 0)
    1544:	e51b3010 	ldr	r3, [fp, #-16]
    1548:	e3530000 	cmp	r3, #0
    154c:	ba000001 	blt	1558 <createdelete+0x228>
            close(fd);
    1550:	e51b0010 	ldr	r0, [fp, #-16]
    1554:	eb000ce4 	bl	48ec <close>

        name[0] = 'c';
    1558:	e3a03063 	mov	r3, #99	; 0x63
    155c:	e54b3030 	strb	r3, [fp, #-48]	; 0xffffffd0
        name[1] = '0' + i;
    1560:	e51b3008 	ldr	r3, [fp, #-8]
    1564:	e6ef3073 	uxtb	r3, r3
    1568:	e2833030 	add	r3, r3, #48	; 0x30
    156c:	e6ef3073 	uxtb	r3, r3
    1570:	e54b302f 	strb	r3, [fp, #-47]	; 0xffffffd1
        fd = open(name, 0);
    1574:	e24b3030 	sub	r3, fp, #48	; 0x30
    1578:	e1a00003 	mov	r0, r3
    157c:	e3a01000 	mov	r1, #0
    1580:	eb000cf4 	bl	4958 <open>
    1584:	e50b0010 	str	r0, [fp, #-16]
        if((i == 0 || i >= N/2) && fd < 0){
    1588:	e51b3008 	ldr	r3, [fp, #-8]
    158c:	e3530000 	cmp	r3, #0
    1590:	0a000002 	beq	15a0 <createdelete+0x270>
    1594:	e51b3008 	ldr	r3, [fp, #-8]
    1598:	e3530009 	cmp	r3, #9
    159c:	da000009 	ble	15c8 <createdelete+0x298>
    15a0:	e51b3010 	ldr	r3, [fp, #-16]
    15a4:	e3530000 	cmp	r3, #0
    15a8:	aa000006 	bge	15c8 <createdelete+0x298>
            printf(1, "oops createdelete %s didn't exist\n", name);
    15ac:	e3a00001 	mov	r0, #1
    15b0:	e3051954 	movw	r1, #22868	; 0x5954
    15b4:	e3401000 	movt	r1, #0
    15b8:	e24b3030 	sub	r3, fp, #48	; 0x30
    15bc:	e1a02003 	mov	r2, r3
    15c0:	eb000db4 	bl	4c98 <printf>
            exit();
    15c4:	eb000c9b 	bl	4838 <exit>
        } else if((i >= 1 && i < N/2) && fd >= 0){
    15c8:	e51b3008 	ldr	r3, [fp, #-8]
    15cc:	e3530000 	cmp	r3, #0
    15d0:	da00000c 	ble	1608 <createdelete+0x2d8>
    15d4:	e51b3008 	ldr	r3, [fp, #-8]
    15d8:	e3530009 	cmp	r3, #9
    15dc:	ca000009 	bgt	1608 <createdelete+0x2d8>
    15e0:	e51b3010 	ldr	r3, [fp, #-16]
    15e4:	e3530000 	cmp	r3, #0
    15e8:	ba000006 	blt	1608 <createdelete+0x2d8>
            printf(1, "oops createdelete %s did exist\n", name);
    15ec:	e3a00001 	mov	r0, #1
    15f0:	e3051978 	movw	r1, #22904	; 0x5978
    15f4:	e3401000 	movt	r1, #0
    15f8:	e24b3030 	sub	r3, fp, #48	; 0x30
    15fc:	e1a02003 	mov	r2, r3
    1600:	eb000da4 	bl	4c98 <printf>
            exit();
    1604:	eb000c8b 	bl	4838 <exit>
        }
        if(fd >= 0)
    1608:	e51b3010 	ldr	r3, [fp, #-16]
    160c:	e3530000 	cmp	r3, #0
    1610:	ba000001 	blt	161c <createdelete+0x2ec>
            close(fd);
    1614:	e51b0010 	ldr	r0, [fp, #-16]
    1618:	eb000cb3 	bl	48ec <close>
    if(pid==0)
        exit();
    else
        wait();

    for(i = 0; i < N; i++){
    161c:	e51b3008 	ldr	r3, [fp, #-8]
    1620:	e2833001 	add	r3, r3, #1
    1624:	e50b3008 	str	r3, [fp, #-8]
    1628:	e51b3008 	ldr	r3, [fp, #-8]
    162c:	e3530013 	cmp	r3, #19
    1630:	daffff97 	ble	1494 <createdelete+0x164>
        }
        if(fd >= 0)
            close(fd);
    }

    for(i = 0; i < N; i++){
    1634:	e3a03000 	mov	r3, #0
    1638:	e50b3008 	str	r3, [fp, #-8]
    163c:	ea000011 	b	1688 <createdelete+0x358>
        name[0] = 'p';
    1640:	e3a03070 	mov	r3, #112	; 0x70
    1644:	e54b3030 	strb	r3, [fp, #-48]	; 0xffffffd0
        name[1] = '0' + i;
    1648:	e51b3008 	ldr	r3, [fp, #-8]
    164c:	e6ef3073 	uxtb	r3, r3
    1650:	e2833030 	add	r3, r3, #48	; 0x30
    1654:	e6ef3073 	uxtb	r3, r3
    1658:	e54b302f 	strb	r3, [fp, #-47]	; 0xffffffd1
        unlink(name);
    165c:	e24b3030 	sub	r3, fp, #48	; 0x30
    1660:	e1a00003 	mov	r0, r3
    1664:	eb000ccd 	bl	49a0 <unlink>
        name[0] = 'c';
    1668:	e3a03063 	mov	r3, #99	; 0x63
    166c:	e54b3030 	strb	r3, [fp, #-48]	; 0xffffffd0
        unlink(name);
    1670:	e24b3030 	sub	r3, fp, #48	; 0x30
    1674:	e1a00003 	mov	r0, r3
    1678:	eb000cc8 	bl	49a0 <unlink>
        }
        if(fd >= 0)
            close(fd);
    }

    for(i = 0; i < N; i++){
    167c:	e51b3008 	ldr	r3, [fp, #-8]
    1680:	e2833001 	add	r3, r3, #1
    1684:	e50b3008 	str	r3, [fp, #-8]
    1688:	e51b3008 	ldr	r3, [fp, #-8]
    168c:	e3530013 	cmp	r3, #19
    1690:	daffffea 	ble	1640 <createdelete+0x310>
        unlink(name);
        name[0] = 'c';
        unlink(name);
    }

    printf(1, "createdelete ok\n");
    1694:	e3a00001 	mov	r0, #1
    1698:	e3051998 	movw	r1, #22936	; 0x5998
    169c:	e3401000 	movt	r1, #0
    16a0:	eb000d7c 	bl	4c98 <printf>
}
    16a4:	e24bd004 	sub	sp, fp, #4
    16a8:	e8bd8800 	pop	{fp, pc}

000016ac <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    16ac:	e92d4800 	push	{fp, lr}
    16b0:	e28db004 	add	fp, sp, #4
    16b4:	e24dd008 	sub	sp, sp, #8
    int fd, fd1;

    printf(1, "unlinkread test\n");
    16b8:	e3a00001 	mov	r0, #1
    16bc:	e30519ac 	movw	r1, #22956	; 0x59ac
    16c0:	e3401000 	movt	r1, #0
    16c4:	eb000d73 	bl	4c98 <printf>
    fd = open("unlinkread", O_CREATE | O_RDWR);
    16c8:	e30509c0 	movw	r0, #22976	; 0x59c0
    16cc:	e3400000 	movt	r0, #0
    16d0:	e3001202 	movw	r1, #514	; 0x202
    16d4:	eb000c9f 	bl	4958 <open>
    16d8:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    16dc:	e51b3008 	ldr	r3, [fp, #-8]
    16e0:	e3530000 	cmp	r3, #0
    16e4:	aa000004 	bge	16fc <unlinkread+0x50>
        printf(1, "create unlinkread failed\n");
    16e8:	e3a00001 	mov	r0, #1
    16ec:	e30519cc 	movw	r1, #22988	; 0x59cc
    16f0:	e3401000 	movt	r1, #0
    16f4:	eb000d67 	bl	4c98 <printf>
        exit();
    16f8:	eb000c4e 	bl	4838 <exit>
    }
    write(fd, "hello", 5);
    16fc:	e51b0008 	ldr	r0, [fp, #-8]
    1700:	e30519e8 	movw	r1, #23016	; 0x59e8
    1704:	e3401000 	movt	r1, #0
    1708:	e3a02005 	mov	r2, #5
    170c:	eb000c6d 	bl	48c8 <write>
    close(fd);
    1710:	e51b0008 	ldr	r0, [fp, #-8]
    1714:	eb000c74 	bl	48ec <close>

    fd = open("unlinkread", O_RDWR);
    1718:	e30509c0 	movw	r0, #22976	; 0x59c0
    171c:	e3400000 	movt	r0, #0
    1720:	e3a01002 	mov	r1, #2
    1724:	eb000c8b 	bl	4958 <open>
    1728:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    172c:	e51b3008 	ldr	r3, [fp, #-8]
    1730:	e3530000 	cmp	r3, #0
    1734:	aa000004 	bge	174c <unlinkread+0xa0>
        printf(1, "open unlinkread failed\n");
    1738:	e3a00001 	mov	r0, #1
    173c:	e30519f0 	movw	r1, #23024	; 0x59f0
    1740:	e3401000 	movt	r1, #0
    1744:	eb000d53 	bl	4c98 <printf>
        exit();
    1748:	eb000c3a 	bl	4838 <exit>
    }
    if(unlink("unlinkread") != 0){
    174c:	e30509c0 	movw	r0, #22976	; 0x59c0
    1750:	e3400000 	movt	r0, #0
    1754:	eb000c91 	bl	49a0 <unlink>
    1758:	e1a03000 	mov	r3, r0
    175c:	e3530000 	cmp	r3, #0
    1760:	0a000004 	beq	1778 <unlinkread+0xcc>
        printf(1, "unlink unlinkread failed\n");
    1764:	e3a00001 	mov	r0, #1
    1768:	e3051a08 	movw	r1, #23048	; 0x5a08
    176c:	e3401000 	movt	r1, #0
    1770:	eb000d48 	bl	4c98 <printf>
        exit();
    1774:	eb000c2f 	bl	4838 <exit>
    }

    fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1778:	e30509c0 	movw	r0, #22976	; 0x59c0
    177c:	e3400000 	movt	r0, #0
    1780:	e3001202 	movw	r1, #514	; 0x202
    1784:	eb000c73 	bl	4958 <open>
    1788:	e50b000c 	str	r0, [fp, #-12]
    write(fd1, "yyy", 3);
    178c:	e51b000c 	ldr	r0, [fp, #-12]
    1790:	e3051a24 	movw	r1, #23076	; 0x5a24
    1794:	e3401000 	movt	r1, #0
    1798:	e3a02003 	mov	r2, #3
    179c:	eb000c49 	bl	48c8 <write>
    close(fd1);
    17a0:	e51b000c 	ldr	r0, [fp, #-12]
    17a4:	eb000c50 	bl	48ec <close>

    if(read(fd, buf, sizeof(buf)) != 5){
    17a8:	e51b0008 	ldr	r0, [fp, #-8]
    17ac:	e3091374 	movw	r1, #37748	; 0x9374
    17b0:	e3401000 	movt	r1, #0
    17b4:	e3a02a02 	mov	r2, #8192	; 0x2000
    17b8:	eb000c39 	bl	48a4 <read>
    17bc:	e1a03000 	mov	r3, r0
    17c0:	e3530005 	cmp	r3, #5
    17c4:	0a000004 	beq	17dc <unlinkread+0x130>
        printf(1, "unlinkread read failed");
    17c8:	e3a00001 	mov	r0, #1
    17cc:	e3051a28 	movw	r1, #23080	; 0x5a28
    17d0:	e3401000 	movt	r1, #0
    17d4:	eb000d2f 	bl	4c98 <printf>
        exit();
    17d8:	eb000c16 	bl	4838 <exit>
    }
    if(buf[0] != 'h'){
    17dc:	e3093374 	movw	r3, #37748	; 0x9374
    17e0:	e3403000 	movt	r3, #0
    17e4:	e5d33000 	ldrb	r3, [r3]
    17e8:	e3530068 	cmp	r3, #104	; 0x68
    17ec:	0a000004 	beq	1804 <unlinkread+0x158>
        printf(1, "unlinkread wrong data\n");
    17f0:	e3a00001 	mov	r0, #1
    17f4:	e3051a40 	movw	r1, #23104	; 0x5a40
    17f8:	e3401000 	movt	r1, #0
    17fc:	eb000d25 	bl	4c98 <printf>
        exit();
    1800:	eb000c0c 	bl	4838 <exit>
    }
    if(write(fd, buf, 10) != 10){
    1804:	e51b0008 	ldr	r0, [fp, #-8]
    1808:	e3091374 	movw	r1, #37748	; 0x9374
    180c:	e3401000 	movt	r1, #0
    1810:	e3a0200a 	mov	r2, #10
    1814:	eb000c2b 	bl	48c8 <write>
    1818:	e1a03000 	mov	r3, r0
    181c:	e353000a 	cmp	r3, #10
    1820:	0a000004 	beq	1838 <unlinkread+0x18c>
        printf(1, "unlinkread write failed\n");
    1824:	e3a00001 	mov	r0, #1
    1828:	e3051a58 	movw	r1, #23128	; 0x5a58
    182c:	e3401000 	movt	r1, #0
    1830:	eb000d18 	bl	4c98 <printf>
        exit();
    1834:	eb000bff 	bl	4838 <exit>
    }
    close(fd);
    1838:	e51b0008 	ldr	r0, [fp, #-8]
    183c:	eb000c2a 	bl	48ec <close>
    unlink("unlinkread");
    1840:	e30509c0 	movw	r0, #22976	; 0x59c0
    1844:	e3400000 	movt	r0, #0
    1848:	eb000c54 	bl	49a0 <unlink>
    printf(1, "unlinkread ok\n");
    184c:	e3a00001 	mov	r0, #1
    1850:	e3051a74 	movw	r1, #23156	; 0x5a74
    1854:	e3401000 	movt	r1, #0
    1858:	eb000d0e 	bl	4c98 <printf>
}
    185c:	e24bd004 	sub	sp, fp, #4
    1860:	e8bd8800 	pop	{fp, pc}

00001864 <linktest>:

void
linktest(void)
{
    1864:	e92d4800 	push	{fp, lr}
    1868:	e28db004 	add	fp, sp, #4
    186c:	e24dd008 	sub	sp, sp, #8
    int fd;

    printf(1, "linktest\n");
    1870:	e3a00001 	mov	r0, #1
    1874:	e3051a84 	movw	r1, #23172	; 0x5a84
    1878:	e3401000 	movt	r1, #0
    187c:	eb000d05 	bl	4c98 <printf>

    unlink("lf1");
    1880:	e3050a90 	movw	r0, #23184	; 0x5a90
    1884:	e3400000 	movt	r0, #0
    1888:	eb000c44 	bl	49a0 <unlink>
    unlink("lf2");
    188c:	e3050a94 	movw	r0, #23188	; 0x5a94
    1890:	e3400000 	movt	r0, #0
    1894:	eb000c41 	bl	49a0 <unlink>

    fd = open("lf1", O_CREATE|O_RDWR);
    1898:	e3050a90 	movw	r0, #23184	; 0x5a90
    189c:	e3400000 	movt	r0, #0
    18a0:	e3001202 	movw	r1, #514	; 0x202
    18a4:	eb000c2b 	bl	4958 <open>
    18a8:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    18ac:	e51b3008 	ldr	r3, [fp, #-8]
    18b0:	e3530000 	cmp	r3, #0
    18b4:	aa000004 	bge	18cc <linktest+0x68>
        printf(1, "create lf1 failed\n");
    18b8:	e3a00001 	mov	r0, #1
    18bc:	e3051a98 	movw	r1, #23192	; 0x5a98
    18c0:	e3401000 	movt	r1, #0
    18c4:	eb000cf3 	bl	4c98 <printf>
        exit();
    18c8:	eb000bda 	bl	4838 <exit>
    }
    if(write(fd, "hello", 5) != 5){
    18cc:	e51b0008 	ldr	r0, [fp, #-8]
    18d0:	e30519e8 	movw	r1, #23016	; 0x59e8
    18d4:	e3401000 	movt	r1, #0
    18d8:	e3a02005 	mov	r2, #5
    18dc:	eb000bf9 	bl	48c8 <write>
    18e0:	e1a03000 	mov	r3, r0
    18e4:	e3530005 	cmp	r3, #5
    18e8:	0a000004 	beq	1900 <linktest+0x9c>
        printf(1, "write lf1 failed\n");
    18ec:	e3a00001 	mov	r0, #1
    18f0:	e3051aac 	movw	r1, #23212	; 0x5aac
    18f4:	e3401000 	movt	r1, #0
    18f8:	eb000ce6 	bl	4c98 <printf>
        exit();
    18fc:	eb000bcd 	bl	4838 <exit>
    }
    close(fd);
    1900:	e51b0008 	ldr	r0, [fp, #-8]
    1904:	eb000bf8 	bl	48ec <close>

    if(link("lf1", "lf2") < 0){
    1908:	e3050a90 	movw	r0, #23184	; 0x5a90
    190c:	e3400000 	movt	r0, #0
    1910:	e3051a94 	movw	r1, #23188	; 0x5a94
    1914:	e3401000 	movt	r1, #0
    1918:	eb000c32 	bl	49e8 <link>
    191c:	e1a03000 	mov	r3, r0
    1920:	e3530000 	cmp	r3, #0
    1924:	aa000004 	bge	193c <linktest+0xd8>
        printf(1, "link lf1 lf2 failed\n");
    1928:	e3a00001 	mov	r0, #1
    192c:	e3051ac0 	movw	r1, #23232	; 0x5ac0
    1930:	e3401000 	movt	r1, #0
    1934:	eb000cd7 	bl	4c98 <printf>
        exit();
    1938:	eb000bbe 	bl	4838 <exit>
    }
    unlink("lf1");
    193c:	e3050a90 	movw	r0, #23184	; 0x5a90
    1940:	e3400000 	movt	r0, #0
    1944:	eb000c15 	bl	49a0 <unlink>

    if(open("lf1", 0) >= 0){
    1948:	e3050a90 	movw	r0, #23184	; 0x5a90
    194c:	e3400000 	movt	r0, #0
    1950:	e3a01000 	mov	r1, #0
    1954:	eb000bff 	bl	4958 <open>
    1958:	e1a03000 	mov	r3, r0
    195c:	e3530000 	cmp	r3, #0
    1960:	ba000004 	blt	1978 <linktest+0x114>
        printf(1, "unlinked lf1 but it is still there!\n");
    1964:	e3a00001 	mov	r0, #1
    1968:	e3051ad8 	movw	r1, #23256	; 0x5ad8
    196c:	e3401000 	movt	r1, #0
    1970:	eb000cc8 	bl	4c98 <printf>
        exit();
    1974:	eb000baf 	bl	4838 <exit>
    }

    fd = open("lf2", 0);
    1978:	e3050a94 	movw	r0, #23188	; 0x5a94
    197c:	e3400000 	movt	r0, #0
    1980:	e3a01000 	mov	r1, #0
    1984:	eb000bf3 	bl	4958 <open>
    1988:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    198c:	e51b3008 	ldr	r3, [fp, #-8]
    1990:	e3530000 	cmp	r3, #0
    1994:	aa000004 	bge	19ac <linktest+0x148>
        printf(1, "open lf2 failed\n");
    1998:	e3a00001 	mov	r0, #1
    199c:	e3051b00 	movw	r1, #23296	; 0x5b00
    19a0:	e3401000 	movt	r1, #0
    19a4:	eb000cbb 	bl	4c98 <printf>
        exit();
    19a8:	eb000ba2 	bl	4838 <exit>
    }
    if(read(fd, buf, sizeof(buf)) != 5){
    19ac:	e51b0008 	ldr	r0, [fp, #-8]
    19b0:	e3091374 	movw	r1, #37748	; 0x9374
    19b4:	e3401000 	movt	r1, #0
    19b8:	e3a02a02 	mov	r2, #8192	; 0x2000
    19bc:	eb000bb8 	bl	48a4 <read>
    19c0:	e1a03000 	mov	r3, r0
    19c4:	e3530005 	cmp	r3, #5
    19c8:	0a000004 	beq	19e0 <linktest+0x17c>
        printf(1, "read lf2 failed\n");
    19cc:	e3a00001 	mov	r0, #1
    19d0:	e3051b14 	movw	r1, #23316	; 0x5b14
    19d4:	e3401000 	movt	r1, #0
    19d8:	eb000cae 	bl	4c98 <printf>
        exit();
    19dc:	eb000b95 	bl	4838 <exit>
    }
    close(fd);
    19e0:	e51b0008 	ldr	r0, [fp, #-8]
    19e4:	eb000bc0 	bl	48ec <close>

    if(link("lf2", "lf2") >= 0){
    19e8:	e3050a94 	movw	r0, #23188	; 0x5a94
    19ec:	e3400000 	movt	r0, #0
    19f0:	e3051a94 	movw	r1, #23188	; 0x5a94
    19f4:	e3401000 	movt	r1, #0
    19f8:	eb000bfa 	bl	49e8 <link>
    19fc:	e1a03000 	mov	r3, r0
    1a00:	e3530000 	cmp	r3, #0
    1a04:	ba000004 	blt	1a1c <linktest+0x1b8>
        printf(1, "link lf2 lf2 succeeded! oops\n");
    1a08:	e3a00001 	mov	r0, #1
    1a0c:	e3051b28 	movw	r1, #23336	; 0x5b28
    1a10:	e3401000 	movt	r1, #0
    1a14:	eb000c9f 	bl	4c98 <printf>
        exit();
    1a18:	eb000b86 	bl	4838 <exit>
    }

    unlink("lf2");
    1a1c:	e3050a94 	movw	r0, #23188	; 0x5a94
    1a20:	e3400000 	movt	r0, #0
    1a24:	eb000bdd 	bl	49a0 <unlink>
    if(link("lf2", "lf1") >= 0){
    1a28:	e3050a94 	movw	r0, #23188	; 0x5a94
    1a2c:	e3400000 	movt	r0, #0
    1a30:	e3051a90 	movw	r1, #23184	; 0x5a90
    1a34:	e3401000 	movt	r1, #0
    1a38:	eb000bea 	bl	49e8 <link>
    1a3c:	e1a03000 	mov	r3, r0
    1a40:	e3530000 	cmp	r3, #0
    1a44:	ba000004 	blt	1a5c <linktest+0x1f8>
        printf(1, "link non-existant succeeded! oops\n");
    1a48:	e3a00001 	mov	r0, #1
    1a4c:	e3051b48 	movw	r1, #23368	; 0x5b48
    1a50:	e3401000 	movt	r1, #0
    1a54:	eb000c8f 	bl	4c98 <printf>
        exit();
    1a58:	eb000b76 	bl	4838 <exit>
    }

    if(link(".", "lf1") >= 0){
    1a5c:	e3050b6c 	movw	r0, #23404	; 0x5b6c
    1a60:	e3400000 	movt	r0, #0
    1a64:	e3051a90 	movw	r1, #23184	; 0x5a90
    1a68:	e3401000 	movt	r1, #0
    1a6c:	eb000bdd 	bl	49e8 <link>
    1a70:	e1a03000 	mov	r3, r0
    1a74:	e3530000 	cmp	r3, #0
    1a78:	ba000004 	blt	1a90 <linktest+0x22c>
        printf(1, "link . lf1 succeeded! oops\n");
    1a7c:	e3a00001 	mov	r0, #1
    1a80:	e3051b70 	movw	r1, #23408	; 0x5b70
    1a84:	e3401000 	movt	r1, #0
    1a88:	eb000c82 	bl	4c98 <printf>
        exit();
    1a8c:	eb000b69 	bl	4838 <exit>
    }

    printf(1, "linktest ok\n");
    1a90:	e3a00001 	mov	r0, #1
    1a94:	e3051b8c 	movw	r1, #23436	; 0x5b8c
    1a98:	e3401000 	movt	r1, #0
    1a9c:	eb000c7d 	bl	4c98 <printf>
}
    1aa0:	e24bd004 	sub	sp, fp, #4
    1aa4:	e8bd8800 	pop	{fp, pc}

00001aa8 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1aa8:	e92d4800 	push	{fp, lr}
    1aac:	e28db004 	add	fp, sp, #4
    1ab0:	e24dd050 	sub	sp, sp, #80	; 0x50
    struct {
        ushort inum;
        char name[14];
    } de;

    printf(1, "concreate test\n");
    1ab4:	e3a00001 	mov	r0, #1
    1ab8:	e3051b9c 	movw	r1, #23452	; 0x5b9c
    1abc:	e3401000 	movt	r1, #0
    1ac0:	eb000c74 	bl	4c98 <printf>
    file[0] = 'C';
    1ac4:	e3a03043 	mov	r3, #67	; 0x43
    1ac8:	e54b3018 	strb	r3, [fp, #-24]	; 0xffffffe8
    file[2] = '\0';
    1acc:	e3a03000 	mov	r3, #0
    1ad0:	e54b3016 	strb	r3, [fp, #-22]	; 0xffffffea
    for(i = 0; i < 40; i++){
    1ad4:	e3a03000 	mov	r3, #0
    1ad8:	e50b3008 	str	r3, [fp, #-8]
    1adc:	ea00004d 	b	1c18 <concreate+0x170>
        file[1] = '0' + i;
    1ae0:	e51b3008 	ldr	r3, [fp, #-8]
    1ae4:	e6ef3073 	uxtb	r3, r3
    1ae8:	e2833030 	add	r3, r3, #48	; 0x30
    1aec:	e6ef3073 	uxtb	r3, r3
    1af0:	e54b3017 	strb	r3, [fp, #-23]	; 0xffffffe9
        unlink(file);
    1af4:	e24b3018 	sub	r3, fp, #24
    1af8:	e1a00003 	mov	r0, r3
    1afc:	eb000ba7 	bl	49a0 <unlink>
        pid = fork();
    1b00:	eb000b43 	bl	4814 <fork>
    1b04:	e50b0010 	str	r0, [fp, #-16]
        if(pid && (i % 3) == 1){
    1b08:	e51b3010 	ldr	r3, [fp, #-16]
    1b0c:	e3530000 	cmp	r3, #0
    1b10:	0a000011 	beq	1b5c <concreate+0xb4>
    1b14:	e51b1008 	ldr	r1, [fp, #-8]
    1b18:	e3053556 	movw	r3, #21846	; 0x5556
    1b1c:	e3453555 	movt	r3, #21845	; 0x5555
    1b20:	e0c20193 	smull	r0, r2, r3, r1
    1b24:	e1a03fc1 	asr	r3, r1, #31
    1b28:	e0632002 	rsb	r2, r3, r2
    1b2c:	e1a03002 	mov	r3, r2
    1b30:	e1a03083 	lsl	r3, r3, #1
    1b34:	e0833002 	add	r3, r3, r2
    1b38:	e0632001 	rsb	r2, r3, r1
    1b3c:	e3520001 	cmp	r2, #1
    1b40:	1a000005 	bne	1b5c <concreate+0xb4>
            link("C0", file);
    1b44:	e3050bac 	movw	r0, #23468	; 0x5bac
    1b48:	e3400000 	movt	r0, #0
    1b4c:	e24b3018 	sub	r3, fp, #24
    1b50:	e1a01003 	mov	r1, r3
    1b54:	eb000ba3 	bl	49e8 <link>
    1b58:	ea000026 	b	1bf8 <concreate+0x150>
        } else if(pid == 0 && (i % 5) == 1){
    1b5c:	e51b3010 	ldr	r3, [fp, #-16]
    1b60:	e3530000 	cmp	r3, #0
    1b64:	1a000012 	bne	1bb4 <concreate+0x10c>
    1b68:	e51b1008 	ldr	r1, [fp, #-8]
    1b6c:	e3063667 	movw	r3, #26215	; 0x6667
    1b70:	e3463666 	movt	r3, #26214	; 0x6666
    1b74:	e0c32193 	smull	r2, r3, r3, r1
    1b78:	e1a020c3 	asr	r2, r3, #1
    1b7c:	e1a03fc1 	asr	r3, r1, #31
    1b80:	e0632002 	rsb	r2, r3, r2
    1b84:	e1a03002 	mov	r3, r2
    1b88:	e1a03103 	lsl	r3, r3, #2
    1b8c:	e0833002 	add	r3, r3, r2
    1b90:	e0632001 	rsb	r2, r3, r1
    1b94:	e3520001 	cmp	r2, #1
    1b98:	1a000005 	bne	1bb4 <concreate+0x10c>
            link("C0", file);
    1b9c:	e3050bac 	movw	r0, #23468	; 0x5bac
    1ba0:	e3400000 	movt	r0, #0
    1ba4:	e24b3018 	sub	r3, fp, #24
    1ba8:	e1a01003 	mov	r1, r3
    1bac:	eb000b8d 	bl	49e8 <link>
    1bb0:	ea000010 	b	1bf8 <concreate+0x150>
        } else {
            fd = open(file, O_CREATE | O_RDWR);
    1bb4:	e24b3018 	sub	r3, fp, #24
    1bb8:	e1a00003 	mov	r0, r3
    1bbc:	e3001202 	movw	r1, #514	; 0x202
    1bc0:	eb000b64 	bl	4958 <open>
    1bc4:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
            if(fd < 0){
    1bc8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1bcc:	e3530000 	cmp	r3, #0
    1bd0:	aa000006 	bge	1bf0 <concreate+0x148>
                printf(1, "concreate create %s failed\n", file);
    1bd4:	e3a00001 	mov	r0, #1
    1bd8:	e3051bb0 	movw	r1, #23472	; 0x5bb0
    1bdc:	e3401000 	movt	r1, #0
    1be0:	e24b3018 	sub	r3, fp, #24
    1be4:	e1a02003 	mov	r2, r3
    1be8:	eb000c2a 	bl	4c98 <printf>
                exit();
    1bec:	eb000b11 	bl	4838 <exit>
            }
            close(fd);
    1bf0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    1bf4:	eb000b3c 	bl	48ec <close>
        }
        if(pid == 0)
    1bf8:	e51b3010 	ldr	r3, [fp, #-16]
    1bfc:	e3530000 	cmp	r3, #0
    1c00:	1a000000 	bne	1c08 <concreate+0x160>
            exit();
    1c04:	eb000b0b 	bl	4838 <exit>
        else
            wait();
    1c08:	eb000b13 	bl	485c <wait>
    } de;

    printf(1, "concreate test\n");
    file[0] = 'C';
    file[2] = '\0';
    for(i = 0; i < 40; i++){
    1c0c:	e51b3008 	ldr	r3, [fp, #-8]
    1c10:	e2833001 	add	r3, r3, #1
    1c14:	e50b3008 	str	r3, [fp, #-8]
    1c18:	e51b3008 	ldr	r3, [fp, #-8]
    1c1c:	e3530027 	cmp	r3, #39	; 0x27
    1c20:	daffffae 	ble	1ae0 <concreate+0x38>
            exit();
        else
            wait();
    }

    memset(fa, 0, sizeof(fa));
    1c24:	e24b3040 	sub	r3, fp, #64	; 0x40
    1c28:	e1a00003 	mov	r0, r3
    1c2c:	e3a01000 	mov	r1, #0
    1c30:	e3a02028 	mov	r2, #40	; 0x28
    1c34:	eb000a06 	bl	4454 <memset>
    fd = open(".", 0);
    1c38:	e3050b6c 	movw	r0, #23404	; 0x5b6c
    1c3c:	e3400000 	movt	r0, #0
    1c40:	e3a01000 	mov	r1, #0
    1c44:	eb000b43 	bl	4958 <open>
    1c48:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    n = 0;
    1c4c:	e3a03000 	mov	r3, #0
    1c50:	e50b300c 	str	r3, [fp, #-12]
    while(read(fd, &de, sizeof(de)) > 0){
    1c54:	ea000037 	b	1d38 <concreate+0x290>
        if(de.inum == 0)
    1c58:	e15b35b0 	ldrh	r3, [fp, #-80]	; 0xffffffb0
    1c5c:	e3530000 	cmp	r3, #0
    1c60:	0a000033 	beq	1d34 <concreate+0x28c>
            continue;
        if(de.name[0] == 'C' && de.name[2] == '\0'){
    1c64:	e55b304e 	ldrb	r3, [fp, #-78]	; 0xffffffb2
    1c68:	e3530043 	cmp	r3, #67	; 0x43
    1c6c:	1a000031 	bne	1d38 <concreate+0x290>
    1c70:	e55b304c 	ldrb	r3, [fp, #-76]	; 0xffffffb4
    1c74:	e3530000 	cmp	r3, #0
    1c78:	1a00002e 	bne	1d38 <concreate+0x290>
            i = de.name[1] - '0';
    1c7c:	e55b304d 	ldrb	r3, [fp, #-77]	; 0xffffffb3
    1c80:	e2433030 	sub	r3, r3, #48	; 0x30
    1c84:	e50b3008 	str	r3, [fp, #-8]
            if(i < 0 || i >= sizeof(fa)){
    1c88:	e51b3008 	ldr	r3, [fp, #-8]
    1c8c:	e3530000 	cmp	r3, #0
    1c90:	ba000002 	blt	1ca0 <concreate+0x1f8>
    1c94:	e51b3008 	ldr	r3, [fp, #-8]
    1c98:	e3530027 	cmp	r3, #39	; 0x27
    1c9c:	9a000007 	bls	1cc0 <concreate+0x218>
                printf(1, "concreate weird file %s\n", de.name);
    1ca0:	e24b3050 	sub	r3, fp, #80	; 0x50
    1ca4:	e2833002 	add	r3, r3, #2
    1ca8:	e3a00001 	mov	r0, #1
    1cac:	e3051bcc 	movw	r1, #23500	; 0x5bcc
    1cb0:	e3401000 	movt	r1, #0
    1cb4:	e1a02003 	mov	r2, r3
    1cb8:	eb000bf6 	bl	4c98 <printf>
                exit();
    1cbc:	eb000add 	bl	4838 <exit>
            }
            if(fa[i]){
    1cc0:	e3e0103b 	mvn	r1, #59	; 0x3b
    1cc4:	e51b3008 	ldr	r3, [fp, #-8]
    1cc8:	e24b0004 	sub	r0, fp, #4
    1ccc:	e0802003 	add	r2, r0, r3
    1cd0:	e1a03001 	mov	r3, r1
    1cd4:	e0823003 	add	r3, r2, r3
    1cd8:	e5d33000 	ldrb	r3, [r3]
    1cdc:	e3530000 	cmp	r3, #0
    1ce0:	0a000007 	beq	1d04 <concreate+0x25c>
                printf(1, "concreate duplicate file %s\n", de.name);
    1ce4:	e24b3050 	sub	r3, fp, #80	; 0x50
    1ce8:	e2833002 	add	r3, r3, #2
    1cec:	e3a00001 	mov	r0, #1
    1cf0:	e3051be8 	movw	r1, #23528	; 0x5be8
    1cf4:	e3401000 	movt	r1, #0
    1cf8:	e1a02003 	mov	r2, r3
    1cfc:	eb000be5 	bl	4c98 <printf>
                exit();
    1d00:	eb000acc 	bl	4838 <exit>
            }
            fa[i] = 1;
    1d04:	e3e0103b 	mvn	r1, #59	; 0x3b
    1d08:	e51b3008 	ldr	r3, [fp, #-8]
    1d0c:	e24b0004 	sub	r0, fp, #4
    1d10:	e0802003 	add	r2, r0, r3
    1d14:	e1a03001 	mov	r3, r1
    1d18:	e0823003 	add	r3, r2, r3
    1d1c:	e3a02001 	mov	r2, #1
    1d20:	e5c32000 	strb	r2, [r3]
            n++;
    1d24:	e51b300c 	ldr	r3, [fp, #-12]
    1d28:	e2833001 	add	r3, r3, #1
    1d2c:	e50b300c 	str	r3, [fp, #-12]
    1d30:	ea000000 	b	1d38 <concreate+0x290>
    memset(fa, 0, sizeof(fa));
    fd = open(".", 0);
    n = 0;
    while(read(fd, &de, sizeof(de)) > 0){
        if(de.inum == 0)
            continue;
    1d34:	e1a00000 	nop			; (mov r0, r0)
    }

    memset(fa, 0, sizeof(fa));
    fd = open(".", 0);
    n = 0;
    while(read(fd, &de, sizeof(de)) > 0){
    1d38:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    1d3c:	e24b3050 	sub	r3, fp, #80	; 0x50
    1d40:	e1a01003 	mov	r1, r3
    1d44:	e3a02010 	mov	r2, #16
    1d48:	eb000ad5 	bl	48a4 <read>
    1d4c:	e1a03000 	mov	r3, r0
    1d50:	e3530000 	cmp	r3, #0
    1d54:	caffffbf 	bgt	1c58 <concreate+0x1b0>
            }
            fa[i] = 1;
            n++;
        }
    }
    close(fd);
    1d58:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    1d5c:	eb000ae2 	bl	48ec <close>

    if(n != 40){
    1d60:	e51b300c 	ldr	r3, [fp, #-12]
    1d64:	e3530028 	cmp	r3, #40	; 0x28
    1d68:	0a000004 	beq	1d80 <concreate+0x2d8>
        printf(1, "concreate not enough files in directory listing\n");
    1d6c:	e3a00001 	mov	r0, #1
    1d70:	e3051c08 	movw	r1, #23560	; 0x5c08
    1d74:	e3401000 	movt	r1, #0
    1d78:	eb000bc6 	bl	4c98 <printf>
        exit();
    1d7c:	eb000aad 	bl	4838 <exit>
    }

    for(i = 0; i < 40; i++){
    1d80:	e3a03000 	mov	r3, #0
    1d84:	e50b3008 	str	r3, [fp, #-8]
    1d88:	ea00005d 	b	1f04 <concreate+0x45c>
        file[1] = '0' + i;
    1d8c:	e51b3008 	ldr	r3, [fp, #-8]
    1d90:	e6ef3073 	uxtb	r3, r3
    1d94:	e2833030 	add	r3, r3, #48	; 0x30
    1d98:	e6ef3073 	uxtb	r3, r3
    1d9c:	e54b3017 	strb	r3, [fp, #-23]	; 0xffffffe9
        pid = fork();
    1da0:	eb000a9b 	bl	4814 <fork>
    1da4:	e50b0010 	str	r0, [fp, #-16]
        if(pid < 0){
    1da8:	e51b3010 	ldr	r3, [fp, #-16]
    1dac:	e3530000 	cmp	r3, #0
    1db0:	aa000004 	bge	1dc8 <concreate+0x320>
            printf(1, "fork failed\n");
    1db4:	e3a00001 	mov	r0, #1
    1db8:	e30517a8 	movw	r1, #22440	; 0x57a8
    1dbc:	e3401000 	movt	r1, #0
    1dc0:	eb000bb4 	bl	4c98 <printf>
            exit();
    1dc4:	eb000a9b 	bl	4838 <exit>
        }
        if(((i % 3) == 0 && pid == 0) ||
    1dc8:	e51b1008 	ldr	r1, [fp, #-8]
    1dcc:	e3053556 	movw	r3, #21846	; 0x5556
    1dd0:	e3453555 	movt	r3, #21845	; 0x5555
    1dd4:	e0c20193 	smull	r0, r2, r3, r1
    1dd8:	e1a03fc1 	asr	r3, r1, #31
    1ddc:	e0632002 	rsb	r2, r3, r2
    1de0:	e1a03002 	mov	r3, r2
    1de4:	e1a03083 	lsl	r3, r3, #1
    1de8:	e0833002 	add	r3, r3, r2
    1dec:	e0632001 	rsb	r2, r3, r1
    1df0:	e3520000 	cmp	r2, #0
    1df4:	1a000002 	bne	1e04 <concreate+0x35c>
    1df8:	e51b3010 	ldr	r3, [fp, #-16]
    1dfc:	e3530000 	cmp	r3, #0
    1e00:	0a00000e 	beq	1e40 <concreate+0x398>
           ((i % 3) == 1 && pid != 0)){
    1e04:	e51b1008 	ldr	r1, [fp, #-8]
    1e08:	e3053556 	movw	r3, #21846	; 0x5556
    1e0c:	e3453555 	movt	r3, #21845	; 0x5555
    1e10:	e0c20193 	smull	r0, r2, r3, r1
    1e14:	e1a03fc1 	asr	r3, r1, #31
    1e18:	e0632002 	rsb	r2, r3, r2
    1e1c:	e1a03002 	mov	r3, r2
    1e20:	e1a03083 	lsl	r3, r3, #1
    1e24:	e0833002 	add	r3, r3, r2
    1e28:	e0632001 	rsb	r2, r3, r1
        pid = fork();
        if(pid < 0){
            printf(1, "fork failed\n");
            exit();
        }
        if(((i % 3) == 0 && pid == 0) ||
    1e2c:	e3520001 	cmp	r2, #1
    1e30:	1a00001f 	bne	1eb4 <concreate+0x40c>
           ((i % 3) == 1 && pid != 0)){
    1e34:	e51b3010 	ldr	r3, [fp, #-16]
    1e38:	e3530000 	cmp	r3, #0
    1e3c:	0a00001c 	beq	1eb4 <concreate+0x40c>
            close(open(file, 0));
    1e40:	e24b3018 	sub	r3, fp, #24
    1e44:	e1a00003 	mov	r0, r3
    1e48:	e3a01000 	mov	r1, #0
    1e4c:	eb000ac1 	bl	4958 <open>
    1e50:	e1a03000 	mov	r3, r0
    1e54:	e1a00003 	mov	r0, r3
    1e58:	eb000aa3 	bl	48ec <close>
            close(open(file, 0));
    1e5c:	e24b3018 	sub	r3, fp, #24
    1e60:	e1a00003 	mov	r0, r3
    1e64:	e3a01000 	mov	r1, #0
    1e68:	eb000aba 	bl	4958 <open>
    1e6c:	e1a03000 	mov	r3, r0
    1e70:	e1a00003 	mov	r0, r3
    1e74:	eb000a9c 	bl	48ec <close>
            close(open(file, 0));
    1e78:	e24b3018 	sub	r3, fp, #24
    1e7c:	e1a00003 	mov	r0, r3
    1e80:	e3a01000 	mov	r1, #0
    1e84:	eb000ab3 	bl	4958 <open>
    1e88:	e1a03000 	mov	r3, r0
    1e8c:	e1a00003 	mov	r0, r3
    1e90:	eb000a95 	bl	48ec <close>
            close(open(file, 0));
    1e94:	e24b3018 	sub	r3, fp, #24
    1e98:	e1a00003 	mov	r0, r3
    1e9c:	e3a01000 	mov	r1, #0
    1ea0:	eb000aac 	bl	4958 <open>
    1ea4:	e1a03000 	mov	r3, r0
    1ea8:	e1a00003 	mov	r0, r3
    1eac:	eb000a8e 	bl	48ec <close>
    1eb0:	ea00000b 	b	1ee4 <concreate+0x43c>
        } else {
            unlink(file);
    1eb4:	e24b3018 	sub	r3, fp, #24
    1eb8:	e1a00003 	mov	r0, r3
    1ebc:	eb000ab7 	bl	49a0 <unlink>
            unlink(file);
    1ec0:	e24b3018 	sub	r3, fp, #24
    1ec4:	e1a00003 	mov	r0, r3
    1ec8:	eb000ab4 	bl	49a0 <unlink>
            unlink(file);
    1ecc:	e24b3018 	sub	r3, fp, #24
    1ed0:	e1a00003 	mov	r0, r3
    1ed4:	eb000ab1 	bl	49a0 <unlink>
            unlink(file);
    1ed8:	e24b3018 	sub	r3, fp, #24
    1edc:	e1a00003 	mov	r0, r3
    1ee0:	eb000aae 	bl	49a0 <unlink>
        }
        if(pid == 0)
    1ee4:	e51b3010 	ldr	r3, [fp, #-16]
    1ee8:	e3530000 	cmp	r3, #0
    1eec:	1a000000 	bne	1ef4 <concreate+0x44c>
            exit();
    1ef0:	eb000a50 	bl	4838 <exit>
        else
            wait();
    1ef4:	eb000a58 	bl	485c <wait>
    if(n != 40){
        printf(1, "concreate not enough files in directory listing\n");
        exit();
    }

    for(i = 0; i < 40; i++){
    1ef8:	e51b3008 	ldr	r3, [fp, #-8]
    1efc:	e2833001 	add	r3, r3, #1
    1f00:	e50b3008 	str	r3, [fp, #-8]
    1f04:	e51b3008 	ldr	r3, [fp, #-8]
    1f08:	e3530027 	cmp	r3, #39	; 0x27
    1f0c:	daffff9e 	ble	1d8c <concreate+0x2e4>
            exit();
        else
            wait();
    }

    printf(1, "concreate ok\n");
    1f10:	e3a00001 	mov	r0, #1
    1f14:	e3051c3c 	movw	r1, #23612	; 0x5c3c
    1f18:	e3401000 	movt	r1, #0
    1f1c:	eb000b5d 	bl	4c98 <printf>
}
    1f20:	e24bd004 	sub	sp, fp, #4
    1f24:	e8bd8800 	pop	{fp, pc}

00001f28 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1f28:	e92d4800 	push	{fp, lr}
    1f2c:	e28db004 	add	fp, sp, #4
    1f30:	e24dd010 	sub	sp, sp, #16
    int pid, i;

    printf(1, "linkunlink test\n");
    1f34:	e3a00001 	mov	r0, #1
    1f38:	e3051c4c 	movw	r1, #23628	; 0x5c4c
    1f3c:	e3401000 	movt	r1, #0
    1f40:	eb000b54 	bl	4c98 <printf>

    unlink("x");
    1f44:	e3050758 	movw	r0, #22360	; 0x5758
    1f48:	e3400000 	movt	r0, #0
    1f4c:	eb000a93 	bl	49a0 <unlink>
    pid = fork();
    1f50:	eb000a2f 	bl	4814 <fork>
    1f54:	e50b0010 	str	r0, [fp, #-16]
    if(pid < 0){
    1f58:	e51b3010 	ldr	r3, [fp, #-16]
    1f5c:	e3530000 	cmp	r3, #0
    1f60:	aa000004 	bge	1f78 <linkunlink+0x50>
        printf(1, "fork failed\n");
    1f64:	e3a00001 	mov	r0, #1
    1f68:	e30517a8 	movw	r1, #22440	; 0x57a8
    1f6c:	e3401000 	movt	r1, #0
    1f70:	eb000b48 	bl	4c98 <printf>
        exit();
    1f74:	eb000a2f 	bl	4838 <exit>
    }

    unsigned int x = (pid ? 1 : 97);
    1f78:	e51b3010 	ldr	r3, [fp, #-16]
    1f7c:	e3530000 	cmp	r3, #0
    1f80:	0a000001 	beq	1f8c <linkunlink+0x64>
    1f84:	e3a03001 	mov	r3, #1
    1f88:	ea000000 	b	1f90 <linkunlink+0x68>
    1f8c:	e3a03061 	mov	r3, #97	; 0x61
    1f90:	e50b300c 	str	r3, [fp, #-12]
    for(i = 0; i < 100; i++){
    1f94:	e3a03000 	mov	r3, #0
    1f98:	e50b3008 	str	r3, [fp, #-8]
    1f9c:	ea000030 	b	2064 <linkunlink+0x13c>
        x = x * 1103515245 + 12345;
    1fa0:	e51b200c 	ldr	r2, [fp, #-12]
    1fa4:	e3043e6d 	movw	r3, #20077	; 0x4e6d
    1fa8:	e34431c6 	movt	r3, #16838	; 0x41c6
    1fac:	e0030293 	mul	r3, r3, r2
    1fb0:	e2833a03 	add	r3, r3, #12288	; 0x3000
    1fb4:	e2833039 	add	r3, r3, #57	; 0x39
    1fb8:	e50b300c 	str	r3, [fp, #-12]
        if((x % 3) == 0){
    1fbc:	e51b100c 	ldr	r1, [fp, #-12]
    1fc0:	e30a3aab 	movw	r3, #43691	; 0xaaab
    1fc4:	e34a3aaa 	movt	r3, #43690	; 0xaaaa
    1fc8:	e0832193 	umull	r2, r3, r3, r1
    1fcc:	e1a020a3 	lsr	r2, r3, #1
    1fd0:	e1a03002 	mov	r3, r2
    1fd4:	e1a03083 	lsl	r3, r3, #1
    1fd8:	e0833002 	add	r3, r3, r2
    1fdc:	e0632001 	rsb	r2, r3, r1
    1fe0:	e3520000 	cmp	r2, #0
    1fe4:	1a000007 	bne	2008 <linkunlink+0xe0>
            close(open("x", O_RDWR | O_CREATE));
    1fe8:	e3050758 	movw	r0, #22360	; 0x5758
    1fec:	e3400000 	movt	r0, #0
    1ff0:	e3001202 	movw	r1, #514	; 0x202
    1ff4:	eb000a57 	bl	4958 <open>
    1ff8:	e1a03000 	mov	r3, r0
    1ffc:	e1a00003 	mov	r0, r3
    2000:	eb000a39 	bl	48ec <close>
    2004:	ea000013 	b	2058 <linkunlink+0x130>
        } else if((x % 3) == 1){
    2008:	e51b100c 	ldr	r1, [fp, #-12]
    200c:	e30a3aab 	movw	r3, #43691	; 0xaaab
    2010:	e34a3aaa 	movt	r3, #43690	; 0xaaaa
    2014:	e0832193 	umull	r2, r3, r3, r1
    2018:	e1a020a3 	lsr	r2, r3, #1
    201c:	e1a03002 	mov	r3, r2
    2020:	e1a03083 	lsl	r3, r3, #1
    2024:	e0833002 	add	r3, r3, r2
    2028:	e0632001 	rsb	r2, r3, r1
    202c:	e3520001 	cmp	r2, #1
    2030:	1a000005 	bne	204c <linkunlink+0x124>
            link("cat", "x");
    2034:	e3050c60 	movw	r0, #23648	; 0x5c60
    2038:	e3400000 	movt	r0, #0
    203c:	e3051758 	movw	r1, #22360	; 0x5758
    2040:	e3401000 	movt	r1, #0
    2044:	eb000a67 	bl	49e8 <link>
    2048:	ea000002 	b	2058 <linkunlink+0x130>
        } else {
            unlink("x");
    204c:	e3050758 	movw	r0, #22360	; 0x5758
    2050:	e3400000 	movt	r0, #0
    2054:	eb000a51 	bl	49a0 <unlink>
        printf(1, "fork failed\n");
        exit();
    }

    unsigned int x = (pid ? 1 : 97);
    for(i = 0; i < 100; i++){
    2058:	e51b3008 	ldr	r3, [fp, #-8]
    205c:	e2833001 	add	r3, r3, #1
    2060:	e50b3008 	str	r3, [fp, #-8]
    2064:	e51b3008 	ldr	r3, [fp, #-8]
    2068:	e3530063 	cmp	r3, #99	; 0x63
    206c:	daffffcb 	ble	1fa0 <linkunlink+0x78>
        } else {
            unlink("x");
        }
    }

    if(pid)
    2070:	e51b3010 	ldr	r3, [fp, #-16]
    2074:	e3530000 	cmp	r3, #0
    2078:	0a000006 	beq	2098 <linkunlink+0x170>
        wait();
    207c:	eb0009f6 	bl	485c <wait>
    else
        exit();

    printf(1, "linkunlink ok\n");
    2080:	e3a00001 	mov	r0, #1
    2084:	e3051c64 	movw	r1, #23652	; 0x5c64
    2088:	e3401000 	movt	r1, #0
    208c:	eb000b01 	bl	4c98 <printf>
}
    2090:	e24bd004 	sub	sp, fp, #4
    2094:	e8bd8800 	pop	{fp, pc}
    }

    if(pid)
        wait();
    else
        exit();
    2098:	eb0009e6 	bl	4838 <exit>

0000209c <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    209c:	e92d4800 	push	{fp, lr}
    20a0:	e28db004 	add	fp, sp, #4
    20a4:	e24dd018 	sub	sp, sp, #24
    int i, fd;
    char name[10];

    printf(1, "bigdir test\n");
    20a8:	e3a00001 	mov	r0, #1
    20ac:	e3051c74 	movw	r1, #23668	; 0x5c74
    20b0:	e3401000 	movt	r1, #0
    20b4:	eb000af7 	bl	4c98 <printf>
    unlink("bd");
    20b8:	e3050c84 	movw	r0, #23684	; 0x5c84
    20bc:	e3400000 	movt	r0, #0
    20c0:	eb000a36 	bl	49a0 <unlink>

    fd = open("bd", O_CREATE);
    20c4:	e3050c84 	movw	r0, #23684	; 0x5c84
    20c8:	e3400000 	movt	r0, #0
    20cc:	e3a01c02 	mov	r1, #512	; 0x200
    20d0:	eb000a20 	bl	4958 <open>
    20d4:	e50b000c 	str	r0, [fp, #-12]
    if(fd < 0){
    20d8:	e51b300c 	ldr	r3, [fp, #-12]
    20dc:	e3530000 	cmp	r3, #0
    20e0:	aa000004 	bge	20f8 <bigdir+0x5c>
        printf(1, "bigdir create failed\n");
    20e4:	e3a00001 	mov	r0, #1
    20e8:	e3051c88 	movw	r1, #23688	; 0x5c88
    20ec:	e3401000 	movt	r1, #0
    20f0:	eb000ae8 	bl	4c98 <printf>
        exit();
    20f4:	eb0009cf 	bl	4838 <exit>
    }
    close(fd);
    20f8:	e51b000c 	ldr	r0, [fp, #-12]
    20fc:	eb0009fa 	bl	48ec <close>

    for(i = 0; i < 500; i++){
    2100:	e3a03000 	mov	r3, #0
    2104:	e50b3008 	str	r3, [fp, #-8]
    2108:	ea000026 	b	21a8 <bigdir+0x10c>
        name[0] = 'x';
    210c:	e3a03078 	mov	r3, #120	; 0x78
    2110:	e54b3018 	strb	r3, [fp, #-24]	; 0xffffffe8
        name[1] = '0' + (i / 64);
    2114:	e51b3008 	ldr	r3, [fp, #-8]
    2118:	e283203f 	add	r2, r3, #63	; 0x3f
    211c:	e3530000 	cmp	r3, #0
    2120:	b1a03002 	movlt	r3, r2
    2124:	e1a03343 	asr	r3, r3, #6
    2128:	e6ef3073 	uxtb	r3, r3
    212c:	e2833030 	add	r3, r3, #48	; 0x30
    2130:	e6ef3073 	uxtb	r3, r3
    2134:	e54b3017 	strb	r3, [fp, #-23]	; 0xffffffe9
        name[2] = '0' + (i % 64);
    2138:	e51b2008 	ldr	r2, [fp, #-8]
    213c:	e1a03fc2 	asr	r3, r2, #31
    2140:	e1a03d23 	lsr	r3, r3, #26
    2144:	e0822003 	add	r2, r2, r3
    2148:	e202203f 	and	r2, r2, #63	; 0x3f
    214c:	e0633002 	rsb	r3, r3, r2
    2150:	e6ef3073 	uxtb	r3, r3
    2154:	e2833030 	add	r3, r3, #48	; 0x30
    2158:	e6ef3073 	uxtb	r3, r3
    215c:	e54b3016 	strb	r3, [fp, #-22]	; 0xffffffea
        name[3] = '\0';
    2160:	e3a03000 	mov	r3, #0
    2164:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
        if(link("bd", name) != 0){
    2168:	e3050c84 	movw	r0, #23684	; 0x5c84
    216c:	e3400000 	movt	r0, #0
    2170:	e24b3018 	sub	r3, fp, #24
    2174:	e1a01003 	mov	r1, r3
    2178:	eb000a1a 	bl	49e8 <link>
    217c:	e1a03000 	mov	r3, r0
    2180:	e3530000 	cmp	r3, #0
    2184:	0a000004 	beq	219c <bigdir+0x100>
            printf(1, "bigdir link failed\n");
    2188:	e3a00001 	mov	r0, #1
    218c:	e3051ca0 	movw	r1, #23712	; 0x5ca0
    2190:	e3401000 	movt	r1, #0
    2194:	eb000abf 	bl	4c98 <printf>
            exit();
    2198:	eb0009a6 	bl	4838 <exit>
        printf(1, "bigdir create failed\n");
        exit();
    }
    close(fd);

    for(i = 0; i < 500; i++){
    219c:	e51b3008 	ldr	r3, [fp, #-8]
    21a0:	e2833001 	add	r3, r3, #1
    21a4:	e50b3008 	str	r3, [fp, #-8]
    21a8:	e51b2008 	ldr	r2, [fp, #-8]
    21ac:	e30031f3 	movw	r3, #499	; 0x1f3
    21b0:	e1520003 	cmp	r2, r3
    21b4:	daffffd4 	ble	210c <bigdir+0x70>
            printf(1, "bigdir link failed\n");
            exit();
        }
    }

    unlink("bd");
    21b8:	e3050c84 	movw	r0, #23684	; 0x5c84
    21bc:	e3400000 	movt	r0, #0
    21c0:	eb0009f6 	bl	49a0 <unlink>
    for(i = 0; i < 500; i++){
    21c4:	e3a03000 	mov	r3, #0
    21c8:	e50b3008 	str	r3, [fp, #-8]
    21cc:	ea000024 	b	2264 <bigdir+0x1c8>
        name[0] = 'x';
    21d0:	e3a03078 	mov	r3, #120	; 0x78
    21d4:	e54b3018 	strb	r3, [fp, #-24]	; 0xffffffe8
        name[1] = '0' + (i / 64);
    21d8:	e51b3008 	ldr	r3, [fp, #-8]
    21dc:	e283203f 	add	r2, r3, #63	; 0x3f
    21e0:	e3530000 	cmp	r3, #0
    21e4:	b1a03002 	movlt	r3, r2
    21e8:	e1a03343 	asr	r3, r3, #6
    21ec:	e6ef3073 	uxtb	r3, r3
    21f0:	e2833030 	add	r3, r3, #48	; 0x30
    21f4:	e6ef3073 	uxtb	r3, r3
    21f8:	e54b3017 	strb	r3, [fp, #-23]	; 0xffffffe9
        name[2] = '0' + (i % 64);
    21fc:	e51b2008 	ldr	r2, [fp, #-8]
    2200:	e1a03fc2 	asr	r3, r2, #31
    2204:	e1a03d23 	lsr	r3, r3, #26
    2208:	e0822003 	add	r2, r2, r3
    220c:	e202203f 	and	r2, r2, #63	; 0x3f
    2210:	e0633002 	rsb	r3, r3, r2
    2214:	e6ef3073 	uxtb	r3, r3
    2218:	e2833030 	add	r3, r3, #48	; 0x30
    221c:	e6ef3073 	uxtb	r3, r3
    2220:	e54b3016 	strb	r3, [fp, #-22]	; 0xffffffea
        name[3] = '\0';
    2224:	e3a03000 	mov	r3, #0
    2228:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
        if(unlink(name) != 0){
    222c:	e24b3018 	sub	r3, fp, #24
    2230:	e1a00003 	mov	r0, r3
    2234:	eb0009d9 	bl	49a0 <unlink>
    2238:	e1a03000 	mov	r3, r0
    223c:	e3530000 	cmp	r3, #0
    2240:	0a000004 	beq	2258 <bigdir+0x1bc>
            printf(1, "bigdir unlink failed");
    2244:	e3a00001 	mov	r0, #1
    2248:	e3051cb4 	movw	r1, #23732	; 0x5cb4
    224c:	e3401000 	movt	r1, #0
    2250:	eb000a90 	bl	4c98 <printf>
            exit();
    2254:	eb000977 	bl	4838 <exit>
            exit();
        }
    }

    unlink("bd");
    for(i = 0; i < 500; i++){
    2258:	e51b3008 	ldr	r3, [fp, #-8]
    225c:	e2833001 	add	r3, r3, #1
    2260:	e50b3008 	str	r3, [fp, #-8]
    2264:	e51b2008 	ldr	r2, [fp, #-8]
    2268:	e30031f3 	movw	r3, #499	; 0x1f3
    226c:	e1520003 	cmp	r2, r3
    2270:	daffffd6 	ble	21d0 <bigdir+0x134>
            printf(1, "bigdir unlink failed");
            exit();
        }
    }

    printf(1, "bigdir ok\n");
    2274:	e3a00001 	mov	r0, #1
    2278:	e3051ccc 	movw	r1, #23756	; 0x5ccc
    227c:	e3401000 	movt	r1, #0
    2280:	eb000a84 	bl	4c98 <printf>
}
    2284:	e24bd004 	sub	sp, fp, #4
    2288:	e8bd8800 	pop	{fp, pc}

0000228c <subdir>:

void
subdir(void)
{
    228c:	e92d4800 	push	{fp, lr}
    2290:	e28db004 	add	fp, sp, #4
    2294:	e24dd008 	sub	sp, sp, #8
    int fd, cc;

    printf(1, "subdir test\n");
    2298:	e3a00001 	mov	r0, #1
    229c:	e3051cd8 	movw	r1, #23768	; 0x5cd8
    22a0:	e3401000 	movt	r1, #0
    22a4:	eb000a7b 	bl	4c98 <printf>

    unlink("ff");
    22a8:	e3050ce8 	movw	r0, #23784	; 0x5ce8
    22ac:	e3400000 	movt	r0, #0
    22b0:	eb0009ba 	bl	49a0 <unlink>
    if(mkdir("dd") != 0){
    22b4:	e3050cec 	movw	r0, #23788	; 0x5cec
    22b8:	e3400000 	movt	r0, #0
    22bc:	eb0009d2 	bl	4a0c <mkdir>
    22c0:	e1a03000 	mov	r3, r0
    22c4:	e3530000 	cmp	r3, #0
    22c8:	0a000004 	beq	22e0 <subdir+0x54>
        printf(1, "subdir mkdir dd failed\n");
    22cc:	e3a00001 	mov	r0, #1
    22d0:	e3051cf0 	movw	r1, #23792	; 0x5cf0
    22d4:	e3401000 	movt	r1, #0
    22d8:	eb000a6e 	bl	4c98 <printf>
        exit();
    22dc:	eb000955 	bl	4838 <exit>
    }

    fd = open("dd/ff", O_CREATE | O_RDWR);
    22e0:	e3050d08 	movw	r0, #23816	; 0x5d08
    22e4:	e3400000 	movt	r0, #0
    22e8:	e3001202 	movw	r1, #514	; 0x202
    22ec:	eb000999 	bl	4958 <open>
    22f0:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    22f4:	e51b3008 	ldr	r3, [fp, #-8]
    22f8:	e3530000 	cmp	r3, #0
    22fc:	aa000004 	bge	2314 <subdir+0x88>
        printf(1, "create dd/ff failed\n");
    2300:	e3a00001 	mov	r0, #1
    2304:	e3051d10 	movw	r1, #23824	; 0x5d10
    2308:	e3401000 	movt	r1, #0
    230c:	eb000a61 	bl	4c98 <printf>
        exit();
    2310:	eb000948 	bl	4838 <exit>
    }
    write(fd, "ff", 2);
    2314:	e51b0008 	ldr	r0, [fp, #-8]
    2318:	e3051ce8 	movw	r1, #23784	; 0x5ce8
    231c:	e3401000 	movt	r1, #0
    2320:	e3a02002 	mov	r2, #2
    2324:	eb000967 	bl	48c8 <write>
    close(fd);
    2328:	e51b0008 	ldr	r0, [fp, #-8]
    232c:	eb00096e 	bl	48ec <close>

    if(unlink("dd") >= 0){
    2330:	e3050cec 	movw	r0, #23788	; 0x5cec
    2334:	e3400000 	movt	r0, #0
    2338:	eb000998 	bl	49a0 <unlink>
    233c:	e1a03000 	mov	r3, r0
    2340:	e3530000 	cmp	r3, #0
    2344:	ba000004 	blt	235c <subdir+0xd0>
        printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2348:	e3a00001 	mov	r0, #1
    234c:	e3051d28 	movw	r1, #23848	; 0x5d28
    2350:	e3401000 	movt	r1, #0
    2354:	eb000a4f 	bl	4c98 <printf>
        exit();
    2358:	eb000936 	bl	4838 <exit>
    }

    if(mkdir("/dd/dd") != 0){
    235c:	e3050d50 	movw	r0, #23888	; 0x5d50
    2360:	e3400000 	movt	r0, #0
    2364:	eb0009a8 	bl	4a0c <mkdir>
    2368:	e1a03000 	mov	r3, r0
    236c:	e3530000 	cmp	r3, #0
    2370:	0a000004 	beq	2388 <subdir+0xfc>
        printf(1, "subdir mkdir dd/dd failed\n");
    2374:	e3a00001 	mov	r0, #1
    2378:	e3051d58 	movw	r1, #23896	; 0x5d58
    237c:	e3401000 	movt	r1, #0
    2380:	eb000a44 	bl	4c98 <printf>
        exit();
    2384:	eb00092b 	bl	4838 <exit>
    }

    fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2388:	e3050d74 	movw	r0, #23924	; 0x5d74
    238c:	e3400000 	movt	r0, #0
    2390:	e3001202 	movw	r1, #514	; 0x202
    2394:	eb00096f 	bl	4958 <open>
    2398:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    239c:	e51b3008 	ldr	r3, [fp, #-8]
    23a0:	e3530000 	cmp	r3, #0
    23a4:	aa000004 	bge	23bc <subdir+0x130>
        printf(1, "create dd/dd/ff failed\n");
    23a8:	e3a00001 	mov	r0, #1
    23ac:	e3051d80 	movw	r1, #23936	; 0x5d80
    23b0:	e3401000 	movt	r1, #0
    23b4:	eb000a37 	bl	4c98 <printf>
        exit();
    23b8:	eb00091e 	bl	4838 <exit>
    }
    write(fd, "FF", 2);
    23bc:	e51b0008 	ldr	r0, [fp, #-8]
    23c0:	e3051d98 	movw	r1, #23960	; 0x5d98
    23c4:	e3401000 	movt	r1, #0
    23c8:	e3a02002 	mov	r2, #2
    23cc:	eb00093d 	bl	48c8 <write>
    close(fd);
    23d0:	e51b0008 	ldr	r0, [fp, #-8]
    23d4:	eb000944 	bl	48ec <close>

    fd = open("dd/dd/../ff", 0);
    23d8:	e3050d9c 	movw	r0, #23964	; 0x5d9c
    23dc:	e3400000 	movt	r0, #0
    23e0:	e3a01000 	mov	r1, #0
    23e4:	eb00095b 	bl	4958 <open>
    23e8:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    23ec:	e51b3008 	ldr	r3, [fp, #-8]
    23f0:	e3530000 	cmp	r3, #0
    23f4:	aa000004 	bge	240c <subdir+0x180>
        printf(1, "open dd/dd/../ff failed\n");
    23f8:	e3a00001 	mov	r0, #1
    23fc:	e3051da8 	movw	r1, #23976	; 0x5da8
    2400:	e3401000 	movt	r1, #0
    2404:	eb000a23 	bl	4c98 <printf>
        exit();
    2408:	eb00090a 	bl	4838 <exit>
    }
    cc = read(fd, buf, sizeof(buf));
    240c:	e51b0008 	ldr	r0, [fp, #-8]
    2410:	e3091374 	movw	r1, #37748	; 0x9374
    2414:	e3401000 	movt	r1, #0
    2418:	e3a02a02 	mov	r2, #8192	; 0x2000
    241c:	eb000920 	bl	48a4 <read>
    2420:	e50b000c 	str	r0, [fp, #-12]
    if(cc != 2 || buf[0] != 'f'){
    2424:	e51b300c 	ldr	r3, [fp, #-12]
    2428:	e3530002 	cmp	r3, #2
    242c:	1a000004 	bne	2444 <subdir+0x1b8>
    2430:	e3093374 	movw	r3, #37748	; 0x9374
    2434:	e3403000 	movt	r3, #0
    2438:	e5d33000 	ldrb	r3, [r3]
    243c:	e3530066 	cmp	r3, #102	; 0x66
    2440:	0a000004 	beq	2458 <subdir+0x1cc>
        printf(1, "dd/dd/../ff wrong content\n");
    2444:	e3a00001 	mov	r0, #1
    2448:	e3051dc4 	movw	r1, #24004	; 0x5dc4
    244c:	e3401000 	movt	r1, #0
    2450:	eb000a10 	bl	4c98 <printf>
        exit();
    2454:	eb0008f7 	bl	4838 <exit>
    }
    close(fd);
    2458:	e51b0008 	ldr	r0, [fp, #-8]
    245c:	eb000922 	bl	48ec <close>

    if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2460:	e3050d74 	movw	r0, #23924	; 0x5d74
    2464:	e3400000 	movt	r0, #0
    2468:	e3051de0 	movw	r1, #24032	; 0x5de0
    246c:	e3401000 	movt	r1, #0
    2470:	eb00095c 	bl	49e8 <link>
    2474:	e1a03000 	mov	r3, r0
    2478:	e3530000 	cmp	r3, #0
    247c:	0a000004 	beq	2494 <subdir+0x208>
        printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2480:	e3a00001 	mov	r0, #1
    2484:	e3051dec 	movw	r1, #24044	; 0x5dec
    2488:	e3401000 	movt	r1, #0
    248c:	eb000a01 	bl	4c98 <printf>
        exit();
    2490:	eb0008e8 	bl	4838 <exit>
    }

    if(unlink("dd/dd/ff") != 0){
    2494:	e3050d74 	movw	r0, #23924	; 0x5d74
    2498:	e3400000 	movt	r0, #0
    249c:	eb00093f 	bl	49a0 <unlink>
    24a0:	e1a03000 	mov	r3, r0
    24a4:	e3530000 	cmp	r3, #0
    24a8:	0a000004 	beq	24c0 <subdir+0x234>
        printf(1, "unlink dd/dd/ff failed\n");
    24ac:	e3a00001 	mov	r0, #1
    24b0:	e3051e10 	movw	r1, #24080	; 0x5e10
    24b4:	e3401000 	movt	r1, #0
    24b8:	eb0009f6 	bl	4c98 <printf>
        exit();
    24bc:	eb0008dd 	bl	4838 <exit>
    }
    if(open("dd/dd/ff", O_RDONLY) >= 0){
    24c0:	e3050d74 	movw	r0, #23924	; 0x5d74
    24c4:	e3400000 	movt	r0, #0
    24c8:	e3a01000 	mov	r1, #0
    24cc:	eb000921 	bl	4958 <open>
    24d0:	e1a03000 	mov	r3, r0
    24d4:	e3530000 	cmp	r3, #0
    24d8:	ba000004 	blt	24f0 <subdir+0x264>
        printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    24dc:	e3a00001 	mov	r0, #1
    24e0:	e3051e28 	movw	r1, #24104	; 0x5e28
    24e4:	e3401000 	movt	r1, #0
    24e8:	eb0009ea 	bl	4c98 <printf>
        exit();
    24ec:	eb0008d1 	bl	4838 <exit>
    }

    if(chdir("dd") != 0){
    24f0:	e3050cec 	movw	r0, #23788	; 0x5cec
    24f4:	e3400000 	movt	r0, #0
    24f8:	eb00094c 	bl	4a30 <chdir>
    24fc:	e1a03000 	mov	r3, r0
    2500:	e3530000 	cmp	r3, #0
    2504:	0a000004 	beq	251c <subdir+0x290>
        printf(1, "chdir dd failed\n");
    2508:	e3a00001 	mov	r0, #1
    250c:	e3051e4c 	movw	r1, #24140	; 0x5e4c
    2510:	e3401000 	movt	r1, #0
    2514:	eb0009df 	bl	4c98 <printf>
        exit();
    2518:	eb0008c6 	bl	4838 <exit>
    }
    if(chdir("dd/../../dd") != 0){
    251c:	e3050e60 	movw	r0, #24160	; 0x5e60
    2520:	e3400000 	movt	r0, #0
    2524:	eb000941 	bl	4a30 <chdir>
    2528:	e1a03000 	mov	r3, r0
    252c:	e3530000 	cmp	r3, #0
    2530:	0a000004 	beq	2548 <subdir+0x2bc>
        printf(1, "chdir dd/../../dd failed\n");
    2534:	e3a00001 	mov	r0, #1
    2538:	e3051e6c 	movw	r1, #24172	; 0x5e6c
    253c:	e3401000 	movt	r1, #0
    2540:	eb0009d4 	bl	4c98 <printf>
        exit();
    2544:	eb0008bb 	bl	4838 <exit>
    }
    if(chdir("dd/../../../dd") != 0){
    2548:	e3050e88 	movw	r0, #24200	; 0x5e88
    254c:	e3400000 	movt	r0, #0
    2550:	eb000936 	bl	4a30 <chdir>
    2554:	e1a03000 	mov	r3, r0
    2558:	e3530000 	cmp	r3, #0
    255c:	0a000004 	beq	2574 <subdir+0x2e8>
        printf(1, "chdir dd/../../dd failed\n");
    2560:	e3a00001 	mov	r0, #1
    2564:	e3051e6c 	movw	r1, #24172	; 0x5e6c
    2568:	e3401000 	movt	r1, #0
    256c:	eb0009c9 	bl	4c98 <printf>
        exit();
    2570:	eb0008b0 	bl	4838 <exit>
    }
    if(chdir("./..") != 0){
    2574:	e3050e98 	movw	r0, #24216	; 0x5e98
    2578:	e3400000 	movt	r0, #0
    257c:	eb00092b 	bl	4a30 <chdir>
    2580:	e1a03000 	mov	r3, r0
    2584:	e3530000 	cmp	r3, #0
    2588:	0a000004 	beq	25a0 <subdir+0x314>
        printf(1, "chdir ./.. failed\n");
    258c:	e3a00001 	mov	r0, #1
    2590:	e3051ea0 	movw	r1, #24224	; 0x5ea0
    2594:	e3401000 	movt	r1, #0
    2598:	eb0009be 	bl	4c98 <printf>
        exit();
    259c:	eb0008a5 	bl	4838 <exit>
    }

    fd = open("dd/dd/ffff", 0);
    25a0:	e3050de0 	movw	r0, #24032	; 0x5de0
    25a4:	e3400000 	movt	r0, #0
    25a8:	e3a01000 	mov	r1, #0
    25ac:	eb0008e9 	bl	4958 <open>
    25b0:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    25b4:	e51b3008 	ldr	r3, [fp, #-8]
    25b8:	e3530000 	cmp	r3, #0
    25bc:	aa000004 	bge	25d4 <subdir+0x348>
        printf(1, "open dd/dd/ffff failed\n");
    25c0:	e3a00001 	mov	r0, #1
    25c4:	e3051eb4 	movw	r1, #24244	; 0x5eb4
    25c8:	e3401000 	movt	r1, #0
    25cc:	eb0009b1 	bl	4c98 <printf>
        exit();
    25d0:	eb000898 	bl	4838 <exit>
    }
    if(read(fd, buf, sizeof(buf)) != 2){
    25d4:	e51b0008 	ldr	r0, [fp, #-8]
    25d8:	e3091374 	movw	r1, #37748	; 0x9374
    25dc:	e3401000 	movt	r1, #0
    25e0:	e3a02a02 	mov	r2, #8192	; 0x2000
    25e4:	eb0008ae 	bl	48a4 <read>
    25e8:	e1a03000 	mov	r3, r0
    25ec:	e3530002 	cmp	r3, #2
    25f0:	0a000004 	beq	2608 <subdir+0x37c>
        printf(1, "read dd/dd/ffff wrong len\n");
    25f4:	e3a00001 	mov	r0, #1
    25f8:	e3051ecc 	movw	r1, #24268	; 0x5ecc
    25fc:	e3401000 	movt	r1, #0
    2600:	eb0009a4 	bl	4c98 <printf>
        exit();
    2604:	eb00088b 	bl	4838 <exit>
    }
    close(fd);
    2608:	e51b0008 	ldr	r0, [fp, #-8]
    260c:	eb0008b6 	bl	48ec <close>

    if(open("dd/dd/ff", O_RDONLY) >= 0){
    2610:	e3050d74 	movw	r0, #23924	; 0x5d74
    2614:	e3400000 	movt	r0, #0
    2618:	e3a01000 	mov	r1, #0
    261c:	eb0008cd 	bl	4958 <open>
    2620:	e1a03000 	mov	r3, r0
    2624:	e3530000 	cmp	r3, #0
    2628:	ba000004 	blt	2640 <subdir+0x3b4>
        printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    262c:	e3a00001 	mov	r0, #1
    2630:	e3051ee8 	movw	r1, #24296	; 0x5ee8
    2634:	e3401000 	movt	r1, #0
    2638:	eb000996 	bl	4c98 <printf>
        exit();
    263c:	eb00087d 	bl	4838 <exit>
    }

    if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2640:	e3050f10 	movw	r0, #24336	; 0x5f10
    2644:	e3400000 	movt	r0, #0
    2648:	e3001202 	movw	r1, #514	; 0x202
    264c:	eb0008c1 	bl	4958 <open>
    2650:	e1a03000 	mov	r3, r0
    2654:	e3530000 	cmp	r3, #0
    2658:	ba000004 	blt	2670 <subdir+0x3e4>
        printf(1, "create dd/ff/ff succeeded!\n");
    265c:	e3a00001 	mov	r0, #1
    2660:	e3051f1c 	movw	r1, #24348	; 0x5f1c
    2664:	e3401000 	movt	r1, #0
    2668:	eb00098a 	bl	4c98 <printf>
        exit();
    266c:	eb000871 	bl	4838 <exit>
    }
    if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2670:	e3050f38 	movw	r0, #24376	; 0x5f38
    2674:	e3400000 	movt	r0, #0
    2678:	e3001202 	movw	r1, #514	; 0x202
    267c:	eb0008b5 	bl	4958 <open>
    2680:	e1a03000 	mov	r3, r0
    2684:	e3530000 	cmp	r3, #0
    2688:	ba000004 	blt	26a0 <subdir+0x414>
        printf(1, "create dd/xx/ff succeeded!\n");
    268c:	e3a00001 	mov	r0, #1
    2690:	e3051f44 	movw	r1, #24388	; 0x5f44
    2694:	e3401000 	movt	r1, #0
    2698:	eb00097e 	bl	4c98 <printf>
        exit();
    269c:	eb000865 	bl	4838 <exit>
    }
    if(open("dd", O_CREATE) >= 0){
    26a0:	e3050cec 	movw	r0, #23788	; 0x5cec
    26a4:	e3400000 	movt	r0, #0
    26a8:	e3a01c02 	mov	r1, #512	; 0x200
    26ac:	eb0008a9 	bl	4958 <open>
    26b0:	e1a03000 	mov	r3, r0
    26b4:	e3530000 	cmp	r3, #0
    26b8:	ba000004 	blt	26d0 <subdir+0x444>
        printf(1, "create dd succeeded!\n");
    26bc:	e3a00001 	mov	r0, #1
    26c0:	e3051f60 	movw	r1, #24416	; 0x5f60
    26c4:	e3401000 	movt	r1, #0
    26c8:	eb000972 	bl	4c98 <printf>
        exit();
    26cc:	eb000859 	bl	4838 <exit>
    }
    if(open("dd", O_RDWR) >= 0){
    26d0:	e3050cec 	movw	r0, #23788	; 0x5cec
    26d4:	e3400000 	movt	r0, #0
    26d8:	e3a01002 	mov	r1, #2
    26dc:	eb00089d 	bl	4958 <open>
    26e0:	e1a03000 	mov	r3, r0
    26e4:	e3530000 	cmp	r3, #0
    26e8:	ba000004 	blt	2700 <subdir+0x474>
        printf(1, "open dd rdwr succeeded!\n");
    26ec:	e3a00001 	mov	r0, #1
    26f0:	e3051f78 	movw	r1, #24440	; 0x5f78
    26f4:	e3401000 	movt	r1, #0
    26f8:	eb000966 	bl	4c98 <printf>
        exit();
    26fc:	eb00084d 	bl	4838 <exit>
    }
    if(open("dd", O_WRONLY) >= 0){
    2700:	e3050cec 	movw	r0, #23788	; 0x5cec
    2704:	e3400000 	movt	r0, #0
    2708:	e3a01001 	mov	r1, #1
    270c:	eb000891 	bl	4958 <open>
    2710:	e1a03000 	mov	r3, r0
    2714:	e3530000 	cmp	r3, #0
    2718:	ba000004 	blt	2730 <subdir+0x4a4>
        printf(1, "open dd wronly succeeded!\n");
    271c:	e3a00001 	mov	r0, #1
    2720:	e3051f94 	movw	r1, #24468	; 0x5f94
    2724:	e3401000 	movt	r1, #0
    2728:	eb00095a 	bl	4c98 <printf>
        exit();
    272c:	eb000841 	bl	4838 <exit>
    }
    if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2730:	e3050f10 	movw	r0, #24336	; 0x5f10
    2734:	e3400000 	movt	r0, #0
    2738:	e3051fb0 	movw	r1, #24496	; 0x5fb0
    273c:	e3401000 	movt	r1, #0
    2740:	eb0008a8 	bl	49e8 <link>
    2744:	e1a03000 	mov	r3, r0
    2748:	e3530000 	cmp	r3, #0
    274c:	1a000004 	bne	2764 <subdir+0x4d8>
        printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2750:	e3a00001 	mov	r0, #1
    2754:	e3051fbc 	movw	r1, #24508	; 0x5fbc
    2758:	e3401000 	movt	r1, #0
    275c:	eb00094d 	bl	4c98 <printf>
        exit();
    2760:	eb000834 	bl	4838 <exit>
    }
    if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2764:	e3050f38 	movw	r0, #24376	; 0x5f38
    2768:	e3400000 	movt	r0, #0
    276c:	e3051fb0 	movw	r1, #24496	; 0x5fb0
    2770:	e3401000 	movt	r1, #0
    2774:	eb00089b 	bl	49e8 <link>
    2778:	e1a03000 	mov	r3, r0
    277c:	e3530000 	cmp	r3, #0
    2780:	1a000004 	bne	2798 <subdir+0x50c>
        printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2784:	e3a00001 	mov	r0, #1
    2788:	e3051fe0 	movw	r1, #24544	; 0x5fe0
    278c:	e3401000 	movt	r1, #0
    2790:	eb000940 	bl	4c98 <printf>
        exit();
    2794:	eb000827 	bl	4838 <exit>
    }
    if(link("dd/ff", "dd/dd/ffff") == 0){
    2798:	e3050d08 	movw	r0, #23816	; 0x5d08
    279c:	e3400000 	movt	r0, #0
    27a0:	e3051de0 	movw	r1, #24032	; 0x5de0
    27a4:	e3401000 	movt	r1, #0
    27a8:	eb00088e 	bl	49e8 <link>
    27ac:	e1a03000 	mov	r3, r0
    27b0:	e3530000 	cmp	r3, #0
    27b4:	1a000004 	bne	27cc <subdir+0x540>
        printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    27b8:	e3a00001 	mov	r0, #1
    27bc:	e3061004 	movw	r1, #24580	; 0x6004
    27c0:	e3401000 	movt	r1, #0
    27c4:	eb000933 	bl	4c98 <printf>
        exit();
    27c8:	eb00081a 	bl	4838 <exit>
    }
    if(mkdir("dd/ff/ff") == 0){
    27cc:	e3050f10 	movw	r0, #24336	; 0x5f10
    27d0:	e3400000 	movt	r0, #0
    27d4:	eb00088c 	bl	4a0c <mkdir>
    27d8:	e1a03000 	mov	r3, r0
    27dc:	e3530000 	cmp	r3, #0
    27e0:	1a000004 	bne	27f8 <subdir+0x56c>
        printf(1, "mkdir dd/ff/ff succeeded!\n");
    27e4:	e3a00001 	mov	r0, #1
    27e8:	e3061028 	movw	r1, #24616	; 0x6028
    27ec:	e3401000 	movt	r1, #0
    27f0:	eb000928 	bl	4c98 <printf>
        exit();
    27f4:	eb00080f 	bl	4838 <exit>
    }
    if(mkdir("dd/xx/ff") == 0){
    27f8:	e3050f38 	movw	r0, #24376	; 0x5f38
    27fc:	e3400000 	movt	r0, #0
    2800:	eb000881 	bl	4a0c <mkdir>
    2804:	e1a03000 	mov	r3, r0
    2808:	e3530000 	cmp	r3, #0
    280c:	1a000004 	bne	2824 <subdir+0x598>
        printf(1, "mkdir dd/xx/ff succeeded!\n");
    2810:	e3a00001 	mov	r0, #1
    2814:	e3061044 	movw	r1, #24644	; 0x6044
    2818:	e3401000 	movt	r1, #0
    281c:	eb00091d 	bl	4c98 <printf>
        exit();
    2820:	eb000804 	bl	4838 <exit>
    }
    if(mkdir("dd/dd/ffff") == 0){
    2824:	e3050de0 	movw	r0, #24032	; 0x5de0
    2828:	e3400000 	movt	r0, #0
    282c:	eb000876 	bl	4a0c <mkdir>
    2830:	e1a03000 	mov	r3, r0
    2834:	e3530000 	cmp	r3, #0
    2838:	1a000004 	bne	2850 <subdir+0x5c4>
        printf(1, "mkdir dd/dd/ffff succeeded!\n");
    283c:	e3a00001 	mov	r0, #1
    2840:	e3061060 	movw	r1, #24672	; 0x6060
    2844:	e3401000 	movt	r1, #0
    2848:	eb000912 	bl	4c98 <printf>
        exit();
    284c:	eb0007f9 	bl	4838 <exit>
    }
    if(unlink("dd/xx/ff") == 0){
    2850:	e3050f38 	movw	r0, #24376	; 0x5f38
    2854:	e3400000 	movt	r0, #0
    2858:	eb000850 	bl	49a0 <unlink>
    285c:	e1a03000 	mov	r3, r0
    2860:	e3530000 	cmp	r3, #0
    2864:	1a000004 	bne	287c <subdir+0x5f0>
        printf(1, "unlink dd/xx/ff succeeded!\n");
    2868:	e3a00001 	mov	r0, #1
    286c:	e3061080 	movw	r1, #24704	; 0x6080
    2870:	e3401000 	movt	r1, #0
    2874:	eb000907 	bl	4c98 <printf>
        exit();
    2878:	eb0007ee 	bl	4838 <exit>
    }
    if(unlink("dd/ff/ff") == 0){
    287c:	e3050f10 	movw	r0, #24336	; 0x5f10
    2880:	e3400000 	movt	r0, #0
    2884:	eb000845 	bl	49a0 <unlink>
    2888:	e1a03000 	mov	r3, r0
    288c:	e3530000 	cmp	r3, #0
    2890:	1a000004 	bne	28a8 <subdir+0x61c>
        printf(1, "unlink dd/ff/ff succeeded!\n");
    2894:	e3a00001 	mov	r0, #1
    2898:	e306109c 	movw	r1, #24732	; 0x609c
    289c:	e3401000 	movt	r1, #0
    28a0:	eb0008fc 	bl	4c98 <printf>
        exit();
    28a4:	eb0007e3 	bl	4838 <exit>
    }
    if(chdir("dd/ff") == 0){
    28a8:	e3050d08 	movw	r0, #23816	; 0x5d08
    28ac:	e3400000 	movt	r0, #0
    28b0:	eb00085e 	bl	4a30 <chdir>
    28b4:	e1a03000 	mov	r3, r0
    28b8:	e3530000 	cmp	r3, #0
    28bc:	1a000004 	bne	28d4 <subdir+0x648>
        printf(1, "chdir dd/ff succeeded!\n");
    28c0:	e3a00001 	mov	r0, #1
    28c4:	e30610b8 	movw	r1, #24760	; 0x60b8
    28c8:	e3401000 	movt	r1, #0
    28cc:	eb0008f1 	bl	4c98 <printf>
        exit();
    28d0:	eb0007d8 	bl	4838 <exit>
    }
    if(chdir("dd/xx") == 0){
    28d4:	e30600d0 	movw	r0, #24784	; 0x60d0
    28d8:	e3400000 	movt	r0, #0
    28dc:	eb000853 	bl	4a30 <chdir>
    28e0:	e1a03000 	mov	r3, r0
    28e4:	e3530000 	cmp	r3, #0
    28e8:	1a000004 	bne	2900 <subdir+0x674>
        printf(1, "chdir dd/xx succeeded!\n");
    28ec:	e3a00001 	mov	r0, #1
    28f0:	e30610d8 	movw	r1, #24792	; 0x60d8
    28f4:	e3401000 	movt	r1, #0
    28f8:	eb0008e6 	bl	4c98 <printf>
        exit();
    28fc:	eb0007cd 	bl	4838 <exit>
    }

    if(unlink("dd/dd/ffff") != 0){
    2900:	e3050de0 	movw	r0, #24032	; 0x5de0
    2904:	e3400000 	movt	r0, #0
    2908:	eb000824 	bl	49a0 <unlink>
    290c:	e1a03000 	mov	r3, r0
    2910:	e3530000 	cmp	r3, #0
    2914:	0a000004 	beq	292c <subdir+0x6a0>
        printf(1, "unlink dd/dd/ff failed\n");
    2918:	e3a00001 	mov	r0, #1
    291c:	e3051e10 	movw	r1, #24080	; 0x5e10
    2920:	e3401000 	movt	r1, #0
    2924:	eb0008db 	bl	4c98 <printf>
        exit();
    2928:	eb0007c2 	bl	4838 <exit>
    }
    if(unlink("dd/ff") != 0){
    292c:	e3050d08 	movw	r0, #23816	; 0x5d08
    2930:	e3400000 	movt	r0, #0
    2934:	eb000819 	bl	49a0 <unlink>
    2938:	e1a03000 	mov	r3, r0
    293c:	e3530000 	cmp	r3, #0
    2940:	0a000004 	beq	2958 <subdir+0x6cc>
        printf(1, "unlink dd/ff failed\n");
    2944:	e3a00001 	mov	r0, #1
    2948:	e30610f0 	movw	r1, #24816	; 0x60f0
    294c:	e3401000 	movt	r1, #0
    2950:	eb0008d0 	bl	4c98 <printf>
        exit();
    2954:	eb0007b7 	bl	4838 <exit>
    }
    if(unlink("dd") == 0){
    2958:	e3050cec 	movw	r0, #23788	; 0x5cec
    295c:	e3400000 	movt	r0, #0
    2960:	eb00080e 	bl	49a0 <unlink>
    2964:	e1a03000 	mov	r3, r0
    2968:	e3530000 	cmp	r3, #0
    296c:	1a000004 	bne	2984 <subdir+0x6f8>
        printf(1, "unlink non-empty dd succeeded!\n");
    2970:	e3a00001 	mov	r0, #1
    2974:	e3061108 	movw	r1, #24840	; 0x6108
    2978:	e3401000 	movt	r1, #0
    297c:	eb0008c5 	bl	4c98 <printf>
        exit();
    2980:	eb0007ac 	bl	4838 <exit>
    }
    if(unlink("dd/dd") < 0){
    2984:	e3060128 	movw	r0, #24872	; 0x6128
    2988:	e3400000 	movt	r0, #0
    298c:	eb000803 	bl	49a0 <unlink>
    2990:	e1a03000 	mov	r3, r0
    2994:	e3530000 	cmp	r3, #0
    2998:	aa000004 	bge	29b0 <subdir+0x724>
        printf(1, "unlink dd/dd failed\n");
    299c:	e3a00001 	mov	r0, #1
    29a0:	e3061130 	movw	r1, #24880	; 0x6130
    29a4:	e3401000 	movt	r1, #0
    29a8:	eb0008ba 	bl	4c98 <printf>
        exit();
    29ac:	eb0007a1 	bl	4838 <exit>
    }
    if(unlink("dd") < 0){
    29b0:	e3050cec 	movw	r0, #23788	; 0x5cec
    29b4:	e3400000 	movt	r0, #0
    29b8:	eb0007f8 	bl	49a0 <unlink>
    29bc:	e1a03000 	mov	r3, r0
    29c0:	e3530000 	cmp	r3, #0
    29c4:	aa000004 	bge	29dc <subdir+0x750>
        printf(1, "unlink dd failed\n");
    29c8:	e3a00001 	mov	r0, #1
    29cc:	e3061148 	movw	r1, #24904	; 0x6148
    29d0:	e3401000 	movt	r1, #0
    29d4:	eb0008af 	bl	4c98 <printf>
        exit();
    29d8:	eb000796 	bl	4838 <exit>
    }

    printf(1, "subdir ok\n");
    29dc:	e3a00001 	mov	r0, #1
    29e0:	e306115c 	movw	r1, #24924	; 0x615c
    29e4:	e3401000 	movt	r1, #0
    29e8:	eb0008aa 	bl	4c98 <printf>
}
    29ec:	e24bd004 	sub	sp, fp, #4
    29f0:	e8bd8800 	pop	{fp, pc}

000029f4 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    29f4:	e92d4800 	push	{fp, lr}
    29f8:	e28db004 	add	fp, sp, #4
    29fc:	e24dd010 	sub	sp, sp, #16
    int fd, sz;

    printf(1, "bigwrite test\n");
    2a00:	e3a00001 	mov	r0, #1
    2a04:	e3061168 	movw	r1, #24936	; 0x6168
    2a08:	e3401000 	movt	r1, #0
    2a0c:	eb0008a1 	bl	4c98 <printf>

    unlink("bigwrite");
    2a10:	e3060178 	movw	r0, #24952	; 0x6178
    2a14:	e3400000 	movt	r0, #0
    2a18:	eb0007e0 	bl	49a0 <unlink>
    for(sz = 499; sz < 12*512; sz += 471){
    2a1c:	e30031f3 	movw	r3, #499	; 0x1f3
    2a20:	e50b3008 	str	r3, [fp, #-8]
    2a24:	ea00002f 	b	2ae8 <bigwrite+0xf4>
        fd = open("bigwrite", O_CREATE | O_RDWR);
    2a28:	e3060178 	movw	r0, #24952	; 0x6178
    2a2c:	e3400000 	movt	r0, #0
    2a30:	e3001202 	movw	r1, #514	; 0x202
    2a34:	eb0007c7 	bl	4958 <open>
    2a38:	e50b0010 	str	r0, [fp, #-16]
        if(fd < 0){
    2a3c:	e51b3010 	ldr	r3, [fp, #-16]
    2a40:	e3530000 	cmp	r3, #0
    2a44:	aa000004 	bge	2a5c <bigwrite+0x68>
            printf(1, "cannot create bigwrite\n");
    2a48:	e3a00001 	mov	r0, #1
    2a4c:	e3061184 	movw	r1, #24964	; 0x6184
    2a50:	e3401000 	movt	r1, #0
    2a54:	eb00088f 	bl	4c98 <printf>
            exit();
    2a58:	eb000776 	bl	4838 <exit>
        }
        int i;
        for(i = 0; i < 2; i++){
    2a5c:	e3a03000 	mov	r3, #0
    2a60:	e50b300c 	str	r3, [fp, #-12]
    2a64:	ea000013 	b	2ab8 <bigwrite+0xc4>
            int cc = write(fd, buf, sz);
    2a68:	e51b0010 	ldr	r0, [fp, #-16]
    2a6c:	e3091374 	movw	r1, #37748	; 0x9374
    2a70:	e3401000 	movt	r1, #0
    2a74:	e51b2008 	ldr	r2, [fp, #-8]
    2a78:	eb000792 	bl	48c8 <write>
    2a7c:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
            if(cc != sz){
    2a80:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    2a84:	e51b3008 	ldr	r3, [fp, #-8]
    2a88:	e1520003 	cmp	r2, r3
    2a8c:	0a000006 	beq	2aac <bigwrite+0xb8>
                printf(1, "write(%d) ret %d\n", sz, cc);
    2a90:	e3a00001 	mov	r0, #1
    2a94:	e306119c 	movw	r1, #24988	; 0x619c
    2a98:	e3401000 	movt	r1, #0
    2a9c:	e51b2008 	ldr	r2, [fp, #-8]
    2aa0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    2aa4:	eb00087b 	bl	4c98 <printf>
                exit();
    2aa8:	eb000762 	bl	4838 <exit>
        if(fd < 0){
            printf(1, "cannot create bigwrite\n");
            exit();
        }
        int i;
        for(i = 0; i < 2; i++){
    2aac:	e51b300c 	ldr	r3, [fp, #-12]
    2ab0:	e2833001 	add	r3, r3, #1
    2ab4:	e50b300c 	str	r3, [fp, #-12]
    2ab8:	e51b300c 	ldr	r3, [fp, #-12]
    2abc:	e3530001 	cmp	r3, #1
    2ac0:	daffffe8 	ble	2a68 <bigwrite+0x74>
            if(cc != sz){
                printf(1, "write(%d) ret %d\n", sz, cc);
                exit();
            }
        }
        close(fd);
    2ac4:	e51b0010 	ldr	r0, [fp, #-16]
    2ac8:	eb000787 	bl	48ec <close>
        unlink("bigwrite");
    2acc:	e3060178 	movw	r0, #24952	; 0x6178
    2ad0:	e3400000 	movt	r0, #0
    2ad4:	eb0007b1 	bl	49a0 <unlink>
    int fd, sz;

    printf(1, "bigwrite test\n");

    unlink("bigwrite");
    for(sz = 499; sz < 12*512; sz += 471){
    2ad8:	e51b3008 	ldr	r3, [fp, #-8]
    2adc:	e2833f75 	add	r3, r3, #468	; 0x1d4
    2ae0:	e2833003 	add	r3, r3, #3
    2ae4:	e50b3008 	str	r3, [fp, #-8]
    2ae8:	e51b2008 	ldr	r2, [fp, #-8]
    2aec:	e30137ff 	movw	r3, #6143	; 0x17ff
    2af0:	e1520003 	cmp	r2, r3
    2af4:	daffffcb 	ble	2a28 <bigwrite+0x34>
        }
        close(fd);
        unlink("bigwrite");
    }

    printf(1, "bigwrite ok\n");
    2af8:	e3a00001 	mov	r0, #1
    2afc:	e30611b0 	movw	r1, #25008	; 0x61b0
    2b00:	e3401000 	movt	r1, #0
    2b04:	eb000863 	bl	4c98 <printf>
}
    2b08:	e24bd004 	sub	sp, fp, #4
    2b0c:	e8bd8800 	pop	{fp, pc}

00002b10 <bigfile>:

void
bigfile(void)
{
    2b10:	e92d4800 	push	{fp, lr}
    2b14:	e28db004 	add	fp, sp, #4
    2b18:	e24dd010 	sub	sp, sp, #16
    int fd, i, total, cc;

    printf(1, "bigfile test\n");
    2b1c:	e3a00001 	mov	r0, #1
    2b20:	e30611c0 	movw	r1, #25024	; 0x61c0
    2b24:	e3401000 	movt	r1, #0
    2b28:	eb00085a 	bl	4c98 <printf>

    unlink("bigfile");
    2b2c:	e30601d0 	movw	r0, #25040	; 0x61d0
    2b30:	e3400000 	movt	r0, #0
    2b34:	eb000799 	bl	49a0 <unlink>
    fd = open("bigfile", O_CREATE | O_RDWR);
    2b38:	e30601d0 	movw	r0, #25040	; 0x61d0
    2b3c:	e3400000 	movt	r0, #0
    2b40:	e3001202 	movw	r1, #514	; 0x202
    2b44:	eb000783 	bl	4958 <open>
    2b48:	e50b0010 	str	r0, [fp, #-16]
    if(fd < 0){
    2b4c:	e51b3010 	ldr	r3, [fp, #-16]
    2b50:	e3530000 	cmp	r3, #0
    2b54:	aa000004 	bge	2b6c <bigfile+0x5c>
        printf(1, "cannot create bigfile");
    2b58:	e3a00001 	mov	r0, #1
    2b5c:	e30611d8 	movw	r1, #25048	; 0x61d8
    2b60:	e3401000 	movt	r1, #0
    2b64:	eb00084b 	bl	4c98 <printf>
        exit();
    2b68:	eb000732 	bl	4838 <exit>
    }
    for(i = 0; i < 20; i++){
    2b6c:	e3a03000 	mov	r3, #0
    2b70:	e50b3008 	str	r3, [fp, #-8]
    2b74:	ea000014 	b	2bcc <bigfile+0xbc>
        memset(buf, i, 600);
    2b78:	e3090374 	movw	r0, #37748	; 0x9374
    2b7c:	e3400000 	movt	r0, #0
    2b80:	e51b1008 	ldr	r1, [fp, #-8]
    2b84:	e3a02f96 	mov	r2, #600	; 0x258
    2b88:	eb000631 	bl	4454 <memset>
        if(write(fd, buf, 600) != 600){
    2b8c:	e51b0010 	ldr	r0, [fp, #-16]
    2b90:	e3091374 	movw	r1, #37748	; 0x9374
    2b94:	e3401000 	movt	r1, #0
    2b98:	e3a02f96 	mov	r2, #600	; 0x258
    2b9c:	eb000749 	bl	48c8 <write>
    2ba0:	e1a03000 	mov	r3, r0
    2ba4:	e3530f96 	cmp	r3, #600	; 0x258
    2ba8:	0a000004 	beq	2bc0 <bigfile+0xb0>
            printf(1, "write bigfile failed\n");
    2bac:	e3a00001 	mov	r0, #1
    2bb0:	e30611f0 	movw	r1, #25072	; 0x61f0
    2bb4:	e3401000 	movt	r1, #0
    2bb8:	eb000836 	bl	4c98 <printf>
            exit();
    2bbc:	eb00071d 	bl	4838 <exit>
    fd = open("bigfile", O_CREATE | O_RDWR);
    if(fd < 0){
        printf(1, "cannot create bigfile");
        exit();
    }
    for(i = 0; i < 20; i++){
    2bc0:	e51b3008 	ldr	r3, [fp, #-8]
    2bc4:	e2833001 	add	r3, r3, #1
    2bc8:	e50b3008 	str	r3, [fp, #-8]
    2bcc:	e51b3008 	ldr	r3, [fp, #-8]
    2bd0:	e3530013 	cmp	r3, #19
    2bd4:	daffffe7 	ble	2b78 <bigfile+0x68>
        if(write(fd, buf, 600) != 600){
            printf(1, "write bigfile failed\n");
            exit();
        }
    }
    close(fd);
    2bd8:	e51b0010 	ldr	r0, [fp, #-16]
    2bdc:	eb000742 	bl	48ec <close>

    fd = open("bigfile", 0);
    2be0:	e30601d0 	movw	r0, #25040	; 0x61d0
    2be4:	e3400000 	movt	r0, #0
    2be8:	e3a01000 	mov	r1, #0
    2bec:	eb000759 	bl	4958 <open>
    2bf0:	e50b0010 	str	r0, [fp, #-16]
    if(fd < 0){
    2bf4:	e51b3010 	ldr	r3, [fp, #-16]
    2bf8:	e3530000 	cmp	r3, #0
    2bfc:	aa000004 	bge	2c14 <bigfile+0x104>
        printf(1, "cannot open bigfile\n");
    2c00:	e3a00001 	mov	r0, #1
    2c04:	e3061208 	movw	r1, #25096	; 0x6208
    2c08:	e3401000 	movt	r1, #0
    2c0c:	eb000821 	bl	4c98 <printf>
        exit();
    2c10:	eb000708 	bl	4838 <exit>
    }
    total = 0;
    2c14:	e3a03000 	mov	r3, #0
    2c18:	e50b300c 	str	r3, [fp, #-12]
    for(i = 0; ; i++){
    2c1c:	e3a03000 	mov	r3, #0
    2c20:	e50b3008 	str	r3, [fp, #-8]
        cc = read(fd, buf, 300);
    2c24:	e51b0010 	ldr	r0, [fp, #-16]
    2c28:	e3091374 	movw	r1, #37748	; 0x9374
    2c2c:	e3401000 	movt	r1, #0
    2c30:	e3a02f4b 	mov	r2, #300	; 0x12c
    2c34:	eb00071a 	bl	48a4 <read>
    2c38:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
        if(cc < 0){
    2c3c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    2c40:	e3530000 	cmp	r3, #0
    2c44:	aa000004 	bge	2c5c <bigfile+0x14c>
            printf(1, "read bigfile failed\n");
    2c48:	e3a00001 	mov	r0, #1
    2c4c:	e3061220 	movw	r1, #25120	; 0x6220
    2c50:	e3401000 	movt	r1, #0
    2c54:	eb00080f 	bl	4c98 <printf>
            exit();
    2c58:	eb0006f6 	bl	4838 <exit>
        }
        if(cc == 0)
    2c5c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    2c60:	e3530000 	cmp	r3, #0
    2c64:	0a000028 	beq	2d0c <bigfile+0x1fc>
            break;
        if(cc != 300){
    2c68:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    2c6c:	e3530f4b 	cmp	r3, #300	; 0x12c
    2c70:	0a000004 	beq	2c88 <bigfile+0x178>
            printf(1, "short read bigfile\n");
    2c74:	e3a00001 	mov	r0, #1
    2c78:	e3061238 	movw	r1, #25144	; 0x6238
    2c7c:	e3401000 	movt	r1, #0
    2c80:	eb000804 	bl	4c98 <printf>
            exit();
    2c84:	eb0006eb 	bl	4838 <exit>
        }
        if(buf[0] != i/2 || buf[299] != i/2){
    2c88:	e3093374 	movw	r3, #37748	; 0x9374
    2c8c:	e3403000 	movt	r3, #0
    2c90:	e5d33000 	ldrb	r3, [r3]
    2c94:	e1a02003 	mov	r2, r3
    2c98:	e51b3008 	ldr	r3, [fp, #-8]
    2c9c:	e1a01fa3 	lsr	r1, r3, #31
    2ca0:	e0813003 	add	r3, r1, r3
    2ca4:	e1a030c3 	asr	r3, r3, #1
    2ca8:	e1520003 	cmp	r2, r3
    2cac:	1a000009 	bne	2cd8 <bigfile+0x1c8>
    2cb0:	e3093374 	movw	r3, #37748	; 0x9374
    2cb4:	e3403000 	movt	r3, #0
    2cb8:	e5d3312b 	ldrb	r3, [r3, #299]	; 0x12b
    2cbc:	e1a02003 	mov	r2, r3
    2cc0:	e51b3008 	ldr	r3, [fp, #-8]
    2cc4:	e1a01fa3 	lsr	r1, r3, #31
    2cc8:	e0813003 	add	r3, r1, r3
    2ccc:	e1a030c3 	asr	r3, r3, #1
    2cd0:	e1520003 	cmp	r2, r3
    2cd4:	0a000004 	beq	2cec <bigfile+0x1dc>
            printf(1, "read bigfile wrong data\n");
    2cd8:	e3a00001 	mov	r0, #1
    2cdc:	e306124c 	movw	r1, #25164	; 0x624c
    2ce0:	e3401000 	movt	r1, #0
    2ce4:	eb0007eb 	bl	4c98 <printf>
            exit();
    2ce8:	eb0006d2 	bl	4838 <exit>
        }
        total += cc;
    2cec:	e51b200c 	ldr	r2, [fp, #-12]
    2cf0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    2cf4:	e0823003 	add	r3, r2, r3
    2cf8:	e50b300c 	str	r3, [fp, #-12]
    if(fd < 0){
        printf(1, "cannot open bigfile\n");
        exit();
    }
    total = 0;
    for(i = 0; ; i++){
    2cfc:	e51b3008 	ldr	r3, [fp, #-8]
    2d00:	e2833001 	add	r3, r3, #1
    2d04:	e50b3008 	str	r3, [fp, #-8]
        if(buf[0] != i/2 || buf[299] != i/2){
            printf(1, "read bigfile wrong data\n");
            exit();
        }
        total += cc;
    }
    2d08:	eaffffc5 	b	2c24 <bigfile+0x114>
        if(cc < 0){
            printf(1, "read bigfile failed\n");
            exit();
        }
        if(cc == 0)
            break;
    2d0c:	e1a00000 	nop			; (mov r0, r0)
            printf(1, "read bigfile wrong data\n");
            exit();
        }
        total += cc;
    }
    close(fd);
    2d10:	e51b0010 	ldr	r0, [fp, #-16]
    2d14:	eb0006f4 	bl	48ec <close>
    if(total != 20*600){
    2d18:	e51b200c 	ldr	r2, [fp, #-12]
    2d1c:	e3023ee0 	movw	r3, #12000	; 0x2ee0
    2d20:	e1520003 	cmp	r2, r3
    2d24:	0a000004 	beq	2d3c <bigfile+0x22c>
        printf(1, "read bigfile wrong total\n");
    2d28:	e3a00001 	mov	r0, #1
    2d2c:	e3061268 	movw	r1, #25192	; 0x6268
    2d30:	e3401000 	movt	r1, #0
    2d34:	eb0007d7 	bl	4c98 <printf>
        exit();
    2d38:	eb0006be 	bl	4838 <exit>
    }
    unlink("bigfile");
    2d3c:	e30601d0 	movw	r0, #25040	; 0x61d0
    2d40:	e3400000 	movt	r0, #0
    2d44:	eb000715 	bl	49a0 <unlink>

    printf(1, "bigfile test ok\n");
    2d48:	e3a00001 	mov	r0, #1
    2d4c:	e3061284 	movw	r1, #25220	; 0x6284
    2d50:	e3401000 	movt	r1, #0
    2d54:	eb0007cf 	bl	4c98 <printf>
}
    2d58:	e24bd004 	sub	sp, fp, #4
    2d5c:	e8bd8800 	pop	{fp, pc}

00002d60 <fourteen>:

void
fourteen(void)
{
    2d60:	e92d4800 	push	{fp, lr}
    2d64:	e28db004 	add	fp, sp, #4
    2d68:	e24dd008 	sub	sp, sp, #8
    int fd;

    // DIRSIZ is 14.
    printf(1, "fourteen test\n");
    2d6c:	e3a00001 	mov	r0, #1
    2d70:	e3061298 	movw	r1, #25240	; 0x6298
    2d74:	e3401000 	movt	r1, #0
    2d78:	eb0007c6 	bl	4c98 <printf>

    if(mkdir("12345678901234") != 0){
    2d7c:	e30602a8 	movw	r0, #25256	; 0x62a8
    2d80:	e3400000 	movt	r0, #0
    2d84:	eb000720 	bl	4a0c <mkdir>
    2d88:	e1a03000 	mov	r3, r0
    2d8c:	e3530000 	cmp	r3, #0
    2d90:	0a000004 	beq	2da8 <fourteen+0x48>
        printf(1, "mkdir 12345678901234 failed\n");
    2d94:	e3a00001 	mov	r0, #1
    2d98:	e30612b8 	movw	r1, #25272	; 0x62b8
    2d9c:	e3401000 	movt	r1, #0
    2da0:	eb0007bc 	bl	4c98 <printf>
        exit();
    2da4:	eb0006a3 	bl	4838 <exit>
    }
    if(mkdir("12345678901234/123456789012345") != 0){
    2da8:	e30602d8 	movw	r0, #25304	; 0x62d8
    2dac:	e3400000 	movt	r0, #0
    2db0:	eb000715 	bl	4a0c <mkdir>
    2db4:	e1a03000 	mov	r3, r0
    2db8:	e3530000 	cmp	r3, #0
    2dbc:	0a000004 	beq	2dd4 <fourteen+0x74>
        printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2dc0:	e3a00001 	mov	r0, #1
    2dc4:	e30612f8 	movw	r1, #25336	; 0x62f8
    2dc8:	e3401000 	movt	r1, #0
    2dcc:	eb0007b1 	bl	4c98 <printf>
        exit();
    2dd0:	eb000698 	bl	4838 <exit>
    }
    fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2dd4:	e3060328 	movw	r0, #25384	; 0x6328
    2dd8:	e3400000 	movt	r0, #0
    2ddc:	e3a01c02 	mov	r1, #512	; 0x200
    2de0:	eb0006dc 	bl	4958 <open>
    2de4:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    2de8:	e51b3008 	ldr	r3, [fp, #-8]
    2dec:	e3530000 	cmp	r3, #0
    2df0:	aa000004 	bge	2e08 <fourteen+0xa8>
        printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2df4:	e3a00001 	mov	r0, #1
    2df8:	e3061358 	movw	r1, #25432	; 0x6358
    2dfc:	e3401000 	movt	r1, #0
    2e00:	eb0007a4 	bl	4c98 <printf>
        exit();
    2e04:	eb00068b 	bl	4838 <exit>
    }
    close(fd);
    2e08:	e51b0008 	ldr	r0, [fp, #-8]
    2e0c:	eb0006b6 	bl	48ec <close>
    fd = open("12345678901234/12345678901234/12345678901234", 0);
    2e10:	e3060398 	movw	r0, #25496	; 0x6398
    2e14:	e3400000 	movt	r0, #0
    2e18:	e3a01000 	mov	r1, #0
    2e1c:	eb0006cd 	bl	4958 <open>
    2e20:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    2e24:	e51b3008 	ldr	r3, [fp, #-8]
    2e28:	e3530000 	cmp	r3, #0
    2e2c:	aa000004 	bge	2e44 <fourteen+0xe4>
        printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2e30:	e3a00001 	mov	r0, #1
    2e34:	e30613c8 	movw	r1, #25544	; 0x63c8
    2e38:	e3401000 	movt	r1, #0
    2e3c:	eb000795 	bl	4c98 <printf>
        exit();
    2e40:	eb00067c 	bl	4838 <exit>
    }
    close(fd);
    2e44:	e51b0008 	ldr	r0, [fp, #-8]
    2e48:	eb0006a7 	bl	48ec <close>

    if(mkdir("12345678901234/12345678901234") == 0){
    2e4c:	e3060404 	movw	r0, #25604	; 0x6404
    2e50:	e3400000 	movt	r0, #0
    2e54:	eb0006ec 	bl	4a0c <mkdir>
    2e58:	e1a03000 	mov	r3, r0
    2e5c:	e3530000 	cmp	r3, #0
    2e60:	1a000004 	bne	2e78 <fourteen+0x118>
        printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2e64:	e3a00001 	mov	r0, #1
    2e68:	e3061424 	movw	r1, #25636	; 0x6424
    2e6c:	e3401000 	movt	r1, #0
    2e70:	eb000788 	bl	4c98 <printf>
        exit();
    2e74:	eb00066f 	bl	4838 <exit>
    }
    if(mkdir("123456789012345/12345678901234") == 0){
    2e78:	e3060454 	movw	r0, #25684	; 0x6454
    2e7c:	e3400000 	movt	r0, #0
    2e80:	eb0006e1 	bl	4a0c <mkdir>
    2e84:	e1a03000 	mov	r3, r0
    2e88:	e3530000 	cmp	r3, #0
    2e8c:	1a000004 	bne	2ea4 <fourteen+0x144>
        printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2e90:	e3a00001 	mov	r0, #1
    2e94:	e3061474 	movw	r1, #25716	; 0x6474
    2e98:	e3401000 	movt	r1, #0
    2e9c:	eb00077d 	bl	4c98 <printf>
        exit();
    2ea0:	eb000664 	bl	4838 <exit>
    }

    printf(1, "fourteen ok\n");
    2ea4:	e3a00001 	mov	r0, #1
    2ea8:	e30614a8 	movw	r1, #25768	; 0x64a8
    2eac:	e3401000 	movt	r1, #0
    2eb0:	eb000778 	bl	4c98 <printf>
}
    2eb4:	e24bd004 	sub	sp, fp, #4
    2eb8:	e8bd8800 	pop	{fp, pc}

00002ebc <rmdot>:

void
rmdot(void)
{
    2ebc:	e92d4800 	push	{fp, lr}
    2ec0:	e28db004 	add	fp, sp, #4
    printf(1, "rmdot test\n");
    2ec4:	e3a00001 	mov	r0, #1
    2ec8:	e30614b8 	movw	r1, #25784	; 0x64b8
    2ecc:	e3401000 	movt	r1, #0
    2ed0:	eb000770 	bl	4c98 <printf>
    if(mkdir("dots") != 0){
    2ed4:	e30604c4 	movw	r0, #25796	; 0x64c4
    2ed8:	e3400000 	movt	r0, #0
    2edc:	eb0006ca 	bl	4a0c <mkdir>
    2ee0:	e1a03000 	mov	r3, r0
    2ee4:	e3530000 	cmp	r3, #0
    2ee8:	0a000004 	beq	2f00 <rmdot+0x44>
        printf(1, "mkdir dots failed\n");
    2eec:	e3a00001 	mov	r0, #1
    2ef0:	e30614cc 	movw	r1, #25804	; 0x64cc
    2ef4:	e3401000 	movt	r1, #0
    2ef8:	eb000766 	bl	4c98 <printf>
        exit();
    2efc:	eb00064d 	bl	4838 <exit>
    }
    if(chdir("dots") != 0){
    2f00:	e30604c4 	movw	r0, #25796	; 0x64c4
    2f04:	e3400000 	movt	r0, #0
    2f08:	eb0006c8 	bl	4a30 <chdir>
    2f0c:	e1a03000 	mov	r3, r0
    2f10:	e3530000 	cmp	r3, #0
    2f14:	0a000004 	beq	2f2c <rmdot+0x70>
        printf(1, "chdir dots failed\n");
    2f18:	e3a00001 	mov	r0, #1
    2f1c:	e30614e0 	movw	r1, #25824	; 0x64e0
    2f20:	e3401000 	movt	r1, #0
    2f24:	eb00075b 	bl	4c98 <printf>
        exit();
    2f28:	eb000642 	bl	4838 <exit>
    }
    if(unlink(".") == 0){
    2f2c:	e3050b6c 	movw	r0, #23404	; 0x5b6c
    2f30:	e3400000 	movt	r0, #0
    2f34:	eb000699 	bl	49a0 <unlink>
    2f38:	e1a03000 	mov	r3, r0
    2f3c:	e3530000 	cmp	r3, #0
    2f40:	1a000004 	bne	2f58 <rmdot+0x9c>
        printf(1, "rm . worked!\n");
    2f44:	e3a00001 	mov	r0, #1
    2f48:	e30614f4 	movw	r1, #25844	; 0x64f4
    2f4c:	e3401000 	movt	r1, #0
    2f50:	eb000750 	bl	4c98 <printf>
        exit();
    2f54:	eb000637 	bl	4838 <exit>
    }
    if(unlink("..") == 0){
    2f58:	e305069c 	movw	r0, #22172	; 0x569c
    2f5c:	e3400000 	movt	r0, #0
    2f60:	eb00068e 	bl	49a0 <unlink>
    2f64:	e1a03000 	mov	r3, r0
    2f68:	e3530000 	cmp	r3, #0
    2f6c:	1a000004 	bne	2f84 <rmdot+0xc8>
        printf(1, "rm .. worked!\n");
    2f70:	e3a00001 	mov	r0, #1
    2f74:	e3061504 	movw	r1, #25860	; 0x6504
    2f78:	e3401000 	movt	r1, #0
    2f7c:	eb000745 	bl	4c98 <printf>
        exit();
    2f80:	eb00062c 	bl	4838 <exit>
    }
    if(chdir("/") != 0){
    2f84:	e3060514 	movw	r0, #25876	; 0x6514
    2f88:	e3400000 	movt	r0, #0
    2f8c:	eb0006a7 	bl	4a30 <chdir>
    2f90:	e1a03000 	mov	r3, r0
    2f94:	e3530000 	cmp	r3, #0
    2f98:	0a000004 	beq	2fb0 <rmdot+0xf4>
        printf(1, "chdir / failed\n");
    2f9c:	e3a00001 	mov	r0, #1
    2fa0:	e3061518 	movw	r1, #25880	; 0x6518
    2fa4:	e3401000 	movt	r1, #0
    2fa8:	eb00073a 	bl	4c98 <printf>
        exit();
    2fac:	eb000621 	bl	4838 <exit>
    }
    if(unlink("dots/.") == 0){
    2fb0:	e3060528 	movw	r0, #25896	; 0x6528
    2fb4:	e3400000 	movt	r0, #0
    2fb8:	eb000678 	bl	49a0 <unlink>
    2fbc:	e1a03000 	mov	r3, r0
    2fc0:	e3530000 	cmp	r3, #0
    2fc4:	1a000004 	bne	2fdc <rmdot+0x120>
        printf(1, "unlink dots/. worked!\n");
    2fc8:	e3a00001 	mov	r0, #1
    2fcc:	e3061530 	movw	r1, #25904	; 0x6530
    2fd0:	e3401000 	movt	r1, #0
    2fd4:	eb00072f 	bl	4c98 <printf>
        exit();
    2fd8:	eb000616 	bl	4838 <exit>
    }
    if(unlink("dots/..") == 0){
    2fdc:	e3060548 	movw	r0, #25928	; 0x6548
    2fe0:	e3400000 	movt	r0, #0
    2fe4:	eb00066d 	bl	49a0 <unlink>
    2fe8:	e1a03000 	mov	r3, r0
    2fec:	e3530000 	cmp	r3, #0
    2ff0:	1a000004 	bne	3008 <rmdot+0x14c>
        printf(1, "unlink dots/.. worked!\n");
    2ff4:	e3a00001 	mov	r0, #1
    2ff8:	e3061550 	movw	r1, #25936	; 0x6550
    2ffc:	e3401000 	movt	r1, #0
    3000:	eb000724 	bl	4c98 <printf>
        exit();
    3004:	eb00060b 	bl	4838 <exit>
    }
    if(unlink("dots") != 0){
    3008:	e30604c4 	movw	r0, #25796	; 0x64c4
    300c:	e3400000 	movt	r0, #0
    3010:	eb000662 	bl	49a0 <unlink>
    3014:	e1a03000 	mov	r3, r0
    3018:	e3530000 	cmp	r3, #0
    301c:	0a000004 	beq	3034 <rmdot+0x178>
        printf(1, "unlink dots failed!\n");
    3020:	e3a00001 	mov	r0, #1
    3024:	e3061568 	movw	r1, #25960	; 0x6568
    3028:	e3401000 	movt	r1, #0
    302c:	eb000719 	bl	4c98 <printf>
        exit();
    3030:	eb000600 	bl	4838 <exit>
    }
    printf(1, "rmdot ok\n");
    3034:	e3a00001 	mov	r0, #1
    3038:	e3061580 	movw	r1, #25984	; 0x6580
    303c:	e3401000 	movt	r1, #0
    3040:	eb000714 	bl	4c98 <printf>
}
    3044:	e8bd8800 	pop	{fp, pc}

00003048 <dirfile>:

void
dirfile(void)
{
    3048:	e92d4800 	push	{fp, lr}
    304c:	e28db004 	add	fp, sp, #4
    3050:	e24dd008 	sub	sp, sp, #8
    int fd;

    printf(1, "dir vs file\n");
    3054:	e3a00001 	mov	r0, #1
    3058:	e306158c 	movw	r1, #25996	; 0x658c
    305c:	e3401000 	movt	r1, #0
    3060:	eb00070c 	bl	4c98 <printf>

    fd = open("dirfile", O_CREATE);
    3064:	e306059c 	movw	r0, #26012	; 0x659c
    3068:	e3400000 	movt	r0, #0
    306c:	e3a01c02 	mov	r1, #512	; 0x200
    3070:	eb000638 	bl	4958 <open>
    3074:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0){
    3078:	e51b3008 	ldr	r3, [fp, #-8]
    307c:	e3530000 	cmp	r3, #0
    3080:	aa000004 	bge	3098 <dirfile+0x50>
        printf(1, "create dirfile failed\n");
    3084:	e3a00001 	mov	r0, #1
    3088:	e30615a4 	movw	r1, #26020	; 0x65a4
    308c:	e3401000 	movt	r1, #0
    3090:	eb000700 	bl	4c98 <printf>
        exit();
    3094:	eb0005e7 	bl	4838 <exit>
    }
    close(fd);
    3098:	e51b0008 	ldr	r0, [fp, #-8]
    309c:	eb000612 	bl	48ec <close>
    if(chdir("dirfile") == 0){
    30a0:	e306059c 	movw	r0, #26012	; 0x659c
    30a4:	e3400000 	movt	r0, #0
    30a8:	eb000660 	bl	4a30 <chdir>
    30ac:	e1a03000 	mov	r3, r0
    30b0:	e3530000 	cmp	r3, #0
    30b4:	1a000004 	bne	30cc <dirfile+0x84>
        printf(1, "chdir dirfile succeeded!\n");
    30b8:	e3a00001 	mov	r0, #1
    30bc:	e30615bc 	movw	r1, #26044	; 0x65bc
    30c0:	e3401000 	movt	r1, #0
    30c4:	eb0006f3 	bl	4c98 <printf>
        exit();
    30c8:	eb0005da 	bl	4838 <exit>
    }
    fd = open("dirfile/xx", 0);
    30cc:	e30605d8 	movw	r0, #26072	; 0x65d8
    30d0:	e3400000 	movt	r0, #0
    30d4:	e3a01000 	mov	r1, #0
    30d8:	eb00061e 	bl	4958 <open>
    30dc:	e50b0008 	str	r0, [fp, #-8]
    if(fd >= 0){
    30e0:	e51b3008 	ldr	r3, [fp, #-8]
    30e4:	e3530000 	cmp	r3, #0
    30e8:	ba000004 	blt	3100 <dirfile+0xb8>
        printf(1, "create dirfile/xx succeeded!\n");
    30ec:	e3a00001 	mov	r0, #1
    30f0:	e30615e4 	movw	r1, #26084	; 0x65e4
    30f4:	e3401000 	movt	r1, #0
    30f8:	eb0006e6 	bl	4c98 <printf>
        exit();
    30fc:	eb0005cd 	bl	4838 <exit>
    }
    fd = open("dirfile/xx", O_CREATE);
    3100:	e30605d8 	movw	r0, #26072	; 0x65d8
    3104:	e3400000 	movt	r0, #0
    3108:	e3a01c02 	mov	r1, #512	; 0x200
    310c:	eb000611 	bl	4958 <open>
    3110:	e50b0008 	str	r0, [fp, #-8]
    if(fd >= 0){
    3114:	e51b3008 	ldr	r3, [fp, #-8]
    3118:	e3530000 	cmp	r3, #0
    311c:	ba000004 	blt	3134 <dirfile+0xec>
        printf(1, "create dirfile/xx succeeded!\n");
    3120:	e3a00001 	mov	r0, #1
    3124:	e30615e4 	movw	r1, #26084	; 0x65e4
    3128:	e3401000 	movt	r1, #0
    312c:	eb0006d9 	bl	4c98 <printf>
        exit();
    3130:	eb0005c0 	bl	4838 <exit>
    }
    if(mkdir("dirfile/xx") == 0){
    3134:	e30605d8 	movw	r0, #26072	; 0x65d8
    3138:	e3400000 	movt	r0, #0
    313c:	eb000632 	bl	4a0c <mkdir>
    3140:	e1a03000 	mov	r3, r0
    3144:	e3530000 	cmp	r3, #0
    3148:	1a000004 	bne	3160 <dirfile+0x118>
        printf(1, "mkdir dirfile/xx succeeded!\n");
    314c:	e3a00001 	mov	r0, #1
    3150:	e3061604 	movw	r1, #26116	; 0x6604
    3154:	e3401000 	movt	r1, #0
    3158:	eb0006ce 	bl	4c98 <printf>
        exit();
    315c:	eb0005b5 	bl	4838 <exit>
    }
    if(unlink("dirfile/xx") == 0){
    3160:	e30605d8 	movw	r0, #26072	; 0x65d8
    3164:	e3400000 	movt	r0, #0
    3168:	eb00060c 	bl	49a0 <unlink>
    316c:	e1a03000 	mov	r3, r0
    3170:	e3530000 	cmp	r3, #0
    3174:	1a000004 	bne	318c <dirfile+0x144>
        printf(1, "unlink dirfile/xx succeeded!\n");
    3178:	e3a00001 	mov	r0, #1
    317c:	e3061624 	movw	r1, #26148	; 0x6624
    3180:	e3401000 	movt	r1, #0
    3184:	eb0006c3 	bl	4c98 <printf>
        exit();
    3188:	eb0005aa 	bl	4838 <exit>
    }
    if(link("README", "dirfile/xx") == 0){
    318c:	e3060644 	movw	r0, #26180	; 0x6644
    3190:	e3400000 	movt	r0, #0
    3194:	e30615d8 	movw	r1, #26072	; 0x65d8
    3198:	e3401000 	movt	r1, #0
    319c:	eb000611 	bl	49e8 <link>
    31a0:	e1a03000 	mov	r3, r0
    31a4:	e3530000 	cmp	r3, #0
    31a8:	1a000004 	bne	31c0 <dirfile+0x178>
        printf(1, "link to dirfile/xx succeeded!\n");
    31ac:	e3a00001 	mov	r0, #1
    31b0:	e306164c 	movw	r1, #26188	; 0x664c
    31b4:	e3401000 	movt	r1, #0
    31b8:	eb0006b6 	bl	4c98 <printf>
        exit();
    31bc:	eb00059d 	bl	4838 <exit>
    }
    if(unlink("dirfile") != 0){
    31c0:	e306059c 	movw	r0, #26012	; 0x659c
    31c4:	e3400000 	movt	r0, #0
    31c8:	eb0005f4 	bl	49a0 <unlink>
    31cc:	e1a03000 	mov	r3, r0
    31d0:	e3530000 	cmp	r3, #0
    31d4:	0a000004 	beq	31ec <dirfile+0x1a4>
        printf(1, "unlink dirfile failed!\n");
    31d8:	e3a00001 	mov	r0, #1
    31dc:	e306166c 	movw	r1, #26220	; 0x666c
    31e0:	e3401000 	movt	r1, #0
    31e4:	eb0006ab 	bl	4c98 <printf>
        exit();
    31e8:	eb000592 	bl	4838 <exit>
    }

    fd = open(".", O_RDWR);
    31ec:	e3050b6c 	movw	r0, #23404	; 0x5b6c
    31f0:	e3400000 	movt	r0, #0
    31f4:	e3a01002 	mov	r1, #2
    31f8:	eb0005d6 	bl	4958 <open>
    31fc:	e50b0008 	str	r0, [fp, #-8]
    if(fd >= 0){
    3200:	e51b3008 	ldr	r3, [fp, #-8]
    3204:	e3530000 	cmp	r3, #0
    3208:	ba000004 	blt	3220 <dirfile+0x1d8>
        printf(1, "open . for writing succeeded!\n");
    320c:	e3a00001 	mov	r0, #1
    3210:	e3061684 	movw	r1, #26244	; 0x6684
    3214:	e3401000 	movt	r1, #0
    3218:	eb00069e 	bl	4c98 <printf>
        exit();
    321c:	eb000585 	bl	4838 <exit>
    }
    fd = open(".", 0);
    3220:	e3050b6c 	movw	r0, #23404	; 0x5b6c
    3224:	e3400000 	movt	r0, #0
    3228:	e3a01000 	mov	r1, #0
    322c:	eb0005c9 	bl	4958 <open>
    3230:	e50b0008 	str	r0, [fp, #-8]
    if(write(fd, "x", 1) > 0){
    3234:	e51b0008 	ldr	r0, [fp, #-8]
    3238:	e3051758 	movw	r1, #22360	; 0x5758
    323c:	e3401000 	movt	r1, #0
    3240:	e3a02001 	mov	r2, #1
    3244:	eb00059f 	bl	48c8 <write>
    3248:	e1a03000 	mov	r3, r0
    324c:	e3530000 	cmp	r3, #0
    3250:	da000004 	ble	3268 <dirfile+0x220>
        printf(1, "write . succeeded!\n");
    3254:	e3a00001 	mov	r0, #1
    3258:	e30616a4 	movw	r1, #26276	; 0x66a4
    325c:	e3401000 	movt	r1, #0
    3260:	eb00068c 	bl	4c98 <printf>
        exit();
    3264:	eb000573 	bl	4838 <exit>
    }
    close(fd);
    3268:	e51b0008 	ldr	r0, [fp, #-8]
    326c:	eb00059e 	bl	48ec <close>

    printf(1, "dir vs file OK\n");
    3270:	e3a00001 	mov	r0, #1
    3274:	e30616b8 	movw	r1, #26296	; 0x66b8
    3278:	e3401000 	movt	r1, #0
    327c:	eb000685 	bl	4c98 <printf>
}
    3280:	e24bd004 	sub	sp, fp, #4
    3284:	e8bd8800 	pop	{fp, pc}

00003288 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3288:	e92d4800 	push	{fp, lr}
    328c:	e28db004 	add	fp, sp, #4
    3290:	e24dd008 	sub	sp, sp, #8
    int i, fd;

    printf(1, "empty file name\n");
    3294:	e3a00001 	mov	r0, #1
    3298:	e30616c8 	movw	r1, #26312	; 0x66c8
    329c:	e3401000 	movt	r1, #0
    32a0:	eb00067c 	bl	4c98 <printf>

    // the 50 is NINODE
    for(i = 0; i < 50 + 1; i++){
    32a4:	e3a03000 	mov	r3, #0
    32a8:	e50b3008 	str	r3, [fp, #-8]
    32ac:	ea000037 	b	3390 <iref+0x108>
        if(mkdir("irefd") != 0){
    32b0:	e30606dc 	movw	r0, #26332	; 0x66dc
    32b4:	e3400000 	movt	r0, #0
    32b8:	eb0005d3 	bl	4a0c <mkdir>
    32bc:	e1a03000 	mov	r3, r0
    32c0:	e3530000 	cmp	r3, #0
    32c4:	0a000004 	beq	32dc <iref+0x54>
            printf(1, "mkdir irefd failed\n");
    32c8:	e3a00001 	mov	r0, #1
    32cc:	e30616e4 	movw	r1, #26340	; 0x66e4
    32d0:	e3401000 	movt	r1, #0
    32d4:	eb00066f 	bl	4c98 <printf>
            exit();
    32d8:	eb000556 	bl	4838 <exit>
        }
        if(chdir("irefd") != 0){
    32dc:	e30606dc 	movw	r0, #26332	; 0x66dc
    32e0:	e3400000 	movt	r0, #0
    32e4:	eb0005d1 	bl	4a30 <chdir>
    32e8:	e1a03000 	mov	r3, r0
    32ec:	e3530000 	cmp	r3, #0
    32f0:	0a000004 	beq	3308 <iref+0x80>
            printf(1, "chdir irefd failed\n");
    32f4:	e3a00001 	mov	r0, #1
    32f8:	e30616f8 	movw	r1, #26360	; 0x66f8
    32fc:	e3401000 	movt	r1, #0
    3300:	eb000664 	bl	4c98 <printf>
            exit();
    3304:	eb00054b 	bl	4838 <exit>
        }

        mkdir("");
    3308:	e306070c 	movw	r0, #26380	; 0x670c
    330c:	e3400000 	movt	r0, #0
    3310:	eb0005bd 	bl	4a0c <mkdir>
        link("README", "");
    3314:	e3060644 	movw	r0, #26180	; 0x6644
    3318:	e3400000 	movt	r0, #0
    331c:	e306170c 	movw	r1, #26380	; 0x670c
    3320:	e3401000 	movt	r1, #0
    3324:	eb0005af 	bl	49e8 <link>
        fd = open("", O_CREATE);
    3328:	e306070c 	movw	r0, #26380	; 0x670c
    332c:	e3400000 	movt	r0, #0
    3330:	e3a01c02 	mov	r1, #512	; 0x200
    3334:	eb000587 	bl	4958 <open>
    3338:	e50b000c 	str	r0, [fp, #-12]
        if(fd >= 0)
    333c:	e51b300c 	ldr	r3, [fp, #-12]
    3340:	e3530000 	cmp	r3, #0
    3344:	ba000001 	blt	3350 <iref+0xc8>
            close(fd);
    3348:	e51b000c 	ldr	r0, [fp, #-12]
    334c:	eb000566 	bl	48ec <close>
        fd = open("xx", O_CREATE);
    3350:	e3060710 	movw	r0, #26384	; 0x6710
    3354:	e3400000 	movt	r0, #0
    3358:	e3a01c02 	mov	r1, #512	; 0x200
    335c:	eb00057d 	bl	4958 <open>
    3360:	e50b000c 	str	r0, [fp, #-12]
        if(fd >= 0)
    3364:	e51b300c 	ldr	r3, [fp, #-12]
    3368:	e3530000 	cmp	r3, #0
    336c:	ba000001 	blt	3378 <iref+0xf0>
            close(fd);
    3370:	e51b000c 	ldr	r0, [fp, #-12]
    3374:	eb00055c 	bl	48ec <close>
        unlink("xx");
    3378:	e3060710 	movw	r0, #26384	; 0x6710
    337c:	e3400000 	movt	r0, #0
    3380:	eb000586 	bl	49a0 <unlink>
    int i, fd;

    printf(1, "empty file name\n");

    // the 50 is NINODE
    for(i = 0; i < 50 + 1; i++){
    3384:	e51b3008 	ldr	r3, [fp, #-8]
    3388:	e2833001 	add	r3, r3, #1
    338c:	e50b3008 	str	r3, [fp, #-8]
    3390:	e51b3008 	ldr	r3, [fp, #-8]
    3394:	e3530032 	cmp	r3, #50	; 0x32
    3398:	daffffc4 	ble	32b0 <iref+0x28>
        if(fd >= 0)
            close(fd);
        unlink("xx");
    }

    chdir("/");
    339c:	e3060514 	movw	r0, #25876	; 0x6514
    33a0:	e3400000 	movt	r0, #0
    33a4:	eb0005a1 	bl	4a30 <chdir>
    printf(1, "empty file name OK\n");
    33a8:	e3a00001 	mov	r0, #1
    33ac:	e3061714 	movw	r1, #26388	; 0x6714
    33b0:	e3401000 	movt	r1, #0
    33b4:	eb000637 	bl	4c98 <printf>
}
    33b8:	e24bd004 	sub	sp, fp, #4
    33bc:	e8bd8800 	pop	{fp, pc}

000033c0 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    33c0:	e92d4800 	push	{fp, lr}
    33c4:	e28db004 	add	fp, sp, #4
    33c8:	e24dd008 	sub	sp, sp, #8
    int n, pid;

    printf(1, "fork test\n");
    33cc:	e3a00001 	mov	r0, #1
    33d0:	e3061728 	movw	r1, #26408	; 0x6728
    33d4:	e3401000 	movt	r1, #0
    33d8:	eb00062e 	bl	4c98 <printf>

    for(n=0; n<1000; n++){
    33dc:	e3a03000 	mov	r3, #0
    33e0:	e50b3008 	str	r3, [fp, #-8]
    33e4:	ea00000b 	b	3418 <forktest+0x58>
        pid = fork();
    33e8:	eb000509 	bl	4814 <fork>
    33ec:	e50b000c 	str	r0, [fp, #-12]
        if(pid < 0)
    33f0:	e51b300c 	ldr	r3, [fp, #-12]
    33f4:	e3530000 	cmp	r3, #0
    33f8:	ba00000b 	blt	342c <forktest+0x6c>
            break;
        if(pid == 0)
    33fc:	e51b300c 	ldr	r3, [fp, #-12]
    3400:	e3530000 	cmp	r3, #0
    3404:	1a000000 	bne	340c <forktest+0x4c>
            exit();
    3408:	eb00050a 	bl	4838 <exit>
{
    int n, pid;

    printf(1, "fork test\n");

    for(n=0; n<1000; n++){
    340c:	e51b3008 	ldr	r3, [fp, #-8]
    3410:	e2833001 	add	r3, r3, #1
    3414:	e50b3008 	str	r3, [fp, #-8]
    3418:	e51b2008 	ldr	r2, [fp, #-8]
    341c:	e30033e7 	movw	r3, #999	; 0x3e7
    3420:	e1520003 	cmp	r2, r3
    3424:	daffffef 	ble	33e8 <forktest+0x28>
    3428:	ea000000 	b	3430 <forktest+0x70>
        pid = fork();
        if(pid < 0)
            break;
    342c:	e1a00000 	nop			; (mov r0, r0)
        if(pid == 0)
            exit();
    }

    if(n == 1000){
    3430:	e51b3008 	ldr	r3, [fp, #-8]
    3434:	e3530ffa 	cmp	r3, #1000	; 0x3e8
    3438:	1a000010 	bne	3480 <forktest+0xc0>
        printf(1, "fork claimed to work 1000 times!\n");
    343c:	e3a00001 	mov	r0, #1
    3440:	e3061734 	movw	r1, #26420	; 0x6734
    3444:	e3401000 	movt	r1, #0
    3448:	eb000612 	bl	4c98 <printf>
        exit();
    344c:	eb0004f9 	bl	4838 <exit>
    }

    for(; n > 0; n--){
        if(wait() < 0){
    3450:	eb000501 	bl	485c <wait>
    3454:	e1a03000 	mov	r3, r0
    3458:	e3530000 	cmp	r3, #0
    345c:	aa000004 	bge	3474 <forktest+0xb4>
            printf(1, "wait stopped early\n");
    3460:	e3a00001 	mov	r0, #1
    3464:	e3061758 	movw	r1, #26456	; 0x6758
    3468:	e3401000 	movt	r1, #0
    346c:	eb000609 	bl	4c98 <printf>
            exit();
    3470:	eb0004f0 	bl	4838 <exit>
    if(n == 1000){
        printf(1, "fork claimed to work 1000 times!\n");
        exit();
    }

    for(; n > 0; n--){
    3474:	e51b3008 	ldr	r3, [fp, #-8]
    3478:	e2433001 	sub	r3, r3, #1
    347c:	e50b3008 	str	r3, [fp, #-8]
    3480:	e51b3008 	ldr	r3, [fp, #-8]
    3484:	e3530000 	cmp	r3, #0
    3488:	cafffff0 	bgt	3450 <forktest+0x90>
            printf(1, "wait stopped early\n");
            exit();
        }
    }

    if(wait() != -1){
    348c:	eb0004f2 	bl	485c <wait>
    3490:	e1a03000 	mov	r3, r0
    3494:	e3730001 	cmn	r3, #1
    3498:	0a000004 	beq	34b0 <forktest+0xf0>
        printf(1, "wait got too many\n");
    349c:	e3a00001 	mov	r0, #1
    34a0:	e306176c 	movw	r1, #26476	; 0x676c
    34a4:	e3401000 	movt	r1, #0
    34a8:	eb0005fa 	bl	4c98 <printf>
        exit();
    34ac:	eb0004e1 	bl	4838 <exit>
    }

    printf(1, "fork test OK\n");
    34b0:	e3a00001 	mov	r0, #1
    34b4:	e3061780 	movw	r1, #26496	; 0x6780
    34b8:	e3401000 	movt	r1, #0
    34bc:	eb0005f5 	bl	4c98 <printf>
}
    34c0:	e24bd004 	sub	sp, fp, #4
    34c4:	e8bd8800 	pop	{fp, pc}

000034c8 <sbrktest>:

void
sbrktest(void)
{
    34c8:	e92d4810 	push	{r4, fp, lr}
    34cc:	e28db008 	add	fp, sp, #8
    34d0:	e24dd06c 	sub	sp, sp, #108	; 0x6c
    int fds[2], pid, pids[10], ppid;
    char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
    uint amt;

    printf(stdout, "sbrk test\n");
    34d4:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    34d8:	e3403000 	movt	r3, #0
    34dc:	e5933000 	ldr	r3, [r3]
    34e0:	e1a00003 	mov	r0, r3
    34e4:	e3061790 	movw	r1, #26512	; 0x6790
    34e8:	e3401000 	movt	r1, #0
    34ec:	eb0005e9 	bl	4c98 <printf>
    oldbrk = sbrk(0);
    34f0:	e3a00000 	mov	r0, #0
    34f4:	eb000568 	bl	4a9c <sbrk>
    34f8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8

    // can one sbrk() less than a page?
    a = sbrk(0);
    34fc:	e3a00000 	mov	r0, #0
    3500:	eb000565 	bl	4a9c <sbrk>
    3504:	e50b0010 	str	r0, [fp, #-16]
    int i;
    for(i = 0; i < 5000; i++){
    3508:	e3a03000 	mov	r3, #0
    350c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    3510:	ea00001b 	b	3584 <sbrktest+0xbc>
        b = sbrk(1);
    3514:	e3a00001 	mov	r0, #1
    3518:	eb00055f 	bl	4a9c <sbrk>
    351c:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
        if(b != a){
    3520:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    3524:	e51b3010 	ldr	r3, [fp, #-16]
    3528:	e1520003 	cmp	r2, r3
    352c:	0a00000b 	beq	3560 <sbrktest+0x98>
            printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3530:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3534:	e3403000 	movt	r3, #0
    3538:	e5933000 	ldr	r3, [r3]
    353c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    3540:	e58d2000 	str	r2, [sp]
    3544:	e1a00003 	mov	r0, r3
    3548:	e306179c 	movw	r1, #26524	; 0x679c
    354c:	e3401000 	movt	r1, #0
    3550:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    3554:	e51b3010 	ldr	r3, [fp, #-16]
    3558:	eb0005ce 	bl	4c98 <printf>
            exit();
    355c:	eb0004b5 	bl	4838 <exit>
        }
        *b = 1;
    3560:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3564:	e3a02001 	mov	r2, #1
    3568:	e5c32000 	strb	r2, [r3]
        a = b + 1;
    356c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3570:	e2833001 	add	r3, r3, #1
    3574:	e50b3010 	str	r3, [fp, #-16]
    oldbrk = sbrk(0);

    // can one sbrk() less than a page?
    a = sbrk(0);
    int i;
    for(i = 0; i < 5000; i++){
    3578:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    357c:	e2833001 	add	r3, r3, #1
    3580:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    3584:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    3588:	e3013387 	movw	r3, #4999	; 0x1387
    358c:	e1520003 	cmp	r2, r3
    3590:	daffffdf 	ble	3514 <sbrktest+0x4c>
            exit();
        }
        *b = 1;
        a = b + 1;
    }
    pid = fork();
    3594:	eb00049e 	bl	4814 <fork>
    3598:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    if(pid < 0){
    359c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    35a0:	e3530000 	cmp	r3, #0
    35a4:	aa000007 	bge	35c8 <sbrktest+0x100>
        printf(stdout, "sbrk test fork failed\n");
    35a8:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    35ac:	e3403000 	movt	r3, #0
    35b0:	e5933000 	ldr	r3, [r3]
    35b4:	e1a00003 	mov	r0, r3
    35b8:	e30617b8 	movw	r1, #26552	; 0x67b8
    35bc:	e3401000 	movt	r1, #0
    35c0:	eb0005b4 	bl	4c98 <printf>
        exit();
    35c4:	eb00049b 	bl	4838 <exit>
    }
    c = sbrk(1);
    35c8:	e3a00001 	mov	r0, #1
    35cc:	eb000532 	bl	4a9c <sbrk>
    35d0:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    c = sbrk(1);
    35d4:	e3a00001 	mov	r0, #1
    35d8:	eb00052f 	bl	4a9c <sbrk>
    35dc:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    if(c != a + 1){
    35e0:	e51b3010 	ldr	r3, [fp, #-16]
    35e4:	e2832001 	add	r2, r3, #1
    35e8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    35ec:	e1520003 	cmp	r2, r3
    35f0:	0a000007 	beq	3614 <sbrktest+0x14c>
        printf(stdout, "sbrk test failed post-fork\n");
    35f4:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    35f8:	e3403000 	movt	r3, #0
    35fc:	e5933000 	ldr	r3, [r3]
    3600:	e1a00003 	mov	r0, r3
    3604:	e30617d0 	movw	r1, #26576	; 0x67d0
    3608:	e3401000 	movt	r1, #0
    360c:	eb0005a1 	bl	4c98 <printf>
        exit();
    3610:	eb000488 	bl	4838 <exit>
    }
    if(pid == 0)
    3614:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    3618:	e3530000 	cmp	r3, #0
    361c:	1a000000 	bne	3624 <sbrktest+0x15c>
        exit();
    3620:	eb000484 	bl	4838 <exit>
    wait();
    3624:	eb00048c 	bl	485c <wait>

    // can one grow address space to something big?
#define BIG (100*1024*1024)
    a = sbrk(0);
    3628:	e3a00000 	mov	r0, #0
    362c:	eb00051a 	bl	4a9c <sbrk>
    3630:	e50b0010 	str	r0, [fp, #-16]
    amt = (BIG) - (uint)a;
    3634:	e51b3010 	ldr	r3, [fp, #-16]
    3638:	e2633519 	rsb	r3, r3, #104857600	; 0x6400000
    363c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    p = sbrk(amt);
    3640:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    3644:	e1a00003 	mov	r0, r3
    3648:	eb000513 	bl	4a9c <sbrk>
    364c:	e50b002c 	str	r0, [fp, #-44]	; 0xffffffd4
    if (p != a) {
    3650:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    3654:	e51b3010 	ldr	r3, [fp, #-16]
    3658:	e1520003 	cmp	r2, r3
    365c:	0a000007 	beq	3680 <sbrktest+0x1b8>
        printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3660:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3664:	e3403000 	movt	r3, #0
    3668:	e5933000 	ldr	r3, [r3]
    366c:	e1a00003 	mov	r0, r3
    3670:	e30617ec 	movw	r1, #26604	; 0x67ec
    3674:	e3401000 	movt	r1, #0
    3678:	eb000586 	bl	4c98 <printf>
        exit();
    367c:	eb00046d 	bl	4838 <exit>
    }
    lastaddr = (char*) (BIG-1);
    3680:	e30f3fff 	movw	r3, #65535	; 0xffff
    3684:	e340363f 	movt	r3, #1599	; 0x63f
    3688:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    *lastaddr = 99;
    368c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    3690:	e3a02063 	mov	r2, #99	; 0x63
    3694:	e5c32000 	strb	r2, [r3]

    // can one de-allocate?
    a = sbrk(0);
    3698:	e3a00000 	mov	r0, #0
    369c:	eb0004fe 	bl	4a9c <sbrk>
    36a0:	e50b0010 	str	r0, [fp, #-16]
    c = sbrk(-4096);
    36a4:	e3a00a0f 	mov	r0, #61440	; 0xf000
    36a8:	e34f0fff 	movt	r0, #65535	; 0xffff
    36ac:	eb0004fa 	bl	4a9c <sbrk>
    36b0:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    if(c == (char*)0xffffffff){
    36b4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    36b8:	e3730001 	cmn	r3, #1
    36bc:	1a000007 	bne	36e0 <sbrktest+0x218>
        printf(stdout, "sbrk could not deallocate\n");
    36c0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    36c4:	e3403000 	movt	r3, #0
    36c8:	e5933000 	ldr	r3, [r3]
    36cc:	e1a00003 	mov	r0, r3
    36d0:	e306182c 	movw	r1, #26668	; 0x682c
    36d4:	e3401000 	movt	r1, #0
    36d8:	eb00056e 	bl	4c98 <printf>
        exit();
    36dc:	eb000455 	bl	4838 <exit>
    }
    c = sbrk(0);
    36e0:	e3a00000 	mov	r0, #0
    36e4:	eb0004ec 	bl	4a9c <sbrk>
    36e8:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    if(c != a - 4096){
    36ec:	e51b3010 	ldr	r3, [fp, #-16]
    36f0:	e2432a01 	sub	r2, r3, #4096	; 0x1000
    36f4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    36f8:	e1520003 	cmp	r2, r3
    36fc:	0a000009 	beq	3728 <sbrktest+0x260>
        printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3700:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3704:	e3403000 	movt	r3, #0
    3708:	e5933000 	ldr	r3, [r3]
    370c:	e1a00003 	mov	r0, r3
    3710:	e3061848 	movw	r1, #26696	; 0x6848
    3714:	e3401000 	movt	r1, #0
    3718:	e51b2010 	ldr	r2, [fp, #-16]
    371c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3720:	eb00055c 	bl	4c98 <printf>
        exit();
    3724:	eb000443 	bl	4838 <exit>
    }

    // can one re-allocate that page?
    a = sbrk(0);
    3728:	e3a00000 	mov	r0, #0
    372c:	eb0004da 	bl	4a9c <sbrk>
    3730:	e50b0010 	str	r0, [fp, #-16]
    c = sbrk(4096);
    3734:	e3a00a01 	mov	r0, #4096	; 0x1000
    3738:	eb0004d7 	bl	4a9c <sbrk>
    373c:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    if(c != a || sbrk(0) != a + 4096){
    3740:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    3744:	e51b3010 	ldr	r3, [fp, #-16]
    3748:	e1520003 	cmp	r2, r3
    374c:	1a000006 	bne	376c <sbrktest+0x2a4>
    3750:	e3a00000 	mov	r0, #0
    3754:	eb0004d0 	bl	4a9c <sbrk>
    3758:	e1a02000 	mov	r2, r0
    375c:	e51b3010 	ldr	r3, [fp, #-16]
    3760:	e2833a01 	add	r3, r3, #4096	; 0x1000
    3764:	e1520003 	cmp	r2, r3
    3768:	0a000009 	beq	3794 <sbrktest+0x2cc>
        printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    376c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3770:	e3403000 	movt	r3, #0
    3774:	e5933000 	ldr	r3, [r3]
    3778:	e1a00003 	mov	r0, r3
    377c:	e3061880 	movw	r1, #26752	; 0x6880
    3780:	e3401000 	movt	r1, #0
    3784:	e51b2010 	ldr	r2, [fp, #-16]
    3788:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    378c:	eb000541 	bl	4c98 <printf>
        exit();
    3790:	eb000428 	bl	4838 <exit>
    }
    if(*lastaddr == 99){
    3794:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    3798:	e5d33000 	ldrb	r3, [r3]
    379c:	e3530063 	cmp	r3, #99	; 0x63
    37a0:	1a000007 	bne	37c4 <sbrktest+0x2fc>
        // should be zero
        printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    37a4:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    37a8:	e3403000 	movt	r3, #0
    37ac:	e5933000 	ldr	r3, [r3]
    37b0:	e1a00003 	mov	r0, r3
    37b4:	e30618a8 	movw	r1, #26792	; 0x68a8
    37b8:	e3401000 	movt	r1, #0
    37bc:	eb000535 	bl	4c98 <printf>
        exit();
    37c0:	eb00041c 	bl	4838 <exit>
    }

    a = sbrk(0);
    37c4:	e3a00000 	mov	r0, #0
    37c8:	eb0004b3 	bl	4a9c <sbrk>
    37cc:	e50b0010 	str	r0, [fp, #-16]
    c = sbrk(-(sbrk(0) - oldbrk));
    37d0:	e51b4018 	ldr	r4, [fp, #-24]	; 0xffffffe8
    37d4:	e3a00000 	mov	r0, #0
    37d8:	eb0004af 	bl	4a9c <sbrk>
    37dc:	e1a03000 	mov	r3, r0
    37e0:	e0633004 	rsb	r3, r3, r4
    37e4:	e1a00003 	mov	r0, r3
    37e8:	eb0004ab 	bl	4a9c <sbrk>
    37ec:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    if(c != a){
    37f0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    37f4:	e51b3010 	ldr	r3, [fp, #-16]
    37f8:	e1520003 	cmp	r2, r3
    37fc:	0a000009 	beq	3828 <sbrktest+0x360>
        printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3800:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3804:	e3403000 	movt	r3, #0
    3808:	e5933000 	ldr	r3, [r3]
    380c:	e1a00003 	mov	r0, r3
    3810:	e30618d8 	movw	r1, #26840	; 0x68d8
    3814:	e3401000 	movt	r1, #0
    3818:	e51b2010 	ldr	r2, [fp, #-16]
    381c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3820:	eb00051c 	bl	4c98 <printf>
        exit();
    3824:	eb000403 	bl	4838 <exit>
    }

    // can we read the kernel's memory?
    for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3828:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
    382c:	e50b3010 	str	r3, [fp, #-16]
    3830:	ea000023 	b	38c4 <sbrktest+0x3fc>
        ppid = getpid();
    3834:	eb00048f 	bl	4a78 <getpid>
    3838:	e50b0034 	str	r0, [fp, #-52]	; 0xffffffcc
        pid = fork();
    383c:	eb0003f4 	bl	4814 <fork>
    3840:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
        if(pid < 0){
    3844:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    3848:	e3530000 	cmp	r3, #0
    384c:	aa000007 	bge	3870 <sbrktest+0x3a8>
            printf(stdout, "fork failed\n");
    3850:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3854:	e3403000 	movt	r3, #0
    3858:	e5933000 	ldr	r3, [r3]
    385c:	e1a00003 	mov	r0, r3
    3860:	e30517a8 	movw	r1, #22440	; 0x57a8
    3864:	e3401000 	movt	r1, #0
    3868:	eb00050a 	bl	4c98 <printf>
            exit();
    386c:	eb0003f1 	bl	4838 <exit>
        }
        if(pid == 0){
    3870:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    3874:	e3530000 	cmp	r3, #0
    3878:	1a00000c 	bne	38b0 <sbrktest+0x3e8>
            printf(stdout, "oops could read %x = %x\n", a, *a);
    387c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3880:	e3403000 	movt	r3, #0
    3884:	e5932000 	ldr	r2, [r3]
    3888:	e51b3010 	ldr	r3, [fp, #-16]
    388c:	e5d33000 	ldrb	r3, [r3]
    3890:	e1a00002 	mov	r0, r2
    3894:	e30618fc 	movw	r1, #26876	; 0x68fc
    3898:	e3401000 	movt	r1, #0
    389c:	e51b2010 	ldr	r2, [fp, #-16]
    38a0:	eb0004fc 	bl	4c98 <printf>
            kill(ppid);
    38a4:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    38a8:	eb000418 	bl	4910 <kill>
            exit();
    38ac:	eb0003e1 	bl	4838 <exit>
        }
        wait();
    38b0:	eb0003e9 	bl	485c <wait>
        printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
        exit();
    }

    // can we read the kernel's memory?
    for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    38b4:	e51b3010 	ldr	r3, [fp, #-16]
    38b8:	e2833cc3 	add	r3, r3, #49920	; 0xc300
    38bc:	e2833050 	add	r3, r3, #80	; 0x50
    38c0:	e50b3010 	str	r3, [fp, #-16]
    38c4:	e51b2010 	ldr	r2, [fp, #-16]
    38c8:	e308347f 	movw	r3, #33919	; 0x847f
    38cc:	e348301e 	movt	r3, #32798	; 0x801e
    38d0:	e1520003 	cmp	r2, r3
    38d4:	9affffd6 	bls	3834 <sbrktest+0x36c>
        wait();
    }

    // if we run the system out of memory, does it clean up the last
    // failed allocation?
    if(pipe(fds) != 0){
    38d8:	e24b303c 	sub	r3, fp, #60	; 0x3c
    38dc:	e1a00003 	mov	r0, r3
    38e0:	eb0003e6 	bl	4880 <pipe>
    38e4:	e1a03000 	mov	r3, r0
    38e8:	e3530000 	cmp	r3, #0
    38ec:	0a000004 	beq	3904 <sbrktest+0x43c>
        printf(1, "pipe() failed\n");
    38f0:	e3a00001 	mov	r0, #1
    38f4:	e30516e8 	movw	r1, #22248	; 0x56e8
    38f8:	e3401000 	movt	r1, #0
    38fc:	eb0004e5 	bl	4c98 <printf>
        exit();
    3900:	eb0003cc 	bl	4838 <exit>
    }
    for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3904:	e3a03000 	mov	r3, #0
    3908:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    390c:	ea000035 	b	39e8 <sbrktest+0x520>
        if((pids[i] = fork()) == 0){
    3910:	eb0003bf 	bl	4814 <fork>
    3914:	e1a02000 	mov	r2, r0
    3918:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    391c:	e3e00057 	mvn	r0, #87	; 0x57
    3920:	e1a03103 	lsl	r3, r3, #2
    3924:	e24bc00c 	sub	ip, fp, #12
    3928:	e08c1003 	add	r1, ip, r3
    392c:	e1a03000 	mov	r3, r0
    3930:	e0813003 	add	r3, r1, r3
    3934:	e5832000 	str	r2, [r3]
    3938:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    393c:	e3e01057 	mvn	r1, #87	; 0x57
    3940:	e1a03103 	lsl	r3, r3, #2
    3944:	e24b000c 	sub	r0, fp, #12
    3948:	e0802003 	add	r2, r0, r3
    394c:	e1a03001 	mov	r3, r1
    3950:	e0823003 	add	r3, r2, r3
    3954:	e5933000 	ldr	r3, [r3]
    3958:	e3530000 	cmp	r3, #0
    395c:	1a00000e 	bne	399c <sbrktest+0x4d4>
            // allocate a lot of memory
            sbrk(BIG - (uint)sbrk(0));
    3960:	e3a00000 	mov	r0, #0
    3964:	eb00044c 	bl	4a9c <sbrk>
    3968:	e1a03000 	mov	r3, r0
    396c:	e2633519 	rsb	r3, r3, #104857600	; 0x6400000
    3970:	e1a00003 	mov	r0, r3
    3974:	eb000448 	bl	4a9c <sbrk>
            write(fds[1], "x", 1);
    3978:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    397c:	e1a00003 	mov	r0, r3
    3980:	e3051758 	movw	r1, #22360	; 0x5758
    3984:	e3401000 	movt	r1, #0
    3988:	e3a02001 	mov	r2, #1
    398c:	eb0003cd 	bl	48c8 <write>
            // sit around until killed
            for(;;) sleep(1000);
    3990:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    3994:	eb000449 	bl	4ac0 <sleep>
    3998:	eafffffc 	b	3990 <sbrktest+0x4c8>
        }
        if(pids[i] != -1)
    399c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    39a0:	e3e01057 	mvn	r1, #87	; 0x57
    39a4:	e1a03103 	lsl	r3, r3, #2
    39a8:	e24bc00c 	sub	ip, fp, #12
    39ac:	e08c2003 	add	r2, ip, r3
    39b0:	e1a03001 	mov	r3, r1
    39b4:	e0823003 	add	r3, r2, r3
    39b8:	e5933000 	ldr	r3, [r3]
    39bc:	e3730001 	cmn	r3, #1
    39c0:	0a000005 	beq	39dc <sbrktest+0x514>
            read(fds[0], &scratch, 1);
    39c4:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    39c8:	e1a00003 	mov	r0, r3
    39cc:	e24b3065 	sub	r3, fp, #101	; 0x65
    39d0:	e1a01003 	mov	r1, r3
    39d4:	e3a02001 	mov	r2, #1
    39d8:	eb0003b1 	bl	48a4 <read>
    // failed allocation?
    if(pipe(fds) != 0){
        printf(1, "pipe() failed\n");
        exit();
    }
    for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    39dc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    39e0:	e2833001 	add	r3, r3, #1
    39e4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    39e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    39ec:	e3530009 	cmp	r3, #9
    39f0:	9affffc6 	bls	3910 <sbrktest+0x448>
        if(pids[i] != -1)
            read(fds[0], &scratch, 1);
    }
    // if those failed allocations freed up the pages they did allocate,
    // we'll be able to allocate here
    c = sbrk(4096);
    39f4:	e3a00a01 	mov	r0, #4096	; 0x1000
    39f8:	eb000427 	bl	4a9c <sbrk>
    39fc:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3a00:	e3a03000 	mov	r3, #0
    3a04:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    3a08:	ea000019 	b	3a74 <sbrktest+0x5ac>
        if(pids[i] == -1)
    3a0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3a10:	e3e01057 	mvn	r1, #87	; 0x57
    3a14:	e1a03103 	lsl	r3, r3, #2
    3a18:	e24b000c 	sub	r0, fp, #12
    3a1c:	e0802003 	add	r2, r0, r3
    3a20:	e1a03001 	mov	r3, r1
    3a24:	e0823003 	add	r3, r2, r3
    3a28:	e5933000 	ldr	r3, [r3]
    3a2c:	e3730001 	cmn	r3, #1
    3a30:	0a00000b 	beq	3a64 <sbrktest+0x59c>
            continue;
        kill(pids[i]);
    3a34:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3a38:	e3e01057 	mvn	r1, #87	; 0x57
    3a3c:	e1a03103 	lsl	r3, r3, #2
    3a40:	e24bc00c 	sub	ip, fp, #12
    3a44:	e08c2003 	add	r2, ip, r3
    3a48:	e1a03001 	mov	r3, r1
    3a4c:	e0823003 	add	r3, r2, r3
    3a50:	e5933000 	ldr	r3, [r3]
    3a54:	e1a00003 	mov	r0, r3
    3a58:	eb0003ac 	bl	4910 <kill>
        wait();
    3a5c:	eb00037e 	bl	485c <wait>
    3a60:	ea000000 	b	3a68 <sbrktest+0x5a0>
    // if those failed allocations freed up the pages they did allocate,
    // we'll be able to allocate here
    c = sbrk(4096);
    for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
        if(pids[i] == -1)
            continue;
    3a64:	e1a00000 	nop			; (mov r0, r0)
            read(fds[0], &scratch, 1);
    }
    // if those failed allocations freed up the pages they did allocate,
    // we'll be able to allocate here
    c = sbrk(4096);
    for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3a68:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3a6c:	e2833001 	add	r3, r3, #1
    3a70:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    3a74:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3a78:	e3530009 	cmp	r3, #9
    3a7c:	9affffe2 	bls	3a0c <sbrktest+0x544>
        if(pids[i] == -1)
            continue;
        kill(pids[i]);
        wait();
    }
    if(c == (char*)0xffffffff){
    3a80:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3a84:	e3730001 	cmn	r3, #1
    3a88:	1a000007 	bne	3aac <sbrktest+0x5e4>
        printf(stdout, "failed sbrk leaked memory\n");
    3a8c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3a90:	e3403000 	movt	r3, #0
    3a94:	e5933000 	ldr	r3, [r3]
    3a98:	e1a00003 	mov	r0, r3
    3a9c:	e3061918 	movw	r1, #26904	; 0x6918
    3aa0:	e3401000 	movt	r1, #0
    3aa4:	eb00047b 	bl	4c98 <printf>
        exit();
    3aa8:	eb000362 	bl	4838 <exit>
    }

    if(sbrk(0) > oldbrk)
    3aac:	e3a00000 	mov	r0, #0
    3ab0:	eb0003f9 	bl	4a9c <sbrk>
    3ab4:	e1a02000 	mov	r2, r0
    3ab8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3abc:	e1520003 	cmp	r2, r3
    3ac0:	9a000006 	bls	3ae0 <sbrktest+0x618>
        sbrk(-(sbrk(0) - oldbrk));
    3ac4:	e51b4018 	ldr	r4, [fp, #-24]	; 0xffffffe8
    3ac8:	e3a00000 	mov	r0, #0
    3acc:	eb0003f2 	bl	4a9c <sbrk>
    3ad0:	e1a03000 	mov	r3, r0
    3ad4:	e0633004 	rsb	r3, r3, r4
    3ad8:	e1a00003 	mov	r0, r3
    3adc:	eb0003ee 	bl	4a9c <sbrk>

    printf(stdout, "sbrk test OK\n");
    3ae0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3ae4:	e3403000 	movt	r3, #0
    3ae8:	e5933000 	ldr	r3, [r3]
    3aec:	e1a00003 	mov	r0, r3
    3af0:	e3061934 	movw	r1, #26932	; 0x6934
    3af4:	e3401000 	movt	r1, #0
    3af8:	eb000466 	bl	4c98 <printf>
}
    3afc:	e24bd008 	sub	sp, fp, #8
    3b00:	e8bd8810 	pop	{r4, fp, pc}

00003b04 <validateint>:

void
validateint(int *p)
{
    3b04:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3b08:	e28db000 	add	fp, sp, #0
    3b0c:	e24dd00c 	sub	sp, sp, #12
    3b10:	e50b0008 	str	r0, [fp, #-8]
}
    3b14:	e28bd000 	add	sp, fp, #0
    3b18:	e8bd0800 	pop	{fp}
    3b1c:	e12fff1e 	bx	lr

00003b20 <validatetest>:

void
validatetest(void)
{
    3b20:	e92d4800 	push	{fp, lr}
    3b24:	e28db004 	add	fp, sp, #4
    3b28:	e24dd010 	sub	sp, sp, #16
    int hi, pid;
    uint p;

    printf(stdout, "validate test\n");
    3b2c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3b30:	e3403000 	movt	r3, #0
    3b34:	e5933000 	ldr	r3, [r3]
    3b38:	e1a00003 	mov	r0, r3
    3b3c:	e3061944 	movw	r1, #26948	; 0x6944
    3b40:	e3401000 	movt	r1, #0
    3b44:	eb000453 	bl	4c98 <printf>
    hi = 1100*1024;
    3b48:	e3a03a03 	mov	r3, #12288	; 0x3000
    3b4c:	e3403011 	movt	r3, #17
    3b50:	e50b300c 	str	r3, [fp, #-12]

    for(p = 0; p <= (uint)hi; p += 4096){
    3b54:	e3a03000 	mov	r3, #0
    3b58:	e50b3008 	str	r3, [fp, #-8]
    3b5c:	ea000022 	b	3bec <validatetest+0xcc>
        if((pid = fork()) == 0){
    3b60:	eb00032b 	bl	4814 <fork>
    3b64:	e50b0010 	str	r0, [fp, #-16]
    3b68:	e51b3010 	ldr	r3, [fp, #-16]
    3b6c:	e3530000 	cmp	r3, #0
    3b70:	1a000003 	bne	3b84 <validatetest+0x64>
            // try to crash the kernel by passing in a badly placed integer
            validateint((int*)p);
    3b74:	e51b3008 	ldr	r3, [fp, #-8]
    3b78:	e1a00003 	mov	r0, r3
    3b7c:	ebffffe0 	bl	3b04 <validateint>
            exit();
    3b80:	eb00032c 	bl	4838 <exit>
        }
        sleep(0);
    3b84:	e3a00000 	mov	r0, #0
    3b88:	eb0003cc 	bl	4ac0 <sleep>
        sleep(0);
    3b8c:	e3a00000 	mov	r0, #0
    3b90:	eb0003ca 	bl	4ac0 <sleep>
        kill(pid);
    3b94:	e51b0010 	ldr	r0, [fp, #-16]
    3b98:	eb00035c 	bl	4910 <kill>
        wait();
    3b9c:	eb00032e 	bl	485c <wait>

        // try to crash the kernel by passing in a bad string pointer
        if(link("nosuchfile", (char*)p) != -1){
    3ba0:	e51b3008 	ldr	r3, [fp, #-8]
    3ba4:	e3060954 	movw	r0, #26964	; 0x6954
    3ba8:	e3400000 	movt	r0, #0
    3bac:	e1a01003 	mov	r1, r3
    3bb0:	eb00038c 	bl	49e8 <link>
    3bb4:	e1a03000 	mov	r3, r0
    3bb8:	e3730001 	cmn	r3, #1
    3bbc:	0a000007 	beq	3be0 <validatetest+0xc0>
            printf(stdout, "link should not succeed\n");
    3bc0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3bc4:	e3403000 	movt	r3, #0
    3bc8:	e5933000 	ldr	r3, [r3]
    3bcc:	e1a00003 	mov	r0, r3
    3bd0:	e3061960 	movw	r1, #26976	; 0x6960
    3bd4:	e3401000 	movt	r1, #0
    3bd8:	eb00042e 	bl	4c98 <printf>
            exit();
    3bdc:	eb000315 	bl	4838 <exit>
    uint p;

    printf(stdout, "validate test\n");
    hi = 1100*1024;

    for(p = 0; p <= (uint)hi; p += 4096){
    3be0:	e51b3008 	ldr	r3, [fp, #-8]
    3be4:	e2833a01 	add	r3, r3, #4096	; 0x1000
    3be8:	e50b3008 	str	r3, [fp, #-8]
    3bec:	e51b200c 	ldr	r2, [fp, #-12]
    3bf0:	e51b3008 	ldr	r3, [fp, #-8]
    3bf4:	e1520003 	cmp	r2, r3
    3bf8:	2affffd8 	bcs	3b60 <validatetest+0x40>
            printf(stdout, "link should not succeed\n");
            exit();
        }
    }

    printf(stdout, "validate ok\n");
    3bfc:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3c00:	e3403000 	movt	r3, #0
    3c04:	e5933000 	ldr	r3, [r3]
    3c08:	e1a00003 	mov	r0, r3
    3c0c:	e306197c 	movw	r1, #27004	; 0x697c
    3c10:	e3401000 	movt	r1, #0
    3c14:	eb00041f 	bl	4c98 <printf>
}
    3c18:	e24bd004 	sub	sp, fp, #4
    3c1c:	e8bd8800 	pop	{fp, pc}

00003c20 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3c20:	e92d4800 	push	{fp, lr}
    3c24:	e28db004 	add	fp, sp, #4
    3c28:	e24dd008 	sub	sp, sp, #8
    int i;

    printf(stdout, "bss test\n");
    3c2c:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3c30:	e3403000 	movt	r3, #0
    3c34:	e5933000 	ldr	r3, [r3]
    3c38:	e1a00003 	mov	r0, r3
    3c3c:	e306198c 	movw	r1, #27020	; 0x698c
    3c40:	e3401000 	movt	r1, #0
    3c44:	eb000413 	bl	4c98 <printf>
    for(i = 0; i < sizeof(uninit); i++){
    3c48:	e3a03000 	mov	r3, #0
    3c4c:	e50b3008 	str	r3, [fp, #-8]
    3c50:	ea000011 	b	3c9c <bsstest+0x7c>
        if(uninit[i] != '\0'){
    3c54:	e3063c64 	movw	r3, #27748	; 0x6c64
    3c58:	e3403000 	movt	r3, #0
    3c5c:	e51b2008 	ldr	r2, [fp, #-8]
    3c60:	e0833002 	add	r3, r3, r2
    3c64:	e5d33000 	ldrb	r3, [r3]
    3c68:	e3530000 	cmp	r3, #0
    3c6c:	0a000007 	beq	3c90 <bsstest+0x70>
            printf(stdout, "bss test failed\n");
    3c70:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3c74:	e3403000 	movt	r3, #0
    3c78:	e5933000 	ldr	r3, [r3]
    3c7c:	e1a00003 	mov	r0, r3
    3c80:	e3061998 	movw	r1, #27032	; 0x6998
    3c84:	e3401000 	movt	r1, #0
    3c88:	eb000402 	bl	4c98 <printf>
            exit();
    3c8c:	eb0002e9 	bl	4838 <exit>
bsstest(void)
{
    int i;

    printf(stdout, "bss test\n");
    for(i = 0; i < sizeof(uninit); i++){
    3c90:	e51b3008 	ldr	r3, [fp, #-8]
    3c94:	e2833001 	add	r3, r3, #1
    3c98:	e50b3008 	str	r3, [fp, #-8]
    3c9c:	e51b2008 	ldr	r2, [fp, #-8]
    3ca0:	e302370f 	movw	r3, #9999	; 0x270f
    3ca4:	e1520003 	cmp	r2, r3
    3ca8:	9affffe9 	bls	3c54 <bsstest+0x34>
        if(uninit[i] != '\0'){
            printf(stdout, "bss test failed\n");
            exit();
        }
    }
    printf(stdout, "bss test ok\n");
    3cac:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3cb0:	e3403000 	movt	r3, #0
    3cb4:	e5933000 	ldr	r3, [r3]
    3cb8:	e1a00003 	mov	r0, r3
    3cbc:	e30619ac 	movw	r1, #27052	; 0x69ac
    3cc0:	e3401000 	movt	r1, #0
    3cc4:	eb0003f3 	bl	4c98 <printf>
}
    3cc8:	e24bd004 	sub	sp, fp, #4
    3ccc:	e8bd8800 	pop	{fp, pc}

00003cd0 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3cd0:	e92d4800 	push	{fp, lr}
    3cd4:	e28db004 	add	fp, sp, #4
    3cd8:	e24dd010 	sub	sp, sp, #16
    int pid, fd;

    unlink("bigarg-ok");
    3cdc:	e30609bc 	movw	r0, #27068	; 0x69bc
    3ce0:	e3400000 	movt	r0, #0
    3ce4:	eb00032d 	bl	49a0 <unlink>
    pid = fork();
    3ce8:	eb0002c9 	bl	4814 <fork>
    3cec:	e50b000c 	str	r0, [fp, #-12]
    if(pid == 0){
    3cf0:	e51b300c 	ldr	r3, [fp, #-12]
    3cf4:	e3530000 	cmp	r3, #0
    3cf8:	1a00002d 	bne	3db4 <bigargtest+0xe4>
        static char *args[MAXARG];
        int i;
        for(i = 0; i < MAXARG-1; i++)
    3cfc:	e3a03000 	mov	r3, #0
    3d00:	e50b3008 	str	r3, [fp, #-8]
    3d04:	ea000008 	b	3d2c <bigargtest+0x5c>
            args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3d08:	e3063bd8 	movw	r3, #27608	; 0x6bd8
    3d0c:	e3403000 	movt	r3, #0
    3d10:	e51b1008 	ldr	r1, [fp, #-8]
    3d14:	e30629c8 	movw	r2, #27080	; 0x69c8
    3d18:	e3402000 	movt	r2, #0
    3d1c:	e7832101 	str	r2, [r3, r1, lsl #2]
    unlink("bigarg-ok");
    pid = fork();
    if(pid == 0){
        static char *args[MAXARG];
        int i;
        for(i = 0; i < MAXARG-1; i++)
    3d20:	e51b3008 	ldr	r3, [fp, #-8]
    3d24:	e2833001 	add	r3, r3, #1
    3d28:	e50b3008 	str	r3, [fp, #-8]
    3d2c:	e51b3008 	ldr	r3, [fp, #-8]
    3d30:	e353001e 	cmp	r3, #30
    3d34:	dafffff3 	ble	3d08 <bigargtest+0x38>
            args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
        args[MAXARG-1] = 0;
    3d38:	e3063bd8 	movw	r3, #27608	; 0x6bd8
    3d3c:	e3403000 	movt	r3, #0
    3d40:	e3a02000 	mov	r2, #0
    3d44:	e583207c 	str	r2, [r3, #124]	; 0x7c
        printf(stdout, "bigarg test\n");
    3d48:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3d4c:	e3403000 	movt	r3, #0
    3d50:	e5933000 	ldr	r3, [r3]
    3d54:	e1a00003 	mov	r0, r3
    3d58:	e3061aa8 	movw	r1, #27304	; 0x6aa8
    3d5c:	e3401000 	movt	r1, #0
    3d60:	eb0003cc 	bl	4c98 <printf>
        exec("echo", args);
    3d64:	e3050370 	movw	r0, #21360	; 0x5370
    3d68:	e3400000 	movt	r0, #0
    3d6c:	e3061bd8 	movw	r1, #27608	; 0x6bd8
    3d70:	e3401000 	movt	r1, #0
    3d74:	eb0002ee 	bl	4934 <exec>
        printf(stdout, "bigarg test ok\n");
    3d78:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3d7c:	e3403000 	movt	r3, #0
    3d80:	e5933000 	ldr	r3, [r3]
    3d84:	e1a00003 	mov	r0, r3
    3d88:	e3061ab8 	movw	r1, #27320	; 0x6ab8
    3d8c:	e3401000 	movt	r1, #0
    3d90:	eb0003c0 	bl	4c98 <printf>
        fd = open("bigarg-ok", O_CREATE);
    3d94:	e30609bc 	movw	r0, #27068	; 0x69bc
    3d98:	e3400000 	movt	r0, #0
    3d9c:	e3a01c02 	mov	r1, #512	; 0x200
    3da0:	eb0002ec 	bl	4958 <open>
    3da4:	e50b0010 	str	r0, [fp, #-16]
        close(fd);
    3da8:	e51b0010 	ldr	r0, [fp, #-16]
    3dac:	eb0002ce 	bl	48ec <close>
        exit();
    3db0:	eb0002a0 	bl	4838 <exit>
    } else if(pid < 0){
    3db4:	e51b300c 	ldr	r3, [fp, #-12]
    3db8:	e3530000 	cmp	r3, #0
    3dbc:	aa000007 	bge	3de0 <bigargtest+0x110>
        printf(stdout, "bigargtest: fork failed\n");
    3dc0:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3dc4:	e3403000 	movt	r3, #0
    3dc8:	e5933000 	ldr	r3, [r3]
    3dcc:	e1a00003 	mov	r0, r3
    3dd0:	e3061ac8 	movw	r1, #27336	; 0x6ac8
    3dd4:	e3401000 	movt	r1, #0
    3dd8:	eb0003ae 	bl	4c98 <printf>
        exit();
    3ddc:	eb000295 	bl	4838 <exit>
    }
    wait();
    3de0:	eb00029d 	bl	485c <wait>
    fd = open("bigarg-ok", 0);
    3de4:	e30609bc 	movw	r0, #27068	; 0x69bc
    3de8:	e3400000 	movt	r0, #0
    3dec:	e3a01000 	mov	r1, #0
    3df0:	eb0002d8 	bl	4958 <open>
    3df4:	e50b0010 	str	r0, [fp, #-16]
    if(fd < 0){
    3df8:	e51b3010 	ldr	r3, [fp, #-16]
    3dfc:	e3530000 	cmp	r3, #0
    3e00:	aa000007 	bge	3e24 <bigargtest+0x154>
        printf(stdout, "bigarg test failed!\n");
    3e04:	e3063bbc 	movw	r3, #27580	; 0x6bbc
    3e08:	e3403000 	movt	r3, #0
    3e0c:	e5933000 	ldr	r3, [r3]
    3e10:	e1a00003 	mov	r0, r3
    3e14:	e3061ae4 	movw	r1, #27364	; 0x6ae4
    3e18:	e3401000 	movt	r1, #0
    3e1c:	eb00039d 	bl	4c98 <printf>
        exit();
    3e20:	eb000284 	bl	4838 <exit>
    }
    close(fd);
    3e24:	e51b0010 	ldr	r0, [fp, #-16]
    3e28:	eb0002af 	bl	48ec <close>
    unlink("bigarg-ok");
    3e2c:	e30609bc 	movw	r0, #27068	; 0x69bc
    3e30:	e3400000 	movt	r0, #0
    3e34:	eb0002d9 	bl	49a0 <unlink>
}
    3e38:	e24bd004 	sub	sp, fp, #4
    3e3c:	e8bd8800 	pop	{fp, pc}

00003e40 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3e40:	e92d4800 	push	{fp, lr}
    3e44:	e28db004 	add	fp, sp, #4
    3e48:	e24dd058 	sub	sp, sp, #88	; 0x58
    int nfiles;
    int fsblocks = 0;
    3e4c:	e3a03000 	mov	r3, #0
    3e50:	e50b300c 	str	r3, [fp, #-12]

    printf(1, "fsfull test\n");
    3e54:	e3a00001 	mov	r0, #1
    3e58:	e3061afc 	movw	r1, #27388	; 0x6afc
    3e5c:	e3401000 	movt	r1, #0
    3e60:	eb00038c 	bl	4c98 <printf>

    for(nfiles = 0; ; nfiles++){
    3e64:	e3a03000 	mov	r3, #0
    3e68:	e50b3008 	str	r3, [fp, #-8]
        char name[64];
        name[0] = 'f';
    3e6c:	e3a03066 	mov	r3, #102	; 0x66
    3e70:	e54b3058 	strb	r3, [fp, #-88]	; 0xffffffa8
        name[1] = '0' + nfiles / 1000;
    3e74:	e51b2008 	ldr	r2, [fp, #-8]
    3e78:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    3e7c:	e3413062 	movt	r3, #4194	; 0x1062
    3e80:	e0c31293 	smull	r1, r3, r3, r2
    3e84:	e1a01343 	asr	r1, r3, #6
    3e88:	e1a03fc2 	asr	r3, r2, #31
    3e8c:	e0633001 	rsb	r3, r3, r1
    3e90:	e6ef3073 	uxtb	r3, r3
    3e94:	e2833030 	add	r3, r3, #48	; 0x30
    3e98:	e6ef3073 	uxtb	r3, r3
    3e9c:	e54b3057 	strb	r3, [fp, #-87]	; 0xffffffa9
        name[2] = '0' + (nfiles % 1000) / 100;
    3ea0:	e51b2008 	ldr	r2, [fp, #-8]
    3ea4:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    3ea8:	e3413062 	movt	r3, #4194	; 0x1062
    3eac:	e0c31293 	smull	r1, r3, r3, r2
    3eb0:	e1a01343 	asr	r1, r3, #6
    3eb4:	e1a03fc2 	asr	r3, r2, #31
    3eb8:	e0633001 	rsb	r3, r3, r1
    3ebc:	e3a01ffa 	mov	r1, #1000	; 0x3e8
    3ec0:	e0030391 	mul	r3, r1, r3
    3ec4:	e0633002 	rsb	r3, r3, r2
    3ec8:	e308251f 	movw	r2, #34079	; 0x851f
    3ecc:	e34521eb 	movt	r2, #20971	; 0x51eb
    3ed0:	e0c21392 	smull	r1, r2, r2, r3
    3ed4:	e1a022c2 	asr	r2, r2, #5
    3ed8:	e1a03fc3 	asr	r3, r3, #31
    3edc:	e0633002 	rsb	r3, r3, r2
    3ee0:	e6ef3073 	uxtb	r3, r3
    3ee4:	e2833030 	add	r3, r3, #48	; 0x30
    3ee8:	e6ef3073 	uxtb	r3, r3
    3eec:	e54b3056 	strb	r3, [fp, #-86]	; 0xffffffaa
        name[3] = '0' + (nfiles % 100) / 10;
    3ef0:	e51b2008 	ldr	r2, [fp, #-8]
    3ef4:	e308351f 	movw	r3, #34079	; 0x851f
    3ef8:	e34531eb 	movt	r3, #20971	; 0x51eb
    3efc:	e0c31293 	smull	r1, r3, r3, r2
    3f00:	e1a012c3 	asr	r1, r3, #5
    3f04:	e1a03fc2 	asr	r3, r2, #31
    3f08:	e0633001 	rsb	r3, r3, r1
    3f0c:	e3a01064 	mov	r1, #100	; 0x64
    3f10:	e0030391 	mul	r3, r1, r3
    3f14:	e0633002 	rsb	r3, r3, r2
    3f18:	e3062667 	movw	r2, #26215	; 0x6667
    3f1c:	e3462666 	movt	r2, #26214	; 0x6666
    3f20:	e0c21392 	smull	r1, r2, r2, r3
    3f24:	e1a02142 	asr	r2, r2, #2
    3f28:	e1a03fc3 	asr	r3, r3, #31
    3f2c:	e0633002 	rsb	r3, r3, r2
    3f30:	e6ef3073 	uxtb	r3, r3
    3f34:	e2833030 	add	r3, r3, #48	; 0x30
    3f38:	e6ef3073 	uxtb	r3, r3
    3f3c:	e54b3055 	strb	r3, [fp, #-85]	; 0xffffffab
        name[4] = '0' + (nfiles % 10);
    3f40:	e51b1008 	ldr	r1, [fp, #-8]
    3f44:	e3063667 	movw	r3, #26215	; 0x6667
    3f48:	e3463666 	movt	r3, #26214	; 0x6666
    3f4c:	e0c32193 	smull	r2, r3, r3, r1
    3f50:	e1a02143 	asr	r2, r3, #2
    3f54:	e1a03fc1 	asr	r3, r1, #31
    3f58:	e0632002 	rsb	r2, r3, r2
    3f5c:	e1a03002 	mov	r3, r2
    3f60:	e1a03103 	lsl	r3, r3, #2
    3f64:	e0833002 	add	r3, r3, r2
    3f68:	e1a03083 	lsl	r3, r3, #1
    3f6c:	e0632001 	rsb	r2, r3, r1
    3f70:	e6ef3072 	uxtb	r3, r2
    3f74:	e2833030 	add	r3, r3, #48	; 0x30
    3f78:	e6ef3073 	uxtb	r3, r3
    3f7c:	e54b3054 	strb	r3, [fp, #-84]	; 0xffffffac
        name[5] = '\0';
    3f80:	e3a03000 	mov	r3, #0
    3f84:	e54b3053 	strb	r3, [fp, #-83]	; 0xffffffad
        printf(1, "writing %s\n", name);
    3f88:	e3a00001 	mov	r0, #1
    3f8c:	e3061b0c 	movw	r1, #27404	; 0x6b0c
    3f90:	e3401000 	movt	r1, #0
    3f94:	e24b3058 	sub	r3, fp, #88	; 0x58
    3f98:	e1a02003 	mov	r2, r3
    3f9c:	eb00033d 	bl	4c98 <printf>
        int fd = open(name, O_CREATE|O_RDWR);
    3fa0:	e24b3058 	sub	r3, fp, #88	; 0x58
    3fa4:	e1a00003 	mov	r0, r3
    3fa8:	e3001202 	movw	r1, #514	; 0x202
    3fac:	eb000269 	bl	4958 <open>
    3fb0:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
        if(fd < 0){
    3fb4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3fb8:	e3530000 	cmp	r3, #0
    3fbc:	aa000006 	bge	3fdc <fsfull+0x19c>
            printf(1, "open %s failed\n", name);
    3fc0:	e3a00001 	mov	r0, #1
    3fc4:	e3061b18 	movw	r1, #27416	; 0x6b18
    3fc8:	e3401000 	movt	r1, #0
    3fcc:	e24b3058 	sub	r3, fp, #88	; 0x58
    3fd0:	e1a02003 	mov	r2, r3
    3fd4:	eb00032f 	bl	4c98 <printf>
            break;
    3fd8:	ea000023 	b	406c <fsfull+0x22c>
        }
        int total = 0;
    3fdc:	e3a03000 	mov	r3, #0
    3fe0:	e50b3010 	str	r3, [fp, #-16]
        while(1){
            int cc = write(fd, buf, 512);
    3fe4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    3fe8:	e3091374 	movw	r1, #37748	; 0x9374
    3fec:	e3401000 	movt	r1, #0
    3ff0:	e3a02c02 	mov	r2, #512	; 0x200
    3ff4:	eb000233 	bl	48c8 <write>
    3ff8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
            if(cc < 512)
    3ffc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    4000:	e30031ff 	movw	r3, #511	; 0x1ff
    4004:	e1520003 	cmp	r2, r3
    4008:	da000007 	ble	402c <fsfull+0x1ec>
                break;
            total += cc;
    400c:	e51b2010 	ldr	r2, [fp, #-16]
    4010:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4014:	e0823003 	add	r3, r2, r3
    4018:	e50b3010 	str	r3, [fp, #-16]
            fsblocks++;
    401c:	e51b300c 	ldr	r3, [fp, #-12]
    4020:	e2833001 	add	r3, r3, #1
    4024:	e50b300c 	str	r3, [fp, #-12]
        }
    4028:	eaffffed 	b	3fe4 <fsfull+0x1a4>
        }
        int total = 0;
        while(1){
            int cc = write(fd, buf, 512);
            if(cc < 512)
                break;
    402c:	e1a00000 	nop			; (mov r0, r0)
            total += cc;
            fsblocks++;
        }
        printf(1, "wrote %d bytes\n", total);
    4030:	e3a00001 	mov	r0, #1
    4034:	e3061b28 	movw	r1, #27432	; 0x6b28
    4038:	e3401000 	movt	r1, #0
    403c:	e51b2010 	ldr	r2, [fp, #-16]
    4040:	eb000314 	bl	4c98 <printf>
        close(fd);
    4044:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    4048:	eb000227 	bl	48ec <close>
        if(total == 0)
    404c:	e51b3010 	ldr	r3, [fp, #-16]
    4050:	e3530000 	cmp	r3, #0
    4054:	0a000003 	beq	4068 <fsfull+0x228>
    int nfiles;
    int fsblocks = 0;

    printf(1, "fsfull test\n");

    for(nfiles = 0; ; nfiles++){
    4058:	e51b3008 	ldr	r3, [fp, #-8]
    405c:	e2833001 	add	r3, r3, #1
    4060:	e50b3008 	str	r3, [fp, #-8]
        }
        printf(1, "wrote %d bytes\n", total);
        close(fd);
        if(total == 0)
            break;
    }
    4064:	eaffff80 	b	3e6c <fsfull+0x2c>
            fsblocks++;
        }
        printf(1, "wrote %d bytes\n", total);
        close(fd);
        if(total == 0)
            break;
    4068:	e1a00000 	nop			; (mov r0, r0)
    }

    while(nfiles >= 0){
    406c:	ea00004c 	b	41a4 <fsfull+0x364>
        char name[64];
        name[0] = 'f';
    4070:	e3a03066 	mov	r3, #102	; 0x66
    4074:	e54b3058 	strb	r3, [fp, #-88]	; 0xffffffa8
        name[1] = '0' + nfiles / 1000;
    4078:	e51b2008 	ldr	r2, [fp, #-8]
    407c:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    4080:	e3413062 	movt	r3, #4194	; 0x1062
    4084:	e0c31293 	smull	r1, r3, r3, r2
    4088:	e1a01343 	asr	r1, r3, #6
    408c:	e1a03fc2 	asr	r3, r2, #31
    4090:	e0633001 	rsb	r3, r3, r1
    4094:	e6ef3073 	uxtb	r3, r3
    4098:	e2833030 	add	r3, r3, #48	; 0x30
    409c:	e6ef3073 	uxtb	r3, r3
    40a0:	e54b3057 	strb	r3, [fp, #-87]	; 0xffffffa9
        name[2] = '0' + (nfiles % 1000) / 100;
    40a4:	e51b2008 	ldr	r2, [fp, #-8]
    40a8:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    40ac:	e3413062 	movt	r3, #4194	; 0x1062
    40b0:	e0c31293 	smull	r1, r3, r3, r2
    40b4:	e1a01343 	asr	r1, r3, #6
    40b8:	e1a03fc2 	asr	r3, r2, #31
    40bc:	e0633001 	rsb	r3, r3, r1
    40c0:	e3a01ffa 	mov	r1, #1000	; 0x3e8
    40c4:	e0030391 	mul	r3, r1, r3
    40c8:	e0633002 	rsb	r3, r3, r2
    40cc:	e308251f 	movw	r2, #34079	; 0x851f
    40d0:	e34521eb 	movt	r2, #20971	; 0x51eb
    40d4:	e0c21392 	smull	r1, r2, r2, r3
    40d8:	e1a022c2 	asr	r2, r2, #5
    40dc:	e1a03fc3 	asr	r3, r3, #31
    40e0:	e0633002 	rsb	r3, r3, r2
    40e4:	e6ef3073 	uxtb	r3, r3
    40e8:	e2833030 	add	r3, r3, #48	; 0x30
    40ec:	e6ef3073 	uxtb	r3, r3
    40f0:	e54b3056 	strb	r3, [fp, #-86]	; 0xffffffaa
        name[3] = '0' + (nfiles % 100) / 10;
    40f4:	e51b2008 	ldr	r2, [fp, #-8]
    40f8:	e308351f 	movw	r3, #34079	; 0x851f
    40fc:	e34531eb 	movt	r3, #20971	; 0x51eb
    4100:	e0c31293 	smull	r1, r3, r3, r2
    4104:	e1a012c3 	asr	r1, r3, #5
    4108:	e1a03fc2 	asr	r3, r2, #31
    410c:	e0633001 	rsb	r3, r3, r1
    4110:	e3a01064 	mov	r1, #100	; 0x64
    4114:	e0030391 	mul	r3, r1, r3
    4118:	e0633002 	rsb	r3, r3, r2
    411c:	e3062667 	movw	r2, #26215	; 0x6667
    4120:	e3462666 	movt	r2, #26214	; 0x6666
    4124:	e0c21392 	smull	r1, r2, r2, r3
    4128:	e1a02142 	asr	r2, r2, #2
    412c:	e1a03fc3 	asr	r3, r3, #31
    4130:	e0633002 	rsb	r3, r3, r2
    4134:	e6ef3073 	uxtb	r3, r3
    4138:	e2833030 	add	r3, r3, #48	; 0x30
    413c:	e6ef3073 	uxtb	r3, r3
    4140:	e54b3055 	strb	r3, [fp, #-85]	; 0xffffffab
        name[4] = '0' + (nfiles % 10);
    4144:	e51b1008 	ldr	r1, [fp, #-8]
    4148:	e3063667 	movw	r3, #26215	; 0x6667
    414c:	e3463666 	movt	r3, #26214	; 0x6666
    4150:	e0c32193 	smull	r2, r3, r3, r1
    4154:	e1a02143 	asr	r2, r3, #2
    4158:	e1a03fc1 	asr	r3, r1, #31
    415c:	e0632002 	rsb	r2, r3, r2
    4160:	e1a03002 	mov	r3, r2
    4164:	e1a03103 	lsl	r3, r3, #2
    4168:	e0833002 	add	r3, r3, r2
    416c:	e1a03083 	lsl	r3, r3, #1
    4170:	e0632001 	rsb	r2, r3, r1
    4174:	e6ef3072 	uxtb	r3, r2
    4178:	e2833030 	add	r3, r3, #48	; 0x30
    417c:	e6ef3073 	uxtb	r3, r3
    4180:	e54b3054 	strb	r3, [fp, #-84]	; 0xffffffac
        name[5] = '\0';
    4184:	e3a03000 	mov	r3, #0
    4188:	e54b3053 	strb	r3, [fp, #-83]	; 0xffffffad
        unlink(name);
    418c:	e24b3058 	sub	r3, fp, #88	; 0x58
    4190:	e1a00003 	mov	r0, r3
    4194:	eb000201 	bl	49a0 <unlink>
        nfiles--;
    4198:	e51b3008 	ldr	r3, [fp, #-8]
    419c:	e2433001 	sub	r3, r3, #1
    41a0:	e50b3008 	str	r3, [fp, #-8]
        close(fd);
        if(total == 0)
            break;
    }

    while(nfiles >= 0){
    41a4:	e51b3008 	ldr	r3, [fp, #-8]
    41a8:	e3530000 	cmp	r3, #0
    41ac:	aaffffaf 	bge	4070 <fsfull+0x230>
        name[5] = '\0';
        unlink(name);
        nfiles--;
    }

    printf(1, "fsfull test finished\n");
    41b0:	e3a00001 	mov	r0, #1
    41b4:	e3061b38 	movw	r1, #27448	; 0x6b38
    41b8:	e3401000 	movt	r1, #0
    41bc:	eb0002b5 	bl	4c98 <printf>
}
    41c0:	e24bd004 	sub	sp, fp, #4
    41c4:	e8bd8800 	pop	{fp, pc}

000041c8 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    41c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    41cc:	e28db000 	add	fp, sp, #0
    randstate = randstate * 1664525 + 1013904223;
    41d0:	e3063bc0 	movw	r3, #27584	; 0x6bc0
    41d4:	e3403000 	movt	r3, #0
    41d8:	e5932000 	ldr	r2, [r3]
    41dc:	e306360d 	movw	r3, #26125	; 0x660d
    41e0:	e3403019 	movt	r3, #25
    41e4:	e0020293 	mul	r2, r3, r2
    41e8:	e30f335f 	movw	r3, #62303	; 0xf35f
    41ec:	e3433c6e 	movt	r3, #15470	; 0x3c6e
    41f0:	e0823003 	add	r3, r2, r3
    41f4:	e3062bc0 	movw	r2, #27584	; 0x6bc0
    41f8:	e3402000 	movt	r2, #0
    41fc:	e5823000 	str	r3, [r2]
    return randstate;
    4200:	e3063bc0 	movw	r3, #27584	; 0x6bc0
    4204:	e3403000 	movt	r3, #0
    4208:	e5933000 	ldr	r3, [r3]
}
    420c:	e1a00003 	mov	r0, r3
    4210:	e28bd000 	add	sp, fp, #0
    4214:	e8bd0800 	pop	{fp}
    4218:	e12fff1e 	bx	lr

0000421c <main>:

int
main(int argc, char *argv[])
{
    421c:	e92d4800 	push	{fp, lr}
    4220:	e28db004 	add	fp, sp, #4
    4224:	e24dd008 	sub	sp, sp, #8
    4228:	e50b0008 	str	r0, [fp, #-8]
    422c:	e50b100c 	str	r1, [fp, #-12]
    printf(1, "usertests starting\n");
    4230:	e3a00001 	mov	r0, #1
    4234:	e3061b50 	movw	r1, #27472	; 0x6b50
    4238:	e3401000 	movt	r1, #0
    423c:	eb000295 	bl	4c98 <printf>

    if(open("usertests.ran", 0) >= 0){
    4240:	e3060b64 	movw	r0, #27492	; 0x6b64
    4244:	e3400000 	movt	r0, #0
    4248:	e3a01000 	mov	r1, #0
    424c:	eb0001c1 	bl	4958 <open>
    4250:	e1a03000 	mov	r3, r0
    4254:	e3530000 	cmp	r3, #0
    4258:	ba000004 	blt	4270 <main+0x54>
        printf(1, "already ran user tests -- rebuild fs.img\n");
    425c:	e3a00001 	mov	r0, #1
    4260:	e3061b74 	movw	r1, #27508	; 0x6b74
    4264:	e3401000 	movt	r1, #0
    4268:	eb00028a 	bl	4c98 <printf>
        exit();
    426c:	eb000171 	bl	4838 <exit>
    }
    close(open("usertests.ran", O_CREATE));
    4270:	e3060b64 	movw	r0, #27492	; 0x6b64
    4274:	e3400000 	movt	r0, #0
    4278:	e3a01c02 	mov	r1, #512	; 0x200
    427c:	eb0001b5 	bl	4958 <open>
    4280:	e1a03000 	mov	r3, r0
    4284:	e1a00003 	mov	r0, r3
    4288:	eb000197 	bl	48ec <close>

    bigargtest();
    428c:	ebfffe8f 	bl	3cd0 <bigargtest>
    bigwrite();
    4290:	ebfff9d7 	bl	29f4 <bigwrite>
    bigargtest();
    4294:	ebfffe8d 	bl	3cd0 <bigargtest>
    bsstest();
    4298:	ebfffe60 	bl	3c20 <bsstest>
    sbrktest();
    429c:	ebfffc89 	bl	34c8 <sbrktest>
    validatetest();
    42a0:	ebfffe1e 	bl	3b20 <validatetest>

    opentest();
    42a4:	ebffef55 	bl	0 <opentest>
    writetest();
    42a8:	ebffef89 	bl	d4 <writetest>
    writetest1();
    42ac:	ebfff027 	bl	350 <writetest1>
    createtest();
    42b0:	ebfff0c3 	bl	5c4 <createtest>

    mem();
    42b4:	ebfff296 	bl	d14 <mem>
    pipe1();
    42b8:	ebfff171 	bl	884 <pipe1>
    //preempt();
    exitwait();
    42bc:	ebfff26a 	bl	c6c <exitwait>

    rmdot();
    42c0:	ebfffafd 	bl	2ebc <rmdot>
    fourteen();
    42c4:	ebfffaa5 	bl	2d60 <fourteen>
    bigfile();
    42c8:	ebfffa10 	bl	2b10 <bigfile>
    subdir();
    42cc:	ebfff7ee 	bl	228c <subdir>
    concreate();
    42d0:	ebfff5f4 	bl	1aa8 <concreate>
    linkunlink();
    42d4:	ebfff713 	bl	1f28 <linkunlink>
    linktest();
    42d8:	ebfff561 	bl	1864 <linktest>
    unlinkread();
    42dc:	ebfff4f2 	bl	16ac <unlinkread>
    createdelete();
    42e0:	ebfff412 	bl	1330 <createdelete>
    twofiles();
    42e4:	ebfff361 	bl	1070 <twofiles>
    sharedfd();
    42e8:	ebfff2c7 	bl	e0c <sharedfd>
    dirfile();
    42ec:	ebfffb55 	bl	3048 <dirfile>
    iref();
    42f0:	ebfffbe4 	bl	3288 <iref>
    forktest();
    42f4:	ebfffc31 	bl	33c0 <forktest>
    bigdir(); // slow
    42f8:	ebfff767 	bl	209c <bigdir>

    exectest();
    42fc:	ebfff146 	bl	81c <exectest>

    exit();
    4300:	eb00014c 	bl	4838 <exit>

00004304 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
    4304:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4308:	e28db000 	add	fp, sp, #0
    430c:	e24dd014 	sub	sp, sp, #20
    4310:	e50b0010 	str	r0, [fp, #-16]
    4314:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *os;
    
    os = s;
    4318:	e51b3010 	ldr	r3, [fp, #-16]
    431c:	e50b3008 	str	r3, [fp, #-8]
    while((*s++ = *t++) != 0)
    4320:	e1a00000 	nop			; (mov r0, r0)
    4324:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4328:	e5d32000 	ldrb	r2, [r3]
    432c:	e51b3010 	ldr	r3, [fp, #-16]
    4330:	e5c32000 	strb	r2, [r3]
    4334:	e51b3010 	ldr	r3, [fp, #-16]
    4338:	e5d33000 	ldrb	r3, [r3]
    433c:	e3530000 	cmp	r3, #0
    4340:	03a03000 	moveq	r3, #0
    4344:	13a03001 	movne	r3, #1
    4348:	e6ef3073 	uxtb	r3, r3
    434c:	e51b2010 	ldr	r2, [fp, #-16]
    4350:	e2822001 	add	r2, r2, #1
    4354:	e50b2010 	str	r2, [fp, #-16]
    4358:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    435c:	e2822001 	add	r2, r2, #1
    4360:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
    4364:	e3530000 	cmp	r3, #0
    4368:	1affffed 	bne	4324 <strcpy+0x20>
        ;
    return os;
    436c:	e51b3008 	ldr	r3, [fp, #-8]
}
    4370:	e1a00003 	mov	r0, r3
    4374:	e28bd000 	add	sp, fp, #0
    4378:	e8bd0800 	pop	{fp}
    437c:	e12fff1e 	bx	lr

00004380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4380:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4384:	e28db000 	add	fp, sp, #0
    4388:	e24dd00c 	sub	sp, sp, #12
    438c:	e50b0008 	str	r0, [fp, #-8]
    4390:	e50b100c 	str	r1, [fp, #-12]
    while(*p && *p == *q)
    4394:	ea000005 	b	43b0 <strcmp+0x30>
        p++, q++;
    4398:	e51b3008 	ldr	r3, [fp, #-8]
    439c:	e2833001 	add	r3, r3, #1
    43a0:	e50b3008 	str	r3, [fp, #-8]
    43a4:	e51b300c 	ldr	r3, [fp, #-12]
    43a8:	e2833001 	add	r3, r3, #1
    43ac:	e50b300c 	str	r3, [fp, #-12]
}

int
strcmp(const char *p, const char *q)
{
    while(*p && *p == *q)
    43b0:	e51b3008 	ldr	r3, [fp, #-8]
    43b4:	e5d33000 	ldrb	r3, [r3]
    43b8:	e3530000 	cmp	r3, #0
    43bc:	0a000005 	beq	43d8 <strcmp+0x58>
    43c0:	e51b3008 	ldr	r3, [fp, #-8]
    43c4:	e5d32000 	ldrb	r2, [r3]
    43c8:	e51b300c 	ldr	r3, [fp, #-12]
    43cc:	e5d33000 	ldrb	r3, [r3]
    43d0:	e1520003 	cmp	r2, r3
    43d4:	0affffef 	beq	4398 <strcmp+0x18>
        p++, q++;
    return (uchar)*p - (uchar)*q;
    43d8:	e51b3008 	ldr	r3, [fp, #-8]
    43dc:	e5d33000 	ldrb	r3, [r3]
    43e0:	e1a02003 	mov	r2, r3
    43e4:	e51b300c 	ldr	r3, [fp, #-12]
    43e8:	e5d33000 	ldrb	r3, [r3]
    43ec:	e0633002 	rsb	r3, r3, r2
}
    43f0:	e1a00003 	mov	r0, r3
    43f4:	e28bd000 	add	sp, fp, #0
    43f8:	e8bd0800 	pop	{fp}
    43fc:	e12fff1e 	bx	lr

00004400 <strlen>:

uint
strlen(char *s)
{
    4400:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4404:	e28db000 	add	fp, sp, #0
    4408:	e24dd014 	sub	sp, sp, #20
    440c:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    for(n = 0; s[n]; n++)
    4410:	e3a03000 	mov	r3, #0
    4414:	e50b3008 	str	r3, [fp, #-8]
    4418:	ea000002 	b	4428 <strlen+0x28>
    441c:	e51b3008 	ldr	r3, [fp, #-8]
    4420:	e2833001 	add	r3, r3, #1
    4424:	e50b3008 	str	r3, [fp, #-8]
    4428:	e51b3008 	ldr	r3, [fp, #-8]
    442c:	e51b2010 	ldr	r2, [fp, #-16]
    4430:	e0823003 	add	r3, r2, r3
    4434:	e5d33000 	ldrb	r3, [r3]
    4438:	e3530000 	cmp	r3, #0
    443c:	1afffff6 	bne	441c <strlen+0x1c>
        ;
    return n;
    4440:	e51b3008 	ldr	r3, [fp, #-8]
}
    4444:	e1a00003 	mov	r0, r3
    4448:	e28bd000 	add	sp, fp, #0
    444c:	e8bd0800 	pop	{fp}
    4450:	e12fff1e 	bx	lr

00004454 <memset>:

void*
memset(void *dst, int v, uint n)
{
    4454:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4458:	e28db000 	add	fp, sp, #0
    445c:	e24dd024 	sub	sp, sp, #36	; 0x24
    4460:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    4464:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    4468:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	uint8	*p;
	uint8	c;
	uint32	val;
	uint32	*p4;

	p   = dst;
    446c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4470:	e50b3008 	str	r3, [fp, #-8]
	c   = v & 0xff;
    4474:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4478:	e54b300d 	strb	r3, [fp, #-13]
	val = (c << 24) | (c << 16) | (c << 8) | c;
    447c:	e55b300d 	ldrb	r3, [fp, #-13]
    4480:	e1a02c03 	lsl	r2, r3, #24
    4484:	e55b300d 	ldrb	r3, [fp, #-13]
    4488:	e1a03803 	lsl	r3, r3, #16
    448c:	e1822003 	orr	r2, r2, r3
    4490:	e55b300d 	ldrb	r3, [fp, #-13]
    4494:	e1a03403 	lsl	r3, r3, #8
    4498:	e1822003 	orr	r2, r2, r3
    449c:	e55b300d 	ldrb	r3, [fp, #-13]
    44a0:	e1823003 	orr	r3, r2, r3
    44a4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
    44a8:	ea000008 	b	44d0 <memset+0x7c>
		*p = c;
    44ac:	e51b3008 	ldr	r3, [fp, #-8]
    44b0:	e55b200d 	ldrb	r2, [fp, #-13]
    44b4:	e5c32000 	strb	r2, [r3]
	p   = dst;
	c   = v & 0xff;
	val = (c << 24) | (c << 16) | (c << 8) | c;

	// set bytes before whole uint32
	for (; (n > 0) && ((uint)p % 4); n--, p++){
    44b8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    44bc:	e2433001 	sub	r3, r3, #1
    44c0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    44c4:	e51b3008 	ldr	r3, [fp, #-8]
    44c8:	e2833001 	add	r3, r3, #1
    44cc:	e50b3008 	str	r3, [fp, #-8]
    44d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    44d4:	e3530000 	cmp	r3, #0
    44d8:	0a000003 	beq	44ec <memset+0x98>
    44dc:	e51b3008 	ldr	r3, [fp, #-8]
    44e0:	e2033003 	and	r3, r3, #3
    44e4:	e3530000 	cmp	r3, #0
    44e8:	1affffef 	bne	44ac <memset+0x58>
		*p = c;
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;
    44ec:	e51b3008 	ldr	r3, [fp, #-8]
    44f0:	e50b300c 	str	r3, [fp, #-12]

	for (; n >= 4; n -= 4, p4++) {
    44f4:	ea000008 	b	451c <memset+0xc8>
		*p4 = val;
    44f8:	e51b300c 	ldr	r3, [fp, #-12]
    44fc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    4500:	e5832000 	str	r2, [r3]
	}

	// set memory 4 bytes a time
	p4 = (uint*)p;

	for (; n >= 4; n -= 4, p4++) {
    4504:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4508:	e2433004 	sub	r3, r3, #4
    450c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    4510:	e51b300c 	ldr	r3, [fp, #-12]
    4514:	e2833004 	add	r3, r3, #4
    4518:	e50b300c 	str	r3, [fp, #-12]
    451c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4520:	e3530003 	cmp	r3, #3
    4524:	8afffff3 	bhi	44f8 <memset+0xa4>
		*p4 = val;
	}

	// set leftover one byte a time
	p = (uint8*)p4;
    4528:	e51b300c 	ldr	r3, [fp, #-12]
    452c:	e50b3008 	str	r3, [fp, #-8]

	for (; n > 0; n--, p++) {
    4530:	ea000008 	b	4558 <memset+0x104>
		*p = c;
    4534:	e51b3008 	ldr	r3, [fp, #-8]
    4538:	e55b200d 	ldrb	r2, [fp, #-13]
    453c:	e5c32000 	strb	r2, [r3]
	}

	// set leftover one byte a time
	p = (uint8*)p4;

	for (; n > 0; n--, p++) {
    4540:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4544:	e2433001 	sub	r3, r3, #1
    4548:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    454c:	e51b3008 	ldr	r3, [fp, #-8]
    4550:	e2833001 	add	r3, r3, #1
    4554:	e50b3008 	str	r3, [fp, #-8]
    4558:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    455c:	e3530000 	cmp	r3, #0
    4560:	1afffff3 	bne	4534 <memset+0xe0>
		*p = c;
	}

	return dst;
    4564:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    4568:	e1a00003 	mov	r0, r3
    456c:	e28bd000 	add	sp, fp, #0
    4570:	e8bd0800 	pop	{fp}
    4574:	e12fff1e 	bx	lr

00004578 <strchr>:

char*
strchr(const char *s, char c)
{
    4578:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    457c:	e28db000 	add	fp, sp, #0
    4580:	e24dd00c 	sub	sp, sp, #12
    4584:	e50b0008 	str	r0, [fp, #-8]
    4588:	e1a03001 	mov	r3, r1
    458c:	e54b3009 	strb	r3, [fp, #-9]
    for(; *s; s++)
    4590:	ea000009 	b	45bc <strchr+0x44>
        if(*s == c)
    4594:	e51b3008 	ldr	r3, [fp, #-8]
    4598:	e5d33000 	ldrb	r3, [r3]
    459c:	e55b2009 	ldrb	r2, [fp, #-9]
    45a0:	e1520003 	cmp	r2, r3
    45a4:	1a000001 	bne	45b0 <strchr+0x38>
            return (char*)s;
    45a8:	e51b3008 	ldr	r3, [fp, #-8]
    45ac:	ea000007 	b	45d0 <strchr+0x58>
}

char*
strchr(const char *s, char c)
{
    for(; *s; s++)
    45b0:	e51b3008 	ldr	r3, [fp, #-8]
    45b4:	e2833001 	add	r3, r3, #1
    45b8:	e50b3008 	str	r3, [fp, #-8]
    45bc:	e51b3008 	ldr	r3, [fp, #-8]
    45c0:	e5d33000 	ldrb	r3, [r3]
    45c4:	e3530000 	cmp	r3, #0
    45c8:	1afffff1 	bne	4594 <strchr+0x1c>
        if(*s == c)
            return (char*)s;
    return 0;
    45cc:	e3a03000 	mov	r3, #0
}
    45d0:	e1a00003 	mov	r0, r3
    45d4:	e28bd000 	add	sp, fp, #0
    45d8:	e8bd0800 	pop	{fp}
    45dc:	e12fff1e 	bx	lr

000045e0 <gets>:

char*
gets(char *buf, int max)
{
    45e0:	e92d4800 	push	{fp, lr}
    45e4:	e28db004 	add	fp, sp, #4
    45e8:	e24dd018 	sub	sp, sp, #24
    45ec:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    45f0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
    45f4:	e3a03000 	mov	r3, #0
    45f8:	e50b3008 	str	r3, [fp, #-8]
    45fc:	ea000016 	b	465c <gets+0x7c>
        cc = read(0, &c, 1);
    4600:	e3a00000 	mov	r0, #0
    4604:	e24b300d 	sub	r3, fp, #13
    4608:	e1a01003 	mov	r1, r3
    460c:	e3a02001 	mov	r2, #1
    4610:	eb0000a3 	bl	48a4 <read>
    4614:	e50b000c 	str	r0, [fp, #-12]
        if(cc < 1)
    4618:	e51b300c 	ldr	r3, [fp, #-12]
    461c:	e3530000 	cmp	r3, #0
    4620:	da000013 	ble	4674 <gets+0x94>
            break;
        buf[i++] = c;
    4624:	e51b3008 	ldr	r3, [fp, #-8]
    4628:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    462c:	e0823003 	add	r3, r2, r3
    4630:	e55b200d 	ldrb	r2, [fp, #-13]
    4634:	e5c32000 	strb	r2, [r3]
    4638:	e51b3008 	ldr	r3, [fp, #-8]
    463c:	e2833001 	add	r3, r3, #1
    4640:	e50b3008 	str	r3, [fp, #-8]
        if(c == '\n' || c == '\r')
    4644:	e55b300d 	ldrb	r3, [fp, #-13]
    4648:	e353000a 	cmp	r3, #10
    464c:	0a000009 	beq	4678 <gets+0x98>
    4650:	e55b300d 	ldrb	r3, [fp, #-13]
    4654:	e353000d 	cmp	r3, #13
    4658:	0a000006 	beq	4678 <gets+0x98>
gets(char *buf, int max)
{
    int i, cc;
    char c;
    
    for(i=0; i+1 < max; ){
    465c:	e51b3008 	ldr	r3, [fp, #-8]
    4660:	e2832001 	add	r2, r3, #1
    4664:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4668:	e1520003 	cmp	r2, r3
    466c:	baffffe3 	blt	4600 <gets+0x20>
    4670:	ea000000 	b	4678 <gets+0x98>
        cc = read(0, &c, 1);
        if(cc < 1)
            break;
    4674:	e1a00000 	nop			; (mov r0, r0)
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';
    4678:	e51b3008 	ldr	r3, [fp, #-8]
    467c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    4680:	e0823003 	add	r3, r2, r3
    4684:	e3a02000 	mov	r2, #0
    4688:	e5c32000 	strb	r2, [r3]
    return buf;
    468c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    4690:	e1a00003 	mov	r0, r3
    4694:	e24bd004 	sub	sp, fp, #4
    4698:	e8bd8800 	pop	{fp, pc}

0000469c <stat>:

int
stat(char *n, struct stat *st)
{
    469c:	e92d4800 	push	{fp, lr}
    46a0:	e28db004 	add	fp, sp, #4
    46a4:	e24dd010 	sub	sp, sp, #16
    46a8:	e50b0010 	str	r0, [fp, #-16]
    46ac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int fd;
    int r;
    
    fd = open(n, O_RDONLY);
    46b0:	e51b0010 	ldr	r0, [fp, #-16]
    46b4:	e3a01000 	mov	r1, #0
    46b8:	eb0000a6 	bl	4958 <open>
    46bc:	e50b0008 	str	r0, [fp, #-8]
    if(fd < 0)
    46c0:	e51b3008 	ldr	r3, [fp, #-8]
    46c4:	e3530000 	cmp	r3, #0
    46c8:	aa000001 	bge	46d4 <stat+0x38>
        return -1;
    46cc:	e3e03000 	mvn	r3, #0
    46d0:	ea000006 	b	46f0 <stat+0x54>
    r = fstat(fd, st);
    46d4:	e51b0008 	ldr	r0, [fp, #-8]
    46d8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    46dc:	eb0000b8 	bl	49c4 <fstat>
    46e0:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
    46e4:	e51b0008 	ldr	r0, [fp, #-8]
    46e8:	eb00007f 	bl	48ec <close>
    return r;
    46ec:	e51b300c 	ldr	r3, [fp, #-12]
}
    46f0:	e1a00003 	mov	r0, r3
    46f4:	e24bd004 	sub	sp, fp, #4
    46f8:	e8bd8800 	pop	{fp, pc}

000046fc <atoi>:

int
atoi(const char *s)
{
    46fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4700:	e28db000 	add	fp, sp, #0
    4704:	e24dd014 	sub	sp, sp, #20
    4708:	e50b0010 	str	r0, [fp, #-16]
    int n;
    
    n = 0;
    470c:	e3a03000 	mov	r3, #0
    4710:	e50b3008 	str	r3, [fp, #-8]
    while('0' <= *s && *s <= '9')
    4714:	ea00000d 	b	4750 <atoi+0x54>
        n = n*10 + *s++ - '0';
    4718:	e51b2008 	ldr	r2, [fp, #-8]
    471c:	e1a03002 	mov	r3, r2
    4720:	e1a03103 	lsl	r3, r3, #2
    4724:	e0833002 	add	r3, r3, r2
    4728:	e1a03083 	lsl	r3, r3, #1
    472c:	e1a02003 	mov	r2, r3
    4730:	e51b3010 	ldr	r3, [fp, #-16]
    4734:	e5d33000 	ldrb	r3, [r3]
    4738:	e0823003 	add	r3, r2, r3
    473c:	e2433030 	sub	r3, r3, #48	; 0x30
    4740:	e50b3008 	str	r3, [fp, #-8]
    4744:	e51b3010 	ldr	r3, [fp, #-16]
    4748:	e2833001 	add	r3, r3, #1
    474c:	e50b3010 	str	r3, [fp, #-16]
atoi(const char *s)
{
    int n;
    
    n = 0;
    while('0' <= *s && *s <= '9')
    4750:	e51b3010 	ldr	r3, [fp, #-16]
    4754:	e5d33000 	ldrb	r3, [r3]
    4758:	e353002f 	cmp	r3, #47	; 0x2f
    475c:	9a000003 	bls	4770 <atoi+0x74>
    4760:	e51b3010 	ldr	r3, [fp, #-16]
    4764:	e5d33000 	ldrb	r3, [r3]
    4768:	e3530039 	cmp	r3, #57	; 0x39
    476c:	9affffe9 	bls	4718 <atoi+0x1c>
        n = n*10 + *s++ - '0';
    return n;
    4770:	e51b3008 	ldr	r3, [fp, #-8]
}
    4774:	e1a00003 	mov	r0, r3
    4778:	e28bd000 	add	sp, fp, #0
    477c:	e8bd0800 	pop	{fp}
    4780:	e12fff1e 	bx	lr

00004784 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4784:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4788:	e28db000 	add	fp, sp, #0
    478c:	e24dd01c 	sub	sp, sp, #28
    4790:	e50b0010 	str	r0, [fp, #-16]
    4794:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    4798:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *dst, *src;
    
    dst = vdst;
    479c:	e51b3010 	ldr	r3, [fp, #-16]
    47a0:	e50b3008 	str	r3, [fp, #-8]
    src = vsrc;
    47a4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    47a8:	e50b300c 	str	r3, [fp, #-12]
    while(n-- > 0)
    47ac:	ea000009 	b	47d8 <memmove+0x54>
        *dst++ = *src++;
    47b0:	e51b300c 	ldr	r3, [fp, #-12]
    47b4:	e5d32000 	ldrb	r2, [r3]
    47b8:	e51b3008 	ldr	r3, [fp, #-8]
    47bc:	e5c32000 	strb	r2, [r3]
    47c0:	e51b3008 	ldr	r3, [fp, #-8]
    47c4:	e2833001 	add	r3, r3, #1
    47c8:	e50b3008 	str	r3, [fp, #-8]
    47cc:	e51b300c 	ldr	r3, [fp, #-12]
    47d0:	e2833001 	add	r3, r3, #1
    47d4:	e50b300c 	str	r3, [fp, #-12]
{
    char *dst, *src;
    
    dst = vdst;
    src = vsrc;
    while(n-- > 0)
    47d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    47dc:	e3530000 	cmp	r3, #0
    47e0:	d3a03000 	movle	r3, #0
    47e4:	c3a03001 	movgt	r3, #1
    47e8:	e6ef3073 	uxtb	r3, r3
    47ec:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    47f0:	e2422001 	sub	r2, r2, #1
    47f4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    47f8:	e3530000 	cmp	r3, #0
    47fc:	1affffeb 	bne	47b0 <memmove+0x2c>
        *dst++ = *src++;
    return vdst;
    4800:	e51b3010 	ldr	r3, [fp, #-16]
}
    4804:	e1a00003 	mov	r0, r3
    4808:	e28bd000 	add	sp, fp, #0
    480c:	e8bd0800 	pop	{fp}
    4810:	e12fff1e 	bx	lr

00004814 <fork>:
    4814:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4818:	e1a04003 	mov	r4, r3
    481c:	e1a03002 	mov	r3, r2
    4820:	e1a02001 	mov	r2, r1
    4824:	e1a01000 	mov	r1, r0
    4828:	e3a00001 	mov	r0, #1
    482c:	ef000000 	svc	0x00000000
    4830:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4834:	e12fff1e 	bx	lr

00004838 <exit>:
    4838:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    483c:	e1a04003 	mov	r4, r3
    4840:	e1a03002 	mov	r3, r2
    4844:	e1a02001 	mov	r2, r1
    4848:	e1a01000 	mov	r1, r0
    484c:	e3a00002 	mov	r0, #2
    4850:	ef000000 	svc	0x00000000
    4854:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4858:	e12fff1e 	bx	lr

0000485c <wait>:
    485c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4860:	e1a04003 	mov	r4, r3
    4864:	e1a03002 	mov	r3, r2
    4868:	e1a02001 	mov	r2, r1
    486c:	e1a01000 	mov	r1, r0
    4870:	e3a00003 	mov	r0, #3
    4874:	ef000000 	svc	0x00000000
    4878:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    487c:	e12fff1e 	bx	lr

00004880 <pipe>:
    4880:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4884:	e1a04003 	mov	r4, r3
    4888:	e1a03002 	mov	r3, r2
    488c:	e1a02001 	mov	r2, r1
    4890:	e1a01000 	mov	r1, r0
    4894:	e3a00004 	mov	r0, #4
    4898:	ef000000 	svc	0x00000000
    489c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    48a0:	e12fff1e 	bx	lr

000048a4 <read>:
    48a4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    48a8:	e1a04003 	mov	r4, r3
    48ac:	e1a03002 	mov	r3, r2
    48b0:	e1a02001 	mov	r2, r1
    48b4:	e1a01000 	mov	r1, r0
    48b8:	e3a00005 	mov	r0, #5
    48bc:	ef000000 	svc	0x00000000
    48c0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    48c4:	e12fff1e 	bx	lr

000048c8 <write>:
    48c8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    48cc:	e1a04003 	mov	r4, r3
    48d0:	e1a03002 	mov	r3, r2
    48d4:	e1a02001 	mov	r2, r1
    48d8:	e1a01000 	mov	r1, r0
    48dc:	e3a00010 	mov	r0, #16
    48e0:	ef000000 	svc	0x00000000
    48e4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    48e8:	e12fff1e 	bx	lr

000048ec <close>:
    48ec:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    48f0:	e1a04003 	mov	r4, r3
    48f4:	e1a03002 	mov	r3, r2
    48f8:	e1a02001 	mov	r2, r1
    48fc:	e1a01000 	mov	r1, r0
    4900:	e3a00015 	mov	r0, #21
    4904:	ef000000 	svc	0x00000000
    4908:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    490c:	e12fff1e 	bx	lr

00004910 <kill>:
    4910:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4914:	e1a04003 	mov	r4, r3
    4918:	e1a03002 	mov	r3, r2
    491c:	e1a02001 	mov	r2, r1
    4920:	e1a01000 	mov	r1, r0
    4924:	e3a00006 	mov	r0, #6
    4928:	ef000000 	svc	0x00000000
    492c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4930:	e12fff1e 	bx	lr

00004934 <exec>:
    4934:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4938:	e1a04003 	mov	r4, r3
    493c:	e1a03002 	mov	r3, r2
    4940:	e1a02001 	mov	r2, r1
    4944:	e1a01000 	mov	r1, r0
    4948:	e3a00007 	mov	r0, #7
    494c:	ef000000 	svc	0x00000000
    4950:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4954:	e12fff1e 	bx	lr

00004958 <open>:
    4958:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    495c:	e1a04003 	mov	r4, r3
    4960:	e1a03002 	mov	r3, r2
    4964:	e1a02001 	mov	r2, r1
    4968:	e1a01000 	mov	r1, r0
    496c:	e3a0000f 	mov	r0, #15
    4970:	ef000000 	svc	0x00000000
    4974:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4978:	e12fff1e 	bx	lr

0000497c <mknod>:
    497c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4980:	e1a04003 	mov	r4, r3
    4984:	e1a03002 	mov	r3, r2
    4988:	e1a02001 	mov	r2, r1
    498c:	e1a01000 	mov	r1, r0
    4990:	e3a00011 	mov	r0, #17
    4994:	ef000000 	svc	0x00000000
    4998:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    499c:	e12fff1e 	bx	lr

000049a0 <unlink>:
    49a0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    49a4:	e1a04003 	mov	r4, r3
    49a8:	e1a03002 	mov	r3, r2
    49ac:	e1a02001 	mov	r2, r1
    49b0:	e1a01000 	mov	r1, r0
    49b4:	e3a00012 	mov	r0, #18
    49b8:	ef000000 	svc	0x00000000
    49bc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    49c0:	e12fff1e 	bx	lr

000049c4 <fstat>:
    49c4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    49c8:	e1a04003 	mov	r4, r3
    49cc:	e1a03002 	mov	r3, r2
    49d0:	e1a02001 	mov	r2, r1
    49d4:	e1a01000 	mov	r1, r0
    49d8:	e3a00008 	mov	r0, #8
    49dc:	ef000000 	svc	0x00000000
    49e0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    49e4:	e12fff1e 	bx	lr

000049e8 <link>:
    49e8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    49ec:	e1a04003 	mov	r4, r3
    49f0:	e1a03002 	mov	r3, r2
    49f4:	e1a02001 	mov	r2, r1
    49f8:	e1a01000 	mov	r1, r0
    49fc:	e3a00013 	mov	r0, #19
    4a00:	ef000000 	svc	0x00000000
    4a04:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4a08:	e12fff1e 	bx	lr

00004a0c <mkdir>:
    4a0c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4a10:	e1a04003 	mov	r4, r3
    4a14:	e1a03002 	mov	r3, r2
    4a18:	e1a02001 	mov	r2, r1
    4a1c:	e1a01000 	mov	r1, r0
    4a20:	e3a00014 	mov	r0, #20
    4a24:	ef000000 	svc	0x00000000
    4a28:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4a2c:	e12fff1e 	bx	lr

00004a30 <chdir>:
    4a30:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4a34:	e1a04003 	mov	r4, r3
    4a38:	e1a03002 	mov	r3, r2
    4a3c:	e1a02001 	mov	r2, r1
    4a40:	e1a01000 	mov	r1, r0
    4a44:	e3a00009 	mov	r0, #9
    4a48:	ef000000 	svc	0x00000000
    4a4c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4a50:	e12fff1e 	bx	lr

00004a54 <dup>:
    4a54:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4a58:	e1a04003 	mov	r4, r3
    4a5c:	e1a03002 	mov	r3, r2
    4a60:	e1a02001 	mov	r2, r1
    4a64:	e1a01000 	mov	r1, r0
    4a68:	e3a0000a 	mov	r0, #10
    4a6c:	ef000000 	svc	0x00000000
    4a70:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4a74:	e12fff1e 	bx	lr

00004a78 <getpid>:
    4a78:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4a7c:	e1a04003 	mov	r4, r3
    4a80:	e1a03002 	mov	r3, r2
    4a84:	e1a02001 	mov	r2, r1
    4a88:	e1a01000 	mov	r1, r0
    4a8c:	e3a0000b 	mov	r0, #11
    4a90:	ef000000 	svc	0x00000000
    4a94:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4a98:	e12fff1e 	bx	lr

00004a9c <sbrk>:
    4a9c:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4aa0:	e1a04003 	mov	r4, r3
    4aa4:	e1a03002 	mov	r3, r2
    4aa8:	e1a02001 	mov	r2, r1
    4aac:	e1a01000 	mov	r1, r0
    4ab0:	e3a0000c 	mov	r0, #12
    4ab4:	ef000000 	svc	0x00000000
    4ab8:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4abc:	e12fff1e 	bx	lr

00004ac0 <sleep>:
    4ac0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4ac4:	e1a04003 	mov	r4, r3
    4ac8:	e1a03002 	mov	r3, r2
    4acc:	e1a02001 	mov	r2, r1
    4ad0:	e1a01000 	mov	r1, r0
    4ad4:	e3a0000d 	mov	r0, #13
    4ad8:	ef000000 	svc	0x00000000
    4adc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4ae0:	e12fff1e 	bx	lr

00004ae4 <uptime>:
    4ae4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    4ae8:	e1a04003 	mov	r4, r3
    4aec:	e1a03002 	mov	r3, r2
    4af0:	e1a02001 	mov	r2, r1
    4af4:	e1a01000 	mov	r1, r0
    4af8:	e3a0000e 	mov	r0, #14
    4afc:	ef000000 	svc	0x00000000
    4b00:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    4b04:	e12fff1e 	bx	lr

00004b08 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4b08:	e92d4800 	push	{fp, lr}
    4b0c:	e28db004 	add	fp, sp, #4
    4b10:	e24dd008 	sub	sp, sp, #8
    4b14:	e50b0008 	str	r0, [fp, #-8]
    4b18:	e1a03001 	mov	r3, r1
    4b1c:	e54b3009 	strb	r3, [fp, #-9]
    write(fd, &c, 1);
    4b20:	e51b0008 	ldr	r0, [fp, #-8]
    4b24:	e24b3009 	sub	r3, fp, #9
    4b28:	e1a01003 	mov	r1, r3
    4b2c:	e3a02001 	mov	r2, #1
    4b30:	ebffff64 	bl	48c8 <write>
}
    4b34:	e24bd004 	sub	sp, fp, #4
    4b38:	e8bd8800 	pop	{fp, pc}

00004b3c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4b3c:	e92d4800 	push	{fp, lr}
    4b40:	e28db004 	add	fp, sp, #4
    4b44:	e24dd030 	sub	sp, sp, #48	; 0x30
    4b48:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    4b4c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    4b50:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    4b54:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;
    
    neg = 0;
    4b58:	e3a03000 	mov	r3, #0
    4b5c:	e50b300c 	str	r3, [fp, #-12]
    if(sgn && xx < 0){
    4b60:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    4b64:	e3530000 	cmp	r3, #0
    4b68:	0a000008 	beq	4b90 <printint+0x54>
    4b6c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    4b70:	e3530000 	cmp	r3, #0
    4b74:	aa000005 	bge	4b90 <printint+0x54>
        neg = 1;
    4b78:	e3a03001 	mov	r3, #1
    4b7c:	e50b300c 	str	r3, [fp, #-12]
        x = -xx;
    4b80:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    4b84:	e2633000 	rsb	r3, r3, #0
    4b88:	e50b3010 	str	r3, [fp, #-16]
    4b8c:	ea000001 	b	4b98 <printint+0x5c>
    } else {
        x = xx;
    4b90:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    4b94:	e50b3010 	str	r3, [fp, #-16]
    }
    
    i = 0;
    4b98:	e3a03000 	mov	r3, #0
    4b9c:	e50b3008 	str	r3, [fp, #-8]
    do{
        buf[i++] = digits[x % base];
    4ba0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    4ba4:	e51b2010 	ldr	r2, [fp, #-16]
    4ba8:	e1a00002 	mov	r0, r2
    4bac:	e1a01003 	mov	r1, r3
    4bb0:	eb0001e5 	bl	534c <__aeabi_uidivmod>
    4bb4:	e1a03001 	mov	r3, r1
    4bb8:	e1a02003 	mov	r2, r3
    4bbc:	e3063bc4 	movw	r3, #27588	; 0x6bc4
    4bc0:	e3403000 	movt	r3, #0
    4bc4:	e7d32002 	ldrb	r2, [r3, r2]
    4bc8:	e3e0001b 	mvn	r0, #27
    4bcc:	e51b3008 	ldr	r3, [fp, #-8]
    4bd0:	e24bc004 	sub	ip, fp, #4
    4bd4:	e08c1003 	add	r1, ip, r3
    4bd8:	e1a03000 	mov	r3, r0
    4bdc:	e0813003 	add	r3, r1, r3
    4be0:	e5c32000 	strb	r2, [r3]
    4be4:	e51b3008 	ldr	r3, [fp, #-8]
    4be8:	e2833001 	add	r3, r3, #1
    4bec:	e50b3008 	str	r3, [fp, #-8]
    }while((x /= base) != 0);
    4bf0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    4bf4:	e51b0010 	ldr	r0, [fp, #-16]
    4bf8:	e1a01003 	mov	r1, r3
    4bfc:	eb000195 	bl	5258 <__aeabi_uidiv>
    4c00:	e1a03000 	mov	r3, r0
    4c04:	e50b3010 	str	r3, [fp, #-16]
    4c08:	e51b3010 	ldr	r3, [fp, #-16]
    4c0c:	e3530000 	cmp	r3, #0
    4c10:	1affffe2 	bne	4ba0 <printint+0x64>
    if(neg)
    4c14:	e51b300c 	ldr	r3, [fp, #-12]
    4c18:	e3530000 	cmp	r3, #0
    4c1c:	0a000015 	beq	4c78 <printint+0x13c>
        buf[i++] = '-';
    4c20:	e3e0101b 	mvn	r1, #27
    4c24:	e51b3008 	ldr	r3, [fp, #-8]
    4c28:	e24b0004 	sub	r0, fp, #4
    4c2c:	e0802003 	add	r2, r0, r3
    4c30:	e1a03001 	mov	r3, r1
    4c34:	e0823003 	add	r3, r2, r3
    4c38:	e3a0202d 	mov	r2, #45	; 0x2d
    4c3c:	e5c32000 	strb	r2, [r3]
    4c40:	e51b3008 	ldr	r3, [fp, #-8]
    4c44:	e2833001 	add	r3, r3, #1
    4c48:	e50b3008 	str	r3, [fp, #-8]
    
    while(--i >= 0)
    4c4c:	ea000009 	b	4c78 <printint+0x13c>
        putc(fd, buf[i]);
    4c50:	e3e0101b 	mvn	r1, #27
    4c54:	e51b3008 	ldr	r3, [fp, #-8]
    4c58:	e24bc004 	sub	ip, fp, #4
    4c5c:	e08c2003 	add	r2, ip, r3
    4c60:	e1a03001 	mov	r3, r1
    4c64:	e0823003 	add	r3, r2, r3
    4c68:	e5d33000 	ldrb	r3, [r3]
    4c6c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    4c70:	e1a01003 	mov	r1, r3
    4c74:	ebffffa3 	bl	4b08 <putc>
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';
    
    while(--i >= 0)
    4c78:	e51b3008 	ldr	r3, [fp, #-8]
    4c7c:	e2433001 	sub	r3, r3, #1
    4c80:	e50b3008 	str	r3, [fp, #-8]
    4c84:	e51b3008 	ldr	r3, [fp, #-8]
    4c88:	e3530000 	cmp	r3, #0
    4c8c:	aaffffef 	bge	4c50 <printint+0x114>
        putc(fd, buf[i]);
}
    4c90:	e24bd004 	sub	sp, fp, #4
    4c94:	e8bd8800 	pop	{fp, pc}

00004c98 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4c98:	e92d000e 	push	{r1, r2, r3}
    4c9c:	e92d4800 	push	{fp, lr}
    4ca0:	e28db004 	add	fp, sp, #4
    4ca4:	e24dd024 	sub	sp, sp, #36	; 0x24
    4ca8:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    char *s;
    int c, i, state;
    uint *ap;
    
    state = 0;
    4cac:	e3a03000 	mov	r3, #0
    4cb0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ap = (uint*)(void*)&fmt + 1;
    4cb4:	e28b3008 	add	r3, fp, #8
    4cb8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    for(i = 0; fmt[i]; i++){
    4cbc:	e3a03000 	mov	r3, #0
    4cc0:	e50b3010 	str	r3, [fp, #-16]
    4cc4:	ea000077 	b	4ea8 <printf+0x210>
        c = fmt[i] & 0xff;
    4cc8:	e59b2004 	ldr	r2, [fp, #4]
    4ccc:	e51b3010 	ldr	r3, [fp, #-16]
    4cd0:	e0823003 	add	r3, r2, r3
    4cd4:	e5d33000 	ldrb	r3, [r3]
    4cd8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        if(state == 0){
    4cdc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4ce0:	e3530000 	cmp	r3, #0
    4ce4:	1a00000b 	bne	4d18 <printf+0x80>
            if(c == '%'){
    4ce8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4cec:	e3530025 	cmp	r3, #37	; 0x25
    4cf0:	1a000002 	bne	4d00 <printf+0x68>
                state = '%';
    4cf4:	e3a03025 	mov	r3, #37	; 0x25
    4cf8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    4cfc:	ea000066 	b	4e9c <printf+0x204>
            } else {
                putc(fd, c);
    4d00:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4d04:	e6ef3073 	uxtb	r3, r3
    4d08:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4d0c:	e1a01003 	mov	r1, r3
    4d10:	ebffff7c 	bl	4b08 <putc>
    4d14:	ea000060 	b	4e9c <printf+0x204>
            }
        } else if(state == '%'){
    4d18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4d1c:	e3530025 	cmp	r3, #37	; 0x25
    4d20:	1a00005d 	bne	4e9c <printf+0x204>
            if(c == 'd'){
    4d24:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4d28:	e3530064 	cmp	r3, #100	; 0x64
    4d2c:	1a00000a 	bne	4d5c <printf+0xc4>
                printint(fd, *ap, 10, 1);
    4d30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4d34:	e5933000 	ldr	r3, [r3]
    4d38:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4d3c:	e1a01003 	mov	r1, r3
    4d40:	e3a0200a 	mov	r2, #10
    4d44:	e3a03001 	mov	r3, #1
    4d48:	ebffff7b 	bl	4b3c <printint>
                ap++;
    4d4c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4d50:	e2833004 	add	r3, r3, #4
    4d54:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    4d58:	ea00004d 	b	4e94 <printf+0x1fc>
            } else if(c == 'x' || c == 'p'){
    4d5c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4d60:	e3530078 	cmp	r3, #120	; 0x78
    4d64:	0a000002 	beq	4d74 <printf+0xdc>
    4d68:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4d6c:	e3530070 	cmp	r3, #112	; 0x70
    4d70:	1a00000a 	bne	4da0 <printf+0x108>
                printint(fd, *ap, 16, 0);
    4d74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4d78:	e5933000 	ldr	r3, [r3]
    4d7c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4d80:	e1a01003 	mov	r1, r3
    4d84:	e3a02010 	mov	r2, #16
    4d88:	e3a03000 	mov	r3, #0
    4d8c:	ebffff6a 	bl	4b3c <printint>
                ap++;
    4d90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4d94:	e2833004 	add	r3, r3, #4
    4d98:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    4d9c:	ea00003c 	b	4e94 <printf+0x1fc>
            } else if(c == 's'){
    4da0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4da4:	e3530073 	cmp	r3, #115	; 0x73
    4da8:	1a00001b 	bne	4e1c <printf+0x184>
                s = (char*)*ap;
    4dac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4db0:	e5933000 	ldr	r3, [r3]
    4db4:	e50b300c 	str	r3, [fp, #-12]
                ap++;
    4db8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4dbc:	e2833004 	add	r3, r3, #4
    4dc0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                if(s == 0)
    4dc4:	e51b300c 	ldr	r3, [fp, #-12]
    4dc8:	e3530000 	cmp	r3, #0
    4dcc:	1a00000c 	bne	4e04 <printf+0x16c>
                    s = "(null)";
    4dd0:	e3063ba0 	movw	r3, #27552	; 0x6ba0
    4dd4:	e3403000 	movt	r3, #0
    4dd8:	e50b300c 	str	r3, [fp, #-12]
                while(*s != 0){
    4ddc:	ea000008 	b	4e04 <printf+0x16c>
                    putc(fd, *s);
    4de0:	e51b300c 	ldr	r3, [fp, #-12]
    4de4:	e5d33000 	ldrb	r3, [r3]
    4de8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4dec:	e1a01003 	mov	r1, r3
    4df0:	ebffff44 	bl	4b08 <putc>
                    s++;
    4df4:	e51b300c 	ldr	r3, [fp, #-12]
    4df8:	e2833001 	add	r3, r3, #1
    4dfc:	e50b300c 	str	r3, [fp, #-12]
    4e00:	ea000000 	b	4e08 <printf+0x170>
            } else if(c == 's'){
                s = (char*)*ap;
                ap++;
                if(s == 0)
                    s = "(null)";
                while(*s != 0){
    4e04:	e1a00000 	nop			; (mov r0, r0)
    4e08:	e51b300c 	ldr	r3, [fp, #-12]
    4e0c:	e5d33000 	ldrb	r3, [r3]
    4e10:	e3530000 	cmp	r3, #0
    4e14:	1afffff1 	bne	4de0 <printf+0x148>
    4e18:	ea00001d 	b	4e94 <printf+0x1fc>
                    putc(fd, *s);
                    s++;
                }
            } else if(c == 'c'){
    4e1c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4e20:	e3530063 	cmp	r3, #99	; 0x63
    4e24:	1a000009 	bne	4e50 <printf+0x1b8>
                putc(fd, *ap);
    4e28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4e2c:	e5933000 	ldr	r3, [r3]
    4e30:	e6ef3073 	uxtb	r3, r3
    4e34:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4e38:	e1a01003 	mov	r1, r3
    4e3c:	ebffff31 	bl	4b08 <putc>
                ap++;
    4e40:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4e44:	e2833004 	add	r3, r3, #4
    4e48:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    4e4c:	ea000010 	b	4e94 <printf+0x1fc>
            } else if(c == '%'){
    4e50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4e54:	e3530025 	cmp	r3, #37	; 0x25
    4e58:	1a000005 	bne	4e74 <printf+0x1dc>
                putc(fd, c);
    4e5c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4e60:	e6ef3073 	uxtb	r3, r3
    4e64:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4e68:	e1a01003 	mov	r1, r3
    4e6c:	ebffff25 	bl	4b08 <putc>
    4e70:	ea000007 	b	4e94 <printf+0x1fc>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc(fd, '%');
    4e74:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4e78:	e3a01025 	mov	r1, #37	; 0x25
    4e7c:	ebffff21 	bl	4b08 <putc>
                putc(fd, c);
    4e80:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4e84:	e6ef3073 	uxtb	r3, r3
    4e88:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4e8c:	e1a01003 	mov	r1, r3
    4e90:	ebffff1c 	bl	4b08 <putc>
            }
            state = 0;
    4e94:	e3a03000 	mov	r3, #0
    4e98:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int c, i, state;
    uint *ap;
    
    state = 0;
    ap = (uint*)(void*)&fmt + 1;
    for(i = 0; fmt[i]; i++){
    4e9c:	e51b3010 	ldr	r3, [fp, #-16]
    4ea0:	e2833001 	add	r3, r3, #1
    4ea4:	e50b3010 	str	r3, [fp, #-16]
    4ea8:	e59b2004 	ldr	r2, [fp, #4]
    4eac:	e51b3010 	ldr	r3, [fp, #-16]
    4eb0:	e0823003 	add	r3, r2, r3
    4eb4:	e5d33000 	ldrb	r3, [r3]
    4eb8:	e3530000 	cmp	r3, #0
    4ebc:	1affff81 	bne	4cc8 <printf+0x30>
                putc(fd, c);
            }
            state = 0;
        }
    }
}
    4ec0:	e24bd004 	sub	sp, fp, #4
    4ec4:	e8bd4800 	pop	{fp, lr}
    4ec8:	e28dd00c 	add	sp, sp, #12
    4ecc:	e12fff1e 	bx	lr

00004ed0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4ed0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4ed4:	e28db000 	add	fp, sp, #0
    4ed8:	e24dd014 	sub	sp, sp, #20
    4edc:	e50b0010 	str	r0, [fp, #-16]
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    4ee0:	e51b3010 	ldr	r3, [fp, #-16]
    4ee4:	e2433008 	sub	r3, r3, #8
    4ee8:	e50b300c 	str	r3, [fp, #-12]
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4eec:	e3063c60 	movw	r3, #27744	; 0x6c60
    4ef0:	e3403000 	movt	r3, #0
    4ef4:	e5933000 	ldr	r3, [r3]
    4ef8:	e50b3008 	str	r3, [fp, #-8]
    4efc:	ea000010 	b	4f44 <free+0x74>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4f00:	e51b3008 	ldr	r3, [fp, #-8]
    4f04:	e5932000 	ldr	r2, [r3]
    4f08:	e51b3008 	ldr	r3, [fp, #-8]
    4f0c:	e1520003 	cmp	r2, r3
    4f10:	8a000008 	bhi	4f38 <free+0x68>
    4f14:	e51b200c 	ldr	r2, [fp, #-12]
    4f18:	e51b3008 	ldr	r3, [fp, #-8]
    4f1c:	e1520003 	cmp	r2, r3
    4f20:	8a000010 	bhi	4f68 <free+0x98>
    4f24:	e51b3008 	ldr	r3, [fp, #-8]
    4f28:	e5932000 	ldr	r2, [r3]
    4f2c:	e51b300c 	ldr	r3, [fp, #-12]
    4f30:	e1520003 	cmp	r2, r3
    4f34:	8a00000b 	bhi	4f68 <free+0x98>
free(void *ap)
{
    Header *bp, *p;
    
    bp = (Header*)ap - 1;
    for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4f38:	e51b3008 	ldr	r3, [fp, #-8]
    4f3c:	e5933000 	ldr	r3, [r3]
    4f40:	e50b3008 	str	r3, [fp, #-8]
    4f44:	e51b200c 	ldr	r2, [fp, #-12]
    4f48:	e51b3008 	ldr	r3, [fp, #-8]
    4f4c:	e1520003 	cmp	r2, r3
    4f50:	9affffea 	bls	4f00 <free+0x30>
    4f54:	e51b3008 	ldr	r3, [fp, #-8]
    4f58:	e5932000 	ldr	r2, [r3]
    4f5c:	e51b300c 	ldr	r3, [fp, #-12]
    4f60:	e1520003 	cmp	r2, r3
    4f64:	9affffe5 	bls	4f00 <free+0x30>
        if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
            break;
    if(bp + bp->s.size == p->s.ptr){
    4f68:	e51b300c 	ldr	r3, [fp, #-12]
    4f6c:	e5933004 	ldr	r3, [r3, #4]
    4f70:	e1a03183 	lsl	r3, r3, #3
    4f74:	e51b200c 	ldr	r2, [fp, #-12]
    4f78:	e0822003 	add	r2, r2, r3
    4f7c:	e51b3008 	ldr	r3, [fp, #-8]
    4f80:	e5933000 	ldr	r3, [r3]
    4f84:	e1520003 	cmp	r2, r3
    4f88:	1a00000d 	bne	4fc4 <free+0xf4>
        bp->s.size += p->s.ptr->s.size;
    4f8c:	e51b300c 	ldr	r3, [fp, #-12]
    4f90:	e5932004 	ldr	r2, [r3, #4]
    4f94:	e51b3008 	ldr	r3, [fp, #-8]
    4f98:	e5933000 	ldr	r3, [r3]
    4f9c:	e5933004 	ldr	r3, [r3, #4]
    4fa0:	e0822003 	add	r2, r2, r3
    4fa4:	e51b300c 	ldr	r3, [fp, #-12]
    4fa8:	e5832004 	str	r2, [r3, #4]
        bp->s.ptr = p->s.ptr->s.ptr;
    4fac:	e51b3008 	ldr	r3, [fp, #-8]
    4fb0:	e5933000 	ldr	r3, [r3]
    4fb4:	e5932000 	ldr	r2, [r3]
    4fb8:	e51b300c 	ldr	r3, [fp, #-12]
    4fbc:	e5832000 	str	r2, [r3]
    4fc0:	ea000003 	b	4fd4 <free+0x104>
    } else
        bp->s.ptr = p->s.ptr;
    4fc4:	e51b3008 	ldr	r3, [fp, #-8]
    4fc8:	e5932000 	ldr	r2, [r3]
    4fcc:	e51b300c 	ldr	r3, [fp, #-12]
    4fd0:	e5832000 	str	r2, [r3]
    if(p + p->s.size == bp){
    4fd4:	e51b3008 	ldr	r3, [fp, #-8]
    4fd8:	e5933004 	ldr	r3, [r3, #4]
    4fdc:	e1a03183 	lsl	r3, r3, #3
    4fe0:	e51b2008 	ldr	r2, [fp, #-8]
    4fe4:	e0822003 	add	r2, r2, r3
    4fe8:	e51b300c 	ldr	r3, [fp, #-12]
    4fec:	e1520003 	cmp	r2, r3
    4ff0:	1a00000b 	bne	5024 <free+0x154>
        p->s.size += bp->s.size;
    4ff4:	e51b3008 	ldr	r3, [fp, #-8]
    4ff8:	e5932004 	ldr	r2, [r3, #4]
    4ffc:	e51b300c 	ldr	r3, [fp, #-12]
    5000:	e5933004 	ldr	r3, [r3, #4]
    5004:	e0822003 	add	r2, r2, r3
    5008:	e51b3008 	ldr	r3, [fp, #-8]
    500c:	e5832004 	str	r2, [r3, #4]
        p->s.ptr = bp->s.ptr;
    5010:	e51b300c 	ldr	r3, [fp, #-12]
    5014:	e5932000 	ldr	r2, [r3]
    5018:	e51b3008 	ldr	r3, [fp, #-8]
    501c:	e5832000 	str	r2, [r3]
    5020:	ea000002 	b	5030 <free+0x160>
    } else
        p->s.ptr = bp;
    5024:	e51b3008 	ldr	r3, [fp, #-8]
    5028:	e51b200c 	ldr	r2, [fp, #-12]
    502c:	e5832000 	str	r2, [r3]
    freep = p;
    5030:	e3063c60 	movw	r3, #27744	; 0x6c60
    5034:	e3403000 	movt	r3, #0
    5038:	e51b2008 	ldr	r2, [fp, #-8]
    503c:	e5832000 	str	r2, [r3]
}
    5040:	e28bd000 	add	sp, fp, #0
    5044:	e8bd0800 	pop	{fp}
    5048:	e12fff1e 	bx	lr

0000504c <morecore>:

static Header*
morecore(uint nu)
{
    504c:	e92d4800 	push	{fp, lr}
    5050:	e28db004 	add	fp, sp, #4
    5054:	e24dd010 	sub	sp, sp, #16
    5058:	e50b0010 	str	r0, [fp, #-16]
    char *p;
    Header *hp;
    
    if(nu < 4096)
    505c:	e51b2010 	ldr	r2, [fp, #-16]
    5060:	e3003fff 	movw	r3, #4095	; 0xfff
    5064:	e1520003 	cmp	r2, r3
    5068:	8a000001 	bhi	5074 <morecore+0x28>
        nu = 4096;
    506c:	e3a03a01 	mov	r3, #4096	; 0x1000
    5070:	e50b3010 	str	r3, [fp, #-16]
    p = sbrk(nu * sizeof(Header));
    5074:	e51b3010 	ldr	r3, [fp, #-16]
    5078:	e1a03183 	lsl	r3, r3, #3
    507c:	e1a00003 	mov	r0, r3
    5080:	ebfffe85 	bl	4a9c <sbrk>
    5084:	e50b0008 	str	r0, [fp, #-8]
    if(p == (char*)-1)
    5088:	e51b3008 	ldr	r3, [fp, #-8]
    508c:	e3730001 	cmn	r3, #1
    5090:	1a000001 	bne	509c <morecore+0x50>
        return 0;
    5094:	e3a03000 	mov	r3, #0
    5098:	ea00000b 	b	50cc <morecore+0x80>
    hp = (Header*)p;
    509c:	e51b3008 	ldr	r3, [fp, #-8]
    50a0:	e50b300c 	str	r3, [fp, #-12]
    hp->s.size = nu;
    50a4:	e51b300c 	ldr	r3, [fp, #-12]
    50a8:	e51b2010 	ldr	r2, [fp, #-16]
    50ac:	e5832004 	str	r2, [r3, #4]
    free((void*)(hp + 1));
    50b0:	e51b300c 	ldr	r3, [fp, #-12]
    50b4:	e2833008 	add	r3, r3, #8
    50b8:	e1a00003 	mov	r0, r3
    50bc:	ebffff83 	bl	4ed0 <free>
    return freep;
    50c0:	e3063c60 	movw	r3, #27744	; 0x6c60
    50c4:	e3403000 	movt	r3, #0
    50c8:	e5933000 	ldr	r3, [r3]
}
    50cc:	e1a00003 	mov	r0, r3
    50d0:	e24bd004 	sub	sp, fp, #4
    50d4:	e8bd8800 	pop	{fp, pc}

000050d8 <malloc>:

void*
malloc(uint nbytes)
{
    50d8:	e92d4800 	push	{fp, lr}
    50dc:	e28db004 	add	fp, sp, #4
    50e0:	e24dd018 	sub	sp, sp, #24
    50e4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    Header *p, *prevp;
    uint nunits;
    
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    50e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    50ec:	e2833007 	add	r3, r3, #7
    50f0:	e1a031a3 	lsr	r3, r3, #3
    50f4:	e2833001 	add	r3, r3, #1
    50f8:	e50b3010 	str	r3, [fp, #-16]
    if((prevp = freep) == 0){
    50fc:	e3063c60 	movw	r3, #27744	; 0x6c60
    5100:	e3403000 	movt	r3, #0
    5104:	e5933000 	ldr	r3, [r3]
    5108:	e50b300c 	str	r3, [fp, #-12]
    510c:	e51b300c 	ldr	r3, [fp, #-12]
    5110:	e3530000 	cmp	r3, #0
    5114:	1a000010 	bne	515c <malloc+0x84>
        base.s.ptr = freep = prevp = &base;
    5118:	e3063c58 	movw	r3, #27736	; 0x6c58
    511c:	e3403000 	movt	r3, #0
    5120:	e50b300c 	str	r3, [fp, #-12]
    5124:	e3063c60 	movw	r3, #27744	; 0x6c60
    5128:	e3403000 	movt	r3, #0
    512c:	e51b200c 	ldr	r2, [fp, #-12]
    5130:	e5832000 	str	r2, [r3]
    5134:	e3063c60 	movw	r3, #27744	; 0x6c60
    5138:	e3403000 	movt	r3, #0
    513c:	e5932000 	ldr	r2, [r3]
    5140:	e3063c58 	movw	r3, #27736	; 0x6c58
    5144:	e3403000 	movt	r3, #0
    5148:	e5832000 	str	r2, [r3]
        base.s.size = 0;
    514c:	e3063c58 	movw	r3, #27736	; 0x6c58
    5150:	e3403000 	movt	r3, #0
    5154:	e3a02000 	mov	r2, #0
    5158:	e5832004 	str	r2, [r3, #4]
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    515c:	e51b300c 	ldr	r3, [fp, #-12]
    5160:	e5933000 	ldr	r3, [r3]
    5164:	e50b3008 	str	r3, [fp, #-8]
        if(p->s.size >= nunits){
    5168:	e51b3008 	ldr	r3, [fp, #-8]
    516c:	e5932004 	ldr	r2, [r3, #4]
    5170:	e51b3010 	ldr	r3, [fp, #-16]
    5174:	e1520003 	cmp	r2, r3
    5178:	3a00001f 	bcc	51fc <malloc+0x124>
            if(p->s.size == nunits)
    517c:	e51b3008 	ldr	r3, [fp, #-8]
    5180:	e5932004 	ldr	r2, [r3, #4]
    5184:	e51b3010 	ldr	r3, [fp, #-16]
    5188:	e1520003 	cmp	r2, r3
    518c:	1a000004 	bne	51a4 <malloc+0xcc>
                prevp->s.ptr = p->s.ptr;
    5190:	e51b3008 	ldr	r3, [fp, #-8]
    5194:	e5932000 	ldr	r2, [r3]
    5198:	e51b300c 	ldr	r3, [fp, #-12]
    519c:	e5832000 	str	r2, [r3]
    51a0:	ea00000e 	b	51e0 <malloc+0x108>
            else {
                p->s.size -= nunits;
    51a4:	e51b3008 	ldr	r3, [fp, #-8]
    51a8:	e5932004 	ldr	r2, [r3, #4]
    51ac:	e51b3010 	ldr	r3, [fp, #-16]
    51b0:	e0632002 	rsb	r2, r3, r2
    51b4:	e51b3008 	ldr	r3, [fp, #-8]
    51b8:	e5832004 	str	r2, [r3, #4]
                p += p->s.size;
    51bc:	e51b3008 	ldr	r3, [fp, #-8]
    51c0:	e5933004 	ldr	r3, [r3, #4]
    51c4:	e1a03183 	lsl	r3, r3, #3
    51c8:	e51b2008 	ldr	r2, [fp, #-8]
    51cc:	e0823003 	add	r3, r2, r3
    51d0:	e50b3008 	str	r3, [fp, #-8]
                p->s.size = nunits;
    51d4:	e51b3008 	ldr	r3, [fp, #-8]
    51d8:	e51b2010 	ldr	r2, [fp, #-16]
    51dc:	e5832004 	str	r2, [r3, #4]
            }
            freep = prevp;
    51e0:	e3063c60 	movw	r3, #27744	; 0x6c60
    51e4:	e3403000 	movt	r3, #0
    51e8:	e51b200c 	ldr	r2, [fp, #-12]
    51ec:	e5832000 	str	r2, [r3]
            return (void*)(p + 1);
    51f0:	e51b3008 	ldr	r3, [fp, #-8]
    51f4:	e2833008 	add	r3, r3, #8
    51f8:	ea000013 	b	524c <malloc+0x174>
        }
        if(p == freep)
    51fc:	e3063c60 	movw	r3, #27744	; 0x6c60
    5200:	e3403000 	movt	r3, #0
    5204:	e5933000 	ldr	r3, [r3]
    5208:	e51b2008 	ldr	r2, [fp, #-8]
    520c:	e1520003 	cmp	r2, r3
    5210:	1a000007 	bne	5234 <malloc+0x15c>
            if((p = morecore(nunits)) == 0)
    5214:	e51b0010 	ldr	r0, [fp, #-16]
    5218:	ebffff8b 	bl	504c <morecore>
    521c:	e50b0008 	str	r0, [fp, #-8]
    5220:	e51b3008 	ldr	r3, [fp, #-8]
    5224:	e3530000 	cmp	r3, #0
    5228:	1a000001 	bne	5234 <malloc+0x15c>
                return 0;
    522c:	e3a03000 	mov	r3, #0
    5230:	ea000005 	b	524c <malloc+0x174>
    nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    if((prevp = freep) == 0){
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5234:	e51b3008 	ldr	r3, [fp, #-8]
    5238:	e50b300c 	str	r3, [fp, #-12]
    523c:	e51b3008 	ldr	r3, [fp, #-8]
    5240:	e5933000 	ldr	r3, [r3]
    5244:	e50b3008 	str	r3, [fp, #-8]
            return (void*)(p + 1);
        }
        if(p == freep)
            if((p = morecore(nunits)) == 0)
                return 0;
    }
    5248:	eaffffc6 	b	5168 <malloc+0x90>
}
    524c:	e1a00003 	mov	r0, r3
    5250:	e24bd004 	sub	sp, fp, #4
    5254:	e8bd8800 	pop	{fp, pc}

00005258 <__aeabi_uidiv>:
    5258:	e2512001 	subs	r2, r1, #1
    525c:	012fff1e 	bxeq	lr
    5260:	3a000036 	bcc	5340 <__aeabi_uidiv+0xe8>
    5264:	e1500001 	cmp	r0, r1
    5268:	9a000022 	bls	52f8 <__aeabi_uidiv+0xa0>
    526c:	e1110002 	tst	r1, r2
    5270:	0a000023 	beq	5304 <__aeabi_uidiv+0xac>
    5274:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    5278:	01a01181 	lsleq	r1, r1, #3
    527c:	03a03008 	moveq	r3, #8
    5280:	13a03001 	movne	r3, #1
    5284:	e3510201 	cmp	r1, #268435456	; 0x10000000
    5288:	31510000 	cmpcc	r1, r0
    528c:	31a01201 	lslcc	r1, r1, #4
    5290:	31a03203 	lslcc	r3, r3, #4
    5294:	3afffffa 	bcc	5284 <__aeabi_uidiv+0x2c>
    5298:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    529c:	31510000 	cmpcc	r1, r0
    52a0:	31a01081 	lslcc	r1, r1, #1
    52a4:	31a03083 	lslcc	r3, r3, #1
    52a8:	3afffffa 	bcc	5298 <__aeabi_uidiv+0x40>
    52ac:	e3a02000 	mov	r2, #0
    52b0:	e1500001 	cmp	r0, r1
    52b4:	20400001 	subcs	r0, r0, r1
    52b8:	21822003 	orrcs	r2, r2, r3
    52bc:	e15000a1 	cmp	r0, r1, lsr #1
    52c0:	204000a1 	subcs	r0, r0, r1, lsr #1
    52c4:	218220a3 	orrcs	r2, r2, r3, lsr #1
    52c8:	e1500121 	cmp	r0, r1, lsr #2
    52cc:	20400121 	subcs	r0, r0, r1, lsr #2
    52d0:	21822123 	orrcs	r2, r2, r3, lsr #2
    52d4:	e15001a1 	cmp	r0, r1, lsr #3
    52d8:	204001a1 	subcs	r0, r0, r1, lsr #3
    52dc:	218221a3 	orrcs	r2, r2, r3, lsr #3
    52e0:	e3500000 	cmp	r0, #0
    52e4:	11b03223 	lsrsne	r3, r3, #4
    52e8:	11a01221 	lsrne	r1, r1, #4
    52ec:	1affffef 	bne	52b0 <__aeabi_uidiv+0x58>
    52f0:	e1a00002 	mov	r0, r2
    52f4:	e12fff1e 	bx	lr
    52f8:	03a00001 	moveq	r0, #1
    52fc:	13a00000 	movne	r0, #0
    5300:	e12fff1e 	bx	lr
    5304:	e3510801 	cmp	r1, #65536	; 0x10000
    5308:	21a01821 	lsrcs	r1, r1, #16
    530c:	23a02010 	movcs	r2, #16
    5310:	33a02000 	movcc	r2, #0
    5314:	e3510c01 	cmp	r1, #256	; 0x100
    5318:	21a01421 	lsrcs	r1, r1, #8
    531c:	22822008 	addcs	r2, r2, #8
    5320:	e3510010 	cmp	r1, #16
    5324:	21a01221 	lsrcs	r1, r1, #4
    5328:	22822004 	addcs	r2, r2, #4
    532c:	e3510004 	cmp	r1, #4
    5330:	82822003 	addhi	r2, r2, #3
    5334:	908220a1 	addls	r2, r2, r1, lsr #1
    5338:	e1a00230 	lsr	r0, r0, r2
    533c:	e12fff1e 	bx	lr
    5340:	e3500000 	cmp	r0, #0
    5344:	13e00000 	mvnne	r0, #0
    5348:	ea000007 	b	536c <__aeabi_idiv0>

0000534c <__aeabi_uidivmod>:
    534c:	e3510000 	cmp	r1, #0
    5350:	0afffffa 	beq	5340 <__aeabi_uidiv+0xe8>
    5354:	e92d4003 	push	{r0, r1, lr}
    5358:	ebffffbe 	bl	5258 <__aeabi_uidiv>
    535c:	e8bd4006 	pop	{r1, r2, lr}
    5360:	e0030092 	mul	r3, r2, r0
    5364:	e0411003 	sub	r1, r1, r3
    5368:	e12fff1e 	bx	lr

0000536c <__aeabi_idiv0>:
    536c:	e12fff1e 	bx	lr
