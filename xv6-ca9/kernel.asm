
kernel.elf:     file format elf32-littlearm


Disassembly of section .start_sec:

00010000 <_start>:
   10000:	e59f1030 	ldr	r1, [pc, #48]	; 10038 <jump_stack+0x10>
   10004:	e59f2030 	ldr	r2, [pc, #48]	; 1003c <jump_stack+0x14>
   10008:	e3a03000 	mov	r3, #0
   1000c:	e1510002 	cmp	r1, r2
   10010:	b8a10008 	stmialt	r1!, {r3}
   10014:	bafffffc 	blt	1000c <_start+0xc>
   10018:	e32ff0d3 	msr	CPSR_fsxc, #211	; 0xd3
   1001c:	e59fd01c 	ldr	sp, [pc, #28]	; 10040 <jump_stack+0x18>
   10020:	eb000104 	bl	10438 <start>
   10024:	eafffffe 	b	10024 <_start+0x24>

00010028 <jump_stack>:
   10028:	e1a0000d 	mov	r0, sp
   1002c:	e2800102 	add	r0, r0, #-2147483648	; 0x80000000
   10030:	e1a0d000 	mov	sp, r0
   10034:	e1a0f00e 	mov	pc, lr
   10038:	00010620 	.word	0x00010620
   1003c:	00019000 	.word	0x00019000
   10040:	00012000 	.word	0x00012000

00010044 <_uart_putc>:
#include "memlayout.h"

static int mmu_on = 0;

void _uart_putc(int c)
{
   10044:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10048:	e28db000 	add	fp, sp, #0
   1004c:	e24dd014 	sub	sp, sp, #20
   10050:	e50b0010 	str	r0, [fp, #-16]
    volatile uint8 * uart0;
    if (!mmu_on)
   10054:	e3003620 	movw	r3, #1568	; 0x620
   10058:	e3403001 	movt	r3, #1
   1005c:	e5933000 	ldr	r3, [r3]
   10060:	e3530000 	cmp	r3, #0
   10064:	1a000003 	bne	10078 <_uart_putc+0x34>
    	uart0 = (uint8 *)UART0;
   10068:	e3a03a09 	mov	r3, #36864	; 0x9000
   1006c:	e3413000 	movt	r3, #4096	; 0x1000
   10070:	e50b3008 	str	r3, [fp, #-8]
   10074:	ea000002 	b	10084 <_uart_putc+0x40>
    else
    	uart0 = (uint8 *)(P2V(UART0));
   10078:	e3a03a09 	mov	r3, #36864	; 0x9000
   1007c:	e3493000 	movt	r3, #36864	; 0x9000
   10080:	e50b3008 	str	r3, [fp, #-8]

    *uart0 = c;
   10084:	e51b3010 	ldr	r3, [fp, #-16]
   10088:	e6ef2073 	uxtb	r2, r3
   1008c:	e51b3008 	ldr	r3, [fp, #-8]
   10090:	e5c32000 	strb	r2, [r3]
}
   10094:	e28bd000 	add	sp, fp, #0
   10098:	e8bd0800 	pop	{fp}
   1009c:	e12fff1e 	bx	lr

000100a0 <_puts>:


void _puts (char *s)
{
   100a0:	e92d4800 	push	{fp, lr}
   100a4:	e28db004 	add	fp, sp, #4
   100a8:	e24dd008 	sub	sp, sp, #8
   100ac:	e50b0008 	str	r0, [fp, #-8]
    while (*s != '\0') {
   100b0:	ea000006 	b	100d0 <_puts+0x30>
        _uart_putc(*s);
   100b4:	e51b3008 	ldr	r3, [fp, #-8]
   100b8:	e5d33000 	ldrb	r3, [r3]
   100bc:	e1a00003 	mov	r0, r3
   100c0:	ebffffdf 	bl	10044 <_uart_putc>
        s++;
   100c4:	e51b3008 	ldr	r3, [fp, #-8]
   100c8:	e2833001 	add	r3, r3, #1
   100cc:	e50b3008 	str	r3, [fp, #-8]
}


void _puts (char *s)
{
    while (*s != '\0') {
   100d0:	e51b3008 	ldr	r3, [fp, #-8]
   100d4:	e5d33000 	ldrb	r3, [r3]
   100d8:	e3530000 	cmp	r3, #0
   100dc:	1afffff4 	bne	100b4 <_puts+0x14>
        _uart_putc(*s);
        s++;
    }
}
   100e0:	e24bd004 	sub	sp, fp, #4
   100e4:	e8bd8800 	pop	{fp, pc}

000100e8 <_putint>:

void _putint (char *prefix, uint val, char* suffix)
{
   100e8:	e92d4800 	push	{fp, lr}
   100ec:	e28db004 	add	fp, sp, #4
   100f0:	e24dd018 	sub	sp, sp, #24
   100f4:	e50b0010 	str	r0, [fp, #-16]
   100f8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   100fc:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char* arr = "0123456789ABCDEF";
   10100:	e3003538 	movw	r3, #1336	; 0x538
   10104:	e3403001 	movt	r3, #1
   10108:	e50b300c 	str	r3, [fp, #-12]
    int idx;

    if (prefix) {
   1010c:	e51b3010 	ldr	r3, [fp, #-16]
   10110:	e3530000 	cmp	r3, #0
   10114:	0a000001 	beq	10120 <_putint+0x38>
        _puts(prefix);
   10118:	e51b0010 	ldr	r0, [fp, #-16]
   1011c:	ebffffdf 	bl	100a0 <_puts>
    }

    for (idx = sizeof(val) * 8 - 4; idx >= 0; idx -= 4) {
   10120:	e3a0301c 	mov	r3, #28
   10124:	e50b3008 	str	r3, [fp, #-8]
   10128:	ea00000b 	b	1015c <_putint+0x74>
        _uart_putc(arr[(val >> idx) & 0x0F]);
   1012c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   10130:	e51b3008 	ldr	r3, [fp, #-8]
   10134:	e1a03332 	lsr	r3, r2, r3
   10138:	e203300f 	and	r3, r3, #15
   1013c:	e51b200c 	ldr	r2, [fp, #-12]
   10140:	e0823003 	add	r3, r2, r3
   10144:	e5d33000 	ldrb	r3, [r3]
   10148:	e1a00003 	mov	r0, r3
   1014c:	ebffffbc 	bl	10044 <_uart_putc>

    if (prefix) {
        _puts(prefix);
    }

    for (idx = sizeof(val) * 8 - 4; idx >= 0; idx -= 4) {
   10150:	e51b3008 	ldr	r3, [fp, #-8]
   10154:	e2433004 	sub	r3, r3, #4
   10158:	e50b3008 	str	r3, [fp, #-8]
   1015c:	e51b3008 	ldr	r3, [fp, #-8]
   10160:	e3530000 	cmp	r3, #0
   10164:	aafffff0 	bge	1012c <_putint+0x44>
        _uart_putc(arr[(val >> idx) & 0x0F]);
    }

    if (suffix) {
   10168:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   1016c:	e3530000 	cmp	r3, #0
   10170:	0a000001 	beq	1017c <_putint+0x94>
        _puts(suffix);
   10174:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
   10178:	ebffffc8 	bl	100a0 <_puts>
    }
}
   1017c:	e24bd004 	sub	sp, fp, #4
   10180:	e8bd8800 	pop	{fp, pc}

00010184 <get_pde>:
uint32 *user_pgtbl = &_user_pgtbl;

#define PDE_SHIFT 20

uint32 get_pde (uint32 virt)
{
   10184:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10188:	e28db000 	add	fp, sp, #0
   1018c:	e24dd00c 	sub	sp, sp, #12
   10190:	e50b0008 	str	r0, [fp, #-8]
    virt >>= PDE_SHIFT;
   10194:	e51b3008 	ldr	r3, [fp, #-8]
   10198:	e1a03a23 	lsr	r3, r3, #20
   1019c:	e50b3008 	str	r3, [fp, #-8]
    return kernel_pgtbl[virt];
   101a0:	e3003618 	movw	r3, #1560	; 0x618
   101a4:	e3403001 	movt	r3, #1
   101a8:	e5932000 	ldr	r2, [r3]
   101ac:	e51b3008 	ldr	r3, [fp, #-8]
   101b0:	e1a03103 	lsl	r3, r3, #2
   101b4:	e0823003 	add	r3, r2, r3
   101b8:	e5933000 	ldr	r3, [r3]
}
   101bc:	e1a00003 	mov	r0, r3
   101c0:	e28bd000 	add	sp, fp, #0
   101c4:	e8bd0800 	pop	{fp}
   101c8:	e12fff1e 	bx	lr

000101cc <set_bootpgtbl>:

// setup the boot page table: dev_mem whether it is device memory
void set_bootpgtbl (uint32 virt, uint32 phy, uint len, int dev_mem )
{
   101cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   101d0:	e28db000 	add	fp, sp, #0
   101d4:	e24dd01c 	sub	sp, sp, #28
   101d8:	e50b0010 	str	r0, [fp, #-16]
   101dc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   101e0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
   101e4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    uint32	pde;
    int		idx;

    // convert all the parameters to indexes
    virt >>= PDE_SHIFT;
   101e8:	e51b3010 	ldr	r3, [fp, #-16]
   101ec:	e1a03a23 	lsr	r3, r3, #20
   101f0:	e50b3010 	str	r3, [fp, #-16]
    phy  >>= PDE_SHIFT;
   101f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   101f8:	e1a03a23 	lsr	r3, r3, #20
   101fc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    len  >>= PDE_SHIFT;
   10200:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10204:	e1a03a23 	lsr	r3, r3, #20
   10208:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    for (idx = 0; idx < len; idx++) {
   1020c:	e3a03000 	mov	r3, #0
   10210:	e50b300c 	str	r3, [fp, #-12]
   10214:	ea00002b 	b	102c8 <set_bootpgtbl+0xfc>
        pde = (phy << PDE_SHIFT);
   10218:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   1021c:	e1a03a03 	lsl	r3, r3, #20
   10220:	e50b3008 	str	r3, [fp, #-8]

        if (!dev_mem) {
   10224:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10228:	e3530000 	cmp	r3, #0
   1022c:	1a000004 	bne	10244 <set_bootpgtbl+0x78>
            // normal memory, make it kernel-only, cachable, bufferable
            pde |= (AP_KO << 10) | PE_CACHE | PE_BUF | KPDE_TYPE;
   10230:	e51b3008 	ldr	r3, [fp, #-8]
   10234:	e3833b01 	orr	r3, r3, #1024	; 0x400
   10238:	e383300e 	orr	r3, r3, #14
   1023c:	e50b3008 	str	r3, [fp, #-8]
   10240:	ea000003 	b	10254 <set_bootpgtbl+0x88>
        } else {
            // device memory, make it non-cachable and non-bufferable
            pde |= (AP_KO << 10) | KPDE_TYPE;
   10244:	e51b3008 	ldr	r3, [fp, #-8]
   10248:	e3833b01 	orr	r3, r3, #1024	; 0x400
   1024c:	e3833002 	orr	r3, r3, #2
   10250:	e50b3008 	str	r3, [fp, #-8]
        }

        // use different page table for user/kernel space
        if (virt < NUM_UPDE) {
   10254:	e51b3010 	ldr	r3, [fp, #-16]
   10258:	e35300ff 	cmp	r3, #255	; 0xff
   1025c:	8a000008 	bhi	10284 <set_bootpgtbl+0xb8>
            user_pgtbl[virt] = pde;
   10260:	e300361c 	movw	r3, #1564	; 0x61c
   10264:	e3403001 	movt	r3, #1
   10268:	e5932000 	ldr	r2, [r3]
   1026c:	e51b3010 	ldr	r3, [fp, #-16]
   10270:	e1a03103 	lsl	r3, r3, #2
   10274:	e0823003 	add	r3, r2, r3
   10278:	e51b2008 	ldr	r2, [fp, #-8]
   1027c:	e5832000 	str	r2, [r3]
   10280:	ea000007 	b	102a4 <set_bootpgtbl+0xd8>
        } else {
            kernel_pgtbl[virt] = pde;
   10284:	e3003618 	movw	r3, #1560	; 0x618
   10288:	e3403001 	movt	r3, #1
   1028c:	e5932000 	ldr	r2, [r3]
   10290:	e51b3010 	ldr	r3, [fp, #-16]
   10294:	e1a03103 	lsl	r3, r3, #2
   10298:	e0823003 	add	r3, r2, r3
   1029c:	e51b2008 	ldr	r2, [fp, #-8]
   102a0:	e5832000 	str	r2, [r3]
        }

        virt++;
   102a4:	e51b3010 	ldr	r3, [fp, #-16]
   102a8:	e2833001 	add	r3, r3, #1
   102ac:	e50b3010 	str	r3, [fp, #-16]
        phy++;
   102b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   102b4:	e2833001 	add	r3, r3, #1
   102b8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    // convert all the parameters to indexes
    virt >>= PDE_SHIFT;
    phy  >>= PDE_SHIFT;
    len  >>= PDE_SHIFT;

    for (idx = 0; idx < len; idx++) {
   102bc:	e51b300c 	ldr	r3, [fp, #-12]
   102c0:	e2833001 	add	r3, r3, #1
   102c4:	e50b300c 	str	r3, [fp, #-12]
   102c8:	e51b200c 	ldr	r2, [fp, #-12]
   102cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   102d0:	e1520003 	cmp	r2, r3
   102d4:	3affffcf 	bcc	10218 <set_bootpgtbl+0x4c>
        }

        virt++;
        phy++;
    }
}
   102d8:	e28bd000 	add	sp, fp, #0
   102dc:	e8bd0800 	pop	{fp}
   102e0:	e12fff1e 	bx	lr

000102e4 <_flush_all>:

static void _flush_all (void)
{
   102e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   102e8:	e28db000 	add	fp, sp, #0
   102ec:	e24dd00c 	sub	sp, sp, #12
    uint val = 0;
   102f0:	e3a03000 	mov	r3, #0
   102f4:	e50b3008 	str	r3, [fp, #-8]

    // flush all TLB
    asm("MCR p15, 0, %[r], c8, c7, 0" : :[r]"r" (val):);
   102f8:	e51b3008 	ldr	r3, [fp, #-8]
   102fc:	ee083f17 	mcr	15, 0, r3, cr8, cr7, {0}

    // invalid entire data and instruction cache
    // asm ("MCR p15,0,%[r],c7,c5,0": :[r]"r" (val):);
    // asm ("MCR p15,0,%[r],c7,c6,0": :[r]"r" (val):);
}
   10300:	e28bd000 	add	sp, fp, #0
   10304:	e8bd0800 	pop	{fp}
   10308:	e12fff1e 	bx	lr

0001030c <load_pgtlb>:

void load_pgtlb (uint32* kern_pgtbl, uint32* user_pgtbl)
{
   1030c:	e92d4810 	push	{r4, fp, lr}
   10310:	e28db008 	add	fp, sp, #8
   10314:	e24dd01c 	sub	sp, sp, #28
   10318:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
   1031c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    uint	ret;
    char	arch;
    uint	val;

    // read the main id register to make sure we are running on ARMv6
    asm("MRC p15, 0, %[r], c0, c0, 0": [r]"=r" (ret)::);
   10320:	ee104f10 	mrc	15, 0, r4, cr0, cr0, {0}
   10324:	e50b4010 	str	r4, [fp, #-16]

    if (ret >> 24 == 0x41) {
        //_puts ("ARM-based CPU\n");
    }

    arch = (ret >> 16) & 0x0F;
   10328:	e51b3010 	ldr	r3, [fp, #-16]
   1032c:	e1a03823 	lsr	r3, r3, #16
   10330:	e6ef3073 	uxtb	r3, r3
   10334:	e203300f 	and	r3, r3, #15
   10338:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef

    if ((arch != 7) && (arch != 0xF)) {
   1033c:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10340:	e3530007 	cmp	r3, #7
   10344:	0a000005 	beq	10360 <load_pgtlb+0x54>
   10348:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   1034c:	e353000f 	cmp	r3, #15
   10350:	0a000002 	beq	10360 <load_pgtlb+0x54>
        _puts ("need AARM v6 or higher\n");
   10354:	e300054c 	movw	r0, #1356	; 0x54c
   10358:	e3400001 	movt	r0, #1
   1035c:	ebffff4f 	bl	100a0 <_puts>
    // we need to check the cache/tlb etc., but let's skip it for now

    /* xzl -- see trm: "summary of vmsa cp15 register descriptions".
     */

    _puts("going to config domain ...\n");
   10360:	e3000564 	movw	r0, #1380	; 0x564
   10364:	e3400001 	movt	r0, #1
   10368:	ebffff4c 	bl	100a0 <_puts>

    // set domain access control: all domain will be checked for permission
    val = 0x55555555;
   1036c:	e3053555 	movw	r3, #21845	; 0x5555
   10370:	e3453555 	movt	r3, #21845	; 0x5555
   10374:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    asm("MCR p15, 0, %[v], c3, c0, 0": :[v]"r" (val):);
   10378:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   1037c:	ee033f10 	mcr	15, 0, r3, cr3, cr0, {0}
    // for user space and TTBR1 for kernel space
    /* xzl: set up TTBCR.
     * see trm "selecting between ttbr0 and ttbr1, short-descriptor
     * xslat table format"
     * Note: v7a w/o LAPE uses short descriptor xslat table format */
    val = 32 - UADDR_BITS;
   10380:	e3a03004 	mov	r3, #4
   10384:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    asm("MCR p15, 0, %[v], c2, c0, 2": :[v]"r" (val):);
   10388:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   1038c:	ee023f50 	mcr	15, 0, r3, cr2, cr0, {2}

    // set the kernel page table
    /* xzl: TTBR1. XXX should be "& 0x00"? */
    val = (uint)kernel_pgtbl | 0x00;
   10390:	e3003618 	movw	r3, #1560	; 0x618
   10394:	e3403001 	movt	r3, #1
   10398:	e5933000 	ldr	r3, [r3]
   1039c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    asm("MCR p15, 0, %[v], c2, c0, 1": :[v]"r" (val):);
   103a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   103a4:	ee023f30 	mcr	15, 0, r3, cr2, cr0, {1}

    // set the user page table
    /* xzl: TTBR0 */
    val = (uint)user_pgtbl | 0x00;
   103a8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   103ac:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    asm("MCR p15, 0, %[v], c2, c0, 0": :[v]"r" (val):);
   103b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   103b4:	ee023f10 	mcr	15, 0, r3, cr2, cr0, {0}

    _puts("going to enable mmu ...\n");
   103b8:	e3000580 	movw	r0, #1408	; 0x580
   103bc:	e3400001 	movt	r0, #1
   103c0:	ebffff36 	bl	100a0 <_puts>

    // ok, enable paging using read/modify/write
    /* xzl: SCTLR */
    asm("MRC p15, 0, %[r], c1, c0, 0": [r]"=r" (val)::);
   103c4:	ee114f10 	mrc	15, 0, r4, cr1, cr0, {0}
   103c8:	e50b4018 	str	r4, [fp, #-24]	; 0xffffffe8

    val |= 0x80300D; // enable MMU, cache, write buffer, high vector tbl,
   103cc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   103d0:	e303300d 	movw	r3, #12301	; 0x300d
   103d4:	e3403080 	movt	r3, #128	; 0x80
   103d8:	e1823003 	orr	r3, r2, r3
   103dc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                     // disable subpage
    asm("MCR p15, 0, %[r], c1, c0, 0": :[r]"r" (val):);
   103e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   103e4:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
    mmu_on = 1;
   103e8:	e3003620 	movw	r3, #1568	; 0x620
   103ec:	e3403001 	movt	r3, #1
   103f0:	e3a02001 	mov	r2, #1
   103f4:	e5832000 	str	r2, [r3]

    //_puts("going to flush tlb...\n");

    _flush_all();
   103f8:	ebffffb9 	bl	102e4 <_flush_all>
}
   103fc:	e24bd008 	sub	sp, fp, #8
   10400:	e8bd8810 	pop	{r4, fp, pc}

00010404 <clear_bss>:
extern void * edata;
extern void * end;

// clear the BSS section for the main kernel, see kernel.ld
void clear_bss (void)
{
   10404:	e92d4800 	push	{fp, lr}
   10408:	e28db004 	add	fp, sp, #4
    memset(&edata, 0x00, (uint)&end-(uint)&edata);
   1040c:	e3012000 	movw	r2, #4096	; 0x1000
   10410:	e348200b 	movt	r2, #32779	; 0x800b
   10414:	e30b30c4 	movw	r3, #45252	; 0xb0c4
   10418:	e348300a 	movt	r3, #32778	; 0x800a
   1041c:	e0633002 	rsb	r3, r3, r2
   10420:	e30b00c4 	movw	r0, #45252	; 0xb0c4
   10424:	e348000a 	movt	r0, #32778	; 0x800a
   10428:	e3a01000 	mov	r1, #0
   1042c:	e1a02003 	mov	r2, r3
   10430:	eb00003e 	bl	10530 <__memset_veneer>
}
   10434:	e8bd8800 	pop	{fp, pc}

00010438 <start>:

void start (void)
{
   10438:	e92d4800 	push	{fp, lr}
   1043c:	e28db004 	add	fp, sp, #4
   10440:	e24dd008 	sub	sp, sp, #8
	uint32  vectbl;
    _puts("starting xv6 for ARM...\n");
   10444:	e300059c 	movw	r0, #1436	; 0x59c
   10448:	e3400001 	movt	r0, #1
   1044c:	ebffff13 	bl	100a0 <_puts>

    // double map the low memory, required to enable paging
    // we do not map all the physical memory
    set_bootpgtbl(0, 0, INIT_KERNMAP, 0);
   10450:	e3a00000 	mov	r0, #0
   10454:	e3a01000 	mov	r1, #0
   10458:	e3a02601 	mov	r2, #1048576	; 0x100000
   1045c:	e3a03000 	mov	r3, #0
   10460:	ebffff59 	bl	101cc <set_bootpgtbl>
    set_bootpgtbl(KERNBASE, 0, INIT_KERNMAP, 0);
   10464:	e3a00102 	mov	r0, #-2147483648	; 0x80000000
   10468:	e3a01000 	mov	r1, #0
   1046c:	e3a02601 	mov	r2, #1048576	; 0x100000
   10470:	e3a03000 	mov	r3, #0
   10474:	ebffff54 	bl	101cc <set_bootpgtbl>

    // vector table is in the middle of first 1MB (0xF000)
    vectbl = P2V_WO (VEC_TBL & PDE_MASK);
   10478:	e3a03000 	mov	r3, #0
   1047c:	e348300f 	movt	r3, #32783	; 0x800f
   10480:	e50b3008 	str	r3, [fp, #-8]

    if (vectbl <= (uint)&end) {
   10484:	e3013000 	movw	r3, #4096	; 0x1000
   10488:	e348300b 	movt	r3, #32779	; 0x800b
   1048c:	e51b2008 	ldr	r2, [fp, #-8]
   10490:	e1520003 	cmp	r2, r3
   10494:	8a000002 	bhi	104a4 <start+0x6c>
        cprintf ("error: vector table overlaps kernel\n");
   10498:	e30005b8 	movw	r0, #1464	; 0x5b8
   1049c:	e3400001 	movt	r0, #1
   104a0:	eb00001e 	bl	10520 <__cprintf_veneer>
    }

    set_bootpgtbl(VEC_TBL, 0, 1 << PDE_SHIFT, 0);
   104a4:	e3a00000 	mov	r0, #0
   104a8:	e34f0fff 	movt	r0, #65535	; 0xffff
   104ac:	e3a01000 	mov	r1, #0
   104b0:	e3a02601 	mov	r2, #1048576	; 0x100000
   104b4:	e3a03000 	mov	r3, #0
   104b8:	ebffff43 	bl	101cc <set_bootpgtbl>
    set_bootpgtbl(KERNBASE+DEVBASE, DEVBASE, DEV_MEM_SZ, 1);
   104bc:	e3a00209 	mov	r0, #-1879048192	; 0x90000000
   104c0:	e3a01201 	mov	r1, #268435456	; 0x10000000
   104c4:	e3a0240f 	mov	r2, #251658240	; 0xf000000
   104c8:	e3a03001 	mov	r3, #1
   104cc:	ebffff3e 	bl	101cc <set_bootpgtbl>

    _puts("going to load kern pgtable...\n");
   104d0:	e30005e0 	movw	r0, #1504	; 0x5e0
   104d4:	e3400001 	movt	r0, #1
   104d8:	ebfffef0 	bl	100a0 <_puts>
    load_pgtlb (kernel_pgtbl, user_pgtbl);
   104dc:	e3003618 	movw	r3, #1560	; 0x618
   104e0:	e3403001 	movt	r3, #1
   104e4:	e5932000 	ldr	r2, [r3]
   104e8:	e300361c 	movw	r3, #1564	; 0x61c
   104ec:	e3403001 	movt	r3, #1
   104f0:	e5933000 	ldr	r3, [r3]
   104f4:	e1a00002 	mov	r0, r2
   104f8:	e1a01003 	mov	r1, r3
   104fc:	ebffff82 	bl	1030c <load_pgtlb>
    jump_stack ();
   10500:	ebfffec8 	bl	10028 <jump_stack>

    _puts("load kern pgtable done\n");
   10504:	e3000600 	movw	r0, #1536	; 0x600
   10508:	e3400001 	movt	r0, #1
   1050c:	ebfffee3 	bl	100a0 <_puts>

    // We can now call normal kernel functions at high memory
    clear_bss ();
   10510:	ebffffbb 	bl	10404 <clear_bss>

    kmain ();
   10514:	eb000003 	bl	10528 <__kmain_veneer>
}
   10518:	e24bd004 	sub	sp, fp, #4
   1051c:	e8bd8800 	pop	{fp, pc}

00010520 <__cprintf_veneer>:
   10520:	e51ff004 	ldr	pc, [pc, #-4]	; 10524 <__cprintf_veneer+0x4>
   10524:	80021990 	.word	0x80021990

00010528 <__kmain_veneer>:
   10528:	e51ff004 	ldr	pc, [pc, #-4]	; 1052c <__kmain_veneer+0x4>
   1052c:	8002499c 	.word	0x8002499c

00010530 <__memset_veneer>:
   10530:	e51ff004 	ldr	pc, [pc, #-4]	; 10534 <__memset_veneer+0x4>
   10534:	80020000 	.word	0x80020000

00010538 <.LC0>:
   10538:	33323130 	.word	0x33323130
   1053c:	37363534 	.word	0x37363534
   10540:	42413938 	.word	0x42413938
   10544:	46454443 	.word	0x46454443
   10548:	00000000 	.word	0x00000000

0001054c <.LC1>:
   1054c:	6465656e 	.word	0x6465656e
   10550:	52414120 	.word	0x52414120
   10554:	3676204d 	.word	0x3676204d
   10558:	20726f20 	.word	0x20726f20
   1055c:	68676968 	.word	0x68676968
   10560:	000a7265 	.word	0x000a7265

00010564 <.LC2>:
   10564:	6e696f67 	.word	0x6e696f67
   10568:	6f742067 	.word	0x6f742067
   1056c:	6e6f6320 	.word	0x6e6f6320
   10570:	20676966 	.word	0x20676966
   10574:	616d6f64 	.word	0x616d6f64
   10578:	2e206e69 	.word	0x2e206e69
   1057c:	000a2e2e 	.word	0x000a2e2e

00010580 <.LC3>:
   10580:	6e696f67 	.word	0x6e696f67
   10584:	6f742067 	.word	0x6f742067
   10588:	616e6520 	.word	0x616e6520
   1058c:	20656c62 	.word	0x20656c62
   10590:	20756d6d 	.word	0x20756d6d
   10594:	0a2e2e2e 	.word	0x0a2e2e2e
   10598:	00000000 	.word	0x00000000

0001059c <.LC4>:
   1059c:	72617473 	.word	0x72617473
   105a0:	676e6974 	.word	0x676e6974
   105a4:	36767820 	.word	0x36767820
   105a8:	726f6620 	.word	0x726f6620
   105ac:	4d524120 	.word	0x4d524120
   105b0:	0a2e2e2e 	.word	0x0a2e2e2e
   105b4:	00000000 	.word	0x00000000

000105b8 <.LC5>:
   105b8:	6f727265 	.word	0x6f727265
   105bc:	76203a72 	.word	0x76203a72
   105c0:	6f746365 	.word	0x6f746365
   105c4:	61742072 	.word	0x61742072
   105c8:	20656c62 	.word	0x20656c62
   105cc:	7265766f 	.word	0x7265766f
   105d0:	7370616c 	.word	0x7370616c
   105d4:	72656b20 	.word	0x72656b20
   105d8:	0a6c656e 	.word	0x0a6c656e
   105dc:	00000000 	.word	0x00000000

000105e0 <.LC6>:
   105e0:	6e696f67 	.word	0x6e696f67
   105e4:	6f742067 	.word	0x6f742067
   105e8:	616f6c20 	.word	0x616f6c20
   105ec:	656b2064 	.word	0x656b2064
   105f0:	70206e72 	.word	0x70206e72
   105f4:	62617467 	.word	0x62617467
   105f8:	2e2e656c 	.word	0x2e2e656c
   105fc:	00000a2e 	.word	0x00000a2e

00010600 <.LC7>:
   10600:	64616f6c 	.word	0x64616f6c
   10604:	72656b20 	.word	0x72656b20
   10608:	6770206e 	.word	0x6770206e
   1060c:	6c626174 	.word	0x6c626174
   10610:	6f642065 	.word	0x6f642065
   10614:	000a656e 	.word	0x000a656e

00010618 <kernel_pgtbl>:
   10618:	00014000                                .@..

0001061c <user_pgtbl>:
   1061c:	00018000                                ....

00010620 <edata_entry>:
	...

00012000 <svc_stktop>:
	...

00014000 <_kernel_pgtbl>:
	...

00018000 <_user_pgtbl>:
	...

Disassembly of section .text:

80020000 <memset>:
#include "types.h"
#include "arm.h"


void* memset(void *dst, int v, int n)
{
80020000:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80020004:	e28db000 	add	fp, sp, #0
80020008:	e24dd024 	sub	sp, sp, #36	; 0x24
8002000c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
80020010:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
80020014:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    uint8	*p;
    uint8	c;
    uint32	val;
    uint32	*p4;

    p   = dst;
80020018:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002001c:	e50b3008 	str	r3, [fp, #-8]
    c   = v & 0xff;
80020020:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80020024:	e54b300d 	strb	r3, [fp, #-13]
    val = (c << 24) | (c << 16) | (c << 8) | c;
80020028:	e55b300d 	ldrb	r3, [fp, #-13]
8002002c:	e1a02c03 	lsl	r2, r3, #24
80020030:	e55b300d 	ldrb	r3, [fp, #-13]
80020034:	e1a03803 	lsl	r3, r3, #16
80020038:	e1822003 	orr	r2, r2, r3
8002003c:	e55b300d 	ldrb	r3, [fp, #-13]
80020040:	e1a03403 	lsl	r3, r3, #8
80020044:	e1822003 	orr	r2, r2, r3
80020048:	e55b300d 	ldrb	r3, [fp, #-13]
8002004c:	e1823003 	orr	r3, r2, r3
80020050:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    // set bytes before whole uint32
    for (; (n > 0) && ((uint)p % 4); n--, p++){
80020054:	ea000008 	b	8002007c <memset+0x7c>
        *p = c;
80020058:	e51b3008 	ldr	r3, [fp, #-8]
8002005c:	e55b200d 	ldrb	r2, [fp, #-13]
80020060:	e5c32000 	strb	r2, [r3]
    p   = dst;
    c   = v & 0xff;
    val = (c << 24) | (c << 16) | (c << 8) | c;

    // set bytes before whole uint32
    for (; (n > 0) && ((uint)p % 4); n--, p++){
80020064:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80020068:	e2433001 	sub	r3, r3, #1
8002006c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
80020070:	e51b3008 	ldr	r3, [fp, #-8]
80020074:	e2833001 	add	r3, r3, #1
80020078:	e50b3008 	str	r3, [fp, #-8]
8002007c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80020080:	e3530000 	cmp	r3, #0
80020084:	da000003 	ble	80020098 <memset+0x98>
80020088:	e51b3008 	ldr	r3, [fp, #-8]
8002008c:	e2033003 	and	r3, r3, #3
80020090:	e3530000 	cmp	r3, #0
80020094:	1affffef 	bne	80020058 <memset+0x58>
        *p = c;
    }

    // set memory 4 bytes a time
    p4 = (uint*)p;
80020098:	e51b3008 	ldr	r3, [fp, #-8]
8002009c:	e50b300c 	str	r3, [fp, #-12]

    for (; n >= 4; n -= 4, p4++) {
800200a0:	ea000008 	b	800200c8 <memset+0xc8>
        *p4 = val;
800200a4:	e51b300c 	ldr	r3, [fp, #-12]
800200a8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800200ac:	e5832000 	str	r2, [r3]
    }

    // set memory 4 bytes a time
    p4 = (uint*)p;

    for (; n >= 4; n -= 4, p4++) {
800200b0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800200b4:	e2433004 	sub	r3, r3, #4
800200b8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
800200bc:	e51b300c 	ldr	r3, [fp, #-12]
800200c0:	e2833004 	add	r3, r3, #4
800200c4:	e50b300c 	str	r3, [fp, #-12]
800200c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800200cc:	e3530003 	cmp	r3, #3
800200d0:	cafffff3 	bgt	800200a4 <memset+0xa4>
        *p4 = val;
    }

    // set leftover one byte a time
    p = (uint8*)p4;
800200d4:	e51b300c 	ldr	r3, [fp, #-12]
800200d8:	e50b3008 	str	r3, [fp, #-8]

    for (; n > 0; n--, p++) {
800200dc:	ea000008 	b	80020104 <memset+0x104>
        *p = c;
800200e0:	e51b3008 	ldr	r3, [fp, #-8]
800200e4:	e55b200d 	ldrb	r2, [fp, #-13]
800200e8:	e5c32000 	strb	r2, [r3]
    }

    // set leftover one byte a time
    p = (uint8*)p4;

    for (; n > 0; n--, p++) {
800200ec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800200f0:	e2433001 	sub	r3, r3, #1
800200f4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
800200f8:	e51b3008 	ldr	r3, [fp, #-8]
800200fc:	e2833001 	add	r3, r3, #1
80020100:	e50b3008 	str	r3, [fp, #-8]
80020104:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80020108:	e3530000 	cmp	r3, #0
8002010c:	cafffff3 	bgt	800200e0 <memset+0xe0>
        *p = c;
    }

    return dst;
80020110:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
80020114:	e1a00003 	mov	r0, r3
80020118:	e28bd000 	add	sp, fp, #0
8002011c:	e8bd0800 	pop	{fp}
80020120:	e12fff1e 	bx	lr

80020124 <memcmp>:


int memcmp(const void *v1, const void *v2, uint n)
{
80020124:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80020128:	e28db000 	add	fp, sp, #0
8002012c:	e24dd01c 	sub	sp, sp, #28
80020130:	e50b0010 	str	r0, [fp, #-16]
80020134:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80020138:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    const uchar *s1, *s2;

    s1 = v1;
8002013c:	e51b3010 	ldr	r3, [fp, #-16]
80020140:	e50b3008 	str	r3, [fp, #-8]
    s2 = v2;
80020144:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80020148:	e50b300c 	str	r3, [fp, #-12]

    while(n-- > 0){
8002014c:	ea000012 	b	8002019c <memcmp+0x78>
        if(*s1 != *s2) {
80020150:	e51b3008 	ldr	r3, [fp, #-8]
80020154:	e5d32000 	ldrb	r2, [r3]
80020158:	e51b300c 	ldr	r3, [fp, #-12]
8002015c:	e5d33000 	ldrb	r3, [r3]
80020160:	e1520003 	cmp	r2, r3
80020164:	0a000006 	beq	80020184 <memcmp+0x60>
            return *s1 - *s2;
80020168:	e51b3008 	ldr	r3, [fp, #-8]
8002016c:	e5d33000 	ldrb	r3, [r3]
80020170:	e1a02003 	mov	r2, r3
80020174:	e51b300c 	ldr	r3, [fp, #-12]
80020178:	e5d33000 	ldrb	r3, [r3]
8002017c:	e0633002 	rsb	r3, r3, r2
80020180:	ea000010 	b	800201c8 <memcmp+0xa4>
        }

        s1++, s2++;
80020184:	e51b3008 	ldr	r3, [fp, #-8]
80020188:	e2833001 	add	r3, r3, #1
8002018c:	e50b3008 	str	r3, [fp, #-8]
80020190:	e51b300c 	ldr	r3, [fp, #-12]
80020194:	e2833001 	add	r3, r3, #1
80020198:	e50b300c 	str	r3, [fp, #-12]
    const uchar *s1, *s2;

    s1 = v1;
    s2 = v2;

    while(n-- > 0){
8002019c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800201a0:	e3530000 	cmp	r3, #0
800201a4:	03a03000 	moveq	r3, #0
800201a8:	13a03001 	movne	r3, #1
800201ac:	e6ef3073 	uxtb	r3, r3
800201b0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
800201b4:	e2422001 	sub	r2, r2, #1
800201b8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
800201bc:	e3530000 	cmp	r3, #0
800201c0:	1affffe2 	bne	80020150 <memcmp+0x2c>
        }

        s1++, s2++;
    }

    return 0;
800201c4:	e3a03000 	mov	r3, #0
}
800201c8:	e1a00003 	mov	r0, r3
800201cc:	e28bd000 	add	sp, fp, #0
800201d0:	e8bd0800 	pop	{fp}
800201d4:	e12fff1e 	bx	lr

800201d8 <memmove>:

void* memmove(void *dst, const void *src, uint n)
{
800201d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800201dc:	e28db000 	add	fp, sp, #0
800201e0:	e24dd01c 	sub	sp, sp, #28
800201e4:	e50b0010 	str	r0, [fp, #-16]
800201e8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
800201ec:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    const char *s;
    char *d;

    s = src;
800201f0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
800201f4:	e50b3008 	str	r3, [fp, #-8]
    d = dst;
800201f8:	e51b3010 	ldr	r3, [fp, #-16]
800201fc:	e50b300c 	str	r3, [fp, #-12]

    if(s < d && s + n > d){
80020200:	e51b2008 	ldr	r2, [fp, #-8]
80020204:	e51b300c 	ldr	r3, [fp, #-12]
80020208:	e1520003 	cmp	r2, r3
8002020c:	2a00002e 	bcs	800202cc <memmove+0xf4>
80020210:	e51b2008 	ldr	r2, [fp, #-8]
80020214:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80020218:	e0822003 	add	r2, r2, r3
8002021c:	e51b300c 	ldr	r3, [fp, #-12]
80020220:	e1520003 	cmp	r2, r3
80020224:	9a000028 	bls	800202cc <memmove+0xf4>
        s += n;
80020228:	e51b2008 	ldr	r2, [fp, #-8]
8002022c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80020230:	e0823003 	add	r3, r2, r3
80020234:	e50b3008 	str	r3, [fp, #-8]
        d += n;
80020238:	e51b200c 	ldr	r2, [fp, #-12]
8002023c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80020240:	e0823003 	add	r3, r2, r3
80020244:	e50b300c 	str	r3, [fp, #-12]

        while(n-- > 0) {
80020248:	ea000009 	b	80020274 <memmove+0x9c>
            *--d = *--s;
8002024c:	e51b300c 	ldr	r3, [fp, #-12]
80020250:	e2433001 	sub	r3, r3, #1
80020254:	e50b300c 	str	r3, [fp, #-12]
80020258:	e51b3008 	ldr	r3, [fp, #-8]
8002025c:	e2433001 	sub	r3, r3, #1
80020260:	e50b3008 	str	r3, [fp, #-8]
80020264:	e51b3008 	ldr	r3, [fp, #-8]
80020268:	e5d32000 	ldrb	r2, [r3]
8002026c:	e51b300c 	ldr	r3, [fp, #-12]
80020270:	e5c32000 	strb	r2, [r3]

    if(s < d && s + n > d){
        s += n;
        d += n;

        while(n-- > 0) {
80020274:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80020278:	e3530000 	cmp	r3, #0
8002027c:	03a03000 	moveq	r3, #0
80020280:	13a03001 	movne	r3, #1
80020284:	e6ef3073 	uxtb	r3, r3
80020288:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
8002028c:	e2422001 	sub	r2, r2, #1
80020290:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
80020294:	e3530000 	cmp	r3, #0
80020298:	1affffeb 	bne	8002024c <memmove+0x74>
    char *d;

    s = src;
    d = dst;

    if(s < d && s + n > d){
8002029c:	ea000015 	b	800202f8 <memmove+0x120>
            *--d = *--s;
        }

    } else {
        while(n-- > 0) {
            *d++ = *s++;
800202a0:	e51b3008 	ldr	r3, [fp, #-8]
800202a4:	e5d32000 	ldrb	r2, [r3]
800202a8:	e51b300c 	ldr	r3, [fp, #-12]
800202ac:	e5c32000 	strb	r2, [r3]
800202b0:	e51b300c 	ldr	r3, [fp, #-12]
800202b4:	e2833001 	add	r3, r3, #1
800202b8:	e50b300c 	str	r3, [fp, #-12]
800202bc:	e51b3008 	ldr	r3, [fp, #-8]
800202c0:	e2833001 	add	r3, r3, #1
800202c4:	e50b3008 	str	r3, [fp, #-8]
800202c8:	ea000000 	b	800202d0 <memmove+0xf8>
        while(n-- > 0) {
            *--d = *--s;
        }

    } else {
        while(n-- > 0) {
800202cc:	e1a00000 	nop			; (mov r0, r0)
800202d0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800202d4:	e3530000 	cmp	r3, #0
800202d8:	03a03000 	moveq	r3, #0
800202dc:	13a03001 	movne	r3, #1
800202e0:	e6ef3073 	uxtb	r3, r3
800202e4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
800202e8:	e2422001 	sub	r2, r2, #1
800202ec:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
800202f0:	e3530000 	cmp	r3, #0
800202f4:	1affffe9 	bne	800202a0 <memmove+0xc8>
            *d++ = *s++;
        }
    }

    return dst;
800202f8:	e51b3010 	ldr	r3, [fp, #-16]
}
800202fc:	e1a00003 	mov	r0, r3
80020300:	e28bd000 	add	sp, fp, #0
80020304:	e8bd0800 	pop	{fp}
80020308:	e12fff1e 	bx	lr

8002030c <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void* memcpy(void *dst, const void *src, uint n)
{
8002030c:	e92d4800 	push	{fp, lr}
80020310:	e28db004 	add	fp, sp, #4
80020314:	e24dd010 	sub	sp, sp, #16
80020318:	e50b0008 	str	r0, [fp, #-8]
8002031c:	e50b100c 	str	r1, [fp, #-12]
80020320:	e50b2010 	str	r2, [fp, #-16]
    return memmove(dst, src, n);
80020324:	e51b0008 	ldr	r0, [fp, #-8]
80020328:	e51b100c 	ldr	r1, [fp, #-12]
8002032c:	e51b2010 	ldr	r2, [fp, #-16]
80020330:	ebffffa8 	bl	800201d8 <memmove>
80020334:	e1a03000 	mov	r3, r0
}
80020338:	e1a00003 	mov	r0, r3
8002033c:	e24bd004 	sub	sp, fp, #4
80020340:	e8bd8800 	pop	{fp, pc}

80020344 <strncmp>:

int strncmp(const char *p, const char *q, uint n)
{
80020344:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80020348:	e28db000 	add	fp, sp, #0
8002034c:	e24dd014 	sub	sp, sp, #20
80020350:	e50b0008 	str	r0, [fp, #-8]
80020354:	e50b100c 	str	r1, [fp, #-12]
80020358:	e50b2010 	str	r2, [fp, #-16]
    while(n > 0 && *p && *p == *q) {
8002035c:	ea000008 	b	80020384 <strncmp+0x40>
        n--, p++, q++;
80020360:	e51b3010 	ldr	r3, [fp, #-16]
80020364:	e2433001 	sub	r3, r3, #1
80020368:	e50b3010 	str	r3, [fp, #-16]
8002036c:	e51b3008 	ldr	r3, [fp, #-8]
80020370:	e2833001 	add	r3, r3, #1
80020374:	e50b3008 	str	r3, [fp, #-8]
80020378:	e51b300c 	ldr	r3, [fp, #-12]
8002037c:	e2833001 	add	r3, r3, #1
80020380:	e50b300c 	str	r3, [fp, #-12]
    return memmove(dst, src, n);
}

int strncmp(const char *p, const char *q, uint n)
{
    while(n > 0 && *p && *p == *q) {
80020384:	e51b3010 	ldr	r3, [fp, #-16]
80020388:	e3530000 	cmp	r3, #0
8002038c:	0a000009 	beq	800203b8 <strncmp+0x74>
80020390:	e51b3008 	ldr	r3, [fp, #-8]
80020394:	e5d33000 	ldrb	r3, [r3]
80020398:	e3530000 	cmp	r3, #0
8002039c:	0a000005 	beq	800203b8 <strncmp+0x74>
800203a0:	e51b3008 	ldr	r3, [fp, #-8]
800203a4:	e5d32000 	ldrb	r2, [r3]
800203a8:	e51b300c 	ldr	r3, [fp, #-12]
800203ac:	e5d33000 	ldrb	r3, [r3]
800203b0:	e1520003 	cmp	r2, r3
800203b4:	0affffe9 	beq	80020360 <strncmp+0x1c>
        n--, p++, q++;
    }

    if(n == 0) {
800203b8:	e51b3010 	ldr	r3, [fp, #-16]
800203bc:	e3530000 	cmp	r3, #0
800203c0:	1a000001 	bne	800203cc <strncmp+0x88>
        return 0;
800203c4:	e3a03000 	mov	r3, #0
800203c8:	ea000005 	b	800203e4 <strncmp+0xa0>
    }

    return (uchar)*p - (uchar)*q;
800203cc:	e51b3008 	ldr	r3, [fp, #-8]
800203d0:	e5d33000 	ldrb	r3, [r3]
800203d4:	e1a02003 	mov	r2, r3
800203d8:	e51b300c 	ldr	r3, [fp, #-12]
800203dc:	e5d33000 	ldrb	r3, [r3]
800203e0:	e0633002 	rsb	r3, r3, r2
}
800203e4:	e1a00003 	mov	r0, r3
800203e8:	e28bd000 	add	sp, fp, #0
800203ec:	e8bd0800 	pop	{fp}
800203f0:	e12fff1e 	bx	lr

800203f4 <strncpy>:

char* strncpy(char *s, const char *t, int n)
{
800203f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800203f8:	e28db000 	add	fp, sp, #0
800203fc:	e24dd01c 	sub	sp, sp, #28
80020400:	e50b0010 	str	r0, [fp, #-16]
80020404:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80020408:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *os;

    os = s;
8002040c:	e51b3010 	ldr	r3, [fp, #-16]
80020410:	e50b3008 	str	r3, [fp, #-8]

    while(n-- > 0 && (*s++ = *t++) != 0)
80020414:	e1a00000 	nop			; (mov r0, r0)
80020418:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002041c:	e3530000 	cmp	r3, #0
80020420:	d3a03000 	movle	r3, #0
80020424:	c3a03001 	movgt	r3, #1
80020428:	e6ef3073 	uxtb	r3, r3
8002042c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80020430:	e2422001 	sub	r2, r2, #1
80020434:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
80020438:	e3530000 	cmp	r3, #0
8002043c:	0a000019 	beq	800204a8 <strncpy+0xb4>
80020440:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80020444:	e5d32000 	ldrb	r2, [r3]
80020448:	e51b3010 	ldr	r3, [fp, #-16]
8002044c:	e5c32000 	strb	r2, [r3]
80020450:	e51b3010 	ldr	r3, [fp, #-16]
80020454:	e5d33000 	ldrb	r3, [r3]
80020458:	e3530000 	cmp	r3, #0
8002045c:	03a03000 	moveq	r3, #0
80020460:	13a03001 	movne	r3, #1
80020464:	e6ef3073 	uxtb	r3, r3
80020468:	e51b2010 	ldr	r2, [fp, #-16]
8002046c:	e2822001 	add	r2, r2, #1
80020470:	e50b2010 	str	r2, [fp, #-16]
80020474:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80020478:	e2822001 	add	r2, r2, #1
8002047c:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
80020480:	e3530000 	cmp	r3, #0
80020484:	1affffe3 	bne	80020418 <strncpy+0x24>
        ;

    while(n-- > 0) {
80020488:	ea000006 	b	800204a8 <strncpy+0xb4>
        *s++ = 0;
8002048c:	e51b3010 	ldr	r3, [fp, #-16]
80020490:	e3a02000 	mov	r2, #0
80020494:	e5c32000 	strb	r2, [r3]
80020498:	e51b3010 	ldr	r3, [fp, #-16]
8002049c:	e2833001 	add	r3, r3, #1
800204a0:	e50b3010 	str	r3, [fp, #-16]
800204a4:	ea000000 	b	800204ac <strncpy+0xb8>
    os = s;

    while(n-- > 0 && (*s++ = *t++) != 0)
        ;

    while(n-- > 0) {
800204a8:	e1a00000 	nop			; (mov r0, r0)
800204ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800204b0:	e3530000 	cmp	r3, #0
800204b4:	d3a03000 	movle	r3, #0
800204b8:	c3a03001 	movgt	r3, #1
800204bc:	e6ef3073 	uxtb	r3, r3
800204c0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
800204c4:	e2422001 	sub	r2, r2, #1
800204c8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
800204cc:	e3530000 	cmp	r3, #0
800204d0:	1affffed 	bne	8002048c <strncpy+0x98>
        *s++ = 0;
    }

    return os;
800204d4:	e51b3008 	ldr	r3, [fp, #-8]
}
800204d8:	e1a00003 	mov	r0, r3
800204dc:	e28bd000 	add	sp, fp, #0
800204e0:	e8bd0800 	pop	{fp}
800204e4:	e12fff1e 	bx	lr

800204e8 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char* safestrcpy(char *s, const char *t, int n)
{
800204e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800204ec:	e28db000 	add	fp, sp, #0
800204f0:	e24dd01c 	sub	sp, sp, #28
800204f4:	e50b0010 	str	r0, [fp, #-16]
800204f8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
800204fc:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *os;

    os = s;
80020500:	e51b3010 	ldr	r3, [fp, #-16]
80020504:	e50b3008 	str	r3, [fp, #-8]

    if(n <= 0) {
80020508:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002050c:	e3530000 	cmp	r3, #0
80020510:	ca000001 	bgt	8002051c <safestrcpy+0x34>
        return os;
80020514:	e51b3008 	ldr	r3, [fp, #-8]
80020518:	ea00001b 	b	8002058c <safestrcpy+0xa4>
    }

    while(--n > 0 && (*s++ = *t++) != 0)
8002051c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80020520:	e2433001 	sub	r3, r3, #1
80020524:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
80020528:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002052c:	e3530000 	cmp	r3, #0
80020530:	da000011 	ble	8002057c <safestrcpy+0x94>
80020534:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80020538:	e5d32000 	ldrb	r2, [r3]
8002053c:	e51b3010 	ldr	r3, [fp, #-16]
80020540:	e5c32000 	strb	r2, [r3]
80020544:	e51b3010 	ldr	r3, [fp, #-16]
80020548:	e5d33000 	ldrb	r3, [r3]
8002054c:	e3530000 	cmp	r3, #0
80020550:	03a03000 	moveq	r3, #0
80020554:	13a03001 	movne	r3, #1
80020558:	e6ef3073 	uxtb	r3, r3
8002055c:	e51b2010 	ldr	r2, [fp, #-16]
80020560:	e2822001 	add	r2, r2, #1
80020564:	e50b2010 	str	r2, [fp, #-16]
80020568:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
8002056c:	e2822001 	add	r2, r2, #1
80020570:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
80020574:	e3530000 	cmp	r3, #0
80020578:	1affffe7 	bne	8002051c <safestrcpy+0x34>
        ;

    *s = 0;
8002057c:	e51b3010 	ldr	r3, [fp, #-16]
80020580:	e3a02000 	mov	r2, #0
80020584:	e5c32000 	strb	r2, [r3]
    return os;
80020588:	e51b3008 	ldr	r3, [fp, #-8]
}
8002058c:	e1a00003 	mov	r0, r3
80020590:	e28bd000 	add	sp, fp, #0
80020594:	e8bd0800 	pop	{fp}
80020598:	e12fff1e 	bx	lr

8002059c <strlen>:

int strlen(const char *s)
{
8002059c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800205a0:	e28db000 	add	fp, sp, #0
800205a4:	e24dd014 	sub	sp, sp, #20
800205a8:	e50b0010 	str	r0, [fp, #-16]
    int n;

    for(n = 0; s[n]; n++)
800205ac:	e3a03000 	mov	r3, #0
800205b0:	e50b3008 	str	r3, [fp, #-8]
800205b4:	ea000002 	b	800205c4 <strlen+0x28>
800205b8:	e51b3008 	ldr	r3, [fp, #-8]
800205bc:	e2833001 	add	r3, r3, #1
800205c0:	e50b3008 	str	r3, [fp, #-8]
800205c4:	e51b3008 	ldr	r3, [fp, #-8]
800205c8:	e51b2010 	ldr	r2, [fp, #-16]
800205cc:	e0823003 	add	r3, r2, r3
800205d0:	e5d33000 	ldrb	r3, [r3]
800205d4:	e3530000 	cmp	r3, #0
800205d8:	1afffff6 	bne	800205b8 <strlen+0x1c>
        ;

    return n;
800205dc:	e51b3008 	ldr	r3, [fp, #-8]
}
800205e0:	e1a00003 	mov	r0, r3
800205e4:	e28bd000 	add	sp, fp, #0
800205e8:	e8bd0800 	pop	{fp}
800205ec:	e12fff1e 	bx	lr

800205f0 <cli>:
#include "proc.h"
#include "arm.h"
#include "mmu.h"

void cli (void)
{
800205f0:	e92d0810 	push	{r4, fp}
800205f4:	e28db004 	add	fp, sp, #4
800205f8:	e24dd008 	sub	sp, sp, #8
    uint val;

    // ok, enable paging using read/modify/write
    asm("MRS %[v], cpsr": [v]"=r" (val)::);
800205fc:	e10f4000 	mrs	r4, CPSR
80020600:	e50b4008 	str	r4, [fp, #-8]
    val |= DIS_INT;
80020604:	e51b3008 	ldr	r3, [fp, #-8]
80020608:	e3833080 	orr	r3, r3, #128	; 0x80
8002060c:	e50b3008 	str	r3, [fp, #-8]
    asm("MSR cpsr_cxsf, %[v]": :[v]"r" (val):);
80020610:	e51b3008 	ldr	r3, [fp, #-8]
80020614:	e12ff003 	msr	CPSR_fsxc, r3
}
80020618:	e24bd004 	sub	sp, fp, #4
8002061c:	e8bd0810 	pop	{r4, fp}
80020620:	e12fff1e 	bx	lr

80020624 <sti>:

void sti (void)
{
80020624:	e92d0810 	push	{r4, fp}
80020628:	e28db004 	add	fp, sp, #4
8002062c:	e24dd008 	sub	sp, sp, #8
    uint val;

    // ok, enable paging using read/modify/write
    asm("MRS %[v], cpsr": [v]"=r" (val)::);
80020630:	e10f4000 	mrs	r4, CPSR
80020634:	e50b4008 	str	r4, [fp, #-8]
    val &= ~DIS_INT;
80020638:	e51b3008 	ldr	r3, [fp, #-8]
8002063c:	e3c33080 	bic	r3, r3, #128	; 0x80
80020640:	e50b3008 	str	r3, [fp, #-8]
    asm("MSR cpsr_cxsf, %[v]": :[v]"r" (val):);
80020644:	e51b3008 	ldr	r3, [fp, #-8]
80020648:	e12ff003 	msr	CPSR_fsxc, r3
}
8002064c:	e24bd004 	sub	sp, fp, #4
80020650:	e8bd0810 	pop	{r4, fp}
80020654:	e12fff1e 	bx	lr

80020658 <spsr_usr>:

// return the cpsr used for user program
uint spsr_usr ()
{
80020658:	e92d0810 	push	{r4, fp}
8002065c:	e28db004 	add	fp, sp, #4
80020660:	e24dd008 	sub	sp, sp, #8
    uint val;

    // ok, enable paging using read/modify/write
    asm("MRS %[v], cpsr": [v]"=r" (val)::);
80020664:	e10f4000 	mrs	r4, CPSR
80020668:	e50b4008 	str	r4, [fp, #-8]
    val &= ~MODE_MASK;
8002066c:	e51b3008 	ldr	r3, [fp, #-8]
80020670:	e3c3301f 	bic	r3, r3, #31
80020674:	e50b3008 	str	r3, [fp, #-8]
    val |= USR_MODE;
80020678:	e51b3008 	ldr	r3, [fp, #-8]
8002067c:	e3833010 	orr	r3, r3, #16
80020680:	e50b3008 	str	r3, [fp, #-8]

    return val;
80020684:	e51b3008 	ldr	r3, [fp, #-8]
}
80020688:	e1a00003 	mov	r0, r3
8002068c:	e24bd004 	sub	sp, fp, #4
80020690:	e8bd0810 	pop	{r4, fp}
80020694:	e12fff1e 	bx	lr

80020698 <int_enabled>:

// return whether interrupt is currently enabled
int int_enabled ()
{
80020698:	e92d0810 	push	{r4, fp}
8002069c:	e28db004 	add	fp, sp, #4
800206a0:	e24dd008 	sub	sp, sp, #8
    uint val;

    // ok, enable paging using read/modify/write
    asm("MRS %[v], cpsr": [v]"=r" (val)::);
800206a4:	e10f4000 	mrs	r4, CPSR
800206a8:	e50b4008 	str	r4, [fp, #-8]

    return !(val & DIS_INT);
800206ac:	e51b3008 	ldr	r3, [fp, #-8]
800206b0:	e2033080 	and	r3, r3, #128	; 0x80
800206b4:	e3530000 	cmp	r3, #0
800206b8:	13a03000 	movne	r3, #0
800206bc:	03a03001 	moveq	r3, #1
}
800206c0:	e1a00003 	mov	r0, r3
800206c4:	e24bd004 	sub	sp, fp, #4
800206c8:	e8bd0810 	pop	{r4, fp}
800206cc:	e12fff1e 	bx	lr

800206d0 <pushcli>:
// Pushcli/popcli are like cli/sti except that they are matched:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void pushcli (void)
{
800206d0:	e92d4800 	push	{fp, lr}
800206d4:	e28db004 	add	fp, sp, #4
800206d8:	e24dd008 	sub	sp, sp, #8
    int enabled;

    enabled = int_enabled();
800206dc:	ebffffed 	bl	80020698 <int_enabled>
800206e0:	e50b0008 	str	r0, [fp, #-8]

    cli();
800206e4:	ebffffc1 	bl	800205f0 <cli>

    if (cpu->ncli++ == 0) {
800206e8:	e30e351c 	movw	r3, #58652	; 0xe51c
800206ec:	e348300a 	movt	r3, #32778	; 0x800a
800206f0:	e5933000 	ldr	r3, [r3]
800206f4:	e593200c 	ldr	r2, [r3, #12]
800206f8:	e3520000 	cmp	r2, #0
800206fc:	13a01000 	movne	r1, #0
80020700:	03a01001 	moveq	r1, #1
80020704:	e6ef1071 	uxtb	r1, r1
80020708:	e2822001 	add	r2, r2, #1
8002070c:	e583200c 	str	r2, [r3, #12]
80020710:	e3510000 	cmp	r1, #0
80020714:	0a000004 	beq	8002072c <pushcli+0x5c>
        cpu->intena = enabled;
80020718:	e30e351c 	movw	r3, #58652	; 0xe51c
8002071c:	e348300a 	movt	r3, #32778	; 0x800a
80020720:	e5933000 	ldr	r3, [r3]
80020724:	e51b2008 	ldr	r2, [fp, #-8]
80020728:	e5832010 	str	r2, [r3, #16]
    }
}
8002072c:	e24bd004 	sub	sp, fp, #4
80020730:	e8bd8800 	pop	{fp, pc}

80020734 <popcli>:

void popcli (void)
{
80020734:	e92d4800 	push	{fp, lr}
80020738:	e28db004 	add	fp, sp, #4
    if (int_enabled()) {
8002073c:	ebffffd5 	bl	80020698 <int_enabled>
80020740:	e1a03000 	mov	r3, r0
80020744:	e3530000 	cmp	r3, #0
80020748:	0a000002 	beq	80020758 <popcli+0x24>
        panic("popcli - interruptible");
8002074c:	e3090b78 	movw	r0, #39800	; 0x9b78
80020750:	e3480002 	movt	r0, #32770	; 0x8002
80020754:	eb000518 	bl	80021bbc <panic>
    }

    if (--cpu->ncli < 0) {
80020758:	e30e351c 	movw	r3, #58652	; 0xe51c
8002075c:	e348300a 	movt	r3, #32778	; 0x800a
80020760:	e5933000 	ldr	r3, [r3]
80020764:	e593200c 	ldr	r2, [r3, #12]
80020768:	e2422001 	sub	r2, r2, #1
8002076c:	e583200c 	str	r2, [r3, #12]
80020770:	e593300c 	ldr	r3, [r3, #12]
80020774:	e3530000 	cmp	r3, #0
80020778:	aa00000e 	bge	800207b8 <popcli+0x84>
        cprintf("cpu (%d)->ncli: %d\n", cpu, cpu->ncli);
8002077c:	e30e351c 	movw	r3, #58652	; 0xe51c
80020780:	e348300a 	movt	r3, #32778	; 0x800a
80020784:	e5932000 	ldr	r2, [r3]
80020788:	e30e351c 	movw	r3, #58652	; 0xe51c
8002078c:	e348300a 	movt	r3, #32778	; 0x800a
80020790:	e5933000 	ldr	r3, [r3]
80020794:	e593300c 	ldr	r3, [r3, #12]
80020798:	e3090b90 	movw	r0, #39824	; 0x9b90
8002079c:	e3480002 	movt	r0, #32770	; 0x8002
800207a0:	e1a01002 	mov	r1, r2
800207a4:	e1a02003 	mov	r2, r3
800207a8:	eb000478 	bl	80021990 <cprintf>
        panic("popcli -- ncli < 0");
800207ac:	e3090ba4 	movw	r0, #39844	; 0x9ba4
800207b0:	e3480002 	movt	r0, #32770	; 0x8002
800207b4:	eb000500 	bl	80021bbc <panic>
    }

    if ((cpu->ncli == 0) && cpu->intena) {
800207b8:	e30e351c 	movw	r3, #58652	; 0xe51c
800207bc:	e348300a 	movt	r3, #32778	; 0x800a
800207c0:	e5933000 	ldr	r3, [r3]
800207c4:	e593300c 	ldr	r3, [r3, #12]
800207c8:	e3530000 	cmp	r3, #0
800207cc:	1a000006 	bne	800207ec <popcli+0xb8>
800207d0:	e30e351c 	movw	r3, #58652	; 0xe51c
800207d4:	e348300a 	movt	r3, #32778	; 0x800a
800207d8:	e5933000 	ldr	r3, [r3]
800207dc:	e5933010 	ldr	r3, [r3, #16]
800207e0:	e3530000 	cmp	r3, #0
800207e4:	0a000000 	beq	800207ec <popcli+0xb8>
        sti();
800207e8:	ebffff8d 	bl	80020624 <sti>
    }
}
800207ec:	e8bd8800 	pop	{fp, pc}

800207f0 <getcallerpcs>:
// In ARM ABI, the function prologue is as:
//		push	{fp, lr}
//		add		fp, sp, #4
// so, fp points to lr, the return address
void getcallerpcs (void * v, uint pcs[])
{
800207f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800207f4:	e28db000 	add	fp, sp, #0
800207f8:	e24dd014 	sub	sp, sp, #20
800207fc:	e50b0010 	str	r0, [fp, #-16]
80020800:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    uint *fp;
    int i;

    fp = (uint*) v;
80020804:	e51b3010 	ldr	r3, [fp, #-16]
80020808:	e50b3008 	str	r3, [fp, #-8]

    for (i = 0; i < N_CALLSTK; i++) {
8002080c:	e3a03000 	mov	r3, #0
80020810:	e50b300c 	str	r3, [fp, #-12]
80020814:	ea000018 	b	8002087c <getcallerpcs+0x8c>
        if ((fp == 0) || (fp < (uint*) KERNBASE) || (fp == (uint*) 0xffffffff)) {
80020818:	e51b3008 	ldr	r3, [fp, #-8]
8002081c:	e3530000 	cmp	r3, #0
80020820:	0a000022 	beq	800208b0 <getcallerpcs+0xc0>
80020824:	e51b3008 	ldr	r3, [fp, #-8]
80020828:	e3730106 	cmn	r3, #-2147483647	; 0x80000001
8002082c:	9a00001f 	bls	800208b0 <getcallerpcs+0xc0>
80020830:	e51b3008 	ldr	r3, [fp, #-8]
80020834:	e3730001 	cmn	r3, #1
80020838:	0a00001c 	beq	800208b0 <getcallerpcs+0xc0>
            break;
        }

        fp = fp - 1;			// points fp to the saved fp
8002083c:	e51b3008 	ldr	r3, [fp, #-8]
80020840:	e2433004 	sub	r3, r3, #4
80020844:	e50b3008 	str	r3, [fp, #-8]
        pcs[i] = fp[1];     // saved lr
80020848:	e51b300c 	ldr	r3, [fp, #-12]
8002084c:	e1a03103 	lsl	r3, r3, #2
80020850:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80020854:	e0823003 	add	r3, r2, r3
80020858:	e51b2008 	ldr	r2, [fp, #-8]
8002085c:	e5922004 	ldr	r2, [r2, #4]
80020860:	e5832000 	str	r2, [r3]
        fp = (uint*) fp[0];	// saved fp
80020864:	e51b3008 	ldr	r3, [fp, #-8]
80020868:	e5933000 	ldr	r3, [r3]
8002086c:	e50b3008 	str	r3, [fp, #-8]
    uint *fp;
    int i;

    fp = (uint*) v;

    for (i = 0; i < N_CALLSTK; i++) {
80020870:	e51b300c 	ldr	r3, [fp, #-12]
80020874:	e2833001 	add	r3, r3, #1
80020878:	e50b300c 	str	r3, [fp, #-12]
8002087c:	e51b300c 	ldr	r3, [fp, #-12]
80020880:	e353000e 	cmp	r3, #14
80020884:	daffffe3 	ble	80020818 <getcallerpcs+0x28>
        fp = fp - 1;			// points fp to the saved fp
        pcs[i] = fp[1];     // saved lr
        fp = (uint*) fp[0];	// saved fp
    }

    for (; i < N_CALLSTK; i++) {
80020888:	ea000008 	b	800208b0 <getcallerpcs+0xc0>
        pcs[i] = 0;
8002088c:	e51b300c 	ldr	r3, [fp, #-12]
80020890:	e1a03103 	lsl	r3, r3, #2
80020894:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80020898:	e0823003 	add	r3, r2, r3
8002089c:	e3a02000 	mov	r2, #0
800208a0:	e5832000 	str	r2, [r3]
        fp = fp - 1;			// points fp to the saved fp
        pcs[i] = fp[1];     // saved lr
        fp = (uint*) fp[0];	// saved fp
    }

    for (; i < N_CALLSTK; i++) {
800208a4:	e51b300c 	ldr	r3, [fp, #-12]
800208a8:	e2833001 	add	r3, r3, #1
800208ac:	e50b300c 	str	r3, [fp, #-12]
800208b0:	e51b300c 	ldr	r3, [fp, #-12]
800208b4:	e353000e 	cmp	r3, #14
800208b8:	dafffff3 	ble	8002088c <getcallerpcs+0x9c>
        pcs[i] = 0;
    }
}
800208bc:	e28bd000 	add	sp, fp, #0
800208c0:	e8bd0800 	pop	{fp}
800208c4:	e12fff1e 	bx	lr

800208c8 <show_callstk>:

void show_callstk (char *s)
{
800208c8:	e92d4800 	push	{fp, lr}
800208cc:	e28db004 	add	fp, sp, #4
800208d0:	e24dd048 	sub	sp, sp, #72	; 0x48
800208d4:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    int i;
    uint pcs[N_CALLSTK];

    cprintf("%s\n", s);
800208d8:	e3090bb8 	movw	r0, #39864	; 0x9bb8
800208dc:	e3480002 	movt	r0, #32770	; 0x8002
800208e0:	e51b1048 	ldr	r1, [fp, #-72]	; 0xffffffb8
800208e4:	eb000429 	bl	80021990 <cprintf>

    getcallerpcs(get_fp(), pcs);
800208e8:	eb000027 	bl	8002098c <get_fp>
800208ec:	e1a03000 	mov	r3, r0
800208f0:	e1a00003 	mov	r0, r3
800208f4:	e24b3044 	sub	r3, fp, #68	; 0x44
800208f8:	e1a01003 	mov	r1, r3
800208fc:	ebffffbb 	bl	800207f0 <getcallerpcs>

    for (i = N_CALLSTK - 1; i >= 0; i--) {
80020900:	e3a0300e 	mov	r3, #14
80020904:	e50b3008 	str	r3, [fp, #-8]
80020908:	ea000011 	b	80020954 <show_callstk+0x8c>
        cprintf("%d: 0x%x\n", i + 1, pcs[i]);
8002090c:	e51b3008 	ldr	r3, [fp, #-8]
80020910:	e2832001 	add	r2, r3, #1
80020914:	e51b3008 	ldr	r3, [fp, #-8]
80020918:	e3e0003f 	mvn	r0, #63	; 0x3f
8002091c:	e1a03103 	lsl	r3, r3, #2
80020920:	e24bc004 	sub	ip, fp, #4
80020924:	e08c1003 	add	r1, ip, r3
80020928:	e1a03000 	mov	r3, r0
8002092c:	e0813003 	add	r3, r1, r3
80020930:	e5933000 	ldr	r3, [r3]
80020934:	e3090bbc 	movw	r0, #39868	; 0x9bbc
80020938:	e3480002 	movt	r0, #32770	; 0x8002
8002093c:	e1a01002 	mov	r1, r2
80020940:	e1a02003 	mov	r2, r3
80020944:	eb000411 	bl	80021990 <cprintf>

    cprintf("%s\n", s);

    getcallerpcs(get_fp(), pcs);

    for (i = N_CALLSTK - 1; i >= 0; i--) {
80020948:	e51b3008 	ldr	r3, [fp, #-8]
8002094c:	e2433001 	sub	r3, r3, #1
80020950:	e50b3008 	str	r3, [fp, #-8]
80020954:	e51b3008 	ldr	r3, [fp, #-8]
80020958:	e3530000 	cmp	r3, #0
8002095c:	aaffffea 	bge	8002090c <show_callstk+0x44>
        cprintf("%d: 0x%x\n", i + 1, pcs[i]);
    }

}
80020960:	e24bd004 	sub	sp, fp, #4
80020964:	e8bd8800 	pop	{fp, pc}

80020968 <set_stk>:
80020968:	e10f2000 	mrs	r2, CPSR
8002096c:	e3c2201f 	bic	r2, r2, #31
80020970:	e1822000 	orr	r2, r2, r0
80020974:	e12ff002 	msr	CPSR_fsxc, r2
80020978:	e1a0d001 	mov	sp, r1
8002097c:	e3c2201f 	bic	r2, r2, #31
80020980:	e3822013 	orr	r2, r2, #19
80020984:	e12ff002 	msr	CPSR_fsxc, r2
80020988:	e12fff1e 	bx	lr

8002098c <get_fp>:
8002098c:	e1a0000b 	mov	r0, fp
80020990:	e12fff1e 	bx	lr

80020994 <binit>:
    // head.next is most recently used.
    struct buf head;
} bcache;

void binit (void)
{
80020994:	e92d4800 	push	{fp, lr}
80020998:	e28db004 	add	fp, sp, #4
8002099c:	e24dd008 	sub	sp, sp, #8
    struct buf *b;

    initlock(&bcache.lock, "bcache");
800209a0:	e30b00c4 	movw	r0, #45252	; 0xb0c4
800209a4:	e348000a 	movt	r0, #32778	; 0x800a
800209a8:	e3091bc8 	movw	r1, #39880	; 0x9bc8
800209ac:	e3481002 	movt	r1, #32770	; 0x8002
800209b0:	eb0015a4 	bl	80026048 <initlock>

    //PAGEBREAK!
    // Create linked list of buffers
    bcache.head.prev = &bcache.head;
800209b4:	e30b30c4 	movw	r3, #45252	; 0xb0c4
800209b8:	e348300a 	movt	r3, #32778	; 0x800a
800209bc:	e3012530 	movw	r2, #5424	; 0x1530
800209c0:	e59f10a0 	ldr	r1, [pc, #160]	; 80020a68 <binit+0xd4>
800209c4:	e7831002 	str	r1, [r3, r2]
    bcache.head.next = &bcache.head;
800209c8:	e30b30c4 	movw	r3, #45252	; 0xb0c4
800209cc:	e348300a 	movt	r3, #32778	; 0x800a
800209d0:	e3012534 	movw	r2, #5428	; 0x1534
800209d4:	e59f108c 	ldr	r1, [pc, #140]	; 80020a68 <binit+0xd4>
800209d8:	e7831002 	str	r1, [r3, r2]

    for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
800209dc:	e59f3088 	ldr	r3, [pc, #136]	; 80020a6c <binit+0xd8>
800209e0:	e50b3008 	str	r3, [fp, #-8]
800209e4:	ea000019 	b	80020a50 <binit+0xbc>
        b->next = bcache.head.next;
800209e8:	e30b30c4 	movw	r3, #45252	; 0xb0c4
800209ec:	e348300a 	movt	r3, #32778	; 0x800a
800209f0:	e3012534 	movw	r2, #5428	; 0x1534
800209f4:	e7932002 	ldr	r2, [r3, r2]
800209f8:	e51b3008 	ldr	r3, [fp, #-8]
800209fc:	e5832010 	str	r2, [r3, #16]
        b->prev = &bcache.head;
80020a00:	e51b3008 	ldr	r3, [fp, #-8]
80020a04:	e59f205c 	ldr	r2, [pc, #92]	; 80020a68 <binit+0xd4>
80020a08:	e583200c 	str	r2, [r3, #12]
        b->dev = -1;
80020a0c:	e51b3008 	ldr	r3, [fp, #-8]
80020a10:	e3e02000 	mvn	r2, #0
80020a14:	e5832004 	str	r2, [r3, #4]
        bcache.head.next->prev = b;
80020a18:	e30b30c4 	movw	r3, #45252	; 0xb0c4
80020a1c:	e348300a 	movt	r3, #32778	; 0x800a
80020a20:	e3012534 	movw	r2, #5428	; 0x1534
80020a24:	e7933002 	ldr	r3, [r3, r2]
80020a28:	e51b2008 	ldr	r2, [fp, #-8]
80020a2c:	e583200c 	str	r2, [r3, #12]
        bcache.head.next = b;
80020a30:	e30b30c4 	movw	r3, #45252	; 0xb0c4
80020a34:	e348300a 	movt	r3, #32778	; 0x800a
80020a38:	e3012534 	movw	r2, #5428	; 0x1534
80020a3c:	e51b1008 	ldr	r1, [fp, #-8]
80020a40:	e7831002 	str	r1, [r3, r2]
    //PAGEBREAK!
    // Create linked list of buffers
    bcache.head.prev = &bcache.head;
    bcache.head.next = &bcache.head;

    for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
80020a44:	e51b3008 	ldr	r3, [fp, #-8]
80020a48:	e2833f86 	add	r3, r3, #536	; 0x218
80020a4c:	e50b3008 	str	r3, [fp, #-8]
80020a50:	e51b2008 	ldr	r2, [fp, #-8]
80020a54:	e59f300c 	ldr	r3, [pc, #12]	; 80020a68 <binit+0xd4>
80020a58:	e1520003 	cmp	r2, r3
80020a5c:	3affffe1 	bcc	800209e8 <binit+0x54>
        b->prev = &bcache.head;
        b->dev = -1;
        bcache.head.next->prev = b;
        bcache.head.next = b;
    }
}
80020a60:	e24bd004 	sub	sp, fp, #4
80020a64:	e8bd8800 	pop	{fp, pc}
80020a68:	800ac5e8 	.word	0x800ac5e8
80020a6c:	800ab0f8 	.word	0x800ab0f8

80020a70 <bget>:

// Look through buffer cache for sector on device dev.
// If not found, allocate fresh block.
// In either case, return B_BUSY buffer.
static struct buf* bget (uint dev, uint sector)
{
80020a70:	e92d4800 	push	{fp, lr}
80020a74:	e28db004 	add	fp, sp, #4
80020a78:	e24dd010 	sub	sp, sp, #16
80020a7c:	e50b0010 	str	r0, [fp, #-16]
80020a80:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct buf *b;

    acquire(&bcache.lock);
80020a84:	e30b00c4 	movw	r0, #45252	; 0xb0c4
80020a88:	e348000a 	movt	r0, #32778	; 0x800a
80020a8c:	eb00157e 	bl	8002608c <acquire>

    loop:
    // Is the sector already cached?
    for (b = bcache.head.next; b != &bcache.head; b = b->next) {
80020a90:	e30b30c4 	movw	r3, #45252	; 0xb0c4
80020a94:	e348300a 	movt	r3, #32778	; 0x800a
80020a98:	e3012534 	movw	r2, #5428	; 0x1534
80020a9c:	e7933002 	ldr	r3, [r3, r2]
80020aa0:	e50b3008 	str	r3, [fp, #-8]
80020aa4:	ea000020 	b	80020b2c <bget+0xbc>
        if (b->dev == dev && b->sector == sector) {
80020aa8:	e51b3008 	ldr	r3, [fp, #-8]
80020aac:	e5932004 	ldr	r2, [r3, #4]
80020ab0:	e51b3010 	ldr	r3, [fp, #-16]
80020ab4:	e1520003 	cmp	r2, r3
80020ab8:	1a000018 	bne	80020b20 <bget+0xb0>
80020abc:	e51b3008 	ldr	r3, [fp, #-8]
80020ac0:	e5932008 	ldr	r2, [r3, #8]
80020ac4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80020ac8:	e1520003 	cmp	r2, r3
80020acc:	1a000013 	bne	80020b20 <bget+0xb0>
            if (!(b->flags & B_BUSY)) {
80020ad0:	e51b3008 	ldr	r3, [fp, #-8]
80020ad4:	e5933000 	ldr	r3, [r3]
80020ad8:	e2033001 	and	r3, r3, #1
80020adc:	e3530000 	cmp	r3, #0
80020ae0:	1a000009 	bne	80020b0c <bget+0x9c>
                b->flags |= B_BUSY;
80020ae4:	e51b3008 	ldr	r3, [fp, #-8]
80020ae8:	e5933000 	ldr	r3, [r3]
80020aec:	e3832001 	orr	r2, r3, #1
80020af0:	e51b3008 	ldr	r3, [fp, #-8]
80020af4:	e5832000 	str	r2, [r3]
                release(&bcache.lock);
80020af8:	e30b00c4 	movw	r0, #45252	; 0xb0c4
80020afc:	e348000a 	movt	r0, #32778	; 0x800a
80020b00:	eb00156b 	bl	800260b4 <release>
                return b;
80020b04:	e51b3008 	ldr	r3, [fp, #-8]
80020b08:	ea000033 	b	80020bdc <bget+0x16c>
            }

            sleep(b, &bcache.lock);
80020b0c:	e51b0008 	ldr	r0, [fp, #-8]
80020b10:	e30b10c4 	movw	r1, #45252	; 0xb0c4
80020b14:	e348100a 	movt	r1, #32778	; 0x800a
80020b18:	eb001474 	bl	80025cf0 <sleep>
            goto loop;
80020b1c:	eaffffdb 	b	80020a90 <bget+0x20>

    acquire(&bcache.lock);

    loop:
    // Is the sector already cached?
    for (b = bcache.head.next; b != &bcache.head; b = b->next) {
80020b20:	e51b3008 	ldr	r3, [fp, #-8]
80020b24:	e5933010 	ldr	r3, [r3, #16]
80020b28:	e50b3008 	str	r3, [fp, #-8]
80020b2c:	e51b2008 	ldr	r2, [fp, #-8]
80020b30:	e59f30b0 	ldr	r3, [pc, #176]	; 80020be8 <bget+0x178>
80020b34:	e1520003 	cmp	r2, r3
80020b38:	1affffda 	bne	80020aa8 <bget+0x38>
            goto loop;
        }
    }

    // Not cached; recycle some non-busy and clean buffer.
    for (b = bcache.head.prev; b != &bcache.head; b = b->prev) {
80020b3c:	e30b30c4 	movw	r3, #45252	; 0xb0c4
80020b40:	e348300a 	movt	r3, #32778	; 0x800a
80020b44:	e3012530 	movw	r2, #5424	; 0x1530
80020b48:	e7933002 	ldr	r3, [r3, r2]
80020b4c:	e50b3008 	str	r3, [fp, #-8]
80020b50:	ea00001a 	b	80020bc0 <bget+0x150>
        if ((b->flags & B_BUSY) == 0 && (b->flags & B_DIRTY) == 0) {
80020b54:	e51b3008 	ldr	r3, [fp, #-8]
80020b58:	e5933000 	ldr	r3, [r3]
80020b5c:	e2033001 	and	r3, r3, #1
80020b60:	e3530000 	cmp	r3, #0
80020b64:	1a000012 	bne	80020bb4 <bget+0x144>
80020b68:	e51b3008 	ldr	r3, [fp, #-8]
80020b6c:	e5933000 	ldr	r3, [r3]
80020b70:	e2033004 	and	r3, r3, #4
80020b74:	e3530000 	cmp	r3, #0
80020b78:	1a00000d 	bne	80020bb4 <bget+0x144>
            b->dev = dev;
80020b7c:	e51b3008 	ldr	r3, [fp, #-8]
80020b80:	e51b2010 	ldr	r2, [fp, #-16]
80020b84:	e5832004 	str	r2, [r3, #4]
            b->sector = sector;
80020b88:	e51b3008 	ldr	r3, [fp, #-8]
80020b8c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80020b90:	e5832008 	str	r2, [r3, #8]
            b->flags = B_BUSY;
80020b94:	e51b3008 	ldr	r3, [fp, #-8]
80020b98:	e3a02001 	mov	r2, #1
80020b9c:	e5832000 	str	r2, [r3]
            release(&bcache.lock);
80020ba0:	e30b00c4 	movw	r0, #45252	; 0xb0c4
80020ba4:	e348000a 	movt	r0, #32778	; 0x800a
80020ba8:	eb001541 	bl	800260b4 <release>
            return b;
80020bac:	e51b3008 	ldr	r3, [fp, #-8]
80020bb0:	ea000009 	b	80020bdc <bget+0x16c>
            goto loop;
        }
    }

    // Not cached; recycle some non-busy and clean buffer.
    for (b = bcache.head.prev; b != &bcache.head; b = b->prev) {
80020bb4:	e51b3008 	ldr	r3, [fp, #-8]
80020bb8:	e593300c 	ldr	r3, [r3, #12]
80020bbc:	e50b3008 	str	r3, [fp, #-8]
80020bc0:	e51b2008 	ldr	r2, [fp, #-8]
80020bc4:	e59f301c 	ldr	r3, [pc, #28]	; 80020be8 <bget+0x178>
80020bc8:	e1520003 	cmp	r2, r3
80020bcc:	1affffe0 	bne	80020b54 <bget+0xe4>
            release(&bcache.lock);
            return b;
        }
    }

    panic("bget: no buffers");
80020bd0:	e3090bd0 	movw	r0, #39888	; 0x9bd0
80020bd4:	e3480002 	movt	r0, #32770	; 0x8002
80020bd8:	eb0003f7 	bl	80021bbc <panic>
}
80020bdc:	e1a00003 	mov	r0, r3
80020be0:	e24bd004 	sub	sp, fp, #4
80020be4:	e8bd8800 	pop	{fp, pc}
80020be8:	800ac5e8 	.word	0x800ac5e8

80020bec <bread>:

// Return a B_BUSY buf with the contents of the indicated disk sector.
struct buf* bread (uint dev, uint sector)
{
80020bec:	e92d4800 	push	{fp, lr}
80020bf0:	e28db004 	add	fp, sp, #4
80020bf4:	e24dd010 	sub	sp, sp, #16
80020bf8:	e50b0010 	str	r0, [fp, #-16]
80020bfc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct buf *b;

    b = bget(dev, sector);
80020c00:	e51b0010 	ldr	r0, [fp, #-16]
80020c04:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
80020c08:	ebffff98 	bl	80020a70 <bget>
80020c0c:	e50b0008 	str	r0, [fp, #-8]

    if (!(b->flags & B_VALID)) {
80020c10:	e51b3008 	ldr	r3, [fp, #-8]
80020c14:	e5933000 	ldr	r3, [r3]
80020c18:	e2033002 	and	r3, r3, #2
80020c1c:	e3530000 	cmp	r3, #0
80020c20:	1a000001 	bne	80020c2c <bread+0x40>
        iderw(b);
80020c24:	e51b0008 	ldr	r0, [fp, #-8]
80020c28:	eb000fa6 	bl	80024ac8 <iderw>
    }

    return b;
80020c2c:	e51b3008 	ldr	r3, [fp, #-8]
}
80020c30:	e1a00003 	mov	r0, r3
80020c34:	e24bd004 	sub	sp, fp, #4
80020c38:	e8bd8800 	pop	{fp, pc}

80020c3c <bwrite>:

// Write b's contents to disk.  Must be B_BUSY.
void bwrite (struct buf *b)
{
80020c3c:	e92d4800 	push	{fp, lr}
80020c40:	e28db004 	add	fp, sp, #4
80020c44:	e24dd008 	sub	sp, sp, #8
80020c48:	e50b0008 	str	r0, [fp, #-8]
    if ((b->flags & B_BUSY) == 0) {
80020c4c:	e51b3008 	ldr	r3, [fp, #-8]
80020c50:	e5933000 	ldr	r3, [r3]
80020c54:	e2033001 	and	r3, r3, #1
80020c58:	e3530000 	cmp	r3, #0
80020c5c:	1a000002 	bne	80020c6c <bwrite+0x30>
        panic("bwrite");
80020c60:	e3090be4 	movw	r0, #39908	; 0x9be4
80020c64:	e3480002 	movt	r0, #32770	; 0x8002
80020c68:	eb0003d3 	bl	80021bbc <panic>
    }

    b->flags |= B_DIRTY;
80020c6c:	e51b3008 	ldr	r3, [fp, #-8]
80020c70:	e5933000 	ldr	r3, [r3]
80020c74:	e3832004 	orr	r2, r3, #4
80020c78:	e51b3008 	ldr	r3, [fp, #-8]
80020c7c:	e5832000 	str	r2, [r3]
    iderw(b);
80020c80:	e51b0008 	ldr	r0, [fp, #-8]
80020c84:	eb000f8f 	bl	80024ac8 <iderw>
}
80020c88:	e24bd004 	sub	sp, fp, #4
80020c8c:	e8bd8800 	pop	{fp, pc}

80020c90 <brelse>:

// Release a B_BUSY buffer.
// Move to the head of the MRU list.
void brelse (struct buf *b)
{
80020c90:	e92d4800 	push	{fp, lr}
80020c94:	e28db004 	add	fp, sp, #4
80020c98:	e24dd008 	sub	sp, sp, #8
80020c9c:	e50b0008 	str	r0, [fp, #-8]
    if ((b->flags & B_BUSY) == 0) {
80020ca0:	e51b3008 	ldr	r3, [fp, #-8]
80020ca4:	e5933000 	ldr	r3, [r3]
80020ca8:	e2033001 	and	r3, r3, #1
80020cac:	e3530000 	cmp	r3, #0
80020cb0:	1a000002 	bne	80020cc0 <brelse+0x30>
        panic("brelse");
80020cb4:	e3090bec 	movw	r0, #39916	; 0x9bec
80020cb8:	e3480002 	movt	r0, #32770	; 0x8002
80020cbc:	eb0003be 	bl	80021bbc <panic>
    }

    acquire(&bcache.lock);
80020cc0:	e30b00c4 	movw	r0, #45252	; 0xb0c4
80020cc4:	e348000a 	movt	r0, #32778	; 0x800a
80020cc8:	eb0014ef 	bl	8002608c <acquire>

    b->next->prev = b->prev;
80020ccc:	e51b3008 	ldr	r3, [fp, #-8]
80020cd0:	e5933010 	ldr	r3, [r3, #16]
80020cd4:	e51b2008 	ldr	r2, [fp, #-8]
80020cd8:	e592200c 	ldr	r2, [r2, #12]
80020cdc:	e583200c 	str	r2, [r3, #12]
    b->prev->next = b->next;
80020ce0:	e51b3008 	ldr	r3, [fp, #-8]
80020ce4:	e593300c 	ldr	r3, [r3, #12]
80020ce8:	e51b2008 	ldr	r2, [fp, #-8]
80020cec:	e5922010 	ldr	r2, [r2, #16]
80020cf0:	e5832010 	str	r2, [r3, #16]
    b->next = bcache.head.next;
80020cf4:	e30b30c4 	movw	r3, #45252	; 0xb0c4
80020cf8:	e348300a 	movt	r3, #32778	; 0x800a
80020cfc:	e3012534 	movw	r2, #5428	; 0x1534
80020d00:	e7932002 	ldr	r2, [r3, r2]
80020d04:	e51b3008 	ldr	r3, [fp, #-8]
80020d08:	e5832010 	str	r2, [r3, #16]
    b->prev = &bcache.head;
80020d0c:	e51b3008 	ldr	r3, [fp, #-8]
80020d10:	e59f205c 	ldr	r2, [pc, #92]	; 80020d74 <brelse+0xe4>
80020d14:	e583200c 	str	r2, [r3, #12]
    bcache.head.next->prev = b;
80020d18:	e30b30c4 	movw	r3, #45252	; 0xb0c4
80020d1c:	e348300a 	movt	r3, #32778	; 0x800a
80020d20:	e3012534 	movw	r2, #5428	; 0x1534
80020d24:	e7933002 	ldr	r3, [r3, r2]
80020d28:	e51b2008 	ldr	r2, [fp, #-8]
80020d2c:	e583200c 	str	r2, [r3, #12]
    bcache.head.next = b;
80020d30:	e30b30c4 	movw	r3, #45252	; 0xb0c4
80020d34:	e348300a 	movt	r3, #32778	; 0x800a
80020d38:	e3012534 	movw	r2, #5428	; 0x1534
80020d3c:	e51b1008 	ldr	r1, [fp, #-8]
80020d40:	e7831002 	str	r1, [r3, r2]

    b->flags &= ~B_BUSY;
80020d44:	e51b3008 	ldr	r3, [fp, #-8]
80020d48:	e5933000 	ldr	r3, [r3]
80020d4c:	e3c32001 	bic	r2, r3, #1
80020d50:	e51b3008 	ldr	r3, [fp, #-8]
80020d54:	e5832000 	str	r2, [r3]
    wakeup(b);
80020d58:	e51b0008 	ldr	r0, [fp, #-8]
80020d5c:	eb00143b 	bl	80025e50 <wakeup>

    release(&bcache.lock);
80020d60:	e30b00c4 	movw	r0, #45252	; 0xb0c4
80020d64:	e348000a 	movt	r0, #32778	; 0x800a
80020d68:	eb0014d1 	bl	800260b4 <release>
}
80020d6c:	e24bd004 	sub	sp, fp, #4
80020d70:	e8bd8800 	pop	{fp, pc}
80020d74:	800ac5e8 	.word	0x800ac5e8

80020d78 <get_mark>:

static struct kmem kmem;

// coversion between block id to mark and memory address
static inline struct mark* get_mark (int order, int idx)
{
80020d78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80020d7c:	e28db000 	add	fp, sp, #0
80020d80:	e24dd00c 	sub	sp, sp, #12
80020d84:	e50b0008 	str	r0, [fp, #-8]
80020d88:	e50b100c 	str	r1, [fp, #-12]
    return (struct mark*)kmem.start + (kmem.orders[order - MIN_ORD].offset + idx);
80020d8c:	e51b3008 	ldr	r3, [fp, #-8]
80020d90:	e2432006 	sub	r2, r3, #6
80020d94:	e30c3800 	movw	r3, #51200	; 0xc800
80020d98:	e348300a 	movt	r3, #32778	; 0x800a
80020d9c:	e2822008 	add	r2, r2, #8
80020da0:	e3a01004 	mov	r1, #4
80020da4:	e1a02182 	lsl	r2, r2, #3
80020da8:	e0832002 	add	r2, r3, r2
80020dac:	e1a03001 	mov	r3, r1
80020db0:	e0823003 	add	r3, r2, r3
80020db4:	e5932000 	ldr	r2, [r3]
80020db8:	e51b300c 	ldr	r3, [fp, #-12]
80020dbc:	e0823003 	add	r3, r2, r3
80020dc0:	e1a02183 	lsl	r2, r3, #3
80020dc4:	e30c3800 	movw	r3, #51200	; 0xc800
80020dc8:	e348300a 	movt	r3, #32778	; 0x800a
80020dcc:	e5933034 	ldr	r3, [r3, #52]	; 0x34
80020dd0:	e0823003 	add	r3, r2, r3
}
80020dd4:	e1a00003 	mov	r0, r3
80020dd8:	e28bd000 	add	sp, fp, #0
80020ddc:	e8bd0800 	pop	{fp}
80020de0:	e12fff1e 	bx	lr

80020de4 <blkid2mem>:

static inline void* blkid2mem (int order, int blkid)
{
80020de4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80020de8:	e28db000 	add	fp, sp, #0
80020dec:	e24dd00c 	sub	sp, sp, #12
80020df0:	e50b0008 	str	r0, [fp, #-8]
80020df4:	e50b100c 	str	r1, [fp, #-12]
    return (void*)(kmem.start_heap + (1 << order) * blkid);
80020df8:	e30c3800 	movw	r3, #51200	; 0xc800
80020dfc:	e348300a 	movt	r3, #32778	; 0x800a
80020e00:	e5932038 	ldr	r2, [r3, #56]	; 0x38
80020e04:	e51b100c 	ldr	r1, [fp, #-12]
80020e08:	e51b3008 	ldr	r3, [fp, #-8]
80020e0c:	e1a03311 	lsl	r3, r1, r3
80020e10:	e0823003 	add	r3, r2, r3
}
80020e14:	e1a00003 	mov	r0, r3
80020e18:	e28bd000 	add	sp, fp, #0
80020e1c:	e8bd0800 	pop	{fp}
80020e20:	e12fff1e 	bx	lr

80020e24 <mem2blkid>:

static inline int mem2blkid (int order, void *mem)
{
80020e24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80020e28:	e28db000 	add	fp, sp, #0
80020e2c:	e24dd00c 	sub	sp, sp, #12
80020e30:	e50b0008 	str	r0, [fp, #-8]
80020e34:	e50b100c 	str	r1, [fp, #-12]
    return ((uint)mem - kmem.start_heap) >> order;
80020e38:	e51b200c 	ldr	r2, [fp, #-12]
80020e3c:	e30c3800 	movw	r3, #51200	; 0xc800
80020e40:	e348300a 	movt	r3, #32778	; 0x800a
80020e44:	e5933038 	ldr	r3, [r3, #56]	; 0x38
80020e48:	e0632002 	rsb	r2, r3, r2
80020e4c:	e51b3008 	ldr	r3, [fp, #-8]
80020e50:	e1a03332 	lsr	r3, r2, r3
}
80020e54:	e1a00003 	mov	r0, r3
80020e58:	e28bd000 	add	sp, fp, #0
80020e5c:	e8bd0800 	pop	{fp}
80020e60:	e12fff1e 	bx	lr

80020e64 <available>:

static inline int available (uint bitmap, int blk_id)
{
80020e64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80020e68:	e28db000 	add	fp, sp, #0
80020e6c:	e24dd00c 	sub	sp, sp, #12
80020e70:	e50b0008 	str	r0, [fp, #-8]
80020e74:	e50b100c 	str	r1, [fp, #-12]
    return bitmap & (1 << (blk_id & 0x1F));
80020e78:	e51b300c 	ldr	r3, [fp, #-12]
80020e7c:	e203301f 	and	r3, r3, #31
80020e80:	e3a02001 	mov	r2, #1
80020e84:	e1a03312 	lsl	r3, r2, r3
80020e88:	e1a02003 	mov	r2, r3
80020e8c:	e51b3008 	ldr	r3, [fp, #-8]
80020e90:	e0023003 	and	r3, r2, r3
}
80020e94:	e1a00003 	mov	r0, r3
80020e98:	e28bd000 	add	sp, fp, #0
80020e9c:	e8bd0800 	pop	{fp}
80020ea0:	e12fff1e 	bx	lr

80020ea4 <kmem_init>:

void kmem_init (void)
{
80020ea4:	e92d4800 	push	{fp, lr}
80020ea8:	e28db004 	add	fp, sp, #4
    initlock(&kmem.lock, "kmem");
80020eac:	e30c0800 	movw	r0, #51200	; 0xc800
80020eb0:	e348000a 	movt	r0, #32778	; 0x800a
80020eb4:	e3091bf4 	movw	r1, #39924	; 0x9bf4
80020eb8:	e3481002 	movt	r1, #32770	; 0x8002
80020ebc:	eb001461 	bl	80026048 <initlock>
}
80020ec0:	e8bd8800 	pop	{fp, pc}

80020ec4 <kmem_init2>:

void kmem_init2(void *vstart, void *vend)
{
80020ec4:	e92d4800 	push	{fp, lr}
80020ec8:	e28db004 	add	fp, sp, #4
80020ecc:	e24dd028 	sub	sp, sp, #40	; 0x28
80020ed0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
80020ed4:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    uint32          total, n;
    uint            len;
    struct order    *ord;
    struct mark     *mk;
    
    kmem.start = (uint)vstart;
80020ed8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80020edc:	e30c3800 	movw	r3, #51200	; 0xc800
80020ee0:	e348300a 	movt	r3, #32778	; 0x800a
80020ee4:	e5832034 	str	r2, [r3, #52]	; 0x34
    kmem.end   = (uint)vend;
80020ee8:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
80020eec:	e30c3800 	movw	r3, #51200	; 0xc800
80020ef0:	e348300a 	movt	r3, #32778	; 0x800a
80020ef4:	e583203c 	str	r2, [r3, #60]	; 0x3c
    len = kmem.end - kmem.start;
80020ef8:	e30c3800 	movw	r3, #51200	; 0xc800
80020efc:	e348300a 	movt	r3, #32778	; 0x800a
80020f00:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
80020f04:	e30c3800 	movw	r3, #51200	; 0xc800
80020f08:	e348300a 	movt	r3, #32778	; 0x800a
80020f0c:	e5933034 	ldr	r3, [r3, #52]	; 0x34
80020f10:	e0633002 	rsb	r3, r3, r2
80020f14:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    // reserved memory at vstart for an array of marks (for all the orders)
    n = (len >> (MAX_ORD + 5)) + 1; // estimated # of marks for max order
80020f18:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80020f1c:	e1a038a3 	lsr	r3, r3, #17
80020f20:	e2833001 	add	r3, r3, #1
80020f24:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    total = 0;
80020f28:	e3a03000 	mov	r3, #0
80020f2c:	e50b3010 	str	r3, [fp, #-16]
    
    for (i = N_ORD - 1; i >= 0; i--) {
80020f30:	e3a03006 	mov	r3, #6
80020f34:	e50b3008 	str	r3, [fp, #-8]
80020f38:	ea00002a 	b	80020fe8 <kmem_init2+0x124>
        ord = kmem.orders + i;
80020f3c:	e51b3008 	ldr	r3, [fp, #-8]
80020f40:	e1a02183 	lsl	r2, r3, #3
80020f44:	e59f312c 	ldr	r3, [pc, #300]	; 80021078 <kmem_init2+0x1b4>
80020f48:	e0823003 	add	r3, r2, r3
80020f4c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        ord->offset = total;
80020f50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80020f54:	e51b2010 	ldr	r2, [fp, #-16]
80020f58:	e5832004 	str	r2, [r3, #4]
        ord->head = NIL;
80020f5c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80020f60:	e30f2fff 	movw	r2, #65535	; 0xffff
80020f64:	e5832000 	str	r2, [r3]
        
        // set the bitmaps to mark all blocks not available
        for (j = 0; j < n; j++) {
80020f68:	e3a03000 	mov	r3, #0
80020f6c:	e50b300c 	str	r3, [fp, #-12]
80020f70:	ea00000e 	b	80020fb0 <kmem_init2+0xec>
            mk = get_mark(i + MIN_ORD, j);
80020f74:	e51b3008 	ldr	r3, [fp, #-8]
80020f78:	e2833006 	add	r3, r3, #6
80020f7c:	e1a00003 	mov	r0, r3
80020f80:	e51b100c 	ldr	r1, [fp, #-12]
80020f84:	ebffff7b 	bl	80020d78 <get_mark>
80020f88:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
            mk->lnks = LNKS(NIL, NIL);
80020f8c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80020f90:	e3e02000 	mvn	r2, #0
80020f94:	e5832000 	str	r2, [r3]
            mk->bitmap = 0;
80020f98:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80020f9c:	e3a02000 	mov	r2, #0
80020fa0:	e5832004 	str	r2, [r3, #4]
        ord = kmem.orders + i;
        ord->offset = total;
        ord->head = NIL;
        
        // set the bitmaps to mark all blocks not available
        for (j = 0; j < n; j++) {
80020fa4:	e51b300c 	ldr	r3, [fp, #-12]
80020fa8:	e2833001 	add	r3, r3, #1
80020fac:	e50b300c 	str	r3, [fp, #-12]
80020fb0:	e51b200c 	ldr	r2, [fp, #-12]
80020fb4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80020fb8:	e1520003 	cmp	r2, r3
80020fbc:	3affffec 	bcc	80020f74 <kmem_init2+0xb0>
            mk = get_mark(i + MIN_ORD, j);
            mk->lnks = LNKS(NIL, NIL);
            mk->bitmap = 0;
        }

        total += n;
80020fc0:	e51b2010 	ldr	r2, [fp, #-16]
80020fc4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80020fc8:	e0823003 	add	r3, r2, r3
80020fcc:	e50b3010 	str	r3, [fp, #-16]
        n <<= 1;     // each order doubles required marks
80020fd0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80020fd4:	e1a03083 	lsl	r3, r3, #1
80020fd8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    // reserved memory at vstart for an array of marks (for all the orders)
    n = (len >> (MAX_ORD + 5)) + 1; // estimated # of marks for max order
    total = 0;
    
    for (i = N_ORD - 1; i >= 0; i--) {
80020fdc:	e51b3008 	ldr	r3, [fp, #-8]
80020fe0:	e2433001 	sub	r3, r3, #1
80020fe4:	e50b3008 	str	r3, [fp, #-8]
80020fe8:	e51b3008 	ldr	r3, [fp, #-8]
80020fec:	e3530000 	cmp	r3, #0
80020ff0:	aaffffd1 	bge	80020f3c <kmem_init2+0x78>
        total += n;
        n <<= 1;     // each order doubles required marks
    }

    // add all available memory to the highest order bucket
    kmem.start_heap = align_up(kmem.start + total * sizeof(*mk), 1 << MAX_ORD);
80020ff4:	e30c3800 	movw	r3, #51200	; 0xc800
80020ff8:	e348300a 	movt	r3, #32778	; 0x800a
80020ffc:	e5932034 	ldr	r2, [r3, #52]	; 0x34
80021000:	e51b3010 	ldr	r3, [fp, #-16]
80021004:	e1a03183 	lsl	r3, r3, #3
80021008:	e0823003 	add	r3, r2, r3
8002100c:	e2833eff 	add	r3, r3, #4080	; 0xff0
80021010:	e283300f 	add	r3, r3, #15
80021014:	e3c32eff 	bic	r2, r3, #4080	; 0xff0
80021018:	e3c2200f 	bic	r2, r2, #15
8002101c:	e30c3800 	movw	r3, #51200	; 0xc800
80021020:	e348300a 	movt	r3, #32778	; 0x800a
80021024:	e5832038 	str	r2, [r3, #56]	; 0x38
    
    for (i = kmem.start_heap; i < kmem.end; i += (1 << MAX_ORD)){
80021028:	e30c3800 	movw	r3, #51200	; 0xc800
8002102c:	e348300a 	movt	r3, #32778	; 0x800a
80021030:	e5933038 	ldr	r3, [r3, #56]	; 0x38
80021034:	e50b3008 	str	r3, [fp, #-8]
80021038:	ea000006 	b	80021058 <kmem_init2+0x194>
        kfree ((void*)i, MAX_ORD);
8002103c:	e51b3008 	ldr	r3, [fp, #-8]
80021040:	e1a00003 	mov	r0, r3
80021044:	e3a0100c 	mov	r1, #12
80021048:	eb000184 	bl	80021660 <kfree>
    }

    // add all available memory to the highest order bucket
    kmem.start_heap = align_up(kmem.start + total * sizeof(*mk), 1 << MAX_ORD);
    
    for (i = kmem.start_heap; i < kmem.end; i += (1 << MAX_ORD)){
8002104c:	e51b3008 	ldr	r3, [fp, #-8]
80021050:	e2833a01 	add	r3, r3, #4096	; 0x1000
80021054:	e50b3008 	str	r3, [fp, #-8]
80021058:	e51b2008 	ldr	r2, [fp, #-8]
8002105c:	e30c3800 	movw	r3, #51200	; 0xc800
80021060:	e348300a 	movt	r3, #32778	; 0x800a
80021064:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
80021068:	e1520003 	cmp	r2, r3
8002106c:	3afffff2 	bcc	8002103c <kmem_init2+0x178>
        kfree ((void*)i, MAX_ORD);
    }
}
80021070:	e24bd004 	sub	sp, fp, #4
80021074:	e8bd8800 	pop	{fp, pc}
80021078:	800ac840 	.word	0x800ac840

8002107c <unmark_blk>:

// mark a block as unavailable
static void unmark_blk (int order, int blk_id)
{
8002107c:	e92d4800 	push	{fp, lr}
80021080:	e28db004 	add	fp, sp, #4
80021084:	e24dd020 	sub	sp, sp, #32
80021088:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
8002108c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    struct mark     *mk, *p;
    struct order    *ord;
    int             prev, next;

    ord = &kmem.orders[order - MIN_ORD];
80021090:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80021094:	e2433006 	sub	r3, r3, #6
80021098:	e1a02183 	lsl	r2, r3, #3
8002109c:	e59f3178 	ldr	r3, [pc, #376]	; 8002121c <unmark_blk+0x1a0>
800210a0:	e0823003 	add	r3, r2, r3
800210a4:	e50b3008 	str	r3, [fp, #-8]
    mk  = get_mark (order, blk_id >> 5);
800210a8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800210ac:	e1a032c3 	asr	r3, r3, #5
800210b0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
800210b4:	e1a01003 	mov	r1, r3
800210b8:	ebffff2e 	bl	80020d78 <get_mark>
800210bc:	e50b000c 	str	r0, [fp, #-12]

    // clear the bit in the bitmap
    if (!available(mk->bitmap, blk_id)) {
800210c0:	e51b300c 	ldr	r3, [fp, #-12]
800210c4:	e5933004 	ldr	r3, [r3, #4]
800210c8:	e1a00003 	mov	r0, r3
800210cc:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
800210d0:	ebffff63 	bl	80020e64 <available>
800210d4:	e1a03000 	mov	r3, r0
800210d8:	e3530000 	cmp	r3, #0
800210dc:	1a000002 	bne	800210ec <unmark_blk+0x70>
        panic ("double alloc\n");
800210e0:	e3090bfc 	movw	r0, #39932	; 0x9bfc
800210e4:	e3480002 	movt	r0, #32770	; 0x8002
800210e8:	eb0002b3 	bl	80021bbc <panic>
    }

    mk->bitmap &= ~(1 << (blk_id & 0x1F));
800210ec:	e51b300c 	ldr	r3, [fp, #-12]
800210f0:	e5932004 	ldr	r2, [r3, #4]
800210f4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800210f8:	e203301f 	and	r3, r3, #31
800210fc:	e3a01001 	mov	r1, #1
80021100:	e1a03311 	lsl	r3, r1, r3
80021104:	e1e03003 	mvn	r3, r3
80021108:	e0022003 	and	r2, r2, r3
8002110c:	e51b300c 	ldr	r3, [fp, #-12]
80021110:	e5832004 	str	r2, [r3, #4]
    
    // if it's the last block in the bitmap, delete from the list
    if (mk->bitmap == 0) {
80021114:	e51b300c 	ldr	r3, [fp, #-12]
80021118:	e5933004 	ldr	r3, [r3, #4]
8002111c:	e3530000 	cmp	r3, #0
80021120:	1a00003b 	bne	80021214 <unmark_blk+0x198>
        blk_id >>= 5;
80021124:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80021128:	e1a032c3 	asr	r3, r3, #5
8002112c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
        
        prev = PRE_LNK(mk->lnks);
80021130:	e51b300c 	ldr	r3, [fp, #-12]
80021134:	e5933000 	ldr	r3, [r3]
80021138:	e1a03823 	lsr	r3, r3, #16
8002113c:	e50b3010 	str	r3, [fp, #-16]
        next = NEXT_LNK(mk->lnks);
80021140:	e51b300c 	ldr	r3, [fp, #-12]
80021144:	e5933000 	ldr	r3, [r3]
80021148:	e1a03803 	lsl	r3, r3, #16
8002114c:	e1a03823 	lsr	r3, r3, #16
80021150:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

        if (prev != NIL) {
80021154:	e51b2010 	ldr	r2, [fp, #-16]
80021158:	e30f3fff 	movw	r3, #65535	; 0xffff
8002115c:	e1520003 	cmp	r2, r3
80021160:	0a00000e 	beq	800211a0 <unmark_blk+0x124>
            p = get_mark(order, prev);
80021164:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80021168:	e51b1010 	ldr	r1, [fp, #-16]
8002116c:	ebffff01 	bl	80020d78 <get_mark>
80021170:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
            p->lnks = LNKS(PRE_LNK(p->lnks), next);
80021174:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021178:	e5933000 	ldr	r3, [r3]
8002117c:	e1a02823 	lsr	r2, r3, #16
80021180:	e1a02802 	lsl	r2, r2, #16
80021184:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80021188:	e1a03803 	lsl	r3, r3, #16
8002118c:	e1a03823 	lsr	r3, r3, #16
80021190:	e1822003 	orr	r2, r2, r3
80021194:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021198:	e5832000 	str	r2, [r3]
8002119c:	ea000007 	b	800211c0 <unmark_blk+0x144>
            
        } else if (ord->head == blk_id) {
800211a0:	e51b3008 	ldr	r3, [fp, #-8]
800211a4:	e5932000 	ldr	r2, [r3]
800211a8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800211ac:	e1520003 	cmp	r2, r3
800211b0:	1a000002 	bne	800211c0 <unmark_blk+0x144>
            // if we are the first in the link
            ord->head = next;
800211b4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800211b8:	e51b3008 	ldr	r3, [fp, #-8]
800211bc:	e5832000 	str	r2, [r3]
        }

        if (next != NIL) {
800211c0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800211c4:	e30f3fff 	movw	r3, #65535	; 0xffff
800211c8:	e1520003 	cmp	r2, r3
800211cc:	0a00000d 	beq	80021208 <unmark_blk+0x18c>
            p = get_mark(order, next);
800211d0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
800211d4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
800211d8:	ebfffee6 	bl	80020d78 <get_mark>
800211dc:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
            p->lnks = LNKS(prev, NEXT_LNK(p->lnks));
800211e0:	e51b3010 	ldr	r3, [fp, #-16]
800211e4:	e1a03803 	lsl	r3, r3, #16
800211e8:	e1a02003 	mov	r2, r3
800211ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800211f0:	e5933000 	ldr	r3, [r3]
800211f4:	e1a03803 	lsl	r3, r3, #16
800211f8:	e1a03823 	lsr	r3, r3, #16
800211fc:	e1822003 	orr	r2, r2, r3
80021200:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021204:	e5832000 	str	r2, [r3]
        }

        mk->lnks = LNKS(NIL, NIL);
80021208:	e51b300c 	ldr	r3, [fp, #-12]
8002120c:	e3e02000 	mvn	r2, #0
80021210:	e5832000 	str	r2, [r3]
    }
}
80021214:	e24bd004 	sub	sp, fp, #4
80021218:	e8bd8800 	pop	{fp, pc}
8002121c:	800ac840 	.word	0x800ac840

80021220 <mark_blk>:

// mark a block as available
static void mark_blk (int order, int blk_id)
{
80021220:	e92d4800 	push	{fp, lr}
80021224:	e28db004 	add	fp, sp, #4
80021228:	e24dd018 	sub	sp, sp, #24
8002122c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
80021230:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    struct mark     *mk, *p;
    struct order    *ord;
    int             insert;
    
    ord = &kmem.orders[order - MIN_ORD];
80021234:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021238:	e2433006 	sub	r3, r3, #6
8002123c:	e1a02183 	lsl	r2, r3, #3
80021240:	e59f311c 	ldr	r3, [pc, #284]	; 80021364 <mark_blk+0x144>
80021244:	e0823003 	add	r3, r2, r3
80021248:	e50b3008 	str	r3, [fp, #-8]
    mk  = get_mark (order, blk_id >> 5);
8002124c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80021250:	e1a032c3 	asr	r3, r3, #5
80021254:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80021258:	e1a01003 	mov	r1, r3
8002125c:	ebfffec5 	bl	80020d78 <get_mark>
80021260:	e50b000c 	str	r0, [fp, #-12]

    // whether we need to insert it into the list
    insert = (mk->bitmap == 0);
80021264:	e51b300c 	ldr	r3, [fp, #-12]
80021268:	e5933004 	ldr	r3, [r3, #4]
8002126c:	e3530000 	cmp	r3, #0
80021270:	13a03000 	movne	r3, #0
80021274:	03a03001 	moveq	r3, #1
80021278:	e50b3010 	str	r3, [fp, #-16]

    // clear the bit map
    if (available(mk->bitmap, blk_id)) {
8002127c:	e51b300c 	ldr	r3, [fp, #-12]
80021280:	e5933004 	ldr	r3, [r3, #4]
80021284:	e1a00003 	mov	r0, r3
80021288:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
8002128c:	ebfffef4 	bl	80020e64 <available>
80021290:	e1a03000 	mov	r3, r0
80021294:	e3530000 	cmp	r3, #0
80021298:	0a000002 	beq	800212a8 <mark_blk+0x88>
        panic ("double free\n");
8002129c:	e3090c0c 	movw	r0, #39948	; 0x9c0c
800212a0:	e3480002 	movt	r0, #32770	; 0x8002
800212a4:	eb000244 	bl	80021bbc <panic>
    }
    
    mk->bitmap |= (1 << (blk_id & 0x1F));
800212a8:	e51b300c 	ldr	r3, [fp, #-12]
800212ac:	e5932004 	ldr	r2, [r3, #4]
800212b0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
800212b4:	e203301f 	and	r3, r3, #31
800212b8:	e3a01001 	mov	r1, #1
800212bc:	e1a03311 	lsl	r3, r1, r3
800212c0:	e1822003 	orr	r2, r2, r3
800212c4:	e51b300c 	ldr	r3, [fp, #-12]
800212c8:	e5832004 	str	r2, [r3, #4]
    
    // just insert it to the head, no need to keep the list ordered
    if (insert) {
800212cc:	e51b3010 	ldr	r3, [fp, #-16]
800212d0:	e3530000 	cmp	r3, #0
800212d4:	0a000020 	beq	8002135c <mark_blk+0x13c>
        blk_id >>= 5;
800212d8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
800212dc:	e1a032c3 	asr	r3, r3, #5
800212e0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        mk->lnks = LNKS(NIL, ord->head);
800212e4:	e51b3008 	ldr	r3, [fp, #-8]
800212e8:	e5933000 	ldr	r3, [r3]
800212ec:	e1e03803 	mvn	r3, r3, lsl #16
800212f0:	e1e03823 	mvn	r3, r3, lsr #16
800212f4:	e51b200c 	ldr	r2, [fp, #-12]
800212f8:	e5823000 	str	r3, [r2]

        // fix the pre pointer of the next mark
        if (ord->head != NIL) {
800212fc:	e51b3008 	ldr	r3, [fp, #-8]
80021300:	e5932000 	ldr	r2, [r3]
80021304:	e30f3fff 	movw	r3, #65535	; 0xffff
80021308:	e1520003 	cmp	r2, r3
8002130c:	0a00000f 	beq	80021350 <mark_blk+0x130>
            p = get_mark(order, ord->head);
80021310:	e51b3008 	ldr	r3, [fp, #-8]
80021314:	e5933000 	ldr	r3, [r3]
80021318:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
8002131c:	e1a01003 	mov	r1, r3
80021320:	ebfffe94 	bl	80020d78 <get_mark>
80021324:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
            p->lnks = LNKS(blk_id, NEXT_LNK(p->lnks));
80021328:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
8002132c:	e1a03803 	lsl	r3, r3, #16
80021330:	e1a02003 	mov	r2, r3
80021334:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80021338:	e5933000 	ldr	r3, [r3]
8002133c:	e1a03803 	lsl	r3, r3, #16
80021340:	e1a03823 	lsr	r3, r3, #16
80021344:	e1822003 	orr	r2, r2, r3
80021348:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
8002134c:	e5832000 	str	r2, [r3]
        }
        
        ord->head = blk_id;
80021350:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
80021354:	e51b3008 	ldr	r3, [fp, #-8]
80021358:	e5832000 	str	r2, [r3]
    }
}
8002135c:	e24bd004 	sub	sp, fp, #4
80021360:	e8bd8800 	pop	{fp, pc}
80021364:	800ac840 	.word	0x800ac840

80021368 <get_blk>:

// get a block
static void* get_blk (int order)
{
80021368:	e92d4800 	push	{fp, lr}
8002136c:	e28db004 	add	fp, sp, #4
80021370:	e24dd018 	sub	sp, sp, #24
80021374:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    struct mark *mk;
    int blk_id;
    int i;
    struct order *ord;

    ord = &kmem.orders[order - MIN_ORD];
80021378:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002137c:	e2433006 	sub	r3, r3, #6
80021380:	e1a02183 	lsl	r2, r3, #3
80021384:	e59f30c4 	ldr	r3, [pc, #196]	; 80021450 <get_blk+0xe8>
80021388:	e0823003 	add	r3, r2, r3
8002138c:	e50b300c 	str	r3, [fp, #-12]
    mk = get_mark(order, ord->head);
80021390:	e51b300c 	ldr	r3, [fp, #-12]
80021394:	e5933000 	ldr	r3, [r3]
80021398:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
8002139c:	e1a01003 	mov	r1, r3
800213a0:	ebfffe74 	bl	80020d78 <get_mark>
800213a4:	e50b0010 	str	r0, [fp, #-16]

    if (mk->bitmap == 0) {
800213a8:	e51b3010 	ldr	r3, [fp, #-16]
800213ac:	e5933004 	ldr	r3, [r3, #4]
800213b0:	e3530000 	cmp	r3, #0
800213b4:	1a000002 	bne	800213c4 <get_blk+0x5c>
        panic ("empty mark in the list\n");
800213b8:	e3090c1c 	movw	r0, #39964	; 0x9c1c
800213bc:	e3480002 	movt	r0, #32770	; 0x8002
800213c0:	eb0001fd 	bl	80021bbc <panic>
    }

    for (i = 0; i < 32; i++) {
800213c4:	e3a03000 	mov	r3, #0
800213c8:	e50b3008 	str	r3, [fp, #-8]
800213cc:	ea000018 	b	80021434 <get_blk+0xcc>
        if (mk->bitmap & (1 << i)) {
800213d0:	e51b3010 	ldr	r3, [fp, #-16]
800213d4:	e5932004 	ldr	r2, [r3, #4]
800213d8:	e3a01001 	mov	r1, #1
800213dc:	e51b3008 	ldr	r3, [fp, #-8]
800213e0:	e1a03311 	lsl	r3, r1, r3
800213e4:	e0023003 	and	r3, r2, r3
800213e8:	e3530000 	cmp	r3, #0
800213ec:	0a00000d 	beq	80021428 <get_blk+0xc0>
            blk_id = ord->head * 32 + i;
800213f0:	e51b300c 	ldr	r3, [fp, #-12]
800213f4:	e5933000 	ldr	r3, [r3]
800213f8:	e1a02283 	lsl	r2, r3, #5
800213fc:	e51b3008 	ldr	r3, [fp, #-8]
80021400:	e0823003 	add	r3, r2, r3
80021404:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            unmark_blk(order, blk_id);
80021408:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
8002140c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
80021410:	ebffff19 	bl	8002107c <unmark_blk>
            
            return blkid2mem(order, blk_id);
80021414:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80021418:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
8002141c:	ebfffe70 	bl	80020de4 <blkid2mem>
80021420:	e1a03000 	mov	r3, r0
80021424:	ea000006 	b	80021444 <get_blk+0xdc>

    if (mk->bitmap == 0) {
        panic ("empty mark in the list\n");
    }

    for (i = 0; i < 32; i++) {
80021428:	e51b3008 	ldr	r3, [fp, #-8]
8002142c:	e2833001 	add	r3, r3, #1
80021430:	e50b3008 	str	r3, [fp, #-8]
80021434:	e51b3008 	ldr	r3, [fp, #-8]
80021438:	e353001f 	cmp	r3, #31
8002143c:	daffffe3 	ble	800213d0 <get_blk+0x68>
            
            return blkid2mem(order, blk_id);
        }
    }

    return NULL;
80021440:	e3a03000 	mov	r3, #0
}
80021444:	e1a00003 	mov	r0, r3
80021448:	e24bd004 	sub	sp, fp, #4
8002144c:	e8bd8800 	pop	{fp, pc}
80021450:	800ac840 	.word	0x800ac840

80021454 <_kmalloc>:

void _kfree (void *mem, int order);


static void *_kmalloc (int order)
{
80021454:	e92d4800 	push	{fp, lr}
80021458:	e28db004 	add	fp, sp, #4
8002145c:	e24dd010 	sub	sp, sp, #16
80021460:	e50b0010 	str	r0, [fp, #-16]
    struct order *ord;
    uint8         *up;

    ord = &kmem.orders[order - MIN_ORD];
80021464:	e51b3010 	ldr	r3, [fp, #-16]
80021468:	e2433006 	sub	r3, r3, #6
8002146c:	e1a02183 	lsl	r2, r3, #3
80021470:	e59f308c 	ldr	r3, [pc, #140]	; 80021504 <_kmalloc+0xb0>
80021474:	e0823003 	add	r3, r2, r3
80021478:	e50b300c 	str	r3, [fp, #-12]
    up  = NULL;
8002147c:	e3a03000 	mov	r3, #0
80021480:	e50b3008 	str	r3, [fp, #-8]
    
    if (ord->head != NIL) {
80021484:	e51b300c 	ldr	r3, [fp, #-12]
80021488:	e5932000 	ldr	r2, [r3]
8002148c:	e30f3fff 	movw	r3, #65535	; 0xffff
80021490:	e1520003 	cmp	r2, r3
80021494:	0a000003 	beq	800214a8 <_kmalloc+0x54>
        up = get_blk(order);
80021498:	e51b0010 	ldr	r0, [fp, #-16]
8002149c:	ebffffb1 	bl	80021368 <get_blk>
800214a0:	e50b0008 	str	r0, [fp, #-8]
800214a4:	ea000012 	b	800214f4 <_kmalloc+0xa0>
        
    } else if (order < MAX_ORD){
800214a8:	e51b3010 	ldr	r3, [fp, #-16]
800214ac:	e353000b 	cmp	r3, #11
800214b0:	ca00000f 	bgt	800214f4 <_kmalloc+0xa0>
        // if currently no block available, try to split a parent
        up = _kmalloc (order + 1);
800214b4:	e51b3010 	ldr	r3, [fp, #-16]
800214b8:	e2833001 	add	r3, r3, #1
800214bc:	e1a00003 	mov	r0, r3
800214c0:	ebffffe3 	bl	80021454 <_kmalloc>
800214c4:	e50b0008 	str	r0, [fp, #-8]

        if (up != NULL) {
800214c8:	e51b3008 	ldr	r3, [fp, #-8]
800214cc:	e3530000 	cmp	r3, #0
800214d0:	0a000007 	beq	800214f4 <_kmalloc+0xa0>
            _kfree (up + (1 << order), order);
800214d4:	e3a02001 	mov	r2, #1
800214d8:	e51b3010 	ldr	r3, [fp, #-16]
800214dc:	e1a03312 	lsl	r3, r2, r3
800214e0:	e51b2008 	ldr	r2, [fp, #-8]
800214e4:	e0823003 	add	r3, r2, r3
800214e8:	e1a00003 	mov	r0, r3
800214ec:	e51b1010 	ldr	r1, [fp, #-16]
800214f0:	eb00001e 	bl	80021570 <_kfree>
        }
    }

    return up;
800214f4:	e51b3008 	ldr	r3, [fp, #-8]
}
800214f8:	e1a00003 	mov	r0, r3
800214fc:	e24bd004 	sub	sp, fp, #4
80021500:	e8bd8800 	pop	{fp, pc}
80021504:	800ac840 	.word	0x800ac840

80021508 <kmalloc>:

// allocate memory that has the size of (1 << order)
void *kmalloc (int order)
{
80021508:	e92d4800 	push	{fp, lr}
8002150c:	e28db004 	add	fp, sp, #4
80021510:	e24dd010 	sub	sp, sp, #16
80021514:	e50b0010 	str	r0, [fp, #-16]
    uint8         *up;

    if ((order > MAX_ORD) || (order < MIN_ORD)) {
80021518:	e51b3010 	ldr	r3, [fp, #-16]
8002151c:	e353000c 	cmp	r3, #12
80021520:	ca000002 	bgt	80021530 <kmalloc+0x28>
80021524:	e51b3010 	ldr	r3, [fp, #-16]
80021528:	e3530005 	cmp	r3, #5
8002152c:	ca000002 	bgt	8002153c <kmalloc+0x34>
        panic("kmalloc: order out of range\n");
80021530:	e3090c34 	movw	r0, #39988	; 0x9c34
80021534:	e3480002 	movt	r0, #32770	; 0x8002
80021538:	eb00019f 	bl	80021bbc <panic>
    }

    acquire(&kmem.lock);
8002153c:	e30c0800 	movw	r0, #51200	; 0xc800
80021540:	e348000a 	movt	r0, #32778	; 0x800a
80021544:	eb0012d0 	bl	8002608c <acquire>
    up = _kmalloc(order);
80021548:	e51b0010 	ldr	r0, [fp, #-16]
8002154c:	ebffffc0 	bl	80021454 <_kmalloc>
80021550:	e50b0008 	str	r0, [fp, #-8]
    release(&kmem.lock);
80021554:	e30c0800 	movw	r0, #51200	; 0xc800
80021558:	e348000a 	movt	r0, #32778	; 0x800a
8002155c:	eb0012d4 	bl	800260b4 <release>

    return up;
80021560:	e51b3008 	ldr	r3, [fp, #-8]
}
80021564:	e1a00003 	mov	r0, r3
80021568:	e24bd004 	sub	sp, fp, #4
8002156c:	e8bd8800 	pop	{fp, pc}

80021570 <_kfree>:

void _kfree (void *mem, int order)
{
80021570:	e92d4800 	push	{fp, lr}
80021574:	e28db004 	add	fp, sp, #4
80021578:	e24dd018 	sub	sp, sp, #24
8002157c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
80021580:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    int blk_id, buddy_id;
    struct mark *mk;

    blk_id = mem2blkid(order, mem);
80021584:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
80021588:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
8002158c:	ebfffe24 	bl	80020e24 <mem2blkid>
80021590:	e50b0008 	str	r0, [fp, #-8]
    mk = get_mark(order, blk_id >> 5);
80021594:	e51b3008 	ldr	r3, [fp, #-8]
80021598:	e1a032c3 	asr	r3, r3, #5
8002159c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
800215a0:	e1a01003 	mov	r1, r3
800215a4:	ebfffdf3 	bl	80020d78 <get_mark>
800215a8:	e50b000c 	str	r0, [fp, #-12]

    if (available(mk->bitmap, blk_id)) {
800215ac:	e51b300c 	ldr	r3, [fp, #-12]
800215b0:	e5933004 	ldr	r3, [r3, #4]
800215b4:	e1a00003 	mov	r0, r3
800215b8:	e51b1008 	ldr	r1, [fp, #-8]
800215bc:	ebfffe28 	bl	80020e64 <available>
800215c0:	e1a03000 	mov	r3, r0
800215c4:	e3530000 	cmp	r3, #0
800215c8:	0a000002 	beq	800215d8 <_kfree+0x68>
        panic ("kfree: double free");
800215cc:	e3090c54 	movw	r0, #40020	; 0x9c54
800215d0:	e3480002 	movt	r0, #32770	; 0x8002
800215d4:	eb000178 	bl	80021bbc <panic>
    }

    buddy_id = blk_id ^ 0x0001; // blk_id and buddy_id differs in the last bit
800215d8:	e51b3008 	ldr	r3, [fp, #-8]
800215dc:	e2233001 	eor	r3, r3, #1
800215e0:	e50b3010 	str	r3, [fp, #-16]
                                // buddy must be in the same bit map
    if (!available(mk->bitmap, buddy_id) || (order == MAX_ORD)) {
800215e4:	e51b300c 	ldr	r3, [fp, #-12]
800215e8:	e5933004 	ldr	r3, [r3, #4]
800215ec:	e1a00003 	mov	r0, r3
800215f0:	e51b1010 	ldr	r1, [fp, #-16]
800215f4:	ebfffe1a 	bl	80020e64 <available>
800215f8:	e1a03000 	mov	r3, r0
800215fc:	e3530000 	cmp	r3, #0
80021600:	0a000002 	beq	80021610 <_kfree+0xa0>
80021604:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80021608:	e353000c 	cmp	r3, #12
8002160c:	1a000003 	bne	80021620 <_kfree+0xb0>
        mark_blk(order, blk_id);
80021610:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
80021614:	e51b1008 	ldr	r1, [fp, #-8]
80021618:	ebffff00 	bl	80021220 <mark_blk>
8002161c:	ea00000d 	b	80021658 <_kfree+0xe8>
    } else {
        // our buddy is also free, merge it
        unmark_blk (order, buddy_id);
80021620:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
80021624:	e51b1010 	ldr	r1, [fp, #-16]
80021628:	ebfffe93 	bl	8002107c <unmark_blk>
        _kfree (blkid2mem(order, blk_id & ~0x0001), order+1);
8002162c:	e51b3008 	ldr	r3, [fp, #-8]
80021630:	e3c33001 	bic	r3, r3, #1
80021634:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
80021638:	e1a01003 	mov	r1, r3
8002163c:	ebfffde8 	bl	80020de4 <blkid2mem>
80021640:	e1a02000 	mov	r2, r0
80021644:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80021648:	e2833001 	add	r3, r3, #1
8002164c:	e1a00002 	mov	r0, r2
80021650:	e1a01003 	mov	r1, r3
80021654:	ebffffc5 	bl	80021570 <_kfree>
    }
}
80021658:	e24bd004 	sub	sp, fp, #4
8002165c:	e8bd8800 	pop	{fp, pc}

80021660 <kfree>:

// free kernel memory, we require order parameter here to avoid
// storing size info somewhere which might break the alignment
void kfree (void *mem, int order)
{
80021660:	e92d4800 	push	{fp, lr}
80021664:	e28db004 	add	fp, sp, #4
80021668:	e24dd008 	sub	sp, sp, #8
8002166c:	e50b0008 	str	r0, [fp, #-8]
80021670:	e50b100c 	str	r1, [fp, #-12]
    if ((order > MAX_ORD) || (order < MIN_ORD) || (uint)mem & ((1<<order) -1)) {
80021674:	e51b300c 	ldr	r3, [fp, #-12]
80021678:	e353000c 	cmp	r3, #12
8002167c:	ca00000b 	bgt	800216b0 <kfree+0x50>
80021680:	e51b300c 	ldr	r3, [fp, #-12]
80021684:	e3530005 	cmp	r3, #5
80021688:	da000008 	ble	800216b0 <kfree+0x50>
8002168c:	e3a02001 	mov	r2, #1
80021690:	e51b300c 	ldr	r3, [fp, #-12]
80021694:	e1a03312 	lsl	r3, r2, r3
80021698:	e2433001 	sub	r3, r3, #1
8002169c:	e1a02003 	mov	r2, r3
800216a0:	e51b3008 	ldr	r3, [fp, #-8]
800216a4:	e0023003 	and	r3, r2, r3
800216a8:	e3530000 	cmp	r3, #0
800216ac:	0a000002 	beq	800216bc <kfree+0x5c>
        panic("kfree: order out of range or memory unaligned\n");
800216b0:	e3090c68 	movw	r0, #40040	; 0x9c68
800216b4:	e3480002 	movt	r0, #32770	; 0x8002
800216b8:	eb00013f 	bl	80021bbc <panic>
    }

    acquire(&kmem.lock);
800216bc:	e30c0800 	movw	r0, #51200	; 0xc800
800216c0:	e348000a 	movt	r0, #32778	; 0x800a
800216c4:	eb001270 	bl	8002608c <acquire>
    _kfree(mem, order);
800216c8:	e51b0008 	ldr	r0, [fp, #-8]
800216cc:	e51b100c 	ldr	r1, [fp, #-12]
800216d0:	ebffffa6 	bl	80021570 <_kfree>
    release(&kmem.lock);
800216d4:	e30c0800 	movw	r0, #51200	; 0xc800
800216d8:	e348000a 	movt	r0, #32778	; 0x800a
800216dc:	eb001274 	bl	800260b4 <release>
}
800216e0:	e24bd004 	sub	sp, fp, #4
800216e4:	e8bd8800 	pop	{fp, pc}

800216e8 <free_page>:

// free a page
void free_page(void *v)
{
800216e8:	e92d4800 	push	{fp, lr}
800216ec:	e28db004 	add	fp, sp, #4
800216f0:	e24dd008 	sub	sp, sp, #8
800216f4:	e50b0008 	str	r0, [fp, #-8]
    kfree (v, PTE_SHIFT);
800216f8:	e51b0008 	ldr	r0, [fp, #-8]
800216fc:	e3a0100c 	mov	r1, #12
80021700:	ebffffd6 	bl	80021660 <kfree>
}
80021704:	e24bd004 	sub	sp, fp, #4
80021708:	e8bd8800 	pop	{fp, pc}

8002170c <alloc_page>:

// allocate a page
void* alloc_page (void)
{
8002170c:	e92d4800 	push	{fp, lr}
80021710:	e28db004 	add	fp, sp, #4
    return kmalloc (PTE_SHIFT);
80021714:	e3a0000c 	mov	r0, #12
80021718:	ebffff7a 	bl	80021508 <kmalloc>
8002171c:	e1a03000 	mov	r3, r0
}
80021720:	e1a00003 	mov	r0, r3
80021724:	e8bd8800 	pop	{fp, pc}

80021728 <get_order>:

// round up power of 2, then get the order
//   http://graphics.stanford.edu/~seander/bithacks.html#RoundUpPowerOf2
int get_order (uint32 v)
{
80021728:	e92d4800 	push	{fp, lr}
8002172c:	e28db004 	add	fp, sp, #4
80021730:	e24dd010 	sub	sp, sp, #16
80021734:	e50b0010 	str	r0, [fp, #-16]
    uint32 ord;
    
    v--;
80021738:	e51b3010 	ldr	r3, [fp, #-16]
8002173c:	e2433001 	sub	r3, r3, #1
80021740:	e50b3010 	str	r3, [fp, #-16]
    v |= v >> 1;
80021744:	e51b3010 	ldr	r3, [fp, #-16]
80021748:	e1a030a3 	lsr	r3, r3, #1
8002174c:	e51b2010 	ldr	r2, [fp, #-16]
80021750:	e1823003 	orr	r3, r2, r3
80021754:	e50b3010 	str	r3, [fp, #-16]
    v |= v >> 2;
80021758:	e51b3010 	ldr	r3, [fp, #-16]
8002175c:	e1a03123 	lsr	r3, r3, #2
80021760:	e51b2010 	ldr	r2, [fp, #-16]
80021764:	e1823003 	orr	r3, r2, r3
80021768:	e50b3010 	str	r3, [fp, #-16]
    v |= v >> 4;
8002176c:	e51b3010 	ldr	r3, [fp, #-16]
80021770:	e1a03223 	lsr	r3, r3, #4
80021774:	e51b2010 	ldr	r2, [fp, #-16]
80021778:	e1823003 	orr	r3, r2, r3
8002177c:	e50b3010 	str	r3, [fp, #-16]
    v |= v >> 8;
80021780:	e51b3010 	ldr	r3, [fp, #-16]
80021784:	e1a03423 	lsr	r3, r3, #8
80021788:	e51b2010 	ldr	r2, [fp, #-16]
8002178c:	e1823003 	orr	r3, r2, r3
80021790:	e50b3010 	str	r3, [fp, #-16]
    v |= v >> 16;
80021794:	e51b3010 	ldr	r3, [fp, #-16]
80021798:	e1a03823 	lsr	r3, r3, #16
8002179c:	e51b2010 	ldr	r2, [fp, #-16]
800217a0:	e1823003 	orr	r3, r2, r3
800217a4:	e50b3010 	str	r3, [fp, #-16]
    v++;
800217a8:	e51b3010 	ldr	r3, [fp, #-16]
800217ac:	e2833001 	add	r3, r3, #1
800217b0:	e50b3010 	str	r3, [fp, #-16]

    for (ord = 0; ord < 32; ord++) {
800217b4:	e3a03000 	mov	r3, #0
800217b8:	e50b3008 	str	r3, [fp, #-8]
800217bc:	ea00000a 	b	800217ec <get_order+0xc4>
        if (v & (1 << ord)) {
800217c0:	e51b3008 	ldr	r3, [fp, #-8]
800217c4:	e3a02001 	mov	r2, #1
800217c8:	e1a03312 	lsl	r3, r2, r3
800217cc:	e1a02003 	mov	r2, r3
800217d0:	e51b3010 	ldr	r3, [fp, #-16]
800217d4:	e0023003 	and	r3, r2, r3
800217d8:	e3530000 	cmp	r3, #0
800217dc:	1a000006 	bne	800217fc <get_order+0xd4>
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v++;

    for (ord = 0; ord < 32; ord++) {
800217e0:	e51b3008 	ldr	r3, [fp, #-8]
800217e4:	e2833001 	add	r3, r3, #1
800217e8:	e50b3008 	str	r3, [fp, #-8]
800217ec:	e51b3008 	ldr	r3, [fp, #-8]
800217f0:	e353001f 	cmp	r3, #31
800217f4:	9afffff1 	bls	800217c0 <get_order+0x98>
800217f8:	ea000000 	b	80021800 <get_order+0xd8>
        if (v & (1 << ord)) {
            break;
800217fc:	e1a00000 	nop			; (mov r0, r0)
        }
    }
    
    if (ord < MIN_ORD) {
80021800:	e51b3008 	ldr	r3, [fp, #-8]
80021804:	e3530005 	cmp	r3, #5
80021808:	8a000002 	bhi	80021818 <get_order+0xf0>
        ord = MIN_ORD;
8002180c:	e3a03006 	mov	r3, #6
80021810:	e50b3008 	str	r3, [fp, #-8]
80021814:	ea000005 	b	80021830 <get_order+0x108>
    } else if (ord > MAX_ORD) {
80021818:	e51b3008 	ldr	r3, [fp, #-8]
8002181c:	e353000c 	cmp	r3, #12
80021820:	9a000002 	bls	80021830 <get_order+0x108>
        panic ("order too big!");
80021824:	e3090c98 	movw	r0, #40088	; 0x9c98
80021828:	e3480002 	movt	r0, #32770	; 0x8002
8002182c:	eb0000e2 	bl	80021bbc <panic>
    }
    
    return ord;
80021830:	e51b3008 	ldr	r3, [fp, #-8]

}
80021834:	e1a00003 	mov	r0, r3
80021838:	e24bd004 	sub	sp, fp, #4
8002183c:	e8bd8800 	pop	{fp, pc}

80021840 <printint>:
    struct spinlock lock;
    int locking;
} cons;

static void printint (int xx, int base, int sign)
{
80021840:	e92d4800 	push	{fp, lr}
80021844:	e28db004 	add	fp, sp, #4
80021848:	e24dd028 	sub	sp, sp, #40	; 0x28
8002184c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
80021850:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
80021854:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    static char digits[] = "0123456789abcdef";
    char buf[16];
    int i;
    uint x;

    if (sign && (sign = xx < 0)) {
80021858:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
8002185c:	e3530000 	cmp	r3, #0
80021860:	0a000009 	beq	8002188c <printint+0x4c>
80021864:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80021868:	e1a03fa3 	lsr	r3, r3, #31
8002186c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
80021870:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80021874:	e3530000 	cmp	r3, #0
80021878:	0a000003 	beq	8002188c <printint+0x4c>
        x = -xx;
8002187c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80021880:	e2633000 	rsb	r3, r3, #0
80021884:	e50b300c 	str	r3, [fp, #-12]
80021888:	ea000001 	b	80021894 <printint+0x54>
    } else {
        x = xx;
8002188c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80021890:	e50b300c 	str	r3, [fp, #-12]
    }

    i = 0;
80021894:	e3a03000 	mov	r3, #0
80021898:	e50b3008 	str	r3, [fp, #-8]

    do {
        buf[i++] = digits[x % base];
8002189c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800218a0:	e51b200c 	ldr	r2, [fp, #-12]
800218a4:	e1a00002 	mov	r0, r2
800218a8:	e1a01003 	mov	r1, r3
800218ac:	eb002056 	bl	80029a0c <__aeabi_uidivmod>
800218b0:	e1a03001 	mov	r3, r1
800218b4:	e1a02003 	mov	r2, r3
800218b8:	e30b3000 	movw	r3, #45056	; 0xb000
800218bc:	e3483002 	movt	r3, #32770	; 0x8002
800218c0:	e7d32002 	ldrb	r2, [r3, r2]
800218c4:	e3e00017 	mvn	r0, #23
800218c8:	e51b3008 	ldr	r3, [fp, #-8]
800218cc:	e24bc004 	sub	ip, fp, #4
800218d0:	e08c1003 	add	r1, ip, r3
800218d4:	e1a03000 	mov	r3, r0
800218d8:	e0813003 	add	r3, r1, r3
800218dc:	e5c32000 	strb	r2, [r3]
800218e0:	e51b3008 	ldr	r3, [fp, #-8]
800218e4:	e2833001 	add	r3, r3, #1
800218e8:	e50b3008 	str	r3, [fp, #-8]
    } while ((x /= base) != 0);
800218ec:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800218f0:	e51b000c 	ldr	r0, [fp, #-12]
800218f4:	e1a01003 	mov	r1, r3
800218f8:	eb002006 	bl	80029918 <__aeabi_uidiv>
800218fc:	e1a03000 	mov	r3, r0
80021900:	e50b300c 	str	r3, [fp, #-12]
80021904:	e51b300c 	ldr	r3, [fp, #-12]
80021908:	e3530000 	cmp	r3, #0
8002190c:	1affffe2 	bne	8002189c <printint+0x5c>

    if (sign) {
80021910:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80021914:	e3530000 	cmp	r3, #0
80021918:	0a000014 	beq	80021970 <printint+0x130>
        buf[i++] = '-';
8002191c:	e3e01017 	mvn	r1, #23
80021920:	e51b3008 	ldr	r3, [fp, #-8]
80021924:	e24b0004 	sub	r0, fp, #4
80021928:	e0802003 	add	r2, r0, r3
8002192c:	e1a03001 	mov	r3, r1
80021930:	e0823003 	add	r3, r2, r3
80021934:	e3a0202d 	mov	r2, #45	; 0x2d
80021938:	e5c32000 	strb	r2, [r3]
8002193c:	e51b3008 	ldr	r3, [fp, #-8]
80021940:	e2833001 	add	r3, r3, #1
80021944:	e50b3008 	str	r3, [fp, #-8]
    }

    while (--i >= 0) {
80021948:	ea000008 	b	80021970 <printint+0x130>
        consputc(buf[i]);
8002194c:	e3e01017 	mvn	r1, #23
80021950:	e51b3008 	ldr	r3, [fp, #-8]
80021954:	e24bc004 	sub	ip, fp, #4
80021958:	e08c2003 	add	r2, ip, r3
8002195c:	e1a03001 	mov	r3, r1
80021960:	e0823003 	add	r3, r2, r3
80021964:	e5d33000 	ldrb	r3, [r3]
80021968:	e1a00003 	mov	r0, r3
8002196c:	eb0000aa 	bl	80021c1c <consputc>

    if (sign) {
        buf[i++] = '-';
    }

    while (--i >= 0) {
80021970:	e51b3008 	ldr	r3, [fp, #-8]
80021974:	e2433001 	sub	r3, r3, #1
80021978:	e50b3008 	str	r3, [fp, #-8]
8002197c:	e51b3008 	ldr	r3, [fp, #-8]
80021980:	e3530000 	cmp	r3, #0
80021984:	aafffff0 	bge	8002194c <printint+0x10c>
        consputc(buf[i]);
    }
}
80021988:	e24bd004 	sub	sp, fp, #4
8002198c:	e8bd8800 	pop	{fp, pc}

80021990 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void cprintf (char *fmt, ...)
{
80021990:	e92d000f 	push	{r0, r1, r2, r3}
80021994:	e92d4800 	push	{fp, lr}
80021998:	e28db004 	add	fp, sp, #4
8002199c:	e24dd018 	sub	sp, sp, #24
    int i, c, locking;
    uint *argp;
    char *s;

    locking = cons.locking;
800219a0:	e30c387c 	movw	r3, #51324	; 0xc87c
800219a4:	e348300a 	movt	r3, #32778	; 0x800a
800219a8:	e5933034 	ldr	r3, [r3, #52]	; 0x34
800219ac:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    if (locking) {
800219b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
800219b4:	e3530000 	cmp	r3, #0
800219b8:	0a000002 	beq	800219c8 <cprintf+0x38>
        acquire(&cons.lock);
800219bc:	e30c087c 	movw	r0, #51324	; 0xc87c
800219c0:	e348000a 	movt	r0, #32778	; 0x800a
800219c4:	eb0011b0 	bl	8002608c <acquire>
    }

    if (fmt == 0) {
800219c8:	e59b3004 	ldr	r3, [fp, #4]
800219cc:	e3530000 	cmp	r3, #0
800219d0:	1a000002 	bne	800219e0 <cprintf+0x50>
        panic("null fmt");
800219d4:	e3090ca8 	movw	r0, #40104	; 0x9ca8
800219d8:	e3480002 	movt	r0, #32770	; 0x8002
800219dc:	eb000076 	bl	80021bbc <panic>
    }

    argp = (uint*) (void*) (&fmt + 1);
800219e0:	e28b3008 	add	r3, fp, #8
800219e4:	e50b300c 	str	r3, [fp, #-12]

    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
800219e8:	e3a03000 	mov	r3, #0
800219ec:	e50b3008 	str	r3, [fp, #-8]
800219f0:	ea00005d 	b	80021b6c <cprintf+0x1dc>
        if (c != '%') {
800219f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800219f8:	e3530025 	cmp	r3, #37	; 0x25
800219fc:	0a000002 	beq	80021a0c <cprintf+0x7c>
            consputc(c);
80021a00:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80021a04:	eb000084 	bl	80021c1c <consputc>
            continue;
80021a08:	ea000054 	b	80021b60 <cprintf+0x1d0>
        }

        c = fmt[++i] & 0xff;
80021a0c:	e59b2004 	ldr	r2, [fp, #4]
80021a10:	e51b3008 	ldr	r3, [fp, #-8]
80021a14:	e2833001 	add	r3, r3, #1
80021a18:	e50b3008 	str	r3, [fp, #-8]
80021a1c:	e51b3008 	ldr	r3, [fp, #-8]
80021a20:	e0823003 	add	r3, r2, r3
80021a24:	e5d33000 	ldrb	r3, [r3]
80021a28:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

        if (c == 0) {
80021a2c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021a30:	e3530000 	cmp	r3, #0
80021a34:	0a000055 	beq	80021b90 <cprintf+0x200>
            break;
        }

        switch (c) {
80021a38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021a3c:	e3530070 	cmp	r3, #112	; 0x70
80021a40:	0a000015 	beq	80021a9c <cprintf+0x10c>
80021a44:	e3530070 	cmp	r3, #112	; 0x70
80021a48:	ca000004 	bgt	80021a60 <cprintf+0xd0>
80021a4c:	e3530025 	cmp	r3, #37	; 0x25
80021a50:	0a00003a 	beq	80021b40 <cprintf+0x1b0>
80021a54:	e3530064 	cmp	r3, #100	; 0x64
80021a58:	0a000005 	beq	80021a74 <cprintf+0xe4>
80021a5c:	ea00003a 	b	80021b4c <cprintf+0x1bc>
80021a60:	e3530073 	cmp	r3, #115	; 0x73
80021a64:	0a000016 	beq	80021ac4 <cprintf+0x134>
80021a68:	e3530078 	cmp	r3, #120	; 0x78
80021a6c:	0a00000a 	beq	80021a9c <cprintf+0x10c>
80021a70:	ea000035 	b	80021b4c <cprintf+0x1bc>
        case 'd':
            printint(*argp++, 10, 1);
80021a74:	e51b300c 	ldr	r3, [fp, #-12]
80021a78:	e5933000 	ldr	r3, [r3]
80021a7c:	e51b200c 	ldr	r2, [fp, #-12]
80021a80:	e2822004 	add	r2, r2, #4
80021a84:	e50b200c 	str	r2, [fp, #-12]
80021a88:	e1a00003 	mov	r0, r3
80021a8c:	e3a0100a 	mov	r1, #10
80021a90:	e3a02001 	mov	r2, #1
80021a94:	ebffff69 	bl	80021840 <printint>
            break;
80021a98:	ea000030 	b	80021b60 <cprintf+0x1d0>

        case 'x':
        case 'p':
            printint(*argp++, 16, 0);
80021a9c:	e51b300c 	ldr	r3, [fp, #-12]
80021aa0:	e5933000 	ldr	r3, [r3]
80021aa4:	e51b200c 	ldr	r2, [fp, #-12]
80021aa8:	e2822004 	add	r2, r2, #4
80021aac:	e50b200c 	str	r2, [fp, #-12]
80021ab0:	e1a00003 	mov	r0, r3
80021ab4:	e3a01010 	mov	r1, #16
80021ab8:	e3a02000 	mov	r2, #0
80021abc:	ebffff5f 	bl	80021840 <printint>
            break;
80021ac0:	ea000026 	b	80021b60 <cprintf+0x1d0>

        case 's':
            if ((s = (char*) *argp++) == 0) {
80021ac4:	e51b300c 	ldr	r3, [fp, #-12]
80021ac8:	e5933000 	ldr	r3, [r3]
80021acc:	e50b3010 	str	r3, [fp, #-16]
80021ad0:	e51b3010 	ldr	r3, [fp, #-16]
80021ad4:	e3530000 	cmp	r3, #0
80021ad8:	13a03000 	movne	r3, #0
80021adc:	03a03001 	moveq	r3, #1
80021ae0:	e6ef3073 	uxtb	r3, r3
80021ae4:	e51b200c 	ldr	r2, [fp, #-12]
80021ae8:	e2822004 	add	r2, r2, #4
80021aec:	e50b200c 	str	r2, [fp, #-12]
80021af0:	e3530000 	cmp	r3, #0
80021af4:	0a00000b 	beq	80021b28 <cprintf+0x198>
                s = "(null)";
80021af8:	e3093cb4 	movw	r3, #40116	; 0x9cb4
80021afc:	e3483002 	movt	r3, #32770	; 0x8002
80021b00:	e50b3010 	str	r3, [fp, #-16]
            }

            for (; *s; s++) {
80021b04:	ea000007 	b	80021b28 <cprintf+0x198>
                consputc(*s);
80021b08:	e51b3010 	ldr	r3, [fp, #-16]
80021b0c:	e5d33000 	ldrb	r3, [r3]
80021b10:	e1a00003 	mov	r0, r3
80021b14:	eb000040 	bl	80021c1c <consputc>
        case 's':
            if ((s = (char*) *argp++) == 0) {
                s = "(null)";
            }

            for (; *s; s++) {
80021b18:	e51b3010 	ldr	r3, [fp, #-16]
80021b1c:	e2833001 	add	r3, r3, #1
80021b20:	e50b3010 	str	r3, [fp, #-16]
80021b24:	ea000000 	b	80021b2c <cprintf+0x19c>
80021b28:	e1a00000 	nop			; (mov r0, r0)
80021b2c:	e51b3010 	ldr	r3, [fp, #-16]
80021b30:	e5d33000 	ldrb	r3, [r3]
80021b34:	e3530000 	cmp	r3, #0
80021b38:	1afffff2 	bne	80021b08 <cprintf+0x178>
                consputc(*s);
            }
            break;
80021b3c:	ea000007 	b	80021b60 <cprintf+0x1d0>

        case '%':
            consputc('%');
80021b40:	e3a00025 	mov	r0, #37	; 0x25
80021b44:	eb000034 	bl	80021c1c <consputc>
            break;
80021b48:	ea000004 	b	80021b60 <cprintf+0x1d0>

        default:
            // Print unknown % sequence to draw attention.
            consputc('%');
80021b4c:	e3a00025 	mov	r0, #37	; 0x25
80021b50:	eb000031 	bl	80021c1c <consputc>
            consputc(c);
80021b54:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80021b58:	eb00002f 	bl	80021c1c <consputc>
            break;
80021b5c:	e1a00000 	nop			; (mov r0, r0)
        panic("null fmt");
    }

    argp = (uint*) (void*) (&fmt + 1);

    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
80021b60:	e51b3008 	ldr	r3, [fp, #-8]
80021b64:	e2833001 	add	r3, r3, #1
80021b68:	e50b3008 	str	r3, [fp, #-8]
80021b6c:	e59b2004 	ldr	r2, [fp, #4]
80021b70:	e51b3008 	ldr	r3, [fp, #-8]
80021b74:	e0823003 	add	r3, r2, r3
80021b78:	e5d33000 	ldrb	r3, [r3]
80021b7c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
80021b80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021b84:	e3530000 	cmp	r3, #0
80021b88:	1affff99 	bne	800219f4 <cprintf+0x64>
80021b8c:	ea000000 	b	80021b94 <cprintf+0x204>
        }

        c = fmt[++i] & 0xff;

        if (c == 0) {
            break;
80021b90:	e1a00000 	nop			; (mov r0, r0)
            consputc(c);
            break;
        }
    }

    if (locking) {
80021b94:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80021b98:	e3530000 	cmp	r3, #0
80021b9c:	0a000002 	beq	80021bac <cprintf+0x21c>
        release(&cons.lock);
80021ba0:	e30c087c 	movw	r0, #51324	; 0xc87c
80021ba4:	e348000a 	movt	r0, #32778	; 0x800a
80021ba8:	eb001141 	bl	800260b4 <release>
    }
}
80021bac:	e24bd004 	sub	sp, fp, #4
80021bb0:	e8bd4800 	pop	{fp, lr}
80021bb4:	e28dd010 	add	sp, sp, #16
80021bb8:	e12fff1e 	bx	lr

80021bbc <panic>:

void panic (char *s)
{
80021bbc:	e92d4800 	push	{fp, lr}
80021bc0:	e28db004 	add	fp, sp, #4
80021bc4:	e24dd008 	sub	sp, sp, #8
80021bc8:	e50b0008 	str	r0, [fp, #-8]
    cli();
80021bcc:	ebfffa87 	bl	800205f0 <cli>

    cons.locking = 0;
80021bd0:	e30c387c 	movw	r3, #51324	; 0xc87c
80021bd4:	e348300a 	movt	r3, #32778	; 0x800a
80021bd8:	e3a02000 	mov	r2, #0
80021bdc:	e5832034 	str	r2, [r3, #52]	; 0x34

    cprintf("cpu%d: panic: ", cpu->id);
80021be0:	e30e351c 	movw	r3, #58652	; 0xe51c
80021be4:	e348300a 	movt	r3, #32778	; 0x800a
80021be8:	e5933000 	ldr	r3, [r3]
80021bec:	e5d33000 	ldrb	r3, [r3]
80021bf0:	e3090cbc 	movw	r0, #40124	; 0x9cbc
80021bf4:	e3480002 	movt	r0, #32770	; 0x8002
80021bf8:	e1a01003 	mov	r1, r3
80021bfc:	ebffff63 	bl	80021990 <cprintf>

    show_callstk(s);
80021c00:	e51b0008 	ldr	r0, [fp, #-8]
80021c04:	ebfffb2f 	bl	800208c8 <show_callstk>
    panicked = 1; // freeze other CPU
80021c08:	e30c3878 	movw	r3, #51320	; 0xc878
80021c0c:	e348300a 	movt	r3, #32778	; 0x800a
80021c10:	e3a02001 	mov	r2, #1
80021c14:	e5832000 	str	r2, [r3]

    while (1)
        ;
80021c18:	eafffffe 	b	80021c18 <panic+0x5c>

80021c1c <consputc>:
//PAGEBREAK: 50
#define BACKSPACE 0x100
#define CRTPORT 0x3d4

void consputc (int c)
{
80021c1c:	e92d4800 	push	{fp, lr}
80021c20:	e28db004 	add	fp, sp, #4
80021c24:	e24dd008 	sub	sp, sp, #8
80021c28:	e50b0008 	str	r0, [fp, #-8]
    if (panicked) {
80021c2c:	e30c3878 	movw	r3, #51320	; 0xc878
80021c30:	e348300a 	movt	r3, #32778	; 0x800a
80021c34:	e5933000 	ldr	r3, [r3]
80021c38:	e3530000 	cmp	r3, #0
80021c3c:	0a000001 	beq	80021c48 <consputc+0x2c>
        cli();
80021c40:	ebfffa6a 	bl	800205f0 <cli>
        while (1)
            ;
80021c44:	eafffffe 	b	80021c44 <consputc+0x28>
    }

    if (c == BACKSPACE) {
80021c48:	e51b3008 	ldr	r3, [fp, #-8]
80021c4c:	e3530c01 	cmp	r3, #256	; 0x100
80021c50:	1a000006 	bne	80021c70 <consputc+0x54>
        uartputc('\b');
80021c54:	e3a00008 	mov	r0, #8
80021c58:	eb001eec 	bl	80029810 <uartputc>
        uartputc(' ');
80021c5c:	e3a00020 	mov	r0, #32
80021c60:	eb001eea 	bl	80029810 <uartputc>
        uartputc('\b');
80021c64:	e3a00008 	mov	r0, #8
80021c68:	eb001ee8 	bl	80029810 <uartputc>
80021c6c:	ea000001 	b	80021c78 <consputc+0x5c>
    } else {
        uartputc(c);
80021c70:	e51b0008 	ldr	r0, [fp, #-8]
80021c74:	eb001ee5 	bl	80029810 <uartputc>
    }

    // cgaputc(c);
}
80021c78:	e24bd004 	sub	sp, fp, #4
80021c7c:	e8bd8800 	pop	{fp, pc}

80021c80 <consoleintr>:
    uint e;  // Edit index
} input;

#define C(x)  ((x)-'@')  // Control-x
void consoleintr (int (*getc) (void))
{
80021c80:	e92d4800 	push	{fp, lr}
80021c84:	e28db004 	add	fp, sp, #4
80021c88:	e24dd010 	sub	sp, sp, #16
80021c8c:	e50b0010 	str	r0, [fp, #-16]
    int c;

    acquire(&input.lock);
80021c90:	e30c08b4 	movw	r0, #51380	; 0xc8b4
80021c94:	e348000a 	movt	r0, #32778	; 0x800a
80021c98:	eb0010fb 	bl	8002608c <acquire>

    while ((c = getc()) >= 0) {
80021c9c:	ea000089 	b	80021ec8 <consoleintr+0x248>
        switch (c) {
80021ca0:	e51b3008 	ldr	r3, [fp, #-8]
80021ca4:	e3530010 	cmp	r3, #16
80021ca8:	0a000009 	beq	80021cd4 <consoleintr+0x54>
80021cac:	e3530010 	cmp	r3, #16
80021cb0:	ca000002 	bgt	80021cc0 <consoleintr+0x40>
80021cb4:	e3530008 	cmp	r3, #8
80021cb8:	0a00002a 	beq	80021d68 <consoleintr+0xe8>
80021cbc:	ea00003b 	b	80021db0 <consoleintr+0x130>
80021cc0:	e3530015 	cmp	r3, #21
80021cc4:	0a00000e 	beq	80021d04 <consoleintr+0x84>
80021cc8:	e353007f 	cmp	r3, #127	; 0x7f
80021ccc:	0a000025 	beq	80021d68 <consoleintr+0xe8>
80021cd0:	ea000036 	b	80021db0 <consoleintr+0x130>
        case C('P'):  // Process listing.
            procdump();
80021cd4:	eb001099 	bl	80025f40 <procdump>
            break;
80021cd8:	ea00007a 	b	80021ec8 <consoleintr+0x248>

        case C('U'):  // Kill line.
            while ((input.e != input.w) && (input.buf[(input.e - 1) % INPUT_BUF] != '\n')) {
                input.e--;
80021cdc:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021ce0:	e348300a 	movt	r3, #32778	; 0x800a
80021ce4:	e593323c 	ldr	r3, [r3, #572]	; 0x23c
80021ce8:	e2432001 	sub	r2, r3, #1
80021cec:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021cf0:	e348300a 	movt	r3, #32778	; 0x800a
80021cf4:	e583223c 	str	r2, [r3, #572]	; 0x23c
                consputc(BACKSPACE);
80021cf8:	e3a00c01 	mov	r0, #256	; 0x100
80021cfc:	ebffffc6 	bl	80021c1c <consputc>
80021d00:	ea000000 	b	80021d08 <consoleintr+0x88>
        case C('P'):  // Process listing.
            procdump();
            break;

        case C('U'):  // Kill line.
            while ((input.e != input.w) && (input.buf[(input.e - 1) % INPUT_BUF] != '\n')) {
80021d04:	e1a00000 	nop			; (mov r0, r0)
80021d08:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021d0c:	e348300a 	movt	r3, #32778	; 0x800a
80021d10:	e593223c 	ldr	r2, [r3, #572]	; 0x23c
80021d14:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021d18:	e348300a 	movt	r3, #32778	; 0x800a
80021d1c:	e5933238 	ldr	r3, [r3, #568]	; 0x238
80021d20:	e1520003 	cmp	r2, r3
80021d24:	0a000062 	beq	80021eb4 <consoleintr+0x234>
80021d28:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021d2c:	e348300a 	movt	r3, #32778	; 0x800a
80021d30:	e593323c 	ldr	r3, [r3, #572]	; 0x23c
80021d34:	e2433001 	sub	r3, r3, #1
80021d38:	e1a03b83 	lsl	r3, r3, #23
80021d3c:	e1a03ba3 	lsr	r3, r3, #23
80021d40:	e30c28b4 	movw	r2, #51380	; 0xc8b4
80021d44:	e348200a 	movt	r2, #32778	; 0x800a
80021d48:	e3a01030 	mov	r1, #48	; 0x30
80021d4c:	e0822003 	add	r2, r2, r3
80021d50:	e1a03001 	mov	r3, r1
80021d54:	e0823003 	add	r3, r2, r3
80021d58:	e5d33004 	ldrb	r3, [r3, #4]
80021d5c:	e353000a 	cmp	r3, #10
80021d60:	1affffdd 	bne	80021cdc <consoleintr+0x5c>
                input.e--;
                consputc(BACKSPACE);
            }

            break;
80021d64:	ea000052 	b	80021eb4 <consoleintr+0x234>

        case C('H'):
        case '\x7f':  // Backspace
            if (input.e != input.w) {
80021d68:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021d6c:	e348300a 	movt	r3, #32778	; 0x800a
80021d70:	e593223c 	ldr	r2, [r3, #572]	; 0x23c
80021d74:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021d78:	e348300a 	movt	r3, #32778	; 0x800a
80021d7c:	e5933238 	ldr	r3, [r3, #568]	; 0x238
80021d80:	e1520003 	cmp	r2, r3
80021d84:	0a00004c 	beq	80021ebc <consoleintr+0x23c>
                input.e--;
80021d88:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021d8c:	e348300a 	movt	r3, #32778	; 0x800a
80021d90:	e593323c 	ldr	r3, [r3, #572]	; 0x23c
80021d94:	e2432001 	sub	r2, r3, #1
80021d98:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021d9c:	e348300a 	movt	r3, #32778	; 0x800a
80021da0:	e583223c 	str	r2, [r3, #572]	; 0x23c
                consputc(BACKSPACE);
80021da4:	e3a00c01 	mov	r0, #256	; 0x100
80021da8:	ebffff9b 	bl	80021c1c <consputc>
            }

            break;
80021dac:	ea000042 	b	80021ebc <consoleintr+0x23c>

        default:
            if ((c != 0) && (input.e - input.r < INPUT_BUF)) {
80021db0:	e51b3008 	ldr	r3, [fp, #-8]
80021db4:	e3530000 	cmp	r3, #0
80021db8:	0a000041 	beq	80021ec4 <consoleintr+0x244>
80021dbc:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021dc0:	e348300a 	movt	r3, #32778	; 0x800a
80021dc4:	e593223c 	ldr	r2, [r3, #572]	; 0x23c
80021dc8:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021dcc:	e348300a 	movt	r3, #32778	; 0x800a
80021dd0:	e5933234 	ldr	r3, [r3, #564]	; 0x234
80021dd4:	e0632002 	rsb	r2, r3, r2
80021dd8:	e30031ff 	movw	r3, #511	; 0x1ff
80021ddc:	e1520003 	cmp	r2, r3
80021de0:	8a000037 	bhi	80021ec4 <consoleintr+0x244>
                c = (c == '\r') ? '\n' : c;
80021de4:	e51b3008 	ldr	r3, [fp, #-8]
80021de8:	e353000d 	cmp	r3, #13
80021dec:	0a000001 	beq	80021df8 <consoleintr+0x178>
80021df0:	e51b3008 	ldr	r3, [fp, #-8]
80021df4:	ea000000 	b	80021dfc <consoleintr+0x17c>
80021df8:	e3a0300a 	mov	r3, #10
80021dfc:	e50b3008 	str	r3, [fp, #-8]

                input.buf[input.e++ % INPUT_BUF] = c;
80021e00:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021e04:	e348300a 	movt	r3, #32778	; 0x800a
80021e08:	e593123c 	ldr	r1, [r3, #572]	; 0x23c
80021e0c:	e1a03b81 	lsl	r3, r1, #23
80021e10:	e1a03ba3 	lsr	r3, r3, #23
80021e14:	e51b2008 	ldr	r2, [fp, #-8]
80021e18:	e6ef0072 	uxtb	r0, r2
80021e1c:	e30c28b4 	movw	r2, #51380	; 0xc8b4
80021e20:	e348200a 	movt	r2, #32778	; 0x800a
80021e24:	e3a0c030 	mov	ip, #48	; 0x30
80021e28:	e0822003 	add	r2, r2, r3
80021e2c:	e1a0300c 	mov	r3, ip
80021e30:	e0823003 	add	r3, r2, r3
80021e34:	e1a02000 	mov	r2, r0
80021e38:	e5c32004 	strb	r2, [r3, #4]
80021e3c:	e2812001 	add	r2, r1, #1
80021e40:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021e44:	e348300a 	movt	r3, #32778	; 0x800a
80021e48:	e583223c 	str	r2, [r3, #572]	; 0x23c
                consputc(c);
80021e4c:	e51b0008 	ldr	r0, [fp, #-8]
80021e50:	ebffff71 	bl	80021c1c <consputc>

                if (c == '\n' || c == C('D') || input.e == input.r + INPUT_BUF) {
80021e54:	e51b3008 	ldr	r3, [fp, #-8]
80021e58:	e353000a 	cmp	r3, #10
80021e5c:	0a00000b 	beq	80021e90 <consoleintr+0x210>
80021e60:	e51b3008 	ldr	r3, [fp, #-8]
80021e64:	e3530004 	cmp	r3, #4
80021e68:	0a000008 	beq	80021e90 <consoleintr+0x210>
80021e6c:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021e70:	e348300a 	movt	r3, #32778	; 0x800a
80021e74:	e593223c 	ldr	r2, [r3, #572]	; 0x23c
80021e78:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021e7c:	e348300a 	movt	r3, #32778	; 0x800a
80021e80:	e5933234 	ldr	r3, [r3, #564]	; 0x234
80021e84:	e2833c02 	add	r3, r3, #512	; 0x200
80021e88:	e1520003 	cmp	r2, r3
80021e8c:	1a00000c 	bne	80021ec4 <consoleintr+0x244>
                    input.w = input.e;
80021e90:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021e94:	e348300a 	movt	r3, #32778	; 0x800a
80021e98:	e593223c 	ldr	r2, [r3, #572]	; 0x23c
80021e9c:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021ea0:	e348300a 	movt	r3, #32778	; 0x800a
80021ea4:	e5832238 	str	r2, [r3, #568]	; 0x238
                    wakeup(&input.r);
80021ea8:	e59f0044 	ldr	r0, [pc, #68]	; 80021ef4 <consoleintr+0x274>
80021eac:	eb000fe7 	bl	80025e50 <wakeup>
                }
            }

            break;
80021eb0:	ea000003 	b	80021ec4 <consoleintr+0x244>
            while ((input.e != input.w) && (input.buf[(input.e - 1) % INPUT_BUF] != '\n')) {
                input.e--;
                consputc(BACKSPACE);
            }

            break;
80021eb4:	e1a00000 	nop			; (mov r0, r0)
80021eb8:	ea000002 	b	80021ec8 <consoleintr+0x248>
            if (input.e != input.w) {
                input.e--;
                consputc(BACKSPACE);
            }

            break;
80021ebc:	e1a00000 	nop			; (mov r0, r0)
80021ec0:	ea000000 	b	80021ec8 <consoleintr+0x248>
                    input.w = input.e;
                    wakeup(&input.r);
                }
            }

            break;
80021ec4:	e1a00000 	nop			; (mov r0, r0)
{
    int c;

    acquire(&input.lock);

    while ((c = getc()) >= 0) {
80021ec8:	e51b3010 	ldr	r3, [fp, #-16]
80021ecc:	e12fff33 	blx	r3
80021ed0:	e50b0008 	str	r0, [fp, #-8]
80021ed4:	e51b3008 	ldr	r3, [fp, #-8]
80021ed8:	e3530000 	cmp	r3, #0
80021edc:	aaffff6f 	bge	80021ca0 <consoleintr+0x20>

            break;
        }
    }

    release(&input.lock);
80021ee0:	e30c08b4 	movw	r0, #51380	; 0xc8b4
80021ee4:	e348000a 	movt	r0, #32778	; 0x800a
80021ee8:	eb001071 	bl	800260b4 <release>
}
80021eec:	e24bd004 	sub	sp, fp, #4
80021ef0:	e8bd8800 	pop	{fp, pc}
80021ef4:	800acae8 	.word	0x800acae8

80021ef8 <consoleread>:

int consoleread (struct inode *ip, char *dst, int n)
{
80021ef8:	e92d4800 	push	{fp, lr}
80021efc:	e28db004 	add	fp, sp, #4
80021f00:	e24dd018 	sub	sp, sp, #24
80021f04:	e50b0010 	str	r0, [fp, #-16]
80021f08:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80021f0c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    uint target;
    int c;

    iunlock(ip);
80021f10:	e51b0010 	ldr	r0, [fp, #-16]
80021f14:	eb000570 	bl	800234dc <iunlock>

    target = n;
80021f18:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80021f1c:	e50b3008 	str	r3, [fp, #-8]
    acquire(&input.lock);
80021f20:	e30c08b4 	movw	r0, #51380	; 0xc8b4
80021f24:	e348000a 	movt	r0, #32778	; 0x800a
80021f28:	eb001057 	bl	8002608c <acquire>

    while (n > 0) {
80021f2c:	ea000047 	b	80022050 <consoleread+0x158>
        while (input.r == input.w) {
            if (proc->killed) {
80021f30:	e30e360c 	movw	r3, #58892	; 0xe60c
80021f34:	e348300a 	movt	r3, #32778	; 0x800a
80021f38:	e5933000 	ldr	r3, [r3]
80021f3c:	e5933028 	ldr	r3, [r3, #40]	; 0x28
80021f40:	e3530000 	cmp	r3, #0
80021f44:	0a000006 	beq	80021f64 <consoleread+0x6c>
                release(&input.lock);
80021f48:	e30c08b4 	movw	r0, #51380	; 0xc8b4
80021f4c:	e348000a 	movt	r0, #32778	; 0x800a
80021f50:	eb001057 	bl	800260b4 <release>
                ilock(ip);
80021f54:	e51b0010 	ldr	r0, [fp, #-16]
80021f58:	eb0004f8 	bl	80023340 <ilock>
                return -1;
80021f5c:	e3e03000 	mvn	r3, #0
80021f60:	ea000049 	b	8002208c <consoleread+0x194>
            }

            sleep(&input.r, &input.lock);
80021f64:	e59f012c 	ldr	r0, [pc, #300]	; 80022098 <consoleread+0x1a0>
80021f68:	e30c18b4 	movw	r1, #51380	; 0xc8b4
80021f6c:	e348100a 	movt	r1, #32778	; 0x800a
80021f70:	eb000f5e 	bl	80025cf0 <sleep>
80021f74:	ea000000 	b	80021f7c <consoleread+0x84>

    target = n;
    acquire(&input.lock);

    while (n > 0) {
        while (input.r == input.w) {
80021f78:	e1a00000 	nop			; (mov r0, r0)
80021f7c:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021f80:	e348300a 	movt	r3, #32778	; 0x800a
80021f84:	e5932234 	ldr	r2, [r3, #564]	; 0x234
80021f88:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021f8c:	e348300a 	movt	r3, #32778	; 0x800a
80021f90:	e5933238 	ldr	r3, [r3, #568]	; 0x238
80021f94:	e1520003 	cmp	r2, r3
80021f98:	0affffe4 	beq	80021f30 <consoleread+0x38>
            }

            sleep(&input.r, &input.lock);
        }

        c = input.buf[input.r++ % INPUT_BUF];
80021f9c:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021fa0:	e348300a 	movt	r3, #32778	; 0x800a
80021fa4:	e5931234 	ldr	r1, [r3, #564]	; 0x234
80021fa8:	e1a03b81 	lsl	r3, r1, #23
80021fac:	e1a03ba3 	lsr	r3, r3, #23
80021fb0:	e30c28b4 	movw	r2, #51380	; 0xc8b4
80021fb4:	e348200a 	movt	r2, #32778	; 0x800a
80021fb8:	e3a00030 	mov	r0, #48	; 0x30
80021fbc:	e0822003 	add	r2, r2, r3
80021fc0:	e1a03000 	mov	r3, r0
80021fc4:	e0823003 	add	r3, r2, r3
80021fc8:	e5d33004 	ldrb	r3, [r3, #4]
80021fcc:	e50b300c 	str	r3, [fp, #-12]
80021fd0:	e2812001 	add	r2, r1, #1
80021fd4:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80021fd8:	e348300a 	movt	r3, #32778	; 0x800a
80021fdc:	e5832234 	str	r2, [r3, #564]	; 0x234

        if (c == C('D')) {  // EOF
80021fe0:	e51b300c 	ldr	r3, [fp, #-12]
80021fe4:	e3530004 	cmp	r3, #4
80021fe8:	1a00000b 	bne	8002201c <consoleread+0x124>
            if (n < target) {
80021fec:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80021ff0:	e51b3008 	ldr	r3, [fp, #-8]
80021ff4:	e1520003 	cmp	r2, r3
80021ff8:	2a000018 	bcs	80022060 <consoleread+0x168>
                // Save ^D for next time, to make sure
                // caller gets a 0-byte result.
                input.r--;
80021ffc:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80022000:	e348300a 	movt	r3, #32778	; 0x800a
80022004:	e5933234 	ldr	r3, [r3, #564]	; 0x234
80022008:	e2432001 	sub	r2, r3, #1
8002200c:	e30c38b4 	movw	r3, #51380	; 0xc8b4
80022010:	e348300a 	movt	r3, #32778	; 0x800a
80022014:	e5832234 	str	r2, [r3, #564]	; 0x234
            }

            break;
80022018:	ea000010 	b	80022060 <consoleread+0x168>
        }

        *dst++ = c;
8002201c:	e51b300c 	ldr	r3, [fp, #-12]
80022020:	e6ef2073 	uxtb	r2, r3
80022024:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022028:	e5c32000 	strb	r2, [r3]
8002202c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022030:	e2833001 	add	r3, r3, #1
80022034:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        --n;
80022038:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002203c:	e2433001 	sub	r3, r3, #1
80022040:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

        if (c == '\n') {
80022044:	e51b300c 	ldr	r3, [fp, #-12]
80022048:	e353000a 	cmp	r3, #10
8002204c:	0a000005 	beq	80022068 <consoleread+0x170>
    iunlock(ip);

    target = n;
    acquire(&input.lock);

    while (n > 0) {
80022050:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022054:	e3530000 	cmp	r3, #0
80022058:	caffffc6 	bgt	80021f78 <consoleread+0x80>
8002205c:	ea000002 	b	8002206c <consoleread+0x174>
                // Save ^D for next time, to make sure
                // caller gets a 0-byte result.
                input.r--;
            }

            break;
80022060:	e1a00000 	nop			; (mov r0, r0)
80022064:	ea000000 	b	8002206c <consoleread+0x174>

        *dst++ = c;
        --n;

        if (c == '\n') {
            break;
80022068:	e1a00000 	nop			; (mov r0, r0)
        }
    }

    release(&input.lock);
8002206c:	e30c08b4 	movw	r0, #51380	; 0xc8b4
80022070:	e348000a 	movt	r0, #32778	; 0x800a
80022074:	eb00100e 	bl	800260b4 <release>
    ilock(ip);
80022078:	e51b0010 	ldr	r0, [fp, #-16]
8002207c:	eb0004af 	bl	80023340 <ilock>

    return target - n;
80022080:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022084:	e51b2008 	ldr	r2, [fp, #-8]
80022088:	e0633002 	rsb	r3, r3, r2
}
8002208c:	e1a00003 	mov	r0, r3
80022090:	e24bd004 	sub	sp, fp, #4
80022094:	e8bd8800 	pop	{fp, pc}
80022098:	800acae8 	.word	0x800acae8

8002209c <consolewrite>:

int consolewrite (struct inode *ip, char *buf, int n)
{
8002209c:	e92d4800 	push	{fp, lr}
800220a0:	e28db004 	add	fp, sp, #4
800220a4:	e24dd018 	sub	sp, sp, #24
800220a8:	e50b0010 	str	r0, [fp, #-16]
800220ac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
800220b0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    int i;

    iunlock(ip);
800220b4:	e51b0010 	ldr	r0, [fp, #-16]
800220b8:	eb000507 	bl	800234dc <iunlock>

    acquire(&cons.lock);
800220bc:	e30c087c 	movw	r0, #51324	; 0xc87c
800220c0:	e348000a 	movt	r0, #32778	; 0x800a
800220c4:	eb000ff0 	bl	8002608c <acquire>

    for (i = 0; i < n; i++) {
800220c8:	e3a03000 	mov	r3, #0
800220cc:	e50b3008 	str	r3, [fp, #-8]
800220d0:	ea000008 	b	800220f8 <consolewrite+0x5c>
        consputc(buf[i] & 0xff);
800220d4:	e51b3008 	ldr	r3, [fp, #-8]
800220d8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800220dc:	e0823003 	add	r3, r2, r3
800220e0:	e5d33000 	ldrb	r3, [r3]
800220e4:	e1a00003 	mov	r0, r3
800220e8:	ebfffecb 	bl	80021c1c <consputc>

    iunlock(ip);

    acquire(&cons.lock);

    for (i = 0; i < n; i++) {
800220ec:	e51b3008 	ldr	r3, [fp, #-8]
800220f0:	e2833001 	add	r3, r3, #1
800220f4:	e50b3008 	str	r3, [fp, #-8]
800220f8:	e51b2008 	ldr	r2, [fp, #-8]
800220fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022100:	e1520003 	cmp	r2, r3
80022104:	bafffff2 	blt	800220d4 <consolewrite+0x38>
        consputc(buf[i] & 0xff);
    }

    release(&cons.lock);
80022108:	e30c087c 	movw	r0, #51324	; 0xc87c
8002210c:	e348000a 	movt	r0, #32778	; 0x800a
80022110:	eb000fe7 	bl	800260b4 <release>

    ilock(ip);
80022114:	e51b0010 	ldr	r0, [fp, #-16]
80022118:	eb000488 	bl	80023340 <ilock>

    return n;
8002211c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
80022120:	e1a00003 	mov	r0, r3
80022124:	e24bd004 	sub	sp, fp, #4
80022128:	e8bd8800 	pop	{fp, pc}

8002212c <consoleinit>:

void consoleinit (void)
{
8002212c:	e92d4800 	push	{fp, lr}
80022130:	e28db004 	add	fp, sp, #4
    initlock(&cons.lock, "console");
80022134:	e30c087c 	movw	r0, #51324	; 0xc87c
80022138:	e348000a 	movt	r0, #32778	; 0x800a
8002213c:	e3091ccc 	movw	r1, #40140	; 0x9ccc
80022140:	e3481002 	movt	r1, #32770	; 0x8002
80022144:	eb000fbf 	bl	80026048 <initlock>
    initlock(&input.lock, "input");
80022148:	e30c08b4 	movw	r0, #51380	; 0xc8b4
8002214c:	e348000a 	movt	r0, #32778	; 0x800a
80022150:	e3091cd4 	movw	r1, #40148	; 0x9cd4
80022154:	e3481002 	movt	r1, #32770	; 0x8002
80022158:	eb000fba 	bl	80026048 <initlock>

    devsw[CONSOLE].write = consolewrite;
8002215c:	e30d3488 	movw	r3, #54408	; 0xd488
80022160:	e348300a 	movt	r3, #32778	; 0x800a
80022164:	e302209c 	movw	r2, #8348	; 0x209c
80022168:	e3482002 	movt	r2, #32770	; 0x8002
8002216c:	e583200c 	str	r2, [r3, #12]
    devsw[CONSOLE].read = consoleread;
80022170:	e30d3488 	movw	r3, #54408	; 0xd488
80022174:	e348300a 	movt	r3, #32778	; 0x800a
80022178:	e3012ef8 	movw	r2, #7928	; 0x1ef8
8002217c:	e3482002 	movt	r2, #32770	; 0x8002
80022180:	e5832008 	str	r2, [r3, #8]

    cons.locking = 1;
80022184:	e30c387c 	movw	r3, #51324	; 0xc87c
80022188:	e348300a 	movt	r3, #32778	; 0x800a
8002218c:	e3a02001 	mov	r2, #1
80022190:	e5832034 	str	r2, [r3, #52]	; 0x34
}
80022194:	e8bd8800 	pop	{fp, pc}

80022198 <exec>:
#include "elf.h"
#include "arm.h"

// load a user program for execution
int exec (char *path, char **argv)
{
80022198:	e92d4810 	push	{r4, fp, lr}
8002219c:	e28db008 	add	fp, sp, #8
800221a0:	e24ddf49 	sub	sp, sp, #292	; 0x124
800221a4:	e50b0120 	str	r0, [fp, #-288]	; 0xfffffee0
800221a8:	e50b1124 	str	r1, [fp, #-292]	; 0xfffffedc
    uint argc;
    uint sz;
    uint sp;
    uint ustack[3 + MAXARG + 1];

    if ((ip = namei(path)) == 0) {
800221ac:	e51b0120 	ldr	r0, [fp, #-288]	; 0xfffffee0
800221b0:	eb00085e 	bl	80024330 <namei>
800221b4:	e50b0010 	str	r0, [fp, #-16]
800221b8:	e51b3010 	ldr	r3, [fp, #-16]
800221bc:	e3530000 	cmp	r3, #0
800221c0:	1a000001 	bne	800221cc <exec+0x34>
        return -1;
800221c4:	e3e03000 	mvn	r3, #0
800221c8:	ea000133 	b	8002269c <exec+0x504>
    }

    ilock(ip);
800221cc:	e51b0010 	ldr	r0, [fp, #-16]
800221d0:	eb00045a 	bl	80023340 <ilock>

    // Check ELF header
    if (readi(ip, (char*) &elf, 0, sizeof(elf)) < sizeof(elf)) {
800221d4:	e51b0010 	ldr	r0, [fp, #-16]
800221d8:	e24b3068 	sub	r3, fp, #104	; 0x68
800221dc:	e1a01003 	mov	r1, r3
800221e0:	e3a02000 	mov	r2, #0
800221e4:	e3a03034 	mov	r3, #52	; 0x34
800221e8:	eb000614 	bl	80023a40 <readi>
800221ec:	e1a03000 	mov	r3, r0
800221f0:	e3530033 	cmp	r3, #51	; 0x33
800221f4:	9a000108 	bls	8002261c <exec+0x484>
        goto bad;
    }

    if (elf.magic != ELF_MAGIC) {
800221f8:	e51b2068 	ldr	r2, [fp, #-104]	; 0xffffff98
800221fc:	e304357f 	movw	r3, #17791	; 0x457f
80022200:	e344364c 	movt	r3, #17996	; 0x464c
80022204:	e1520003 	cmp	r2, r3
80022208:	1a000105 	bne	80022624 <exec+0x48c>
        goto bad;
    }

    pgdir = 0;
8002220c:	e3a03000 	mov	r3, #0
80022210:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    if ((pgdir = kpt_alloc()) == 0) {
80022214:	eb00178b 	bl	80028048 <kpt_alloc>
80022218:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
8002221c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022220:	e3530000 	cmp	r3, #0
80022224:	0a000100 	beq	8002262c <exec+0x494>
        goto bad;
    }

    // Load program into memory.
    sz = 0;
80022228:	e3a03000 	mov	r3, #0
8002222c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4

    for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
80022230:	e3a03000 	mov	r3, #0
80022234:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
80022238:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
8002223c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
80022240:	ea000030 	b	80022308 <exec+0x170>
        if (readi(ip, (char*) &ph, off, sizeof(ph)) != sizeof(ph)) {
80022244:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80022248:	e51b0010 	ldr	r0, [fp, #-16]
8002224c:	e24b2088 	sub	r2, fp, #136	; 0x88
80022250:	e1a01002 	mov	r1, r2
80022254:	e1a02003 	mov	r2, r3
80022258:	e3a03020 	mov	r3, #32
8002225c:	eb0005f7 	bl	80023a40 <readi>
80022260:	e1a03000 	mov	r3, r0
80022264:	e3530020 	cmp	r3, #32
80022268:	1a0000f1 	bne	80022634 <exec+0x49c>
            goto bad;
        }

        if (ph.type != ELF_PROG_LOAD) {
8002226c:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
80022270:	e3530001 	cmp	r3, #1
80022274:	1a00001c 	bne	800222ec <exec+0x154>
            continue;
        }

        if (ph.memsz < ph.filesz) {
80022278:	e51b2074 	ldr	r2, [fp, #-116]	; 0xffffff8c
8002227c:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
80022280:	e1520003 	cmp	r2, r3
80022284:	3a0000ec 	bcc	8002263c <exec+0x4a4>
            goto bad;
        }

        if ((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0) {
80022288:	e51b2080 	ldr	r2, [fp, #-128]	; 0xffffff80
8002228c:	e51b3074 	ldr	r3, [fp, #-116]	; 0xffffff8c
80022290:	e0823003 	add	r3, r2, r3
80022294:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80022298:	e51b102c 	ldr	r1, [fp, #-44]	; 0xffffffd4
8002229c:	e1a02003 	mov	r2, r3
800222a0:	eb0018a0 	bl	80028528 <allocuvm>
800222a4:	e1a03000 	mov	r3, r0
800222a8:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
800222ac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
800222b0:	e3530000 	cmp	r3, #0
800222b4:	0a0000e2 	beq	80022644 <exec+0x4ac>
            goto bad;
        }

        if (loaduvm(pgdir, (char*) ph.vaddr, ip, ph.off, ph.filesz) < 0) {
800222b8:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
800222bc:	e1a02003 	mov	r2, r3
800222c0:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
800222c4:	e51b1078 	ldr	r1, [fp, #-120]	; 0xffffff88
800222c8:	e58d1000 	str	r1, [sp]
800222cc:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800222d0:	e1a01002 	mov	r1, r2
800222d4:	e51b2010 	ldr	r2, [fp, #-16]
800222d8:	eb001843 	bl	800283ec <loaduvm>
800222dc:	e1a03000 	mov	r3, r0
800222e0:	e3530000 	cmp	r3, #0
800222e4:	ba0000d8 	blt	8002264c <exec+0x4b4>
800222e8:	ea000000 	b	800222f0 <exec+0x158>
        if (readi(ip, (char*) &ph, off, sizeof(ph)) != sizeof(ph)) {
            goto bad;
        }

        if (ph.type != ELF_PROG_LOAD) {
            continue;
800222ec:	e1a00000 	nop			; (mov r0, r0)
    }

    // Load program into memory.
    sz = 0;

    for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
800222f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800222f4:	e2833001 	add	r3, r3, #1
800222f8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
800222fc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80022300:	e2833020 	add	r3, r3, #32
80022304:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
80022308:	e15b33bc 	ldrh	r3, [fp, #-60]	; 0xffffffc4
8002230c:	e1a02003 	mov	r2, r3
80022310:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022314:	e1520003 	cmp	r2, r3
80022318:	caffffc9 	bgt	80022244 <exec+0xac>
        if (loaduvm(pgdir, (char*) ph.vaddr, ip, ph.off, ph.filesz) < 0) {
            goto bad;
        }
    }

    iunlockput(ip);
8002231c:	e51b0010 	ldr	r0, [fp, #-16]
80022320:	eb0004cd 	bl	8002365c <iunlockput>
    ip = 0;
80022324:	e3a03000 	mov	r3, #0
80022328:	e50b3010 	str	r3, [fp, #-16]

    // Allocate two pages at the next page boundary.
    // Make the first inaccessible.  Use the second as the user stack.
    sz = align_up (sz, PTE_SZ);
8002232c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80022330:	e2833eff 	add	r3, r3, #4080	; 0xff0
80022334:	e283300f 	add	r3, r3, #15
80022338:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
8002233c:	e3c3300f 	bic	r3, r3, #15
80022340:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4

    if ((sz = allocuvm(pgdir, sz, sz + 2 * PTE_SZ)) == 0) {
80022344:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80022348:	e2833a02 	add	r3, r3, #8192	; 0x2000
8002234c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80022350:	e51b102c 	ldr	r1, [fp, #-44]	; 0xffffffd4
80022354:	e1a02003 	mov	r2, r3
80022358:	eb001872 	bl	80028528 <allocuvm>
8002235c:	e1a03000 	mov	r3, r0
80022360:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
80022364:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80022368:	e3530000 	cmp	r3, #0
8002236c:	0a0000b8 	beq	80022654 <exec+0x4bc>
        goto bad;
    }

    clearpteu(pgdir, (char*) (sz - 2 * PTE_SZ));
80022370:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80022374:	e2433a02 	sub	r3, r3, #8192	; 0x2000
80022378:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
8002237c:	e1a01003 	mov	r1, r3
80022380:	eb00191c 	bl	800287f8 <clearpteu>

    sp = sz;
80022384:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80022388:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0

    // Push argument strings, prepare rest of stack in ustack.
    for (argc = 0; argv[argc]; argc++) {
8002238c:	e3a03000 	mov	r3, #0
80022390:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
80022394:	ea000031 	b	80022460 <exec+0x2c8>
        if (argc >= MAXARG) {
80022398:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
8002239c:	e353001f 	cmp	r3, #31
800223a0:	8a0000ad 	bhi	8002265c <exec+0x4c4>
            goto bad;
        }

        sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
800223a4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
800223a8:	e1a03103 	lsl	r3, r3, #2
800223ac:	e51b2124 	ldr	r2, [fp, #-292]	; 0xfffffedc
800223b0:	e0823003 	add	r3, r2, r3
800223b4:	e5933000 	ldr	r3, [r3]
800223b8:	e1a00003 	mov	r0, r3
800223bc:	ebfff876 	bl	8002059c <strlen>
800223c0:	e1a03000 	mov	r3, r0
800223c4:	e1e03003 	mvn	r3, r3
800223c8:	e1a02003 	mov	r2, r3
800223cc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
800223d0:	e0823003 	add	r3, r2, r3
800223d4:	e3c33003 	bic	r3, r3, #3
800223d8:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0

        if (copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0) {
800223dc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
800223e0:	e1a03103 	lsl	r3, r3, #2
800223e4:	e51b2124 	ldr	r2, [fp, #-292]	; 0xfffffedc
800223e8:	e0823003 	add	r3, r2, r3
800223ec:	e5934000 	ldr	r4, [r3]
800223f0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
800223f4:	e1a03103 	lsl	r3, r3, #2
800223f8:	e51b2124 	ldr	r2, [fp, #-292]	; 0xfffffedc
800223fc:	e0823003 	add	r3, r2, r3
80022400:	e5933000 	ldr	r3, [r3]
80022404:	e1a00003 	mov	r0, r3
80022408:	ebfff863 	bl	8002059c <strlen>
8002240c:	e1a03000 	mov	r3, r0
80022410:	e2833001 	add	r3, r3, #1
80022414:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80022418:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
8002241c:	e1a02004 	mov	r2, r4
80022420:	eb001987 	bl	80028a44 <copyout>
80022424:	e1a03000 	mov	r3, r0
80022428:	e3530000 	cmp	r3, #0
8002242c:	ba00008c 	blt	80022664 <exec+0x4cc>
            goto bad;
        }

        ustack[argc] = sp;
80022430:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80022434:	e30f3ef4 	movw	r3, #65268	; 0xfef4
80022438:	e34f3fff 	movt	r3, #65535	; 0xffff
8002243c:	e1a02102 	lsl	r2, r2, #2
80022440:	e24b100c 	sub	r1, fp, #12
80022444:	e0812002 	add	r2, r1, r2
80022448:	e0823003 	add	r3, r2, r3
8002244c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
80022450:	e5832000 	str	r2, [r3]
    clearpteu(pgdir, (char*) (sz - 2 * PTE_SZ));

    sp = sz;

    // Push argument strings, prepare rest of stack in ustack.
    for (argc = 0; argv[argc]; argc++) {
80022454:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80022458:	e2833001 	add	r3, r3, #1
8002245c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
80022460:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80022464:	e1a03103 	lsl	r3, r3, #2
80022468:	e51b2124 	ldr	r2, [fp, #-292]	; 0xfffffedc
8002246c:	e0823003 	add	r3, r2, r3
80022470:	e5933000 	ldr	r3, [r3]
80022474:	e3530000 	cmp	r3, #0
80022478:	1affffc6 	bne	80022398 <exec+0x200>
        }

        ustack[argc] = sp;
    }

    ustack[argc] = 0;
8002247c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80022480:	e30f3ef4 	movw	r3, #65268	; 0xfef4
80022484:	e34f3fff 	movt	r3, #65535	; 0xffff
80022488:	e1a02102 	lsl	r2, r2, #2
8002248c:	e24b100c 	sub	r1, fp, #12
80022490:	e0812002 	add	r2, r1, r2
80022494:	e0823003 	add	r3, r2, r3
80022498:	e3a02000 	mov	r2, #0
8002249c:	e5832000 	str	r2, [r3]

    // in ARM, parameters are passed in r0 and r1
    proc->tf->r0 = argc;
800224a0:	e30e360c 	movw	r3, #58892	; 0xe60c
800224a4:	e348300a 	movt	r3, #32778	; 0x800a
800224a8:	e5933000 	ldr	r3, [r3]
800224ac:	e593301c 	ldr	r3, [r3, #28]
800224b0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
800224b4:	e5832010 	str	r2, [r3, #16]
    proc->tf->r1 = sp - (argc + 1) * 4;
800224b8:	e30e360c 	movw	r3, #58892	; 0xe60c
800224bc:	e348300a 	movt	r3, #32778	; 0x800a
800224c0:	e5933000 	ldr	r3, [r3]
800224c4:	e593301c 	ldr	r3, [r3, #28]
800224c8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
800224cc:	e2822001 	add	r2, r2, #1
800224d0:	e1a02102 	lsl	r2, r2, #2
800224d4:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
800224d8:	e0622001 	rsb	r2, r2, r1
800224dc:	e5832014 	str	r2, [r3, #20]

    sp -= (argc + 1) * 4;
800224e0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
800224e4:	e2833001 	add	r3, r3, #1
800224e8:	e1a03103 	lsl	r3, r3, #2
800224ec:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
800224f0:	e0633002 	rsb	r3, r3, r2
800224f4:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0

    if (copyout(pgdir, sp, ustack, (argc + 1) * 4) < 0) {
800224f8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
800224fc:	e2833001 	add	r3, r3, #1
80022500:	e1a03103 	lsl	r3, r3, #2
80022504:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80022508:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
8002250c:	e24b2f46 	sub	r2, fp, #280	; 0x118
80022510:	eb00194b 	bl	80028a44 <copyout>
80022514:	e1a03000 	mov	r3, r0
80022518:	e3530000 	cmp	r3, #0
8002251c:	ba000052 	blt	8002266c <exec+0x4d4>
        goto bad;
    }

    // Save program name for debugging.
    for (last = s = path; *s; s++) {
80022520:	e51b3120 	ldr	r3, [fp, #-288]	; 0xfffffee0
80022524:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
80022528:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002252c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
80022530:	ea000009 	b	8002255c <exec+0x3c4>
        if (*s == '/') {
80022534:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022538:	e5d33000 	ldrb	r3, [r3]
8002253c:	e353002f 	cmp	r3, #47	; 0x2f
80022540:	1a000002 	bne	80022550 <exec+0x3b8>
            last = s + 1;
80022544:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022548:	e2833001 	add	r3, r3, #1
8002254c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    if (copyout(pgdir, sp, ustack, (argc + 1) * 4) < 0) {
        goto bad;
    }

    // Save program name for debugging.
    for (last = s = path; *s; s++) {
80022550:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022554:	e2833001 	add	r3, r3, #1
80022558:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
8002255c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022560:	e5d33000 	ldrb	r3, [r3]
80022564:	e3530000 	cmp	r3, #0
80022568:	1afffff1 	bne	80022534 <exec+0x39c>
        if (*s == '/') {
            last = s + 1;
        }
    }

    safestrcpy(proc->name, last, sizeof(proc->name));
8002256c:	e30e360c 	movw	r3, #58892	; 0xe60c
80022570:	e348300a 	movt	r3, #32778	; 0x800a
80022574:	e5933000 	ldr	r3, [r3]
80022578:	e2833070 	add	r3, r3, #112	; 0x70
8002257c:	e1a00003 	mov	r0, r3
80022580:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
80022584:	e3a02010 	mov	r2, #16
80022588:	ebfff7d6 	bl	800204e8 <safestrcpy>

    // Commit to the user image.
    oldpgdir = proc->pgdir;
8002258c:	e30e360c 	movw	r3, #58892	; 0xe60c
80022590:	e348300a 	movt	r3, #32778	; 0x800a
80022594:	e5933000 	ldr	r3, [r3]
80022598:	e5933004 	ldr	r3, [r3, #4]
8002259c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    proc->pgdir = pgdir;
800225a0:	e30e360c 	movw	r3, #58892	; 0xe60c
800225a4:	e348300a 	movt	r3, #32778	; 0x800a
800225a8:	e5933000 	ldr	r3, [r3]
800225ac:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800225b0:	e5832004 	str	r2, [r3, #4]
    proc->sz = sz;
800225b4:	e30e360c 	movw	r3, #58892	; 0xe60c
800225b8:	e348300a 	movt	r3, #32778	; 0x800a
800225bc:	e5933000 	ldr	r3, [r3]
800225c0:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
800225c4:	e5832000 	str	r2, [r3]
    proc->tf->pc = elf.entry;
800225c8:	e30e360c 	movw	r3, #58892	; 0xe60c
800225cc:	e348300a 	movt	r3, #32778	; 0x800a
800225d0:	e5933000 	ldr	r3, [r3]
800225d4:	e593301c 	ldr	r3, [r3, #28]
800225d8:	e51b2050 	ldr	r2, [fp, #-80]	; 0xffffffb0
800225dc:	e5832044 	str	r2, [r3, #68]	; 0x44
    proc->tf->sp_usr = sp;
800225e0:	e30e360c 	movw	r3, #58892	; 0xe60c
800225e4:	e348300a 	movt	r3, #32778	; 0x800a
800225e8:	e5933000 	ldr	r3, [r3]
800225ec:	e593301c 	ldr	r3, [r3, #28]
800225f0:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
800225f4:	e5832000 	str	r2, [r3]

    switchuvm(proc);
800225f8:	e30e360c 	movw	r3, #58892	; 0xe60c
800225fc:	e348300a 	movt	r3, #32778	; 0x800a
80022600:	e5933000 	ldr	r3, [r3]
80022604:	e1a00003 	mov	r0, r3
80022608:	eb001738 	bl	800282f0 <switchuvm>
    freevm(oldpgdir);
8002260c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
80022610:	eb001849 	bl	8002873c <freevm>
    return 0;
80022614:	e3a03000 	mov	r3, #0
80022618:	ea00001f 	b	8002269c <exec+0x504>

    ilock(ip);

    // Check ELF header
    if (readi(ip, (char*) &elf, 0, sizeof(elf)) < sizeof(elf)) {
        goto bad;
8002261c:	e1a00000 	nop			; (mov r0, r0)
80022620:	ea000012 	b	80022670 <exec+0x4d8>
    }

    if (elf.magic != ELF_MAGIC) {
        goto bad;
80022624:	e1a00000 	nop			; (mov r0, r0)
80022628:	ea000010 	b	80022670 <exec+0x4d8>
    }

    pgdir = 0;

    if ((pgdir = kpt_alloc()) == 0) {
        goto bad;
8002262c:	e1a00000 	nop			; (mov r0, r0)
80022630:	ea00000e 	b	80022670 <exec+0x4d8>
    // Load program into memory.
    sz = 0;

    for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
        if (readi(ip, (char*) &ph, off, sizeof(ph)) != sizeof(ph)) {
            goto bad;
80022634:	e1a00000 	nop			; (mov r0, r0)
80022638:	ea00000c 	b	80022670 <exec+0x4d8>
        if (ph.type != ELF_PROG_LOAD) {
            continue;
        }

        if (ph.memsz < ph.filesz) {
            goto bad;
8002263c:	e1a00000 	nop			; (mov r0, r0)
80022640:	ea00000a 	b	80022670 <exec+0x4d8>
        }

        if ((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0) {
            goto bad;
80022644:	e1a00000 	nop			; (mov r0, r0)
80022648:	ea000008 	b	80022670 <exec+0x4d8>
        }

        if (loaduvm(pgdir, (char*) ph.vaddr, ip, ph.off, ph.filesz) < 0) {
            goto bad;
8002264c:	e1a00000 	nop			; (mov r0, r0)
80022650:	ea000006 	b	80022670 <exec+0x4d8>
    // Allocate two pages at the next page boundary.
    // Make the first inaccessible.  Use the second as the user stack.
    sz = align_up (sz, PTE_SZ);

    if ((sz = allocuvm(pgdir, sz, sz + 2 * PTE_SZ)) == 0) {
        goto bad;
80022654:	e1a00000 	nop			; (mov r0, r0)
80022658:	ea000004 	b	80022670 <exec+0x4d8>
    sp = sz;

    // Push argument strings, prepare rest of stack in ustack.
    for (argc = 0; argv[argc]; argc++) {
        if (argc >= MAXARG) {
            goto bad;
8002265c:	e1a00000 	nop			; (mov r0, r0)
80022660:	ea000002 	b	80022670 <exec+0x4d8>
        }

        sp = (sp - (strlen(argv[argc]) + 1)) & ~3;

        if (copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0) {
            goto bad;
80022664:	e1a00000 	nop			; (mov r0, r0)
80022668:	ea000000 	b	80022670 <exec+0x4d8>
    proc->tf->r1 = sp - (argc + 1) * 4;

    sp -= (argc + 1) * 4;

    if (copyout(pgdir, sp, ustack, (argc + 1) * 4) < 0) {
        goto bad;
8002266c:	e1a00000 	nop			; (mov r0, r0)

    switchuvm(proc);
    freevm(oldpgdir);
    return 0;

    bad: if (pgdir) {
80022670:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022674:	e3530000 	cmp	r3, #0
80022678:	0a000001 	beq	80022684 <exec+0x4ec>
        freevm(pgdir);
8002267c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80022680:	eb00182d 	bl	8002873c <freevm>
    }

    if (ip) {
80022684:	e51b3010 	ldr	r3, [fp, #-16]
80022688:	e3530000 	cmp	r3, #0
8002268c:	0a000001 	beq	80022698 <exec+0x500>
        iunlockput(ip);
80022690:	e51b0010 	ldr	r0, [fp, #-16]
80022694:	eb0003f0 	bl	8002365c <iunlockput>
    }
    return -1;
80022698:	e3e03000 	mvn	r3, #0
}
8002269c:	e1a00003 	mov	r0, r3
800226a0:	e24bd008 	sub	sp, fp, #8
800226a4:	e8bd8810 	pop	{r4, fp, pc}

800226a8 <fileinit>:
    struct spinlock lock;
    struct file file[NFILE];
} ftable;

void fileinit (void)
{
800226a8:	e92d4800 	push	{fp, lr}
800226ac:	e28db004 	add	fp, sp, #4
    initlock(&ftable.lock, "ftable");
800226b0:	e30c0af4 	movw	r0, #51956	; 0xcaf4
800226b4:	e348000a 	movt	r0, #32778	; 0x800a
800226b8:	e3091cdc 	movw	r1, #40156	; 0x9cdc
800226bc:	e3481002 	movt	r1, #32770	; 0x8002
800226c0:	eb000e60 	bl	80026048 <initlock>
}
800226c4:	e8bd8800 	pop	{fp, pc}

800226c8 <filealloc>:

// Allocate a file structure.
struct file* filealloc (void)
{
800226c8:	e92d4800 	push	{fp, lr}
800226cc:	e28db004 	add	fp, sp, #4
800226d0:	e24dd008 	sub	sp, sp, #8
    struct file *f;

    acquire(&ftable.lock);
800226d4:	e30c0af4 	movw	r0, #51956	; 0xcaf4
800226d8:	e348000a 	movt	r0, #32778	; 0x800a
800226dc:	eb000e6a 	bl	8002608c <acquire>

    for (f = ftable.file; f < ftable.file + NFILE; f++) {
800226e0:	e59f306c 	ldr	r3, [pc, #108]	; 80022754 <filealloc+0x8c>
800226e4:	e50b3008 	str	r3, [fp, #-8]
800226e8:	ea00000e 	b	80022728 <filealloc+0x60>
        if (f->ref == 0) {
800226ec:	e51b3008 	ldr	r3, [fp, #-8]
800226f0:	e5933004 	ldr	r3, [r3, #4]
800226f4:	e3530000 	cmp	r3, #0
800226f8:	1a000007 	bne	8002271c <filealloc+0x54>
            f->ref = 1;
800226fc:	e51b3008 	ldr	r3, [fp, #-8]
80022700:	e3a02001 	mov	r2, #1
80022704:	e5832004 	str	r2, [r3, #4]
            release(&ftable.lock);
80022708:	e30c0af4 	movw	r0, #51956	; 0xcaf4
8002270c:	e348000a 	movt	r0, #32778	; 0x800a
80022710:	eb000e67 	bl	800260b4 <release>
            return f;
80022714:	e51b3008 	ldr	r3, [fp, #-8]
80022718:	ea00000a 	b	80022748 <filealloc+0x80>
{
    struct file *f;

    acquire(&ftable.lock);

    for (f = ftable.file; f < ftable.file + NFILE; f++) {
8002271c:	e51b3008 	ldr	r3, [fp, #-8]
80022720:	e2833018 	add	r3, r3, #24
80022724:	e50b3008 	str	r3, [fp, #-8]
80022728:	e51b2008 	ldr	r2, [fp, #-8]
8002272c:	e59f3024 	ldr	r3, [pc, #36]	; 80022758 <filealloc+0x90>
80022730:	e1520003 	cmp	r2, r3
80022734:	3affffec 	bcc	800226ec <filealloc+0x24>
            release(&ftable.lock);
            return f;
        }
    }

    release(&ftable.lock);
80022738:	e30c0af4 	movw	r0, #51956	; 0xcaf4
8002273c:	e348000a 	movt	r0, #32778	; 0x800a
80022740:	eb000e5b 	bl	800260b4 <release>
    return 0;
80022744:	e3a03000 	mov	r3, #0
}
80022748:	e1a00003 	mov	r0, r3
8002274c:	e24bd004 	sub	sp, fp, #4
80022750:	e8bd8800 	pop	{fp, pc}
80022754:	800acb28 	.word	0x800acb28
80022758:	800ad488 	.word	0x800ad488

8002275c <filedup>:

// Increment ref count for file f.
struct file* filedup (struct file *f)
{
8002275c:	e92d4800 	push	{fp, lr}
80022760:	e28db004 	add	fp, sp, #4
80022764:	e24dd008 	sub	sp, sp, #8
80022768:	e50b0008 	str	r0, [fp, #-8]
    acquire(&ftable.lock);
8002276c:	e30c0af4 	movw	r0, #51956	; 0xcaf4
80022770:	e348000a 	movt	r0, #32778	; 0x800a
80022774:	eb000e44 	bl	8002608c <acquire>

    if (f->ref < 1) {
80022778:	e51b3008 	ldr	r3, [fp, #-8]
8002277c:	e5933004 	ldr	r3, [r3, #4]
80022780:	e3530000 	cmp	r3, #0
80022784:	ca000002 	bgt	80022794 <filedup+0x38>
        panic("filedup");
80022788:	e3090ce4 	movw	r0, #40164	; 0x9ce4
8002278c:	e3480002 	movt	r0, #32770	; 0x8002
80022790:	ebfffd09 	bl	80021bbc <panic>
    }

    f->ref++;
80022794:	e51b3008 	ldr	r3, [fp, #-8]
80022798:	e5933004 	ldr	r3, [r3, #4]
8002279c:	e2832001 	add	r2, r3, #1
800227a0:	e51b3008 	ldr	r3, [fp, #-8]
800227a4:	e5832004 	str	r2, [r3, #4]
    release(&ftable.lock);
800227a8:	e30c0af4 	movw	r0, #51956	; 0xcaf4
800227ac:	e348000a 	movt	r0, #32778	; 0x800a
800227b0:	eb000e3f 	bl	800260b4 <release>
    return f;
800227b4:	e51b3008 	ldr	r3, [fp, #-8]
}
800227b8:	e1a00003 	mov	r0, r3
800227bc:	e24bd004 	sub	sp, fp, #4
800227c0:	e8bd8800 	pop	{fp, pc}

800227c4 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void fileclose (struct file *f)
{
800227c4:	e92d4800 	push	{fp, lr}
800227c8:	e28db004 	add	fp, sp, #4
800227cc:	e24dd020 	sub	sp, sp, #32
800227d0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    struct file ff;

    acquire(&ftable.lock);
800227d4:	e30c0af4 	movw	r0, #51956	; 0xcaf4
800227d8:	e348000a 	movt	r0, #32778	; 0x800a
800227dc:	eb000e2a 	bl	8002608c <acquire>

    if (f->ref < 1) {
800227e0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800227e4:	e5933004 	ldr	r3, [r3, #4]
800227e8:	e3530000 	cmp	r3, #0
800227ec:	ca000002 	bgt	800227fc <fileclose+0x38>
        panic("fileclose");
800227f0:	e3090cec 	movw	r0, #40172	; 0x9cec
800227f4:	e3480002 	movt	r0, #32770	; 0x8002
800227f8:	ebfffcef 	bl	80021bbc <panic>
    }

    if (--f->ref > 0) {
800227fc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022800:	e5933004 	ldr	r3, [r3, #4]
80022804:	e2432001 	sub	r2, r3, #1
80022808:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002280c:	e5832004 	str	r2, [r3, #4]
80022810:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022814:	e5933004 	ldr	r3, [r3, #4]
80022818:	e3530000 	cmp	r3, #0
8002281c:	da000003 	ble	80022830 <fileclose+0x6c>
        release(&ftable.lock);
80022820:	e30c0af4 	movw	r0, #51956	; 0xcaf4
80022824:	e348000a 	movt	r0, #32778	; 0x800a
80022828:	eb000e21 	bl	800260b4 <release>
        return;
8002282c:	ea000020 	b	800228b4 <fileclose+0xf0>
    }

    ff = *f;
80022830:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022834:	e24bc01c 	sub	ip, fp, #28
80022838:	e1a0e003 	mov	lr, r3
8002283c:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
80022840:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
80022844:	e89e0003 	ldm	lr, {r0, r1}
80022848:	e88c0003 	stm	ip, {r0, r1}
    f->ref = 0;
8002284c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022850:	e3a02000 	mov	r2, #0
80022854:	e5832004 	str	r2, [r3, #4]
    f->type = FD_NONE;
80022858:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002285c:	e3a02000 	mov	r2, #0
80022860:	e5c32000 	strb	r2, [r3]
    release(&ftable.lock);
80022864:	e30c0af4 	movw	r0, #51956	; 0xcaf4
80022868:	e348000a 	movt	r0, #32778	; 0x800a
8002286c:	eb000e10 	bl	800260b4 <release>

    if (ff.type == FD_PIPE) {
80022870:	e55b301c 	ldrb	r3, [fp, #-28]	; 0xffffffe4
80022874:	e3530001 	cmp	r3, #1
80022878:	1a000005 	bne	80022894 <fileclose+0xd0>
        pipeclose(ff.pipe, ff.writable);
8002287c:	e51b2010 	ldr	r2, [fp, #-16]
80022880:	e55b3013 	ldrb	r3, [fp, #-19]	; 0xffffffed
80022884:	e1a00002 	mov	r0, r2
80022888:	e1a01003 	mov	r1, r3
8002288c:	eb000950 	bl	80024dd4 <pipeclose>
80022890:	ea000007 	b	800228b4 <fileclose+0xf0>

    } else if (ff.type == FD_INODE) {
80022894:	e55b301c 	ldrb	r3, [fp, #-28]	; 0xffffffe4
80022898:	e3530002 	cmp	r3, #2
8002289c:	1a000004 	bne	800228b4 <fileclose+0xf0>
        begin_trans();
800228a0:	eb000796 	bl	80024700 <begin_trans>
        iput(ff.ip);
800228a4:	e51b300c 	ldr	r3, [fp, #-12]
800228a8:	e1a00003 	mov	r0, r3
800228ac:	eb00032c 	bl	80023564 <iput>
        commit_trans();
800228b0:	eb0007aa 	bl	80024760 <commit_trans>
    }
}
800228b4:	e24bd004 	sub	sp, fp, #4
800228b8:	e8bd8800 	pop	{fp, pc}

800228bc <filestat>:

// Get metadata about file f.
int filestat (struct file *f, struct stat *st)
{
800228bc:	e92d4800 	push	{fp, lr}
800228c0:	e28db004 	add	fp, sp, #4
800228c4:	e24dd008 	sub	sp, sp, #8
800228c8:	e50b0008 	str	r0, [fp, #-8]
800228cc:	e50b100c 	str	r1, [fp, #-12]
    if (f->type == FD_INODE) {
800228d0:	e51b3008 	ldr	r3, [fp, #-8]
800228d4:	e5d33000 	ldrb	r3, [r3]
800228d8:	e3530002 	cmp	r3, #2
800228dc:	1a00000e 	bne	8002291c <filestat+0x60>
        ilock(f->ip);
800228e0:	e51b3008 	ldr	r3, [fp, #-8]
800228e4:	e5933010 	ldr	r3, [r3, #16]
800228e8:	e1a00003 	mov	r0, r3
800228ec:	eb000293 	bl	80023340 <ilock>
        stati(f->ip, st);
800228f0:	e51b3008 	ldr	r3, [fp, #-8]
800228f4:	e5933010 	ldr	r3, [r3, #16]
800228f8:	e1a00003 	mov	r0, r3
800228fc:	e51b100c 	ldr	r1, [fp, #-12]
80022900:	eb000431 	bl	800239cc <stati>
        iunlock(f->ip);
80022904:	e51b3008 	ldr	r3, [fp, #-8]
80022908:	e5933010 	ldr	r3, [r3, #16]
8002290c:	e1a00003 	mov	r0, r3
80022910:	eb0002f1 	bl	800234dc <iunlock>

        return 0;
80022914:	e3a03000 	mov	r3, #0
80022918:	ea000000 	b	80022920 <filestat+0x64>
    }

    return -1;
8002291c:	e3e03000 	mvn	r3, #0
}
80022920:	e1a00003 	mov	r0, r3
80022924:	e24bd004 	sub	sp, fp, #4
80022928:	e8bd8800 	pop	{fp, pc}

8002292c <fileread>:

// Read from file f.
int fileread (struct file *f, char *addr, int n)
{
8002292c:	e92d4800 	push	{fp, lr}
80022930:	e28db004 	add	fp, sp, #4
80022934:	e24dd018 	sub	sp, sp, #24
80022938:	e50b0010 	str	r0, [fp, #-16]
8002293c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80022940:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    int r;

    if (f->readable == 0) {
80022944:	e51b3010 	ldr	r3, [fp, #-16]
80022948:	e5d33008 	ldrb	r3, [r3, #8]
8002294c:	e3530000 	cmp	r3, #0
80022950:	1a000001 	bne	8002295c <fileread+0x30>
        return -1;
80022954:	e3e03000 	mvn	r3, #0
80022958:	ea00002e 	b	80022a18 <fileread+0xec>
    }

    if (f->type == FD_PIPE) {
8002295c:	e51b3010 	ldr	r3, [fp, #-16]
80022960:	e5d33000 	ldrb	r3, [r3]
80022964:	e3530001 	cmp	r3, #1
80022968:	1a000007 	bne	8002298c <fileread+0x60>
        return piperead(f->pipe, addr, n);
8002296c:	e51b3010 	ldr	r3, [fp, #-16]
80022970:	e593300c 	ldr	r3, [r3, #12]
80022974:	e1a00003 	mov	r0, r3
80022978:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
8002297c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80022980:	eb00098f 	bl	80024fc4 <piperead>
80022984:	e1a03000 	mov	r3, r0
80022988:	ea000022 	b	80022a18 <fileread+0xec>
    }

    if (f->type == FD_INODE) {
8002298c:	e51b3010 	ldr	r3, [fp, #-16]
80022990:	e5d33000 	ldrb	r3, [r3]
80022994:	e3530002 	cmp	r3, #2
80022998:	1a00001b 	bne	80022a0c <fileread+0xe0>
        ilock(f->ip);
8002299c:	e51b3010 	ldr	r3, [fp, #-16]
800229a0:	e5933010 	ldr	r3, [r3, #16]
800229a4:	e1a00003 	mov	r0, r3
800229a8:	eb000264 	bl	80023340 <ilock>

        if ((r = readi(f->ip, addr, f->off, n)) > 0) {
800229ac:	e51b3010 	ldr	r3, [fp, #-16]
800229b0:	e5931010 	ldr	r1, [r3, #16]
800229b4:	e51b3010 	ldr	r3, [fp, #-16]
800229b8:	e5932014 	ldr	r2, [r3, #20]
800229bc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800229c0:	e1a00001 	mov	r0, r1
800229c4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
800229c8:	eb00041c 	bl	80023a40 <readi>
800229cc:	e50b0008 	str	r0, [fp, #-8]
800229d0:	e51b3008 	ldr	r3, [fp, #-8]
800229d4:	e3530000 	cmp	r3, #0
800229d8:	da000005 	ble	800229f4 <fileread+0xc8>
            f->off += r;
800229dc:	e51b3010 	ldr	r3, [fp, #-16]
800229e0:	e5932014 	ldr	r2, [r3, #20]
800229e4:	e51b3008 	ldr	r3, [fp, #-8]
800229e8:	e0822003 	add	r2, r2, r3
800229ec:	e51b3010 	ldr	r3, [fp, #-16]
800229f0:	e5832014 	str	r2, [r3, #20]
        }

        iunlock(f->ip);
800229f4:	e51b3010 	ldr	r3, [fp, #-16]
800229f8:	e5933010 	ldr	r3, [r3, #16]
800229fc:	e1a00003 	mov	r0, r3
80022a00:	eb0002b5 	bl	800234dc <iunlock>

        return r;
80022a04:	e51b3008 	ldr	r3, [fp, #-8]
80022a08:	ea000002 	b	80022a18 <fileread+0xec>
    }

    panic("fileread");
80022a0c:	e3090cf8 	movw	r0, #40184	; 0x9cf8
80022a10:	e3480002 	movt	r0, #32770	; 0x8002
80022a14:	ebfffc68 	bl	80021bbc <panic>
}
80022a18:	e1a00003 	mov	r0, r3
80022a1c:	e24bd004 	sub	sp, fp, #4
80022a20:	e8bd8800 	pop	{fp, pc}

80022a24 <filewrite>:

//PAGEBREAK!
// Write to file f.
int filewrite (struct file *f, char *addr, int n)
{
80022a24:	e92d4800 	push	{fp, lr}
80022a28:	e28db004 	add	fp, sp, #4
80022a2c:	e24dd020 	sub	sp, sp, #32
80022a30:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
80022a34:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
80022a38:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    int r;
    int i;
    int max;
    int n1;

    if (f->writable == 0) {
80022a3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022a40:	e5d33009 	ldrb	r3, [r3, #9]
80022a44:	e3530000 	cmp	r3, #0
80022a48:	1a000001 	bne	80022a54 <filewrite+0x30>
        return -1;
80022a4c:	e3e03000 	mvn	r3, #0
80022a50:	ea00005a 	b	80022bc0 <filewrite+0x19c>
    }

    if (f->type == FD_PIPE) {
80022a54:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022a58:	e5d33000 	ldrb	r3, [r3]
80022a5c:	e3530001 	cmp	r3, #1
80022a60:	1a000007 	bne	80022a84 <filewrite+0x60>
        return pipewrite(f->pipe, addr, n);
80022a64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022a68:	e593300c 	ldr	r3, [r3, #12]
80022a6c:	e1a00003 	mov	r0, r3
80022a70:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
80022a74:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80022a78:	eb000906 	bl	80024e98 <pipewrite>
80022a7c:	e1a03000 	mov	r3, r0
80022a80:	ea00004e 	b	80022bc0 <filewrite+0x19c>
    }

    if (f->type == FD_INODE) {
80022a84:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022a88:	e5d33000 	ldrb	r3, [r3]
80022a8c:	e3530002 	cmp	r3, #2
80022a90:	1a000047 	bne	80022bb4 <filewrite+0x190>
        // the maximum log transaction size, including
        // i-node, indirect block, allocation blocks,
        // and 2 blocks of slop for non-aligned writes.
        // this really belongs lower down, since writei()
        // might be writing a device like the console.
        max = ((LOGSIZE - 1 - 1 - 2) / 2) * 512;
80022a94:	e3a03c06 	mov	r3, #1536	; 0x600
80022a98:	e50b3010 	str	r3, [fp, #-16]
        i = 0;
80022a9c:	e3a03000 	mov	r3, #0
80022aa0:	e50b3008 	str	r3, [fp, #-8]

        while (i < n) {
80022aa4:	ea000034 	b	80022b7c <filewrite+0x158>
            n1 = n - i;
80022aa8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80022aac:	e51b3008 	ldr	r3, [fp, #-8]
80022ab0:	e0633002 	rsb	r3, r3, r2
80022ab4:	e50b300c 	str	r3, [fp, #-12]

            if (n1 > max) {
80022ab8:	e51b200c 	ldr	r2, [fp, #-12]
80022abc:	e51b3010 	ldr	r3, [fp, #-16]
80022ac0:	e1520003 	cmp	r2, r3
80022ac4:	da000001 	ble	80022ad0 <filewrite+0xac>
                n1 = max;
80022ac8:	e51b3010 	ldr	r3, [fp, #-16]
80022acc:	e50b300c 	str	r3, [fp, #-12]
            }

            begin_trans();
80022ad0:	eb00070a 	bl	80024700 <begin_trans>
            ilock(f->ip);
80022ad4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022ad8:	e5933010 	ldr	r3, [r3, #16]
80022adc:	e1a00003 	mov	r0, r3
80022ae0:	eb000216 	bl	80023340 <ilock>

            if ((r = writei(f->ip, addr + i, f->off, n1)) > 0) {
80022ae4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022ae8:	e5930010 	ldr	r0, [r3, #16]
80022aec:	e51b3008 	ldr	r3, [fp, #-8]
80022af0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
80022af4:	e0821003 	add	r1, r2, r3
80022af8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022afc:	e5932014 	ldr	r2, [r3, #20]
80022b00:	e51b300c 	ldr	r3, [fp, #-12]
80022b04:	eb00044b 	bl	80023c38 <writei>
80022b08:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
80022b0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022b10:	e3530000 	cmp	r3, #0
80022b14:	da000005 	ble	80022b30 <filewrite+0x10c>
                f->off += r;
80022b18:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022b1c:	e5932014 	ldr	r2, [r3, #20]
80022b20:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022b24:	e0822003 	add	r2, r2, r3
80022b28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022b2c:	e5832014 	str	r2, [r3, #20]
            }

            iunlock(f->ip);
80022b30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022b34:	e5933010 	ldr	r3, [r3, #16]
80022b38:	e1a00003 	mov	r0, r3
80022b3c:	eb000266 	bl	800234dc <iunlock>
            commit_trans();
80022b40:	eb000706 	bl	80024760 <commit_trans>

            if (r < 0) {
80022b44:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022b48:	e3530000 	cmp	r3, #0
80022b4c:	ba00000f 	blt	80022b90 <filewrite+0x16c>
                break;
            }

            if (r != n1) {
80022b50:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80022b54:	e51b300c 	ldr	r3, [fp, #-12]
80022b58:	e1520003 	cmp	r2, r3
80022b5c:	0a000002 	beq	80022b6c <filewrite+0x148>
                panic("short filewrite");
80022b60:	e3090d04 	movw	r0, #40196	; 0x9d04
80022b64:	e3480002 	movt	r0, #32770	; 0x8002
80022b68:	ebfffc13 	bl	80021bbc <panic>
            }

            i += r;
80022b6c:	e51b2008 	ldr	r2, [fp, #-8]
80022b70:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022b74:	e0823003 	add	r3, r2, r3
80022b78:	e50b3008 	str	r3, [fp, #-8]
        // this really belongs lower down, since writei()
        // might be writing a device like the console.
        max = ((LOGSIZE - 1 - 1 - 2) / 2) * 512;
        i = 0;

        while (i < n) {
80022b7c:	e51b2008 	ldr	r2, [fp, #-8]
80022b80:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022b84:	e1520003 	cmp	r2, r3
80022b88:	baffffc6 	blt	80022aa8 <filewrite+0x84>
80022b8c:	ea000000 	b	80022b94 <filewrite+0x170>

            iunlock(f->ip);
            commit_trans();

            if (r < 0) {
                break;
80022b90:	e1a00000 	nop			; (mov r0, r0)
            }

            i += r;
        }

        return i == n ? n : -1;
80022b94:	e51b2008 	ldr	r2, [fp, #-8]
80022b98:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022b9c:	e1520003 	cmp	r2, r3
80022ba0:	1a000001 	bne	80022bac <filewrite+0x188>
80022ba4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80022ba8:	ea000000 	b	80022bb0 <filewrite+0x18c>
80022bac:	e3e03000 	mvn	r3, #0
80022bb0:	ea000002 	b	80022bc0 <filewrite+0x19c>
    }

    panic("filewrite");
80022bb4:	e3090d14 	movw	r0, #40212	; 0x9d14
80022bb8:	e3480002 	movt	r0, #32770	; 0x8002
80022bbc:	ebfffbfe 	bl	80021bbc <panic>
}
80022bc0:	e1a00003 	mov	r0, r3
80022bc4:	e24bd004 	sub	sp, fp, #4
80022bc8:	e8bd8800 	pop	{fp, pc}

80022bcc <readsb>:
#define min(a, b) ((a) < (b) ? (a) : (b))
static void itrunc (struct inode*);

// Read the super block.
void readsb (int dev, struct superblock *sb)
{
80022bcc:	e92d4800 	push	{fp, lr}
80022bd0:	e28db004 	add	fp, sp, #4
80022bd4:	e24dd010 	sub	sp, sp, #16
80022bd8:	e50b0010 	str	r0, [fp, #-16]
80022bdc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct buf *bp;

    bp = bread(dev, 1);
80022be0:	e51b3010 	ldr	r3, [fp, #-16]
80022be4:	e1a00003 	mov	r0, r3
80022be8:	e3a01001 	mov	r1, #1
80022bec:	ebfff7fe 	bl	80020bec <bread>
80022bf0:	e50b0008 	str	r0, [fp, #-8]
    memmove(sb, bp->data, sizeof(*sb));
80022bf4:	e51b3008 	ldr	r3, [fp, #-8]
80022bf8:	e2833018 	add	r3, r3, #24
80022bfc:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80022c00:	e1a01003 	mov	r1, r3
80022c04:	e3a02010 	mov	r2, #16
80022c08:	ebfff572 	bl	800201d8 <memmove>
    brelse(bp);
80022c0c:	e51b0008 	ldr	r0, [fp, #-8]
80022c10:	ebfff81e 	bl	80020c90 <brelse>
}
80022c14:	e24bd004 	sub	sp, fp, #4
80022c18:	e8bd8800 	pop	{fp, pc}

80022c1c <bzero>:

// Zero a block.
static void bzero (int dev, int bno)
{
80022c1c:	e92d4800 	push	{fp, lr}
80022c20:	e28db004 	add	fp, sp, #4
80022c24:	e24dd010 	sub	sp, sp, #16
80022c28:	e50b0010 	str	r0, [fp, #-16]
80022c2c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct buf *bp;

    bp = bread(dev, bno);
80022c30:	e51b2010 	ldr	r2, [fp, #-16]
80022c34:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022c38:	e1a00002 	mov	r0, r2
80022c3c:	e1a01003 	mov	r1, r3
80022c40:	ebfff7e9 	bl	80020bec <bread>
80022c44:	e50b0008 	str	r0, [fp, #-8]
    memset(bp->data, 0, BSIZE);
80022c48:	e51b3008 	ldr	r3, [fp, #-8]
80022c4c:	e2833018 	add	r3, r3, #24
80022c50:	e1a00003 	mov	r0, r3
80022c54:	e3a01000 	mov	r1, #0
80022c58:	e3a02c02 	mov	r2, #512	; 0x200
80022c5c:	ebfff4e7 	bl	80020000 <memset>
    log_write(bp);
80022c60:	e51b0008 	ldr	r0, [fp, #-8]
80022c64:	eb0006d9 	bl	800247d0 <log_write>
    brelse(bp);
80022c68:	e51b0008 	ldr	r0, [fp, #-8]
80022c6c:	ebfff807 	bl	80020c90 <brelse>
}
80022c70:	e24bd004 	sub	sp, fp, #4
80022c74:	e8bd8800 	pop	{fp, pc}

80022c78 <balloc>:

// Blocks.

// Allocate a zeroed disk block.
static uint balloc (uint dev)
{
80022c78:	e92d4800 	push	{fp, lr}
80022c7c:	e28db004 	add	fp, sp, #4
80022c80:	e24dd028 	sub	sp, sp, #40	; 0x28
80022c84:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    int b, bi, m;
    struct buf *bp;
    struct superblock sb;

    bp = 0;
80022c88:	e3a03000 	mov	r3, #0
80022c8c:	e50b3010 	str	r3, [fp, #-16]
    readsb(dev, &sb);
80022c90:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80022c94:	e1a00003 	mov	r0, r3
80022c98:	e24b3024 	sub	r3, fp, #36	; 0x24
80022c9c:	e1a01003 	mov	r1, r3
80022ca0:	ebffffc9 	bl	80022bcc <readsb>

    for (b = 0; b < sb.size; b += BPB) {
80022ca4:	e3a03000 	mov	r3, #0
80022ca8:	e50b3008 	str	r3, [fp, #-8]
80022cac:	ea000065 	b	80022e48 <balloc+0x1d0>
        bp = bread(dev, BBLOCK(b, sb.ninodes));
80022cb0:	e51b3008 	ldr	r3, [fp, #-8]
80022cb4:	e2832eff 	add	r2, r3, #4080	; 0xff0
80022cb8:	e282200f 	add	r2, r2, #15
80022cbc:	e3530000 	cmp	r3, #0
80022cc0:	b1a03002 	movlt	r3, r2
80022cc4:	e1a03643 	asr	r3, r3, #12
80022cc8:	e1a02003 	mov	r2, r3
80022ccc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80022cd0:	e1a031a3 	lsr	r3, r3, #3
80022cd4:	e0823003 	add	r3, r2, r3
80022cd8:	e2833003 	add	r3, r3, #3
80022cdc:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
80022ce0:	e1a01003 	mov	r1, r3
80022ce4:	ebfff7c0 	bl	80020bec <bread>
80022ce8:	e50b0010 	str	r0, [fp, #-16]

        for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
80022cec:	e3a03000 	mov	r3, #0
80022cf0:	e50b300c 	str	r3, [fp, #-12]
80022cf4:	ea000043 	b	80022e08 <balloc+0x190>
            m = 1 << (bi % 8);
80022cf8:	e51b200c 	ldr	r2, [fp, #-12]
80022cfc:	e1a03fc2 	asr	r3, r2, #31
80022d00:	e1a03ea3 	lsr	r3, r3, #29
80022d04:	e0822003 	add	r2, r2, r3
80022d08:	e2022007 	and	r2, r2, #7
80022d0c:	e0633002 	rsb	r3, r3, r2
80022d10:	e3a02001 	mov	r2, #1
80022d14:	e1a03312 	lsl	r3, r2, r3
80022d18:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

            if ((bp->data[bi / 8] & m) == 0) {  // Is block free?
80022d1c:	e51b300c 	ldr	r3, [fp, #-12]
80022d20:	e2832007 	add	r2, r3, #7
80022d24:	e3530000 	cmp	r3, #0
80022d28:	b1a03002 	movlt	r3, r2
80022d2c:	e1a031c3 	asr	r3, r3, #3
80022d30:	e51b2010 	ldr	r2, [fp, #-16]
80022d34:	e3a01018 	mov	r1, #24
80022d38:	e0822003 	add	r2, r2, r3
80022d3c:	e1a03001 	mov	r3, r1
80022d40:	e0823003 	add	r3, r2, r3
80022d44:	e5d33000 	ldrb	r3, [r3]
80022d48:	e1a02003 	mov	r2, r3
80022d4c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80022d50:	e0023003 	and	r3, r2, r3
80022d54:	e3530000 	cmp	r3, #0
80022d58:	1a000027 	bne	80022dfc <balloc+0x184>
                bp->data[bi / 8] |= m;  // Mark block in use.
80022d5c:	e51b300c 	ldr	r3, [fp, #-12]
80022d60:	e2832007 	add	r2, r3, #7
80022d64:	e3530000 	cmp	r3, #0
80022d68:	b1a03002 	movlt	r3, r2
80022d6c:	e1a031c3 	asr	r3, r3, #3
80022d70:	e51b2010 	ldr	r2, [fp, #-16]
80022d74:	e3a00018 	mov	r0, #24
80022d78:	e0821003 	add	r1, r2, r3
80022d7c:	e1a02000 	mov	r2, r0
80022d80:	e0812002 	add	r2, r1, r2
80022d84:	e5d22000 	ldrb	r2, [r2]
80022d88:	e6ef1072 	uxtb	r1, r2
80022d8c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80022d90:	e6ef2072 	uxtb	r2, r2
80022d94:	e1812002 	orr	r2, r1, r2
80022d98:	e6ef2072 	uxtb	r2, r2
80022d9c:	e6ef2072 	uxtb	r2, r2
80022da0:	e51b1010 	ldr	r1, [fp, #-16]
80022da4:	e3a00018 	mov	r0, #24
80022da8:	e0811003 	add	r1, r1, r3
80022dac:	e1a03000 	mov	r3, r0
80022db0:	e0813003 	add	r3, r1, r3
80022db4:	e5c32000 	strb	r2, [r3]
                log_write(bp);
80022db8:	e51b0010 	ldr	r0, [fp, #-16]
80022dbc:	eb000683 	bl	800247d0 <log_write>
                brelse(bp);
80022dc0:	e51b0010 	ldr	r0, [fp, #-16]
80022dc4:	ebfff7b1 	bl	80020c90 <brelse>
                bzero(dev, b + bi);
80022dc8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80022dcc:	e51b1008 	ldr	r1, [fp, #-8]
80022dd0:	e51b300c 	ldr	r3, [fp, #-12]
80022dd4:	e0813003 	add	r3, r1, r3
80022dd8:	e1a00002 	mov	r0, r2
80022ddc:	e1a01003 	mov	r1, r3
80022de0:	ebffff8d 	bl	80022c1c <bzero>
                return b + bi;
80022de4:	e51b2008 	ldr	r2, [fp, #-8]
80022de8:	e51b300c 	ldr	r3, [fp, #-12]
80022dec:	e0823003 	add	r3, r2, r3

        brelse(bp);
    }

    panic("balloc: out of blocks");
}
80022df0:	e1a00003 	mov	r0, r3
80022df4:	e24bd004 	sub	sp, fp, #4
80022df8:	e8bd8800 	pop	{fp, pc}
    readsb(dev, &sb);

    for (b = 0; b < sb.size; b += BPB) {
        bp = bread(dev, BBLOCK(b, sb.ninodes));

        for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
80022dfc:	e51b300c 	ldr	r3, [fp, #-12]
80022e00:	e2833001 	add	r3, r3, #1
80022e04:	e50b300c 	str	r3, [fp, #-12]
80022e08:	e51b200c 	ldr	r2, [fp, #-12]
80022e0c:	e3003fff 	movw	r3, #4095	; 0xfff
80022e10:	e1520003 	cmp	r2, r3
80022e14:	ca000006 	bgt	80022e34 <balloc+0x1bc>
80022e18:	e51b2008 	ldr	r2, [fp, #-8]
80022e1c:	e51b300c 	ldr	r3, [fp, #-12]
80022e20:	e0823003 	add	r3, r2, r3
80022e24:	e1a02003 	mov	r2, r3
80022e28:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80022e2c:	e1520003 	cmp	r2, r3
80022e30:	3affffb0 	bcc	80022cf8 <balloc+0x80>
                bzero(dev, b + bi);
                return b + bi;
            }
        }

        brelse(bp);
80022e34:	e51b0010 	ldr	r0, [fp, #-16]
80022e38:	ebfff794 	bl	80020c90 <brelse>
    struct superblock sb;

    bp = 0;
    readsb(dev, &sb);

    for (b = 0; b < sb.size; b += BPB) {
80022e3c:	e51b3008 	ldr	r3, [fp, #-8]
80022e40:	e2833a01 	add	r3, r3, #4096	; 0x1000
80022e44:	e50b3008 	str	r3, [fp, #-8]
80022e48:	e51b2008 	ldr	r2, [fp, #-8]
80022e4c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80022e50:	e1520003 	cmp	r2, r3
80022e54:	3affff95 	bcc	80022cb0 <balloc+0x38>
        }

        brelse(bp);
    }

    panic("balloc: out of blocks");
80022e58:	e3090d20 	movw	r0, #40224	; 0x9d20
80022e5c:	e3480002 	movt	r0, #32770	; 0x8002
80022e60:	ebfffb55 	bl	80021bbc <panic>

80022e64 <bfree>:
}

// Free a disk block.
static void bfree (int dev, uint b)
{
80022e64:	e92d4800 	push	{fp, lr}
80022e68:	e28db004 	add	fp, sp, #4
80022e6c:	e24dd028 	sub	sp, sp, #40	; 0x28
80022e70:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
80022e74:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    struct buf *bp;
    struct superblock sb;
    int bi, m;

    readsb(dev, &sb);
80022e78:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
80022e7c:	e24b3020 	sub	r3, fp, #32
80022e80:	e1a01003 	mov	r1, r3
80022e84:	ebffff50 	bl	80022bcc <readsb>
    bp = bread(dev, BBLOCK(b, sb.ninodes));
80022e88:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80022e8c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80022e90:	e1a01623 	lsr	r1, r3, #12
80022e94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80022e98:	e1a031a3 	lsr	r3, r3, #3
80022e9c:	e0813003 	add	r3, r1, r3
80022ea0:	e2833003 	add	r3, r3, #3
80022ea4:	e1a00002 	mov	r0, r2
80022ea8:	e1a01003 	mov	r1, r3
80022eac:	ebfff74e 	bl	80020bec <bread>
80022eb0:	e50b0008 	str	r0, [fp, #-8]
    bi = b % BPB;
80022eb4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80022eb8:	e1a03a03 	lsl	r3, r3, #20
80022ebc:	e1a03a23 	lsr	r3, r3, #20
80022ec0:	e50b300c 	str	r3, [fp, #-12]
    m = 1 << (bi % 8);
80022ec4:	e51b200c 	ldr	r2, [fp, #-12]
80022ec8:	e1a03fc2 	asr	r3, r2, #31
80022ecc:	e1a03ea3 	lsr	r3, r3, #29
80022ed0:	e0822003 	add	r2, r2, r3
80022ed4:	e2022007 	and	r2, r2, #7
80022ed8:	e0633002 	rsb	r3, r3, r2
80022edc:	e3a02001 	mov	r2, #1
80022ee0:	e1a03312 	lsl	r3, r2, r3
80022ee4:	e50b3010 	str	r3, [fp, #-16]

    if ((bp->data[bi / 8] & m) == 0) {
80022ee8:	e51b300c 	ldr	r3, [fp, #-12]
80022eec:	e2832007 	add	r2, r3, #7
80022ef0:	e3530000 	cmp	r3, #0
80022ef4:	b1a03002 	movlt	r3, r2
80022ef8:	e1a031c3 	asr	r3, r3, #3
80022efc:	e51b2008 	ldr	r2, [fp, #-8]
80022f00:	e3a01018 	mov	r1, #24
80022f04:	e0822003 	add	r2, r2, r3
80022f08:	e1a03001 	mov	r3, r1
80022f0c:	e0823003 	add	r3, r2, r3
80022f10:	e5d33000 	ldrb	r3, [r3]
80022f14:	e1a02003 	mov	r2, r3
80022f18:	e51b3010 	ldr	r3, [fp, #-16]
80022f1c:	e0023003 	and	r3, r2, r3
80022f20:	e3530000 	cmp	r3, #0
80022f24:	1a000002 	bne	80022f34 <bfree+0xd0>
        panic("freeing free block");
80022f28:	e3090d38 	movw	r0, #40248	; 0x9d38
80022f2c:	e3480002 	movt	r0, #32770	; 0x8002
80022f30:	ebfffb21 	bl	80021bbc <panic>
    }

    bp->data[bi / 8] &= ~m;
80022f34:	e51b300c 	ldr	r3, [fp, #-12]
80022f38:	e2832007 	add	r2, r3, #7
80022f3c:	e3530000 	cmp	r3, #0
80022f40:	b1a03002 	movlt	r3, r2
80022f44:	e1a031c3 	asr	r3, r3, #3
80022f48:	e51b2008 	ldr	r2, [fp, #-8]
80022f4c:	e3a00018 	mov	r0, #24
80022f50:	e0821003 	add	r1, r2, r3
80022f54:	e1a02000 	mov	r2, r0
80022f58:	e0812002 	add	r2, r1, r2
80022f5c:	e5d22000 	ldrb	r2, [r2]
80022f60:	e6ef1072 	uxtb	r1, r2
80022f64:	e51b2010 	ldr	r2, [fp, #-16]
80022f68:	e6ef2072 	uxtb	r2, r2
80022f6c:	e1e02002 	mvn	r2, r2
80022f70:	e6ef2072 	uxtb	r2, r2
80022f74:	e0012002 	and	r2, r1, r2
80022f78:	e6ef2072 	uxtb	r2, r2
80022f7c:	e6ef2072 	uxtb	r2, r2
80022f80:	e51b1008 	ldr	r1, [fp, #-8]
80022f84:	e3a00018 	mov	r0, #24
80022f88:	e0811003 	add	r1, r1, r3
80022f8c:	e1a03000 	mov	r3, r0
80022f90:	e0813003 	add	r3, r1, r3
80022f94:	e5c32000 	strb	r2, [r3]
    log_write(bp);
80022f98:	e51b0008 	ldr	r0, [fp, #-8]
80022f9c:	eb00060b 	bl	800247d0 <log_write>
    brelse(bp);
80022fa0:	e51b0008 	ldr	r0, [fp, #-8]
80022fa4:	ebfff739 	bl	80020c90 <brelse>
}
80022fa8:	e24bd004 	sub	sp, fp, #4
80022fac:	e8bd8800 	pop	{fp, pc}

80022fb0 <iinit>:
    struct spinlock lock;
    struct inode inode[NINODE];
} icache;

void iinit (void)
{
80022fb0:	e92d4800 	push	{fp, lr}
80022fb4:	e28db004 	add	fp, sp, #4
    initlock(&icache.lock, "icache");
80022fb8:	e30d04d8 	movw	r0, #54488	; 0xd4d8
80022fbc:	e348000a 	movt	r0, #32778	; 0x800a
80022fc0:	e3091d4c 	movw	r1, #40268	; 0x9d4c
80022fc4:	e3481002 	movt	r1, #32770	; 0x8002
80022fc8:	eb000c1e 	bl	80026048 <initlock>
}
80022fcc:	e8bd8800 	pop	{fp, pc}

80022fd0 <ialloc>:

//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode* ialloc (uint dev, short type)
{
80022fd0:	e92d4800 	push	{fp, lr}
80022fd4:	e28db004 	add	fp, sp, #4
80022fd8:	e24dd028 	sub	sp, sp, #40	; 0x28
80022fdc:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
80022fe0:	e1a03001 	mov	r3, r1
80022fe4:	e14b32ba 	strh	r3, [fp, #-42]	; 0xffffffd6
    int inum;
    struct buf *bp;
    struct dinode *dip;
    struct superblock sb;

    readsb(dev, &sb);
80022fe8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80022fec:	e1a00003 	mov	r0, r3
80022ff0:	e24b3020 	sub	r3, fp, #32
80022ff4:	e1a01003 	mov	r1, r3
80022ff8:	ebfffef3 	bl	80022bcc <readsb>

    for (inum = 1; inum < sb.ninodes; inum++) {
80022ffc:	e3a03001 	mov	r3, #1
80023000:	e50b3008 	str	r3, [fp, #-8]
80023004:	ea000029 	b	800230b0 <ialloc+0xe0>
        bp = bread(dev, IBLOCK(inum));
80023008:	e51b3008 	ldr	r3, [fp, #-8]
8002300c:	e1a031a3 	lsr	r3, r3, #3
80023010:	e2833002 	add	r3, r3, #2
80023014:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
80023018:	e1a01003 	mov	r1, r3
8002301c:	ebfff6f2 	bl	80020bec <bread>
80023020:	e50b000c 	str	r0, [fp, #-12]
        dip = (struct dinode*) bp->data + inum % IPB;
80023024:	e51b300c 	ldr	r3, [fp, #-12]
80023028:	e2832018 	add	r2, r3, #24
8002302c:	e51b3008 	ldr	r3, [fp, #-8]
80023030:	e2033007 	and	r3, r3, #7
80023034:	e1a03303 	lsl	r3, r3, #6
80023038:	e0823003 	add	r3, r2, r3
8002303c:	e50b3010 	str	r3, [fp, #-16]

        if (dip->type == 0) {  // a free inode
80023040:	e51b3010 	ldr	r3, [fp, #-16]
80023044:	e1d330b0 	ldrh	r3, [r3]
80023048:	e3530000 	cmp	r3, #0
8002304c:	1a000012 	bne	8002309c <ialloc+0xcc>
            memset(dip, 0, sizeof(*dip));
80023050:	e51b0010 	ldr	r0, [fp, #-16]
80023054:	e3a01000 	mov	r1, #0
80023058:	e3a02040 	mov	r2, #64	; 0x40
8002305c:	ebfff3e7 	bl	80020000 <memset>
            dip->type = type;
80023060:	e51b3010 	ldr	r3, [fp, #-16]
80023064:	e15b22ba 	ldrh	r2, [fp, #-42]	; 0xffffffd6
80023068:	e1c320b0 	strh	r2, [r3]
            log_write(bp);   // mark it allocated on the disk
8002306c:	e51b000c 	ldr	r0, [fp, #-12]
80023070:	eb0005d6 	bl	800247d0 <log_write>
            brelse(bp);
80023074:	e51b000c 	ldr	r0, [fp, #-12]
80023078:	ebfff704 	bl	80020c90 <brelse>
            return iget(dev, inum);
8002307c:	e51b3008 	ldr	r3, [fp, #-8]
80023080:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
80023084:	e1a01003 	mov	r1, r3
80023088:	eb000047 	bl	800231ac <iget>
8002308c:	e1a03000 	mov	r3, r0

        brelse(bp);
    }

    panic("ialloc: no inodes");
}
80023090:	e1a00003 	mov	r0, r3
80023094:	e24bd004 	sub	sp, fp, #4
80023098:	e8bd8800 	pop	{fp, pc}
            log_write(bp);   // mark it allocated on the disk
            brelse(bp);
            return iget(dev, inum);
        }

        brelse(bp);
8002309c:	e51b000c 	ldr	r0, [fp, #-12]
800230a0:	ebfff6fa 	bl	80020c90 <brelse>
    struct dinode *dip;
    struct superblock sb;

    readsb(dev, &sb);

    for (inum = 1; inum < sb.ninodes; inum++) {
800230a4:	e51b3008 	ldr	r3, [fp, #-8]
800230a8:	e2833001 	add	r3, r3, #1
800230ac:	e50b3008 	str	r3, [fp, #-8]
800230b0:	e51b2008 	ldr	r2, [fp, #-8]
800230b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800230b8:	e1520003 	cmp	r2, r3
800230bc:	3affffd1 	bcc	80023008 <ialloc+0x38>
        }

        brelse(bp);
    }

    panic("ialloc: no inodes");
800230c0:	e3090d54 	movw	r0, #40276	; 0x9d54
800230c4:	e3480002 	movt	r0, #32770	; 0x8002
800230c8:	ebfffabb 	bl	80021bbc <panic>

800230cc <iupdate>:
}

// Copy a modified in-memory inode to disk.
void iupdate (struct inode *ip)
{
800230cc:	e92d4800 	push	{fp, lr}
800230d0:	e28db004 	add	fp, sp, #4
800230d4:	e24dd010 	sub	sp, sp, #16
800230d8:	e50b0010 	str	r0, [fp, #-16]
    struct buf *bp;
    struct dinode *dip;

    bp = bread(ip->dev, IBLOCK(ip->inum));
800230dc:	e51b3010 	ldr	r3, [fp, #-16]
800230e0:	e5932000 	ldr	r2, [r3]
800230e4:	e51b3010 	ldr	r3, [fp, #-16]
800230e8:	e5933004 	ldr	r3, [r3, #4]
800230ec:	e1a031a3 	lsr	r3, r3, #3
800230f0:	e2833002 	add	r3, r3, #2
800230f4:	e1a00002 	mov	r0, r2
800230f8:	e1a01003 	mov	r1, r3
800230fc:	ebfff6ba 	bl	80020bec <bread>
80023100:	e50b0008 	str	r0, [fp, #-8]

    dip = (struct dinode*) bp->data + ip->inum % IPB;
80023104:	e51b3008 	ldr	r3, [fp, #-8]
80023108:	e2832018 	add	r2, r3, #24
8002310c:	e51b3010 	ldr	r3, [fp, #-16]
80023110:	e5933004 	ldr	r3, [r3, #4]
80023114:	e2033007 	and	r3, r3, #7
80023118:	e1a03303 	lsl	r3, r3, #6
8002311c:	e0823003 	add	r3, r2, r3
80023120:	e50b300c 	str	r3, [fp, #-12]
    dip->type = ip->type;
80023124:	e51b3010 	ldr	r3, [fp, #-16]
80023128:	e1d321b0 	ldrh	r2, [r3, #16]
8002312c:	e51b300c 	ldr	r3, [fp, #-12]
80023130:	e1c320b0 	strh	r2, [r3]
    dip->major = ip->major;
80023134:	e51b3010 	ldr	r3, [fp, #-16]
80023138:	e1d321b2 	ldrh	r2, [r3, #18]
8002313c:	e51b300c 	ldr	r3, [fp, #-12]
80023140:	e1c320b2 	strh	r2, [r3, #2]
    dip->minor = ip->minor;
80023144:	e51b3010 	ldr	r3, [fp, #-16]
80023148:	e1d321b4 	ldrh	r2, [r3, #20]
8002314c:	e51b300c 	ldr	r3, [fp, #-12]
80023150:	e1c320b4 	strh	r2, [r3, #4]
    dip->nlink = ip->nlink;
80023154:	e51b3010 	ldr	r3, [fp, #-16]
80023158:	e1d321b6 	ldrh	r2, [r3, #22]
8002315c:	e51b300c 	ldr	r3, [fp, #-12]
80023160:	e1c320b6 	strh	r2, [r3, #6]
    dip->size = ip->size;
80023164:	e51b3010 	ldr	r3, [fp, #-16]
80023168:	e5932018 	ldr	r2, [r3, #24]
8002316c:	e51b300c 	ldr	r3, [fp, #-12]
80023170:	e5832008 	str	r2, [r3, #8]

    memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80023174:	e51b300c 	ldr	r3, [fp, #-12]
80023178:	e283200c 	add	r2, r3, #12
8002317c:	e51b3010 	ldr	r3, [fp, #-16]
80023180:	e283301c 	add	r3, r3, #28
80023184:	e1a00002 	mov	r0, r2
80023188:	e1a01003 	mov	r1, r3
8002318c:	e3a02034 	mov	r2, #52	; 0x34
80023190:	ebfff410 	bl	800201d8 <memmove>
    log_write(bp);
80023194:	e51b0008 	ldr	r0, [fp, #-8]
80023198:	eb00058c 	bl	800247d0 <log_write>
    brelse(bp);
8002319c:	e51b0008 	ldr	r0, [fp, #-8]
800231a0:	ebfff6ba 	bl	80020c90 <brelse>
}
800231a4:	e24bd004 	sub	sp, fp, #4
800231a8:	e8bd8800 	pop	{fp, pc}

800231ac <iget>:

// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode* iget (uint dev, uint inum)
{
800231ac:	e92d4800 	push	{fp, lr}
800231b0:	e28db004 	add	fp, sp, #4
800231b4:	e24dd010 	sub	sp, sp, #16
800231b8:	e50b0010 	str	r0, [fp, #-16]
800231bc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct inode *ip, *empty;

    acquire(&icache.lock);
800231c0:	e30d04d8 	movw	r0, #54488	; 0xd4d8
800231c4:	e348000a 	movt	r0, #32778	; 0x800a
800231c8:	eb000baf 	bl	8002608c <acquire>

    // Is the inode already cached?
    empty = 0;
800231cc:	e3a03000 	mov	r3, #0
800231d0:	e50b300c 	str	r3, [fp, #-12]

    for (ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++) {
800231d4:	e59f3110 	ldr	r3, [pc, #272]	; 800232ec <iget+0x140>
800231d8:	e50b3008 	str	r3, [fp, #-8]
800231dc:	ea000023 	b	80023270 <iget+0xc4>
        if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
800231e0:	e51b3008 	ldr	r3, [fp, #-8]
800231e4:	e5933008 	ldr	r3, [r3, #8]
800231e8:	e3530000 	cmp	r3, #0
800231ec:	da000013 	ble	80023240 <iget+0x94>
800231f0:	e51b3008 	ldr	r3, [fp, #-8]
800231f4:	e5932000 	ldr	r2, [r3]
800231f8:	e51b3010 	ldr	r3, [fp, #-16]
800231fc:	e1520003 	cmp	r2, r3
80023200:	1a00000e 	bne	80023240 <iget+0x94>
80023204:	e51b3008 	ldr	r3, [fp, #-8]
80023208:	e5932004 	ldr	r2, [r3, #4]
8002320c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80023210:	e1520003 	cmp	r2, r3
80023214:	1a000009 	bne	80023240 <iget+0x94>
            ip->ref++;
80023218:	e51b3008 	ldr	r3, [fp, #-8]
8002321c:	e5933008 	ldr	r3, [r3, #8]
80023220:	e2832001 	add	r2, r3, #1
80023224:	e51b3008 	ldr	r3, [fp, #-8]
80023228:	e5832008 	str	r2, [r3, #8]
            release(&icache.lock);
8002322c:	e30d04d8 	movw	r0, #54488	; 0xd4d8
80023230:	e348000a 	movt	r0, #32778	; 0x800a
80023234:	eb000b9e 	bl	800260b4 <release>
            return ip;
80023238:	e51b3008 	ldr	r3, [fp, #-8]
8002323c:	ea000027 	b	800232e0 <iget+0x134>
        }

        if (empty == 0 && ip->ref == 0) {   // Remember empty slot.
80023240:	e51b300c 	ldr	r3, [fp, #-12]
80023244:	e3530000 	cmp	r3, #0
80023248:	1a000005 	bne	80023264 <iget+0xb8>
8002324c:	e51b3008 	ldr	r3, [fp, #-8]
80023250:	e5933008 	ldr	r3, [r3, #8]
80023254:	e3530000 	cmp	r3, #0
80023258:	1a000001 	bne	80023264 <iget+0xb8>
            empty = ip;
8002325c:	e51b3008 	ldr	r3, [fp, #-8]
80023260:	e50b300c 	str	r3, [fp, #-12]
    acquire(&icache.lock);

    // Is the inode already cached?
    empty = 0;

    for (ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++) {
80023264:	e51b3008 	ldr	r3, [fp, #-8]
80023268:	e2833050 	add	r3, r3, #80	; 0x50
8002326c:	e50b3008 	str	r3, [fp, #-8]
80023270:	e51b2008 	ldr	r2, [fp, #-8]
80023274:	e59f3074 	ldr	r3, [pc, #116]	; 800232f0 <iget+0x144>
80023278:	e1520003 	cmp	r2, r3
8002327c:	3affffd7 	bcc	800231e0 <iget+0x34>
            empty = ip;
        }
    }

    // Recycle an inode cache entry.
    if (empty == 0) {
80023280:	e51b300c 	ldr	r3, [fp, #-12]
80023284:	e3530000 	cmp	r3, #0
80023288:	1a000002 	bne	80023298 <iget+0xec>
        panic("iget: no inodes");
8002328c:	e3090d68 	movw	r0, #40296	; 0x9d68
80023290:	e3480002 	movt	r0, #32770	; 0x8002
80023294:	ebfffa48 	bl	80021bbc <panic>
    }

    ip = empty;
80023298:	e51b300c 	ldr	r3, [fp, #-12]
8002329c:	e50b3008 	str	r3, [fp, #-8]
    ip->dev = dev;
800232a0:	e51b3008 	ldr	r3, [fp, #-8]
800232a4:	e51b2010 	ldr	r2, [fp, #-16]
800232a8:	e5832000 	str	r2, [r3]
    ip->inum = inum;
800232ac:	e51b3008 	ldr	r3, [fp, #-8]
800232b0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800232b4:	e5832004 	str	r2, [r3, #4]
    ip->ref = 1;
800232b8:	e51b3008 	ldr	r3, [fp, #-8]
800232bc:	e3a02001 	mov	r2, #1
800232c0:	e5832008 	str	r2, [r3, #8]
    ip->flags = 0;
800232c4:	e51b3008 	ldr	r3, [fp, #-8]
800232c8:	e3a02000 	mov	r2, #0
800232cc:	e583200c 	str	r2, [r3, #12]
    release(&icache.lock);
800232d0:	e30d04d8 	movw	r0, #54488	; 0xd4d8
800232d4:	e348000a 	movt	r0, #32778	; 0x800a
800232d8:	eb000b75 	bl	800260b4 <release>

    return ip;
800232dc:	e51b3008 	ldr	r3, [fp, #-8]
}
800232e0:	e1a00003 	mov	r0, r3
800232e4:	e24bd004 	sub	sp, fp, #4
800232e8:	e8bd8800 	pop	{fp, pc}
800232ec:	800ad50c 	.word	0x800ad50c
800232f0:	800ae4ac 	.word	0x800ae4ac

800232f4 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode* idup (struct inode *ip)
{
800232f4:	e92d4800 	push	{fp, lr}
800232f8:	e28db004 	add	fp, sp, #4
800232fc:	e24dd008 	sub	sp, sp, #8
80023300:	e50b0008 	str	r0, [fp, #-8]
    acquire(&icache.lock);
80023304:	e30d04d8 	movw	r0, #54488	; 0xd4d8
80023308:	e348000a 	movt	r0, #32778	; 0x800a
8002330c:	eb000b5e 	bl	8002608c <acquire>
    ip->ref++;
80023310:	e51b3008 	ldr	r3, [fp, #-8]
80023314:	e5933008 	ldr	r3, [r3, #8]
80023318:	e2832001 	add	r2, r3, #1
8002331c:	e51b3008 	ldr	r3, [fp, #-8]
80023320:	e5832008 	str	r2, [r3, #8]
    release(&icache.lock);
80023324:	e30d04d8 	movw	r0, #54488	; 0xd4d8
80023328:	e348000a 	movt	r0, #32778	; 0x800a
8002332c:	eb000b60 	bl	800260b4 <release>
    return ip;
80023330:	e51b3008 	ldr	r3, [fp, #-8]
}
80023334:	e1a00003 	mov	r0, r3
80023338:	e24bd004 	sub	sp, fp, #4
8002333c:	e8bd8800 	pop	{fp, pc}

80023340 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void ilock (struct inode *ip)
{
80023340:	e92d4800 	push	{fp, lr}
80023344:	e28db004 	add	fp, sp, #4
80023348:	e24dd010 	sub	sp, sp, #16
8002334c:	e50b0010 	str	r0, [fp, #-16]
    struct buf *bp;
    struct dinode *dip;

    if (ip == 0 || ip->ref < 1) {
80023350:	e51b3010 	ldr	r3, [fp, #-16]
80023354:	e3530000 	cmp	r3, #0
80023358:	0a000003 	beq	8002336c <ilock+0x2c>
8002335c:	e51b3010 	ldr	r3, [fp, #-16]
80023360:	e5933008 	ldr	r3, [r3, #8]
80023364:	e3530000 	cmp	r3, #0
80023368:	ca000002 	bgt	80023378 <ilock+0x38>
        panic("ilock");
8002336c:	e3090d78 	movw	r0, #40312	; 0x9d78
80023370:	e3480002 	movt	r0, #32770	; 0x8002
80023374:	ebfffa10 	bl	80021bbc <panic>
    }

    acquire(&icache.lock);
80023378:	e30d04d8 	movw	r0, #54488	; 0xd4d8
8002337c:	e348000a 	movt	r0, #32778	; 0x800a
80023380:	eb000b41 	bl	8002608c <acquire>
    while (ip->flags & I_BUSY) {
80023384:	ea000003 	b	80023398 <ilock+0x58>
        sleep(ip, &icache.lock);
80023388:	e51b0010 	ldr	r0, [fp, #-16]
8002338c:	e30d14d8 	movw	r1, #54488	; 0xd4d8
80023390:	e348100a 	movt	r1, #32778	; 0x800a
80023394:	eb000a55 	bl	80025cf0 <sleep>
    if (ip == 0 || ip->ref < 1) {
        panic("ilock");
    }

    acquire(&icache.lock);
    while (ip->flags & I_BUSY) {
80023398:	e51b3010 	ldr	r3, [fp, #-16]
8002339c:	e593300c 	ldr	r3, [r3, #12]
800233a0:	e2033001 	and	r3, r3, #1
800233a4:	e6ef3073 	uxtb	r3, r3
800233a8:	e3530000 	cmp	r3, #0
800233ac:	1afffff5 	bne	80023388 <ilock+0x48>
        sleep(ip, &icache.lock);
    }

    ip->flags |= I_BUSY;
800233b0:	e51b3010 	ldr	r3, [fp, #-16]
800233b4:	e593300c 	ldr	r3, [r3, #12]
800233b8:	e3832001 	orr	r2, r3, #1
800233bc:	e51b3010 	ldr	r3, [fp, #-16]
800233c0:	e583200c 	str	r2, [r3, #12]
    release(&icache.lock);
800233c4:	e30d04d8 	movw	r0, #54488	; 0xd4d8
800233c8:	e348000a 	movt	r0, #32778	; 0x800a
800233cc:	eb000b38 	bl	800260b4 <release>

    if (!(ip->flags & I_VALID)) {
800233d0:	e51b3010 	ldr	r3, [fp, #-16]
800233d4:	e593300c 	ldr	r3, [r3, #12]
800233d8:	e2033002 	and	r3, r3, #2
800233dc:	e3530000 	cmp	r3, #0
800233e0:	1a00003b 	bne	800234d4 <ilock+0x194>
        bp = bread(ip->dev, IBLOCK(ip->inum));
800233e4:	e51b3010 	ldr	r3, [fp, #-16]
800233e8:	e5932000 	ldr	r2, [r3]
800233ec:	e51b3010 	ldr	r3, [fp, #-16]
800233f0:	e5933004 	ldr	r3, [r3, #4]
800233f4:	e1a031a3 	lsr	r3, r3, #3
800233f8:	e2833002 	add	r3, r3, #2
800233fc:	e1a00002 	mov	r0, r2
80023400:	e1a01003 	mov	r1, r3
80023404:	ebfff5f8 	bl	80020bec <bread>
80023408:	e50b0008 	str	r0, [fp, #-8]

        dip = (struct dinode*) bp->data + ip->inum % IPB;
8002340c:	e51b3008 	ldr	r3, [fp, #-8]
80023410:	e2832018 	add	r2, r3, #24
80023414:	e51b3010 	ldr	r3, [fp, #-16]
80023418:	e5933004 	ldr	r3, [r3, #4]
8002341c:	e2033007 	and	r3, r3, #7
80023420:	e1a03303 	lsl	r3, r3, #6
80023424:	e0823003 	add	r3, r2, r3
80023428:	e50b300c 	str	r3, [fp, #-12]
        ip->type = dip->type;
8002342c:	e51b300c 	ldr	r3, [fp, #-12]
80023430:	e1d320b0 	ldrh	r2, [r3]
80023434:	e51b3010 	ldr	r3, [fp, #-16]
80023438:	e1c321b0 	strh	r2, [r3, #16]
        ip->major = dip->major;
8002343c:	e51b300c 	ldr	r3, [fp, #-12]
80023440:	e1d320b2 	ldrh	r2, [r3, #2]
80023444:	e51b3010 	ldr	r3, [fp, #-16]
80023448:	e1c321b2 	strh	r2, [r3, #18]
        ip->minor = dip->minor;
8002344c:	e51b300c 	ldr	r3, [fp, #-12]
80023450:	e1d320b4 	ldrh	r2, [r3, #4]
80023454:	e51b3010 	ldr	r3, [fp, #-16]
80023458:	e1c321b4 	strh	r2, [r3, #20]
        ip->nlink = dip->nlink;
8002345c:	e51b300c 	ldr	r3, [fp, #-12]
80023460:	e1d320b6 	ldrh	r2, [r3, #6]
80023464:	e51b3010 	ldr	r3, [fp, #-16]
80023468:	e1c321b6 	strh	r2, [r3, #22]
        ip->size = dip->size;
8002346c:	e51b300c 	ldr	r3, [fp, #-12]
80023470:	e5932008 	ldr	r2, [r3, #8]
80023474:	e51b3010 	ldr	r3, [fp, #-16]
80023478:	e5832018 	str	r2, [r3, #24]

        memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8002347c:	e51b3010 	ldr	r3, [fp, #-16]
80023480:	e283201c 	add	r2, r3, #28
80023484:	e51b300c 	ldr	r3, [fp, #-12]
80023488:	e283300c 	add	r3, r3, #12
8002348c:	e1a00002 	mov	r0, r2
80023490:	e1a01003 	mov	r1, r3
80023494:	e3a02034 	mov	r2, #52	; 0x34
80023498:	ebfff34e 	bl	800201d8 <memmove>
        brelse(bp);
8002349c:	e51b0008 	ldr	r0, [fp, #-8]
800234a0:	ebfff5fa 	bl	80020c90 <brelse>
        ip->flags |= I_VALID;
800234a4:	e51b3010 	ldr	r3, [fp, #-16]
800234a8:	e593300c 	ldr	r3, [r3, #12]
800234ac:	e3832002 	orr	r2, r3, #2
800234b0:	e51b3010 	ldr	r3, [fp, #-16]
800234b4:	e583200c 	str	r2, [r3, #12]

        if (ip->type == 0) {
800234b8:	e51b3010 	ldr	r3, [fp, #-16]
800234bc:	e1d331b0 	ldrh	r3, [r3, #16]
800234c0:	e3530000 	cmp	r3, #0
800234c4:	1a000002 	bne	800234d4 <ilock+0x194>
            panic("ilock: no type");
800234c8:	e3090d80 	movw	r0, #40320	; 0x9d80
800234cc:	e3480002 	movt	r0, #32770	; 0x8002
800234d0:	ebfff9b9 	bl	80021bbc <panic>
        }
    }
}
800234d4:	e24bd004 	sub	sp, fp, #4
800234d8:	e8bd8800 	pop	{fp, pc}

800234dc <iunlock>:

// Unlock the given inode.
void iunlock (struct inode *ip)
{
800234dc:	e92d4800 	push	{fp, lr}
800234e0:	e28db004 	add	fp, sp, #4
800234e4:	e24dd008 	sub	sp, sp, #8
800234e8:	e50b0008 	str	r0, [fp, #-8]
    if (ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1) {
800234ec:	e51b3008 	ldr	r3, [fp, #-8]
800234f0:	e3530000 	cmp	r3, #0
800234f4:	0a000008 	beq	8002351c <iunlock+0x40>
800234f8:	e51b3008 	ldr	r3, [fp, #-8]
800234fc:	e593300c 	ldr	r3, [r3, #12]
80023500:	e2033001 	and	r3, r3, #1
80023504:	e3530000 	cmp	r3, #0
80023508:	0a000003 	beq	8002351c <iunlock+0x40>
8002350c:	e51b3008 	ldr	r3, [fp, #-8]
80023510:	e5933008 	ldr	r3, [r3, #8]
80023514:	e3530000 	cmp	r3, #0
80023518:	ca000002 	bgt	80023528 <iunlock+0x4c>
        panic("iunlock");
8002351c:	e3090d90 	movw	r0, #40336	; 0x9d90
80023520:	e3480002 	movt	r0, #32770	; 0x8002
80023524:	ebfff9a4 	bl	80021bbc <panic>
    }

    acquire(&icache.lock);
80023528:	e30d04d8 	movw	r0, #54488	; 0xd4d8
8002352c:	e348000a 	movt	r0, #32778	; 0x800a
80023530:	eb000ad5 	bl	8002608c <acquire>
    ip->flags &= ~I_BUSY;
80023534:	e51b3008 	ldr	r3, [fp, #-8]
80023538:	e593300c 	ldr	r3, [r3, #12]
8002353c:	e3c32001 	bic	r2, r3, #1
80023540:	e51b3008 	ldr	r3, [fp, #-8]
80023544:	e583200c 	str	r2, [r3, #12]
    wakeup(ip);
80023548:	e51b0008 	ldr	r0, [fp, #-8]
8002354c:	eb000a3f 	bl	80025e50 <wakeup>
    release(&icache.lock);
80023550:	e30d04d8 	movw	r0, #54488	; 0xd4d8
80023554:	e348000a 	movt	r0, #32778	; 0x800a
80023558:	eb000ad5 	bl	800260b4 <release>
}
8002355c:	e24bd004 	sub	sp, fp, #4
80023560:	e8bd8800 	pop	{fp, pc}

80023564 <iput>:
// If that was the last reference, the inode cache entry can
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void iput (struct inode *ip)
{
80023564:	e92d4800 	push	{fp, lr}
80023568:	e28db004 	add	fp, sp, #4
8002356c:	e24dd008 	sub	sp, sp, #8
80023570:	e50b0008 	str	r0, [fp, #-8]
    acquire(&icache.lock);
80023574:	e30d04d8 	movw	r0, #54488	; 0xd4d8
80023578:	e348000a 	movt	r0, #32778	; 0x800a
8002357c:	eb000ac2 	bl	8002608c <acquire>

    if (ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0) {
80023580:	e51b3008 	ldr	r3, [fp, #-8]
80023584:	e5933008 	ldr	r3, [r3, #8]
80023588:	e3530001 	cmp	r3, #1
8002358c:	1a000028 	bne	80023634 <iput+0xd0>
80023590:	e51b3008 	ldr	r3, [fp, #-8]
80023594:	e593300c 	ldr	r3, [r3, #12]
80023598:	e2033002 	and	r3, r3, #2
8002359c:	e3530000 	cmp	r3, #0
800235a0:	0a000023 	beq	80023634 <iput+0xd0>
800235a4:	e51b3008 	ldr	r3, [fp, #-8]
800235a8:	e1d331b6 	ldrh	r3, [r3, #22]
800235ac:	e3530000 	cmp	r3, #0
800235b0:	1a00001f 	bne	80023634 <iput+0xd0>
        // inode has no links: truncate and free inode.
        if (ip->flags & I_BUSY) {
800235b4:	e51b3008 	ldr	r3, [fp, #-8]
800235b8:	e593300c 	ldr	r3, [r3, #12]
800235bc:	e2033001 	and	r3, r3, #1
800235c0:	e6ef3073 	uxtb	r3, r3
800235c4:	e3530000 	cmp	r3, #0
800235c8:	0a000002 	beq	800235d8 <iput+0x74>
            panic("iput busy");
800235cc:	e3090d98 	movw	r0, #40344	; 0x9d98
800235d0:	e3480002 	movt	r0, #32770	; 0x8002
800235d4:	ebfff978 	bl	80021bbc <panic>
        }

        ip->flags |= I_BUSY;
800235d8:	e51b3008 	ldr	r3, [fp, #-8]
800235dc:	e593300c 	ldr	r3, [r3, #12]
800235e0:	e3832001 	orr	r2, r3, #1
800235e4:	e51b3008 	ldr	r3, [fp, #-8]
800235e8:	e583200c 	str	r2, [r3, #12]
        release(&icache.lock);
800235ec:	e30d04d8 	movw	r0, #54488	; 0xd4d8
800235f0:	e348000a 	movt	r0, #32778	; 0x800a
800235f4:	eb000aae 	bl	800260b4 <release>
        itrunc(ip);
800235f8:	e51b0008 	ldr	r0, [fp, #-8]
800235fc:	eb000083 	bl	80023810 <itrunc>
        ip->type = 0;
80023600:	e51b3008 	ldr	r3, [fp, #-8]
80023604:	e3a02000 	mov	r2, #0
80023608:	e1c321b0 	strh	r2, [r3, #16]
        iupdate(ip);
8002360c:	e51b0008 	ldr	r0, [fp, #-8]
80023610:	ebfffead 	bl	800230cc <iupdate>

        acquire(&icache.lock);
80023614:	e30d04d8 	movw	r0, #54488	; 0xd4d8
80023618:	e348000a 	movt	r0, #32778	; 0x800a
8002361c:	eb000a9a 	bl	8002608c <acquire>
        ip->flags = 0;
80023620:	e51b3008 	ldr	r3, [fp, #-8]
80023624:	e3a02000 	mov	r2, #0
80023628:	e583200c 	str	r2, [r3, #12]
        wakeup(ip);
8002362c:	e51b0008 	ldr	r0, [fp, #-8]
80023630:	eb000a06 	bl	80025e50 <wakeup>
    }

    ip->ref--;
80023634:	e51b3008 	ldr	r3, [fp, #-8]
80023638:	e5933008 	ldr	r3, [r3, #8]
8002363c:	e2432001 	sub	r2, r3, #1
80023640:	e51b3008 	ldr	r3, [fp, #-8]
80023644:	e5832008 	str	r2, [r3, #8]
    release(&icache.lock);
80023648:	e30d04d8 	movw	r0, #54488	; 0xd4d8
8002364c:	e348000a 	movt	r0, #32778	; 0x800a
80023650:	eb000a97 	bl	800260b4 <release>
}
80023654:	e24bd004 	sub	sp, fp, #4
80023658:	e8bd8800 	pop	{fp, pc}

8002365c <iunlockput>:

// Common idiom: unlock, then put.
void iunlockput (struct inode *ip)
{
8002365c:	e92d4800 	push	{fp, lr}
80023660:	e28db004 	add	fp, sp, #4
80023664:	e24dd008 	sub	sp, sp, #8
80023668:	e50b0008 	str	r0, [fp, #-8]
    iunlock(ip);
8002366c:	e51b0008 	ldr	r0, [fp, #-8]
80023670:	ebffff99 	bl	800234dc <iunlock>
    iput(ip);
80023674:	e51b0008 	ldr	r0, [fp, #-8]
80023678:	ebffffb9 	bl	80023564 <iput>
}
8002367c:	e24bd004 	sub	sp, fp, #4
80023680:	e8bd8800 	pop	{fp, pc}

80023684 <bmap>:
// listed in block ip->addrs[NDIRECT].

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint bmap (struct inode *ip, uint bn)
{
80023684:	e92d4810 	push	{r4, fp, lr}
80023688:	e28db008 	add	fp, sp, #8
8002368c:	e24dd01c 	sub	sp, sp, #28
80023690:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
80023694:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    uint addr, *a;
    struct buf *bp;

    if (bn < NDIRECT) {
80023698:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
8002369c:	e353000b 	cmp	r3, #11
800236a0:	8a00001d 	bhi	8002371c <bmap+0x98>
        if ((addr = ip->addrs[bn]) == 0) {
800236a4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
800236a8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800236ac:	e2833006 	add	r3, r3, #6
800236b0:	e3a01004 	mov	r1, #4
800236b4:	e1a03103 	lsl	r3, r3, #2
800236b8:	e0822003 	add	r2, r2, r3
800236bc:	e1a03001 	mov	r3, r1
800236c0:	e0823003 	add	r3, r2, r3
800236c4:	e5933000 	ldr	r3, [r3]
800236c8:	e50b3010 	str	r3, [fp, #-16]
800236cc:	e51b3010 	ldr	r3, [fp, #-16]
800236d0:	e3530000 	cmp	r3, #0
800236d4:	1a00000e 	bne	80023714 <bmap+0x90>
            ip->addrs[bn] = addr = balloc(ip->dev);
800236d8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800236dc:	e5933000 	ldr	r3, [r3]
800236e0:	e1a00003 	mov	r0, r3
800236e4:	ebfffd63 	bl	80022c78 <balloc>
800236e8:	e50b0010 	str	r0, [fp, #-16]
800236ec:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
800236f0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800236f4:	e2833006 	add	r3, r3, #6
800236f8:	e3a01004 	mov	r1, #4
800236fc:	e1a03103 	lsl	r3, r3, #2
80023700:	e0822003 	add	r2, r2, r3
80023704:	e1a03001 	mov	r3, r1
80023708:	e0823003 	add	r3, r2, r3
8002370c:	e51b2010 	ldr	r2, [fp, #-16]
80023710:	e5832000 	str	r2, [r3]
        }

        return addr;
80023714:	e51b3010 	ldr	r3, [fp, #-16]
80023718:	ea000039 	b	80023804 <bmap+0x180>
    }

    bn -= NDIRECT;
8002371c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80023720:	e243300c 	sub	r3, r3, #12
80023724:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc

    if (bn < NINDIRECT) {
80023728:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
8002372c:	e353007f 	cmp	r3, #127	; 0x7f
80023730:	8a000030 	bhi	800237f8 <bmap+0x174>
        // Load indirect block, allocating if necessary.
        if ((addr = ip->addrs[NDIRECT]) == 0) {
80023734:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023738:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
8002373c:	e50b3010 	str	r3, [fp, #-16]
80023740:	e51b3010 	ldr	r3, [fp, #-16]
80023744:	e3530000 	cmp	r3, #0
80023748:	1a000007 	bne	8002376c <bmap+0xe8>
            ip->addrs[NDIRECT] = addr = balloc(ip->dev);
8002374c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023750:	e5933000 	ldr	r3, [r3]
80023754:	e1a00003 	mov	r0, r3
80023758:	ebfffd46 	bl	80022c78 <balloc>
8002375c:	e50b0010 	str	r0, [fp, #-16]
80023760:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023764:	e51b2010 	ldr	r2, [fp, #-16]
80023768:	e583204c 	str	r2, [r3, #76]	; 0x4c
        }

        bp = bread(ip->dev, addr);
8002376c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023770:	e5933000 	ldr	r3, [r3]
80023774:	e1a00003 	mov	r0, r3
80023778:	e51b1010 	ldr	r1, [fp, #-16]
8002377c:	ebfff51a 	bl	80020bec <bread>
80023780:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
        a = (uint*) bp->data;
80023784:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80023788:	e2833018 	add	r3, r3, #24
8002378c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

        if ((addr = a[bn]) == 0) {
80023790:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80023794:	e1a03103 	lsl	r3, r3, #2
80023798:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
8002379c:	e0823003 	add	r3, r2, r3
800237a0:	e5933000 	ldr	r3, [r3]
800237a4:	e50b3010 	str	r3, [fp, #-16]
800237a8:	e51b3010 	ldr	r3, [fp, #-16]
800237ac:	e3530000 	cmp	r3, #0
800237b0:	1a00000c 	bne	800237e8 <bmap+0x164>
            a[bn] = addr = balloc(ip->dev);
800237b4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
800237b8:	e1a03103 	lsl	r3, r3, #2
800237bc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
800237c0:	e0824003 	add	r4, r2, r3
800237c4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800237c8:	e5933000 	ldr	r3, [r3]
800237cc:	e1a00003 	mov	r0, r3
800237d0:	ebfffd28 	bl	80022c78 <balloc>
800237d4:	e50b0010 	str	r0, [fp, #-16]
800237d8:	e51b3010 	ldr	r3, [fp, #-16]
800237dc:	e5843000 	str	r3, [r4]
            log_write(bp);
800237e0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800237e4:	eb0003f9 	bl	800247d0 <log_write>
        }

        brelse(bp);
800237e8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800237ec:	ebfff527 	bl	80020c90 <brelse>
        return addr;
800237f0:	e51b3010 	ldr	r3, [fp, #-16]
800237f4:	ea000002 	b	80023804 <bmap+0x180>
    }

    panic("bmap: out of range");
800237f8:	e3090da4 	movw	r0, #40356	; 0x9da4
800237fc:	e3480002 	movt	r0, #32770	; 0x8002
80023800:	ebfff8ed 	bl	80021bbc <panic>
}
80023804:	e1a00003 	mov	r0, r3
80023808:	e24bd008 	sub	sp, fp, #8
8002380c:	e8bd8810 	pop	{r4, fp, pc}

80023810 <itrunc>:
// Only called when the inode has no links
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void itrunc (struct inode *ip)
{
80023810:	e92d4800 	push	{fp, lr}
80023814:	e28db004 	add	fp, sp, #4
80023818:	e24dd018 	sub	sp, sp, #24
8002381c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    int i, j;
    struct buf *bp;
    uint *a;

    for (i = 0; i < NDIRECT; i++) {
80023820:	e3a03000 	mov	r3, #0
80023824:	e50b3008 	str	r3, [fp, #-8]
80023828:	ea000026 	b	800238c8 <itrunc+0xb8>
        if (ip->addrs[i]) {
8002382c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80023830:	e51b3008 	ldr	r3, [fp, #-8]
80023834:	e2833006 	add	r3, r3, #6
80023838:	e3a01004 	mov	r1, #4
8002383c:	e1a03103 	lsl	r3, r3, #2
80023840:	e0822003 	add	r2, r2, r3
80023844:	e1a03001 	mov	r3, r1
80023848:	e0823003 	add	r3, r2, r3
8002384c:	e5933000 	ldr	r3, [r3]
80023850:	e3530000 	cmp	r3, #0
80023854:	0a000018 	beq	800238bc <itrunc+0xac>
            bfree(ip->dev, ip->addrs[i]);
80023858:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002385c:	e5933000 	ldr	r3, [r3]
80023860:	e1a02003 	mov	r2, r3
80023864:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
80023868:	e51b3008 	ldr	r3, [fp, #-8]
8002386c:	e2833006 	add	r3, r3, #6
80023870:	e3a00004 	mov	r0, #4
80023874:	e1a03103 	lsl	r3, r3, #2
80023878:	e0811003 	add	r1, r1, r3
8002387c:	e1a03000 	mov	r3, r0
80023880:	e0813003 	add	r3, r1, r3
80023884:	e5933000 	ldr	r3, [r3]
80023888:	e1a00002 	mov	r0, r2
8002388c:	e1a01003 	mov	r1, r3
80023890:	ebfffd73 	bl	80022e64 <bfree>
            ip->addrs[i] = 0;
80023894:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80023898:	e51b3008 	ldr	r3, [fp, #-8]
8002389c:	e2833006 	add	r3, r3, #6
800238a0:	e3a01004 	mov	r1, #4
800238a4:	e1a03103 	lsl	r3, r3, #2
800238a8:	e0822003 	add	r2, r2, r3
800238ac:	e1a03001 	mov	r3, r1
800238b0:	e0823003 	add	r3, r2, r3
800238b4:	e3a02000 	mov	r2, #0
800238b8:	e5832000 	str	r2, [r3]
{
    int i, j;
    struct buf *bp;
    uint *a;

    for (i = 0; i < NDIRECT; i++) {
800238bc:	e51b3008 	ldr	r3, [fp, #-8]
800238c0:	e2833001 	add	r3, r3, #1
800238c4:	e50b3008 	str	r3, [fp, #-8]
800238c8:	e51b3008 	ldr	r3, [fp, #-8]
800238cc:	e353000b 	cmp	r3, #11
800238d0:	daffffd5 	ble	8002382c <itrunc+0x1c>
            bfree(ip->dev, ip->addrs[i]);
            ip->addrs[i] = 0;
        }
    }

    if (ip->addrs[NDIRECT]) {
800238d4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800238d8:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
800238dc:	e3530000 	cmp	r3, #0
800238e0:	0a000032 	beq	800239b0 <itrunc+0x1a0>
        bp = bread(ip->dev, ip->addrs[NDIRECT]);
800238e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800238e8:	e5932000 	ldr	r2, [r3]
800238ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800238f0:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
800238f4:	e1a00002 	mov	r0, r2
800238f8:	e1a01003 	mov	r1, r3
800238fc:	ebfff4ba 	bl	80020bec <bread>
80023900:	e50b0010 	str	r0, [fp, #-16]
        a = (uint*) bp->data;
80023904:	e51b3010 	ldr	r3, [fp, #-16]
80023908:	e2833018 	add	r3, r3, #24
8002390c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

        for (j = 0; j < NINDIRECT; j++) {
80023910:	e3a03000 	mov	r3, #0
80023914:	e50b300c 	str	r3, [fp, #-12]
80023918:	ea000014 	b	80023970 <itrunc+0x160>
            if (a[j]) {
8002391c:	e51b300c 	ldr	r3, [fp, #-12]
80023920:	e1a03103 	lsl	r3, r3, #2
80023924:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80023928:	e0823003 	add	r3, r2, r3
8002392c:	e5933000 	ldr	r3, [r3]
80023930:	e3530000 	cmp	r3, #0
80023934:	0a00000a 	beq	80023964 <itrunc+0x154>
                bfree(ip->dev, a[j]);
80023938:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002393c:	e5933000 	ldr	r3, [r3]
80023940:	e1a02003 	mov	r2, r3
80023944:	e51b300c 	ldr	r3, [fp, #-12]
80023948:	e1a03103 	lsl	r3, r3, #2
8002394c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
80023950:	e0813003 	add	r3, r1, r3
80023954:	e5933000 	ldr	r3, [r3]
80023958:	e1a00002 	mov	r0, r2
8002395c:	e1a01003 	mov	r1, r3
80023960:	ebfffd3f 	bl	80022e64 <bfree>

    if (ip->addrs[NDIRECT]) {
        bp = bread(ip->dev, ip->addrs[NDIRECT]);
        a = (uint*) bp->data;

        for (j = 0; j < NINDIRECT; j++) {
80023964:	e51b300c 	ldr	r3, [fp, #-12]
80023968:	e2833001 	add	r3, r3, #1
8002396c:	e50b300c 	str	r3, [fp, #-12]
80023970:	e51b300c 	ldr	r3, [fp, #-12]
80023974:	e353007f 	cmp	r3, #127	; 0x7f
80023978:	9affffe7 	bls	8002391c <itrunc+0x10c>
            if (a[j]) {
                bfree(ip->dev, a[j]);
            }
        }

        brelse(bp);
8002397c:	e51b0010 	ldr	r0, [fp, #-16]
80023980:	ebfff4c2 	bl	80020c90 <brelse>
        bfree(ip->dev, ip->addrs[NDIRECT]);
80023984:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023988:	e5933000 	ldr	r3, [r3]
8002398c:	e1a02003 	mov	r2, r3
80023990:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023994:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
80023998:	e1a00002 	mov	r0, r2
8002399c:	e1a01003 	mov	r1, r3
800239a0:	ebfffd2f 	bl	80022e64 <bfree>
        ip->addrs[NDIRECT] = 0;
800239a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800239a8:	e3a02000 	mov	r2, #0
800239ac:	e583204c 	str	r2, [r3, #76]	; 0x4c
    }

    ip->size = 0;
800239b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800239b4:	e3a02000 	mov	r2, #0
800239b8:	e5832018 	str	r2, [r3, #24]
    iupdate(ip);
800239bc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
800239c0:	ebfffdc1 	bl	800230cc <iupdate>
}
800239c4:	e24bd004 	sub	sp, fp, #4
800239c8:	e8bd8800 	pop	{fp, pc}

800239cc <stati>:

// Copy stat information from inode.
void stati (struct inode *ip, struct stat *st)
{
800239cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800239d0:	e28db000 	add	fp, sp, #0
800239d4:	e24dd00c 	sub	sp, sp, #12
800239d8:	e50b0008 	str	r0, [fp, #-8]
800239dc:	e50b100c 	str	r1, [fp, #-12]
    st->dev = ip->dev;
800239e0:	e51b3008 	ldr	r3, [fp, #-8]
800239e4:	e5933000 	ldr	r3, [r3]
800239e8:	e1a02003 	mov	r2, r3
800239ec:	e51b300c 	ldr	r3, [fp, #-12]
800239f0:	e5832004 	str	r2, [r3, #4]
    st->ino = ip->inum;
800239f4:	e51b3008 	ldr	r3, [fp, #-8]
800239f8:	e5932004 	ldr	r2, [r3, #4]
800239fc:	e51b300c 	ldr	r3, [fp, #-12]
80023a00:	e5832008 	str	r2, [r3, #8]
    st->type = ip->type;
80023a04:	e51b3008 	ldr	r3, [fp, #-8]
80023a08:	e1d321b0 	ldrh	r2, [r3, #16]
80023a0c:	e51b300c 	ldr	r3, [fp, #-12]
80023a10:	e1c320b0 	strh	r2, [r3]
    st->nlink = ip->nlink;
80023a14:	e51b3008 	ldr	r3, [fp, #-8]
80023a18:	e1d321b6 	ldrh	r2, [r3, #22]
80023a1c:	e51b300c 	ldr	r3, [fp, #-12]
80023a20:	e1c320bc 	strh	r2, [r3, #12]
    st->size = ip->size;
80023a24:	e51b3008 	ldr	r3, [fp, #-8]
80023a28:	e5932018 	ldr	r2, [r3, #24]
80023a2c:	e51b300c 	ldr	r3, [fp, #-12]
80023a30:	e5832010 	str	r2, [r3, #16]
}
80023a34:	e28bd000 	add	sp, fp, #0
80023a38:	e8bd0800 	pop	{fp}
80023a3c:	e12fff1e 	bx	lr

80023a40 <readi>:

//PAGEBREAK!
// Read data from inode.
int readi (struct inode *ip, char *dst, uint off, uint n)
{
80023a40:	e92d4810 	push	{r4, fp, lr}
80023a44:	e28db008 	add	fp, sp, #8
80023a48:	e24dd024 	sub	sp, sp, #36	; 0x24
80023a4c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
80023a50:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
80023a54:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
80023a58:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    uint tot, m;
    struct buf *bp;

    if (ip->type == T_DEV) {
80023a5c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023a60:	e1d331b0 	ldrh	r3, [r3, #16]
80023a64:	e6bf3073 	sxth	r3, r3
80023a68:	e3530003 	cmp	r3, #3
80023a6c:	1a00001f 	bne	80023af0 <readi+0xb0>
        if (ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read) {
80023a70:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023a74:	e1d331b2 	ldrh	r3, [r3, #18]
80023a78:	e6bf3073 	sxth	r3, r3
80023a7c:	e3530000 	cmp	r3, #0
80023a80:	ba00000c 	blt	80023ab8 <readi+0x78>
80023a84:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023a88:	e1d331b2 	ldrh	r3, [r3, #18]
80023a8c:	e6bf3073 	sxth	r3, r3
80023a90:	e3530009 	cmp	r3, #9
80023a94:	ca000007 	bgt	80023ab8 <readi+0x78>
80023a98:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023a9c:	e1d331b2 	ldrh	r3, [r3, #18]
80023aa0:	e6bf2073 	sxth	r2, r3
80023aa4:	e30d3488 	movw	r3, #54408	; 0xd488
80023aa8:	e348300a 	movt	r3, #32778	; 0x800a
80023aac:	e7933182 	ldr	r3, [r3, r2, lsl #3]
80023ab0:	e3530000 	cmp	r3, #0
80023ab4:	1a000001 	bne	80023ac0 <readi+0x80>
            return -1;
80023ab8:	e3e03000 	mvn	r3, #0
80023abc:	ea00005a 	b	80023c2c <readi+0x1ec>
        }

        return devsw[ip->major].read(ip, dst, n);
80023ac0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023ac4:	e1d331b2 	ldrh	r3, [r3, #18]
80023ac8:	e6bf2073 	sxth	r2, r3
80023acc:	e30d3488 	movw	r3, #54408	; 0xd488
80023ad0:	e348300a 	movt	r3, #32778	; 0x800a
80023ad4:	e7933182 	ldr	r3, [r3, r2, lsl #3]
80023ad8:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
80023adc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80023ae0:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
80023ae4:	e12fff33 	blx	r3
80023ae8:	e1a03000 	mov	r3, r0
80023aec:	ea00004e 	b	80023c2c <readi+0x1ec>
    }

    if (off > ip->size || off + n < off) {
80023af0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023af4:	e5932018 	ldr	r2, [r3, #24]
80023af8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023afc:	e1520003 	cmp	r2, r3
80023b00:	3a000005 	bcc	80023b1c <readi+0xdc>
80023b04:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80023b08:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80023b0c:	e0822003 	add	r2, r2, r3
80023b10:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023b14:	e1520003 	cmp	r2, r3
80023b18:	2a000001 	bcs	80023b24 <readi+0xe4>
        return -1;
80023b1c:	e3e03000 	mvn	r3, #0
80023b20:	ea000041 	b	80023c2c <readi+0x1ec>
    }

    if (off + n > ip->size) {
80023b24:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80023b28:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80023b2c:	e0822003 	add	r2, r2, r3
80023b30:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023b34:	e5933018 	ldr	r3, [r3, #24]
80023b38:	e1520003 	cmp	r2, r3
80023b3c:	9a000004 	bls	80023b54 <readi+0x114>
        n = ip->size - off;
80023b40:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023b44:	e5932018 	ldr	r2, [r3, #24]
80023b48:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023b4c:	e0633002 	rsb	r3, r3, r2
80023b50:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    }

    for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80023b54:	e3a03000 	mov	r3, #0
80023b58:	e50b3010 	str	r3, [fp, #-16]
80023b5c:	ea00002d 	b	80023c18 <readi+0x1d8>
        bp = bread(ip->dev, bmap(ip, off / BSIZE));
80023b60:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023b64:	e5934000 	ldr	r4, [r3]
80023b68:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023b6c:	e1a034a3 	lsr	r3, r3, #9
80023b70:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80023b74:	e1a01003 	mov	r1, r3
80023b78:	ebfffec1 	bl	80023684 <bmap>
80023b7c:	e1a03000 	mov	r3, r0
80023b80:	e1a00004 	mov	r0, r4
80023b84:	e1a01003 	mov	r1, r3
80023b88:	ebfff417 	bl	80020bec <bread>
80023b8c:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
        m = min(n - tot, BSIZE - off%BSIZE);
80023b90:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023b94:	e1a03b83 	lsl	r3, r3, #23
80023b98:	e1a03ba3 	lsr	r3, r3, #23
80023b9c:	e2632c02 	rsb	r2, r3, #512	; 0x200
80023ba0:	e51b102c 	ldr	r1, [fp, #-44]	; 0xffffffd4
80023ba4:	e51b3010 	ldr	r3, [fp, #-16]
80023ba8:	e0633001 	rsb	r3, r3, r1
80023bac:	e1520003 	cmp	r2, r3
80023bb0:	31a03002 	movcc	r3, r2
80023bb4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        memmove(dst, bp->data + off % BSIZE, m);
80023bb8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80023bbc:	e2832018 	add	r2, r3, #24
80023bc0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023bc4:	e1a03b83 	lsl	r3, r3, #23
80023bc8:	e1a03ba3 	lsr	r3, r3, #23
80023bcc:	e0823003 	add	r3, r2, r3
80023bd0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
80023bd4:	e1a01003 	mov	r1, r3
80023bd8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80023bdc:	ebfff17d 	bl	800201d8 <memmove>
        brelse(bp);
80023be0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80023be4:	ebfff429 	bl	80020c90 <brelse>

    if (off + n > ip->size) {
        n = ip->size - off;
    }

    for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80023be8:	e51b2010 	ldr	r2, [fp, #-16]
80023bec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023bf0:	e0823003 	add	r3, r2, r3
80023bf4:	e50b3010 	str	r3, [fp, #-16]
80023bf8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80023bfc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023c00:	e0823003 	add	r3, r2, r3
80023c04:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
80023c08:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
80023c0c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023c10:	e0823003 	add	r3, r2, r3
80023c14:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
80023c18:	e51b2010 	ldr	r2, [fp, #-16]
80023c1c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80023c20:	e1520003 	cmp	r2, r3
80023c24:	3affffcd 	bcc	80023b60 <readi+0x120>
        m = min(n - tot, BSIZE - off%BSIZE);
        memmove(dst, bp->data + off % BSIZE, m);
        brelse(bp);
    }

    return n;
80023c28:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
}
80023c2c:	e1a00003 	mov	r0, r3
80023c30:	e24bd008 	sub	sp, fp, #8
80023c34:	e8bd8810 	pop	{r4, fp, pc}

80023c38 <writei>:

// PAGEBREAK!
// Write data to inode.
int writei (struct inode *ip, char *src, uint off, uint n)
{
80023c38:	e92d4810 	push	{r4, fp, lr}
80023c3c:	e28db008 	add	fp, sp, #8
80023c40:	e24dd024 	sub	sp, sp, #36	; 0x24
80023c44:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
80023c48:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
80023c4c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
80023c50:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    uint tot, m;
    struct buf *bp;

    if (ip->type == T_DEV) {
80023c54:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023c58:	e1d331b0 	ldrh	r3, [r3, #16]
80023c5c:	e6bf3073 	sxth	r3, r3
80023c60:	e3530003 	cmp	r3, #3
80023c64:	1a000029 	bne	80023d10 <writei+0xd8>
        if (ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write) {
80023c68:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023c6c:	e1d331b2 	ldrh	r3, [r3, #18]
80023c70:	e6bf3073 	sxth	r3, r3
80023c74:	e3530000 	cmp	r3, #0
80023c78:	ba000011 	blt	80023cc4 <writei+0x8c>
80023c7c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023c80:	e1d331b2 	ldrh	r3, [r3, #18]
80023c84:	e6bf3073 	sxth	r3, r3
80023c88:	e3530009 	cmp	r3, #9
80023c8c:	ca00000c 	bgt	80023cc4 <writei+0x8c>
80023c90:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023c94:	e1d331b2 	ldrh	r3, [r3, #18]
80023c98:	e6bf2073 	sxth	r2, r3
80023c9c:	e30d3488 	movw	r3, #54408	; 0xd488
80023ca0:	e348300a 	movt	r3, #32778	; 0x800a
80023ca4:	e3a01004 	mov	r1, #4
80023ca8:	e1a02182 	lsl	r2, r2, #3
80023cac:	e0832002 	add	r2, r3, r2
80023cb0:	e1a03001 	mov	r3, r1
80023cb4:	e0823003 	add	r3, r2, r3
80023cb8:	e5933000 	ldr	r3, [r3]
80023cbc:	e3530000 	cmp	r3, #0
80023cc0:	1a000001 	bne	80023ccc <writei+0x94>
            return -1;
80023cc4:	e3e03000 	mvn	r3, #0
80023cc8:	ea000069 	b	80023e74 <writei+0x23c>
        }

        return devsw[ip->major].write(ip, src, n);
80023ccc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023cd0:	e1d331b2 	ldrh	r3, [r3, #18]
80023cd4:	e6bf2073 	sxth	r2, r3
80023cd8:	e30d3488 	movw	r3, #54408	; 0xd488
80023cdc:	e348300a 	movt	r3, #32778	; 0x800a
80023ce0:	e3a01004 	mov	r1, #4
80023ce4:	e1a02182 	lsl	r2, r2, #3
80023ce8:	e0832002 	add	r2, r3, r2
80023cec:	e1a03001 	mov	r3, r1
80023cf0:	e0823003 	add	r3, r2, r3
80023cf4:	e5933000 	ldr	r3, [r3]
80023cf8:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
80023cfc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80023d00:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
80023d04:	e12fff33 	blx	r3
80023d08:	e1a03000 	mov	r3, r0
80023d0c:	ea000058 	b	80023e74 <writei+0x23c>
    }

    if (off > ip->size || off + n < off) {
80023d10:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023d14:	e5932018 	ldr	r2, [r3, #24]
80023d18:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023d1c:	e1520003 	cmp	r2, r3
80023d20:	3a000005 	bcc	80023d3c <writei+0x104>
80023d24:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80023d28:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80023d2c:	e0822003 	add	r2, r2, r3
80023d30:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023d34:	e1520003 	cmp	r2, r3
80023d38:	2a000001 	bcs	80023d44 <writei+0x10c>
        return -1;
80023d3c:	e3e03000 	mvn	r3, #0
80023d40:	ea00004b 	b	80023e74 <writei+0x23c>
    }

    if (off + n > MAXFILE * BSIZE) {
80023d44:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80023d48:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80023d4c:	e0823003 	add	r3, r2, r3
80023d50:	e3530b46 	cmp	r3, #71680	; 0x11800
80023d54:	9a000001 	bls	80023d60 <writei+0x128>
        return -1;
80023d58:	e3e03000 	mvn	r3, #0
80023d5c:	ea000044 	b	80023e74 <writei+0x23c>
    }

    for (tot = 0; tot < n; tot += m, off += m, src += m) {
80023d60:	e3a03000 	mov	r3, #0
80023d64:	e50b3010 	str	r3, [fp, #-16]
80023d68:	ea00002f 	b	80023e2c <writei+0x1f4>
        bp = bread(ip->dev, bmap(ip, off / BSIZE));
80023d6c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023d70:	e5934000 	ldr	r4, [r3]
80023d74:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023d78:	e1a034a3 	lsr	r3, r3, #9
80023d7c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80023d80:	e1a01003 	mov	r1, r3
80023d84:	ebfffe3e 	bl	80023684 <bmap>
80023d88:	e1a03000 	mov	r3, r0
80023d8c:	e1a00004 	mov	r0, r4
80023d90:	e1a01003 	mov	r1, r3
80023d94:	ebfff394 	bl	80020bec <bread>
80023d98:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
        m = min(n - tot, BSIZE - off%BSIZE);
80023d9c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023da0:	e1a03b83 	lsl	r3, r3, #23
80023da4:	e1a03ba3 	lsr	r3, r3, #23
80023da8:	e2632c02 	rsb	r2, r3, #512	; 0x200
80023dac:	e51b102c 	ldr	r1, [fp, #-44]	; 0xffffffd4
80023db0:	e51b3010 	ldr	r3, [fp, #-16]
80023db4:	e0633001 	rsb	r3, r3, r1
80023db8:	e1520003 	cmp	r2, r3
80023dbc:	31a03002 	movcc	r3, r2
80023dc0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        memmove(bp->data + off % BSIZE, src, m);
80023dc4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80023dc8:	e2832018 	add	r2, r3, #24
80023dcc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023dd0:	e1a03b83 	lsl	r3, r3, #23
80023dd4:	e1a03ba3 	lsr	r3, r3, #23
80023dd8:	e0823003 	add	r3, r2, r3
80023ddc:	e1a00003 	mov	r0, r3
80023de0:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
80023de4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80023de8:	ebfff0fa 	bl	800201d8 <memmove>
        log_write(bp);
80023dec:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80023df0:	eb000276 	bl	800247d0 <log_write>
        brelse(bp);
80023df4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80023df8:	ebfff3a4 	bl	80020c90 <brelse>

    if (off + n > MAXFILE * BSIZE) {
        return -1;
    }

    for (tot = 0; tot < n; tot += m, off += m, src += m) {
80023dfc:	e51b2010 	ldr	r2, [fp, #-16]
80023e00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023e04:	e0823003 	add	r3, r2, r3
80023e08:	e50b3010 	str	r3, [fp, #-16]
80023e0c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80023e10:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023e14:	e0823003 	add	r3, r2, r3
80023e18:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
80023e1c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
80023e20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80023e24:	e0823003 	add	r3, r2, r3
80023e28:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
80023e2c:	e51b2010 	ldr	r2, [fp, #-16]
80023e30:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80023e34:	e1520003 	cmp	r2, r3
80023e38:	3affffcb 	bcc	80023d6c <writei+0x134>
        memmove(bp->data + off % BSIZE, src, m);
        log_write(bp);
        brelse(bp);
    }

    if (n > 0 && off > ip->size) {
80023e3c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80023e40:	e3530000 	cmp	r3, #0
80023e44:	0a000009 	beq	80023e70 <writei+0x238>
80023e48:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023e4c:	e5932018 	ldr	r2, [r3, #24]
80023e50:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023e54:	e1520003 	cmp	r2, r3
80023e58:	2a000004 	bcs	80023e70 <writei+0x238>
        ip->size = off;
80023e5c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023e60:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
80023e64:	e5832018 	str	r2, [r3, #24]
        iupdate(ip);
80023e68:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80023e6c:	ebfffc96 	bl	800230cc <iupdate>
    }

    return n;
80023e70:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
}
80023e74:	e1a00003 	mov	r0, r3
80023e78:	e24bd008 	sub	sp, fp, #8
80023e7c:	e8bd8810 	pop	{r4, fp, pc}

80023e80 <namecmp>:

//PAGEBREAK!
// Directories

int namecmp (const char *s, const char *t)
{
80023e80:	e92d4800 	push	{fp, lr}
80023e84:	e28db004 	add	fp, sp, #4
80023e88:	e24dd008 	sub	sp, sp, #8
80023e8c:	e50b0008 	str	r0, [fp, #-8]
80023e90:	e50b100c 	str	r1, [fp, #-12]
    return strncmp(s, t, DIRSIZ);
80023e94:	e51b0008 	ldr	r0, [fp, #-8]
80023e98:	e51b100c 	ldr	r1, [fp, #-12]
80023e9c:	e3a0200e 	mov	r2, #14
80023ea0:	ebfff127 	bl	80020344 <strncmp>
80023ea4:	e1a03000 	mov	r3, r0
}
80023ea8:	e1a00003 	mov	r0, r3
80023eac:	e24bd004 	sub	sp, fp, #4
80023eb0:	e8bd8800 	pop	{fp, pc}

80023eb4 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode* dirlookup (struct inode *dp, char *name, uint *poff)
{
80023eb4:	e92d4800 	push	{fp, lr}
80023eb8:	e28db004 	add	fp, sp, #4
80023ebc:	e24dd028 	sub	sp, sp, #40	; 0x28
80023ec0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
80023ec4:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
80023ec8:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    uint off, inum;
    struct dirent de;

    if (dp->type != T_DIR) {
80023ecc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023ed0:	e1d331b0 	ldrh	r3, [r3, #16]
80023ed4:	e6bf3073 	sxth	r3, r3
80023ed8:	e3530001 	cmp	r3, #1
80023edc:	0a000002 	beq	80023eec <dirlookup+0x38>
        panic("dirlookup not DIR");
80023ee0:	e3090db8 	movw	r0, #40376	; 0x9db8
80023ee4:	e3480002 	movt	r0, #32770	; 0x8002
80023ee8:	ebfff733 	bl	80021bbc <panic>
    }

    for (off = 0; off < dp->size; off += sizeof(de)) {
80023eec:	e3a03000 	mov	r3, #0
80023ef0:	e50b3008 	str	r3, [fp, #-8]
80023ef4:	ea000029 	b	80023fa0 <dirlookup+0xec>
        if (readi(dp, (char*) &de, off, sizeof(de)) != sizeof(de)) {
80023ef8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80023efc:	e24b301c 	sub	r3, fp, #28
80023f00:	e1a01003 	mov	r1, r3
80023f04:	e51b2008 	ldr	r2, [fp, #-8]
80023f08:	e3a03010 	mov	r3, #16
80023f0c:	ebfffecb 	bl	80023a40 <readi>
80023f10:	e1a03000 	mov	r3, r0
80023f14:	e3530010 	cmp	r3, #16
80023f18:	0a000002 	beq	80023f28 <dirlookup+0x74>
            panic("dirlink read");
80023f1c:	e3090dcc 	movw	r0, #40396	; 0x9dcc
80023f20:	e3480002 	movt	r0, #32770	; 0x8002
80023f24:	ebfff724 	bl	80021bbc <panic>
        }

        if (de.inum == 0) {
80023f28:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
80023f2c:	e3530000 	cmp	r3, #0
80023f30:	0a000016 	beq	80023f90 <dirlookup+0xdc>
            continue;
        }

        if (namecmp(name, de.name) == 0) {
80023f34:	e24b301c 	sub	r3, fp, #28
80023f38:	e2833002 	add	r3, r3, #2
80023f3c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
80023f40:	e1a01003 	mov	r1, r3
80023f44:	ebffffcd 	bl	80023e80 <namecmp>
80023f48:	e1a03000 	mov	r3, r0
80023f4c:	e3530000 	cmp	r3, #0
80023f50:	1a00000f 	bne	80023f94 <dirlookup+0xe0>
            // entry matches path element
            if (poff) {
80023f54:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023f58:	e3530000 	cmp	r3, #0
80023f5c:	0a000002 	beq	80023f6c <dirlookup+0xb8>
                *poff = off;
80023f60:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80023f64:	e51b2008 	ldr	r2, [fp, #-8]
80023f68:	e5832000 	str	r2, [r3]
            }

            inum = de.inum;
80023f6c:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
80023f70:	e50b300c 	str	r3, [fp, #-12]
            return iget(dp->dev, inum);
80023f74:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023f78:	e5933000 	ldr	r3, [r3]
80023f7c:	e1a00003 	mov	r0, r3
80023f80:	e51b100c 	ldr	r1, [fp, #-12]
80023f84:	ebfffc88 	bl	800231ac <iget>
80023f88:	e1a03000 	mov	r3, r0
80023f8c:	ea000009 	b	80023fb8 <dirlookup+0x104>
        if (readi(dp, (char*) &de, off, sizeof(de)) != sizeof(de)) {
            panic("dirlink read");
        }

        if (de.inum == 0) {
            continue;
80023f90:	e1a00000 	nop			; (mov r0, r0)

    if (dp->type != T_DIR) {
        panic("dirlookup not DIR");
    }

    for (off = 0; off < dp->size; off += sizeof(de)) {
80023f94:	e51b3008 	ldr	r3, [fp, #-8]
80023f98:	e2833010 	add	r3, r3, #16
80023f9c:	e50b3008 	str	r3, [fp, #-8]
80023fa0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80023fa4:	e5932018 	ldr	r2, [r3, #24]
80023fa8:	e51b3008 	ldr	r3, [fp, #-8]
80023fac:	e1520003 	cmp	r2, r3
80023fb0:	8affffd0 	bhi	80023ef8 <dirlookup+0x44>
            inum = de.inum;
            return iget(dp->dev, inum);
        }
    }

    return 0;
80023fb4:	e3a03000 	mov	r3, #0
}
80023fb8:	e1a00003 	mov	r0, r3
80023fbc:	e24bd004 	sub	sp, fp, #4
80023fc0:	e8bd8800 	pop	{fp, pc}

80023fc4 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int dirlink (struct inode *dp, char *name, uint inum)
{
80023fc4:	e92d4800 	push	{fp, lr}
80023fc8:	e28db004 	add	fp, sp, #4
80023fcc:	e24dd028 	sub	sp, sp, #40	; 0x28
80023fd0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
80023fd4:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
80023fd8:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    int off;
    struct dirent de;
    struct inode *ip;

    // Check that name is not present.
    if ((ip = dirlookup(dp, name, 0)) != 0) {
80023fdc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80023fe0:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
80023fe4:	e3a02000 	mov	r2, #0
80023fe8:	ebffffb1 	bl	80023eb4 <dirlookup>
80023fec:	e50b000c 	str	r0, [fp, #-12]
80023ff0:	e51b300c 	ldr	r3, [fp, #-12]
80023ff4:	e3530000 	cmp	r3, #0
80023ff8:	0a000003 	beq	8002400c <dirlink+0x48>
        iput(ip);
80023ffc:	e51b000c 	ldr	r0, [fp, #-12]
80024000:	ebfffd57 	bl	80023564 <iput>
        return -1;
80024004:	e3e03000 	mvn	r3, #0
80024008:	ea000033 	b	800240dc <dirlink+0x118>
    }

    // Look for an empty dirent.
    for (off = 0; off < dp->size; off += sizeof(de)) {
8002400c:	e3a03000 	mov	r3, #0
80024010:	e50b3008 	str	r3, [fp, #-8]
80024014:	ea000012 	b	80024064 <dirlink+0xa0>
        if (readi(dp, (char*) &de, off, sizeof(de)) != sizeof(de)) {
80024018:	e51b3008 	ldr	r3, [fp, #-8]
8002401c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80024020:	e24b201c 	sub	r2, fp, #28
80024024:	e1a01002 	mov	r1, r2
80024028:	e1a02003 	mov	r2, r3
8002402c:	e3a03010 	mov	r3, #16
80024030:	ebfffe82 	bl	80023a40 <readi>
80024034:	e1a03000 	mov	r3, r0
80024038:	e3530010 	cmp	r3, #16
8002403c:	0a000002 	beq	8002404c <dirlink+0x88>
            panic("dirlink read");
80024040:	e3090dcc 	movw	r0, #40396	; 0x9dcc
80024044:	e3480002 	movt	r0, #32770	; 0x8002
80024048:	ebfff6db 	bl	80021bbc <panic>
        }

        if (de.inum == 0) {
8002404c:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
80024050:	e3530000 	cmp	r3, #0
80024054:	0a000008 	beq	8002407c <dirlink+0xb8>
        iput(ip);
        return -1;
    }

    // Look for an empty dirent.
    for (off = 0; off < dp->size; off += sizeof(de)) {
80024058:	e51b3008 	ldr	r3, [fp, #-8]
8002405c:	e2833010 	add	r3, r3, #16
80024060:	e50b3008 	str	r3, [fp, #-8]
80024064:	e51b2008 	ldr	r2, [fp, #-8]
80024068:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002406c:	e5933018 	ldr	r3, [r3, #24]
80024070:	e1520003 	cmp	r2, r3
80024074:	3affffe7 	bcc	80024018 <dirlink+0x54>
80024078:	ea000000 	b	80024080 <dirlink+0xbc>
        if (readi(dp, (char*) &de, off, sizeof(de)) != sizeof(de)) {
            panic("dirlink read");
        }

        if (de.inum == 0) {
            break;
8002407c:	e1a00000 	nop			; (mov r0, r0)
        }
    }

    strncpy(de.name, name, DIRSIZ);
80024080:	e24b301c 	sub	r3, fp, #28
80024084:	e2833002 	add	r3, r3, #2
80024088:	e1a00003 	mov	r0, r3
8002408c:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
80024090:	e3a0200e 	mov	r2, #14
80024094:	ebfff0d6 	bl	800203f4 <strncpy>
    de.inum = inum;
80024098:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
8002409c:	e6ff3073 	uxth	r3, r3
800240a0:	e14b31bc 	strh	r3, [fp, #-28]	; 0xffffffe4

    if (writei(dp, (char*) &de, off, sizeof(de)) != sizeof(de)) {
800240a4:	e51b3008 	ldr	r3, [fp, #-8]
800240a8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
800240ac:	e24b201c 	sub	r2, fp, #28
800240b0:	e1a01002 	mov	r1, r2
800240b4:	e1a02003 	mov	r2, r3
800240b8:	e3a03010 	mov	r3, #16
800240bc:	ebfffedd 	bl	80023c38 <writei>
800240c0:	e1a03000 	mov	r3, r0
800240c4:	e3530010 	cmp	r3, #16
800240c8:	0a000002 	beq	800240d8 <dirlink+0x114>
        panic("dirlink");
800240cc:	e3090ddc 	movw	r0, #40412	; 0x9ddc
800240d0:	e3480002 	movt	r0, #32770	; 0x8002
800240d4:	ebfff6b8 	bl	80021bbc <panic>
    }

    return 0;
800240d8:	e3a03000 	mov	r3, #0
}
800240dc:	e1a00003 	mov	r0, r3
800240e0:	e24bd004 	sub	sp, fp, #4
800240e4:	e8bd8800 	pop	{fp, pc}

800240e8 <skipelem>:
//   skipelem("///a//bb", name) = "bb", setting name = "a"
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char* skipelem (char *path, char *name)
{
800240e8:	e92d4800 	push	{fp, lr}
800240ec:	e28db004 	add	fp, sp, #4
800240f0:	e24dd010 	sub	sp, sp, #16
800240f4:	e50b0010 	str	r0, [fp, #-16]
800240f8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *s;
    int len;

    while (*path == '/') {
800240fc:	ea000002 	b	8002410c <skipelem+0x24>
        path++;
80024100:	e51b3010 	ldr	r3, [fp, #-16]
80024104:	e2833001 	add	r3, r3, #1
80024108:	e50b3010 	str	r3, [fp, #-16]
static char* skipelem (char *path, char *name)
{
    char *s;
    int len;

    while (*path == '/') {
8002410c:	e51b3010 	ldr	r3, [fp, #-16]
80024110:	e5d33000 	ldrb	r3, [r3]
80024114:	e353002f 	cmp	r3, #47	; 0x2f
80024118:	0afffff8 	beq	80024100 <skipelem+0x18>
        path++;
    }

    if (*path == 0) {
8002411c:	e51b3010 	ldr	r3, [fp, #-16]
80024120:	e5d33000 	ldrb	r3, [r3]
80024124:	e3530000 	cmp	r3, #0
80024128:	1a000001 	bne	80024134 <skipelem+0x4c>
        return 0;
8002412c:	e3a03000 	mov	r3, #0
80024130:	ea00002c 	b	800241e8 <skipelem+0x100>
    }

    s = path;
80024134:	e51b3010 	ldr	r3, [fp, #-16]
80024138:	e50b3008 	str	r3, [fp, #-8]

    while (*path != '/' && *path != 0) {
8002413c:	ea000002 	b	8002414c <skipelem+0x64>
        path++;
80024140:	e51b3010 	ldr	r3, [fp, #-16]
80024144:	e2833001 	add	r3, r3, #1
80024148:	e50b3010 	str	r3, [fp, #-16]
        return 0;
    }

    s = path;

    while (*path != '/' && *path != 0) {
8002414c:	e51b3010 	ldr	r3, [fp, #-16]
80024150:	e5d33000 	ldrb	r3, [r3]
80024154:	e353002f 	cmp	r3, #47	; 0x2f
80024158:	0a000003 	beq	8002416c <skipelem+0x84>
8002415c:	e51b3010 	ldr	r3, [fp, #-16]
80024160:	e5d33000 	ldrb	r3, [r3]
80024164:	e3530000 	cmp	r3, #0
80024168:	1afffff4 	bne	80024140 <skipelem+0x58>
        path++;
    }

    len = path - s;
8002416c:	e51b2010 	ldr	r2, [fp, #-16]
80024170:	e51b3008 	ldr	r3, [fp, #-8]
80024174:	e0633002 	rsb	r3, r3, r2
80024178:	e50b300c 	str	r3, [fp, #-12]

    if (len >= DIRSIZ) {
8002417c:	e51b300c 	ldr	r3, [fp, #-12]
80024180:	e353000d 	cmp	r3, #13
80024184:	da000004 	ble	8002419c <skipelem+0xb4>
        memmove(name, s, DIRSIZ);
80024188:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
8002418c:	e51b1008 	ldr	r1, [fp, #-8]
80024190:	e3a0200e 	mov	r2, #14
80024194:	ebfff00f 	bl	800201d8 <memmove>
    } else {
        memmove(name, s, len);
        name[len] = 0;
    }

    while (*path == '/') {
80024198:	ea00000d 	b	800241d4 <skipelem+0xec>
    len = path - s;

    if (len >= DIRSIZ) {
        memmove(name, s, DIRSIZ);
    } else {
        memmove(name, s, len);
8002419c:	e51b300c 	ldr	r3, [fp, #-12]
800241a0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800241a4:	e51b1008 	ldr	r1, [fp, #-8]
800241a8:	e1a02003 	mov	r2, r3
800241ac:	ebfff009 	bl	800201d8 <memmove>
        name[len] = 0;
800241b0:	e51b300c 	ldr	r3, [fp, #-12]
800241b4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800241b8:	e0823003 	add	r3, r2, r3
800241bc:	e3a02000 	mov	r2, #0
800241c0:	e5c32000 	strb	r2, [r3]
    }

    while (*path == '/') {
800241c4:	ea000002 	b	800241d4 <skipelem+0xec>
        path++;
800241c8:	e51b3010 	ldr	r3, [fp, #-16]
800241cc:	e2833001 	add	r3, r3, #1
800241d0:	e50b3010 	str	r3, [fp, #-16]
    } else {
        memmove(name, s, len);
        name[len] = 0;
    }

    while (*path == '/') {
800241d4:	e51b3010 	ldr	r3, [fp, #-16]
800241d8:	e5d33000 	ldrb	r3, [r3]
800241dc:	e353002f 	cmp	r3, #47	; 0x2f
800241e0:	0afffff8 	beq	800241c8 <skipelem+0xe0>
        path++;
    }

    return path;
800241e4:	e51b3010 	ldr	r3, [fp, #-16]
}
800241e8:	e1a00003 	mov	r0, r3
800241ec:	e24bd004 	sub	sp, fp, #4
800241f0:	e8bd8800 	pop	{fp, pc}

800241f4 <namex>:

// Look up and return the inode for a path name.
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
static struct inode* namex (char *path, int nameiparent, char *name)
{
800241f4:	e92d4800 	push	{fp, lr}
800241f8:	e28db004 	add	fp, sp, #4
800241fc:	e24dd018 	sub	sp, sp, #24
80024200:	e50b0010 	str	r0, [fp, #-16]
80024204:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80024208:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    struct inode *ip, *next;

    if (*path == '/') {
8002420c:	e51b3010 	ldr	r3, [fp, #-16]
80024210:	e5d33000 	ldrb	r3, [r3]
80024214:	e353002f 	cmp	r3, #47	; 0x2f
80024218:	1a000004 	bne	80024230 <namex+0x3c>
        ip = iget(ROOTDEV, ROOTINO);
8002421c:	e3a00001 	mov	r0, #1
80024220:	e3a01001 	mov	r1, #1
80024224:	ebfffbe0 	bl	800231ac <iget>
80024228:	e50b0008 	str	r0, [fp, #-8]
    } else {
        ip = idup(proc->cwd);
    }

    while ((path = skipelem(path, name)) != 0) {
8002422c:	ea00002d 	b	800242e8 <namex+0xf4>
    struct inode *ip, *next;

    if (*path == '/') {
        ip = iget(ROOTDEV, ROOTINO);
    } else {
        ip = idup(proc->cwd);
80024230:	e30e360c 	movw	r3, #58892	; 0xe60c
80024234:	e348300a 	movt	r3, #32778	; 0x800a
80024238:	e5933000 	ldr	r3, [r3]
8002423c:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
80024240:	e1a00003 	mov	r0, r3
80024244:	ebfffc2a 	bl	800232f4 <idup>
80024248:	e50b0008 	str	r0, [fp, #-8]
    }

    while ((path = skipelem(path, name)) != 0) {
8002424c:	ea000025 	b	800242e8 <namex+0xf4>
        ilock(ip);
80024250:	e51b0008 	ldr	r0, [fp, #-8]
80024254:	ebfffc39 	bl	80023340 <ilock>

        if (ip->type != T_DIR) {
80024258:	e51b3008 	ldr	r3, [fp, #-8]
8002425c:	e1d331b0 	ldrh	r3, [r3, #16]
80024260:	e6bf3073 	sxth	r3, r3
80024264:	e3530001 	cmp	r3, #1
80024268:	0a000003 	beq	8002427c <namex+0x88>
            iunlockput(ip);
8002426c:	e51b0008 	ldr	r0, [fp, #-8]
80024270:	ebfffcf9 	bl	8002365c <iunlockput>
            return 0;
80024274:	e3a03000 	mov	r3, #0
80024278:	ea000029 	b	80024324 <namex+0x130>
        }

        if (nameiparent && *path == '\0') {
8002427c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024280:	e3530000 	cmp	r3, #0
80024284:	0a000007 	beq	800242a8 <namex+0xb4>
80024288:	e51b3010 	ldr	r3, [fp, #-16]
8002428c:	e5d33000 	ldrb	r3, [r3]
80024290:	e3530000 	cmp	r3, #0
80024294:	1a000003 	bne	800242a8 <namex+0xb4>
            // Stop one level early.
            iunlock(ip);
80024298:	e51b0008 	ldr	r0, [fp, #-8]
8002429c:	ebfffc8e 	bl	800234dc <iunlock>
            return ip;
800242a0:	e51b3008 	ldr	r3, [fp, #-8]
800242a4:	ea00001e 	b	80024324 <namex+0x130>
        }

        if ((next = dirlookup(ip, name, 0)) == 0) {
800242a8:	e51b0008 	ldr	r0, [fp, #-8]
800242ac:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
800242b0:	e3a02000 	mov	r2, #0
800242b4:	ebfffefe 	bl	80023eb4 <dirlookup>
800242b8:	e50b000c 	str	r0, [fp, #-12]
800242bc:	e51b300c 	ldr	r3, [fp, #-12]
800242c0:	e3530000 	cmp	r3, #0
800242c4:	1a000003 	bne	800242d8 <namex+0xe4>
            iunlockput(ip);
800242c8:	e51b0008 	ldr	r0, [fp, #-8]
800242cc:	ebfffce2 	bl	8002365c <iunlockput>
            return 0;
800242d0:	e3a03000 	mov	r3, #0
800242d4:	ea000012 	b	80024324 <namex+0x130>
        }

        iunlockput(ip);
800242d8:	e51b0008 	ldr	r0, [fp, #-8]
800242dc:	ebfffcde 	bl	8002365c <iunlockput>
        ip = next;
800242e0:	e51b300c 	ldr	r3, [fp, #-12]
800242e4:	e50b3008 	str	r3, [fp, #-8]
        ip = iget(ROOTDEV, ROOTINO);
    } else {
        ip = idup(proc->cwd);
    }

    while ((path = skipelem(path, name)) != 0) {
800242e8:	e51b0010 	ldr	r0, [fp, #-16]
800242ec:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
800242f0:	ebffff7c 	bl	800240e8 <skipelem>
800242f4:	e50b0010 	str	r0, [fp, #-16]
800242f8:	e51b3010 	ldr	r3, [fp, #-16]
800242fc:	e3530000 	cmp	r3, #0
80024300:	1affffd2 	bne	80024250 <namex+0x5c>

        iunlockput(ip);
        ip = next;
    }

    if (nameiparent) {
80024304:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024308:	e3530000 	cmp	r3, #0
8002430c:	0a000003 	beq	80024320 <namex+0x12c>
        iput(ip);
80024310:	e51b0008 	ldr	r0, [fp, #-8]
80024314:	ebfffc92 	bl	80023564 <iput>
        return 0;
80024318:	e3a03000 	mov	r3, #0
8002431c:	ea000000 	b	80024324 <namex+0x130>
    }

    return ip;
80024320:	e51b3008 	ldr	r3, [fp, #-8]
}
80024324:	e1a00003 	mov	r0, r3
80024328:	e24bd004 	sub	sp, fp, #4
8002432c:	e8bd8800 	pop	{fp, pc}

80024330 <namei>:

struct inode* namei (char *path)
{
80024330:	e92d4800 	push	{fp, lr}
80024334:	e28db004 	add	fp, sp, #4
80024338:	e24dd018 	sub	sp, sp, #24
8002433c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    char name[DIRSIZ];
    return namex(path, 0, name);
80024340:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80024344:	e3a01000 	mov	r1, #0
80024348:	e24b3014 	sub	r3, fp, #20
8002434c:	e1a02003 	mov	r2, r3
80024350:	ebffffa7 	bl	800241f4 <namex>
80024354:	e1a03000 	mov	r3, r0
}
80024358:	e1a00003 	mov	r0, r3
8002435c:	e24bd004 	sub	sp, fp, #4
80024360:	e8bd8800 	pop	{fp, pc}

80024364 <nameiparent>:

struct inode* nameiparent (char *path, char *name)
{
80024364:	e92d4800 	push	{fp, lr}
80024368:	e28db004 	add	fp, sp, #4
8002436c:	e24dd008 	sub	sp, sp, #8
80024370:	e50b0008 	str	r0, [fp, #-8]
80024374:	e50b100c 	str	r1, [fp, #-12]
    return namex(path, 1, name);
80024378:	e51b0008 	ldr	r0, [fp, #-8]
8002437c:	e3a01001 	mov	r1, #1
80024380:	e51b200c 	ldr	r2, [fp, #-12]
80024384:	ebffff9a 	bl	800241f4 <namex>
80024388:	e1a03000 	mov	r3, r0
}
8002438c:	e1a00003 	mov	r0, r3
80024390:	e24bd004 	sub	sp, fp, #4
80024394:	e8bd8800 	pop	{fp, pc}

80024398 <initlog>:
struct log log;

static void recover_from_log(void);

void initlog(void)
{
80024398:	e92d4800 	push	{fp, lr}
8002439c:	e28db004 	add	fp, sp, #4
800243a0:	e24dd010 	sub	sp, sp, #16

    if (sizeof(struct logheader) >= BSIZE) {
        panic("initlog: too big logheader");
    }

    initlock(&log.lock, "log");
800243a4:	e30e04ac 	movw	r0, #58540	; 0xe4ac
800243a8:	e348000a 	movt	r0, #32778	; 0x800a
800243ac:	e3091de4 	movw	r1, #40420	; 0x9de4
800243b0:	e3481002 	movt	r1, #32770	; 0x8002
800243b4:	eb000723 	bl	80026048 <initlock>
    readsb(ROOTDEV, &sb);
800243b8:	e3a00001 	mov	r0, #1
800243bc:	e24b3014 	sub	r3, fp, #20
800243c0:	e1a01003 	mov	r1, r3
800243c4:	ebfffa00 	bl	80022bcc <readsb>
    log.start = sb.size - sb.nlog;
800243c8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
800243cc:	e51b3008 	ldr	r3, [fp, #-8]
800243d0:	e0633002 	rsb	r3, r3, r2
800243d4:	e1a02003 	mov	r2, r3
800243d8:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800243dc:	e348300a 	movt	r3, #32778	; 0x800a
800243e0:	e5832034 	str	r2, [r3, #52]	; 0x34
    log.size = sb.nlog;
800243e4:	e51b3008 	ldr	r3, [fp, #-8]
800243e8:	e1a02003 	mov	r2, r3
800243ec:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800243f0:	e348300a 	movt	r3, #32778	; 0x800a
800243f4:	e5832038 	str	r2, [r3, #56]	; 0x38
    log.dev = ROOTDEV;
800243f8:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800243fc:	e348300a 	movt	r3, #32778	; 0x800a
80024400:	e3a02001 	mov	r2, #1
80024404:	e5832040 	str	r2, [r3, #64]	; 0x40
    recover_from_log();
80024408:	eb0000b2 	bl	800246d8 <recover_from_log>
}
8002440c:	e24bd004 	sub	sp, fp, #4
80024410:	e8bd8800 	pop	{fp, pc}

80024414 <install_trans>:

// Copy committed blocks from log to their home location
static void install_trans(void)
{
80024414:	e92d4800 	push	{fp, lr}
80024418:	e28db004 	add	fp, sp, #4
8002441c:	e24dd010 	sub	sp, sp, #16
    int tail;
    struct buf *lbuf;
    struct buf *dbuf;

    for (tail = 0; tail < log.lh.n; tail++) {
80024420:	e3a03000 	mov	r3, #0
80024424:	e50b3008 	str	r3, [fp, #-8]
80024428:	ea000030 	b	800244f0 <install_trans+0xdc>
        lbuf = bread(log.dev, log.start+tail+1); // read log block
8002442c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024430:	e348300a 	movt	r3, #32778	; 0x800a
80024434:	e5933040 	ldr	r3, [r3, #64]	; 0x40
80024438:	e1a02003 	mov	r2, r3
8002443c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024440:	e348300a 	movt	r3, #32778	; 0x800a
80024444:	e5931034 	ldr	r1, [r3, #52]	; 0x34
80024448:	e51b3008 	ldr	r3, [fp, #-8]
8002444c:	e0813003 	add	r3, r1, r3
80024450:	e2833001 	add	r3, r3, #1
80024454:	e1a00002 	mov	r0, r2
80024458:	e1a01003 	mov	r1, r3
8002445c:	ebfff1e2 	bl	80020bec <bread>
80024460:	e50b000c 	str	r0, [fp, #-12]
        dbuf = bread(log.dev, log.lh.sector[tail]); // read dst
80024464:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024468:	e348300a 	movt	r3, #32778	; 0x800a
8002446c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
80024470:	e1a02003 	mov	r2, r3
80024474:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024478:	e348300a 	movt	r3, #32778	; 0x800a
8002447c:	e51b1008 	ldr	r1, [fp, #-8]
80024480:	e2811010 	add	r1, r1, #16
80024484:	e3a00008 	mov	r0, #8
80024488:	e1a01101 	lsl	r1, r1, #2
8002448c:	e0831001 	add	r1, r3, r1
80024490:	e1a03000 	mov	r3, r0
80024494:	e0813003 	add	r3, r1, r3
80024498:	e5933000 	ldr	r3, [r3]
8002449c:	e1a00002 	mov	r0, r2
800244a0:	e1a01003 	mov	r1, r3
800244a4:	ebfff1d0 	bl	80020bec <bread>
800244a8:	e50b0010 	str	r0, [fp, #-16]

        memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
800244ac:	e51b3010 	ldr	r3, [fp, #-16]
800244b0:	e2832018 	add	r2, r3, #24
800244b4:	e51b300c 	ldr	r3, [fp, #-12]
800244b8:	e2833018 	add	r3, r3, #24
800244bc:	e1a00002 	mov	r0, r2
800244c0:	e1a01003 	mov	r1, r3
800244c4:	e3a02c02 	mov	r2, #512	; 0x200
800244c8:	ebffef42 	bl	800201d8 <memmove>

        bwrite(dbuf);  // write dst to disk
800244cc:	e51b0010 	ldr	r0, [fp, #-16]
800244d0:	ebfff1d9 	bl	80020c3c <bwrite>
        brelse(lbuf);
800244d4:	e51b000c 	ldr	r0, [fp, #-12]
800244d8:	ebfff1ec 	bl	80020c90 <brelse>
        brelse(dbuf);
800244dc:	e51b0010 	ldr	r0, [fp, #-16]
800244e0:	ebfff1ea 	bl	80020c90 <brelse>
{
    int tail;
    struct buf *lbuf;
    struct buf *dbuf;

    for (tail = 0; tail < log.lh.n; tail++) {
800244e4:	e51b3008 	ldr	r3, [fp, #-8]
800244e8:	e2833001 	add	r3, r3, #1
800244ec:	e50b3008 	str	r3, [fp, #-8]
800244f0:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800244f4:	e348300a 	movt	r3, #32778	; 0x800a
800244f8:	e5932044 	ldr	r2, [r3, #68]	; 0x44
800244fc:	e51b3008 	ldr	r3, [fp, #-8]
80024500:	e1520003 	cmp	r2, r3
80024504:	caffffc8 	bgt	8002442c <install_trans+0x18>

        bwrite(dbuf);  // write dst to disk
        brelse(lbuf);
        brelse(dbuf);
    }
}
80024508:	e24bd004 	sub	sp, fp, #4
8002450c:	e8bd8800 	pop	{fp, pc}

80024510 <read_head>:

// Read the log header from disk into the in-memory log header
static void read_head(void)
{
80024510:	e92d4800 	push	{fp, lr}
80024514:	e28db004 	add	fp, sp, #4
80024518:	e24dd010 	sub	sp, sp, #16
    struct buf *buf;
    struct logheader *lh;
    int i;

    buf = bread(log.dev, log.start);
8002451c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024520:	e348300a 	movt	r3, #32778	; 0x800a
80024524:	e5933040 	ldr	r3, [r3, #64]	; 0x40
80024528:	e1a02003 	mov	r2, r3
8002452c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024530:	e348300a 	movt	r3, #32778	; 0x800a
80024534:	e5933034 	ldr	r3, [r3, #52]	; 0x34
80024538:	e1a00002 	mov	r0, r2
8002453c:	e1a01003 	mov	r1, r3
80024540:	ebfff1a9 	bl	80020bec <bread>
80024544:	e50b000c 	str	r0, [fp, #-12]
    lh = (struct logheader *) (buf->data);
80024548:	e51b300c 	ldr	r3, [fp, #-12]
8002454c:	e2833018 	add	r3, r3, #24
80024550:	e50b3010 	str	r3, [fp, #-16]
    log.lh.n = lh->n;
80024554:	e51b3010 	ldr	r3, [fp, #-16]
80024558:	e5932000 	ldr	r2, [r3]
8002455c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024560:	e348300a 	movt	r3, #32778	; 0x800a
80024564:	e5832044 	str	r2, [r3, #68]	; 0x44

    for (i = 0; i < log.lh.n; i++) {
80024568:	e3a03000 	mov	r3, #0
8002456c:	e50b3008 	str	r3, [fp, #-8]
80024570:	ea000014 	b	800245c8 <read_head+0xb8>
        log.lh.sector[i] = lh->sector[i];
80024574:	e51b2010 	ldr	r2, [fp, #-16]
80024578:	e51b3008 	ldr	r3, [fp, #-8]
8002457c:	e3a01004 	mov	r1, #4
80024580:	e1a03103 	lsl	r3, r3, #2
80024584:	e0822003 	add	r2, r2, r3
80024588:	e1a03001 	mov	r3, r1
8002458c:	e0823003 	add	r3, r2, r3
80024590:	e5932000 	ldr	r2, [r3]
80024594:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024598:	e348300a 	movt	r3, #32778	; 0x800a
8002459c:	e51b1008 	ldr	r1, [fp, #-8]
800245a0:	e2811010 	add	r1, r1, #16
800245a4:	e3a00008 	mov	r0, #8
800245a8:	e1a01101 	lsl	r1, r1, #2
800245ac:	e0831001 	add	r1, r3, r1
800245b0:	e1a03000 	mov	r3, r0
800245b4:	e0813003 	add	r3, r1, r3
800245b8:	e5832000 	str	r2, [r3]

    buf = bread(log.dev, log.start);
    lh = (struct logheader *) (buf->data);
    log.lh.n = lh->n;

    for (i = 0; i < log.lh.n; i++) {
800245bc:	e51b3008 	ldr	r3, [fp, #-8]
800245c0:	e2833001 	add	r3, r3, #1
800245c4:	e50b3008 	str	r3, [fp, #-8]
800245c8:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800245cc:	e348300a 	movt	r3, #32778	; 0x800a
800245d0:	e5932044 	ldr	r2, [r3, #68]	; 0x44
800245d4:	e51b3008 	ldr	r3, [fp, #-8]
800245d8:	e1520003 	cmp	r2, r3
800245dc:	caffffe4 	bgt	80024574 <read_head+0x64>
        log.lh.sector[i] = lh->sector[i];
    }

    brelse(buf);
800245e0:	e51b000c 	ldr	r0, [fp, #-12]
800245e4:	ebfff1a9 	bl	80020c90 <brelse>
}
800245e8:	e24bd004 	sub	sp, fp, #4
800245ec:	e8bd8800 	pop	{fp, pc}

800245f0 <write_head>:

// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void write_head(void)
{
800245f0:	e92d4800 	push	{fp, lr}
800245f4:	e28db004 	add	fp, sp, #4
800245f8:	e24dd010 	sub	sp, sp, #16
    struct buf *buf;
    struct logheader *hb;
    int i;

    buf = bread(log.dev, log.start);
800245fc:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024600:	e348300a 	movt	r3, #32778	; 0x800a
80024604:	e5933040 	ldr	r3, [r3, #64]	; 0x40
80024608:	e1a02003 	mov	r2, r3
8002460c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024610:	e348300a 	movt	r3, #32778	; 0x800a
80024614:	e5933034 	ldr	r3, [r3, #52]	; 0x34
80024618:	e1a00002 	mov	r0, r2
8002461c:	e1a01003 	mov	r1, r3
80024620:	ebfff171 	bl	80020bec <bread>
80024624:	e50b000c 	str	r0, [fp, #-12]
    hb = (struct logheader *) (buf->data);
80024628:	e51b300c 	ldr	r3, [fp, #-12]
8002462c:	e2833018 	add	r3, r3, #24
80024630:	e50b3010 	str	r3, [fp, #-16]

    hb->n = log.lh.n;
80024634:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024638:	e348300a 	movt	r3, #32778	; 0x800a
8002463c:	e5932044 	ldr	r2, [r3, #68]	; 0x44
80024640:	e51b3010 	ldr	r3, [fp, #-16]
80024644:	e5832000 	str	r2, [r3]

    for (i = 0; i < log.lh.n; i++) {
80024648:	e3a03000 	mov	r3, #0
8002464c:	e50b3008 	str	r3, [fp, #-8]
80024650:	ea000014 	b	800246a8 <write_head+0xb8>
        hb->sector[i] = log.lh.sector[i];
80024654:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024658:	e348300a 	movt	r3, #32778	; 0x800a
8002465c:	e51b2008 	ldr	r2, [fp, #-8]
80024660:	e2822010 	add	r2, r2, #16
80024664:	e3a01008 	mov	r1, #8
80024668:	e1a02102 	lsl	r2, r2, #2
8002466c:	e0832002 	add	r2, r3, r2
80024670:	e1a03001 	mov	r3, r1
80024674:	e0823003 	add	r3, r2, r3
80024678:	e5932000 	ldr	r2, [r3]
8002467c:	e51b1010 	ldr	r1, [fp, #-16]
80024680:	e51b3008 	ldr	r3, [fp, #-8]
80024684:	e3a00004 	mov	r0, #4
80024688:	e1a03103 	lsl	r3, r3, #2
8002468c:	e0811003 	add	r1, r1, r3
80024690:	e1a03000 	mov	r3, r0
80024694:	e0813003 	add	r3, r1, r3
80024698:	e5832000 	str	r2, [r3]
    buf = bread(log.dev, log.start);
    hb = (struct logheader *) (buf->data);

    hb->n = log.lh.n;

    for (i = 0; i < log.lh.n; i++) {
8002469c:	e51b3008 	ldr	r3, [fp, #-8]
800246a0:	e2833001 	add	r3, r3, #1
800246a4:	e50b3008 	str	r3, [fp, #-8]
800246a8:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800246ac:	e348300a 	movt	r3, #32778	; 0x800a
800246b0:	e5932044 	ldr	r2, [r3, #68]	; 0x44
800246b4:	e51b3008 	ldr	r3, [fp, #-8]
800246b8:	e1520003 	cmp	r2, r3
800246bc:	caffffe4 	bgt	80024654 <write_head+0x64>
        hb->sector[i] = log.lh.sector[i];
    }

    bwrite(buf);
800246c0:	e51b000c 	ldr	r0, [fp, #-12]
800246c4:	ebfff15c 	bl	80020c3c <bwrite>
    brelse(buf);
800246c8:	e51b000c 	ldr	r0, [fp, #-12]
800246cc:	ebfff16f 	bl	80020c90 <brelse>
}
800246d0:	e24bd004 	sub	sp, fp, #4
800246d4:	e8bd8800 	pop	{fp, pc}

800246d8 <recover_from_log>:

static void recover_from_log(void)
{
800246d8:	e92d4800 	push	{fp, lr}
800246dc:	e28db004 	add	fp, sp, #4
    read_head();
800246e0:	ebffff8a 	bl	80024510 <read_head>
    install_trans(); // if committed, copy from log to disk
800246e4:	ebffff4a 	bl	80024414 <install_trans>
    log.lh.n = 0;
800246e8:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800246ec:	e348300a 	movt	r3, #32778	; 0x800a
800246f0:	e3a02000 	mov	r2, #0
800246f4:	e5832044 	str	r2, [r3, #68]	; 0x44
    write_head(); // clear the log
800246f8:	ebffffbc 	bl	800245f0 <write_head>
}
800246fc:	e8bd8800 	pop	{fp, pc}

80024700 <begin_trans>:

void begin_trans(void)
{
80024700:	e92d4800 	push	{fp, lr}
80024704:	e28db004 	add	fp, sp, #4
    acquire(&log.lock);
80024708:	e30e04ac 	movw	r0, #58540	; 0xe4ac
8002470c:	e348000a 	movt	r0, #32778	; 0x800a
80024710:	eb00065d 	bl	8002608c <acquire>

    while (log.busy) {
80024714:	ea000004 	b	8002472c <begin_trans+0x2c>
        sleep(&log, &log.lock);
80024718:	e30e04ac 	movw	r0, #58540	; 0xe4ac
8002471c:	e348000a 	movt	r0, #32778	; 0x800a
80024720:	e30e14ac 	movw	r1, #58540	; 0xe4ac
80024724:	e348100a 	movt	r1, #32778	; 0x800a
80024728:	eb000570 	bl	80025cf0 <sleep>

void begin_trans(void)
{
    acquire(&log.lock);

    while (log.busy) {
8002472c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024730:	e348300a 	movt	r3, #32778	; 0x800a
80024734:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
80024738:	e3530000 	cmp	r3, #0
8002473c:	1afffff5 	bne	80024718 <begin_trans+0x18>
        sleep(&log, &log.lock);
    }

    log.busy = 1;
80024740:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024744:	e348300a 	movt	r3, #32778	; 0x800a
80024748:	e3a02001 	mov	r2, #1
8002474c:	e583203c 	str	r2, [r3, #60]	; 0x3c
    release(&log.lock);
80024750:	e30e04ac 	movw	r0, #58540	; 0xe4ac
80024754:	e348000a 	movt	r0, #32778	; 0x800a
80024758:	eb000655 	bl	800260b4 <release>
}
8002475c:	e8bd8800 	pop	{fp, pc}

80024760 <commit_trans>:

void commit_trans(void)
{
80024760:	e92d4800 	push	{fp, lr}
80024764:	e28db004 	add	fp, sp, #4
    if (log.lh.n > 0) {
80024768:	e30e34ac 	movw	r3, #58540	; 0xe4ac
8002476c:	e348300a 	movt	r3, #32778	; 0x800a
80024770:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80024774:	e3530000 	cmp	r3, #0
80024778:	da000006 	ble	80024798 <commit_trans+0x38>
        write_head();    // Write header to disk -- the real commit
8002477c:	ebffff9b 	bl	800245f0 <write_head>
        install_trans(); // Now install writes to home locations
80024780:	ebffff23 	bl	80024414 <install_trans>
        log.lh.n = 0;
80024784:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024788:	e348300a 	movt	r3, #32778	; 0x800a
8002478c:	e3a02000 	mov	r2, #0
80024790:	e5832044 	str	r2, [r3, #68]	; 0x44
        write_head();    // Erase the transaction from the log
80024794:	ebffff95 	bl	800245f0 <write_head>
    }

    acquire(&log.lock);
80024798:	e30e04ac 	movw	r0, #58540	; 0xe4ac
8002479c:	e348000a 	movt	r0, #32778	; 0x800a
800247a0:	eb000639 	bl	8002608c <acquire>
    log.busy = 0;
800247a4:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800247a8:	e348300a 	movt	r3, #32778	; 0x800a
800247ac:	e3a02000 	mov	r2, #0
800247b0:	e583203c 	str	r2, [r3, #60]	; 0x3c
    wakeup(&log);
800247b4:	e30e04ac 	movw	r0, #58540	; 0xe4ac
800247b8:	e348000a 	movt	r0, #32778	; 0x800a
800247bc:	eb0005a3 	bl	80025e50 <wakeup>
    release(&log.lock);
800247c0:	e30e04ac 	movw	r0, #58540	; 0xe4ac
800247c4:	e348000a 	movt	r0, #32778	; 0x800a
800247c8:	eb000639 	bl	800260b4 <release>
}
800247cc:	e8bd8800 	pop	{fp, pc}

800247d0 <log_write>:
//   bp = bread(...)
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void log_write(struct buf *b)
{
800247d0:	e92d4800 	push	{fp, lr}
800247d4:	e28db004 	add	fp, sp, #4
800247d8:	e24dd010 	sub	sp, sp, #16
800247dc:	e50b0010 	str	r0, [fp, #-16]
    struct buf *lbuf;
    int i;

    if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1) {
800247e0:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800247e4:	e348300a 	movt	r3, #32778	; 0x800a
800247e8:	e5933044 	ldr	r3, [r3, #68]	; 0x44
800247ec:	e3530009 	cmp	r3, #9
800247f0:	ca000008 	bgt	80024818 <log_write+0x48>
800247f4:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800247f8:	e348300a 	movt	r3, #32778	; 0x800a
800247fc:	e5932044 	ldr	r2, [r3, #68]	; 0x44
80024800:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024804:	e348300a 	movt	r3, #32778	; 0x800a
80024808:	e5933038 	ldr	r3, [r3, #56]	; 0x38
8002480c:	e2433001 	sub	r3, r3, #1
80024810:	e1520003 	cmp	r2, r3
80024814:	ba000002 	blt	80024824 <log_write+0x54>
        panic("too big a transaction");
80024818:	e3090de8 	movw	r0, #40424	; 0x9de8
8002481c:	e3480002 	movt	r0, #32770	; 0x8002
80024820:	ebfff4e5 	bl	80021bbc <panic>
    }

    if (!log.busy) {
80024824:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024828:	e348300a 	movt	r3, #32778	; 0x800a
8002482c:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
80024830:	e3530000 	cmp	r3, #0
80024834:	1a000002 	bne	80024844 <log_write+0x74>
        panic("write outside of trans");
80024838:	e3090e00 	movw	r0, #40448	; 0x9e00
8002483c:	e3480002 	movt	r0, #32770	; 0x8002
80024840:	ebfff4dd 	bl	80021bbc <panic>
    }

    for (i = 0; i < log.lh.n; i++) {
80024844:	e3a03000 	mov	r3, #0
80024848:	e50b3008 	str	r3, [fp, #-8]
8002484c:	ea000011 	b	80024898 <log_write+0xc8>
        if (log.lh.sector[i] == b->sector) { // log absorbtion?
80024850:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024854:	e348300a 	movt	r3, #32778	; 0x800a
80024858:	e51b2008 	ldr	r2, [fp, #-8]
8002485c:	e2822010 	add	r2, r2, #16
80024860:	e3a01008 	mov	r1, #8
80024864:	e1a02102 	lsl	r2, r2, #2
80024868:	e0832002 	add	r2, r3, r2
8002486c:	e1a03001 	mov	r3, r1
80024870:	e0823003 	add	r3, r2, r3
80024874:	e5933000 	ldr	r3, [r3]
80024878:	e1a02003 	mov	r2, r3
8002487c:	e51b3010 	ldr	r3, [fp, #-16]
80024880:	e5933008 	ldr	r3, [r3, #8]
80024884:	e1520003 	cmp	r2, r3
80024888:	0a000009 	beq	800248b4 <log_write+0xe4>

    if (!log.busy) {
        panic("write outside of trans");
    }

    for (i = 0; i < log.lh.n; i++) {
8002488c:	e51b3008 	ldr	r3, [fp, #-8]
80024890:	e2833001 	add	r3, r3, #1
80024894:	e50b3008 	str	r3, [fp, #-8]
80024898:	e30e34ac 	movw	r3, #58540	; 0xe4ac
8002489c:	e348300a 	movt	r3, #32778	; 0x800a
800248a0:	e5932044 	ldr	r2, [r3, #68]	; 0x44
800248a4:	e51b3008 	ldr	r3, [fp, #-8]
800248a8:	e1520003 	cmp	r2, r3
800248ac:	caffffe7 	bgt	80024850 <log_write+0x80>
800248b0:	ea000000 	b	800248b8 <log_write+0xe8>
        if (log.lh.sector[i] == b->sector) { // log absorbtion?
            break;
800248b4:	e1a00000 	nop			; (mov r0, r0)
        }
    }

    log.lh.sector[i] = b->sector;
800248b8:	e51b3010 	ldr	r3, [fp, #-16]
800248bc:	e5933008 	ldr	r3, [r3, #8]
800248c0:	e1a02003 	mov	r2, r3
800248c4:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800248c8:	e348300a 	movt	r3, #32778	; 0x800a
800248cc:	e51b1008 	ldr	r1, [fp, #-8]
800248d0:	e2811010 	add	r1, r1, #16
800248d4:	e3a00008 	mov	r0, #8
800248d8:	e1a01101 	lsl	r1, r1, #2
800248dc:	e0831001 	add	r1, r3, r1
800248e0:	e1a03000 	mov	r3, r0
800248e4:	e0813003 	add	r3, r1, r3
800248e8:	e5832000 	str	r2, [r3]
    lbuf = bread(b->dev, log.start+i+1);
800248ec:	e51b3010 	ldr	r3, [fp, #-16]
800248f0:	e5932004 	ldr	r2, [r3, #4]
800248f4:	e30e34ac 	movw	r3, #58540	; 0xe4ac
800248f8:	e348300a 	movt	r3, #32778	; 0x800a
800248fc:	e5931034 	ldr	r1, [r3, #52]	; 0x34
80024900:	e51b3008 	ldr	r3, [fp, #-8]
80024904:	e0813003 	add	r3, r1, r3
80024908:	e2833001 	add	r3, r3, #1
8002490c:	e1a00002 	mov	r0, r2
80024910:	e1a01003 	mov	r1, r3
80024914:	ebfff0b4 	bl	80020bec <bread>
80024918:	e50b000c 	str	r0, [fp, #-12]

    memmove(lbuf->data, b->data, BSIZE);
8002491c:	e51b300c 	ldr	r3, [fp, #-12]
80024920:	e2832018 	add	r2, r3, #24
80024924:	e51b3010 	ldr	r3, [fp, #-16]
80024928:	e2833018 	add	r3, r3, #24
8002492c:	e1a00002 	mov	r0, r2
80024930:	e1a01003 	mov	r1, r3
80024934:	e3a02c02 	mov	r2, #512	; 0x200
80024938:	ebffee26 	bl	800201d8 <memmove>
    bwrite(lbuf);
8002493c:	e51b000c 	ldr	r0, [fp, #-12]
80024940:	ebfff0bd 	bl	80020c3c <bwrite>
    brelse(lbuf);
80024944:	e51b000c 	ldr	r0, [fp, #-12]
80024948:	ebfff0d0 	bl	80020c90 <brelse>

    if (i == log.lh.n) {
8002494c:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024950:	e348300a 	movt	r3, #32778	; 0x800a
80024954:	e5932044 	ldr	r2, [r3, #68]	; 0x44
80024958:	e51b3008 	ldr	r3, [fp, #-8]
8002495c:	e1520003 	cmp	r2, r3
80024960:	1a000006 	bne	80024980 <log_write+0x1b0>
        log.lh.n++;
80024964:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024968:	e348300a 	movt	r3, #32778	; 0x800a
8002496c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80024970:	e2832001 	add	r2, r3, #1
80024974:	e30e34ac 	movw	r3, #58540	; 0xe4ac
80024978:	e348300a 	movt	r3, #32778	; 0x800a
8002497c:	e5832044 	str	r2, [r3, #68]	; 0x44
    }

    b->flags |= B_DIRTY; // XXX prevent eviction
80024980:	e51b3010 	ldr	r3, [fp, #-16]
80024984:	e5933000 	ldr	r3, [r3]
80024988:	e3832004 	orr	r2, r3, #4
8002498c:	e51b3010 	ldr	r3, [fp, #-16]
80024990:	e5832000 	str	r2, [r3]
}
80024994:	e24bd004 	sub	sp, fp, #4
80024998:	e8bd8800 	pop	{fp, pc}

8002499c <kmain>:
struct cpu	*cpu;

#define MB (1024*1024)

void kmain (void)
{
8002499c:	e92d4800 	push	{fp, lr}
800249a0:	e28db004 	add	fp, sp, #4
800249a4:	e24dd008 	sub	sp, sp, #8
    uint vectbl;

    cpu = &cpus[0];
800249a8:	e30e351c 	movw	r3, #58652	; 0xe51c
800249ac:	e348300a 	movt	r3, #32778	; 0x800a
800249b0:	e30e2520 	movw	r2, #58656	; 0xe520
800249b4:	e348200a 	movt	r2, #32778	; 0x800a
800249b8:	e5832000 	str	r2, [r3]

    uart_init (P2V(UART0));
800249bc:	e3a00a09 	mov	r0, #36864	; 0x9000
800249c0:	e3490000 	movt	r0, #36864	; 0x9000
800249c4:	eb00134e 	bl	80029704 <uart_init>
     * one in the kernel's 1MB, vaddr starting at 0x8000:0000.
     * one in the section, vaddr starting at 0xfff0:0000.
     * in both place, the offset within the section is 0xf:0000.
     * every PDE is 1MB. */

    vectbl = P2V_WO (VEC_TBL & PDE_MASK);
800249c8:	e3a03000 	mov	r3, #0
800249cc:	e348300f 	movt	r3, #32783	; 0x800f
800249d0:	e50b3008 	str	r3, [fp, #-8]

    init_vmm ();
800249d4:	eb000d54 	bl	80027f2c <init_vmm>
    kpt_freerange (align_up(&end, PT_SZ), vectbl);
800249d8:	e3013000 	movw	r3, #4096	; 0x1000
800249dc:	e348300b 	movt	r3, #32779	; 0x800b
800249e0:	e2833fff 	add	r3, r3, #1020	; 0x3fc
800249e4:	e2833003 	add	r3, r3, #3
800249e8:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
800249ec:	e3c33003 	bic	r3, r3, #3
800249f0:	e1a00003 	mov	r0, r3
800249f4:	e51b1008 	ldr	r1, [fp, #-8]
800249f8:	eb000d80 	bl	80028000 <kpt_freerange>
    kpt_freerange (vectbl + PT_SZ, P2V_WO(INIT_KERNMAP));
800249fc:	e51b3008 	ldr	r3, [fp, #-8]
80024a00:	e2833b01 	add	r3, r3, #1024	; 0x400
80024a04:	e1a00003 	mov	r0, r3
80024a08:	e3a01000 	mov	r1, #0
80024a0c:	e3481010 	movt	r1, #32784	; 0x8010
80024a10:	eb000d7a 	bl	80028000 <kpt_freerange>
    paging_init (INIT_KERNMAP, PHYSTOP);
80024a14:	e3a00601 	mov	r0, #1048576	; 0x100000
80024a18:	e3a01301 	mov	r1, #67108864	; 0x4000000
80024a1c:	eb001046 	bl	80028b3c <paging_init>

    kmem_init ();
80024a20:	ebfff11f 	bl	80020ea4 <kmem_init>
    kmem_init2(P2V(INIT_KERNMAP), P2V(PHYSTOP));
80024a24:	e3a00000 	mov	r0, #0
80024a28:	e3480010 	movt	r0, #32784	; 0x8010
80024a2c:	e3a01321 	mov	r1, #-2080374784	; 0x84000000
80024a30:	ebfff123 	bl	80020ec4 <kmem_init2>

    trap_init ();				// vector table and stacks for models
80024a34:	eb000c39 	bl	80027b20 <trap_init>
    gic_init (P2V(PERI_BASE));	// interrupt controller
80024a38:	e3a0049e 	mov	r0, #-1644167168	; 0x9e000000
80024a3c:	eb001149 	bl	80028f68 <gic_init>
    uart_enable_rx ();			// interrupt for uart
80024a40:	eb001365 	bl	800297dc <uart_enable_rx>
    consoleinit ();				// console
80024a44:	ebfff5b8 	bl	8002212c <consoleinit>
    pinit ();					// process (locks)
80024a48:	eb0001b0 	bl	80025110 <pinit>

    binit ();					// buffer cache
80024a4c:	ebffefd0 	bl	80020994 <binit>
    fileinit ();				// file table
80024a50:	ebfff714 	bl	800226a8 <fileinit>
    iinit ();					// inode cache
80024a54:	ebfff955 	bl	80022fb0 <iinit>
    ideinit ();					// ide (memory block device)
80024a58:	eb000004 	bl	80024a70 <ideinit>
    timer_init (HZ);			// the timer (ticker)
80024a5c:	e3a0000a 	mov	r0, #10
80024a60:	eb0012d6 	bl	800295c0 <timer_init>


    sti ();
80024a64:	ebffeeee 	bl	80020624 <sti>

    userinit();					// first user process
80024a68:	eb00021c 	bl	800252e0 <userinit>
    scheduler();				// start running processes
80024a6c:	eb00040f 	bl	80025ab0 <scheduler>

80024a70 <ideinit>:

static int disksize;
static uchar *memdisk;

void ideinit(void)
{
80024a70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80024a74:	e28db000 	add	fp, sp, #0
    memdisk = _binary_fs_img_start;
80024a78:	e30e3604 	movw	r3, #58884	; 0xe604
80024a7c:	e348300a 	movt	r3, #32778	; 0x800a
80024a80:	e30b20c4 	movw	r2, #45252	; 0xb0c4
80024a84:	e3482002 	movt	r2, #32770	; 0x8002
80024a88:	e5832000 	str	r2, [r3]
    disksize = (uint)_binary_fs_img_size/512;
80024a8c:	e3003000 	movw	r3, #0
80024a90:	e3403008 	movt	r3, #8
80024a94:	e1a034a3 	lsr	r3, r3, #9
80024a98:	e1a02003 	mov	r2, r3
80024a9c:	e30e3600 	movw	r3, #58880	; 0xe600
80024aa0:	e348300a 	movt	r3, #32778	; 0x800a
80024aa4:	e5832000 	str	r2, [r3]
}
80024aa8:	e28bd000 	add	sp, fp, #0
80024aac:	e8bd0800 	pop	{fp}
80024ab0:	e12fff1e 	bx	lr

80024ab4 <ideintr>:

// Interrupt handler.
void ideintr(void)
{
80024ab4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80024ab8:	e28db000 	add	fp, sp, #0
    // no-op
}
80024abc:	e28bd000 	add	sp, fp, #0
80024ac0:	e8bd0800 	pop	{fp}
80024ac4:	e12fff1e 	bx	lr

80024ac8 <iderw>:

// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void iderw(struct buf *b)
{
80024ac8:	e92d4800 	push	{fp, lr}
80024acc:	e28db004 	add	fp, sp, #4
80024ad0:	e24dd010 	sub	sp, sp, #16
80024ad4:	e50b0010 	str	r0, [fp, #-16]
    uchar *p;

    if(!(b->flags & B_BUSY)) {
80024ad8:	e51b3010 	ldr	r3, [fp, #-16]
80024adc:	e5933000 	ldr	r3, [r3]
80024ae0:	e2033001 	and	r3, r3, #1
80024ae4:	e3530000 	cmp	r3, #0
80024ae8:	1a000002 	bne	80024af8 <iderw+0x30>
        panic("iderw: buf not busy");
80024aec:	e3090e18 	movw	r0, #40472	; 0x9e18
80024af0:	e3480002 	movt	r0, #32770	; 0x8002
80024af4:	ebfff430 	bl	80021bbc <panic>
    }

    if((b->flags & (B_VALID|B_DIRTY)) == B_VALID) {
80024af8:	e51b3010 	ldr	r3, [fp, #-16]
80024afc:	e5933000 	ldr	r3, [r3]
80024b00:	e2033006 	and	r3, r3, #6
80024b04:	e3530002 	cmp	r3, #2
80024b08:	1a000002 	bne	80024b18 <iderw+0x50>
        panic("iderw: nothing to do");
80024b0c:	e3090e2c 	movw	r0, #40492	; 0x9e2c
80024b10:	e3480002 	movt	r0, #32770	; 0x8002
80024b14:	ebfff428 	bl	80021bbc <panic>
    }

    if(b->dev != 1) {
80024b18:	e51b3010 	ldr	r3, [fp, #-16]
80024b1c:	e5933004 	ldr	r3, [r3, #4]
80024b20:	e3530001 	cmp	r3, #1
80024b24:	0a000002 	beq	80024b34 <iderw+0x6c>
        panic("iderw: request not for disk 1");
80024b28:	e3090e44 	movw	r0, #40516	; 0x9e44
80024b2c:	e3480002 	movt	r0, #32770	; 0x8002
80024b30:	ebfff421 	bl	80021bbc <panic>
    }

    if(b->sector >= disksize) {
80024b34:	e51b3010 	ldr	r3, [fp, #-16]
80024b38:	e5932008 	ldr	r2, [r3, #8]
80024b3c:	e30e3600 	movw	r3, #58880	; 0xe600
80024b40:	e348300a 	movt	r3, #32778	; 0x800a
80024b44:	e5933000 	ldr	r3, [r3]
80024b48:	e1520003 	cmp	r2, r3
80024b4c:	3a000002 	bcc	80024b5c <iderw+0x94>
        panic("iderw: sector out of range");
80024b50:	e3090e64 	movw	r0, #40548	; 0x9e64
80024b54:	e3480002 	movt	r0, #32770	; 0x8002
80024b58:	ebfff417 	bl	80021bbc <panic>
    }

    p = memdisk + b->sector*512;
80024b5c:	e30e3604 	movw	r3, #58884	; 0xe604
80024b60:	e348300a 	movt	r3, #32778	; 0x800a
80024b64:	e5932000 	ldr	r2, [r3]
80024b68:	e51b3010 	ldr	r3, [fp, #-16]
80024b6c:	e5933008 	ldr	r3, [r3, #8]
80024b70:	e1a03483 	lsl	r3, r3, #9
80024b74:	e0823003 	add	r3, r2, r3
80024b78:	e50b3008 	str	r3, [fp, #-8]

    if(b->flags & B_DIRTY){
80024b7c:	e51b3010 	ldr	r3, [fp, #-16]
80024b80:	e5933000 	ldr	r3, [r3]
80024b84:	e2033004 	and	r3, r3, #4
80024b88:	e3530000 	cmp	r3, #0
80024b8c:	0a00000b 	beq	80024bc0 <iderw+0xf8>
        b->flags &= ~B_DIRTY;
80024b90:	e51b3010 	ldr	r3, [fp, #-16]
80024b94:	e5933000 	ldr	r3, [r3]
80024b98:	e3c32004 	bic	r2, r3, #4
80024b9c:	e51b3010 	ldr	r3, [fp, #-16]
80024ba0:	e5832000 	str	r2, [r3]
        memmove(p, b->data, 512);
80024ba4:	e51b3010 	ldr	r3, [fp, #-16]
80024ba8:	e2833018 	add	r3, r3, #24
80024bac:	e51b0008 	ldr	r0, [fp, #-8]
80024bb0:	e1a01003 	mov	r1, r3
80024bb4:	e3a02c02 	mov	r2, #512	; 0x200
80024bb8:	ebffed86 	bl	800201d8 <memmove>
80024bbc:	ea000005 	b	80024bd8 <iderw+0x110>
    } else {
        memmove(b->data, p, 512);
80024bc0:	e51b3010 	ldr	r3, [fp, #-16]
80024bc4:	e2833018 	add	r3, r3, #24
80024bc8:	e1a00003 	mov	r0, r3
80024bcc:	e51b1008 	ldr	r1, [fp, #-8]
80024bd0:	e3a02c02 	mov	r2, #512	; 0x200
80024bd4:	ebffed7f 	bl	800201d8 <memmove>
    }

    b->flags |= B_VALID;
80024bd8:	e51b3010 	ldr	r3, [fp, #-16]
80024bdc:	e5933000 	ldr	r3, [r3]
80024be0:	e3832002 	orr	r2, r3, #2
80024be4:	e51b3010 	ldr	r3, [fp, #-16]
80024be8:	e5832000 	str	r2, [r3]
}
80024bec:	e24bd004 	sub	sp, fp, #4
80024bf0:	e8bd8800 	pop	{fp, pc}

80024bf4 <pipealloc>:
    int readopen;   // read fd is still open
    int writeopen;  // write fd is still open
};

int pipealloc(struct file **f0, struct file **f1)
{
80024bf4:	e92d4800 	push	{fp, lr}
80024bf8:	e28db004 	add	fp, sp, #4
80024bfc:	e24dd010 	sub	sp, sp, #16
80024c00:	e50b0010 	str	r0, [fp, #-16]
80024c04:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    struct pipe *p;

    p = 0;
80024c08:	e3a03000 	mov	r3, #0
80024c0c:	e50b3008 	str	r3, [fp, #-8]
    *f0 = *f1 = 0;
80024c10:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024c14:	e3a02000 	mov	r2, #0
80024c18:	e5832000 	str	r2, [r3]
80024c1c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024c20:	e5932000 	ldr	r2, [r3]
80024c24:	e51b3010 	ldr	r3, [fp, #-16]
80024c28:	e5832000 	str	r2, [r3]

    if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0) {
80024c2c:	ebfff6a5 	bl	800226c8 <filealloc>
80024c30:	e1a02000 	mov	r2, r0
80024c34:	e51b3010 	ldr	r3, [fp, #-16]
80024c38:	e5832000 	str	r2, [r3]
80024c3c:	e51b3010 	ldr	r3, [fp, #-16]
80024c40:	e5933000 	ldr	r3, [r3]
80024c44:	e3530000 	cmp	r3, #0
80024c48:	0a000044 	beq	80024d60 <pipealloc+0x16c>
80024c4c:	ebfff69d 	bl	800226c8 <filealloc>
80024c50:	e1a02000 	mov	r2, r0
80024c54:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024c58:	e5832000 	str	r2, [r3]
80024c5c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024c60:	e5933000 	ldr	r3, [r3]
80024c64:	e3530000 	cmp	r3, #0
80024c68:	0a00003c 	beq	80024d60 <pipealloc+0x16c>
        goto bad;
    }

    if((p = kmalloc (get_order(sizeof(*p)))) == 0) {
80024c6c:	e3a00f91 	mov	r0, #580	; 0x244
80024c70:	ebfff2ac 	bl	80021728 <get_order>
80024c74:	e1a03000 	mov	r3, r0
80024c78:	e1a00003 	mov	r0, r3
80024c7c:	ebfff221 	bl	80021508 <kmalloc>
80024c80:	e50b0008 	str	r0, [fp, #-8]
80024c84:	e51b3008 	ldr	r3, [fp, #-8]
80024c88:	e3530000 	cmp	r3, #0
80024c8c:	0a000032 	beq	80024d5c <pipealloc+0x168>
        goto bad;
    }

    p->readopen = 1;
80024c90:	e51b3008 	ldr	r3, [fp, #-8]
80024c94:	e3a02001 	mov	r2, #1
80024c98:	e583223c 	str	r2, [r3, #572]	; 0x23c
    p->writeopen = 1;
80024c9c:	e51b3008 	ldr	r3, [fp, #-8]
80024ca0:	e3a02001 	mov	r2, #1
80024ca4:	e5832240 	str	r2, [r3, #576]	; 0x240
    p->nwrite = 0;
80024ca8:	e51b3008 	ldr	r3, [fp, #-8]
80024cac:	e3a02000 	mov	r2, #0
80024cb0:	e5832238 	str	r2, [r3, #568]	; 0x238
    p->nread = 0;
80024cb4:	e51b3008 	ldr	r3, [fp, #-8]
80024cb8:	e3a02000 	mov	r2, #0
80024cbc:	e5832234 	str	r2, [r3, #564]	; 0x234

    initlock(&p->lock, "pipe");
80024cc0:	e51b3008 	ldr	r3, [fp, #-8]
80024cc4:	e1a00003 	mov	r0, r3
80024cc8:	e3091e80 	movw	r1, #40576	; 0x9e80
80024ccc:	e3481002 	movt	r1, #32770	; 0x8002
80024cd0:	eb0004dc 	bl	80026048 <initlock>

    (*f0)->type = FD_PIPE;
80024cd4:	e51b3010 	ldr	r3, [fp, #-16]
80024cd8:	e5933000 	ldr	r3, [r3]
80024cdc:	e3a02001 	mov	r2, #1
80024ce0:	e5c32000 	strb	r2, [r3]
    (*f0)->readable = 1;
80024ce4:	e51b3010 	ldr	r3, [fp, #-16]
80024ce8:	e5933000 	ldr	r3, [r3]
80024cec:	e3a02001 	mov	r2, #1
80024cf0:	e5c32008 	strb	r2, [r3, #8]
    (*f0)->writable = 0;
80024cf4:	e51b3010 	ldr	r3, [fp, #-16]
80024cf8:	e5933000 	ldr	r3, [r3]
80024cfc:	e3a02000 	mov	r2, #0
80024d00:	e5c32009 	strb	r2, [r3, #9]
    (*f0)->pipe = p;
80024d04:	e51b3010 	ldr	r3, [fp, #-16]
80024d08:	e5933000 	ldr	r3, [r3]
80024d0c:	e51b2008 	ldr	r2, [fp, #-8]
80024d10:	e583200c 	str	r2, [r3, #12]
    (*f1)->type = FD_PIPE;
80024d14:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024d18:	e5933000 	ldr	r3, [r3]
80024d1c:	e3a02001 	mov	r2, #1
80024d20:	e5c32000 	strb	r2, [r3]
    (*f1)->readable = 0;
80024d24:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024d28:	e5933000 	ldr	r3, [r3]
80024d2c:	e3a02000 	mov	r2, #0
80024d30:	e5c32008 	strb	r2, [r3, #8]
    (*f1)->writable = 1;
80024d34:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024d38:	e5933000 	ldr	r3, [r3]
80024d3c:	e3a02001 	mov	r2, #1
80024d40:	e5c32009 	strb	r2, [r3, #9]
    (*f1)->pipe = p;
80024d44:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024d48:	e5933000 	ldr	r3, [r3]
80024d4c:	e51b2008 	ldr	r2, [fp, #-8]
80024d50:	e583200c 	str	r2, [r3, #12]

    return 0;
80024d54:	e3a03000 	mov	r3, #0
80024d58:	ea00001a 	b	80024dc8 <pipealloc+0x1d4>
    if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0) {
        goto bad;
    }

    if((p = kmalloc (get_order(sizeof(*p)))) == 0) {
        goto bad;
80024d5c:	e1a00000 	nop			; (mov r0, r0)

    return 0;

    //PAGEBREAK: 20
    bad:
    if(p) {
80024d60:	e51b3008 	ldr	r3, [fp, #-8]
80024d64:	e3530000 	cmp	r3, #0
80024d68:	0a000005 	beq	80024d84 <pipealloc+0x190>
        kfree (p, get_order(sizeof*p));
80024d6c:	e3a00f91 	mov	r0, #580	; 0x244
80024d70:	ebfff26c 	bl	80021728 <get_order>
80024d74:	e1a03000 	mov	r3, r0
80024d78:	e51b0008 	ldr	r0, [fp, #-8]
80024d7c:	e1a01003 	mov	r1, r3
80024d80:	ebfff236 	bl	80021660 <kfree>
    }

    if(*f0) {
80024d84:	e51b3010 	ldr	r3, [fp, #-16]
80024d88:	e5933000 	ldr	r3, [r3]
80024d8c:	e3530000 	cmp	r3, #0
80024d90:	0a000003 	beq	80024da4 <pipealloc+0x1b0>
        fileclose(*f0);
80024d94:	e51b3010 	ldr	r3, [fp, #-16]
80024d98:	e5933000 	ldr	r3, [r3]
80024d9c:	e1a00003 	mov	r0, r3
80024da0:	ebfff687 	bl	800227c4 <fileclose>
    }

    if(*f1) {
80024da4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024da8:	e5933000 	ldr	r3, [r3]
80024dac:	e3530000 	cmp	r3, #0
80024db0:	0a000003 	beq	80024dc4 <pipealloc+0x1d0>
        fileclose(*f1);
80024db4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80024db8:	e5933000 	ldr	r3, [r3]
80024dbc:	e1a00003 	mov	r0, r3
80024dc0:	ebfff67f 	bl	800227c4 <fileclose>
    }

    return -1;
80024dc4:	e3e03000 	mvn	r3, #0
}
80024dc8:	e1a00003 	mov	r0, r3
80024dcc:	e24bd004 	sub	sp, fp, #4
80024dd0:	e8bd8800 	pop	{fp, pc}

80024dd4 <pipeclose>:

void pipeclose(struct pipe *p, int writable)
{
80024dd4:	e92d4800 	push	{fp, lr}
80024dd8:	e28db004 	add	fp, sp, #4
80024ddc:	e24dd008 	sub	sp, sp, #8
80024de0:	e50b0008 	str	r0, [fp, #-8]
80024de4:	e50b100c 	str	r1, [fp, #-12]
    acquire(&p->lock);
80024de8:	e51b3008 	ldr	r3, [fp, #-8]
80024dec:	e1a00003 	mov	r0, r3
80024df0:	eb0004a5 	bl	8002608c <acquire>

    if(writable){
80024df4:	e51b300c 	ldr	r3, [fp, #-12]
80024df8:	e3530000 	cmp	r3, #0
80024dfc:	0a000007 	beq	80024e20 <pipeclose+0x4c>
        p->writeopen = 0;
80024e00:	e51b3008 	ldr	r3, [fp, #-8]
80024e04:	e3a02000 	mov	r2, #0
80024e08:	e5832240 	str	r2, [r3, #576]	; 0x240
        wakeup(&p->nread);
80024e0c:	e51b3008 	ldr	r3, [fp, #-8]
80024e10:	e2833f8d 	add	r3, r3, #564	; 0x234
80024e14:	e1a00003 	mov	r0, r3
80024e18:	eb00040c 	bl	80025e50 <wakeup>
80024e1c:	ea000006 	b	80024e3c <pipeclose+0x68>

    } else {
        p->readopen = 0;
80024e20:	e51b3008 	ldr	r3, [fp, #-8]
80024e24:	e3a02000 	mov	r2, #0
80024e28:	e583223c 	str	r2, [r3, #572]	; 0x23c
        wakeup(&p->nwrite);
80024e2c:	e51b3008 	ldr	r3, [fp, #-8]
80024e30:	e2833f8e 	add	r3, r3, #568	; 0x238
80024e34:	e1a00003 	mov	r0, r3
80024e38:	eb000404 	bl	80025e50 <wakeup>
    }

    if(p->readopen == 0 && p->writeopen == 0){
80024e3c:	e51b3008 	ldr	r3, [fp, #-8]
80024e40:	e593323c 	ldr	r3, [r3, #572]	; 0x23c
80024e44:	e3530000 	cmp	r3, #0
80024e48:	1a00000d 	bne	80024e84 <pipeclose+0xb0>
80024e4c:	e51b3008 	ldr	r3, [fp, #-8]
80024e50:	e5933240 	ldr	r3, [r3, #576]	; 0x240
80024e54:	e3530000 	cmp	r3, #0
80024e58:	1a000009 	bne	80024e84 <pipeclose+0xb0>
        release(&p->lock);
80024e5c:	e51b3008 	ldr	r3, [fp, #-8]
80024e60:	e1a00003 	mov	r0, r3
80024e64:	eb000492 	bl	800260b4 <release>
        kfree (p, get_order(sizeof(*p)));
80024e68:	e3a00f91 	mov	r0, #580	; 0x244
80024e6c:	ebfff22d 	bl	80021728 <get_order>
80024e70:	e1a03000 	mov	r3, r0
80024e74:	e51b0008 	ldr	r0, [fp, #-8]
80024e78:	e1a01003 	mov	r1, r3
80024e7c:	ebfff1f7 	bl	80021660 <kfree>
80024e80:	ea000002 	b	80024e90 <pipeclose+0xbc>

    } else {
        release(&p->lock);
80024e84:	e51b3008 	ldr	r3, [fp, #-8]
80024e88:	e1a00003 	mov	r0, r3
80024e8c:	eb000488 	bl	800260b4 <release>
    }
}
80024e90:	e24bd004 	sub	sp, fp, #4
80024e94:	e8bd8800 	pop	{fp, pc}

80024e98 <pipewrite>:

//PAGEBREAK: 40
int pipewrite(struct pipe *p, char *addr, int n)
{
80024e98:	e92d4800 	push	{fp, lr}
80024e9c:	e28db004 	add	fp, sp, #4
80024ea0:	e24dd018 	sub	sp, sp, #24
80024ea4:	e50b0010 	str	r0, [fp, #-16]
80024ea8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80024eac:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    int i;

    acquire(&p->lock);
80024eb0:	e51b3010 	ldr	r3, [fp, #-16]
80024eb4:	e1a00003 	mov	r0, r3
80024eb8:	eb000473 	bl	8002608c <acquire>

    for(i = 0; i < n; i++){
80024ebc:	e3a03000 	mov	r3, #0
80024ec0:	e50b3008 	str	r3, [fp, #-8]
80024ec4:	ea00002f 	b	80024f88 <pipewrite+0xf0>
        while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
            if(p->readopen == 0 /*|| proc->killed*/){
80024ec8:	e51b3010 	ldr	r3, [fp, #-16]
80024ecc:	e593323c 	ldr	r3, [r3, #572]	; 0x23c
80024ed0:	e3530000 	cmp	r3, #0
80024ed4:	1a000004 	bne	80024eec <pipewrite+0x54>
                release(&p->lock);
80024ed8:	e51b3010 	ldr	r3, [fp, #-16]
80024edc:	e1a00003 	mov	r0, r3
80024ee0:	eb000473 	bl	800260b4 <release>
                return -1;
80024ee4:	e3e03000 	mvn	r3, #0
80024ee8:	ea000032 	b	80024fb8 <pipewrite+0x120>
            }

            wakeup(&p->nread);
80024eec:	e51b3010 	ldr	r3, [fp, #-16]
80024ef0:	e2833f8d 	add	r3, r3, #564	; 0x234
80024ef4:	e1a00003 	mov	r0, r3
80024ef8:	eb0003d4 	bl	80025e50 <wakeup>
            sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80024efc:	e51b3010 	ldr	r3, [fp, #-16]
80024f00:	e2832f8e 	add	r2, r3, #568	; 0x238
80024f04:	e51b3010 	ldr	r3, [fp, #-16]
80024f08:	e1a00002 	mov	r0, r2
80024f0c:	e1a01003 	mov	r1, r3
80024f10:	eb000376 	bl	80025cf0 <sleep>
80024f14:	ea000000 	b	80024f1c <pipewrite+0x84>
    int i;

    acquire(&p->lock);

    for(i = 0; i < n; i++){
        while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80024f18:	e1a00000 	nop			; (mov r0, r0)
80024f1c:	e51b3010 	ldr	r3, [fp, #-16]
80024f20:	e5932238 	ldr	r2, [r3, #568]	; 0x238
80024f24:	e51b3010 	ldr	r3, [fp, #-16]
80024f28:	e5933234 	ldr	r3, [r3, #564]	; 0x234
80024f2c:	e2833c02 	add	r3, r3, #512	; 0x200
80024f30:	e1520003 	cmp	r2, r3
80024f34:	0affffe3 	beq	80024ec8 <pipewrite+0x30>

            wakeup(&p->nread);
            sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
        }

        p->data[p->nwrite++ % PIPESIZE] = addr[i];
80024f38:	e51b3010 	ldr	r3, [fp, #-16]
80024f3c:	e5932238 	ldr	r2, [r3, #568]	; 0x238
80024f40:	e1a03b82 	lsl	r3, r2, #23
80024f44:	e1a03ba3 	lsr	r3, r3, #23
80024f48:	e51b1008 	ldr	r1, [fp, #-8]
80024f4c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80024f50:	e0801001 	add	r1, r0, r1
80024f54:	e5d11000 	ldrb	r1, [r1]
80024f58:	e51b0010 	ldr	r0, [fp, #-16]
80024f5c:	e3a0c030 	mov	ip, #48	; 0x30
80024f60:	e0800003 	add	r0, r0, r3
80024f64:	e1a0300c 	mov	r3, ip
80024f68:	e0803003 	add	r3, r0, r3
80024f6c:	e5c31004 	strb	r1, [r3, #4]
80024f70:	e2822001 	add	r2, r2, #1
80024f74:	e51b3010 	ldr	r3, [fp, #-16]
80024f78:	e5832238 	str	r2, [r3, #568]	; 0x238
{
    int i;

    acquire(&p->lock);

    for(i = 0; i < n; i++){
80024f7c:	e51b3008 	ldr	r3, [fp, #-8]
80024f80:	e2833001 	add	r3, r3, #1
80024f84:	e50b3008 	str	r3, [fp, #-8]
80024f88:	e51b2008 	ldr	r2, [fp, #-8]
80024f8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80024f90:	e1520003 	cmp	r2, r3
80024f94:	baffffdf 	blt	80024f18 <pipewrite+0x80>
        }

        p->data[p->nwrite++ % PIPESIZE] = addr[i];
    }

    wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80024f98:	e51b3010 	ldr	r3, [fp, #-16]
80024f9c:	e2833f8d 	add	r3, r3, #564	; 0x234
80024fa0:	e1a00003 	mov	r0, r3
80024fa4:	eb0003a9 	bl	80025e50 <wakeup>
    release(&p->lock);
80024fa8:	e51b3010 	ldr	r3, [fp, #-16]
80024fac:	e1a00003 	mov	r0, r3
80024fb0:	eb00043f 	bl	800260b4 <release>
    return n;
80024fb4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
80024fb8:	e1a00003 	mov	r0, r3
80024fbc:	e24bd004 	sub	sp, fp, #4
80024fc0:	e8bd8800 	pop	{fp, pc}

80024fc4 <piperead>:

int piperead(struct pipe *p, char *addr, int n)
{
80024fc4:	e92d4800 	push	{fp, lr}
80024fc8:	e28db004 	add	fp, sp, #4
80024fcc:	e24dd018 	sub	sp, sp, #24
80024fd0:	e50b0010 	str	r0, [fp, #-16]
80024fd4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80024fd8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    int i;

    acquire(&p->lock);
80024fdc:	e51b3010 	ldr	r3, [fp, #-16]
80024fe0:	e1a00003 	mov	r0, r3
80024fe4:	eb000428 	bl	8002608c <acquire>

    while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80024fe8:	ea000010 	b	80025030 <piperead+0x6c>
        if(proc->killed){
80024fec:	e30e360c 	movw	r3, #58892	; 0xe60c
80024ff0:	e348300a 	movt	r3, #32778	; 0x800a
80024ff4:	e5933000 	ldr	r3, [r3]
80024ff8:	e5933028 	ldr	r3, [r3, #40]	; 0x28
80024ffc:	e3530000 	cmp	r3, #0
80025000:	0a000004 	beq	80025018 <piperead+0x54>
            release(&p->lock);
80025004:	e51b3010 	ldr	r3, [fp, #-16]
80025008:	e1a00003 	mov	r0, r3
8002500c:	eb000428 	bl	800260b4 <release>
            return -1;
80025010:	e3e03000 	mvn	r3, #0
80025014:	ea00003a 	b	80025104 <piperead+0x140>
        }

        sleep(&p->nread, &p->lock); //DOC: piperead-sleep*/
80025018:	e51b3010 	ldr	r3, [fp, #-16]
8002501c:	e2832f8d 	add	r2, r3, #564	; 0x234
80025020:	e51b3010 	ldr	r3, [fp, #-16]
80025024:	e1a00002 	mov	r0, r2
80025028:	e1a01003 	mov	r1, r3
8002502c:	eb00032f 	bl	80025cf0 <sleep>
{
    int i;

    acquire(&p->lock);

    while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80025030:	e51b3010 	ldr	r3, [fp, #-16]
80025034:	e5932234 	ldr	r2, [r3, #564]	; 0x234
80025038:	e51b3010 	ldr	r3, [fp, #-16]
8002503c:	e5933238 	ldr	r3, [r3, #568]	; 0x238
80025040:	e1520003 	cmp	r2, r3
80025044:	1a000003 	bne	80025058 <piperead+0x94>
80025048:	e51b3010 	ldr	r3, [fp, #-16]
8002504c:	e5933240 	ldr	r3, [r3, #576]	; 0x240
80025050:	e3530000 	cmp	r3, #0
80025054:	1affffe4 	bne	80024fec <piperead+0x28>
        }

        sleep(&p->nread, &p->lock); //DOC: piperead-sleep*/
    }

    for(i = 0; i < n; i++){  //DOC: piperead-copy
80025058:	e3a03000 	mov	r3, #0
8002505c:	e50b3008 	str	r3, [fp, #-8]
80025060:	ea000019 	b	800250cc <piperead+0x108>
        if(p->nread == p->nwrite) {
80025064:	e51b3010 	ldr	r3, [fp, #-16]
80025068:	e5932234 	ldr	r2, [r3, #564]	; 0x234
8002506c:	e51b3010 	ldr	r3, [fp, #-16]
80025070:	e5933238 	ldr	r3, [r3, #568]	; 0x238
80025074:	e1520003 	cmp	r2, r3
80025078:	0a000018 	beq	800250e0 <piperead+0x11c>
            break;
        }

        addr[i] = p->data[p->nread++ % PIPESIZE];
8002507c:	e51b3008 	ldr	r3, [fp, #-8]
80025080:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80025084:	e0821003 	add	r1, r2, r3
80025088:	e51b3010 	ldr	r3, [fp, #-16]
8002508c:	e5932234 	ldr	r2, [r3, #564]	; 0x234
80025090:	e1a03b82 	lsl	r3, r2, #23
80025094:	e1a03ba3 	lsr	r3, r3, #23
80025098:	e51b0010 	ldr	r0, [fp, #-16]
8002509c:	e3a0c030 	mov	ip, #48	; 0x30
800250a0:	e0800003 	add	r0, r0, r3
800250a4:	e1a0300c 	mov	r3, ip
800250a8:	e0803003 	add	r3, r0, r3
800250ac:	e5d33004 	ldrb	r3, [r3, #4]
800250b0:	e5c13000 	strb	r3, [r1]
800250b4:	e2822001 	add	r2, r2, #1
800250b8:	e51b3010 	ldr	r3, [fp, #-16]
800250bc:	e5832234 	str	r2, [r3, #564]	; 0x234
        }

        sleep(&p->nread, &p->lock); //DOC: piperead-sleep*/
    }

    for(i = 0; i < n; i++){  //DOC: piperead-copy
800250c0:	e51b3008 	ldr	r3, [fp, #-8]
800250c4:	e2833001 	add	r3, r3, #1
800250c8:	e50b3008 	str	r3, [fp, #-8]
800250cc:	e51b2008 	ldr	r2, [fp, #-8]
800250d0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800250d4:	e1520003 	cmp	r2, r3
800250d8:	baffffe1 	blt	80025064 <piperead+0xa0>
800250dc:	ea000000 	b	800250e4 <piperead+0x120>
        if(p->nread == p->nwrite) {
            break;
800250e0:	e1a00000 	nop			; (mov r0, r0)
        }

        addr[i] = p->data[p->nread++ % PIPESIZE];
    }

    wakeup(&p->nwrite);  //DOC: piperead-wakeup
800250e4:	e51b3010 	ldr	r3, [fp, #-16]
800250e8:	e2833f8e 	add	r3, r3, #568	; 0x238
800250ec:	e1a00003 	mov	r0, r3
800250f0:	eb000356 	bl	80025e50 <wakeup>
    release(&p->lock);
800250f4:	e51b3010 	ldr	r3, [fp, #-16]
800250f8:	e1a00003 	mov	r0, r3
800250fc:	eb0003ec 	bl	800260b4 <release>

    return i;
80025100:	e51b3008 	ldr	r3, [fp, #-8]
}
80025104:	e1a00003 	mov	r0, r3
80025108:	e24bd004 	sub	sp, fp, #4
8002510c:	e8bd8800 	pop	{fp, pc}

80025110 <pinit>:
extern void trapret(void);

static void wakeup1(void *chan);

void pinit(void)
{
80025110:	e92d4800 	push	{fp, lr}
80025114:	e28db004 	add	fp, sp, #4
    initlock(&ptable.lock, "ptable");
80025118:	e30e0610 	movw	r0, #58896	; 0xe610
8002511c:	e348000a 	movt	r0, #32778	; 0x800a
80025120:	e3091e88 	movw	r1, #40584	; 0x9e88
80025124:	e3481002 	movt	r1, #32770	; 0x8002
80025128:	eb0003c6 	bl	80026048 <initlock>
}
8002512c:	e8bd8800 	pop	{fp, pc}

80025130 <allocproc>:
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc* allocproc(void)
{
80025130:	e92d4800 	push	{fp, lr}
80025134:	e28db004 	add	fp, sp, #4
80025138:	e24dd008 	sub	sp, sp, #8
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
8002513c:	e30e0610 	movw	r0, #58896	; 0xe610
80025140:	e348000a 	movt	r0, #32778	; 0x800a
80025144:	eb0003d0 	bl	8002608c <acquire>

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80025148:	e59f3174 	ldr	r3, [pc, #372]	; 800252c4 <allocproc+0x194>
8002514c:	e50b3008 	str	r3, [fp, #-8]
80025150:	ea000006 	b	80025170 <allocproc+0x40>
        if(p->state == UNUSED) {
80025154:	e51b3008 	ldr	r3, [fp, #-8]
80025158:	e5d3300c 	ldrb	r3, [r3, #12]
8002515c:	e3530000 	cmp	r3, #0
80025160:	0a00000b 	beq	80025194 <allocproc+0x64>
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80025164:	e51b3008 	ldr	r3, [fp, #-8]
80025168:	e2833080 	add	r3, r3, #128	; 0x80
8002516c:	e50b3008 	str	r3, [fp, #-8]
80025170:	e51b2008 	ldr	r2, [fp, #-8]
80025174:	e59f314c 	ldr	r3, [pc, #332]	; 800252c8 <allocproc+0x198>
80025178:	e1520003 	cmp	r2, r3
8002517c:	3afffff4 	bcc	80025154 <allocproc+0x24>
            goto found;
        }

    }

    release(&ptable.lock);
80025180:	e30e0610 	movw	r0, #58896	; 0xe610
80025184:	e348000a 	movt	r0, #32778	; 0x800a
80025188:	eb0003c9 	bl	800260b4 <release>
    return 0;
8002518c:	e3a03000 	mov	r3, #0
80025190:	ea000048 	b	800252b8 <allocproc+0x188>

    acquire(&ptable.lock);

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if(p->state == UNUSED) {
            goto found;
80025194:	e1a00000 	nop			; (mov r0, r0)

    release(&ptable.lock);
    return 0;

    found:
    p->state = EMBRYO;
80025198:	e51b3008 	ldr	r3, [fp, #-8]
8002519c:	e3a02001 	mov	r2, #1
800251a0:	e5c3200c 	strb	r2, [r3, #12]
    p->pid = nextpid++;
800251a4:	e30b3014 	movw	r3, #45076	; 0xb014
800251a8:	e3483002 	movt	r3, #32770	; 0x8002
800251ac:	e5933000 	ldr	r3, [r3]
800251b0:	e51b2008 	ldr	r2, [fp, #-8]
800251b4:	e5823010 	str	r3, [r2, #16]
800251b8:	e2832001 	add	r2, r3, #1
800251bc:	e30b3014 	movw	r3, #45076	; 0xb014
800251c0:	e3483002 	movt	r3, #32770	; 0x8002
800251c4:	e5832000 	str	r2, [r3]
    release(&ptable.lock);
800251c8:	e30e0610 	movw	r0, #58896	; 0xe610
800251cc:	e348000a 	movt	r0, #32778	; 0x800a
800251d0:	eb0003b7 	bl	800260b4 <release>

    // Allocate kernel stack.
    if((p->kstack = alloc_page ()) == 0){
800251d4:	ebfff14c 	bl	8002170c <alloc_page>
800251d8:	e1a02000 	mov	r2, r0
800251dc:	e51b3008 	ldr	r3, [fp, #-8]
800251e0:	e5832008 	str	r2, [r3, #8]
800251e4:	e51b3008 	ldr	r3, [fp, #-8]
800251e8:	e5933008 	ldr	r3, [r3, #8]
800251ec:	e3530000 	cmp	r3, #0
800251f0:	1a000004 	bne	80025208 <allocproc+0xd8>
        p->state = UNUSED;
800251f4:	e51b3008 	ldr	r3, [fp, #-8]
800251f8:	e3a02000 	mov	r2, #0
800251fc:	e5c3200c 	strb	r2, [r3, #12]
        return 0;
80025200:	e3a03000 	mov	r3, #0
80025204:	ea00002b 	b	800252b8 <allocproc+0x188>
    }

    sp = p->kstack + KSTACKSIZE;
80025208:	e51b3008 	ldr	r3, [fp, #-8]
8002520c:	e5933008 	ldr	r3, [r3, #8]
80025210:	e2833a01 	add	r3, r3, #4096	; 0x1000
80025214:	e50b300c 	str	r3, [fp, #-12]

    // Leave room for trap frame.
    sp -= sizeof (*p->tf);
80025218:	e51b300c 	ldr	r3, [fp, #-12]
8002521c:	e2433048 	sub	r3, r3, #72	; 0x48
80025220:	e50b300c 	str	r3, [fp, #-12]
    p->tf = (struct trapframe*)sp;
80025224:	e51b3008 	ldr	r3, [fp, #-8]
80025228:	e51b200c 	ldr	r2, [fp, #-12]
8002522c:	e583201c 	str	r2, [r3, #28]

    // Set up new context to start executing at forkret,
    // which returns to trapret.
    sp -= 4;
80025230:	e51b300c 	ldr	r3, [fp, #-12]
80025234:	e2433004 	sub	r3, r3, #4
80025238:	e50b300c 	str	r3, [fp, #-12]
    *(uint*)sp = (uint)trapret;
8002523c:	e30737e8 	movw	r3, #30696	; 0x77e8
80025240:	e3483002 	movt	r3, #32770	; 0x8002
80025244:	e51b200c 	ldr	r2, [fp, #-12]
80025248:	e5823000 	str	r3, [r2]

    sp -= 4;
8002524c:	e51b300c 	ldr	r3, [fp, #-12]
80025250:	e2433004 	sub	r3, r3, #4
80025254:	e50b300c 	str	r3, [fp, #-12]
    *(uint*)sp = (uint)p->kstack + KSTACKSIZE;
80025258:	e51b3008 	ldr	r3, [fp, #-8]
8002525c:	e5933008 	ldr	r3, [r3, #8]
80025260:	e2832a01 	add	r2, r3, #4096	; 0x1000
80025264:	e51b300c 	ldr	r3, [fp, #-12]
80025268:	e5832000 	str	r2, [r3]

    sp -= sizeof (*p->context);
8002526c:	e51b300c 	ldr	r3, [fp, #-12]
80025270:	e2433028 	sub	r3, r3, #40	; 0x28
80025274:	e50b300c 	str	r3, [fp, #-12]
    p->context = (struct context*)sp;
80025278:	e51b3008 	ldr	r3, [fp, #-8]
8002527c:	e51b200c 	ldr	r2, [fp, #-12]
80025280:	e5832020 	str	r2, [r3, #32]
    memset(p->context, 0, sizeof(*p->context));
80025284:	e51b3008 	ldr	r3, [fp, #-8]
80025288:	e5933020 	ldr	r3, [r3, #32]
8002528c:	e1a00003 	mov	r0, r3
80025290:	e3a01000 	mov	r1, #0
80025294:	e3a02028 	mov	r2, #40	; 0x28
80025298:	ebffeb58 	bl	80020000 <memset>
    // This is different from x86, in which the harderware pushes return
    // address before executing the callee. In ARM, return address is
    // loaded into the lr register, and push to the stack by the callee
    // (if and when necessary). We need to skip that instruction and let
    // it use our implementation.
    p->context->lr = (uint)forkret+4;
8002529c:	e51b3008 	ldr	r3, [fp, #-8]
800252a0:	e5932020 	ldr	r2, [r3, #32]
800252a4:	e3053cb0 	movw	r3, #23728	; 0x5cb0
800252a8:	e3483002 	movt	r3, #32770	; 0x8002
800252ac:	e2833004 	add	r3, r3, #4
800252b0:	e5823024 	str	r3, [r2, #36]	; 0x24

    return p;
800252b4:	e51b3008 	ldr	r3, [fp, #-8]
}
800252b8:	e1a00003 	mov	r0, r3
800252bc:	e24bd004 	sub	sp, fp, #4
800252c0:	e8bd8800 	pop	{fp, pc}
800252c4:	800ae644 	.word	0x800ae644
800252c8:	800b0644 	.word	0x800b0644

800252cc <error_init>:

void error_init ()
{
800252cc:	e92d4800 	push	{fp, lr}
800252d0:	e28db004 	add	fp, sp, #4
    panic ("failed to craft first process\n");
800252d4:	e3090e90 	movw	r0, #40592	; 0x9e90
800252d8:	e3480002 	movt	r0, #32770	; 0x8002
800252dc:	ebfff236 	bl	80021bbc <panic>

800252e0 <userinit>:

//PAGEBREAK: 32
// hand-craft the first user process. We link initcode.S into the kernel
// as a binary, the linker will generate __binary_initcode_start/_size
void userinit(void)
{
800252e0:	e92d4810 	push	{r4, fp, lr}
800252e4:	e28db008 	add	fp, sp, #8
800252e8:	e24dd00c 	sub	sp, sp, #12
    struct proc *p;
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
800252ec:	ebffff8f 	bl	80025130 <allocproc>
800252f0:	e50b0010 	str	r0, [fp, #-16]
    initproc = p;
800252f4:	e30e3608 	movw	r3, #58888	; 0xe608
800252f8:	e348300a 	movt	r3, #32778	; 0x800a
800252fc:	e51b2010 	ldr	r2, [fp, #-16]
80025300:	e5832000 	str	r2, [r3]

    if((p->pgdir = kpt_alloc()) == NULL) {
80025304:	eb000b4f 	bl	80028048 <kpt_alloc>
80025308:	e1a02000 	mov	r2, r0
8002530c:	e51b3010 	ldr	r3, [fp, #-16]
80025310:	e5832004 	str	r2, [r3, #4]
80025314:	e51b3010 	ldr	r3, [fp, #-16]
80025318:	e5933004 	ldr	r3, [r3, #4]
8002531c:	e3530000 	cmp	r3, #0
80025320:	1a000002 	bne	80025330 <userinit+0x50>
        panic("userinit: out of memory?");
80025324:	e3090eb0 	movw	r0, #40624	; 0x9eb0
80025328:	e3480002 	movt	r0, #32770	; 0x8002
8002532c:	ebfff222 	bl	80021bbc <panic>
    }

    inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80025330:	e51b3010 	ldr	r3, [fp, #-16]
80025334:	e5932004 	ldr	r2, [r3, #4]
80025338:	e3003034 	movw	r3, #52	; 0x34
8002533c:	e3403000 	movt	r3, #0
80025340:	e1a00002 	mov	r0, r2
80025344:	e30b1090 	movw	r1, #45200	; 0xb090
80025348:	e3481002 	movt	r1, #32770	; 0x8002
8002534c:	e1a02003 	mov	r2, r3
80025350:	eb000bfc 	bl	80028348 <inituvm>

    p->sz = PTE_SZ;
80025354:	e51b3010 	ldr	r3, [fp, #-16]
80025358:	e3a02a01 	mov	r2, #4096	; 0x1000
8002535c:	e5832000 	str	r2, [r3]

    // craft the trapframe as if
    memset(p->tf, 0, sizeof(*p->tf));
80025360:	e51b3010 	ldr	r3, [fp, #-16]
80025364:	e593301c 	ldr	r3, [r3, #28]
80025368:	e1a00003 	mov	r0, r3
8002536c:	e3a01000 	mov	r1, #0
80025370:	e3a02048 	mov	r2, #72	; 0x48
80025374:	ebffeb21 	bl	80020000 <memset>

    p->tf->r14_svc = (uint)error_init;
80025378:	e51b3010 	ldr	r3, [fp, #-16]
8002537c:	e593201c 	ldr	r2, [r3, #28]
80025380:	e30532cc 	movw	r3, #21196	; 0x52cc
80025384:	e3483002 	movt	r3, #32770	; 0x8002
80025388:	e5823008 	str	r3, [r2, #8]
    p->tf->spsr = spsr_usr ();
8002538c:	e51b3010 	ldr	r3, [fp, #-16]
80025390:	e593401c 	ldr	r4, [r3, #28]
80025394:	ebffecaf 	bl	80020658 <spsr_usr>
80025398:	e1a03000 	mov	r3, r0
8002539c:	e584300c 	str	r3, [r4, #12]
    p->tf->sp_usr = PTE_SZ;	// set the user stack
800253a0:	e51b3010 	ldr	r3, [fp, #-16]
800253a4:	e593301c 	ldr	r3, [r3, #28]
800253a8:	e3a02a01 	mov	r2, #4096	; 0x1000
800253ac:	e5832000 	str	r2, [r3]
    p->tf->lr_usr = 0;
800253b0:	e51b3010 	ldr	r3, [fp, #-16]
800253b4:	e593301c 	ldr	r3, [r3, #28]
800253b8:	e3a02000 	mov	r2, #0
800253bc:	e5832004 	str	r2, [r3, #4]

    // set the user pc. The actual pc loaded into r15_usr is in
    // p->tf, the trapframe.
    p->tf->pc = 0;					// beginning of initcode.S
800253c0:	e51b3010 	ldr	r3, [fp, #-16]
800253c4:	e593301c 	ldr	r3, [r3, #28]
800253c8:	e3a02000 	mov	r2, #0
800253cc:	e5832044 	str	r2, [r3, #68]	; 0x44

    safestrcpy(p->name, "initcode", sizeof(p->name));
800253d0:	e51b3010 	ldr	r3, [fp, #-16]
800253d4:	e2833070 	add	r3, r3, #112	; 0x70
800253d8:	e1a00003 	mov	r0, r3
800253dc:	e3091ecc 	movw	r1, #40652	; 0x9ecc
800253e0:	e3481002 	movt	r1, #32770	; 0x8002
800253e4:	e3a02010 	mov	r2, #16
800253e8:	ebffec3e 	bl	800204e8 <safestrcpy>
    p->cwd = namei("/");
800253ec:	e3090ed8 	movw	r0, #40664	; 0x9ed8
800253f0:	e3480002 	movt	r0, #32770	; 0x8002
800253f4:	ebfffbcd 	bl	80024330 <namei>
800253f8:	e1a02000 	mov	r2, r0
800253fc:	e51b3010 	ldr	r3, [fp, #-16]
80025400:	e583206c 	str	r2, [r3, #108]	; 0x6c

    p->state = RUNNABLE;
80025404:	e51b3010 	ldr	r3, [fp, #-16]
80025408:	e3a02003 	mov	r2, #3
8002540c:	e5c3200c 	strb	r2, [r3, #12]
}
80025410:	e24bd008 	sub	sp, fp, #8
80025414:	e8bd8810 	pop	{r4, fp, pc}

80025418 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
80025418:	e92d4800 	push	{fp, lr}
8002541c:	e28db004 	add	fp, sp, #4
80025420:	e24dd010 	sub	sp, sp, #16
80025424:	e50b0010 	str	r0, [fp, #-16]
    uint sz;

    sz = proc->sz;
80025428:	e30e360c 	movw	r3, #58892	; 0xe60c
8002542c:	e348300a 	movt	r3, #32778	; 0x800a
80025430:	e5933000 	ldr	r3, [r3]
80025434:	e5933000 	ldr	r3, [r3]
80025438:	e50b3008 	str	r3, [fp, #-8]

    if(n > 0){
8002543c:	e51b3010 	ldr	r3, [fp, #-16]
80025440:	e3530000 	cmp	r3, #0
80025444:	da000011 	ble	80025490 <growproc+0x78>
        if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0) {
80025448:	e30e360c 	movw	r3, #58892	; 0xe60c
8002544c:	e348300a 	movt	r3, #32778	; 0x800a
80025450:	e5933000 	ldr	r3, [r3]
80025454:	e5932004 	ldr	r2, [r3, #4]
80025458:	e51b1010 	ldr	r1, [fp, #-16]
8002545c:	e51b3008 	ldr	r3, [fp, #-8]
80025460:	e0813003 	add	r3, r1, r3
80025464:	e1a00002 	mov	r0, r2
80025468:	e51b1008 	ldr	r1, [fp, #-8]
8002546c:	e1a02003 	mov	r2, r3
80025470:	eb000c2c 	bl	80028528 <allocuvm>
80025474:	e1a03000 	mov	r3, r0
80025478:	e50b3008 	str	r3, [fp, #-8]
8002547c:	e51b3008 	ldr	r3, [fp, #-8]
80025480:	e3530000 	cmp	r3, #0
80025484:	1a000016 	bne	800254e4 <growproc+0xcc>
            return -1;
80025488:	e3e03000 	mvn	r3, #0
8002548c:	ea00001f 	b	80025510 <growproc+0xf8>
        }

    } else if(n < 0){
80025490:	e51b3010 	ldr	r3, [fp, #-16]
80025494:	e3530000 	cmp	r3, #0
80025498:	aa000011 	bge	800254e4 <growproc+0xcc>
        if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0) {
8002549c:	e30e360c 	movw	r3, #58892	; 0xe60c
800254a0:	e348300a 	movt	r3, #32778	; 0x800a
800254a4:	e5933000 	ldr	r3, [r3]
800254a8:	e5932004 	ldr	r2, [r3, #4]
800254ac:	e51b1010 	ldr	r1, [fp, #-16]
800254b0:	e51b3008 	ldr	r3, [fp, #-8]
800254b4:	e0813003 	add	r3, r1, r3
800254b8:	e1a00002 	mov	r0, r2
800254bc:	e51b1008 	ldr	r1, [fp, #-8]
800254c0:	e1a02003 	mov	r2, r3
800254c4:	eb000c56 	bl	80028624 <deallocuvm>
800254c8:	e1a03000 	mov	r3, r0
800254cc:	e50b3008 	str	r3, [fp, #-8]
800254d0:	e51b3008 	ldr	r3, [fp, #-8]
800254d4:	e3530000 	cmp	r3, #0
800254d8:	1a000001 	bne	800254e4 <growproc+0xcc>
            return -1;
800254dc:	e3e03000 	mvn	r3, #0
800254e0:	ea00000a 	b	80025510 <growproc+0xf8>
        }
    }

    proc->sz = sz;
800254e4:	e30e360c 	movw	r3, #58892	; 0xe60c
800254e8:	e348300a 	movt	r3, #32778	; 0x800a
800254ec:	e5933000 	ldr	r3, [r3]
800254f0:	e51b2008 	ldr	r2, [fp, #-8]
800254f4:	e5832000 	str	r2, [r3]
    switchuvm(proc);
800254f8:	e30e360c 	movw	r3, #58892	; 0xe60c
800254fc:	e348300a 	movt	r3, #32778	; 0x800a
80025500:	e5933000 	ldr	r3, [r3]
80025504:	e1a00003 	mov	r0, r3
80025508:	eb000b78 	bl	800282f0 <switchuvm>

    return 0;
8002550c:	e3a03000 	mov	r3, #0
}
80025510:	e1a00003 	mov	r0, r3
80025514:	e24bd004 	sub	sp, fp, #4
80025518:	e8bd8800 	pop	{fp, pc}

8002551c <fork>:

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int fork(void)
{
8002551c:	e92d4800 	push	{fp, lr}
80025520:	e28db004 	add	fp, sp, #4
80025524:	e24dd010 	sub	sp, sp, #16
    int i, pid;
    struct proc *np;

    // Allocate process.
    if((np = allocproc()) == 0) {
80025528:	ebffff00 	bl	80025130 <allocproc>
8002552c:	e50b000c 	str	r0, [fp, #-12]
80025530:	e51b300c 	ldr	r3, [fp, #-12]
80025534:	e3530000 	cmp	r3, #0
80025538:	1a000001 	bne	80025544 <fork+0x28>
        return -1;
8002553c:	e3e03000 	mvn	r3, #0
80025540:	ea00007f 	b	80025744 <fork+0x228>
    }

    // Copy process state from p.
    if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80025544:	e30e360c 	movw	r3, #58892	; 0xe60c
80025548:	e348300a 	movt	r3, #32778	; 0x800a
8002554c:	e5933000 	ldr	r3, [r3]
80025550:	e5932004 	ldr	r2, [r3, #4]
80025554:	e30e360c 	movw	r3, #58892	; 0xe60c
80025558:	e348300a 	movt	r3, #32778	; 0x800a
8002555c:	e5933000 	ldr	r3, [r3]
80025560:	e5933000 	ldr	r3, [r3]
80025564:	e1a00002 	mov	r0, r2
80025568:	e1a01003 	mov	r1, r3
8002556c:	eb000cb9 	bl	80028858 <copyuvm>
80025570:	e1a02000 	mov	r2, r0
80025574:	e51b300c 	ldr	r3, [fp, #-12]
80025578:	e5832004 	str	r2, [r3, #4]
8002557c:	e51b300c 	ldr	r3, [fp, #-12]
80025580:	e5933004 	ldr	r3, [r3, #4]
80025584:	e3530000 	cmp	r3, #0
80025588:	1a00000b 	bne	800255bc <fork+0xa0>
        free_page(np->kstack);
8002558c:	e51b300c 	ldr	r3, [fp, #-12]
80025590:	e5933008 	ldr	r3, [r3, #8]
80025594:	e1a00003 	mov	r0, r3
80025598:	ebfff052 	bl	800216e8 <free_page>
        np->kstack = 0;
8002559c:	e51b300c 	ldr	r3, [fp, #-12]
800255a0:	e3a02000 	mov	r2, #0
800255a4:	e5832008 	str	r2, [r3, #8]
        np->state = UNUSED;
800255a8:	e51b300c 	ldr	r3, [fp, #-12]
800255ac:	e3a02000 	mov	r2, #0
800255b0:	e5c3200c 	strb	r2, [r3, #12]
        return -1;
800255b4:	e3e03000 	mvn	r3, #0
800255b8:	ea000061 	b	80025744 <fork+0x228>
    }

    np->sz = proc->sz;
800255bc:	e30e360c 	movw	r3, #58892	; 0xe60c
800255c0:	e348300a 	movt	r3, #32778	; 0x800a
800255c4:	e5933000 	ldr	r3, [r3]
800255c8:	e5932000 	ldr	r2, [r3]
800255cc:	e51b300c 	ldr	r3, [fp, #-12]
800255d0:	e5832000 	str	r2, [r3]
    np->parent = proc;
800255d4:	e30e360c 	movw	r3, #58892	; 0xe60c
800255d8:	e348300a 	movt	r3, #32778	; 0x800a
800255dc:	e5932000 	ldr	r2, [r3]
800255e0:	e51b300c 	ldr	r3, [fp, #-12]
800255e4:	e5832018 	str	r2, [r3, #24]
    *np->tf = *proc->tf;
800255e8:	e51b300c 	ldr	r3, [fp, #-12]
800255ec:	e593201c 	ldr	r2, [r3, #28]
800255f0:	e30e360c 	movw	r3, #58892	; 0xe60c
800255f4:	e348300a 	movt	r3, #32778	; 0x800a
800255f8:	e5933000 	ldr	r3, [r3]
800255fc:	e593301c 	ldr	r3, [r3, #28]
80025600:	e3a0c048 	mov	ip, #72	; 0x48
80025604:	e1a00002 	mov	r0, r2
80025608:	e1a01003 	mov	r1, r3
8002560c:	e1a0300c 	mov	r3, ip
80025610:	e1a02003 	mov	r2, r3
80025614:	ebffeb3c 	bl	8002030c <memcpy>

    // Clear r0 so that fork returns 0 in the child.
    np->tf->r0 = 0;
80025618:	e51b300c 	ldr	r3, [fp, #-12]
8002561c:	e593301c 	ldr	r3, [r3, #28]
80025620:	e3a02000 	mov	r2, #0
80025624:	e5832010 	str	r2, [r3, #16]

    for(i = 0; i < NOFILE; i++) {
80025628:	e3a03000 	mov	r3, #0
8002562c:	e50b3008 	str	r3, [fp, #-8]
80025630:	ea000026 	b	800256d0 <fork+0x1b4>
        if(proc->ofile[i]) {
80025634:	e30e360c 	movw	r3, #58892	; 0xe60c
80025638:	e348300a 	movt	r3, #32778	; 0x800a
8002563c:	e5932000 	ldr	r2, [r3]
80025640:	e51b3008 	ldr	r3, [fp, #-8]
80025644:	e283300a 	add	r3, r3, #10
80025648:	e3a01004 	mov	r1, #4
8002564c:	e1a03103 	lsl	r3, r3, #2
80025650:	e0822003 	add	r2, r2, r3
80025654:	e1a03001 	mov	r3, r1
80025658:	e0823003 	add	r3, r2, r3
8002565c:	e5933000 	ldr	r3, [r3]
80025660:	e3530000 	cmp	r3, #0
80025664:	0a000016 	beq	800256c4 <fork+0x1a8>
            np->ofile[i] = filedup(proc->ofile[i]);
80025668:	e30e360c 	movw	r3, #58892	; 0xe60c
8002566c:	e348300a 	movt	r3, #32778	; 0x800a
80025670:	e5932000 	ldr	r2, [r3]
80025674:	e51b3008 	ldr	r3, [fp, #-8]
80025678:	e283300a 	add	r3, r3, #10
8002567c:	e3a01004 	mov	r1, #4
80025680:	e1a03103 	lsl	r3, r3, #2
80025684:	e0822003 	add	r2, r2, r3
80025688:	e1a03001 	mov	r3, r1
8002568c:	e0823003 	add	r3, r2, r3
80025690:	e5933000 	ldr	r3, [r3]
80025694:	e1a00003 	mov	r0, r3
80025698:	ebfff42f 	bl	8002275c <filedup>
8002569c:	e1a02000 	mov	r2, r0
800256a0:	e51b100c 	ldr	r1, [fp, #-12]
800256a4:	e51b3008 	ldr	r3, [fp, #-8]
800256a8:	e283300a 	add	r3, r3, #10
800256ac:	e3a00004 	mov	r0, #4
800256b0:	e1a03103 	lsl	r3, r3, #2
800256b4:	e0811003 	add	r1, r1, r3
800256b8:	e1a03000 	mov	r3, r0
800256bc:	e0813003 	add	r3, r1, r3
800256c0:	e5832000 	str	r2, [r3]
    *np->tf = *proc->tf;

    // Clear r0 so that fork returns 0 in the child.
    np->tf->r0 = 0;

    for(i = 0; i < NOFILE; i++) {
800256c4:	e51b3008 	ldr	r3, [fp, #-8]
800256c8:	e2833001 	add	r3, r3, #1
800256cc:	e50b3008 	str	r3, [fp, #-8]
800256d0:	e51b3008 	ldr	r3, [fp, #-8]
800256d4:	e353000f 	cmp	r3, #15
800256d8:	daffffd5 	ble	80025634 <fork+0x118>
        if(proc->ofile[i]) {
            np->ofile[i] = filedup(proc->ofile[i]);
        }
    }

    np->cwd = idup(proc->cwd);
800256dc:	e30e360c 	movw	r3, #58892	; 0xe60c
800256e0:	e348300a 	movt	r3, #32778	; 0x800a
800256e4:	e5933000 	ldr	r3, [r3]
800256e8:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
800256ec:	e1a00003 	mov	r0, r3
800256f0:	ebfff6ff 	bl	800232f4 <idup>
800256f4:	e1a02000 	mov	r2, r0
800256f8:	e51b300c 	ldr	r3, [fp, #-12]
800256fc:	e583206c 	str	r2, [r3, #108]	; 0x6c

    pid = np->pid;
80025700:	e51b300c 	ldr	r3, [fp, #-12]
80025704:	e5933010 	ldr	r3, [r3, #16]
80025708:	e50b3010 	str	r3, [fp, #-16]
    np->state = RUNNABLE;
8002570c:	e51b300c 	ldr	r3, [fp, #-12]
80025710:	e3a02003 	mov	r2, #3
80025714:	e5c3200c 	strb	r2, [r3, #12]
    safestrcpy(np->name, proc->name, sizeof(proc->name));
80025718:	e51b300c 	ldr	r3, [fp, #-12]
8002571c:	e2832070 	add	r2, r3, #112	; 0x70
80025720:	e30e360c 	movw	r3, #58892	; 0xe60c
80025724:	e348300a 	movt	r3, #32778	; 0x800a
80025728:	e5933000 	ldr	r3, [r3]
8002572c:	e2833070 	add	r3, r3, #112	; 0x70
80025730:	e1a00002 	mov	r0, r2
80025734:	e1a01003 	mov	r1, r3
80025738:	e3a02010 	mov	r2, #16
8002573c:	ebffeb69 	bl	800204e8 <safestrcpy>

    return pid;
80025740:	e51b3010 	ldr	r3, [fp, #-16]
}
80025744:	e1a00003 	mov	r0, r3
80025748:	e24bd004 	sub	sp, fp, #4
8002574c:	e8bd8800 	pop	{fp, pc}

80025750 <exit>:

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(void)
{
80025750:	e92d4800 	push	{fp, lr}
80025754:	e28db004 	add	fp, sp, #4
80025758:	e24dd008 	sub	sp, sp, #8
    struct proc *p;
    int fd;

    if(proc == initproc) {
8002575c:	e30e360c 	movw	r3, #58892	; 0xe60c
80025760:	e348300a 	movt	r3, #32778	; 0x800a
80025764:	e5932000 	ldr	r2, [r3]
80025768:	e30e3608 	movw	r3, #58888	; 0xe608
8002576c:	e348300a 	movt	r3, #32778	; 0x800a
80025770:	e5933000 	ldr	r3, [r3]
80025774:	e1520003 	cmp	r2, r3
80025778:	1a000002 	bne	80025788 <exit+0x38>
        panic("init exiting");
8002577c:	e3090edc 	movw	r0, #40668	; 0x9edc
80025780:	e3480002 	movt	r0, #32770	; 0x8002
80025784:	ebfff10c 	bl	80021bbc <panic>
    }

    // Close all open files.
    for(fd = 0; fd < NOFILE; fd++){
80025788:	e3a03000 	mov	r3, #0
8002578c:	e50b300c 	str	r3, [fp, #-12]
80025790:	ea000028 	b	80025838 <exit+0xe8>
        if(proc->ofile[fd]){
80025794:	e30e360c 	movw	r3, #58892	; 0xe60c
80025798:	e348300a 	movt	r3, #32778	; 0x800a
8002579c:	e5932000 	ldr	r2, [r3]
800257a0:	e51b300c 	ldr	r3, [fp, #-12]
800257a4:	e283300a 	add	r3, r3, #10
800257a8:	e3a01004 	mov	r1, #4
800257ac:	e1a03103 	lsl	r3, r3, #2
800257b0:	e0822003 	add	r2, r2, r3
800257b4:	e1a03001 	mov	r3, r1
800257b8:	e0823003 	add	r3, r2, r3
800257bc:	e5933000 	ldr	r3, [r3]
800257c0:	e3530000 	cmp	r3, #0
800257c4:	0a000018 	beq	8002582c <exit+0xdc>
            fileclose(proc->ofile[fd]);
800257c8:	e30e360c 	movw	r3, #58892	; 0xe60c
800257cc:	e348300a 	movt	r3, #32778	; 0x800a
800257d0:	e5932000 	ldr	r2, [r3]
800257d4:	e51b300c 	ldr	r3, [fp, #-12]
800257d8:	e283300a 	add	r3, r3, #10
800257dc:	e3a01004 	mov	r1, #4
800257e0:	e1a03103 	lsl	r3, r3, #2
800257e4:	e0822003 	add	r2, r2, r3
800257e8:	e1a03001 	mov	r3, r1
800257ec:	e0823003 	add	r3, r2, r3
800257f0:	e5933000 	ldr	r3, [r3]
800257f4:	e1a00003 	mov	r0, r3
800257f8:	ebfff3f1 	bl	800227c4 <fileclose>
            proc->ofile[fd] = 0;
800257fc:	e30e360c 	movw	r3, #58892	; 0xe60c
80025800:	e348300a 	movt	r3, #32778	; 0x800a
80025804:	e5932000 	ldr	r2, [r3]
80025808:	e51b300c 	ldr	r3, [fp, #-12]
8002580c:	e283300a 	add	r3, r3, #10
80025810:	e3a01004 	mov	r1, #4
80025814:	e1a03103 	lsl	r3, r3, #2
80025818:	e0822003 	add	r2, r2, r3
8002581c:	e1a03001 	mov	r3, r1
80025820:	e0823003 	add	r3, r2, r3
80025824:	e3a02000 	mov	r2, #0
80025828:	e5832000 	str	r2, [r3]
    if(proc == initproc) {
        panic("init exiting");
    }

    // Close all open files.
    for(fd = 0; fd < NOFILE; fd++){
8002582c:	e51b300c 	ldr	r3, [fp, #-12]
80025830:	e2833001 	add	r3, r3, #1
80025834:	e50b300c 	str	r3, [fp, #-12]
80025838:	e51b300c 	ldr	r3, [fp, #-12]
8002583c:	e353000f 	cmp	r3, #15
80025840:	daffffd3 	ble	80025794 <exit+0x44>
            fileclose(proc->ofile[fd]);
            proc->ofile[fd] = 0;
        }
    }

    iput(proc->cwd);
80025844:	e30e360c 	movw	r3, #58892	; 0xe60c
80025848:	e348300a 	movt	r3, #32778	; 0x800a
8002584c:	e5933000 	ldr	r3, [r3]
80025850:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
80025854:	e1a00003 	mov	r0, r3
80025858:	ebfff741 	bl	80023564 <iput>
    proc->cwd = 0;
8002585c:	e30e360c 	movw	r3, #58892	; 0xe60c
80025860:	e348300a 	movt	r3, #32778	; 0x800a
80025864:	e5933000 	ldr	r3, [r3]
80025868:	e3a02000 	mov	r2, #0
8002586c:	e583206c 	str	r2, [r3, #108]	; 0x6c

    acquire(&ptable.lock);
80025870:	e30e0610 	movw	r0, #58896	; 0xe610
80025874:	e348000a 	movt	r0, #32778	; 0x800a
80025878:	eb000203 	bl	8002608c <acquire>

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);
8002587c:	e30e360c 	movw	r3, #58892	; 0xe60c
80025880:	e348300a 	movt	r3, #32778	; 0x800a
80025884:	e5933000 	ldr	r3, [r3]
80025888:	e5933018 	ldr	r3, [r3, #24]
8002588c:	e1a00003 	mov	r0, r3
80025890:	eb00014f 	bl	80025dd4 <wakeup1>

    // Pass abandoned children to init.
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025894:	e59f3098 	ldr	r3, [pc, #152]	; 80025934 <exit+0x1e4>
80025898:	e50b3008 	str	r3, [fp, #-8]
8002589c:	ea000017 	b	80025900 <exit+0x1b0>
        if(p->parent == proc){
800258a0:	e51b3008 	ldr	r3, [fp, #-8]
800258a4:	e5932018 	ldr	r2, [r3, #24]
800258a8:	e30e360c 	movw	r3, #58892	; 0xe60c
800258ac:	e348300a 	movt	r3, #32778	; 0x800a
800258b0:	e5933000 	ldr	r3, [r3]
800258b4:	e1520003 	cmp	r2, r3
800258b8:	1a00000d 	bne	800258f4 <exit+0x1a4>
            p->parent = initproc;
800258bc:	e30e3608 	movw	r3, #58888	; 0xe608
800258c0:	e348300a 	movt	r3, #32778	; 0x800a
800258c4:	e5932000 	ldr	r2, [r3]
800258c8:	e51b3008 	ldr	r3, [fp, #-8]
800258cc:	e5832018 	str	r2, [r3, #24]

            if(p->state == ZOMBIE) {
800258d0:	e51b3008 	ldr	r3, [fp, #-8]
800258d4:	e5d3300c 	ldrb	r3, [r3, #12]
800258d8:	e3530005 	cmp	r3, #5
800258dc:	1a000004 	bne	800258f4 <exit+0x1a4>
                wakeup1(initproc);
800258e0:	e30e3608 	movw	r3, #58888	; 0xe608
800258e4:	e348300a 	movt	r3, #32778	; 0x800a
800258e8:	e5933000 	ldr	r3, [r3]
800258ec:	e1a00003 	mov	r0, r3
800258f0:	eb000137 	bl	80025dd4 <wakeup1>

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
800258f4:	e51b3008 	ldr	r3, [fp, #-8]
800258f8:	e2833080 	add	r3, r3, #128	; 0x80
800258fc:	e50b3008 	str	r3, [fp, #-8]
80025900:	e51b2008 	ldr	r2, [fp, #-8]
80025904:	e59f302c 	ldr	r3, [pc, #44]	; 80025938 <exit+0x1e8>
80025908:	e1520003 	cmp	r2, r3
8002590c:	3affffe3 	bcc	800258a0 <exit+0x150>
            }
        }
    }

    // Jump into the scheduler, never to return.
    proc->state = ZOMBIE;
80025910:	e30e360c 	movw	r3, #58892	; 0xe60c
80025914:	e348300a 	movt	r3, #32778	; 0x800a
80025918:	e5933000 	ldr	r3, [r3]
8002591c:	e3a02005 	mov	r2, #5
80025920:	e5c3200c 	strb	r2, [r3, #12]
    sched();
80025924:	eb000096 	bl	80025b84 <sched>

    panic("zombie exit");
80025928:	e3090eec 	movw	r0, #40684	; 0x9eec
8002592c:	e3480002 	movt	r0, #32770	; 0x8002
80025930:	ebfff0a1 	bl	80021bbc <panic>
80025934:	800ae644 	.word	0x800ae644
80025938:	800b0644 	.word	0x800b0644

8002593c <wait>:
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(void)
{
8002593c:	e92d4800 	push	{fp, lr}
80025940:	e28db004 	add	fp, sp, #4
80025944:	e24dd010 	sub	sp, sp, #16
    struct proc *p;
    int havekids, pid;

    acquire(&ptable.lock);
80025948:	e30e0610 	movw	r0, #58896	; 0xe610
8002594c:	e348000a 	movt	r0, #32778	; 0x800a
80025950:	eb0001cd 	bl	8002608c <acquire>

    for(;;){
        // Scan through table looking for zombie children.
        havekids = 0;
80025954:	e3a03000 	mov	r3, #0
80025958:	e50b300c 	str	r3, [fp, #-12]

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8002595c:	e59f3144 	ldr	r3, [pc, #324]	; 80025aa8 <wait+0x16c>
80025960:	e50b3008 	str	r3, [fp, #-8]
80025964:	ea000032 	b	80025a34 <wait+0xf8>
            if(p->parent != proc) {
80025968:	e51b3008 	ldr	r3, [fp, #-8]
8002596c:	e5932018 	ldr	r2, [r3, #24]
80025970:	e30e360c 	movw	r3, #58892	; 0xe60c
80025974:	e348300a 	movt	r3, #32778	; 0x800a
80025978:	e5933000 	ldr	r3, [r3]
8002597c:	e1520003 	cmp	r2, r3
80025980:	1a000027 	bne	80025a24 <wait+0xe8>
                continue;
            }

            havekids = 1;
80025984:	e3a03001 	mov	r3, #1
80025988:	e50b300c 	str	r3, [fp, #-12]

            if(p->state == ZOMBIE){
8002598c:	e51b3008 	ldr	r3, [fp, #-8]
80025990:	e5d3300c 	ldrb	r3, [r3, #12]
80025994:	e3530005 	cmp	r3, #5
80025998:	1a000022 	bne	80025a28 <wait+0xec>
                // Found one.
                pid = p->pid;
8002599c:	e51b3008 	ldr	r3, [fp, #-8]
800259a0:	e5933010 	ldr	r3, [r3, #16]
800259a4:	e50b3010 	str	r3, [fp, #-16]
                free_page(p->kstack);
800259a8:	e51b3008 	ldr	r3, [fp, #-8]
800259ac:	e5933008 	ldr	r3, [r3, #8]
800259b0:	e1a00003 	mov	r0, r3
800259b4:	ebffef4b 	bl	800216e8 <free_page>
                p->kstack = 0;
800259b8:	e51b3008 	ldr	r3, [fp, #-8]
800259bc:	e3a02000 	mov	r2, #0
800259c0:	e5832008 	str	r2, [r3, #8]
                freevm(p->pgdir);
800259c4:	e51b3008 	ldr	r3, [fp, #-8]
800259c8:	e5933004 	ldr	r3, [r3, #4]
800259cc:	e1a00003 	mov	r0, r3
800259d0:	eb000b59 	bl	8002873c <freevm>
                p->state = UNUSED;
800259d4:	e51b3008 	ldr	r3, [fp, #-8]
800259d8:	e3a02000 	mov	r2, #0
800259dc:	e5c3200c 	strb	r2, [r3, #12]
                p->pid = 0;
800259e0:	e51b3008 	ldr	r3, [fp, #-8]
800259e4:	e3a02000 	mov	r2, #0
800259e8:	e5832010 	str	r2, [r3, #16]
                p->parent = 0;
800259ec:	e51b3008 	ldr	r3, [fp, #-8]
800259f0:	e3a02000 	mov	r2, #0
800259f4:	e5832018 	str	r2, [r3, #24]
                p->name[0] = 0;
800259f8:	e51b3008 	ldr	r3, [fp, #-8]
800259fc:	e3a02000 	mov	r2, #0
80025a00:	e5c32070 	strb	r2, [r3, #112]	; 0x70
                p->killed = 0;
80025a04:	e51b3008 	ldr	r3, [fp, #-8]
80025a08:	e3a02000 	mov	r2, #0
80025a0c:	e5832028 	str	r2, [r3, #40]	; 0x28
                release(&ptable.lock);
80025a10:	e30e0610 	movw	r0, #58896	; 0xe610
80025a14:	e348000a 	movt	r0, #32778	; 0x800a
80025a18:	eb0001a5 	bl	800260b4 <release>

                return pid;
80025a1c:	e51b3010 	ldr	r3, [fp, #-16]
80025a20:	ea00001d 	b	80025a9c <wait+0x160>
        // Scan through table looking for zombie children.
        havekids = 0;

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
            if(p->parent != proc) {
                continue;
80025a24:	e1a00000 	nop			; (mov r0, r0)

    for(;;){
        // Scan through table looking for zombie children.
        havekids = 0;

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025a28:	e51b3008 	ldr	r3, [fp, #-8]
80025a2c:	e2833080 	add	r3, r3, #128	; 0x80
80025a30:	e50b3008 	str	r3, [fp, #-8]
80025a34:	e51b2008 	ldr	r2, [fp, #-8]
80025a38:	e59f306c 	ldr	r3, [pc, #108]	; 80025aac <wait+0x170>
80025a3c:	e1520003 	cmp	r2, r3
80025a40:	3affffc8 	bcc	80025968 <wait+0x2c>
                return pid;
            }
        }

        // No point waiting if we don't have any children.
        if(!havekids || proc->killed){
80025a44:	e51b300c 	ldr	r3, [fp, #-12]
80025a48:	e3530000 	cmp	r3, #0
80025a4c:	0a000005 	beq	80025a68 <wait+0x12c>
80025a50:	e30e360c 	movw	r3, #58892	; 0xe60c
80025a54:	e348300a 	movt	r3, #32778	; 0x800a
80025a58:	e5933000 	ldr	r3, [r3]
80025a5c:	e5933028 	ldr	r3, [r3, #40]	; 0x28
80025a60:	e3530000 	cmp	r3, #0
80025a64:	0a000004 	beq	80025a7c <wait+0x140>
            release(&ptable.lock);
80025a68:	e30e0610 	movw	r0, #58896	; 0xe610
80025a6c:	e348000a 	movt	r0, #32778	; 0x800a
80025a70:	eb00018f 	bl	800260b4 <release>
            return -1;
80025a74:	e3e03000 	mvn	r3, #0
80025a78:	ea000007 	b	80025a9c <wait+0x160>
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock);  //DOC: wait-sleep
80025a7c:	e30e360c 	movw	r3, #58892	; 0xe60c
80025a80:	e348300a 	movt	r3, #32778	; 0x800a
80025a84:	e5933000 	ldr	r3, [r3]
80025a88:	e1a00003 	mov	r0, r3
80025a8c:	e30e1610 	movw	r1, #58896	; 0xe610
80025a90:	e348100a 	movt	r1, #32778	; 0x800a
80025a94:	eb000095 	bl	80025cf0 <sleep>
    }
80025a98:	eaffffad 	b	80025954 <wait+0x18>
}
80025a9c:	e1a00003 	mov	r0, r3
80025aa0:	e24bd004 	sub	sp, fp, #4
80025aa4:	e8bd8800 	pop	{fp, pc}
80025aa8:	800ae644 	.word	0x800ae644
80025aac:	800b0644 	.word	0x800b0644

80025ab0 <scheduler>:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void scheduler(void)
{
80025ab0:	e92d4800 	push	{fp, lr}
80025ab4:	e28db004 	add	fp, sp, #4
80025ab8:	e24dd008 	sub	sp, sp, #8
    struct proc *p;

    for(;;){
        // Enable interrupts on this processor.
        sti();
80025abc:	ebffead8 	bl	80020624 <sti>

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
80025ac0:	e30e0610 	movw	r0, #58896	; 0xe610
80025ac4:	e348000a 	movt	r0, #32778	; 0x800a
80025ac8:	eb00016f 	bl	8002608c <acquire>

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025acc:	e59f30a8 	ldr	r3, [pc, #168]	; 80025b7c <scheduler+0xcc>
80025ad0:	e50b3008 	str	r3, [fp, #-8]
80025ad4:	ea000020 	b	80025b5c <scheduler+0xac>
            if(p->state != RUNNABLE) {
80025ad8:	e51b3008 	ldr	r3, [fp, #-8]
80025adc:	e5d3300c 	ldrb	r3, [r3, #12]
80025ae0:	e3530003 	cmp	r3, #3
80025ae4:	1a000018 	bne	80025b4c <scheduler+0x9c>
            }

            // Switch to chosen process.  It is the process's job
            // to release ptable.lock and then reacquire it
            // before jumping back to us.
            proc = p;
80025ae8:	e30e360c 	movw	r3, #58892	; 0xe60c
80025aec:	e348300a 	movt	r3, #32778	; 0x800a
80025af0:	e51b2008 	ldr	r2, [fp, #-8]
80025af4:	e5832000 	str	r2, [r3]
            switchuvm(p);
80025af8:	e51b0008 	ldr	r0, [fp, #-8]
80025afc:	eb0009fb 	bl	800282f0 <switchuvm>

            p->state = RUNNING;
80025b00:	e51b3008 	ldr	r3, [fp, #-8]
80025b04:	e3a02004 	mov	r2, #4
80025b08:	e5c3200c 	strb	r2, [r3, #12]

            swtch(&cpu->scheduler, proc->context);
80025b0c:	e30e351c 	movw	r3, #58652	; 0xe51c
80025b10:	e348300a 	movt	r3, #32778	; 0x800a
80025b14:	e5933000 	ldr	r3, [r3]
80025b18:	e2832004 	add	r2, r3, #4
80025b1c:	e30e360c 	movw	r3, #58892	; 0xe60c
80025b20:	e348300a 	movt	r3, #32778	; 0x800a
80025b24:	e5933000 	ldr	r3, [r3]
80025b28:	e5933020 	ldr	r3, [r3, #32]
80025b2c:	e1a00002 	mov	r0, r2
80025b30:	e1a01003 	mov	r1, r3
80025b34:	eb000172 	bl	80026104 <swtch>
            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
80025b38:	e30e360c 	movw	r3, #58892	; 0xe60c
80025b3c:	e348300a 	movt	r3, #32778	; 0x800a
80025b40:	e3a02000 	mov	r2, #0
80025b44:	e5832000 	str	r2, [r3]
80025b48:	ea000000 	b	80025b50 <scheduler+0xa0>
        // Loop over process table looking for process to run.
        acquire(&ptable.lock);

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
            if(p->state != RUNNABLE) {
                continue;
80025b4c:	e1a00000 	nop			; (mov r0, r0)
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025b50:	e51b3008 	ldr	r3, [fp, #-8]
80025b54:	e2833080 	add	r3, r3, #128	; 0x80
80025b58:	e50b3008 	str	r3, [fp, #-8]
80025b5c:	e51b2008 	ldr	r2, [fp, #-8]
80025b60:	e59f3018 	ldr	r3, [pc, #24]	; 80025b80 <scheduler+0xd0>
80025b64:	e1520003 	cmp	r2, r3
80025b68:	3affffda 	bcc	80025ad8 <scheduler+0x28>
            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
        }

        release(&ptable.lock);
80025b6c:	e30e0610 	movw	r0, #58896	; 0xe610
80025b70:	e348000a 	movt	r0, #32778	; 0x800a
80025b74:	eb00014e 	bl	800260b4 <release>
    }
80025b78:	eaffffcf 	b	80025abc <scheduler+0xc>
80025b7c:	800ae644 	.word	0x800ae644
80025b80:	800b0644 	.word	0x800b0644

80025b84 <sched>:
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.
void sched(void)
{
80025b84:	e92d4800 	push	{fp, lr}
80025b88:	e28db004 	add	fp, sp, #4
80025b8c:	e24dd008 	sub	sp, sp, #8
    int intena;

    //show_callstk ("sched");

    if(!holding(&ptable.lock)) {
80025b90:	e30e0610 	movw	r0, #58896	; 0xe610
80025b94:	e348000a 	movt	r0, #32778	; 0x800a
80025b98:	eb00014f 	bl	800260dc <holding>
80025b9c:	e1a03000 	mov	r3, r0
80025ba0:	e3530000 	cmp	r3, #0
80025ba4:	1a000002 	bne	80025bb4 <sched+0x30>
        panic("sched ptable.lock");
80025ba8:	e3090ef8 	movw	r0, #40696	; 0x9ef8
80025bac:	e3480002 	movt	r0, #32770	; 0x8002
80025bb0:	ebfff001 	bl	80021bbc <panic>
    }

    if(cpu->ncli != 1) {
80025bb4:	e30e351c 	movw	r3, #58652	; 0xe51c
80025bb8:	e348300a 	movt	r3, #32778	; 0x800a
80025bbc:	e5933000 	ldr	r3, [r3]
80025bc0:	e593300c 	ldr	r3, [r3, #12]
80025bc4:	e3530001 	cmp	r3, #1
80025bc8:	0a000002 	beq	80025bd8 <sched+0x54>
        panic("sched locks");
80025bcc:	e3090f0c 	movw	r0, #40716	; 0x9f0c
80025bd0:	e3480002 	movt	r0, #32770	; 0x8002
80025bd4:	ebffeff8 	bl	80021bbc <panic>
    }

    if(proc->state == RUNNING) {
80025bd8:	e30e360c 	movw	r3, #58892	; 0xe60c
80025bdc:	e348300a 	movt	r3, #32778	; 0x800a
80025be0:	e5933000 	ldr	r3, [r3]
80025be4:	e5d3300c 	ldrb	r3, [r3, #12]
80025be8:	e3530004 	cmp	r3, #4
80025bec:	1a000002 	bne	80025bfc <sched+0x78>
        panic("sched running");
80025bf0:	e3090f18 	movw	r0, #40728	; 0x9f18
80025bf4:	e3480002 	movt	r0, #32770	; 0x8002
80025bf8:	ebffefef 	bl	80021bbc <panic>
    }

    if(int_enabled ()) {
80025bfc:	ebffeaa5 	bl	80020698 <int_enabled>
80025c00:	e1a03000 	mov	r3, r0
80025c04:	e3530000 	cmp	r3, #0
80025c08:	0a000002 	beq	80025c18 <sched+0x94>
        panic("sched interruptible");
80025c0c:	e3090f28 	movw	r0, #40744	; 0x9f28
80025c10:	e3480002 	movt	r0, #32770	; 0x8002
80025c14:	ebffefe8 	bl	80021bbc <panic>
    }

    intena = cpu->intena;
80025c18:	e30e351c 	movw	r3, #58652	; 0xe51c
80025c1c:	e348300a 	movt	r3, #32778	; 0x800a
80025c20:	e5933000 	ldr	r3, [r3]
80025c24:	e5933010 	ldr	r3, [r3, #16]
80025c28:	e50b3008 	str	r3, [fp, #-8]
    swtch(&proc->context, cpu->scheduler);
80025c2c:	e30e360c 	movw	r3, #58892	; 0xe60c
80025c30:	e348300a 	movt	r3, #32778	; 0x800a
80025c34:	e5933000 	ldr	r3, [r3]
80025c38:	e2832020 	add	r2, r3, #32
80025c3c:	e30e351c 	movw	r3, #58652	; 0xe51c
80025c40:	e348300a 	movt	r3, #32778	; 0x800a
80025c44:	e5933000 	ldr	r3, [r3]
80025c48:	e5933004 	ldr	r3, [r3, #4]
80025c4c:	e1a00002 	mov	r0, r2
80025c50:	e1a01003 	mov	r1, r3
80025c54:	eb00012a 	bl	80026104 <swtch>
    cpu->intena = intena;
80025c58:	e30e351c 	movw	r3, #58652	; 0xe51c
80025c5c:	e348300a 	movt	r3, #32778	; 0x800a
80025c60:	e5933000 	ldr	r3, [r3]
80025c64:	e51b2008 	ldr	r2, [fp, #-8]
80025c68:	e5832010 	str	r2, [r3, #16]
}
80025c6c:	e24bd004 	sub	sp, fp, #4
80025c70:	e8bd8800 	pop	{fp, pc}

80025c74 <yield>:

// Give up the CPU for one scheduling round.
void yield(void)
{
80025c74:	e92d4800 	push	{fp, lr}
80025c78:	e28db004 	add	fp, sp, #4
    acquire(&ptable.lock);  //DOC: yieldlock
80025c7c:	e30e0610 	movw	r0, #58896	; 0xe610
80025c80:	e348000a 	movt	r0, #32778	; 0x800a
80025c84:	eb000100 	bl	8002608c <acquire>
    proc->state = RUNNABLE;
80025c88:	e30e360c 	movw	r3, #58892	; 0xe60c
80025c8c:	e348300a 	movt	r3, #32778	; 0x800a
80025c90:	e5933000 	ldr	r3, [r3]
80025c94:	e3a02003 	mov	r2, #3
80025c98:	e5c3200c 	strb	r2, [r3, #12]
    sched();
80025c9c:	ebffffb8 	bl	80025b84 <sched>
    release(&ptable.lock);
80025ca0:	e30e0610 	movw	r0, #58896	; 0xe610
80025ca4:	e348000a 	movt	r0, #32778	; 0x800a
80025ca8:	eb000101 	bl	800260b4 <release>
}
80025cac:	e8bd8800 	pop	{fp, pc}

80025cb0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
80025cb0:	e92d4800 	push	{fp, lr}
80025cb4:	e28db004 	add	fp, sp, #4
    static int first = 1;

    // Still holding ptable.lock from scheduler.
    release(&ptable.lock);
80025cb8:	e30e0610 	movw	r0, #58896	; 0xe610
80025cbc:	e348000a 	movt	r0, #32778	; 0x800a
80025cc0:	eb0000fb 	bl	800260b4 <release>

    if (first) {
80025cc4:	e30b3030 	movw	r3, #45104	; 0xb030
80025cc8:	e3483002 	movt	r3, #32770	; 0x8002
80025ccc:	e5933000 	ldr	r3, [r3]
80025cd0:	e3530000 	cmp	r3, #0
80025cd4:	0a000004 	beq	80025cec <forkret+0x3c>
        // Some initialization functions must be run in the context
        // of a regular process (e.g., they call sleep), and thus cannot
        // be run from main().
        first = 0;
80025cd8:	e30b3030 	movw	r3, #45104	; 0xb030
80025cdc:	e3483002 	movt	r3, #32770	; 0x8002
80025ce0:	e3a02000 	mov	r2, #0
80025ce4:	e5832000 	str	r2, [r3]
        initlog();
80025ce8:	ebfff9aa 	bl	80024398 <initlog>
    }

    // Return to "caller", actually trapret (see allocproc).
}
80025cec:	e8bd8800 	pop	{fp, pc}

80025cf0 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
80025cf0:	e92d4800 	push	{fp, lr}
80025cf4:	e28db004 	add	fp, sp, #4
80025cf8:	e24dd008 	sub	sp, sp, #8
80025cfc:	e50b0008 	str	r0, [fp, #-8]
80025d00:	e50b100c 	str	r1, [fp, #-12]
    //show_callstk("sleep");

    if(proc == 0) {
80025d04:	e30e360c 	movw	r3, #58892	; 0xe60c
80025d08:	e348300a 	movt	r3, #32778	; 0x800a
80025d0c:	e5933000 	ldr	r3, [r3]
80025d10:	e3530000 	cmp	r3, #0
80025d14:	1a000002 	bne	80025d24 <sleep+0x34>
        panic("sleep");
80025d18:	e3090f3c 	movw	r0, #40764	; 0x9f3c
80025d1c:	e3480002 	movt	r0, #32770	; 0x8002
80025d20:	ebffefa5 	bl	80021bbc <panic>
    }

    if(lk == 0) {
80025d24:	e51b300c 	ldr	r3, [fp, #-12]
80025d28:	e3530000 	cmp	r3, #0
80025d2c:	1a000002 	bne	80025d3c <sleep+0x4c>
        panic("sleep without lk");
80025d30:	e3090f44 	movw	r0, #40772	; 0x9f44
80025d34:	e3480002 	movt	r0, #32770	; 0x8002
80025d38:	ebffef9f 	bl	80021bbc <panic>

    // Must acquire ptable.lock in order to change p->state and then call
    // sched. Once we hold ptable.lock, we can be guaranteed that we won't
    // miss any wakeup (wakeup runs with ptable.lock locked), so it's okay
    // to release lk.
    if(lk != &ptable.lock){  //DOC: sleeplock0
80025d3c:	e51b200c 	ldr	r2, [fp, #-12]
80025d40:	e30e3610 	movw	r3, #58896	; 0xe610
80025d44:	e348300a 	movt	r3, #32778	; 0x800a
80025d48:	e1520003 	cmp	r2, r3
80025d4c:	0a000004 	beq	80025d64 <sleep+0x74>
        acquire(&ptable.lock);  //DOC: sleeplock1
80025d50:	e30e0610 	movw	r0, #58896	; 0xe610
80025d54:	e348000a 	movt	r0, #32778	; 0x800a
80025d58:	eb0000cb 	bl	8002608c <acquire>
        release(lk);
80025d5c:	e51b000c 	ldr	r0, [fp, #-12]
80025d60:	eb0000d3 	bl	800260b4 <release>
    }

    // Go to sleep.
    proc->chan = chan;
80025d64:	e30e360c 	movw	r3, #58892	; 0xe60c
80025d68:	e348300a 	movt	r3, #32778	; 0x800a
80025d6c:	e5933000 	ldr	r3, [r3]
80025d70:	e51b2008 	ldr	r2, [fp, #-8]
80025d74:	e5832024 	str	r2, [r3, #36]	; 0x24
    proc->state = SLEEPING;
80025d78:	e30e360c 	movw	r3, #58892	; 0xe60c
80025d7c:	e348300a 	movt	r3, #32778	; 0x800a
80025d80:	e5933000 	ldr	r3, [r3]
80025d84:	e3a02002 	mov	r2, #2
80025d88:	e5c3200c 	strb	r2, [r3, #12]
    sched();
80025d8c:	ebffff7c 	bl	80025b84 <sched>

    // Tidy up.
    proc->chan = 0;
80025d90:	e30e360c 	movw	r3, #58892	; 0xe60c
80025d94:	e348300a 	movt	r3, #32778	; 0x800a
80025d98:	e5933000 	ldr	r3, [r3]
80025d9c:	e3a02000 	mov	r2, #0
80025da0:	e5832024 	str	r2, [r3, #36]	; 0x24

    // Reacquire original lock.
    if(lk != &ptable.lock){  //DOC: sleeplock2
80025da4:	e51b200c 	ldr	r2, [fp, #-12]
80025da8:	e30e3610 	movw	r3, #58896	; 0xe610
80025dac:	e348300a 	movt	r3, #32778	; 0x800a
80025db0:	e1520003 	cmp	r2, r3
80025db4:	0a000004 	beq	80025dcc <sleep+0xdc>
        release(&ptable.lock);
80025db8:	e30e0610 	movw	r0, #58896	; 0xe610
80025dbc:	e348000a 	movt	r0, #32778	; 0x800a
80025dc0:	eb0000bb 	bl	800260b4 <release>
        acquire(lk);
80025dc4:	e51b000c 	ldr	r0, [fp, #-12]
80025dc8:	eb0000af 	bl	8002608c <acquire>
    }
}
80025dcc:	e24bd004 	sub	sp, fp, #4
80025dd0:	e8bd8800 	pop	{fp, pc}

80025dd4 <wakeup1>:

//PAGEBREAK!
// Wake up all processes sleeping on chan. The ptable lock must be held.
static void wakeup1(void *chan)
{
80025dd4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80025dd8:	e28db000 	add	fp, sp, #0
80025ddc:	e24dd014 	sub	sp, sp, #20
80025de0:	e50b0010 	str	r0, [fp, #-16]
    struct proc *p;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80025de4:	e59f305c 	ldr	r3, [pc, #92]	; 80025e48 <wakeup1+0x74>
80025de8:	e50b3008 	str	r3, [fp, #-8]
80025dec:	ea00000e 	b	80025e2c <wakeup1+0x58>
        if(p->state == SLEEPING && p->chan == chan) {
80025df0:	e51b3008 	ldr	r3, [fp, #-8]
80025df4:	e5d3300c 	ldrb	r3, [r3, #12]
80025df8:	e3530002 	cmp	r3, #2
80025dfc:	1a000007 	bne	80025e20 <wakeup1+0x4c>
80025e00:	e51b3008 	ldr	r3, [fp, #-8]
80025e04:	e5932024 	ldr	r2, [r3, #36]	; 0x24
80025e08:	e51b3010 	ldr	r3, [fp, #-16]
80025e0c:	e1520003 	cmp	r2, r3
80025e10:	1a000002 	bne	80025e20 <wakeup1+0x4c>
            p->state = RUNNABLE;
80025e14:	e51b3008 	ldr	r3, [fp, #-8]
80025e18:	e3a02003 	mov	r2, #3
80025e1c:	e5c3200c 	strb	r2, [r3, #12]
// Wake up all processes sleeping on chan. The ptable lock must be held.
static void wakeup1(void *chan)
{
    struct proc *p;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80025e20:	e51b3008 	ldr	r3, [fp, #-8]
80025e24:	e2833080 	add	r3, r3, #128	; 0x80
80025e28:	e50b3008 	str	r3, [fp, #-8]
80025e2c:	e51b2008 	ldr	r2, [fp, #-8]
80025e30:	e59f3014 	ldr	r3, [pc, #20]	; 80025e4c <wakeup1+0x78>
80025e34:	e1520003 	cmp	r2, r3
80025e38:	3affffec 	bcc	80025df0 <wakeup1+0x1c>
        if(p->state == SLEEPING && p->chan == chan) {
            p->state = RUNNABLE;
        }
    }
}
80025e3c:	e28bd000 	add	sp, fp, #0
80025e40:	e8bd0800 	pop	{fp}
80025e44:	e12fff1e 	bx	lr
80025e48:	800ae644 	.word	0x800ae644
80025e4c:	800b0644 	.word	0x800b0644

80025e50 <wakeup>:

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
80025e50:	e92d4800 	push	{fp, lr}
80025e54:	e28db004 	add	fp, sp, #4
80025e58:	e24dd008 	sub	sp, sp, #8
80025e5c:	e50b0008 	str	r0, [fp, #-8]
    acquire(&ptable.lock);
80025e60:	e30e0610 	movw	r0, #58896	; 0xe610
80025e64:	e348000a 	movt	r0, #32778	; 0x800a
80025e68:	eb000087 	bl	8002608c <acquire>
    wakeup1(chan);
80025e6c:	e51b0008 	ldr	r0, [fp, #-8]
80025e70:	ebffffd7 	bl	80025dd4 <wakeup1>
    release(&ptable.lock);
80025e74:	e30e0610 	movw	r0, #58896	; 0xe610
80025e78:	e348000a 	movt	r0, #32778	; 0x800a
80025e7c:	eb00008c 	bl	800260b4 <release>
}
80025e80:	e24bd004 	sub	sp, fp, #4
80025e84:	e8bd8800 	pop	{fp, pc}

80025e88 <kill>:

// Kill the process with the given pid. Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
80025e88:	e92d4800 	push	{fp, lr}
80025e8c:	e28db004 	add	fp, sp, #4
80025e90:	e24dd010 	sub	sp, sp, #16
80025e94:	e50b0010 	str	r0, [fp, #-16]
    struct proc *p;

    acquire(&ptable.lock);
80025e98:	e30e0610 	movw	r0, #58896	; 0xe610
80025e9c:	e348000a 	movt	r0, #32778	; 0x800a
80025ea0:	eb000079 	bl	8002608c <acquire>

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025ea4:	e59f308c 	ldr	r3, [pc, #140]	; 80025f38 <kill+0xb0>
80025ea8:	e50b3008 	str	r3, [fp, #-8]
80025eac:	ea000016 	b	80025f0c <kill+0x84>
        if(p->pid == pid){
80025eb0:	e51b3008 	ldr	r3, [fp, #-8]
80025eb4:	e5932010 	ldr	r2, [r3, #16]
80025eb8:	e51b3010 	ldr	r3, [fp, #-16]
80025ebc:	e1520003 	cmp	r2, r3
80025ec0:	1a00000e 	bne	80025f00 <kill+0x78>
            p->killed = 1;
80025ec4:	e51b3008 	ldr	r3, [fp, #-8]
80025ec8:	e3a02001 	mov	r2, #1
80025ecc:	e5832028 	str	r2, [r3, #40]	; 0x28

            // Wake process from sleep if necessary.
            if(p->state == SLEEPING) {
80025ed0:	e51b3008 	ldr	r3, [fp, #-8]
80025ed4:	e5d3300c 	ldrb	r3, [r3, #12]
80025ed8:	e3530002 	cmp	r3, #2
80025edc:	1a000002 	bne	80025eec <kill+0x64>
                p->state = RUNNABLE;
80025ee0:	e51b3008 	ldr	r3, [fp, #-8]
80025ee4:	e3a02003 	mov	r2, #3
80025ee8:	e5c3200c 	strb	r2, [r3, #12]
            }

            release(&ptable.lock);
80025eec:	e30e0610 	movw	r0, #58896	; 0xe610
80025ef0:	e348000a 	movt	r0, #32778	; 0x800a
80025ef4:	eb00006e 	bl	800260b4 <release>
            return 0;
80025ef8:	e3a03000 	mov	r3, #0
80025efc:	ea00000a 	b	80025f2c <kill+0xa4>
{
    struct proc *p;

    acquire(&ptable.lock);

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025f00:	e51b3008 	ldr	r3, [fp, #-8]
80025f04:	e2833080 	add	r3, r3, #128	; 0x80
80025f08:	e50b3008 	str	r3, [fp, #-8]
80025f0c:	e51b2008 	ldr	r2, [fp, #-8]
80025f10:	e59f3024 	ldr	r3, [pc, #36]	; 80025f3c <kill+0xb4>
80025f14:	e1520003 	cmp	r2, r3
80025f18:	3affffe4 	bcc	80025eb0 <kill+0x28>
            release(&ptable.lock);
            return 0;
        }
    }

    release(&ptable.lock);
80025f1c:	e30e0610 	movw	r0, #58896	; 0xe610
80025f20:	e348000a 	movt	r0, #32778	; 0x800a
80025f24:	eb000062 	bl	800260b4 <release>
    return -1;
80025f28:	e3e03000 	mvn	r3, #0
}
80025f2c:	e1a00003 	mov	r0, r3
80025f30:	e24bd004 	sub	sp, fp, #4
80025f34:	e8bd8800 	pop	{fp, pc}
80025f38:	800ae644 	.word	0x800ae644
80025f3c:	800b0644 	.word	0x800b0644

80025f40 <procdump>:

//PAGEBREAK: 36
// Print a process listing to console.  For debugging. Runs when user
// types ^P on console. No lock to avoid wedging a stuck machine further.
void procdump(void)
{
80025f40:	e92d4800 	push	{fp, lr}
80025f44:	e28db004 	add	fp, sp, #4
80025f48:	e24dd008 	sub	sp, sp, #8
    };

    struct proc *p;
    char *state;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025f4c:	e59f30cc 	ldr	r3, [pc, #204]	; 80026020 <procdump+0xe0>
80025f50:	e50b3008 	str	r3, [fp, #-8]
80025f54:	ea000028 	b	80025ffc <procdump+0xbc>
        if(p->state == UNUSED) {
80025f58:	e51b3008 	ldr	r3, [fp, #-8]
80025f5c:	e5d3300c 	ldrb	r3, [r3, #12]
80025f60:	e3530000 	cmp	r3, #0
80025f64:	0a000020 	beq	80025fec <procdump+0xac>
            continue;
        }

        if(p->state >= 0 && p->state < NELEM(states) && states[p->state]) {
80025f68:	e51b3008 	ldr	r3, [fp, #-8]
80025f6c:	e5d3300c 	ldrb	r3, [r3, #12]
80025f70:	e3530005 	cmp	r3, #5
80025f74:	8a00000f 	bhi	80025fb8 <procdump+0x78>
80025f78:	e51b3008 	ldr	r3, [fp, #-8]
80025f7c:	e5d3300c 	ldrb	r3, [r3, #12]
80025f80:	e1a02003 	mov	r2, r3
80025f84:	e30b3018 	movw	r3, #45080	; 0xb018
80025f88:	e3483002 	movt	r3, #32770	; 0x8002
80025f8c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80025f90:	e3530000 	cmp	r3, #0
80025f94:	0a000007 	beq	80025fb8 <procdump+0x78>
            state = states[p->state];
80025f98:	e51b3008 	ldr	r3, [fp, #-8]
80025f9c:	e5d3300c 	ldrb	r3, [r3, #12]
80025fa0:	e1a02003 	mov	r2, r3
80025fa4:	e30b3018 	movw	r3, #45080	; 0xb018
80025fa8:	e3483002 	movt	r3, #32770	; 0x8002
80025fac:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80025fb0:	e50b300c 	str	r3, [fp, #-12]
80025fb4:	ea000002 	b	80025fc4 <procdump+0x84>
        } else {
            state = "???";
80025fb8:	e3093f58 	movw	r3, #40792	; 0x9f58
80025fbc:	e3483002 	movt	r3, #32770	; 0x8002
80025fc0:	e50b300c 	str	r3, [fp, #-12]
        }

        cprintf("%d %s %s\n", p->pid, state, p->name);
80025fc4:	e51b3008 	ldr	r3, [fp, #-8]
80025fc8:	e5932010 	ldr	r2, [r3, #16]
80025fcc:	e51b3008 	ldr	r3, [fp, #-8]
80025fd0:	e2833070 	add	r3, r3, #112	; 0x70
80025fd4:	e3090f5c 	movw	r0, #40796	; 0x9f5c
80025fd8:	e3480002 	movt	r0, #32770	; 0x8002
80025fdc:	e1a01002 	mov	r1, r2
80025fe0:	e51b200c 	ldr	r2, [fp, #-12]
80025fe4:	ebffee69 	bl	80021990 <cprintf>
80025fe8:	ea000000 	b	80025ff0 <procdump+0xb0>
    struct proc *p;
    char *state;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p->state == UNUSED) {
            continue;
80025fec:	e1a00000 	nop			; (mov r0, r0)
    };

    struct proc *p;
    char *state;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80025ff0:	e51b3008 	ldr	r3, [fp, #-8]
80025ff4:	e2833080 	add	r3, r3, #128	; 0x80
80025ff8:	e50b3008 	str	r3, [fp, #-8]
80025ffc:	e51b2008 	ldr	r2, [fp, #-8]
80026000:	e59f301c 	ldr	r3, [pc, #28]	; 80026024 <procdump+0xe4>
80026004:	e1520003 	cmp	r2, r3
80026008:	3affffd2 	bcc	80025f58 <procdump+0x18>
        }

        cprintf("%d %s %s\n", p->pid, state, p->name);
    }

    show_callstk("procdump: \n");
8002600c:	e3090f68 	movw	r0, #40808	; 0x9f68
80026010:	e3480002 	movt	r0, #32770	; 0x8002
80026014:	ebffea2b 	bl	800208c8 <show_callstk>
}
80026018:	e24bd004 	sub	sp, fp, #4
8002601c:	e8bd8800 	pop	{fp, pc}
80026020:	800ae644 	.word	0x800ae644
80026024:	800b0644 	.word	0x800b0644

80026028 <kthread_create>:

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int kthread_create()//void*(*start_func)(),)//fork(void)
{
80026028:	e92d4800 	push	{fp, lr}
8002602c:	e28db004 	add	fp, sp, #4
    cprintf("In kthread_create syscall\n");
80026030:	e3090f74 	movw	r0, #40820	; 0x9f74
80026034:	e3480002 	movt	r0, #32770	; 0x8002
80026038:	ebffee54 	bl	80021990 <cprintf>
    return 0;
8002603c:	e3a03000 	mov	r3, #0
    pid = np->pid;
    np->state = RUNNABLE;
    safestrcpy(np->name, proc->name, sizeof(proc->name));

    return pid; */
}
80026040:	e1a00003 	mov	r0, r3
80026044:	e8bd8800 	pop	{fp, pc}

80026048 <initlock>:
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

void initlock(struct spinlock *lk, char *name)
{
80026048:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
8002604c:	e28db000 	add	fp, sp, #0
80026050:	e24dd00c 	sub	sp, sp, #12
80026054:	e50b0008 	str	r0, [fp, #-8]
80026058:	e50b100c 	str	r1, [fp, #-12]
    lk->name = name;
8002605c:	e51b3008 	ldr	r3, [fp, #-8]
80026060:	e51b200c 	ldr	r2, [fp, #-12]
80026064:	e5832004 	str	r2, [r3, #4]
    lk->locked = 0;
80026068:	e51b3008 	ldr	r3, [fp, #-8]
8002606c:	e3a02000 	mov	r2, #0
80026070:	e5832000 	str	r2, [r3]
    lk->cpu = 0;
80026074:	e51b3008 	ldr	r3, [fp, #-8]
80026078:	e3a02000 	mov	r2, #0
8002607c:	e5832008 	str	r2, [r3, #8]
}
80026080:	e28bd000 	add	sp, fp, #0
80026084:	e8bd0800 	pop	{fp}
80026088:	e12fff1e 	bx	lr

8002608c <acquire>:
// Acquire the lock.
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void acquire(struct spinlock *lk)
{
8002608c:	e92d4800 	push	{fp, lr}
80026090:	e28db004 	add	fp, sp, #4
80026094:	e24dd008 	sub	sp, sp, #8
80026098:	e50b0008 	str	r0, [fp, #-8]
    pushcli();		// disable interrupts to avoid deadlock.
8002609c:	ebffe98b 	bl	800206d0 <pushcli>
    lk->locked = 1;	// set the lock status to make the kernel happy
800260a0:	e51b3008 	ldr	r3, [fp, #-8]
800260a4:	e3a02001 	mov	r2, #1
800260a8:	e5832000 	str	r2, [r3]
    // Record info about lock acquisition for debugging.
    lk->cpu = cpu;
    getcallerpcs(get_fp(), lk->pcs);

#endif
}
800260ac:	e24bd004 	sub	sp, fp, #4
800260b0:	e8bd8800 	pop	{fp, pc}

800260b4 <release>:

// Release the lock.
void release(struct spinlock *lk)
{
800260b4:	e92d4800 	push	{fp, lr}
800260b8:	e28db004 	add	fp, sp, #4
800260bc:	e24dd008 	sub	sp, sp, #8
800260c0:	e50b0008 	str	r0, [fp, #-8]
    // The xchg being asm volatile ensures gcc emits it after
    // the above assignments (and after the critical section).
    xchg(&lk->locked, 0);
#endif

    lk->locked = 0; // set the lock state to keep the kernel happy
800260c4:	e51b3008 	ldr	r3, [fp, #-8]
800260c8:	e3a02000 	mov	r2, #0
800260cc:	e5832000 	str	r2, [r3]
    popcli();
800260d0:	ebffe997 	bl	80020734 <popcli>
}
800260d4:	e24bd004 	sub	sp, fp, #4
800260d8:	e8bd8800 	pop	{fp, pc}

800260dc <holding>:


// Check whether this cpu is holding the lock.
int holding(struct spinlock *lock)
{
800260dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800260e0:	e28db000 	add	fp, sp, #0
800260e4:	e24dd00c 	sub	sp, sp, #12
800260e8:	e50b0008 	str	r0, [fp, #-8]
    return lock->locked; // && lock->cpu == cpus;
800260ec:	e51b3008 	ldr	r3, [fp, #-8]
800260f0:	e5933000 	ldr	r3, [r3]
}
800260f4:	e1a00003 	mov	r0, r3
800260f8:	e28bd000 	add	sp, fp, #0
800260fc:	e8bd0800 	pop	{fp}
80026100:	e12fff1e 	bx	lr

80026104 <swtch>:
80026104:	e92d5ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80026108:	e580d000 	str	sp, [r0]
8002610c:	e1a0d001 	mov	sp, r1
80026110:	e8bd5ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80026114:	e12fff1e 	bx	lr

80026118 <fetchint>:
// in r0. Arguments on the stack, from the user call to the C library
// system call function. The saved user sp points to the first argument.

// Fetch the int at addr from the current process.
int fetchint(uint addr, int *ip)
{
80026118:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
8002611c:	e28db000 	add	fp, sp, #0
80026120:	e24dd00c 	sub	sp, sp, #12
80026124:	e50b0008 	str	r0, [fp, #-8]
80026128:	e50b100c 	str	r1, [fp, #-12]
    if(addr >= proc->sz || addr+4 > proc->sz) {
8002612c:	e30e360c 	movw	r3, #58892	; 0xe60c
80026130:	e348300a 	movt	r3, #32778	; 0x800a
80026134:	e5933000 	ldr	r3, [r3]
80026138:	e5932000 	ldr	r2, [r3]
8002613c:	e51b3008 	ldr	r3, [fp, #-8]
80026140:	e1520003 	cmp	r2, r3
80026144:	9a000007 	bls	80026168 <fetchint+0x50>
80026148:	e51b3008 	ldr	r3, [fp, #-8]
8002614c:	e2832004 	add	r2, r3, #4
80026150:	e30e360c 	movw	r3, #58892	; 0xe60c
80026154:	e348300a 	movt	r3, #32778	; 0x800a
80026158:	e5933000 	ldr	r3, [r3]
8002615c:	e5933000 	ldr	r3, [r3]
80026160:	e1520003 	cmp	r2, r3
80026164:	9a000001 	bls	80026170 <fetchint+0x58>
        return -1;
80026168:	e3e03000 	mvn	r3, #0
8002616c:	ea000004 	b	80026184 <fetchint+0x6c>
    }

    *ip = *(int*)(addr);
80026170:	e51b3008 	ldr	r3, [fp, #-8]
80026174:	e5932000 	ldr	r2, [r3]
80026178:	e51b300c 	ldr	r3, [fp, #-12]
8002617c:	e5832000 	str	r2, [r3]
    return 0;
80026180:	e3a03000 	mov	r3, #0
}
80026184:	e1a00003 	mov	r0, r3
80026188:	e28bd000 	add	sp, fp, #0
8002618c:	e8bd0800 	pop	{fp}
80026190:	e12fff1e 	bx	lr

80026194 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int fetchstr(uint addr, char **pp)
{
80026194:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80026198:	e28db000 	add	fp, sp, #0
8002619c:	e24dd014 	sub	sp, sp, #20
800261a0:	e50b0010 	str	r0, [fp, #-16]
800261a4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char *s, *ep;

    if(addr >= proc->sz) {
800261a8:	e30e360c 	movw	r3, #58892	; 0xe60c
800261ac:	e348300a 	movt	r3, #32778	; 0x800a
800261b0:	e5933000 	ldr	r3, [r3]
800261b4:	e5932000 	ldr	r2, [r3]
800261b8:	e51b3010 	ldr	r3, [fp, #-16]
800261bc:	e1520003 	cmp	r2, r3
800261c0:	8a000001 	bhi	800261cc <fetchstr+0x38>
        return -1;
800261c4:	e3e03000 	mvn	r3, #0
800261c8:	ea00001c 	b	80026240 <fetchstr+0xac>
    }

    *pp = (char*)addr;
800261cc:	e51b2010 	ldr	r2, [fp, #-16]
800261d0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
800261d4:	e5832000 	str	r2, [r3]
    ep = (char*)proc->sz;
800261d8:	e30e360c 	movw	r3, #58892	; 0xe60c
800261dc:	e348300a 	movt	r3, #32778	; 0x800a
800261e0:	e5933000 	ldr	r3, [r3]
800261e4:	e5933000 	ldr	r3, [r3]
800261e8:	e50b300c 	str	r3, [fp, #-12]

    for(s = *pp; s < ep; s++) {
800261ec:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
800261f0:	e5933000 	ldr	r3, [r3]
800261f4:	e50b3008 	str	r3, [fp, #-8]
800261f8:	ea00000b 	b	8002622c <fetchstr+0x98>
        if(*s == 0) {
800261fc:	e51b3008 	ldr	r3, [fp, #-8]
80026200:	e5d33000 	ldrb	r3, [r3]
80026204:	e3530000 	cmp	r3, #0
80026208:	1a000004 	bne	80026220 <fetchstr+0x8c>
            return s - *pp;
8002620c:	e51b2008 	ldr	r2, [fp, #-8]
80026210:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80026214:	e5933000 	ldr	r3, [r3]
80026218:	e0633002 	rsb	r3, r3, r2
8002621c:	ea000007 	b	80026240 <fetchstr+0xac>
    }

    *pp = (char*)addr;
    ep = (char*)proc->sz;

    for(s = *pp; s < ep; s++) {
80026220:	e51b3008 	ldr	r3, [fp, #-8]
80026224:	e2833001 	add	r3, r3, #1
80026228:	e50b3008 	str	r3, [fp, #-8]
8002622c:	e51b2008 	ldr	r2, [fp, #-8]
80026230:	e51b300c 	ldr	r3, [fp, #-12]
80026234:	e1520003 	cmp	r2, r3
80026238:	3affffef 	bcc	800261fc <fetchstr+0x68>
        if(*s == 0) {
            return s - *pp;
        }
    }

    return -1;
8002623c:	e3e03000 	mvn	r3, #0
}
80026240:	e1a00003 	mov	r0, r3
80026244:	e28bd000 	add	sp, fp, #0
80026248:	e8bd0800 	pop	{fp}
8002624c:	e12fff1e 	bx	lr

80026250 <argint>:

// Fetch the nth (starting from 0) 32-bit system call argument.
// In our ABI, r0 contains system call index, r1-r4 contain parameters.
// now we support system calls with at most 4 parameters.
int argint(int n, int *ip)
{
80026250:	e92d4800 	push	{fp, lr}
80026254:	e28db004 	add	fp, sp, #4
80026258:	e24dd008 	sub	sp, sp, #8
8002625c:	e50b0008 	str	r0, [fp, #-8]
80026260:	e50b100c 	str	r1, [fp, #-12]
    if (n > 3) {
80026264:	e51b3008 	ldr	r3, [fp, #-8]
80026268:	e3530003 	cmp	r3, #3
8002626c:	da000002 	ble	8002627c <argint+0x2c>
        panic ("too many system call parameters\n");
80026270:	e3090fc0 	movw	r0, #40896	; 0x9fc0
80026274:	e3480002 	movt	r0, #32770	; 0x8002
80026278:	ebffee4f 	bl	80021bbc <panic>
    }

    *ip = *(&proc->tf->r1 + n);
8002627c:	e30e360c 	movw	r3, #58892	; 0xe60c
80026280:	e348300a 	movt	r3, #32778	; 0x800a
80026284:	e5933000 	ldr	r3, [r3]
80026288:	e593301c 	ldr	r3, [r3, #28]
8002628c:	e2832014 	add	r2, r3, #20
80026290:	e51b3008 	ldr	r3, [fp, #-8]
80026294:	e1a03103 	lsl	r3, r3, #2
80026298:	e0823003 	add	r3, r2, r3
8002629c:	e5933000 	ldr	r3, [r3]
800262a0:	e1a02003 	mov	r2, r3
800262a4:	e51b300c 	ldr	r3, [fp, #-12]
800262a8:	e5832000 	str	r2, [r3]

    return 0;
800262ac:	e3a03000 	mov	r3, #0
}
800262b0:	e1a00003 	mov	r0, r3
800262b4:	e24bd004 	sub	sp, fp, #4
800262b8:	e8bd8800 	pop	{fp, pc}

800262bc <argptr>:

// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
int argptr(int n, char **pp, int size)
{
800262bc:	e92d4800 	push	{fp, lr}
800262c0:	e28db004 	add	fp, sp, #4
800262c4:	e24dd018 	sub	sp, sp, #24
800262c8:	e50b0010 	str	r0, [fp, #-16]
800262cc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
800262d0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    int i;

    if(argint(n, &i) < 0) {
800262d4:	e51b0010 	ldr	r0, [fp, #-16]
800262d8:	e24b3008 	sub	r3, fp, #8
800262dc:	e1a01003 	mov	r1, r3
800262e0:	ebffffda 	bl	80026250 <argint>
800262e4:	e1a03000 	mov	r3, r0
800262e8:	e3530000 	cmp	r3, #0
800262ec:	aa000001 	bge	800262f8 <argptr+0x3c>
        return -1;
800262f0:	e3e03000 	mvn	r3, #0
800262f4:	ea000018 	b	8002635c <argptr+0xa0>
    }

    if((uint)i >= proc->sz || (uint)i+size > proc->sz) {
800262f8:	e51b3008 	ldr	r3, [fp, #-8]
800262fc:	e1a02003 	mov	r2, r3
80026300:	e30e360c 	movw	r3, #58892	; 0xe60c
80026304:	e348300a 	movt	r3, #32778	; 0x800a
80026308:	e5933000 	ldr	r3, [r3]
8002630c:	e5933000 	ldr	r3, [r3]
80026310:	e1520003 	cmp	r2, r3
80026314:	2a000009 	bcs	80026340 <argptr+0x84>
80026318:	e51b3008 	ldr	r3, [fp, #-8]
8002631c:	e1a02003 	mov	r2, r3
80026320:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80026324:	e0822003 	add	r2, r2, r3
80026328:	e30e360c 	movw	r3, #58892	; 0xe60c
8002632c:	e348300a 	movt	r3, #32778	; 0x800a
80026330:	e5933000 	ldr	r3, [r3]
80026334:	e5933000 	ldr	r3, [r3]
80026338:	e1520003 	cmp	r2, r3
8002633c:	9a000001 	bls	80026348 <argptr+0x8c>
        return -1;
80026340:	e3e03000 	mvn	r3, #0
80026344:	ea000004 	b	8002635c <argptr+0xa0>
    }

    *pp = (char*)i;
80026348:	e51b3008 	ldr	r3, [fp, #-8]
8002634c:	e1a02003 	mov	r2, r3
80026350:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80026354:	e5832000 	str	r2, [r3]
    return 0;
80026358:	e3a03000 	mov	r3, #0
}
8002635c:	e1a00003 	mov	r0, r3
80026360:	e24bd004 	sub	sp, fp, #4
80026364:	e8bd8800 	pop	{fp, pc}

80026368 <argstr>:
// Fetch the nth word-sized system call argument as a string pointer.
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int argstr(int n, char **pp)
{
80026368:	e92d4800 	push	{fp, lr}
8002636c:	e28db004 	add	fp, sp, #4
80026370:	e24dd010 	sub	sp, sp, #16
80026374:	e50b0010 	str	r0, [fp, #-16]
80026378:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int addr;

    if(argint(n, &addr) < 0) {
8002637c:	e51b0010 	ldr	r0, [fp, #-16]
80026380:	e24b3008 	sub	r3, fp, #8
80026384:	e1a01003 	mov	r1, r3
80026388:	ebffffb0 	bl	80026250 <argint>
8002638c:	e1a03000 	mov	r3, r0
80026390:	e3530000 	cmp	r3, #0
80026394:	aa000001 	bge	800263a0 <argstr+0x38>
        return -1;
80026398:	e3e03000 	mvn	r3, #0
8002639c:	ea000004 	b	800263b4 <argstr+0x4c>
    }

    return fetchstr(addr, pp);
800263a0:	e51b3008 	ldr	r3, [fp, #-8]
800263a4:	e1a00003 	mov	r0, r3
800263a8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
800263ac:	ebffff78 	bl	80026194 <fetchstr>
800263b0:	e1a03000 	mov	r3, r0
}
800263b4:	e1a00003 	mov	r0, r3
800263b8:	e24bd004 	sub	sp, fp, #4
800263bc:	e8bd8800 	pop	{fp, pc}

800263c0 <syscall>:
        [SYS_close]   sys_close,
        [SYS_kthread_create]    sys_kthread_create,
};

void syscall(void)
{
800263c0:	e92d4800 	push	{fp, lr}
800263c4:	e28db004 	add	fp, sp, #4
800263c8:	e24dd008 	sub	sp, sp, #8
    int num;
    int ret;

    num = proc->tf->r0;
800263cc:	e30e360c 	movw	r3, #58892	; 0xe60c
800263d0:	e348300a 	movt	r3, #32778	; 0x800a
800263d4:	e5933000 	ldr	r3, [r3]
800263d8:	e593301c 	ldr	r3, [r3, #28]
800263dc:	e5933010 	ldr	r3, [r3, #16]
800263e0:	e50b3008 	str	r3, [fp, #-8]

    //cprintf ("syscall(%d) from %s(%d)\n", num, proc->name, proc->pid);

    if((num > 0) && (num <= NELEM(syscalls)) && syscalls[num]) {
800263e4:	e51b3008 	ldr	r3, [fp, #-8]
800263e8:	e3530000 	cmp	r3, #0
800263ec:	da000018 	ble	80026454 <syscall+0x94>
800263f0:	e51b3008 	ldr	r3, [fp, #-8]
800263f4:	e3530017 	cmp	r3, #23
800263f8:	8a000015 	bhi	80026454 <syscall+0x94>
800263fc:	e30b3034 	movw	r3, #45108	; 0xb034
80026400:	e3483002 	movt	r3, #32770	; 0x8002
80026404:	e51b2008 	ldr	r2, [fp, #-8]
80026408:	e7933102 	ldr	r3, [r3, r2, lsl #2]
8002640c:	e3530000 	cmp	r3, #0
80026410:	0a00000f 	beq	80026454 <syscall+0x94>
        ret = syscalls[num]();
80026414:	e30b3034 	movw	r3, #45108	; 0xb034
80026418:	e3483002 	movt	r3, #32770	; 0x8002
8002641c:	e51b2008 	ldr	r2, [fp, #-8]
80026420:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80026424:	e12fff33 	blx	r3
80026428:	e50b000c 	str	r0, [fp, #-12]

        // in ARM, parameters to main (argc, argv) are passed in r0 and r1
        // do not set the return value if it is SYS_exec (the user program
        // anyway does not expect us to return anything).
        if (num != SYS_exec) {
8002642c:	e51b3008 	ldr	r3, [fp, #-8]
80026430:	e3530007 	cmp	r3, #7
80026434:	0a00001a 	beq	800264a4 <syscall+0xe4>
            proc->tf->r0 = ret;
80026438:	e30e360c 	movw	r3, #58892	; 0xe60c
8002643c:	e348300a 	movt	r3, #32778	; 0x800a
80026440:	e5933000 	ldr	r3, [r3]
80026444:	e593301c 	ldr	r3, [r3, #28]
80026448:	e51b200c 	ldr	r2, [fp, #-12]
8002644c:	e5832010 	str	r2, [r3, #16]
        ret = syscalls[num]();

        // in ARM, parameters to main (argc, argv) are passed in r0 and r1
        // do not set the return value if it is SYS_exec (the user program
        // anyway does not expect us to return anything).
        if (num != SYS_exec) {
80026450:	ea000013 	b	800264a4 <syscall+0xe4>
            proc->tf->r0 = ret;
        }
    } else {
        cprintf("%d %s: unknown sys call %d\n", proc->pid, proc->name, num);
80026454:	e30e360c 	movw	r3, #58892	; 0xe60c
80026458:	e348300a 	movt	r3, #32778	; 0x800a
8002645c:	e5933000 	ldr	r3, [r3]
80026460:	e5932010 	ldr	r2, [r3, #16]
80026464:	e30e360c 	movw	r3, #58892	; 0xe60c
80026468:	e348300a 	movt	r3, #32778	; 0x800a
8002646c:	e5933000 	ldr	r3, [r3]
80026470:	e2833070 	add	r3, r3, #112	; 0x70
80026474:	e3090fe4 	movw	r0, #40932	; 0x9fe4
80026478:	e3480002 	movt	r0, #32770	; 0x8002
8002647c:	e1a01002 	mov	r1, r2
80026480:	e1a02003 	mov	r2, r3
80026484:	e51b3008 	ldr	r3, [fp, #-8]
80026488:	ebffed40 	bl	80021990 <cprintf>
        proc->tf->r0 = -1;
8002648c:	e30e360c 	movw	r3, #58892	; 0xe60c
80026490:	e348300a 	movt	r3, #32778	; 0x800a
80026494:	e5933000 	ldr	r3, [r3]
80026498:	e593301c 	ldr	r3, [r3, #28]
8002649c:	e3e02000 	mvn	r2, #0
800264a0:	e5832010 	str	r2, [r3, #16]
    }
}
800264a4:	e24bd004 	sub	sp, fp, #4
800264a8:	e8bd8800 	pop	{fp, pc}

800264ac <argfd>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int argfd(int n, int *pfd, struct file **pf)
{
800264ac:	e92d4800 	push	{fp, lr}
800264b0:	e28db004 	add	fp, sp, #4
800264b4:	e24dd018 	sub	sp, sp, #24
800264b8:	e50b0010 	str	r0, [fp, #-16]
800264bc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
800264c0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    int fd;
    struct file *f;

    if(argint(n, &fd) < 0) {
800264c4:	e51b0010 	ldr	r0, [fp, #-16]
800264c8:	e24b300c 	sub	r3, fp, #12
800264cc:	e1a01003 	mov	r1, r3
800264d0:	ebffff5e 	bl	80026250 <argint>
800264d4:	e1a03000 	mov	r3, r0
800264d8:	e3530000 	cmp	r3, #0
800264dc:	aa000001 	bge	800264e8 <argfd+0x3c>
        return -1;
800264e0:	e3e03000 	mvn	r3, #0
800264e4:	ea000023 	b	80026578 <argfd+0xcc>
    }

    if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0) {
800264e8:	e51b300c 	ldr	r3, [fp, #-12]
800264ec:	e3530000 	cmp	r3, #0
800264f0:	ba000011 	blt	8002653c <argfd+0x90>
800264f4:	e51b300c 	ldr	r3, [fp, #-12]
800264f8:	e353000f 	cmp	r3, #15
800264fc:	ca00000e 	bgt	8002653c <argfd+0x90>
80026500:	e30e360c 	movw	r3, #58892	; 0xe60c
80026504:	e348300a 	movt	r3, #32778	; 0x800a
80026508:	e5932000 	ldr	r2, [r3]
8002650c:	e51b300c 	ldr	r3, [fp, #-12]
80026510:	e283300a 	add	r3, r3, #10
80026514:	e3a01004 	mov	r1, #4
80026518:	e1a03103 	lsl	r3, r3, #2
8002651c:	e0822003 	add	r2, r2, r3
80026520:	e1a03001 	mov	r3, r1
80026524:	e0823003 	add	r3, r2, r3
80026528:	e5933000 	ldr	r3, [r3]
8002652c:	e50b3008 	str	r3, [fp, #-8]
80026530:	e51b3008 	ldr	r3, [fp, #-8]
80026534:	e3530000 	cmp	r3, #0
80026538:	1a000001 	bne	80026544 <argfd+0x98>
        return -1;
8002653c:	e3e03000 	mvn	r3, #0
80026540:	ea00000c 	b	80026578 <argfd+0xcc>
    }

    if(pfd) {
80026544:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80026548:	e3530000 	cmp	r3, #0
8002654c:	0a000002 	beq	8002655c <argfd+0xb0>
        *pfd = fd;
80026550:	e51b200c 	ldr	r2, [fp, #-12]
80026554:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80026558:	e5832000 	str	r2, [r3]
    }

    if(pf) {
8002655c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80026560:	e3530000 	cmp	r3, #0
80026564:	0a000002 	beq	80026574 <argfd+0xc8>
        *pf = f;
80026568:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
8002656c:	e51b2008 	ldr	r2, [fp, #-8]
80026570:	e5832000 	str	r2, [r3]
    }

    return 0;
80026574:	e3a03000 	mov	r3, #0
}
80026578:	e1a00003 	mov	r0, r3
8002657c:	e24bd004 	sub	sp, fp, #4
80026580:	e8bd8800 	pop	{fp, pc}

80026584 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int fdalloc(struct file *f)
{
80026584:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80026588:	e28db000 	add	fp, sp, #0
8002658c:	e24dd014 	sub	sp, sp, #20
80026590:	e50b0010 	str	r0, [fp, #-16]
    int fd;

    for(fd = 0; fd < NOFILE; fd++){
80026594:	e3a03000 	mov	r3, #0
80026598:	e50b3008 	str	r3, [fp, #-8]
8002659c:	ea00001d 	b	80026618 <fdalloc+0x94>
        if(proc->ofile[fd] == 0){
800265a0:	e30e360c 	movw	r3, #58892	; 0xe60c
800265a4:	e348300a 	movt	r3, #32778	; 0x800a
800265a8:	e5932000 	ldr	r2, [r3]
800265ac:	e51b3008 	ldr	r3, [fp, #-8]
800265b0:	e283300a 	add	r3, r3, #10
800265b4:	e3a01004 	mov	r1, #4
800265b8:	e1a03103 	lsl	r3, r3, #2
800265bc:	e0822003 	add	r2, r2, r3
800265c0:	e1a03001 	mov	r3, r1
800265c4:	e0823003 	add	r3, r2, r3
800265c8:	e5933000 	ldr	r3, [r3]
800265cc:	e3530000 	cmp	r3, #0
800265d0:	1a00000d 	bne	8002660c <fdalloc+0x88>
            proc->ofile[fd] = f;
800265d4:	e30e360c 	movw	r3, #58892	; 0xe60c
800265d8:	e348300a 	movt	r3, #32778	; 0x800a
800265dc:	e5932000 	ldr	r2, [r3]
800265e0:	e51b3008 	ldr	r3, [fp, #-8]
800265e4:	e283300a 	add	r3, r3, #10
800265e8:	e3a01004 	mov	r1, #4
800265ec:	e1a03103 	lsl	r3, r3, #2
800265f0:	e0822003 	add	r2, r2, r3
800265f4:	e1a03001 	mov	r3, r1
800265f8:	e0823003 	add	r3, r2, r3
800265fc:	e51b2010 	ldr	r2, [fp, #-16]
80026600:	e5832000 	str	r2, [r3]
            return fd;
80026604:	e51b3008 	ldr	r3, [fp, #-8]
80026608:	ea000006 	b	80026628 <fdalloc+0xa4>
// Takes over file reference from caller on success.
static int fdalloc(struct file *f)
{
    int fd;

    for(fd = 0; fd < NOFILE; fd++){
8002660c:	e51b3008 	ldr	r3, [fp, #-8]
80026610:	e2833001 	add	r3, r3, #1
80026614:	e50b3008 	str	r3, [fp, #-8]
80026618:	e51b3008 	ldr	r3, [fp, #-8]
8002661c:	e353000f 	cmp	r3, #15
80026620:	daffffde 	ble	800265a0 <fdalloc+0x1c>
            proc->ofile[fd] = f;
            return fd;
        }
    }

    return -1;
80026624:	e3e03000 	mvn	r3, #0
}
80026628:	e1a00003 	mov	r0, r3
8002662c:	e28bd000 	add	sp, fp, #0
80026630:	e8bd0800 	pop	{fp}
80026634:	e12fff1e 	bx	lr

80026638 <sys_dup>:

int sys_dup(void)
{
80026638:	e92d4800 	push	{fp, lr}
8002663c:	e28db004 	add	fp, sp, #4
80026640:	e24dd008 	sub	sp, sp, #8
    struct file *f;
    int fd;

    if(argfd(0, 0, &f) < 0) {
80026644:	e3a00000 	mov	r0, #0
80026648:	e3a01000 	mov	r1, #0
8002664c:	e24b300c 	sub	r3, fp, #12
80026650:	e1a02003 	mov	r2, r3
80026654:	ebffff94 	bl	800264ac <argfd>
80026658:	e1a03000 	mov	r3, r0
8002665c:	e3530000 	cmp	r3, #0
80026660:	aa000001 	bge	8002666c <sys_dup+0x34>
        return -1;
80026664:	e3e03000 	mvn	r3, #0
80026668:	ea00000c 	b	800266a0 <sys_dup+0x68>
    }

    if((fd=fdalloc(f)) < 0) {
8002666c:	e51b300c 	ldr	r3, [fp, #-12]
80026670:	e1a00003 	mov	r0, r3
80026674:	ebffffc2 	bl	80026584 <fdalloc>
80026678:	e50b0008 	str	r0, [fp, #-8]
8002667c:	e51b3008 	ldr	r3, [fp, #-8]
80026680:	e3530000 	cmp	r3, #0
80026684:	aa000001 	bge	80026690 <sys_dup+0x58>
        return -1;
80026688:	e3e03000 	mvn	r3, #0
8002668c:	ea000003 	b	800266a0 <sys_dup+0x68>
    }

    filedup(f);
80026690:	e51b300c 	ldr	r3, [fp, #-12]
80026694:	e1a00003 	mov	r0, r3
80026698:	ebfff02f 	bl	8002275c <filedup>

    return fd;
8002669c:	e51b3008 	ldr	r3, [fp, #-8]
}
800266a0:	e1a00003 	mov	r0, r3
800266a4:	e24bd004 	sub	sp, fp, #4
800266a8:	e8bd8800 	pop	{fp, pc}

800266ac <sys_read>:

int sys_read(void)
{
800266ac:	e92d4800 	push	{fp, lr}
800266b0:	e28db004 	add	fp, sp, #4
800266b4:	e24dd010 	sub	sp, sp, #16
    struct file *f;
    int n;
    char *p;

    if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0) {
800266b8:	e3a00000 	mov	r0, #0
800266bc:	e3a01000 	mov	r1, #0
800266c0:	e24b3008 	sub	r3, fp, #8
800266c4:	e1a02003 	mov	r2, r3
800266c8:	ebffff77 	bl	800264ac <argfd>
800266cc:	e1a03000 	mov	r3, r0
800266d0:	e3530000 	cmp	r3, #0
800266d4:	ba00000f 	blt	80026718 <sys_read+0x6c>
800266d8:	e3a00002 	mov	r0, #2
800266dc:	e24b300c 	sub	r3, fp, #12
800266e0:	e1a01003 	mov	r1, r3
800266e4:	ebfffed9 	bl	80026250 <argint>
800266e8:	e1a03000 	mov	r3, r0
800266ec:	e3530000 	cmp	r3, #0
800266f0:	ba000008 	blt	80026718 <sys_read+0x6c>
800266f4:	e51b300c 	ldr	r3, [fp, #-12]
800266f8:	e3a00001 	mov	r0, #1
800266fc:	e24b2010 	sub	r2, fp, #16
80026700:	e1a01002 	mov	r1, r2
80026704:	e1a02003 	mov	r2, r3
80026708:	ebfffeeb 	bl	800262bc <argptr>
8002670c:	e1a03000 	mov	r3, r0
80026710:	e3530000 	cmp	r3, #0
80026714:	aa000001 	bge	80026720 <sys_read+0x74>
        return -1;
80026718:	e3e03000 	mvn	r3, #0
8002671c:	ea000007 	b	80026740 <sys_read+0x94>
    }

    return fileread(f, p, n);
80026720:	e51b1008 	ldr	r1, [fp, #-8]
80026724:	e51b2010 	ldr	r2, [fp, #-16]
80026728:	e51b300c 	ldr	r3, [fp, #-12]
8002672c:	e1a00001 	mov	r0, r1
80026730:	e1a01002 	mov	r1, r2
80026734:	e1a02003 	mov	r2, r3
80026738:	ebfff07b 	bl	8002292c <fileread>
8002673c:	e1a03000 	mov	r3, r0
}
80026740:	e1a00003 	mov	r0, r3
80026744:	e24bd004 	sub	sp, fp, #4
80026748:	e8bd8800 	pop	{fp, pc}

8002674c <sys_write>:

int sys_write(void)
{
8002674c:	e92d4800 	push	{fp, lr}
80026750:	e28db004 	add	fp, sp, #4
80026754:	e24dd010 	sub	sp, sp, #16
    struct file *f;
    int n;
    char *p;

    if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0) {
80026758:	e3a00000 	mov	r0, #0
8002675c:	e3a01000 	mov	r1, #0
80026760:	e24b3008 	sub	r3, fp, #8
80026764:	e1a02003 	mov	r2, r3
80026768:	ebffff4f 	bl	800264ac <argfd>
8002676c:	e1a03000 	mov	r3, r0
80026770:	e3530000 	cmp	r3, #0
80026774:	ba00000f 	blt	800267b8 <sys_write+0x6c>
80026778:	e3a00002 	mov	r0, #2
8002677c:	e24b300c 	sub	r3, fp, #12
80026780:	e1a01003 	mov	r1, r3
80026784:	ebfffeb1 	bl	80026250 <argint>
80026788:	e1a03000 	mov	r3, r0
8002678c:	e3530000 	cmp	r3, #0
80026790:	ba000008 	blt	800267b8 <sys_write+0x6c>
80026794:	e51b300c 	ldr	r3, [fp, #-12]
80026798:	e3a00001 	mov	r0, #1
8002679c:	e24b2010 	sub	r2, fp, #16
800267a0:	e1a01002 	mov	r1, r2
800267a4:	e1a02003 	mov	r2, r3
800267a8:	ebfffec3 	bl	800262bc <argptr>
800267ac:	e1a03000 	mov	r3, r0
800267b0:	e3530000 	cmp	r3, #0
800267b4:	aa000001 	bge	800267c0 <sys_write+0x74>
        return -1;
800267b8:	e3e03000 	mvn	r3, #0
800267bc:	ea000007 	b	800267e0 <sys_write+0x94>
    }

    return filewrite(f, p, n);
800267c0:	e51b1008 	ldr	r1, [fp, #-8]
800267c4:	e51b2010 	ldr	r2, [fp, #-16]
800267c8:	e51b300c 	ldr	r3, [fp, #-12]
800267cc:	e1a00001 	mov	r0, r1
800267d0:	e1a01002 	mov	r1, r2
800267d4:	e1a02003 	mov	r2, r3
800267d8:	ebfff091 	bl	80022a24 <filewrite>
800267dc:	e1a03000 	mov	r3, r0
}
800267e0:	e1a00003 	mov	r0, r3
800267e4:	e24bd004 	sub	sp, fp, #4
800267e8:	e8bd8800 	pop	{fp, pc}

800267ec <sys_close>:

int sys_close(void)
{
800267ec:	e92d4800 	push	{fp, lr}
800267f0:	e28db004 	add	fp, sp, #4
800267f4:	e24dd008 	sub	sp, sp, #8
    int fd;
    struct file *f;

    if(argfd(0, &fd, &f) < 0) {
800267f8:	e3a00000 	mov	r0, #0
800267fc:	e24b3008 	sub	r3, fp, #8
80026800:	e1a01003 	mov	r1, r3
80026804:	e24b300c 	sub	r3, fp, #12
80026808:	e1a02003 	mov	r2, r3
8002680c:	ebffff26 	bl	800264ac <argfd>
80026810:	e1a03000 	mov	r3, r0
80026814:	e3530000 	cmp	r3, #0
80026818:	aa000001 	bge	80026824 <sys_close+0x38>
        return -1;
8002681c:	e3e03000 	mvn	r3, #0
80026820:	ea00000f 	b	80026864 <sys_close+0x78>
    }

    proc->ofile[fd] = 0;
80026824:	e30e360c 	movw	r3, #58892	; 0xe60c
80026828:	e348300a 	movt	r3, #32778	; 0x800a
8002682c:	e5932000 	ldr	r2, [r3]
80026830:	e51b3008 	ldr	r3, [fp, #-8]
80026834:	e283300a 	add	r3, r3, #10
80026838:	e3a01004 	mov	r1, #4
8002683c:	e1a03103 	lsl	r3, r3, #2
80026840:	e0822003 	add	r2, r2, r3
80026844:	e1a03001 	mov	r3, r1
80026848:	e0823003 	add	r3, r2, r3
8002684c:	e3a02000 	mov	r2, #0
80026850:	e5832000 	str	r2, [r3]
    fileclose(f);
80026854:	e51b300c 	ldr	r3, [fp, #-12]
80026858:	e1a00003 	mov	r0, r3
8002685c:	ebffefd8 	bl	800227c4 <fileclose>

    return 0;
80026860:	e3a03000 	mov	r3, #0
}
80026864:	e1a00003 	mov	r0, r3
80026868:	e24bd004 	sub	sp, fp, #4
8002686c:	e8bd8800 	pop	{fp, pc}

80026870 <sys_fstat>:

int sys_fstat(void)
{
80026870:	e92d4800 	push	{fp, lr}
80026874:	e28db004 	add	fp, sp, #4
80026878:	e24dd008 	sub	sp, sp, #8
    struct file *f;
    struct stat *st;

    if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0) {
8002687c:	e3a00000 	mov	r0, #0
80026880:	e3a01000 	mov	r1, #0
80026884:	e24b3008 	sub	r3, fp, #8
80026888:	e1a02003 	mov	r2, r3
8002688c:	ebffff06 	bl	800264ac <argfd>
80026890:	e1a03000 	mov	r3, r0
80026894:	e3530000 	cmp	r3, #0
80026898:	ba000007 	blt	800268bc <sys_fstat+0x4c>
8002689c:	e3a00001 	mov	r0, #1
800268a0:	e24b300c 	sub	r3, fp, #12
800268a4:	e1a01003 	mov	r1, r3
800268a8:	e3a02014 	mov	r2, #20
800268ac:	ebfffe82 	bl	800262bc <argptr>
800268b0:	e1a03000 	mov	r3, r0
800268b4:	e3530000 	cmp	r3, #0
800268b8:	aa000001 	bge	800268c4 <sys_fstat+0x54>
        return -1;
800268bc:	e3e03000 	mvn	r3, #0
800268c0:	ea000005 	b	800268dc <sys_fstat+0x6c>
    }

    return filestat(f, st);
800268c4:	e51b2008 	ldr	r2, [fp, #-8]
800268c8:	e51b300c 	ldr	r3, [fp, #-12]
800268cc:	e1a00002 	mov	r0, r2
800268d0:	e1a01003 	mov	r1, r3
800268d4:	ebffeff8 	bl	800228bc <filestat>
800268d8:	e1a03000 	mov	r3, r0
}
800268dc:	e1a00003 	mov	r0, r3
800268e0:	e24bd004 	sub	sp, fp, #4
800268e4:	e8bd8800 	pop	{fp, pc}

800268e8 <sys_link>:

// Create the path new as a link to the same inode as old.
int sys_link(void)
{
800268e8:	e92d4800 	push	{fp, lr}
800268ec:	e28db004 	add	fp, sp, #4
800268f0:	e24dd020 	sub	sp, sp, #32
    char name[DIRSIZ], *new, *old;
    struct inode *dp, *ip;

    if(argstr(0, &old) < 0 || argstr(1, &new) < 0) {
800268f4:	e3a00000 	mov	r0, #0
800268f8:	e24b3024 	sub	r3, fp, #36	; 0x24
800268fc:	e1a01003 	mov	r1, r3
80026900:	ebfffe98 	bl	80026368 <argstr>
80026904:	e1a03000 	mov	r3, r0
80026908:	e3530000 	cmp	r3, #0
8002690c:	ba000006 	blt	8002692c <sys_link+0x44>
80026910:	e3a00001 	mov	r0, #1
80026914:	e24b3020 	sub	r3, fp, #32
80026918:	e1a01003 	mov	r1, r3
8002691c:	ebfffe91 	bl	80026368 <argstr>
80026920:	e1a03000 	mov	r3, r0
80026924:	e3530000 	cmp	r3, #0
80026928:	aa000001 	bge	80026934 <sys_link+0x4c>
        return -1;
8002692c:	e3e03000 	mvn	r3, #0
80026930:	ea000053 	b	80026a84 <sys_link+0x19c>
    }

    if((ip = namei(old)) == 0) {
80026934:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80026938:	e1a00003 	mov	r0, r3
8002693c:	ebfff67b 	bl	80024330 <namei>
80026940:	e50b0008 	str	r0, [fp, #-8]
80026944:	e51b3008 	ldr	r3, [fp, #-8]
80026948:	e3530000 	cmp	r3, #0
8002694c:	1a000001 	bne	80026958 <sys_link+0x70>
        return -1;
80026950:	e3e03000 	mvn	r3, #0
80026954:	ea00004a 	b	80026a84 <sys_link+0x19c>
    }

    begin_trans();
80026958:	ebfff768 	bl	80024700 <begin_trans>

    ilock(ip);
8002695c:	e51b0008 	ldr	r0, [fp, #-8]
80026960:	ebfff276 	bl	80023340 <ilock>

    if(ip->type == T_DIR){
80026964:	e51b3008 	ldr	r3, [fp, #-8]
80026968:	e1d331b0 	ldrh	r3, [r3, #16]
8002696c:	e6bf3073 	sxth	r3, r3
80026970:	e3530001 	cmp	r3, #1
80026974:	1a000004 	bne	8002698c <sys_link+0xa4>
        iunlockput(ip);
80026978:	e51b0008 	ldr	r0, [fp, #-8]
8002697c:	ebfff336 	bl	8002365c <iunlockput>
        commit_trans();
80026980:	ebfff776 	bl	80024760 <commit_trans>
        return -1;
80026984:	e3e03000 	mvn	r3, #0
80026988:	ea00003d 	b	80026a84 <sys_link+0x19c>
    }

    ip->nlink++;
8002698c:	e51b3008 	ldr	r3, [fp, #-8]
80026990:	e1d331b6 	ldrh	r3, [r3, #22]
80026994:	e2833001 	add	r3, r3, #1
80026998:	e6ff2073 	uxth	r2, r3
8002699c:	e51b3008 	ldr	r3, [fp, #-8]
800269a0:	e1c321b6 	strh	r2, [r3, #22]
    iupdate(ip);
800269a4:	e51b0008 	ldr	r0, [fp, #-8]
800269a8:	ebfff1c7 	bl	800230cc <iupdate>
    iunlock(ip);
800269ac:	e51b0008 	ldr	r0, [fp, #-8]
800269b0:	ebfff2c9 	bl	800234dc <iunlock>

    if((dp = nameiparent(new, name)) == 0) {
800269b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800269b8:	e1a00003 	mov	r0, r3
800269bc:	e24b301c 	sub	r3, fp, #28
800269c0:	e1a01003 	mov	r1, r3
800269c4:	ebfff666 	bl	80024364 <nameiparent>
800269c8:	e50b000c 	str	r0, [fp, #-12]
800269cc:	e51b300c 	ldr	r3, [fp, #-12]
800269d0:	e3530000 	cmp	r3, #0
800269d4:	0a00001b 	beq	80026a48 <sys_link+0x160>
        goto bad;
    }

    ilock(dp);
800269d8:	e51b000c 	ldr	r0, [fp, #-12]
800269dc:	ebfff257 	bl	80023340 <ilock>

    if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
800269e0:	e51b300c 	ldr	r3, [fp, #-12]
800269e4:	e5932000 	ldr	r2, [r3]
800269e8:	e51b3008 	ldr	r3, [fp, #-8]
800269ec:	e5933000 	ldr	r3, [r3]
800269f0:	e1520003 	cmp	r2, r3
800269f4:	1a000009 	bne	80026a20 <sys_link+0x138>
800269f8:	e51b3008 	ldr	r3, [fp, #-8]
800269fc:	e5933004 	ldr	r3, [r3, #4]
80026a00:	e51b000c 	ldr	r0, [fp, #-12]
80026a04:	e24b201c 	sub	r2, fp, #28
80026a08:	e1a01002 	mov	r1, r2
80026a0c:	e1a02003 	mov	r2, r3
80026a10:	ebfff56b 	bl	80023fc4 <dirlink>
80026a14:	e1a03000 	mov	r3, r0
80026a18:	e3530000 	cmp	r3, #0
80026a1c:	aa000002 	bge	80026a2c <sys_link+0x144>
        iunlockput(dp);
80026a20:	e51b000c 	ldr	r0, [fp, #-12]
80026a24:	ebfff30c 	bl	8002365c <iunlockput>
        goto bad;
80026a28:	ea000007 	b	80026a4c <sys_link+0x164>
    }

    iunlockput(dp);
80026a2c:	e51b000c 	ldr	r0, [fp, #-12]
80026a30:	ebfff309 	bl	8002365c <iunlockput>
    iput(ip);
80026a34:	e51b0008 	ldr	r0, [fp, #-8]
80026a38:	ebfff2c9 	bl	80023564 <iput>

    commit_trans();
80026a3c:	ebfff747 	bl	80024760 <commit_trans>

    return 0;
80026a40:	e3a03000 	mov	r3, #0
80026a44:	ea00000e 	b	80026a84 <sys_link+0x19c>
    ip->nlink++;
    iupdate(ip);
    iunlock(ip);

    if((dp = nameiparent(new, name)) == 0) {
        goto bad;
80026a48:	e1a00000 	nop			; (mov r0, r0)
    commit_trans();

    return 0;

    bad:
    ilock(ip);
80026a4c:	e51b0008 	ldr	r0, [fp, #-8]
80026a50:	ebfff23a 	bl	80023340 <ilock>
    ip->nlink--;
80026a54:	e51b3008 	ldr	r3, [fp, #-8]
80026a58:	e1d331b6 	ldrh	r3, [r3, #22]
80026a5c:	e2433001 	sub	r3, r3, #1
80026a60:	e6ff2073 	uxth	r2, r3
80026a64:	e51b3008 	ldr	r3, [fp, #-8]
80026a68:	e1c321b6 	strh	r2, [r3, #22]
    iupdate(ip);
80026a6c:	e51b0008 	ldr	r0, [fp, #-8]
80026a70:	ebfff195 	bl	800230cc <iupdate>
    iunlockput(ip);
80026a74:	e51b0008 	ldr	r0, [fp, #-8]
80026a78:	ebfff2f7 	bl	8002365c <iunlockput>
    commit_trans();
80026a7c:	ebfff737 	bl	80024760 <commit_trans>
    return -1;
80026a80:	e3e03000 	mvn	r3, #0
}
80026a84:	e1a00003 	mov	r0, r3
80026a88:	e24bd004 	sub	sp, fp, #4
80026a8c:	e8bd8800 	pop	{fp, pc}

80026a90 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int isdirempty(struct inode *dp)
{
80026a90:	e92d4800 	push	{fp, lr}
80026a94:	e28db004 	add	fp, sp, #4
80026a98:	e24dd020 	sub	sp, sp, #32
80026a9c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    int off;
    struct dirent de;

    for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80026aa0:	e3a03020 	mov	r3, #32
80026aa4:	e50b3008 	str	r3, [fp, #-8]
80026aa8:	ea000014 	b	80026b00 <isdirempty+0x70>
        if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
80026aac:	e51b3008 	ldr	r3, [fp, #-8]
80026ab0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
80026ab4:	e24b2018 	sub	r2, fp, #24
80026ab8:	e1a01002 	mov	r1, r2
80026abc:	e1a02003 	mov	r2, r3
80026ac0:	e3a03010 	mov	r3, #16
80026ac4:	ebfff3dd 	bl	80023a40 <readi>
80026ac8:	e1a03000 	mov	r3, r0
80026acc:	e3530010 	cmp	r3, #16
80026ad0:	0a000002 	beq	80026ae0 <isdirempty+0x50>
            panic("isdirempty: readi");
80026ad4:	e30a0000 	movw	r0, #40960	; 0xa000
80026ad8:	e3480002 	movt	r0, #32770	; 0x8002
80026adc:	ebffec36 	bl	80021bbc <panic>
        }

        if(de.inum != 0) {
80026ae0:	e15b31b8 	ldrh	r3, [fp, #-24]	; 0xffffffe8
80026ae4:	e3530000 	cmp	r3, #0
80026ae8:	0a000001 	beq	80026af4 <isdirempty+0x64>
            return 0;
80026aec:	e3a03000 	mov	r3, #0
80026af0:	ea000008 	b	80026b18 <isdirempty+0x88>
static int isdirempty(struct inode *dp)
{
    int off;
    struct dirent de;

    for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80026af4:	e51b3008 	ldr	r3, [fp, #-8]
80026af8:	e2833010 	add	r3, r3, #16
80026afc:	e50b3008 	str	r3, [fp, #-8]
80026b00:	e51b2008 	ldr	r2, [fp, #-8]
80026b04:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80026b08:	e5933018 	ldr	r3, [r3, #24]
80026b0c:	e1520003 	cmp	r2, r3
80026b10:	3affffe5 	bcc	80026aac <isdirempty+0x1c>

        if(de.inum != 0) {
            return 0;
        }
    }
    return 1;
80026b14:	e3a03001 	mov	r3, #1
}
80026b18:	e1a00003 	mov	r0, r3
80026b1c:	e24bd004 	sub	sp, fp, #4
80026b20:	e8bd8800 	pop	{fp, pc}

80026b24 <sys_unlink>:

//PAGEBREAK!
int sys_unlink(void)
{
80026b24:	e92d4800 	push	{fp, lr}
80026b28:	e28db004 	add	fp, sp, #4
80026b2c:	e24dd030 	sub	sp, sp, #48	; 0x30
    struct inode *ip, *dp;
    struct dirent de;
    char name[DIRSIZ], *path;
    uint off;

    if(argstr(0, &path) < 0) {
80026b30:	e3a00000 	mov	r0, #0
80026b34:	e24b3030 	sub	r3, fp, #48	; 0x30
80026b38:	e1a01003 	mov	r1, r3
80026b3c:	ebfffe09 	bl	80026368 <argstr>
80026b40:	e1a03000 	mov	r3, r0
80026b44:	e3530000 	cmp	r3, #0
80026b48:	aa000001 	bge	80026b54 <sys_unlink+0x30>
        return -1;
80026b4c:	e3e03000 	mvn	r3, #0
80026b50:	ea000071 	b	80026d1c <sys_unlink+0x1f8>
    }

    if((dp = nameiparent(path, name)) == 0) {
80026b54:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
80026b58:	e1a00003 	mov	r0, r3
80026b5c:	e24b302c 	sub	r3, fp, #44	; 0x2c
80026b60:	e1a01003 	mov	r1, r3
80026b64:	ebfff5fe 	bl	80024364 <nameiparent>
80026b68:	e50b0008 	str	r0, [fp, #-8]
80026b6c:	e51b3008 	ldr	r3, [fp, #-8]
80026b70:	e3530000 	cmp	r3, #0
80026b74:	1a000001 	bne	80026b80 <sys_unlink+0x5c>
        return -1;
80026b78:	e3e03000 	mvn	r3, #0
80026b7c:	ea000066 	b	80026d1c <sys_unlink+0x1f8>
    }

    begin_trans();
80026b80:	ebfff6de 	bl	80024700 <begin_trans>

    ilock(dp);
80026b84:	e51b0008 	ldr	r0, [fp, #-8]
80026b88:	ebfff1ec 	bl	80023340 <ilock>

    // Cannot unlink "." or "..".
    if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0) {
80026b8c:	e24b302c 	sub	r3, fp, #44	; 0x2c
80026b90:	e1a00003 	mov	r0, r3
80026b94:	e30a1014 	movw	r1, #40980	; 0xa014
80026b98:	e3481002 	movt	r1, #32770	; 0x8002
80026b9c:	ebfff4b7 	bl	80023e80 <namecmp>
80026ba0:	e1a03000 	mov	r3, r0
80026ba4:	e3530000 	cmp	r3, #0
80026ba8:	0a000057 	beq	80026d0c <sys_unlink+0x1e8>
80026bac:	e24b302c 	sub	r3, fp, #44	; 0x2c
80026bb0:	e1a00003 	mov	r0, r3
80026bb4:	e30a1018 	movw	r1, #40984	; 0xa018
80026bb8:	e3481002 	movt	r1, #32770	; 0x8002
80026bbc:	ebfff4af 	bl	80023e80 <namecmp>
80026bc0:	e1a03000 	mov	r3, r0
80026bc4:	e3530000 	cmp	r3, #0
80026bc8:	0a00004f 	beq	80026d0c <sys_unlink+0x1e8>
        goto bad;
    }

    if((ip = dirlookup(dp, name, &off)) == 0) {
80026bcc:	e51b0008 	ldr	r0, [fp, #-8]
80026bd0:	e24b302c 	sub	r3, fp, #44	; 0x2c
80026bd4:	e1a01003 	mov	r1, r3
80026bd8:	e24b3034 	sub	r3, fp, #52	; 0x34
80026bdc:	e1a02003 	mov	r2, r3
80026be0:	ebfff4b3 	bl	80023eb4 <dirlookup>
80026be4:	e50b000c 	str	r0, [fp, #-12]
80026be8:	e51b300c 	ldr	r3, [fp, #-12]
80026bec:	e3530000 	cmp	r3, #0
80026bf0:	0a000044 	beq	80026d08 <sys_unlink+0x1e4>
        goto bad;
    }

    ilock(ip);
80026bf4:	e51b000c 	ldr	r0, [fp, #-12]
80026bf8:	ebfff1d0 	bl	80023340 <ilock>

    if(ip->nlink < 1) {
80026bfc:	e51b300c 	ldr	r3, [fp, #-12]
80026c00:	e1d331b6 	ldrh	r3, [r3, #22]
80026c04:	e6bf3073 	sxth	r3, r3
80026c08:	e3530000 	cmp	r3, #0
80026c0c:	ca000002 	bgt	80026c1c <sys_unlink+0xf8>
        panic("unlink: nlink < 1");
80026c10:	e30a001c 	movw	r0, #40988	; 0xa01c
80026c14:	e3480002 	movt	r0, #32770	; 0x8002
80026c18:	ebffebe7 	bl	80021bbc <panic>
    }

    if(ip->type == T_DIR && !isdirempty(ip)){
80026c1c:	e51b300c 	ldr	r3, [fp, #-12]
80026c20:	e1d331b0 	ldrh	r3, [r3, #16]
80026c24:	e6bf3073 	sxth	r3, r3
80026c28:	e3530001 	cmp	r3, #1
80026c2c:	1a000007 	bne	80026c50 <sys_unlink+0x12c>
80026c30:	e51b000c 	ldr	r0, [fp, #-12]
80026c34:	ebffff95 	bl	80026a90 <isdirempty>
80026c38:	e1a03000 	mov	r3, r0
80026c3c:	e3530000 	cmp	r3, #0
80026c40:	1a000002 	bne	80026c50 <sys_unlink+0x12c>
        iunlockput(ip);
80026c44:	e51b000c 	ldr	r0, [fp, #-12]
80026c48:	ebfff283 	bl	8002365c <iunlockput>
        goto bad;
80026c4c:	ea00002e 	b	80026d0c <sys_unlink+0x1e8>
    }

    memset(&de, 0, sizeof(de));
80026c50:	e24b301c 	sub	r3, fp, #28
80026c54:	e1a00003 	mov	r0, r3
80026c58:	e3a01000 	mov	r1, #0
80026c5c:	e3a02010 	mov	r2, #16
80026c60:	ebffe4e6 	bl	80020000 <memset>

    if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
80026c64:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
80026c68:	e51b0008 	ldr	r0, [fp, #-8]
80026c6c:	e24b201c 	sub	r2, fp, #28
80026c70:	e1a01002 	mov	r1, r2
80026c74:	e1a02003 	mov	r2, r3
80026c78:	e3a03010 	mov	r3, #16
80026c7c:	ebfff3ed 	bl	80023c38 <writei>
80026c80:	e1a03000 	mov	r3, r0
80026c84:	e3530010 	cmp	r3, #16
80026c88:	0a000002 	beq	80026c98 <sys_unlink+0x174>
        panic("unlink: writei");
80026c8c:	e30a0030 	movw	r0, #41008	; 0xa030
80026c90:	e3480002 	movt	r0, #32770	; 0x8002
80026c94:	ebffebc8 	bl	80021bbc <panic>
    }

    if(ip->type == T_DIR){
80026c98:	e51b300c 	ldr	r3, [fp, #-12]
80026c9c:	e1d331b0 	ldrh	r3, [r3, #16]
80026ca0:	e6bf3073 	sxth	r3, r3
80026ca4:	e3530001 	cmp	r3, #1
80026ca8:	1a000007 	bne	80026ccc <sys_unlink+0x1a8>
        dp->nlink--;
80026cac:	e51b3008 	ldr	r3, [fp, #-8]
80026cb0:	e1d331b6 	ldrh	r3, [r3, #22]
80026cb4:	e2433001 	sub	r3, r3, #1
80026cb8:	e6ff2073 	uxth	r2, r3
80026cbc:	e51b3008 	ldr	r3, [fp, #-8]
80026cc0:	e1c321b6 	strh	r2, [r3, #22]
        iupdate(dp);
80026cc4:	e51b0008 	ldr	r0, [fp, #-8]
80026cc8:	ebfff0ff 	bl	800230cc <iupdate>
    }

    iunlockput(dp);
80026ccc:	e51b0008 	ldr	r0, [fp, #-8]
80026cd0:	ebfff261 	bl	8002365c <iunlockput>

    ip->nlink--;
80026cd4:	e51b300c 	ldr	r3, [fp, #-12]
80026cd8:	e1d331b6 	ldrh	r3, [r3, #22]
80026cdc:	e2433001 	sub	r3, r3, #1
80026ce0:	e6ff2073 	uxth	r2, r3
80026ce4:	e51b300c 	ldr	r3, [fp, #-12]
80026ce8:	e1c321b6 	strh	r2, [r3, #22]
    iupdate(ip);
80026cec:	e51b000c 	ldr	r0, [fp, #-12]
80026cf0:	ebfff0f5 	bl	800230cc <iupdate>
    iunlockput(ip);
80026cf4:	e51b000c 	ldr	r0, [fp, #-12]
80026cf8:	ebfff257 	bl	8002365c <iunlockput>

    commit_trans();
80026cfc:	ebfff697 	bl	80024760 <commit_trans>

    return 0;
80026d00:	e3a03000 	mov	r3, #0
80026d04:	ea000004 	b	80026d1c <sys_unlink+0x1f8>
    if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0) {
        goto bad;
    }

    if((ip = dirlookup(dp, name, &off)) == 0) {
        goto bad;
80026d08:	e1a00000 	nop			; (mov r0, r0)
    commit_trans();

    return 0;

    bad:
    iunlockput(dp);
80026d0c:	e51b0008 	ldr	r0, [fp, #-8]
80026d10:	ebfff251 	bl	8002365c <iunlockput>
    commit_trans();
80026d14:	ebfff691 	bl	80024760 <commit_trans>
    return -1;
80026d18:	e3e03000 	mvn	r3, #0
}
80026d1c:	e1a00003 	mov	r0, r3
80026d20:	e24bd004 	sub	sp, fp, #4
80026d24:	e8bd8800 	pop	{fp, pc}

80026d28 <create>:

static struct inode* create(char *path, short type, short major, short minor)
{
80026d28:	e92d4800 	push	{fp, lr}
80026d2c:	e28db004 	add	fp, sp, #4
80026d30:	e24dd030 	sub	sp, sp, #48	; 0x30
80026d34:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
80026d38:	e14b12ba 	strh	r1, [fp, #-42]	; 0xffffffd6
80026d3c:	e14b22bc 	strh	r2, [fp, #-44]	; 0xffffffd4
80026d40:	e14b32be 	strh	r3, [fp, #-46]	; 0xffffffd2
    uint off;
    struct inode *ip, *dp;
    char name[DIRSIZ];

    if((dp = nameiparent(path, name)) == 0) {
80026d44:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
80026d48:	e24b3020 	sub	r3, fp, #32
80026d4c:	e1a01003 	mov	r1, r3
80026d50:	ebfff583 	bl	80024364 <nameiparent>
80026d54:	e50b0008 	str	r0, [fp, #-8]
80026d58:	e51b3008 	ldr	r3, [fp, #-8]
80026d5c:	e3530000 	cmp	r3, #0
80026d60:	1a000001 	bne	80026d6c <create+0x44>
        return 0;
80026d64:	e3a03000 	mov	r3, #0
80026d68:	ea000069 	b	80026f14 <create+0x1ec>
    }

    ilock(dp);
80026d6c:	e51b0008 	ldr	r0, [fp, #-8]
80026d70:	ebfff172 	bl	80023340 <ilock>

    if((ip = dirlookup(dp, name, &off)) != 0){
80026d74:	e51b0008 	ldr	r0, [fp, #-8]
80026d78:	e24b3020 	sub	r3, fp, #32
80026d7c:	e1a01003 	mov	r1, r3
80026d80:	e24b3010 	sub	r3, fp, #16
80026d84:	e1a02003 	mov	r2, r3
80026d88:	ebfff449 	bl	80023eb4 <dirlookup>
80026d8c:	e50b000c 	str	r0, [fp, #-12]
80026d90:	e51b300c 	ldr	r3, [fp, #-12]
80026d94:	e3530000 	cmp	r3, #0
80026d98:	0a000011 	beq	80026de4 <create+0xbc>
        iunlockput(dp);
80026d9c:	e51b0008 	ldr	r0, [fp, #-8]
80026da0:	ebfff22d 	bl	8002365c <iunlockput>
        ilock(ip);
80026da4:	e51b000c 	ldr	r0, [fp, #-12]
80026da8:	ebfff164 	bl	80023340 <ilock>

        if(type == T_FILE && ip->type == T_FILE) {
80026dac:	e15b32fa 	ldrsh	r3, [fp, #-42]	; 0xffffffd6
80026db0:	e3530002 	cmp	r3, #2
80026db4:	1a000006 	bne	80026dd4 <create+0xac>
80026db8:	e51b300c 	ldr	r3, [fp, #-12]
80026dbc:	e1d331b0 	ldrh	r3, [r3, #16]
80026dc0:	e6bf3073 	sxth	r3, r3
80026dc4:	e3530002 	cmp	r3, #2
80026dc8:	1a000001 	bne	80026dd4 <create+0xac>
            return ip;
80026dcc:	e51b300c 	ldr	r3, [fp, #-12]
80026dd0:	ea00004f 	b	80026f14 <create+0x1ec>
        }

        iunlockput(ip);
80026dd4:	e51b000c 	ldr	r0, [fp, #-12]
80026dd8:	ebfff21f 	bl	8002365c <iunlockput>

        return 0;
80026ddc:	e3a03000 	mov	r3, #0
80026de0:	ea00004b 	b	80026f14 <create+0x1ec>
    }

    if((ip = ialloc(dp->dev, type)) == 0) {
80026de4:	e51b3008 	ldr	r3, [fp, #-8]
80026de8:	e5932000 	ldr	r2, [r3]
80026dec:	e15b32fa 	ldrsh	r3, [fp, #-42]	; 0xffffffd6
80026df0:	e1a00002 	mov	r0, r2
80026df4:	e1a01003 	mov	r1, r3
80026df8:	ebfff074 	bl	80022fd0 <ialloc>
80026dfc:	e50b000c 	str	r0, [fp, #-12]
80026e00:	e51b300c 	ldr	r3, [fp, #-12]
80026e04:	e3530000 	cmp	r3, #0
80026e08:	1a000002 	bne	80026e18 <create+0xf0>
        panic("create: ialloc");
80026e0c:	e30a0040 	movw	r0, #41024	; 0xa040
80026e10:	e3480002 	movt	r0, #32770	; 0x8002
80026e14:	ebffeb68 	bl	80021bbc <panic>
    }

    ilock(ip);
80026e18:	e51b000c 	ldr	r0, [fp, #-12]
80026e1c:	ebfff147 	bl	80023340 <ilock>
    ip->major = major;
80026e20:	e51b300c 	ldr	r3, [fp, #-12]
80026e24:	e15b22bc 	ldrh	r2, [fp, #-44]	; 0xffffffd4
80026e28:	e1c321b2 	strh	r2, [r3, #18]
    ip->minor = minor;
80026e2c:	e51b300c 	ldr	r3, [fp, #-12]
80026e30:	e15b22be 	ldrh	r2, [fp, #-46]	; 0xffffffd2
80026e34:	e1c321b4 	strh	r2, [r3, #20]
    ip->nlink = 1;
80026e38:	e51b300c 	ldr	r3, [fp, #-12]
80026e3c:	e3a02001 	mov	r2, #1
80026e40:	e1c321b6 	strh	r2, [r3, #22]
    iupdate(ip);
80026e44:	e51b000c 	ldr	r0, [fp, #-12]
80026e48:	ebfff09f 	bl	800230cc <iupdate>

    if(type == T_DIR){  // Create . and .. entries.
80026e4c:	e15b32fa 	ldrsh	r3, [fp, #-42]	; 0xffffffd6
80026e50:	e3530001 	cmp	r3, #1
80026e54:	1a00001e 	bne	80026ed4 <create+0x1ac>
        dp->nlink++;  // for ".."
80026e58:	e51b3008 	ldr	r3, [fp, #-8]
80026e5c:	e1d331b6 	ldrh	r3, [r3, #22]
80026e60:	e2833001 	add	r3, r3, #1
80026e64:	e6ff2073 	uxth	r2, r3
80026e68:	e51b3008 	ldr	r3, [fp, #-8]
80026e6c:	e1c321b6 	strh	r2, [r3, #22]
        iupdate(dp);
80026e70:	e51b0008 	ldr	r0, [fp, #-8]
80026e74:	ebfff094 	bl	800230cc <iupdate>

        // No ip->nlink++ for ".": avoid cyclic ref count.
        if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0) {
80026e78:	e51b300c 	ldr	r3, [fp, #-12]
80026e7c:	e5933004 	ldr	r3, [r3, #4]
80026e80:	e51b000c 	ldr	r0, [fp, #-12]
80026e84:	e30a1014 	movw	r1, #40980	; 0xa014
80026e88:	e3481002 	movt	r1, #32770	; 0x8002
80026e8c:	e1a02003 	mov	r2, r3
80026e90:	ebfff44b 	bl	80023fc4 <dirlink>
80026e94:	e1a03000 	mov	r3, r0
80026e98:	e3530000 	cmp	r3, #0
80026e9c:	ba000009 	blt	80026ec8 <create+0x1a0>
80026ea0:	e51b3008 	ldr	r3, [fp, #-8]
80026ea4:	e5933004 	ldr	r3, [r3, #4]
80026ea8:	e51b000c 	ldr	r0, [fp, #-12]
80026eac:	e30a1018 	movw	r1, #40984	; 0xa018
80026eb0:	e3481002 	movt	r1, #32770	; 0x8002
80026eb4:	e1a02003 	mov	r2, r3
80026eb8:	ebfff441 	bl	80023fc4 <dirlink>
80026ebc:	e1a03000 	mov	r3, r0
80026ec0:	e3530000 	cmp	r3, #0
80026ec4:	aa000002 	bge	80026ed4 <create+0x1ac>
            panic("create dots");
80026ec8:	e30a0050 	movw	r0, #41040	; 0xa050
80026ecc:	e3480002 	movt	r0, #32770	; 0x8002
80026ed0:	ebffeb39 	bl	80021bbc <panic>
        }
    }

    if(dirlink(dp, name, ip->inum) < 0) {
80026ed4:	e51b300c 	ldr	r3, [fp, #-12]
80026ed8:	e5933004 	ldr	r3, [r3, #4]
80026edc:	e51b0008 	ldr	r0, [fp, #-8]
80026ee0:	e24b2020 	sub	r2, fp, #32
80026ee4:	e1a01002 	mov	r1, r2
80026ee8:	e1a02003 	mov	r2, r3
80026eec:	ebfff434 	bl	80023fc4 <dirlink>
80026ef0:	e1a03000 	mov	r3, r0
80026ef4:	e3530000 	cmp	r3, #0
80026ef8:	aa000002 	bge	80026f08 <create+0x1e0>
        panic("create: dirlink");
80026efc:	e30a005c 	movw	r0, #41052	; 0xa05c
80026f00:	e3480002 	movt	r0, #32770	; 0x8002
80026f04:	ebffeb2c 	bl	80021bbc <panic>
    }

    iunlockput(dp);
80026f08:	e51b0008 	ldr	r0, [fp, #-8]
80026f0c:	ebfff1d2 	bl	8002365c <iunlockput>

    return ip;
80026f10:	e51b300c 	ldr	r3, [fp, #-12]
}
80026f14:	e1a00003 	mov	r0, r3
80026f18:	e24bd004 	sub	sp, fp, #4
80026f1c:	e8bd8800 	pop	{fp, pc}

80026f20 <sys_open>:

int sys_open(void)
{
80026f20:	e92d4800 	push	{fp, lr}
80026f24:	e28db004 	add	fp, sp, #4
80026f28:	e24dd018 	sub	sp, sp, #24
    char *path;
    int fd, omode;
    struct file *f;
    struct inode *ip;

    if(argstr(0, &path) < 0 || argint(1, &omode) < 0) {
80026f2c:	e3a00000 	mov	r0, #0
80026f30:	e24b3014 	sub	r3, fp, #20
80026f34:	e1a01003 	mov	r1, r3
80026f38:	ebfffd0a 	bl	80026368 <argstr>
80026f3c:	e1a03000 	mov	r3, r0
80026f40:	e3530000 	cmp	r3, #0
80026f44:	ba000006 	blt	80026f64 <sys_open+0x44>
80026f48:	e3a00001 	mov	r0, #1
80026f4c:	e24b3018 	sub	r3, fp, #24
80026f50:	e1a01003 	mov	r1, r3
80026f54:	ebfffcbd 	bl	80026250 <argint>
80026f58:	e1a03000 	mov	r3, r0
80026f5c:	e3530000 	cmp	r3, #0
80026f60:	aa000001 	bge	80026f6c <sys_open+0x4c>
        return -1;
80026f64:	e3e03000 	mvn	r3, #0
80026f68:	ea00005f 	b	800270ec <sys_open+0x1cc>
    }

    if(omode & O_CREATE){
80026f6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80026f70:	e2033c02 	and	r3, r3, #512	; 0x200
80026f74:	e3530000 	cmp	r3, #0
80026f78:	0a00000d 	beq	80026fb4 <sys_open+0x94>
        begin_trans();
80026f7c:	ebfff5df 	bl	80024700 <begin_trans>
        ip = create(path, T_FILE, 0, 0);
80026f80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80026f84:	e1a00003 	mov	r0, r3
80026f88:	e3a01002 	mov	r1, #2
80026f8c:	e3a02000 	mov	r2, #0
80026f90:	e3a03000 	mov	r3, #0
80026f94:	ebffff63 	bl	80026d28 <create>
80026f98:	e50b0008 	str	r0, [fp, #-8]
        commit_trans();
80026f9c:	ebfff5ef 	bl	80024760 <commit_trans>

        if(ip == 0) {
80026fa0:	e51b3008 	ldr	r3, [fp, #-8]
80026fa4:	e3530000 	cmp	r3, #0
80026fa8:	1a000018 	bne	80027010 <sys_open+0xf0>
            return -1;
80026fac:	e3e03000 	mvn	r3, #0
80026fb0:	ea00004d 	b	800270ec <sys_open+0x1cc>
        }

    } else {
        if((ip = namei(path)) == 0) {
80026fb4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80026fb8:	e1a00003 	mov	r0, r3
80026fbc:	ebfff4db 	bl	80024330 <namei>
80026fc0:	e50b0008 	str	r0, [fp, #-8]
80026fc4:	e51b3008 	ldr	r3, [fp, #-8]
80026fc8:	e3530000 	cmp	r3, #0
80026fcc:	1a000001 	bne	80026fd8 <sys_open+0xb8>
            return -1;
80026fd0:	e3e03000 	mvn	r3, #0
80026fd4:	ea000044 	b	800270ec <sys_open+0x1cc>
        }

        ilock(ip);
80026fd8:	e51b0008 	ldr	r0, [fp, #-8]
80026fdc:	ebfff0d7 	bl	80023340 <ilock>

        if(ip->type == T_DIR && omode != O_RDONLY){
80026fe0:	e51b3008 	ldr	r3, [fp, #-8]
80026fe4:	e1d331b0 	ldrh	r3, [r3, #16]
80026fe8:	e6bf3073 	sxth	r3, r3
80026fec:	e3530001 	cmp	r3, #1
80026ff0:	1a000006 	bne	80027010 <sys_open+0xf0>
80026ff4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80026ff8:	e3530000 	cmp	r3, #0
80026ffc:	0a000003 	beq	80027010 <sys_open+0xf0>
            iunlockput(ip);
80027000:	e51b0008 	ldr	r0, [fp, #-8]
80027004:	ebfff194 	bl	8002365c <iunlockput>
            return -1;
80027008:	e3e03000 	mvn	r3, #0
8002700c:	ea000036 	b	800270ec <sys_open+0x1cc>
        }
    }

    if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80027010:	ebffedac 	bl	800226c8 <filealloc>
80027014:	e50b000c 	str	r0, [fp, #-12]
80027018:	e51b300c 	ldr	r3, [fp, #-12]
8002701c:	e3530000 	cmp	r3, #0
80027020:	0a000005 	beq	8002703c <sys_open+0x11c>
80027024:	e51b000c 	ldr	r0, [fp, #-12]
80027028:	ebfffd55 	bl	80026584 <fdalloc>
8002702c:	e50b0010 	str	r0, [fp, #-16]
80027030:	e51b3010 	ldr	r3, [fp, #-16]
80027034:	e3530000 	cmp	r3, #0
80027038:	aa000008 	bge	80027060 <sys_open+0x140>
        if(f) {
8002703c:	e51b300c 	ldr	r3, [fp, #-12]
80027040:	e3530000 	cmp	r3, #0
80027044:	0a000001 	beq	80027050 <sys_open+0x130>
            fileclose(f);
80027048:	e51b000c 	ldr	r0, [fp, #-12]
8002704c:	ebffeddc 	bl	800227c4 <fileclose>
        }

        iunlockput(ip);
80027050:	e51b0008 	ldr	r0, [fp, #-8]
80027054:	ebfff180 	bl	8002365c <iunlockput>
        return -1;
80027058:	e3e03000 	mvn	r3, #0
8002705c:	ea000022 	b	800270ec <sys_open+0x1cc>
    }

    iunlock(ip);
80027060:	e51b0008 	ldr	r0, [fp, #-8]
80027064:	ebfff11c 	bl	800234dc <iunlock>

    f->type = FD_INODE;
80027068:	e51b300c 	ldr	r3, [fp, #-12]
8002706c:	e3a02002 	mov	r2, #2
80027070:	e5c32000 	strb	r2, [r3]
    f->ip = ip;
80027074:	e51b300c 	ldr	r3, [fp, #-12]
80027078:	e51b2008 	ldr	r2, [fp, #-8]
8002707c:	e5832010 	str	r2, [r3, #16]
    f->off = 0;
80027080:	e51b300c 	ldr	r3, [fp, #-12]
80027084:	e3a02000 	mov	r2, #0
80027088:	e5832014 	str	r2, [r3, #20]
    f->readable = !(omode & O_WRONLY);
8002708c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80027090:	e2033001 	and	r3, r3, #1
80027094:	e3530000 	cmp	r3, #0
80027098:	13a03000 	movne	r3, #0
8002709c:	03a03001 	moveq	r3, #1
800270a0:	e6ef2073 	uxtb	r2, r3
800270a4:	e51b300c 	ldr	r3, [fp, #-12]
800270a8:	e5c32008 	strb	r2, [r3, #8]
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
800270ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800270b0:	e2033001 	and	r3, r3, #1
800270b4:	e6ef3073 	uxtb	r3, r3
800270b8:	e3530000 	cmp	r3, #0
800270bc:	1a000003 	bne	800270d0 <sys_open+0x1b0>
800270c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800270c4:	e2033002 	and	r3, r3, #2
800270c8:	e3530000 	cmp	r3, #0
800270cc:	0a000001 	beq	800270d8 <sys_open+0x1b8>
800270d0:	e3a03001 	mov	r3, #1
800270d4:	ea000000 	b	800270dc <sys_open+0x1bc>
800270d8:	e3a03000 	mov	r3, #0
800270dc:	e6ef2073 	uxtb	r2, r3
800270e0:	e51b300c 	ldr	r3, [fp, #-12]
800270e4:	e5c32009 	strb	r2, [r3, #9]

    return fd;
800270e8:	e51b3010 	ldr	r3, [fp, #-16]
}
800270ec:	e1a00003 	mov	r0, r3
800270f0:	e24bd004 	sub	sp, fp, #4
800270f4:	e8bd8800 	pop	{fp, pc}

800270f8 <sys_mkdir>:

int sys_mkdir(void)
{
800270f8:	e92d4800 	push	{fp, lr}
800270fc:	e28db004 	add	fp, sp, #4
80027100:	e24dd008 	sub	sp, sp, #8
    char *path;
    struct inode *ip;

    begin_trans();
80027104:	ebfff57d 	bl	80024700 <begin_trans>

    if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80027108:	e3a00000 	mov	r0, #0
8002710c:	e24b300c 	sub	r3, fp, #12
80027110:	e1a01003 	mov	r1, r3
80027114:	ebfffc93 	bl	80026368 <argstr>
80027118:	e1a03000 	mov	r3, r0
8002711c:	e3530000 	cmp	r3, #0
80027120:	ba000009 	blt	8002714c <sys_mkdir+0x54>
80027124:	e51b300c 	ldr	r3, [fp, #-12]
80027128:	e1a00003 	mov	r0, r3
8002712c:	e3a01001 	mov	r1, #1
80027130:	e3a02000 	mov	r2, #0
80027134:	e3a03000 	mov	r3, #0
80027138:	ebfffefa 	bl	80026d28 <create>
8002713c:	e50b0008 	str	r0, [fp, #-8]
80027140:	e51b3008 	ldr	r3, [fp, #-8]
80027144:	e3530000 	cmp	r3, #0
80027148:	1a000002 	bne	80027158 <sys_mkdir+0x60>
        commit_trans();
8002714c:	ebfff583 	bl	80024760 <commit_trans>
        return -1;
80027150:	e3e03000 	mvn	r3, #0
80027154:	ea000003 	b	80027168 <sys_mkdir+0x70>
    }

    iunlockput(ip);
80027158:	e51b0008 	ldr	r0, [fp, #-8]
8002715c:	ebfff13e 	bl	8002365c <iunlockput>
    commit_trans();
80027160:	ebfff57e 	bl	80024760 <commit_trans>

    return 0;
80027164:	e3a03000 	mov	r3, #0
}
80027168:	e1a00003 	mov	r0, r3
8002716c:	e24bd004 	sub	sp, fp, #4
80027170:	e8bd8800 	pop	{fp, pc}

80027174 <sys_mknod>:

int sys_mknod(void)
{
80027174:	e92d4800 	push	{fp, lr}
80027178:	e28db004 	add	fp, sp, #4
8002717c:	e24dd018 	sub	sp, sp, #24
    struct inode *ip;
    char *path;
    int len;
    int major, minor;

    begin_trans();
80027180:	ebfff55e 	bl	80024700 <begin_trans>

    if((len=argstr(0, &path)) < 0 ||
80027184:	e3a00000 	mov	r0, #0
80027188:	e24b3010 	sub	r3, fp, #16
8002718c:	e1a01003 	mov	r1, r3
80027190:	ebfffc74 	bl	80026368 <argstr>
80027194:	e50b0008 	str	r0, [fp, #-8]
80027198:	e51b3008 	ldr	r3, [fp, #-8]
8002719c:	e3530000 	cmp	r3, #0
800271a0:	ba00001b 	blt	80027214 <sys_mknod+0xa0>
            argint(1, &major) < 0 || argint(2, &minor) < 0 ||
800271a4:	e3a00001 	mov	r0, #1
800271a8:	e24b3014 	sub	r3, fp, #20
800271ac:	e1a01003 	mov	r1, r3
800271b0:	ebfffc26 	bl	80026250 <argint>
800271b4:	e1a03000 	mov	r3, r0
    int len;
    int major, minor;

    begin_trans();

    if((len=argstr(0, &path)) < 0 ||
800271b8:	e3530000 	cmp	r3, #0
800271bc:	ba000014 	blt	80027214 <sys_mknod+0xa0>
            argint(1, &major) < 0 || argint(2, &minor) < 0 ||
800271c0:	e3a00002 	mov	r0, #2
800271c4:	e24b3018 	sub	r3, fp, #24
800271c8:	e1a01003 	mov	r1, r3
800271cc:	ebfffc1f 	bl	80026250 <argint>
800271d0:	e1a03000 	mov	r3, r0
800271d4:	e3530000 	cmp	r3, #0
800271d8:	ba00000d 	blt	80027214 <sys_mknod+0xa0>
            (ip = create(path, T_DEV, major, minor)) == 0){
800271dc:	e51b1010 	ldr	r1, [fp, #-16]
800271e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
800271e4:	e6ff2073 	uxth	r2, r3
800271e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800271ec:	e6ff3073 	uxth	r3, r3
    int major, minor;

    begin_trans();

    if((len=argstr(0, &path)) < 0 ||
            argint(1, &major) < 0 || argint(2, &minor) < 0 ||
800271f0:	e6bf2072 	sxth	r2, r2
800271f4:	e6bf3073 	sxth	r3, r3
800271f8:	e1a00001 	mov	r0, r1
800271fc:	e3a01003 	mov	r1, #3
80027200:	ebfffec8 	bl	80026d28 <create>
80027204:	e50b000c 	str	r0, [fp, #-12]
80027208:	e51b300c 	ldr	r3, [fp, #-12]
8002720c:	e3530000 	cmp	r3, #0
80027210:	1a000002 	bne	80027220 <sys_mknod+0xac>
            (ip = create(path, T_DEV, major, minor)) == 0){

        commit_trans();
80027214:	ebfff551 	bl	80024760 <commit_trans>
        return -1;
80027218:	e3e03000 	mvn	r3, #0
8002721c:	ea000003 	b	80027230 <sys_mknod+0xbc>
    }

    iunlockput(ip);
80027220:	e51b000c 	ldr	r0, [fp, #-12]
80027224:	ebfff10c 	bl	8002365c <iunlockput>
    commit_trans();
80027228:	ebfff54c 	bl	80024760 <commit_trans>

    return 0;
8002722c:	e3a03000 	mov	r3, #0
}
80027230:	e1a00003 	mov	r0, r3
80027234:	e24bd004 	sub	sp, fp, #4
80027238:	e8bd8800 	pop	{fp, pc}

8002723c <sys_chdir>:

int sys_chdir(void)
{
8002723c:	e92d4800 	push	{fp, lr}
80027240:	e28db004 	add	fp, sp, #4
80027244:	e24dd008 	sub	sp, sp, #8
    char *path;
    struct inode *ip;

    if(argstr(0, &path) < 0 || (ip = namei(path)) == 0) {
80027248:	e3a00000 	mov	r0, #0
8002724c:	e24b300c 	sub	r3, fp, #12
80027250:	e1a01003 	mov	r1, r3
80027254:	ebfffc43 	bl	80026368 <argstr>
80027258:	e1a03000 	mov	r3, r0
8002725c:	e3530000 	cmp	r3, #0
80027260:	ba000006 	blt	80027280 <sys_chdir+0x44>
80027264:	e51b300c 	ldr	r3, [fp, #-12]
80027268:	e1a00003 	mov	r0, r3
8002726c:	ebfff42f 	bl	80024330 <namei>
80027270:	e50b0008 	str	r0, [fp, #-8]
80027274:	e51b3008 	ldr	r3, [fp, #-8]
80027278:	e3530000 	cmp	r3, #0
8002727c:	1a000001 	bne	80027288 <sys_chdir+0x4c>
        return -1;
80027280:	e3e03000 	mvn	r3, #0
80027284:	ea000018 	b	800272ec <sys_chdir+0xb0>
    }

    ilock(ip);
80027288:	e51b0008 	ldr	r0, [fp, #-8]
8002728c:	ebfff02b 	bl	80023340 <ilock>

    if(ip->type != T_DIR){
80027290:	e51b3008 	ldr	r3, [fp, #-8]
80027294:	e1d331b0 	ldrh	r3, [r3, #16]
80027298:	e6bf3073 	sxth	r3, r3
8002729c:	e3530001 	cmp	r3, #1
800272a0:	0a000003 	beq	800272b4 <sys_chdir+0x78>
        iunlockput(ip);
800272a4:	e51b0008 	ldr	r0, [fp, #-8]
800272a8:	ebfff0eb 	bl	8002365c <iunlockput>
        return -1;
800272ac:	e3e03000 	mvn	r3, #0
800272b0:	ea00000d 	b	800272ec <sys_chdir+0xb0>
    }

    iunlock(ip);
800272b4:	e51b0008 	ldr	r0, [fp, #-8]
800272b8:	ebfff087 	bl	800234dc <iunlock>

    iput(proc->cwd);
800272bc:	e30e360c 	movw	r3, #58892	; 0xe60c
800272c0:	e348300a 	movt	r3, #32778	; 0x800a
800272c4:	e5933000 	ldr	r3, [r3]
800272c8:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
800272cc:	e1a00003 	mov	r0, r3
800272d0:	ebfff0a3 	bl	80023564 <iput>
    proc->cwd = ip;
800272d4:	e30e360c 	movw	r3, #58892	; 0xe60c
800272d8:	e348300a 	movt	r3, #32778	; 0x800a
800272dc:	e5933000 	ldr	r3, [r3]
800272e0:	e51b2008 	ldr	r2, [fp, #-8]
800272e4:	e583206c 	str	r2, [r3, #108]	; 0x6c

    return 0;
800272e8:	e3a03000 	mov	r3, #0
}
800272ec:	e1a00003 	mov	r0, r3
800272f0:	e24bd004 	sub	sp, fp, #4
800272f4:	e8bd8800 	pop	{fp, pc}

800272f8 <sys_exec>:

int sys_exec(void)
{
800272f8:	e92d4800 	push	{fp, lr}
800272fc:	e28db004 	add	fp, sp, #4
80027300:	e24dd090 	sub	sp, sp, #144	; 0x90
    char *path, *argv[MAXARG];
    int i;
    uint uargv, uarg;

    if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80027304:	e3a00000 	mov	r0, #0
80027308:	e24b300c 	sub	r3, fp, #12
8002730c:	e1a01003 	mov	r1, r3
80027310:	ebfffc14 	bl	80026368 <argstr>
80027314:	e1a03000 	mov	r3, r0
80027318:	e3530000 	cmp	r3, #0
8002731c:	ba000006 	blt	8002733c <sys_exec+0x44>
80027320:	e3a00001 	mov	r0, #1
80027324:	e24b3090 	sub	r3, fp, #144	; 0x90
80027328:	e1a01003 	mov	r1, r3
8002732c:	ebfffbc7 	bl	80026250 <argint>
80027330:	e1a03000 	mov	r3, r0
80027334:	e3530000 	cmp	r3, #0
80027338:	aa000001 	bge	80027344 <sys_exec+0x4c>
        return -1;
8002733c:	e3e03000 	mvn	r3, #0
80027340:	ea00003e 	b	80027440 <sys_exec+0x148>
    }

    memset(argv, 0, sizeof(argv));
80027344:	e24b308c 	sub	r3, fp, #140	; 0x8c
80027348:	e1a00003 	mov	r0, r3
8002734c:	e3a01000 	mov	r1, #0
80027350:	e3a02080 	mov	r2, #128	; 0x80
80027354:	ebffe329 	bl	80020000 <memset>

    for(i=0;; i++){
80027358:	e3a03000 	mov	r3, #0
8002735c:	e50b3008 	str	r3, [fp, #-8]
        if(i >= NELEM(argv)) {
80027360:	e51b3008 	ldr	r3, [fp, #-8]
80027364:	e353001f 	cmp	r3, #31
80027368:	9a000001 	bls	80027374 <sys_exec+0x7c>
            return -1;
8002736c:	e3e03000 	mvn	r3, #0
80027370:	ea000032 	b	80027440 <sys_exec+0x148>
        }

        if(fetchint(uargv+4*i, (int*)&uarg) < 0) {
80027374:	e51b3008 	ldr	r3, [fp, #-8]
80027378:	e1a03103 	lsl	r3, r3, #2
8002737c:	e1a02003 	mov	r2, r3
80027380:	e51b3090 	ldr	r3, [fp, #-144]	; 0xffffff70
80027384:	e0823003 	add	r3, r2, r3
80027388:	e1a00003 	mov	r0, r3
8002738c:	e24b3094 	sub	r3, fp, #148	; 0x94
80027390:	e1a01003 	mov	r1, r3
80027394:	ebfffb5f 	bl	80026118 <fetchint>
80027398:	e1a03000 	mov	r3, r0
8002739c:	e3530000 	cmp	r3, #0
800273a0:	aa000001 	bge	800273ac <sys_exec+0xb4>
            return -1;
800273a4:	e3e03000 	mvn	r3, #0
800273a8:	ea000024 	b	80027440 <sys_exec+0x148>
        }

        if(uarg == 0){
800273ac:	e51b3094 	ldr	r3, [fp, #-148]	; 0xffffff6c
800273b0:	e3530000 	cmp	r3, #0
800273b4:	1a000010 	bne	800273fc <sys_exec+0x104>
            argv[i] = 0;
800273b8:	e51b3008 	ldr	r3, [fp, #-8]
800273bc:	e3e01087 	mvn	r1, #135	; 0x87
800273c0:	e1a03103 	lsl	r3, r3, #2
800273c4:	e24b0004 	sub	r0, fp, #4
800273c8:	e0802003 	add	r2, r0, r3
800273cc:	e1a03001 	mov	r3, r1
800273d0:	e0823003 	add	r3, r2, r3
800273d4:	e3a02000 	mov	r2, #0
800273d8:	e5832000 	str	r2, [r3]
            break;
800273dc:	e1a00000 	nop			; (mov r0, r0)
        if(fetchstr(uarg, &argv[i]) < 0) {
            return -1;
        }
    }

    return exec(path, argv);
800273e0:	e51b300c 	ldr	r3, [fp, #-12]
800273e4:	e1a00003 	mov	r0, r3
800273e8:	e24b308c 	sub	r3, fp, #140	; 0x8c
800273ec:	e1a01003 	mov	r1, r3
800273f0:	ebffeb68 	bl	80022198 <exec>
800273f4:	e1a03000 	mov	r3, r0
800273f8:	ea000010 	b	80027440 <sys_exec+0x148>
        if(uarg == 0){
            argv[i] = 0;
            break;
        }

        if(fetchstr(uarg, &argv[i]) < 0) {
800273fc:	e51b2094 	ldr	r2, [fp, #-148]	; 0xffffff6c
80027400:	e51b3008 	ldr	r3, [fp, #-8]
80027404:	e1a03103 	lsl	r3, r3, #2
80027408:	e24b108c 	sub	r1, fp, #140	; 0x8c
8002740c:	e0813003 	add	r3, r1, r3
80027410:	e1a00002 	mov	r0, r2
80027414:	e1a01003 	mov	r1, r3
80027418:	ebfffb5d 	bl	80026194 <fetchstr>
8002741c:	e1a03000 	mov	r3, r0
80027420:	e3530000 	cmp	r3, #0
80027424:	aa000001 	bge	80027430 <sys_exec+0x138>
            return -1;
80027428:	e3e03000 	mvn	r3, #0
8002742c:	ea000003 	b	80027440 <sys_exec+0x148>
        return -1;
    }

    memset(argv, 0, sizeof(argv));

    for(i=0;; i++){
80027430:	e51b3008 	ldr	r3, [fp, #-8]
80027434:	e2833001 	add	r3, r3, #1
80027438:	e50b3008 	str	r3, [fp, #-8]
        }

        if(fetchstr(uarg, &argv[i]) < 0) {
            return -1;
        }
    }
8002743c:	eaffffc7 	b	80027360 <sys_exec+0x68>

    return exec(path, argv);
}
80027440:	e1a00003 	mov	r0, r3
80027444:	e24bd004 	sub	sp, fp, #4
80027448:	e8bd8800 	pop	{fp, pc}

8002744c <sys_pipe>:

int sys_pipe(void)
{
8002744c:	e92d4800 	push	{fp, lr}
80027450:	e28db004 	add	fp, sp, #4
80027454:	e24dd018 	sub	sp, sp, #24
    int *fd;
    struct file *rf, *wf;
    int fd0, fd1;

    if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0) {
80027458:	e3a00000 	mov	r0, #0
8002745c:	e24b3010 	sub	r3, fp, #16
80027460:	e1a01003 	mov	r1, r3
80027464:	e3a02008 	mov	r2, #8
80027468:	ebfffb93 	bl	800262bc <argptr>
8002746c:	e1a03000 	mov	r3, r0
80027470:	e3530000 	cmp	r3, #0
80027474:	aa000001 	bge	80027480 <sys_pipe+0x34>
        return -1;
80027478:	e3e03000 	mvn	r3, #0
8002747c:	ea000038 	b	80027564 <sys_pipe+0x118>
    }

    if(pipealloc(&rf, &wf) < 0) {
80027480:	e24b3014 	sub	r3, fp, #20
80027484:	e1a00003 	mov	r0, r3
80027488:	e24b3018 	sub	r3, fp, #24
8002748c:	e1a01003 	mov	r1, r3
80027490:	ebfff5d7 	bl	80024bf4 <pipealloc>
80027494:	e1a03000 	mov	r3, r0
80027498:	e3530000 	cmp	r3, #0
8002749c:	aa000001 	bge	800274a8 <sys_pipe+0x5c>
        return -1;
800274a0:	e3e03000 	mvn	r3, #0
800274a4:	ea00002e 	b	80027564 <sys_pipe+0x118>
    }

    fd0 = -1;
800274a8:	e3e03000 	mvn	r3, #0
800274ac:	e50b3008 	str	r3, [fp, #-8]

    if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
800274b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
800274b4:	e1a00003 	mov	r0, r3
800274b8:	ebfffc31 	bl	80026584 <fdalloc>
800274bc:	e50b0008 	str	r0, [fp, #-8]
800274c0:	e51b3008 	ldr	r3, [fp, #-8]
800274c4:	e3530000 	cmp	r3, #0
800274c8:	ba000006 	blt	800274e8 <sys_pipe+0x9c>
800274cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800274d0:	e1a00003 	mov	r0, r3
800274d4:	ebfffc2a 	bl	80026584 <fdalloc>
800274d8:	e50b000c 	str	r0, [fp, #-12]
800274dc:	e51b300c 	ldr	r3, [fp, #-12]
800274e0:	e3530000 	cmp	r3, #0
800274e4:	aa000016 	bge	80027544 <sys_pipe+0xf8>
        if(fd0 >= 0) {
800274e8:	e51b3008 	ldr	r3, [fp, #-8]
800274ec:	e3530000 	cmp	r3, #0
800274f0:	ba00000b 	blt	80027524 <sys_pipe+0xd8>
            proc->ofile[fd0] = 0;
800274f4:	e30e360c 	movw	r3, #58892	; 0xe60c
800274f8:	e348300a 	movt	r3, #32778	; 0x800a
800274fc:	e5932000 	ldr	r2, [r3]
80027500:	e51b3008 	ldr	r3, [fp, #-8]
80027504:	e283300a 	add	r3, r3, #10
80027508:	e3a01004 	mov	r1, #4
8002750c:	e1a03103 	lsl	r3, r3, #2
80027510:	e0822003 	add	r2, r2, r3
80027514:	e1a03001 	mov	r3, r1
80027518:	e0823003 	add	r3, r2, r3
8002751c:	e3a02000 	mov	r2, #0
80027520:	e5832000 	str	r2, [r3]
        }

        fileclose(rf);
80027524:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80027528:	e1a00003 	mov	r0, r3
8002752c:	ebffeca4 	bl	800227c4 <fileclose>
        fileclose(wf);
80027530:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80027534:	e1a00003 	mov	r0, r3
80027538:	ebffeca1 	bl	800227c4 <fileclose>

        return -1;
8002753c:	e3e03000 	mvn	r3, #0
80027540:	ea000007 	b	80027564 <sys_pipe+0x118>
    }

    fd[0] = fd0;
80027544:	e51b3010 	ldr	r3, [fp, #-16]
80027548:	e51b2008 	ldr	r2, [fp, #-8]
8002754c:	e5832000 	str	r2, [r3]
    fd[1] = fd1;
80027550:	e51b3010 	ldr	r3, [fp, #-16]
80027554:	e2833004 	add	r3, r3, #4
80027558:	e51b200c 	ldr	r2, [fp, #-12]
8002755c:	e5832000 	str	r2, [r3]

    return 0;
80027560:	e3a03000 	mov	r3, #0
}
80027564:	e1a00003 	mov	r0, r3
80027568:	e24bd004 	sub	sp, fp, #4
8002756c:	e8bd8800 	pop	{fp, pc}

80027570 <sys_kthread_create>:
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int sys_kthread_create(void)
{
80027570:	e92d4800 	push	{fp, lr}
80027574:	e28db004 	add	fp, sp, #4
    kthread_create();
80027578:	ebfffaaa 	bl	80026028 <kthread_create>
    return 0;
8002757c:	e3a03000 	mov	r3, #0
}
80027580:	e1a00003 	mov	r0, r3
80027584:	e8bd8800 	pop	{fp, pc}

80027588 <sys_fork>:

int sys_fork(void)
{
80027588:	e92d4800 	push	{fp, lr}
8002758c:	e28db004 	add	fp, sp, #4
    return fork();
80027590:	ebfff7e1 	bl	8002551c <fork>
80027594:	e1a03000 	mov	r3, r0
}
80027598:	e1a00003 	mov	r0, r3
8002759c:	e8bd8800 	pop	{fp, pc}

800275a0 <sys_exit>:

int sys_exit(void)
{
800275a0:	e92d4800 	push	{fp, lr}
800275a4:	e28db004 	add	fp, sp, #4
    exit();
800275a8:	ebfff868 	bl	80025750 <exit>
    return 0;  // not reached
800275ac:	e3a03000 	mov	r3, #0
}
800275b0:	e1a00003 	mov	r0, r3
800275b4:	e8bd8800 	pop	{fp, pc}

800275b8 <sys_wait>:

int sys_wait(void)
{
800275b8:	e92d4800 	push	{fp, lr}
800275bc:	e28db004 	add	fp, sp, #4
    return wait();
800275c0:	ebfff8dd 	bl	8002593c <wait>
800275c4:	e1a03000 	mov	r3, r0
}
800275c8:	e1a00003 	mov	r0, r3
800275cc:	e8bd8800 	pop	{fp, pc}

800275d0 <sys_kill>:

int sys_kill(void)
{
800275d0:	e92d4800 	push	{fp, lr}
800275d4:	e28db004 	add	fp, sp, #4
800275d8:	e24dd008 	sub	sp, sp, #8
    int pid;

    if(argint(0, &pid) < 0) {
800275dc:	e3a00000 	mov	r0, #0
800275e0:	e24b3008 	sub	r3, fp, #8
800275e4:	e1a01003 	mov	r1, r3
800275e8:	ebfffb18 	bl	80026250 <argint>
800275ec:	e1a03000 	mov	r3, r0
800275f0:	e3530000 	cmp	r3, #0
800275f4:	aa000001 	bge	80027600 <sys_kill+0x30>
        return -1;
800275f8:	e3e03000 	mvn	r3, #0
800275fc:	ea000003 	b	80027610 <sys_kill+0x40>
    }

    return kill(pid);
80027600:	e51b3008 	ldr	r3, [fp, #-8]
80027604:	e1a00003 	mov	r0, r3
80027608:	ebfffa1e 	bl	80025e88 <kill>
8002760c:	e1a03000 	mov	r3, r0
}
80027610:	e1a00003 	mov	r0, r3
80027614:	e24bd004 	sub	sp, fp, #4
80027618:	e8bd8800 	pop	{fp, pc}

8002761c <sys_getpid>:

int sys_getpid(void)
{
8002761c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80027620:	e28db000 	add	fp, sp, #0
    return proc->pid;
80027624:	e30e360c 	movw	r3, #58892	; 0xe60c
80027628:	e348300a 	movt	r3, #32778	; 0x800a
8002762c:	e5933000 	ldr	r3, [r3]
80027630:	e5933010 	ldr	r3, [r3, #16]
}
80027634:	e1a00003 	mov	r0, r3
80027638:	e28bd000 	add	sp, fp, #0
8002763c:	e8bd0800 	pop	{fp}
80027640:	e12fff1e 	bx	lr

80027644 <sys_sbrk>:

int sys_sbrk(void)
{
80027644:	e92d4800 	push	{fp, lr}
80027648:	e28db004 	add	fp, sp, #4
8002764c:	e24dd008 	sub	sp, sp, #8
    int addr;
    int n;

    if(argint(0, &n) < 0) {
80027650:	e3a00000 	mov	r0, #0
80027654:	e24b300c 	sub	r3, fp, #12
80027658:	e1a01003 	mov	r1, r3
8002765c:	ebfffafb 	bl	80026250 <argint>
80027660:	e1a03000 	mov	r3, r0
80027664:	e3530000 	cmp	r3, #0
80027668:	aa000001 	bge	80027674 <sys_sbrk+0x30>
        return -1;
8002766c:	e3e03000 	mvn	r3, #0
80027670:	ea00000d 	b	800276ac <sys_sbrk+0x68>
    }

    addr = proc->sz;
80027674:	e30e360c 	movw	r3, #58892	; 0xe60c
80027678:	e348300a 	movt	r3, #32778	; 0x800a
8002767c:	e5933000 	ldr	r3, [r3]
80027680:	e5933000 	ldr	r3, [r3]
80027684:	e50b3008 	str	r3, [fp, #-8]

    if(growproc(n) < 0) {
80027688:	e51b300c 	ldr	r3, [fp, #-12]
8002768c:	e1a00003 	mov	r0, r3
80027690:	ebfff760 	bl	80025418 <growproc>
80027694:	e1a03000 	mov	r3, r0
80027698:	e3530000 	cmp	r3, #0
8002769c:	aa000001 	bge	800276a8 <sys_sbrk+0x64>
        return -1;
800276a0:	e3e03000 	mvn	r3, #0
800276a4:	ea000000 	b	800276ac <sys_sbrk+0x68>
    }

    return addr;
800276a8:	e51b3008 	ldr	r3, [fp, #-8]
}
800276ac:	e1a00003 	mov	r0, r3
800276b0:	e24bd004 	sub	sp, fp, #4
800276b4:	e8bd8800 	pop	{fp, pc}

800276b8 <sys_sleep>:

int sys_sleep(void)
{
800276b8:	e92d4800 	push	{fp, lr}
800276bc:	e28db004 	add	fp, sp, #4
800276c0:	e24dd008 	sub	sp, sp, #8
    int n;
    uint ticks0;

    if(argint(0, &n) < 0) {
800276c4:	e3a00000 	mov	r0, #0
800276c8:	e24b300c 	sub	r3, fp, #12
800276cc:	e1a01003 	mov	r1, r3
800276d0:	ebfffade 	bl	80026250 <argint>
800276d4:	e1a03000 	mov	r3, r0
800276d8:	e3530000 	cmp	r3, #0
800276dc:	aa000001 	bge	800276e8 <sys_sleep+0x30>
        return -1;
800276e0:	e3e03000 	mvn	r3, #0
800276e4:	ea000023 	b	80027778 <sys_sleep+0xc0>
    }

    acquire(&tickslock);
800276e8:	e3000884 	movw	r0, #2180	; 0x884
800276ec:	e348000b 	movt	r0, #32779	; 0x800b
800276f0:	ebfffa65 	bl	8002608c <acquire>

    ticks0 = ticks;
800276f4:	e30038b8 	movw	r3, #2232	; 0x8b8
800276f8:	e348300b 	movt	r3, #32779	; 0x800b
800276fc:	e5933000 	ldr	r3, [r3]
80027700:	e50b3008 	str	r3, [fp, #-8]

    while(ticks - ticks0 < n){
80027704:	ea00000f 	b	80027748 <sys_sleep+0x90>
        if(proc->killed){
80027708:	e30e360c 	movw	r3, #58892	; 0xe60c
8002770c:	e348300a 	movt	r3, #32778	; 0x800a
80027710:	e5933000 	ldr	r3, [r3]
80027714:	e5933028 	ldr	r3, [r3, #40]	; 0x28
80027718:	e3530000 	cmp	r3, #0
8002771c:	0a000004 	beq	80027734 <sys_sleep+0x7c>
            release(&tickslock);
80027720:	e3000884 	movw	r0, #2180	; 0x884
80027724:	e348000b 	movt	r0, #32779	; 0x800b
80027728:	ebfffa61 	bl	800260b4 <release>
            return -1;
8002772c:	e3e03000 	mvn	r3, #0
80027730:	ea000010 	b	80027778 <sys_sleep+0xc0>
        }

        sleep(&ticks, &tickslock);
80027734:	e30008b8 	movw	r0, #2232	; 0x8b8
80027738:	e348000b 	movt	r0, #32779	; 0x800b
8002773c:	e3001884 	movw	r1, #2180	; 0x884
80027740:	e348100b 	movt	r1, #32779	; 0x800b
80027744:	ebfff969 	bl	80025cf0 <sleep>

    acquire(&tickslock);

    ticks0 = ticks;

    while(ticks - ticks0 < n){
80027748:	e30038b8 	movw	r3, #2232	; 0x8b8
8002774c:	e348300b 	movt	r3, #32779	; 0x800b
80027750:	e5932000 	ldr	r2, [r3]
80027754:	e51b3008 	ldr	r3, [fp, #-8]
80027758:	e0632002 	rsb	r2, r3, r2
8002775c:	e51b300c 	ldr	r3, [fp, #-12]
80027760:	e1520003 	cmp	r2, r3
80027764:	3affffe7 	bcc	80027708 <sys_sleep+0x50>
        }

        sleep(&ticks, &tickslock);
    }

    release(&tickslock);
80027768:	e3000884 	movw	r0, #2180	; 0x884
8002776c:	e348000b 	movt	r0, #32779	; 0x800b
80027770:	ebfffa4f 	bl	800260b4 <release>
    return 0;
80027774:	e3a03000 	mov	r3, #0
}
80027778:	e1a00003 	mov	r0, r3
8002777c:	e24bd004 	sub	sp, fp, #4
80027780:	e8bd8800 	pop	{fp, pc}

80027784 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int sys_uptime(void)
{
80027784:	e92d4800 	push	{fp, lr}
80027788:	e28db004 	add	fp, sp, #4
8002778c:	e24dd008 	sub	sp, sp, #8
    uint xticks;

    acquire(&tickslock);
80027790:	e3000884 	movw	r0, #2180	; 0x884
80027794:	e348000b 	movt	r0, #32779	; 0x800b
80027798:	ebfffa3b 	bl	8002608c <acquire>
    xticks = ticks;
8002779c:	e30038b8 	movw	r3, #2232	; 0x8b8
800277a0:	e348300b 	movt	r3, #32779	; 0x800b
800277a4:	e5933000 	ldr	r3, [r3]
800277a8:	e50b3008 	str	r3, [fp, #-8]
    release(&tickslock);
800277ac:	e3000884 	movw	r0, #2180	; 0x884
800277b0:	e348000b 	movt	r0, #32779	; 0x800b
800277b4:	ebfffa3e 	bl	800260b4 <release>

    return xticks;
800277b8:	e51b3008 	ldr	r3, [fp, #-8]
800277bc:	e1a00003 	mov	r0, r3
800277c0:	e24bd004 	sub	sp, fp, #4
800277c4:	e8bd8800 	pop	{fp, pc}

800277c8 <trap_swi>:
800277c8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800277cc:	e14f2000 	mrs	r2, SPSR
800277d0:	e92d0004 	push	{r2}
800277d4:	e92d4000 	push	{lr}
800277d8:	e94d6000 	stmdb	sp, {sp, lr}^
800277dc:	e24dd008 	sub	sp, sp, #8
800277e0:	e1a0000d 	mov	r0, sp
800277e4:	eb000054 	bl	8002793c <swi_handler>

800277e8 <trapret>:
800277e8:	e8dd6000 	ldm	sp, {sp, lr}^
800277ec:	e28dd008 	add	sp, sp, #8
800277f0:	e8bd4000 	pop	{lr}
800277f4:	e8bd0004 	pop	{r2}
800277f8:	e16ff002 	msr	SPSR_fsxc, r2
800277fc:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

80027800 <trap_irq>:
80027800:	e24ee004 	sub	lr, lr, #4
80027804:	e92d4007 	push	{r0, r1, r2, lr}
80027808:	e14f1000 	mrs	r1, SPSR
8002780c:	e1a0000d 	mov	r0, sp
80027810:	e28dd010 	add	sp, sp, #16
80027814:	e10f2000 	mrs	r2, CPSR
80027818:	e3c2201f 	bic	r2, r2, #31
8002781c:	e3822013 	orr	r2, r2, #19
80027820:	e12ff002 	msr	CPSR_fsxc, r2
80027824:	e590200c 	ldr	r2, [r0, #12]
80027828:	e92d0004 	push	{r2}
8002782c:	e92d1ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
80027830:	e8900038 	ldm	r0, {r3, r4, r5}
80027834:	e92d0038 	push	{r3, r4, r5}
80027838:	e92d0002 	push	{r1}
8002783c:	e92d4000 	push	{lr}
80027840:	e94d6000 	stmdb	sp, {sp, lr}^
80027844:	e24dd008 	sub	sp, sp, #8
80027848:	e1a0000d 	mov	r0, sp
8002784c:	eb000046 	bl	8002796c <irq_handler>
80027850:	eaffffe4 	b	800277e8 <trapret>

80027854 <trap_reset>:
80027854:	e3a0e000 	mov	lr, #0
80027858:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8002785c:	e14f2000 	mrs	r2, SPSR
80027860:	e92d0004 	push	{r2}
80027864:	e92d4000 	push	{lr}
80027868:	e94d6000 	stmdb	sp, {sp, lr}^
8002786c:	e24dd008 	sub	sp, sp, #8
80027870:	e1a0000d 	mov	r0, sp
80027874:	eb00004e 	bl	800279b4 <reset_handler>
80027878:	eafffffe 	b	80027878 <trap_reset+0x24>

8002787c <trap_und>:
8002787c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80027880:	e14f2000 	mrs	r2, SPSR
80027884:	e92d0004 	push	{r2}
80027888:	e92d4000 	push	{lr}
8002788c:	e94d6000 	stmdb	sp, {sp, lr}^
80027890:	e24dd008 	sub	sp, sp, #8
80027894:	e1a0000d 	mov	r0, sp
80027898:	eb000052 	bl	800279e8 <und_handler>
8002789c:	eafffffe 	b	8002789c <trap_und+0x20>

800278a0 <trap_iabort>:
800278a0:	e24ee004 	sub	lr, lr, #4
800278a4:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800278a8:	e14f2000 	mrs	r2, SPSR
800278ac:	e92d0004 	push	{r2}
800278b0:	e92d4000 	push	{lr}
800278b4:	e94d6000 	stmdb	sp, {sp, lr}^
800278b8:	e24dd008 	sub	sp, sp, #8
800278bc:	e1a0000d 	mov	r0, sp
800278c0:	eb00006a 	bl	80027a70 <iabort_handler>
800278c4:	eafffffe 	b	800278c4 <trap_iabort+0x24>

800278c8 <trap_dabort>:
800278c8:	e24ee008 	sub	lr, lr, #8
800278cc:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800278d0:	e14f2000 	mrs	r2, SPSR
800278d4:	e92d0004 	push	{r2}
800278d8:	e92d4000 	push	{lr}
800278dc:	e94d6000 	stmdb	sp, {sp, lr}^
800278e0:	e24dd008 	sub	sp, sp, #8
800278e4:	e1a0000d 	mov	r0, sp
800278e8:	eb00004b 	bl	80027a1c <dabort_handler>
800278ec:	eafffffe 	b	800278ec <trap_dabort+0x24>

800278f0 <trap_na>:
800278f0:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800278f4:	e14f2000 	mrs	r2, SPSR
800278f8:	e92d0004 	push	{r2}
800278fc:	e92d4000 	push	{lr}
80027900:	e94d6000 	stmdb	sp, {sp, lr}^
80027904:	e24dd008 	sub	sp, sp, #8
80027908:	e1a0000d 	mov	r0, sp
8002790c:	eb000069 	bl	80027ab8 <na_handler>
80027910:	eafffffe 	b	80027910 <trap_na+0x20>

80027914 <trap_fiq>:
80027914:	e24ee004 	sub	lr, lr, #4
80027918:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8002791c:	e14f2000 	mrs	r2, SPSR
80027920:	e92d0004 	push	{r2}
80027924:	e92d4000 	push	{lr}
80027928:	e94d6000 	stmdb	sp, {sp, lr}^
8002792c:	e24dd008 	sub	sp, sp, #8
80027930:	e1a0000d 	mov	r0, sp
80027934:	eb00006c 	bl	80027aec <fiq_handler>
80027938:	eafffffe 	b	80027938 <trap_fiq+0x24>

8002793c <swi_handler>:
#include "arm.h"
#include "proc.h"

// trap routine
void swi_handler (struct trapframe *r)
{
8002793c:	e92d4800 	push	{fp, lr}
80027940:	e28db004 	add	fp, sp, #4
80027944:	e24dd008 	sub	sp, sp, #8
80027948:	e50b0008 	str	r0, [fp, #-8]
    proc->tf = r;
8002794c:	e30e360c 	movw	r3, #58892	; 0xe60c
80027950:	e348300a 	movt	r3, #32778	; 0x800a
80027954:	e5933000 	ldr	r3, [r3]
80027958:	e51b2008 	ldr	r2, [fp, #-8]
8002795c:	e583201c 	str	r2, [r3, #28]
    syscall ();
80027960:	ebfffa96 	bl	800263c0 <syscall>
}
80027964:	e24bd004 	sub	sp, fp, #4
80027968:	e8bd8800 	pop	{fp, pc}

8002796c <irq_handler>:

// trap routine
void irq_handler (struct trapframe *r)
{
8002796c:	e92d4800 	push	{fp, lr}
80027970:	e28db004 	add	fp, sp, #4
80027974:	e24dd008 	sub	sp, sp, #8
80027978:	e50b0008 	str	r0, [fp, #-8]
    // proc points to the current process. If the kernel is
    // running scheduler, proc is NULL.
    if (proc != NULL) {
8002797c:	e30e360c 	movw	r3, #58892	; 0xe60c
80027980:	e348300a 	movt	r3, #32778	; 0x800a
80027984:	e5933000 	ldr	r3, [r3]
80027988:	e3530000 	cmp	r3, #0
8002798c:	0a000004 	beq	800279a4 <irq_handler+0x38>
        proc->tf = r;
80027990:	e30e360c 	movw	r3, #58892	; 0xe60c
80027994:	e348300a 	movt	r3, #32778	; 0x800a
80027998:	e5933000 	ldr	r3, [r3]
8002799c:	e51b2008 	ldr	r2, [fp, #-8]
800279a0:	e583201c 	str	r2, [r3, #28]
    }

    pic_dispatch (r);
800279a4:	e51b0008 	ldr	r0, [fp, #-8]
800279a8:	eb0006d1 	bl	800294f4 <pic_dispatch>
}
800279ac:	e24bd004 	sub	sp, fp, #4
800279b0:	e8bd8800 	pop	{fp, pc}

800279b4 <reset_handler>:

// trap routine
void reset_handler (struct trapframe *r)
{
800279b4:	e92d4800 	push	{fp, lr}
800279b8:	e28db004 	add	fp, sp, #4
800279bc:	e24dd008 	sub	sp, sp, #8
800279c0:	e50b0008 	str	r0, [fp, #-8]
    cli();
800279c4:	ebffe309 	bl	800205f0 <cli>
    cprintf ("reset at: 0x%x \n", r->pc);
800279c8:	e51b3008 	ldr	r3, [fp, #-8]
800279cc:	e5933044 	ldr	r3, [r3, #68]	; 0x44
800279d0:	e30a006c 	movw	r0, #41068	; 0xa06c
800279d4:	e3480002 	movt	r0, #32770	; 0x8002
800279d8:	e1a01003 	mov	r1, r3
800279dc:	ebffe7eb 	bl	80021990 <cprintf>
}
800279e0:	e24bd004 	sub	sp, fp, #4
800279e4:	e8bd8800 	pop	{fp, pc}

800279e8 <und_handler>:

// trap routine
void und_handler (struct trapframe *r)
{
800279e8:	e92d4800 	push	{fp, lr}
800279ec:	e28db004 	add	fp, sp, #4
800279f0:	e24dd008 	sub	sp, sp, #8
800279f4:	e50b0008 	str	r0, [fp, #-8]
    cli();
800279f8:	ebffe2fc 	bl	800205f0 <cli>
    cprintf ("und at: 0x%x \n", r->pc);
800279fc:	e51b3008 	ldr	r3, [fp, #-8]
80027a00:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80027a04:	e30a0080 	movw	r0, #41088	; 0xa080
80027a08:	e3480002 	movt	r0, #32770	; 0x8002
80027a0c:	e1a01003 	mov	r1, r3
80027a10:	ebffe7de 	bl	80021990 <cprintf>
}
80027a14:	e24bd004 	sub	sp, fp, #4
80027a18:	e8bd8800 	pop	{fp, pc}

80027a1c <dabort_handler>:

// trap routine
void dabort_handler (struct trapframe *r)
{
80027a1c:	e92d4810 	push	{r4, fp, lr}
80027a20:	e28db008 	add	fp, sp, #8
80027a24:	e24dd014 	sub	sp, sp, #20
80027a28:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    uint dfs, fa;

    cli();
80027a2c:	ebffe2ef 	bl	800205f0 <cli>

    // read data fault status register
    asm("MRC p15, 0, %[r], c5, c0, 0": [r]"=r" (dfs)::);
80027a30:	ee154f10 	mrc	15, 0, r4, cr5, cr0, {0}
80027a34:	e50b4010 	str	r4, [fp, #-16]

    // read the fault address register
    asm("MRC p15, 0, %[r], c6, c0, 0": [r]"=r" (fa)::);
80027a38:	ee164f10 	mrc	15, 0, r4, cr6, cr0, {0}
80027a3c:	e50b4014 	str	r4, [fp, #-20]	; 0xffffffec

    cprintf ("data abort: instruction 0x%x, fault addr 0x%x, reason 0x%x \n",
             r->pc, fa, dfs);
80027a40:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    asm("MRC p15, 0, %[r], c5, c0, 0": [r]"=r" (dfs)::);

    // read the fault address register
    asm("MRC p15, 0, %[r], c6, c0, 0": [r]"=r" (fa)::);

    cprintf ("data abort: instruction 0x%x, fault addr 0x%x, reason 0x%x \n",
80027a44:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80027a48:	e30a0090 	movw	r0, #41104	; 0xa090
80027a4c:	e3480002 	movt	r0, #32770	; 0x8002
80027a50:	e1a01003 	mov	r1, r3
80027a54:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80027a58:	e51b3010 	ldr	r3, [fp, #-16]
80027a5c:	ebffe7cb 	bl	80021990 <cprintf>

    /* xzl -- see TRM c5, data fault status register
     * 0x5 -- translation fault, section
     * */

    dump_trapframe (r);
80027a60:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80027a64:	eb0000b6 	bl	80027d44 <dump_trapframe>
}
80027a68:	e24bd008 	sub	sp, fp, #8
80027a6c:	e8bd8810 	pop	{r4, fp, pc}

80027a70 <iabort_handler>:

// trap routine
void iabort_handler (struct trapframe *r)
{
80027a70:	e92d4810 	push	{r4, fp, lr}
80027a74:	e28db008 	add	fp, sp, #8
80027a78:	e24dd014 	sub	sp, sp, #20
80027a7c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    uint ifs;

    // read fault status register
    asm("MRC p15, 0, %[r], c5, c0, 0": [r]"=r" (ifs)::);
80027a80:	ee154f10 	mrc	15, 0, r4, cr5, cr0, {0}
80027a84:	e50b4010 	str	r4, [fp, #-16]

    cli();
80027a88:	ebffe2d8 	bl	800205f0 <cli>
    cprintf ("prefetch abort at: 0x%x (reason: 0x%x)\n", r->pc, ifs);
80027a8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80027a90:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80027a94:	e30a00d0 	movw	r0, #41168	; 0xa0d0
80027a98:	e3480002 	movt	r0, #32770	; 0x8002
80027a9c:	e1a01003 	mov	r1, r3
80027aa0:	e51b2010 	ldr	r2, [fp, #-16]
80027aa4:	ebffe7b9 	bl	80021990 <cprintf>
    dump_trapframe (r);
80027aa8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80027aac:	eb0000a4 	bl	80027d44 <dump_trapframe>
}
80027ab0:	e24bd008 	sub	sp, fp, #8
80027ab4:	e8bd8810 	pop	{r4, fp, pc}

80027ab8 <na_handler>:

// trap routine
void na_handler (struct trapframe *r)
{
80027ab8:	e92d4800 	push	{fp, lr}
80027abc:	e28db004 	add	fp, sp, #4
80027ac0:	e24dd008 	sub	sp, sp, #8
80027ac4:	e50b0008 	str	r0, [fp, #-8]
    cli();
80027ac8:	ebffe2c8 	bl	800205f0 <cli>
    cprintf ("n/a at: 0x%x \n", r->pc);
80027acc:	e51b3008 	ldr	r3, [fp, #-8]
80027ad0:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80027ad4:	e30a00f8 	movw	r0, #41208	; 0xa0f8
80027ad8:	e3480002 	movt	r0, #32770	; 0x8002
80027adc:	e1a01003 	mov	r1, r3
80027ae0:	ebffe7aa 	bl	80021990 <cprintf>
}
80027ae4:	e24bd004 	sub	sp, fp, #4
80027ae8:	e8bd8800 	pop	{fp, pc}

80027aec <fiq_handler>:

// trap routine
void fiq_handler (struct trapframe *r)
{
80027aec:	e92d4800 	push	{fp, lr}
80027af0:	e28db004 	add	fp, sp, #4
80027af4:	e24dd008 	sub	sp, sp, #8
80027af8:	e50b0008 	str	r0, [fp, #-8]
    cli();
80027afc:	ebffe2bb 	bl	800205f0 <cli>
    cprintf ("fiq at: 0x%x \n", r->pc);
80027b00:	e51b3008 	ldr	r3, [fp, #-8]
80027b04:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80027b08:	e30a0108 	movw	r0, #41224	; 0xa108
80027b0c:	e3480002 	movt	r0, #32770	; 0x8002
80027b10:	e1a01003 	mov	r1, r3
80027b14:	ebffe79d 	bl	80021990 <cprintf>
}
80027b18:	e24bd004 	sub	sp, fp, #4
80027b1c:	e8bd8800 	pop	{fp, pc}

80027b20 <trap_init>:

// low-level init code: in real hardware, lower memory is usually mapped
// to flash during startup, we need to remap it to SDRAM
void trap_init ( )
{
80027b20:	e92d4800 	push	{fp, lr}
80027b24:	e28db004 	add	fp, sp, #4
80027b28:	e24dd020 	sub	sp, sp, #32
    volatile uint32 *ram_start;
    char *stk;
    int i;
    uint modes[] = {FIQ_MODE, IRQ_MODE, ABT_MODE, UND_MODE};
80027b2c:	e30a3140 	movw	r3, #41280	; 0xa140
80027b30:	e3483002 	movt	r3, #32770	; 0x8002
80027b34:	e893000f 	ldm	r3, {r0, r1, r2, r3}
80027b38:	e24bc020 	sub	ip, fp, #32
80027b3c:	e88c000f 	stm	ip, {r0, r1, r2, r3}
	/* xzl: the instr seems unchanged for v7a.
	XXX non portable. change it later */
    static uint32 const LDR_PCPC = 0xE59FF000U;

    // create the excpetion vectors
    ram_start = (uint32*)VEC_TBL;
80027b40:	e3a03000 	mov	r3, #0
80027b44:	e34f3fff 	movt	r3, #65535	; 0xffff
80027b48:	e50b300c 	str	r3, [fp, #-12]

	/* xzl: the following vector seems unchanged for v7a.
       see trm 'the vector tables */
    ram_start[0] = LDR_PCPC | 0x18; // Reset (SVC)
80027b4c:	e30a3250 	movw	r3, #41552	; 0xa250
80027b50:	e3483002 	movt	r3, #32770	; 0x8002
80027b54:	e5933000 	ldr	r3, [r3]
80027b58:	e3832018 	orr	r2, r3, #24
80027b5c:	e51b300c 	ldr	r3, [fp, #-12]
80027b60:	e5832000 	str	r2, [r3]
    ram_start[1] = LDR_PCPC | 0x18; // Undefine Instruction (UND)
80027b64:	e51b300c 	ldr	r3, [fp, #-12]
80027b68:	e2832004 	add	r2, r3, #4
80027b6c:	e30a3250 	movw	r3, #41552	; 0xa250
80027b70:	e3483002 	movt	r3, #32770	; 0x8002
80027b74:	e5933000 	ldr	r3, [r3]
80027b78:	e3833018 	orr	r3, r3, #24
80027b7c:	e5823000 	str	r3, [r2]
    ram_start[2] = LDR_PCPC | 0x18; // Software interrupt (SVC)
80027b80:	e51b300c 	ldr	r3, [fp, #-12]
80027b84:	e2832008 	add	r2, r3, #8
80027b88:	e30a3250 	movw	r3, #41552	; 0xa250
80027b8c:	e3483002 	movt	r3, #32770	; 0x8002
80027b90:	e5933000 	ldr	r3, [r3]
80027b94:	e3833018 	orr	r3, r3, #24
80027b98:	e5823000 	str	r3, [r2]
    ram_start[3] = LDR_PCPC | 0x18; // Prefetch abort (ABT)
80027b9c:	e51b300c 	ldr	r3, [fp, #-12]
80027ba0:	e283200c 	add	r2, r3, #12
80027ba4:	e30a3250 	movw	r3, #41552	; 0xa250
80027ba8:	e3483002 	movt	r3, #32770	; 0x8002
80027bac:	e5933000 	ldr	r3, [r3]
80027bb0:	e3833018 	orr	r3, r3, #24
80027bb4:	e5823000 	str	r3, [r2]
    ram_start[4] = LDR_PCPC | 0x18; // Data abort (ABT)
80027bb8:	e51b300c 	ldr	r3, [fp, #-12]
80027bbc:	e2832010 	add	r2, r3, #16
80027bc0:	e30a3250 	movw	r3, #41552	; 0xa250
80027bc4:	e3483002 	movt	r3, #32770	; 0x8002
80027bc8:	e5933000 	ldr	r3, [r3]
80027bcc:	e3833018 	orr	r3, r3, #24
80027bd0:	e5823000 	str	r3, [r2]
    ram_start[5] = LDR_PCPC | 0x18; // Not assigned (-)
80027bd4:	e51b300c 	ldr	r3, [fp, #-12]
80027bd8:	e2832014 	add	r2, r3, #20
80027bdc:	e30a3250 	movw	r3, #41552	; 0xa250
80027be0:	e3483002 	movt	r3, #32770	; 0x8002
80027be4:	e5933000 	ldr	r3, [r3]
80027be8:	e3833018 	orr	r3, r3, #24
80027bec:	e5823000 	str	r3, [r2]
    ram_start[6] = LDR_PCPC | 0x18; // IRQ (IRQ)
80027bf0:	e51b300c 	ldr	r3, [fp, #-12]
80027bf4:	e2832018 	add	r2, r3, #24
80027bf8:	e30a3250 	movw	r3, #41552	; 0xa250
80027bfc:	e3483002 	movt	r3, #32770	; 0x8002
80027c00:	e5933000 	ldr	r3, [r3]
80027c04:	e3833018 	orr	r3, r3, #24
80027c08:	e5823000 	str	r3, [r2]
    ram_start[7] = LDR_PCPC | 0x18; // FIQ (FIQ)
80027c0c:	e51b300c 	ldr	r3, [fp, #-12]
80027c10:	e283201c 	add	r2, r3, #28
80027c14:	e30a3250 	movw	r3, #41552	; 0xa250
80027c18:	e3483002 	movt	r3, #32770	; 0x8002
80027c1c:	e5933000 	ldr	r3, [r3]
80027c20:	e3833018 	orr	r3, r3, #24
80027c24:	e5823000 	str	r3, [r2]

    ram_start[8]  = (uint32)trap_reset;
80027c28:	e51b300c 	ldr	r3, [fp, #-12]
80027c2c:	e2832020 	add	r2, r3, #32
80027c30:	e3073854 	movw	r3, #30804	; 0x7854
80027c34:	e3483002 	movt	r3, #32770	; 0x8002
80027c38:	e5823000 	str	r3, [r2]
    ram_start[9]  = (uint32)trap_und;
80027c3c:	e51b300c 	ldr	r3, [fp, #-12]
80027c40:	e2832024 	add	r2, r3, #36	; 0x24
80027c44:	e307387c 	movw	r3, #30844	; 0x787c
80027c48:	e3483002 	movt	r3, #32770	; 0x8002
80027c4c:	e5823000 	str	r3, [r2]
    ram_start[10] = (uint32)trap_swi;
80027c50:	e51b300c 	ldr	r3, [fp, #-12]
80027c54:	e2832028 	add	r2, r3, #40	; 0x28
80027c58:	e30737c8 	movw	r3, #30664	; 0x77c8
80027c5c:	e3483002 	movt	r3, #32770	; 0x8002
80027c60:	e5823000 	str	r3, [r2]
    ram_start[11] = (uint32)trap_iabort;
80027c64:	e51b300c 	ldr	r3, [fp, #-12]
80027c68:	e283202c 	add	r2, r3, #44	; 0x2c
80027c6c:	e30738a0 	movw	r3, #30880	; 0x78a0
80027c70:	e3483002 	movt	r3, #32770	; 0x8002
80027c74:	e5823000 	str	r3, [r2]
    ram_start[12] = (uint32)trap_dabort;
80027c78:	e51b300c 	ldr	r3, [fp, #-12]
80027c7c:	e2832030 	add	r2, r3, #48	; 0x30
80027c80:	e30738c8 	movw	r3, #30920	; 0x78c8
80027c84:	e3483002 	movt	r3, #32770	; 0x8002
80027c88:	e5823000 	str	r3, [r2]
    ram_start[13] = (uint32)trap_na;
80027c8c:	e51b300c 	ldr	r3, [fp, #-12]
80027c90:	e2832034 	add	r2, r3, #52	; 0x34
80027c94:	e30738f0 	movw	r3, #30960	; 0x78f0
80027c98:	e3483002 	movt	r3, #32770	; 0x8002
80027c9c:	e5823000 	str	r3, [r2]
    ram_start[14] = (uint32)trap_irq;
80027ca0:	e51b300c 	ldr	r3, [fp, #-12]
80027ca4:	e2832038 	add	r2, r3, #56	; 0x38
80027ca8:	e3073800 	movw	r3, #30720	; 0x7800
80027cac:	e3483002 	movt	r3, #32770	; 0x8002
80027cb0:	e5823000 	str	r3, [r2]
    ram_start[15] = (uint32)trap_fiq;
80027cb4:	e51b300c 	ldr	r3, [fp, #-12]
80027cb8:	e283203c 	add	r2, r3, #60	; 0x3c
80027cbc:	e3073914 	movw	r3, #30996	; 0x7914
80027cc0:	e3483002 	movt	r3, #32770	; 0x8002
80027cc4:	e5823000 	str	r3, [r2]

    // initialize the stacks for different mode
    for (i = 0; i < sizeof(modes)/sizeof(uint); i++) {
80027cc8:	e3a03000 	mov	r3, #0
80027ccc:	e50b3008 	str	r3, [fp, #-8]
80027cd0:	ea000016 	b	80027d30 <trap_init+0x210>
        stk = alloc_page ();
80027cd4:	ebffe68c 	bl	8002170c <alloc_page>
80027cd8:	e50b0010 	str	r0, [fp, #-16]

        if (stk == NULL) {
80027cdc:	e51b3010 	ldr	r3, [fp, #-16]
80027ce0:	e3530000 	cmp	r3, #0
80027ce4:	1a000002 	bne	80027cf4 <trap_init+0x1d4>
            panic("failed to alloc memory for irq stack");
80027ce8:	e30a0118 	movw	r0, #41240	; 0xa118
80027cec:	e3480002 	movt	r0, #32770	; 0x8002
80027cf0:	ebffe7b1 	bl	80021bbc <panic>
        }

        set_stk (modes[i], (uint)stk);
80027cf4:	e51b3008 	ldr	r3, [fp, #-8]
80027cf8:	e3e0101b 	mvn	r1, #27
80027cfc:	e1a03103 	lsl	r3, r3, #2
80027d00:	e24b0004 	sub	r0, fp, #4
80027d04:	e0802003 	add	r2, r0, r3
80027d08:	e1a03001 	mov	r3, r1
80027d0c:	e0823003 	add	r3, r2, r3
80027d10:	e5932000 	ldr	r2, [r3]
80027d14:	e51b3010 	ldr	r3, [fp, #-16]
80027d18:	e1a00002 	mov	r0, r2
80027d1c:	e1a01003 	mov	r1, r3
80027d20:	ebffe310 	bl	80020968 <set_stk>
    ram_start[13] = (uint32)trap_na;
    ram_start[14] = (uint32)trap_irq;
    ram_start[15] = (uint32)trap_fiq;

    // initialize the stacks for different mode
    for (i = 0; i < sizeof(modes)/sizeof(uint); i++) {
80027d24:	e51b3008 	ldr	r3, [fp, #-8]
80027d28:	e2833001 	add	r3, r3, #1
80027d2c:	e50b3008 	str	r3, [fp, #-8]
80027d30:	e51b3008 	ldr	r3, [fp, #-8]
80027d34:	e3530003 	cmp	r3, #3
80027d38:	9affffe5 	bls	80027cd4 <trap_init+0x1b4>
            panic("failed to alloc memory for irq stack");
        }

        set_stk (modes[i], (uint)stk);
    }
}
80027d3c:	e24bd004 	sub	sp, fp, #4
80027d40:	e8bd8800 	pop	{fp, pc}

80027d44 <dump_trapframe>:

void dump_trapframe (struct trapframe *tf)
{
80027d44:	e92d4800 	push	{fp, lr}
80027d48:	e28db004 	add	fp, sp, #4
80027d4c:	e24dd008 	sub	sp, sp, #8
80027d50:	e50b0008 	str	r0, [fp, #-8]
    cprintf ("r14_svc: 0x%x\n", tf->r14_svc);
80027d54:	e51b3008 	ldr	r3, [fp, #-8]
80027d58:	e5933008 	ldr	r3, [r3, #8]
80027d5c:	e30a0150 	movw	r0, #41296	; 0xa150
80027d60:	e3480002 	movt	r0, #32770	; 0x8002
80027d64:	e1a01003 	mov	r1, r3
80027d68:	ebffe708 	bl	80021990 <cprintf>
    cprintf ("   spsr: 0x%x\n", tf->spsr);
80027d6c:	e51b3008 	ldr	r3, [fp, #-8]
80027d70:	e593300c 	ldr	r3, [r3, #12]
80027d74:	e30a0160 	movw	r0, #41312	; 0xa160
80027d78:	e3480002 	movt	r0, #32770	; 0x8002
80027d7c:	e1a01003 	mov	r1, r3
80027d80:	ebffe702 	bl	80021990 <cprintf>
    cprintf ("     r0: 0x%x\n", tf->r0);
80027d84:	e51b3008 	ldr	r3, [fp, #-8]
80027d88:	e5933010 	ldr	r3, [r3, #16]
80027d8c:	e30a0170 	movw	r0, #41328	; 0xa170
80027d90:	e3480002 	movt	r0, #32770	; 0x8002
80027d94:	e1a01003 	mov	r1, r3
80027d98:	ebffe6fc 	bl	80021990 <cprintf>
    cprintf ("     r1: 0x%x\n", tf->r1);
80027d9c:	e51b3008 	ldr	r3, [fp, #-8]
80027da0:	e5933014 	ldr	r3, [r3, #20]
80027da4:	e30a0180 	movw	r0, #41344	; 0xa180
80027da8:	e3480002 	movt	r0, #32770	; 0x8002
80027dac:	e1a01003 	mov	r1, r3
80027db0:	ebffe6f6 	bl	80021990 <cprintf>
    cprintf ("     r2: 0x%x\n", tf->r2);
80027db4:	e51b3008 	ldr	r3, [fp, #-8]
80027db8:	e5933018 	ldr	r3, [r3, #24]
80027dbc:	e30a0190 	movw	r0, #41360	; 0xa190
80027dc0:	e3480002 	movt	r0, #32770	; 0x8002
80027dc4:	e1a01003 	mov	r1, r3
80027dc8:	ebffe6f0 	bl	80021990 <cprintf>
    cprintf ("     r3: 0x%x\n", tf->r3);
80027dcc:	e51b3008 	ldr	r3, [fp, #-8]
80027dd0:	e593301c 	ldr	r3, [r3, #28]
80027dd4:	e30a01a0 	movw	r0, #41376	; 0xa1a0
80027dd8:	e3480002 	movt	r0, #32770	; 0x8002
80027ddc:	e1a01003 	mov	r1, r3
80027de0:	ebffe6ea 	bl	80021990 <cprintf>
    cprintf ("     r4: 0x%x\n", tf->r4);
80027de4:	e51b3008 	ldr	r3, [fp, #-8]
80027de8:	e5933020 	ldr	r3, [r3, #32]
80027dec:	e30a01b0 	movw	r0, #41392	; 0xa1b0
80027df0:	e3480002 	movt	r0, #32770	; 0x8002
80027df4:	e1a01003 	mov	r1, r3
80027df8:	ebffe6e4 	bl	80021990 <cprintf>
    cprintf ("     r5: 0x%x\n", tf->r5);
80027dfc:	e51b3008 	ldr	r3, [fp, #-8]
80027e00:	e5933024 	ldr	r3, [r3, #36]	; 0x24
80027e04:	e30a01c0 	movw	r0, #41408	; 0xa1c0
80027e08:	e3480002 	movt	r0, #32770	; 0x8002
80027e0c:	e1a01003 	mov	r1, r3
80027e10:	ebffe6de 	bl	80021990 <cprintf>
    cprintf ("     r6: 0x%x\n", tf->r6);
80027e14:	e51b3008 	ldr	r3, [fp, #-8]
80027e18:	e5933028 	ldr	r3, [r3, #40]	; 0x28
80027e1c:	e30a01d0 	movw	r0, #41424	; 0xa1d0
80027e20:	e3480002 	movt	r0, #32770	; 0x8002
80027e24:	e1a01003 	mov	r1, r3
80027e28:	ebffe6d8 	bl	80021990 <cprintf>
    cprintf ("     r7: 0x%x\n", tf->r7);
80027e2c:	e51b3008 	ldr	r3, [fp, #-8]
80027e30:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
80027e34:	e30a01e0 	movw	r0, #41440	; 0xa1e0
80027e38:	e3480002 	movt	r0, #32770	; 0x8002
80027e3c:	e1a01003 	mov	r1, r3
80027e40:	ebffe6d2 	bl	80021990 <cprintf>
    cprintf ("     r8: 0x%x\n", tf->r8);
80027e44:	e51b3008 	ldr	r3, [fp, #-8]
80027e48:	e5933030 	ldr	r3, [r3, #48]	; 0x30
80027e4c:	e30a01f0 	movw	r0, #41456	; 0xa1f0
80027e50:	e3480002 	movt	r0, #32770	; 0x8002
80027e54:	e1a01003 	mov	r1, r3
80027e58:	ebffe6cc 	bl	80021990 <cprintf>
    cprintf ("     r9: 0x%x\n", tf->r9);
80027e5c:	e51b3008 	ldr	r3, [fp, #-8]
80027e60:	e5933034 	ldr	r3, [r3, #52]	; 0x34
80027e64:	e30a0200 	movw	r0, #41472	; 0xa200
80027e68:	e3480002 	movt	r0, #32770	; 0x8002
80027e6c:	e1a01003 	mov	r1, r3
80027e70:	ebffe6c6 	bl	80021990 <cprintf>
    cprintf ("    r10: 0x%x\n", tf->r10);
80027e74:	e51b3008 	ldr	r3, [fp, #-8]
80027e78:	e5933038 	ldr	r3, [r3, #56]	; 0x38
80027e7c:	e30a0210 	movw	r0, #41488	; 0xa210
80027e80:	e3480002 	movt	r0, #32770	; 0x8002
80027e84:	e1a01003 	mov	r1, r3
80027e88:	ebffe6c0 	bl	80021990 <cprintf>
    cprintf ("    r11: 0x%x\n", tf->r11);
80027e8c:	e51b3008 	ldr	r3, [fp, #-8]
80027e90:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
80027e94:	e30a0220 	movw	r0, #41504	; 0xa220
80027e98:	e3480002 	movt	r0, #32770	; 0x8002
80027e9c:	e1a01003 	mov	r1, r3
80027ea0:	ebffe6ba 	bl	80021990 <cprintf>
    cprintf ("    r12: 0x%x\n", tf->r12);
80027ea4:	e51b3008 	ldr	r3, [fp, #-8]
80027ea8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
80027eac:	e30a0230 	movw	r0, #41520	; 0xa230
80027eb0:	e3480002 	movt	r0, #32770	; 0x8002
80027eb4:	e1a01003 	mov	r1, r3
80027eb8:	ebffe6b4 	bl	80021990 <cprintf>
    cprintf ("     pc: 0x%x\n", tf->pc);
80027ebc:	e51b3008 	ldr	r3, [fp, #-8]
80027ec0:	e5933044 	ldr	r3, [r3, #68]	; 0x44
80027ec4:	e30a0240 	movw	r0, #41536	; 0xa240
80027ec8:	e3480002 	movt	r0, #32770	; 0x8002
80027ecc:	e1a01003 	mov	r1, r3
80027ed0:	ebffe6ae 	bl	80021990 <cprintf>
}
80027ed4:	e24bd004 	sub	sp, fp, #4
80027ed8:	e8bd8800 	pop	{fp, pc}

80027edc <v2p>:
// we first map 1MB low memory containing kernel code.
#define INIT_KERNMAP 	0x100000

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
80027edc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80027ee0:	e28db000 	add	fp, sp, #0
80027ee4:	e24dd00c 	sub	sp, sp, #12
80027ee8:	e50b0008 	str	r0, [fp, #-8]
80027eec:	e51b3008 	ldr	r3, [fp, #-8]
80027ef0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
80027ef4:	e1a00003 	mov	r0, r3
80027ef8:	e28bd000 	add	sp, fp, #0
80027efc:	e8bd0800 	pop	{fp}
80027f00:	e12fff1e 	bx	lr

80027f04 <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
80027f04:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80027f08:	e28db000 	add	fp, sp, #0
80027f0c:	e24dd00c 	sub	sp, sp, #12
80027f10:	e50b0008 	str	r0, [fp, #-8]
80027f14:	e51b3008 	ldr	r3, [fp, #-8]
80027f18:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
80027f1c:	e1a00003 	mov	r0, r3
80027f20:	e28bd000 	add	sp, fp, #0
80027f24:	e8bd0800 	pop	{fp}
80027f28:	e12fff1e 	bx	lr

80027f2c <init_vmm>:
    struct spinlock lock;
    struct run *freelist;
} kpt_mem;

void init_vmm (void)
{
80027f2c:	e92d4800 	push	{fp, lr}
80027f30:	e28db004 	add	fp, sp, #4
    initlock(&kpt_mem.lock, "vm");
80027f34:	e3000648 	movw	r0, #1608	; 0x648
80027f38:	e348000b 	movt	r0, #32779	; 0x800b
80027f3c:	e30a1254 	movw	r1, #41556	; 0xa254
80027f40:	e3481002 	movt	r1, #32770	; 0x8002
80027f44:	ebfff83f 	bl	80026048 <initlock>
    kpt_mem.freelist = NULL;
80027f48:	e3003648 	movw	r3, #1608	; 0x648
80027f4c:	e348300b 	movt	r3, #32779	; 0x800b
80027f50:	e3a02000 	mov	r2, #0
80027f54:	e5832034 	str	r2, [r3, #52]	; 0x34
}
80027f58:	e8bd8800 	pop	{fp, pc}

80027f5c <_kpt_free>:

static void _kpt_free (char *v)
{
80027f5c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80027f60:	e28db000 	add	fp, sp, #0
80027f64:	e24dd014 	sub	sp, sp, #20
80027f68:	e50b0010 	str	r0, [fp, #-16]
    struct run *r;

    r = (struct run*) v;
80027f6c:	e51b3010 	ldr	r3, [fp, #-16]
80027f70:	e50b3008 	str	r3, [fp, #-8]
    r->next = kpt_mem.freelist;
80027f74:	e3003648 	movw	r3, #1608	; 0x648
80027f78:	e348300b 	movt	r3, #32779	; 0x800b
80027f7c:	e5932034 	ldr	r2, [r3, #52]	; 0x34
80027f80:	e51b3008 	ldr	r3, [fp, #-8]
80027f84:	e5832000 	str	r2, [r3]
    kpt_mem.freelist = r;
80027f88:	e3003648 	movw	r3, #1608	; 0x648
80027f8c:	e348300b 	movt	r3, #32779	; 0x800b
80027f90:	e51b2008 	ldr	r2, [fp, #-8]
80027f94:	e5832034 	str	r2, [r3, #52]	; 0x34
}
80027f98:	e28bd000 	add	sp, fp, #0
80027f9c:	e8bd0800 	pop	{fp}
80027fa0:	e12fff1e 	bx	lr

80027fa4 <kpt_free>:


static void kpt_free (char *v)
{
80027fa4:	e92d4800 	push	{fp, lr}
80027fa8:	e28db004 	add	fp, sp, #4
80027fac:	e24dd008 	sub	sp, sp, #8
80027fb0:	e50b0008 	str	r0, [fp, #-8]
    if (v >= (char*)P2V(INIT_KERNMAP)) {
80027fb4:	e51b2008 	ldr	r2, [fp, #-8]
80027fb8:	e30f3fff 	movw	r3, #65535	; 0xffff
80027fbc:	e348300f 	movt	r3, #32783	; 0x800f
80027fc0:	e1520003 	cmp	r2, r3
80027fc4:	9a000003 	bls	80027fd8 <kpt_free+0x34>
        kfree(v, PT_ORDER);
80027fc8:	e51b0008 	ldr	r0, [fp, #-8]
80027fcc:	e3a0100a 	mov	r1, #10
80027fd0:	ebffe5a2 	bl	80021660 <kfree>
        return;
80027fd4:	ea000007 	b	80027ff8 <kpt_free+0x54>
    }

    acquire(&kpt_mem.lock);
80027fd8:	e3000648 	movw	r0, #1608	; 0x648
80027fdc:	e348000b 	movt	r0, #32779	; 0x800b
80027fe0:	ebfff829 	bl	8002608c <acquire>
    _kpt_free (v);
80027fe4:	e51b0008 	ldr	r0, [fp, #-8]
80027fe8:	ebffffdb 	bl	80027f5c <_kpt_free>
    release(&kpt_mem.lock);
80027fec:	e3000648 	movw	r0, #1608	; 0x648
80027ff0:	e348000b 	movt	r0, #32779	; 0x800b
80027ff4:	ebfff82e 	bl	800260b4 <release>
}
80027ff8:	e24bd004 	sub	sp, fp, #4
80027ffc:	e8bd8800 	pop	{fp, pc}

80028000 <kpt_freerange>:

// add some memory used for page tables (initialization code)
void kpt_freerange (uint32 low, uint32 hi)
{
80028000:	e92d4800 	push	{fp, lr}
80028004:	e28db004 	add	fp, sp, #4
80028008:	e24dd008 	sub	sp, sp, #8
8002800c:	e50b0008 	str	r0, [fp, #-8]
80028010:	e50b100c 	str	r1, [fp, #-12]
    while (low < hi) {
80028014:	ea000005 	b	80028030 <kpt_freerange+0x30>
        _kpt_free ((char*)low);
80028018:	e51b3008 	ldr	r3, [fp, #-8]
8002801c:	e1a00003 	mov	r0, r3
80028020:	ebffffcd 	bl	80027f5c <_kpt_free>
        low += PT_SZ;
80028024:	e51b3008 	ldr	r3, [fp, #-8]
80028028:	e2833b01 	add	r3, r3, #1024	; 0x400
8002802c:	e50b3008 	str	r3, [fp, #-8]
}

// add some memory used for page tables (initialization code)
void kpt_freerange (uint32 low, uint32 hi)
{
    while (low < hi) {
80028030:	e51b2008 	ldr	r2, [fp, #-8]
80028034:	e51b300c 	ldr	r3, [fp, #-12]
80028038:	e1520003 	cmp	r2, r3
8002803c:	3afffff5 	bcc	80028018 <kpt_freerange+0x18>
        _kpt_free ((char*)low);
        low += PT_SZ;
    }
}
80028040:	e24bd004 	sub	sp, fp, #4
80028044:	e8bd8800 	pop	{fp, pc}

80028048 <kpt_alloc>:

void* kpt_alloc (void)
{
80028048:	e92d4800 	push	{fp, lr}
8002804c:	e28db004 	add	fp, sp, #4
80028050:	e24dd008 	sub	sp, sp, #8
    struct run *r;

    acquire(&kpt_mem.lock);
80028054:	e3000648 	movw	r0, #1608	; 0x648
80028058:	e348000b 	movt	r0, #32779	; 0x800b
8002805c:	ebfff80a 	bl	8002608c <acquire>

    if ((r = kpt_mem.freelist) != NULL ) {
80028060:	e3003648 	movw	r3, #1608	; 0x648
80028064:	e348300b 	movt	r3, #32779	; 0x800b
80028068:	e5933034 	ldr	r3, [r3, #52]	; 0x34
8002806c:	e50b3008 	str	r3, [fp, #-8]
80028070:	e51b3008 	ldr	r3, [fp, #-8]
80028074:	e3530000 	cmp	r3, #0
80028078:	0a000004 	beq	80028090 <kpt_alloc+0x48>
        kpt_mem.freelist = r->next;
8002807c:	e51b3008 	ldr	r3, [fp, #-8]
80028080:	e5932000 	ldr	r2, [r3]
80028084:	e3003648 	movw	r3, #1608	; 0x648
80028088:	e348300b 	movt	r3, #32779	; 0x800b
8002808c:	e5832034 	str	r2, [r3, #52]	; 0x34
    }

    release(&kpt_mem.lock);
80028090:	e3000648 	movw	r0, #1608	; 0x648
80028094:	e348000b 	movt	r0, #32779	; 0x800b
80028098:	ebfff805 	bl	800260b4 <release>

    // Allocate a PT page if no inital pages is available
    if ((r == NULL) && ((r = kmalloc (PT_ORDER)) == NULL)) {
8002809c:	e51b3008 	ldr	r3, [fp, #-8]
800280a0:	e3530000 	cmp	r3, #0
800280a4:	1a000008 	bne	800280cc <kpt_alloc+0x84>
800280a8:	e3a0000a 	mov	r0, #10
800280ac:	ebffe515 	bl	80021508 <kmalloc>
800280b0:	e50b0008 	str	r0, [fp, #-8]
800280b4:	e51b3008 	ldr	r3, [fp, #-8]
800280b8:	e3530000 	cmp	r3, #0
800280bc:	1a000002 	bne	800280cc <kpt_alloc+0x84>
        panic("oom: kpt_alloc");
800280c0:	e30a0258 	movw	r0, #41560	; 0xa258
800280c4:	e3480002 	movt	r0, #32770	; 0x8002
800280c8:	ebffe6bb 	bl	80021bbc <panic>
    }

    memset(r, 0, PT_SZ);
800280cc:	e51b0008 	ldr	r0, [fp, #-8]
800280d0:	e3a01000 	mov	r1, #0
800280d4:	e3a02b01 	mov	r2, #1024	; 0x400
800280d8:	ebffdfc8 	bl	80020000 <memset>
    return (char*) r;
800280dc:	e51b3008 	ldr	r3, [fp, #-8]
}
800280e0:	e1a00003 	mov	r0, r3
800280e4:	e24bd004 	sub	sp, fp, #4
800280e8:	e8bd8800 	pop	{fp, pc}

800280ec <walkpgdir>:

// Return the address of the PTE in page directory that corresponds to
// virtual address va.  If alloc!=0, create any required page table pages.
static pte_t* walkpgdir (pde_t *pgdir, const void *va, int alloc)
{
800280ec:	e92d4800 	push	{fp, lr}
800280f0:	e28db004 	add	fp, sp, #4
800280f4:	e24dd018 	sub	sp, sp, #24
800280f8:	e50b0010 	str	r0, [fp, #-16]
800280fc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
80028100:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    pde_t *pde;
    pte_t *pgtab;

    // pgdir points to the page directory, get the page direcotry entry (pde)
    pde = &pgdir[PDE_IDX(va)];
80028104:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028108:	e1a03a23 	lsr	r3, r3, #20
8002810c:	e1a03103 	lsl	r3, r3, #2
80028110:	e51b2010 	ldr	r2, [fp, #-16]
80028114:	e0823003 	add	r3, r2, r3
80028118:	e50b300c 	str	r3, [fp, #-12]

    if (*pde & PE_TYPES) {
8002811c:	e51b300c 	ldr	r3, [fp, #-12]
80028120:	e5933000 	ldr	r3, [r3]
80028124:	e2033003 	and	r3, r3, #3
80028128:	e3530000 	cmp	r3, #0
8002812c:	0a000007 	beq	80028150 <walkpgdir+0x64>
        pgtab = (pte_t*) p2v(PT_ADDR(*pde));
80028130:	e51b300c 	ldr	r3, [fp, #-12]
80028134:	e5933000 	ldr	r3, [r3]
80028138:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
8002813c:	e3c33003 	bic	r3, r3, #3
80028140:	e1a00003 	mov	r0, r3
80028144:	ebffff6e 	bl	80027f04 <p2v>
80028148:	e50b0008 	str	r0, [fp, #-8]
8002814c:	ea000013 	b	800281a0 <walkpgdir+0xb4>

    } else {
        if (!alloc || (pgtab = (pte_t*) kpt_alloc()) == 0) {
80028150:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80028154:	e3530000 	cmp	r3, #0
80028158:	0a000004 	beq	80028170 <walkpgdir+0x84>
8002815c:	ebffffb9 	bl	80028048 <kpt_alloc>
80028160:	e50b0008 	str	r0, [fp, #-8]
80028164:	e51b3008 	ldr	r3, [fp, #-8]
80028168:	e3530000 	cmp	r3, #0
8002816c:	1a000001 	bne	80028178 <walkpgdir+0x8c>
            return 0;
80028170:	e3a03000 	mov	r3, #0
80028174:	ea00000f 	b	800281b8 <walkpgdir+0xcc>
        }

        // Make sure all those PTE_P bits are zero.
        memset(pgtab, 0, PT_SZ);
80028178:	e51b0008 	ldr	r0, [fp, #-8]
8002817c:	e3a01000 	mov	r1, #0
80028180:	e3a02b01 	mov	r2, #1024	; 0x400
80028184:	ebffdf9d 	bl	80020000 <memset>

        // The permissions here are overly generous, but they can
        // be further restricted by the permissions in the page table
        // entries, if necessary.
        *pde = v2p(pgtab) | UPDE_TYPE;
80028188:	e51b0008 	ldr	r0, [fp, #-8]
8002818c:	ebffff52 	bl	80027edc <v2p>
80028190:	e1a03000 	mov	r3, r0
80028194:	e3832001 	orr	r2, r3, #1
80028198:	e51b300c 	ldr	r3, [fp, #-12]
8002819c:	e5832000 	str	r2, [r3]
    }

    return &pgtab[PTE_IDX(va)];
800281a0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
800281a4:	e1a03623 	lsr	r3, r3, #12
800281a8:	e6ef3073 	uxtb	r3, r3
800281ac:	e1a03103 	lsl	r3, r3, #2
800281b0:	e51b2008 	ldr	r2, [fp, #-8]
800281b4:	e0823003 	add	r3, r2, r3
}
800281b8:	e1a00003 	mov	r0, r3
800281bc:	e24bd004 	sub	sp, fp, #4
800281c0:	e8bd8800 	pop	{fp, pc}

800281c4 <mappages>:

// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int mappages (pde_t *pgdir, void *va, uint size, uint pa, int ap)
{
800281c4:	e92d4800 	push	{fp, lr}
800281c8:	e28db004 	add	fp, sp, #4
800281cc:	e24dd020 	sub	sp, sp, #32
800281d0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
800281d4:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
800281d8:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
800281dc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    char *a, *last;
    pte_t *pte;

    a = (char*) align_dn(va, PTE_SZ);
800281e0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
800281e4:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
800281e8:	e3c3300f 	bic	r3, r3, #15
800281ec:	e50b3008 	str	r3, [fp, #-8]
    last = (char*) align_dn((uint)va + size - 1, PTE_SZ);
800281f0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
800281f4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800281f8:	e0823003 	add	r3, r2, r3
800281fc:	e2433001 	sub	r3, r3, #1
80028200:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
80028204:	e3c3300f 	bic	r3, r3, #15
80028208:	e50b300c 	str	r3, [fp, #-12]

    for (;;) {
        if ((pte = walkpgdir(pgdir, a, 1)) == 0) {
8002820c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80028210:	e51b1008 	ldr	r1, [fp, #-8]
80028214:	e3a02001 	mov	r2, #1
80028218:	ebffffb3 	bl	800280ec <walkpgdir>
8002821c:	e50b0010 	str	r0, [fp, #-16]
80028220:	e51b3010 	ldr	r3, [fp, #-16]
80028224:	e3530000 	cmp	r3, #0
80028228:	1a000001 	bne	80028234 <mappages+0x70>
            return -1;
8002822c:	e3e03000 	mvn	r3, #0
80028230:	ea00001d 	b	800282ac <mappages+0xe8>
        }

        if (*pte & PE_TYPES) {
80028234:	e51b3010 	ldr	r3, [fp, #-16]
80028238:	e5933000 	ldr	r3, [r3]
8002823c:	e2033003 	and	r3, r3, #3
80028240:	e3530000 	cmp	r3, #0
80028244:	0a000002 	beq	80028254 <mappages+0x90>
            panic("remap");
80028248:	e30a0268 	movw	r0, #41576	; 0xa268
8002824c:	e3480002 	movt	r0, #32770	; 0x8002
80028250:	ebffe659 	bl	80021bbc <panic>
        }

        *pte = pa | ((ap & 0x3) << 4) | PE_CACHE | PE_BUF | PTE_TYPE;
80028254:	e59b3004 	ldr	r3, [fp, #4]
80028258:	e2033003 	and	r3, r3, #3
8002825c:	e1a03203 	lsl	r3, r3, #4
80028260:	e1a02003 	mov	r2, r3
80028264:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028268:	e1823003 	orr	r3, r2, r3
8002826c:	e383200e 	orr	r2, r3, #14
80028270:	e51b3010 	ldr	r3, [fp, #-16]
80028274:	e5832000 	str	r2, [r3]

        if (a == last) {
80028278:	e51b2008 	ldr	r2, [fp, #-8]
8002827c:	e51b300c 	ldr	r3, [fp, #-12]
80028280:	e1520003 	cmp	r2, r3
80028284:	0a000006 	beq	800282a4 <mappages+0xe0>
            break;
        }

        a += PTE_SZ;
80028288:	e51b3008 	ldr	r3, [fp, #-8]
8002828c:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028290:	e50b3008 	str	r3, [fp, #-8]
        pa += PTE_SZ;
80028294:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028298:	e2833a01 	add	r3, r3, #4096	; 0x1000
8002829c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    }
800282a0:	eaffffd9 	b	8002820c <mappages+0x48>
        }

        *pte = pa | ((ap & 0x3) << 4) | PE_CACHE | PE_BUF | PTE_TYPE;

        if (a == last) {
            break;
800282a4:	e1a00000 	nop			; (mov r0, r0)

        a += PTE_SZ;
        pa += PTE_SZ;
    }

    return 0;
800282a8:	e3a03000 	mov	r3, #0
}
800282ac:	e1a00003 	mov	r0, r3
800282b0:	e24bd004 	sub	sp, fp, #4
800282b4:	e8bd8800 	pop	{fp, pc}

800282b8 <flush_tlb>:

// flush all TLB
static void flush_tlb (void)
{
800282b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
800282bc:	e28db000 	add	fp, sp, #0
800282c0:	e24dd00c 	sub	sp, sp, #12
    uint val = 0;
800282c4:	e3a03000 	mov	r3, #0
800282c8:	e50b3008 	str	r3, [fp, #-8]
    asm("MCR p15, 0, %[r], c8, c7, 0" : :[r]"r" (val):);
800282cc:	e51b3008 	ldr	r3, [fp, #-8]
800282d0:	ee083f17 	mcr	15, 0, r3, cr8, cr7, {0}

    // invalid entire data and instruction cache
    asm ("MCR p15,0,%[r],c7,c10,0": :[r]"r" (val):);
800282d4:	e51b3008 	ldr	r3, [fp, #-8]
800282d8:	ee073f1a 	mcr	15, 0, r3, cr7, cr10, {0}
    asm ("MCR p15,0,%[r],c7,c11,0": :[r]"r" (val):);
800282dc:	e51b3008 	ldr	r3, [fp, #-8]
800282e0:	ee073f1b 	mcr	15, 0, r3, cr7, cr11, {0}
}
800282e4:	e28bd000 	add	sp, fp, #0
800282e8:	e8bd0800 	pop	{fp}
800282ec:	e12fff1e 	bx	lr

800282f0 <switchuvm>:

// Switch to the user page table (TTBR0)
void switchuvm (struct proc *p)
{
800282f0:	e92d4800 	push	{fp, lr}
800282f4:	e28db004 	add	fp, sp, #4
800282f8:	e24dd010 	sub	sp, sp, #16
800282fc:	e50b0010 	str	r0, [fp, #-16]
    uint val;

    pushcli();
80028300:	ebffe0f2 	bl	800206d0 <pushcli>

    if (p->pgdir == 0) {
80028304:	e51b3010 	ldr	r3, [fp, #-16]
80028308:	e5933004 	ldr	r3, [r3, #4]
8002830c:	e3530000 	cmp	r3, #0
80028310:	1a000002 	bne	80028320 <switchuvm+0x30>
        panic("switchuvm: no pgdir");
80028314:	e30a0270 	movw	r0, #41584	; 0xa270
80028318:	e3480002 	movt	r0, #32770	; 0x8002
8002831c:	ebffe626 	bl	80021bbc <panic>
/*
    cprintf("%s: dumping switch-to pgdir\n", __func__);
    dump_pgdir(p->pgdir, 4);
*/

    val = (uint) V2P(p->pgdir) | 0x00;
80028320:	e51b3010 	ldr	r3, [fp, #-16]
80028324:	e5933004 	ldr	r3, [r3, #4]
80028328:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
8002832c:	e50b3008 	str	r3, [fp, #-8]

    asm("MCR p15, 0, %[v], c2, c0, 0": :[v]"r" (val):);
80028330:	e51b3008 	ldr	r3, [fp, #-8]
80028334:	ee023f10 	mcr	15, 0, r3, cr2, cr0, {0}
    flush_tlb();
80028338:	ebffffde 	bl	800282b8 <flush_tlb>

    popcli();
8002833c:	ebffe0fc 	bl	80020734 <popcli>
}
80028340:	e24bd004 	sub	sp, fp, #4
80028344:	e8bd8800 	pop	{fp, pc}

80028348 <inituvm>:

// Load the initcode into address 0 of pgdir. sz must be less than a page.
void inituvm (pde_t *pgdir, char *init, uint sz)
{
80028348:	e92d4800 	push	{fp, lr}
8002834c:	e28db004 	add	fp, sp, #4
80028350:	e24dd020 	sub	sp, sp, #32
80028354:	e50b0010 	str	r0, [fp, #-16]
80028358:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
8002835c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    char *mem;

    if (sz >= PTE_SZ) {
80028360:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
80028364:	e3003fff 	movw	r3, #4095	; 0xfff
80028368:	e1520003 	cmp	r2, r3
8002836c:	9a000002 	bls	8002837c <inituvm+0x34>
        panic("inituvm: more than a page");
80028370:	e30a0284 	movw	r0, #41604	; 0xa284
80028374:	e3480002 	movt	r0, #32770	; 0x8002
80028378:	ebffe60f 	bl	80021bbc <panic>
    }

    mem = alloc_page();
8002837c:	ebffe4e2 	bl	8002170c <alloc_page>
80028380:	e50b0008 	str	r0, [fp, #-8]
    cprintf("[xzl] %s: get a page %x\n", __func__, (unsigned long)mem);
80028384:	e51b3008 	ldr	r3, [fp, #-8]
80028388:	e30a02a0 	movw	r0, #41632	; 0xa2a0
8002838c:	e3480002 	movt	r0, #32770	; 0x8002
80028390:	e30a1408 	movw	r1, #41992	; 0xa408
80028394:	e3481002 	movt	r1, #32770	; 0x8002
80028398:	e1a02003 	mov	r2, r3
8002839c:	ebffe57b 	bl	80021990 <cprintf>

    memset(mem, 0, PTE_SZ);
800283a0:	e51b0008 	ldr	r0, [fp, #-8]
800283a4:	e3a01000 	mov	r1, #0
800283a8:	e3a02a01 	mov	r2, #4096	; 0x1000
800283ac:	ebffdf13 	bl	80020000 <memset>
    mappages(pgdir, 0, PTE_SZ, v2p(mem), AP_KU);
800283b0:	e51b0008 	ldr	r0, [fp, #-8]
800283b4:	ebfffec8 	bl	80027edc <v2p>
800283b8:	e1a03000 	mov	r3, r0
800283bc:	e3a02003 	mov	r2, #3
800283c0:	e58d2000 	str	r2, [sp]
800283c4:	e51b0010 	ldr	r0, [fp, #-16]
800283c8:	e3a01000 	mov	r1, #0
800283cc:	e3a02a01 	mov	r2, #4096	; 0x1000
800283d0:	ebffff7b 	bl	800281c4 <mappages>
    memmove(mem, init, sz);
800283d4:	e51b0008 	ldr	r0, [fp, #-8]
800283d8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
800283dc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
800283e0:	ebffdf7c 	bl	800201d8 <memmove>
}
800283e4:	e24bd004 	sub	sp, fp, #4
800283e8:	e8bd8800 	pop	{fp, pc}

800283ec <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int loaduvm (pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
800283ec:	e92d4800 	push	{fp, lr}
800283f0:	e28db004 	add	fp, sp, #4
800283f4:	e24dd020 	sub	sp, sp, #32
800283f8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
800283fc:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
80028400:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
80028404:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    uint i, pa, n;
    pte_t *pte;

    if ((uint) addr % PTE_SZ != 0) {
80028408:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
8002840c:	e1a03a03 	lsl	r3, r3, #20
80028410:	e1a03a23 	lsr	r3, r3, #20
80028414:	e3530000 	cmp	r3, #0
80028418:	0a000002 	beq	80028428 <loaduvm+0x3c>
        panic("loaduvm: addr must be page aligned");
8002841c:	e30a02bc 	movw	r0, #41660	; 0xa2bc
80028420:	e3480002 	movt	r0, #32770	; 0x8002
80028424:	ebffe5e4 	bl	80021bbc <panic>
    }

    for (i = 0; i < sz; i += PTE_SZ) {
80028428:	e3a03000 	mov	r3, #0
8002842c:	e50b3008 	str	r3, [fp, #-8]
80028430:	ea000034 	b	80028508 <loaduvm+0x11c>
        if ((pte = walkpgdir(pgdir, addr + i, 0)) == 0) {
80028434:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
80028438:	e51b3008 	ldr	r3, [fp, #-8]
8002843c:	e0823003 	add	r3, r2, r3
80028440:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80028444:	e1a01003 	mov	r1, r3
80028448:	e3a02000 	mov	r2, #0
8002844c:	ebffff26 	bl	800280ec <walkpgdir>
80028450:	e50b0010 	str	r0, [fp, #-16]
80028454:	e51b3010 	ldr	r3, [fp, #-16]
80028458:	e3530000 	cmp	r3, #0
8002845c:	1a000002 	bne	8002846c <loaduvm+0x80>
            panic("loaduvm: address should exist");
80028460:	e30a02e0 	movw	r0, #41696	; 0xa2e0
80028464:	e3480002 	movt	r0, #32770	; 0x8002
80028468:	ebffe5d3 	bl	80021bbc <panic>
        }

        pa = PTE_ADDR(*pte);
8002846c:	e51b3010 	ldr	r3, [fp, #-16]
80028470:	e5933000 	ldr	r3, [r3]
80028474:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
80028478:	e3c3300f 	bic	r3, r3, #15
8002847c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

        if (sz - i < PTE_SZ) {
80028480:	e59b2004 	ldr	r2, [fp, #4]
80028484:	e51b3008 	ldr	r3, [fp, #-8]
80028488:	e0632002 	rsb	r2, r3, r2
8002848c:	e3003fff 	movw	r3, #4095	; 0xfff
80028490:	e1520003 	cmp	r2, r3
80028494:	8a000004 	bhi	800284ac <loaduvm+0xc0>
            n = sz - i;
80028498:	e59b2004 	ldr	r2, [fp, #4]
8002849c:	e51b3008 	ldr	r3, [fp, #-8]
800284a0:	e0633002 	rsb	r3, r3, r2
800284a4:	e50b300c 	str	r3, [fp, #-12]
800284a8:	ea000001 	b	800284b4 <loaduvm+0xc8>
        } else {
            n = PTE_SZ;
800284ac:	e3a03a01 	mov	r3, #4096	; 0x1000
800284b0:	e50b300c 	str	r3, [fp, #-12]
        }

        if (readi(ip, p2v(pa), offset + i, n) != n) {
800284b4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800284b8:	ebfffe91 	bl	80027f04 <p2v>
800284bc:	e1a02000 	mov	r2, r0
800284c0:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
800284c4:	e51b3008 	ldr	r3, [fp, #-8]
800284c8:	e0813003 	add	r3, r1, r3
800284cc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
800284d0:	e1a01002 	mov	r1, r2
800284d4:	e1a02003 	mov	r2, r3
800284d8:	e51b300c 	ldr	r3, [fp, #-12]
800284dc:	ebffed57 	bl	80023a40 <readi>
800284e0:	e1a03000 	mov	r3, r0
800284e4:	e1a02003 	mov	r2, r3
800284e8:	e51b300c 	ldr	r3, [fp, #-12]
800284ec:	e1520003 	cmp	r2, r3
800284f0:	0a000001 	beq	800284fc <loaduvm+0x110>
            return -1;
800284f4:	e3e03000 	mvn	r3, #0
800284f8:	ea000007 	b	8002851c <loaduvm+0x130>

    if ((uint) addr % PTE_SZ != 0) {
        panic("loaduvm: addr must be page aligned");
    }

    for (i = 0; i < sz; i += PTE_SZ) {
800284fc:	e51b3008 	ldr	r3, [fp, #-8]
80028500:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028504:	e50b3008 	str	r3, [fp, #-8]
80028508:	e51b2008 	ldr	r2, [fp, #-8]
8002850c:	e59b3004 	ldr	r3, [fp, #4]
80028510:	e1520003 	cmp	r2, r3
80028514:	3affffc6 	bcc	80028434 <loaduvm+0x48>
        if (readi(ip, p2v(pa), offset + i, n) != n) {
            return -1;
        }
    }

    return 0;
80028518:	e3a03000 	mov	r3, #0
}
8002851c:	e1a00003 	mov	r0, r3
80028520:	e24bd004 	sub	sp, fp, #4
80028524:	e8bd8800 	pop	{fp, pc}

80028528 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int allocuvm (pde_t *pgdir, uint oldsz, uint newsz)
{
80028528:	e92d4810 	push	{r4, fp, lr}
8002852c:	e28db008 	add	fp, sp, #8
80028530:	e24dd024 	sub	sp, sp, #36	; 0x24
80028534:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
80028538:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
8002853c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    char *mem;
    uint a;

    if (newsz >= UADDR_SZ) {
80028540:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80028544:	e373021f 	cmn	r3, #-268435455	; 0xf0000001
80028548:	9a000001 	bls	80028554 <allocuvm+0x2c>
        return 0;
8002854c:	e3a03000 	mov	r3, #0
80028550:	ea000030 	b	80028618 <allocuvm+0xf0>
    }

    if (newsz < oldsz) {
80028554:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80028558:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
8002855c:	e1520003 	cmp	r2, r3
80028560:	2a000001 	bcs	8002856c <allocuvm+0x44>
        return oldsz;
80028564:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028568:	ea00002a 	b	80028618 <allocuvm+0xf0>
    }

    a = align_up(oldsz, PTE_SZ);
8002856c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028570:	e2833eff 	add	r3, r3, #4080	; 0xff0
80028574:	e283300f 	add	r3, r3, #15
80028578:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
8002857c:	e3c3300f 	bic	r3, r3, #15
80028580:	e50b3010 	str	r3, [fp, #-16]

    for (; a < newsz; a += PTE_SZ) {
80028584:	ea00001e 	b	80028604 <allocuvm+0xdc>
        mem = alloc_page();
80028588:	ebffe45f 	bl	8002170c <alloc_page>
8002858c:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec

        if (mem == 0) {
80028590:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028594:	e3530000 	cmp	r3, #0
80028598:	1a000008 	bne	800285c0 <allocuvm+0x98>
            cprintf("allocuvm out of memory\n");
8002859c:	e30a0300 	movw	r0, #41728	; 0xa300
800285a0:	e3480002 	movt	r0, #32770	; 0x8002
800285a4:	ebffe4f9 	bl	80021990 <cprintf>
            deallocuvm(pgdir, newsz, oldsz);
800285a8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
800285ac:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
800285b0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
800285b4:	eb00001a 	bl	80028624 <deallocuvm>
            return 0;
800285b8:	e3a03000 	mov	r3, #0
800285bc:	ea000015 	b	80028618 <allocuvm+0xf0>
        }

        memset(mem, 0, PTE_SZ);
800285c0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800285c4:	e3a01000 	mov	r1, #0
800285c8:	e3a02a01 	mov	r2, #4096	; 0x1000
800285cc:	ebffde8b 	bl	80020000 <memset>
        mappages(pgdir, (char*) a, PTE_SZ, v2p(mem), AP_KU);
800285d0:	e51b4010 	ldr	r4, [fp, #-16]
800285d4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800285d8:	ebfffe3f 	bl	80027edc <v2p>
800285dc:	e1a03000 	mov	r3, r0
800285e0:	e3a02003 	mov	r2, #3
800285e4:	e58d2000 	str	r2, [sp]
800285e8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
800285ec:	e1a01004 	mov	r1, r4
800285f0:	e3a02a01 	mov	r2, #4096	; 0x1000
800285f4:	ebfffef2 	bl	800281c4 <mappages>
        return oldsz;
    }

    a = align_up(oldsz, PTE_SZ);

    for (; a < newsz; a += PTE_SZ) {
800285f8:	e51b3010 	ldr	r3, [fp, #-16]
800285fc:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028600:	e50b3010 	str	r3, [fp, #-16]
80028604:	e51b2010 	ldr	r2, [fp, #-16]
80028608:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002860c:	e1520003 	cmp	r2, r3
80028610:	3affffdc 	bcc	80028588 <allocuvm+0x60>

        memset(mem, 0, PTE_SZ);
        mappages(pgdir, (char*) a, PTE_SZ, v2p(mem), AP_KU);
    }

    return newsz;
80028614:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
80028618:	e1a00003 	mov	r0, r3
8002861c:	e24bd008 	sub	sp, fp, #8
80028620:	e8bd8810 	pop	{r4, fp, pc}

80028624 <deallocuvm>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int deallocuvm (pde_t *pgdir, uint oldsz, uint newsz)
{
80028624:	e92d4800 	push	{fp, lr}
80028628:	e28db004 	add	fp, sp, #4
8002862c:	e24dd020 	sub	sp, sp, #32
80028630:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
80028634:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
80028638:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    pte_t *pte;
    uint a;
    uint pa;

    if (newsz >= oldsz) {
8002863c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80028640:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028644:	e1520003 	cmp	r2, r3
80028648:	3a000001 	bcc	80028654 <deallocuvm+0x30>
        return oldsz;
8002864c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028650:	ea000036 	b	80028730 <deallocuvm+0x10c>
    }

    for (a = align_up(newsz, PTE_SZ); a < oldsz; a += PTE_SZ) {
80028654:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80028658:	e2833eff 	add	r3, r3, #4080	; 0xff0
8002865c:	e283300f 	add	r3, r3, #15
80028660:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
80028664:	e3c3300f 	bic	r3, r3, #15
80028668:	e50b3008 	str	r3, [fp, #-8]
8002866c:	ea00002a 	b	8002871c <deallocuvm+0xf8>
        pte = walkpgdir(pgdir, (char*) a, 0);
80028670:	e51b3008 	ldr	r3, [fp, #-8]
80028674:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80028678:	e1a01003 	mov	r1, r3
8002867c:	e3a02000 	mov	r2, #0
80028680:	ebfffe99 	bl	800280ec <walkpgdir>
80028684:	e50b000c 	str	r0, [fp, #-12]

        if (!pte) {
80028688:	e51b300c 	ldr	r3, [fp, #-12]
8002868c:	e3530000 	cmp	r3, #0
80028690:	1a000006 	bne	800286b0 <deallocuvm+0x8c>
            // pte == 0 --> no page table for this entry
            // round it up to the next page directory
            a = align_up (a, PDE_SZ);
80028694:	e51b3008 	ldr	r3, [fp, #-8]
80028698:	e243337f 	sub	r3, r3, #-67108863	; 0xfc000001
8002869c:	e243363f 	sub	r3, r3, #66060288	; 0x3f00000
800286a0:	e1a03a23 	lsr	r3, r3, #20
800286a4:	e1a03a03 	lsl	r3, r3, #20
800286a8:	e50b3008 	str	r3, [fp, #-8]
800286ac:	ea000017 	b	80028710 <deallocuvm+0xec>

        } else if ((*pte & PE_TYPES) != 0) {
800286b0:	e51b300c 	ldr	r3, [fp, #-12]
800286b4:	e5933000 	ldr	r3, [r3]
800286b8:	e2033003 	and	r3, r3, #3
800286bc:	e3530000 	cmp	r3, #0
800286c0:	0a000012 	beq	80028710 <deallocuvm+0xec>
            pa = PTE_ADDR(*pte);
800286c4:	e51b300c 	ldr	r3, [fp, #-12]
800286c8:	e5933000 	ldr	r3, [r3]
800286cc:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
800286d0:	e3c3300f 	bic	r3, r3, #15
800286d4:	e50b3010 	str	r3, [fp, #-16]

            if (pa == 0) {
800286d8:	e51b3010 	ldr	r3, [fp, #-16]
800286dc:	e3530000 	cmp	r3, #0
800286e0:	1a000002 	bne	800286f0 <deallocuvm+0xcc>
                panic("deallocuvm");
800286e4:	e30a0318 	movw	r0, #41752	; 0xa318
800286e8:	e3480002 	movt	r0, #32770	; 0x8002
800286ec:	ebffe532 	bl	80021bbc <panic>
            }

            free_page(p2v(pa));
800286f0:	e51b0010 	ldr	r0, [fp, #-16]
800286f4:	ebfffe02 	bl	80027f04 <p2v>
800286f8:	e1a03000 	mov	r3, r0
800286fc:	e1a00003 	mov	r0, r3
80028700:	ebffe3f8 	bl	800216e8 <free_page>
            *pte = 0;
80028704:	e51b300c 	ldr	r3, [fp, #-12]
80028708:	e3a02000 	mov	r2, #0
8002870c:	e5832000 	str	r2, [r3]

    if (newsz >= oldsz) {
        return oldsz;
    }

    for (a = align_up(newsz, PTE_SZ); a < oldsz; a += PTE_SZ) {
80028710:	e51b3008 	ldr	r3, [fp, #-8]
80028714:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028718:	e50b3008 	str	r3, [fp, #-8]
8002871c:	e51b2008 	ldr	r2, [fp, #-8]
80028720:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028724:	e1520003 	cmp	r2, r3
80028728:	3affffd0 	bcc	80028670 <deallocuvm+0x4c>
            free_page(p2v(pa));
            *pte = 0;
        }
    }

    return newsz;
8002872c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
80028730:	e1a00003 	mov	r0, r3
80028734:	e24bd004 	sub	sp, fp, #4
80028738:	e8bd8800 	pop	{fp, pc}

8002873c <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void freevm (pde_t *pgdir)
{
8002873c:	e92d4800 	push	{fp, lr}
80028740:	e28db004 	add	fp, sp, #4
80028744:	e24dd010 	sub	sp, sp, #16
80028748:	e50b0010 	str	r0, [fp, #-16]
    uint i;
    char *v;

    if (pgdir == 0) {
8002874c:	e51b3010 	ldr	r3, [fp, #-16]
80028750:	e3530000 	cmp	r3, #0
80028754:	1a000002 	bne	80028764 <freevm+0x28>
        panic("freevm: no pgdir");
80028758:	e30a0324 	movw	r0, #41764	; 0xa324
8002875c:	e3480002 	movt	r0, #32770	; 0x8002
80028760:	ebffe515 	bl	80021bbc <panic>
    }

    // release the user space memroy, but not page tables
    deallocuvm(pgdir, UADDR_SZ, 0);
80028764:	e51b0010 	ldr	r0, [fp, #-16]
80028768:	e3a01201 	mov	r1, #268435456	; 0x10000000
8002876c:	e3a02000 	mov	r2, #0
80028770:	ebffffab 	bl	80028624 <deallocuvm>

    // release the page tables
    for (i = 0; i < NUM_UPDE; i++) {
80028774:	e3a03000 	mov	r3, #0
80028778:	e50b3008 	str	r3, [fp, #-8]
8002877c:	ea000016 	b	800287dc <freevm+0xa0>
        if (pgdir[i] & PE_TYPES) {
80028780:	e51b3008 	ldr	r3, [fp, #-8]
80028784:	e1a03103 	lsl	r3, r3, #2
80028788:	e51b2010 	ldr	r2, [fp, #-16]
8002878c:	e0823003 	add	r3, r2, r3
80028790:	e5933000 	ldr	r3, [r3]
80028794:	e2033003 	and	r3, r3, #3
80028798:	e3530000 	cmp	r3, #0
8002879c:	0a00000b 	beq	800287d0 <freevm+0x94>
            v = p2v(PT_ADDR(pgdir[i]));
800287a0:	e51b3008 	ldr	r3, [fp, #-8]
800287a4:	e1a03103 	lsl	r3, r3, #2
800287a8:	e51b2010 	ldr	r2, [fp, #-16]
800287ac:	e0823003 	add	r3, r2, r3
800287b0:	e5933000 	ldr	r3, [r3]
800287b4:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
800287b8:	e3c33003 	bic	r3, r3, #3
800287bc:	e1a00003 	mov	r0, r3
800287c0:	ebfffdcf 	bl	80027f04 <p2v>
800287c4:	e50b000c 	str	r0, [fp, #-12]
            kpt_free(v);
800287c8:	e51b000c 	ldr	r0, [fp, #-12]
800287cc:	ebfffdf4 	bl	80027fa4 <kpt_free>

    // release the user space memroy, but not page tables
    deallocuvm(pgdir, UADDR_SZ, 0);

    // release the page tables
    for (i = 0; i < NUM_UPDE; i++) {
800287d0:	e51b3008 	ldr	r3, [fp, #-8]
800287d4:	e2833001 	add	r3, r3, #1
800287d8:	e50b3008 	str	r3, [fp, #-8]
800287dc:	e51b3008 	ldr	r3, [fp, #-8]
800287e0:	e35300ff 	cmp	r3, #255	; 0xff
800287e4:	9affffe5 	bls	80028780 <freevm+0x44>
            v = p2v(PT_ADDR(pgdir[i]));
            kpt_free(v);
        }
    }

    kpt_free((char*) pgdir);
800287e8:	e51b0010 	ldr	r0, [fp, #-16]
800287ec:	ebfffdec 	bl	80027fa4 <kpt_free>
}
800287f0:	e24bd004 	sub	sp, fp, #4
800287f4:	e8bd8800 	pop	{fp, pc}

800287f8 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible page beneath
// the user stack (to trap stack underflow).
void clearpteu (pde_t *pgdir, char *uva)
{
800287f8:	e92d4800 	push	{fp, lr}
800287fc:	e28db004 	add	fp, sp, #4
80028800:	e24dd010 	sub	sp, sp, #16
80028804:	e50b0010 	str	r0, [fp, #-16]
80028808:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    pte_t *pte;

    pte = walkpgdir(pgdir, uva, 0);
8002880c:	e51b0010 	ldr	r0, [fp, #-16]
80028810:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
80028814:	e3a02000 	mov	r2, #0
80028818:	ebfffe33 	bl	800280ec <walkpgdir>
8002881c:	e50b0008 	str	r0, [fp, #-8]
    if (pte == 0) {
80028820:	e51b3008 	ldr	r3, [fp, #-8]
80028824:	e3530000 	cmp	r3, #0
80028828:	1a000002 	bne	80028838 <clearpteu+0x40>
        panic("clearpteu");
8002882c:	e30a0338 	movw	r0, #41784	; 0xa338
80028830:	e3480002 	movt	r0, #32770	; 0x8002
80028834:	ebffe4e0 	bl	80021bbc <panic>
    }

    // in ARM, we change the AP field (ap & 0x3) << 4)
    *pte = (*pte & ~(0x03 << 4)) | AP_KO << 4;
80028838:	e51b3008 	ldr	r3, [fp, #-8]
8002883c:	e5933000 	ldr	r3, [r3]
80028840:	e3c33030 	bic	r3, r3, #48	; 0x30
80028844:	e3832010 	orr	r2, r3, #16
80028848:	e51b3008 	ldr	r3, [fp, #-8]
8002884c:	e5832000 	str	r2, [r3]
}
80028850:	e24bd004 	sub	sp, fp, #4
80028854:	e8bd8800 	pop	{fp, pc}

80028858 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t* copyuvm (pde_t *pgdir, uint sz)
{
80028858:	e92d4810 	push	{r4, fp, lr}
8002885c:	e28db008 	add	fp, sp, #8
80028860:	e24dd02c 	sub	sp, sp, #44	; 0x2c
80028864:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
80028868:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    pte_t *pte;
    uint pa, i, ap;
    char *mem;

    // allocate a new first level page directory
    d = kpt_alloc();
8002886c:	ebfffdf5 	bl	80028048 <kpt_alloc>
80028870:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    if (d == NULL ) {
80028874:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028878:	e3530000 	cmp	r3, #0
8002887c:	1a000001 	bne	80028888 <copyuvm+0x30>
        return NULL ;
80028880:	e3a03000 	mov	r3, #0
80028884:	ea000048 	b	800289ac <copyuvm+0x154>
    }

    // copy the whole address space over (no COW)
    for (i = 0; i < sz; i += PTE_SZ) {
80028888:	e3a03000 	mov	r3, #0
8002888c:	e50b3010 	str	r3, [fp, #-16]
80028890:	ea000039 	b	8002897c <copyuvm+0x124>
        if ((pte = walkpgdir(pgdir, (void *) i, 0)) == 0) {
80028894:	e51b3010 	ldr	r3, [fp, #-16]
80028898:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
8002889c:	e1a01003 	mov	r1, r3
800288a0:	e3a02000 	mov	r2, #0
800288a4:	ebfffe10 	bl	800280ec <walkpgdir>
800288a8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
800288ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800288b0:	e3530000 	cmp	r3, #0
800288b4:	1a000002 	bne	800288c4 <copyuvm+0x6c>
            panic("copyuvm: pte should exist");
800288b8:	e30a0344 	movw	r0, #41796	; 0xa344
800288bc:	e3480002 	movt	r0, #32770	; 0x8002
800288c0:	ebffe4bd 	bl	80021bbc <panic>
        }

        if (!(*pte & PE_TYPES)) {
800288c4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800288c8:	e5933000 	ldr	r3, [r3]
800288cc:	e2033003 	and	r3, r3, #3
800288d0:	e3530000 	cmp	r3, #0
800288d4:	1a000002 	bne	800288e4 <copyuvm+0x8c>
            panic("copyuvm: page not present");
800288d8:	e30a0360 	movw	r0, #41824	; 0xa360
800288dc:	e3480002 	movt	r0, #32770	; 0x8002
800288e0:	ebffe4b5 	bl	80021bbc <panic>
        }

        pa = PTE_ADDR (*pte);
800288e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800288e8:	e5933000 	ldr	r3, [r3]
800288ec:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
800288f0:	e3c3300f 	bic	r3, r3, #15
800288f4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        ap = PTE_AP (*pte);
800288f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
800288fc:	e5933000 	ldr	r3, [r3]
80028900:	e1a03223 	lsr	r3, r3, #4
80028904:	e2033003 	and	r3, r3, #3
80028908:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0

        if ((mem = alloc_page()) == 0) {
8002890c:	ebffe37e 	bl	8002170c <alloc_page>
80028910:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
80028914:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028918:	e3530000 	cmp	r3, #0
8002891c:	0a00001c 	beq	80028994 <copyuvm+0x13c>
            goto bad;
        }

        memmove(mem, (char*) p2v(pa), PTE_SZ);
80028920:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
80028924:	ebfffd76 	bl	80027f04 <p2v>
80028928:	e1a03000 	mov	r3, r0
8002892c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
80028930:	e1a01003 	mov	r1, r3
80028934:	e3a02a01 	mov	r2, #4096	; 0x1000
80028938:	ebffde26 	bl	800201d8 <memmove>

        if (mappages(d, (void*) i, PTE_SZ, v2p(mem), ap) < 0) {
8002893c:	e51b4010 	ldr	r4, [fp, #-16]
80028940:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
80028944:	ebfffd64 	bl	80027edc <v2p>
80028948:	e1a03000 	mov	r3, r0
8002894c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80028950:	e58d2000 	str	r2, [sp]
80028954:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
80028958:	e1a01004 	mov	r1, r4
8002895c:	e3a02a01 	mov	r2, #4096	; 0x1000
80028960:	ebfffe17 	bl	800281c4 <mappages>
80028964:	e1a03000 	mov	r3, r0
80028968:	e3530000 	cmp	r3, #0
8002896c:	ba00000a 	blt	8002899c <copyuvm+0x144>
    if (d == NULL ) {
        return NULL ;
    }

    // copy the whole address space over (no COW)
    for (i = 0; i < sz; i += PTE_SZ) {
80028970:	e51b3010 	ldr	r3, [fp, #-16]
80028974:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028978:	e50b3010 	str	r3, [fp, #-16]
8002897c:	e51b2010 	ldr	r2, [fp, #-16]
80028980:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80028984:	e1520003 	cmp	r2, r3
80028988:	3affffc1 	bcc	80028894 <copyuvm+0x3c>

        if (mappages(d, (void*) i, PTE_SZ, v2p(mem), ap) < 0) {
            goto bad;
        }
    }
    return d;
8002898c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028990:	ea000005 	b	800289ac <copyuvm+0x154>

        pa = PTE_ADDR (*pte);
        ap = PTE_AP (*pte);

        if ((mem = alloc_page()) == 0) {
            goto bad;
80028994:	e1a00000 	nop			; (mov r0, r0)
80028998:	ea000000 	b	800289a0 <copyuvm+0x148>
        }

        memmove(mem, (char*) p2v(pa), PTE_SZ);

        if (mappages(d, (void*) i, PTE_SZ, v2p(mem), ap) < 0) {
            goto bad;
8002899c:	e1a00000 	nop			; (mov r0, r0)
        }
    }
    return d;

bad: freevm(d);
800289a0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
800289a4:	ebffff64 	bl	8002873c <freevm>
    return 0;
800289a8:	e3a03000 	mov	r3, #0
}
800289ac:	e1a00003 	mov	r0, r3
800289b0:	e24bd008 	sub	sp, fp, #8
800289b4:	e8bd8810 	pop	{r4, fp, pc}

800289b8 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char* uva2ka (pde_t *pgdir, char *uva)
{
800289b8:	e92d4800 	push	{fp, lr}
800289bc:	e28db004 	add	fp, sp, #4
800289c0:	e24dd010 	sub	sp, sp, #16
800289c4:	e50b0010 	str	r0, [fp, #-16]
800289c8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    pte_t *pte;

    pte = walkpgdir(pgdir, uva, 0);
800289cc:	e51b0010 	ldr	r0, [fp, #-16]
800289d0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
800289d4:	e3a02000 	mov	r2, #0
800289d8:	ebfffdc3 	bl	800280ec <walkpgdir>
800289dc:	e50b0008 	str	r0, [fp, #-8]

    // make sure it exists
    if ((*pte & PE_TYPES) == 0) {
800289e0:	e51b3008 	ldr	r3, [fp, #-8]
800289e4:	e5933000 	ldr	r3, [r3]
800289e8:	e2033003 	and	r3, r3, #3
800289ec:	e3530000 	cmp	r3, #0
800289f0:	1a000001 	bne	800289fc <uva2ka+0x44>
        return 0;
800289f4:	e3a03000 	mov	r3, #0
800289f8:	ea00000e 	b	80028a38 <uva2ka+0x80>
    }

    // make sure it is a user page
    if (PTE_AP(*pte) != AP_KU) {
800289fc:	e51b3008 	ldr	r3, [fp, #-8]
80028a00:	e5933000 	ldr	r3, [r3]
80028a04:	e1a03223 	lsr	r3, r3, #4
80028a08:	e2033003 	and	r3, r3, #3
80028a0c:	e3530003 	cmp	r3, #3
80028a10:	0a000001 	beq	80028a1c <uva2ka+0x64>
        return 0;
80028a14:	e3a03000 	mov	r3, #0
80028a18:	ea000006 	b	80028a38 <uva2ka+0x80>
    }

    return (char*) p2v(PTE_ADDR(*pte));
80028a1c:	e51b3008 	ldr	r3, [fp, #-8]
80028a20:	e5933000 	ldr	r3, [r3]
80028a24:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
80028a28:	e3c3300f 	bic	r3, r3, #15
80028a2c:	e1a00003 	mov	r0, r3
80028a30:	ebfffd33 	bl	80027f04 <p2v>
80028a34:	e1a03000 	mov	r3, r0
}
80028a38:	e1a00003 	mov	r0, r3
80028a3c:	e24bd004 	sub	sp, fp, #4
80028a40:	e8bd8800 	pop	{fp, pc}

80028a44 <copyout>:

// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for user pages.
int copyout (pde_t *pgdir, uint va, void *p, uint len)
{
80028a44:	e92d4800 	push	{fp, lr}
80028a48:	e28db004 	add	fp, sp, #4
80028a4c:	e24dd020 	sub	sp, sp, #32
80028a50:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
80028a54:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
80028a58:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
80028a5c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    char *buf, *pa0;
    uint n, va0;

    buf = (char*) p;
80028a60:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80028a64:	e50b3008 	str	r3, [fp, #-8]

    while (len > 0) {
80028a68:	ea00002c 	b	80028b20 <copyout+0xdc>
        va0 = align_dn(va, PTE_SZ);
80028a6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028a70:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
80028a74:	e3c3300f 	bic	r3, r3, #15
80028a78:	e50b3010 	str	r3, [fp, #-16]
        pa0 = uva2ka(pgdir, (char*) va0);
80028a7c:	e51b3010 	ldr	r3, [fp, #-16]
80028a80:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80028a84:	e1a01003 	mov	r1, r3
80028a88:	ebffffca 	bl	800289b8 <uva2ka>
80028a8c:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec

        if (pa0 == 0) {
80028a90:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028a94:	e3530000 	cmp	r3, #0
80028a98:	1a000001 	bne	80028aa4 <copyout+0x60>
            return -1;
80028a9c:	e3e03000 	mvn	r3, #0
80028aa0:	ea000022 	b	80028b30 <copyout+0xec>
        }

        n = PTE_SZ - (va - va0);
80028aa4:	e51b2010 	ldr	r2, [fp, #-16]
80028aa8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028aac:	e0633002 	rsb	r3, r3, r2
80028ab0:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028ab4:	e50b300c 	str	r3, [fp, #-12]

        if (n > len) {
80028ab8:	e51b200c 	ldr	r2, [fp, #-12]
80028abc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028ac0:	e1520003 	cmp	r2, r3
80028ac4:	9a000001 	bls	80028ad0 <copyout+0x8c>
            n = len;
80028ac8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028acc:	e50b300c 	str	r3, [fp, #-12]
        }

        memmove(pa0 + (va - va0), buf, n);
80028ad0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
80028ad4:	e51b3010 	ldr	r3, [fp, #-16]
80028ad8:	e0633002 	rsb	r3, r3, r2
80028adc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
80028ae0:	e0823003 	add	r3, r2, r3
80028ae4:	e1a00003 	mov	r0, r3
80028ae8:	e51b1008 	ldr	r1, [fp, #-8]
80028aec:	e51b200c 	ldr	r2, [fp, #-12]
80028af0:	ebffddb8 	bl	800201d8 <memmove>

        len -= n;
80028af4:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
80028af8:	e51b300c 	ldr	r3, [fp, #-12]
80028afc:	e0633002 	rsb	r3, r3, r2
80028b00:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
        buf += n;
80028b04:	e51b2008 	ldr	r2, [fp, #-8]
80028b08:	e51b300c 	ldr	r3, [fp, #-12]
80028b0c:	e0823003 	add	r3, r2, r3
80028b10:	e50b3008 	str	r3, [fp, #-8]
        va = va0 + PTE_SZ;
80028b14:	e51b3010 	ldr	r3, [fp, #-16]
80028b18:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028b1c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    char *buf, *pa0;
    uint n, va0;

    buf = (char*) p;

    while (len > 0) {
80028b20:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028b24:	e3530000 	cmp	r3, #0
80028b28:	1affffcf 	bne	80028a6c <copyout+0x28>
        len -= n;
        buf += n;
        va = va0 + PTE_SZ;
    }

    return 0;
80028b2c:	e3a03000 	mov	r3, #0
}
80028b30:	e1a00003 	mov	r0, r3
80028b34:	e24bd004 	sub	sp, fp, #4
80028b38:	e8bd8800 	pop	{fp, pc}

80028b3c <paging_init>:
// it that ARMv6's small brain cannot handle the case that memory
// be mapped in both 1-level page table and 2-level page. For
// initial kernel, we use 1MB mapping, other memory needs to be
// mapped as 4KB pages
void paging_init (uint phy_low, uint phy_hi)
{
80028b3c:	e92d4800 	push	{fp, lr}
80028b40:	e28db004 	add	fp, sp, #4
80028b44:	e24dd010 	sub	sp, sp, #16
80028b48:	e50b0008 	str	r0, [fp, #-8]
80028b4c:	e50b100c 	str	r1, [fp, #-12]
    mappages (P2V(&_kernel_pgtbl), P2V(phy_low), phy_hi - phy_low, phy_low, AP_KU);
80028b50:	e59f0040 	ldr	r0, [pc, #64]	; 80028b98 <paging_init+0x5c>
80028b54:	e51b3008 	ldr	r3, [fp, #-8]
80028b58:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
80028b5c:	e1a02003 	mov	r2, r3
80028b60:	e51b100c 	ldr	r1, [fp, #-12]
80028b64:	e51b3008 	ldr	r3, [fp, #-8]
80028b68:	e0633001 	rsb	r3, r3, r1
80028b6c:	e3a01003 	mov	r1, #3
80028b70:	e58d1000 	str	r1, [sp]
80028b74:	e1a01000 	mov	r1, r0
80028b78:	e1a00001 	mov	r0, r1
80028b7c:	e1a01002 	mov	r1, r2
80028b80:	e1a02003 	mov	r2, r3
80028b84:	e51b3008 	ldr	r3, [fp, #-8]
80028b88:	ebfffd8d 	bl	800281c4 <mappages>
    flush_tlb ();
80028b8c:	ebfffdc9 	bl	800282b8 <flush_tlb>

    /* dump kernel pgtable */
//    dump_pgdir(&_kernel_pgtbl, 16 * 1024 / 4);
}
80028b90:	e24bd004 	sub	sp, fp, #4
80028b94:	e8bd8800 	pop	{fp, pc}
80028b98:	80014000 	.word	0x80014000

80028b9c <view_l2_pgtable>:
/* xzl. code template from m3.c.
 * TRM: "Short-descriptor translation table format descriptors"
 */

static void view_l2_pgtable(unsigned int l2_base_phys, int l1_index)
{
80028b9c:	e92d4800 	push	{fp, lr}
80028ba0:	e28db004 	add	fp, sp, #4
80028ba4:	e24dd030 	sub	sp, sp, #48	; 0x30
80028ba8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
80028bac:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
	int i, n = 256;		// total number of entries
80028bb0:	e3a03c01 	mov	r3, #256	; 0x100
80028bb4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	char *size = "?";
80028bb8:	e30a337c 	movw	r3, #41852	; 0xa37c
80028bbc:	e3483002 	movt	r3, #32770	; 0x8002
80028bc0:	e50b300c 	str	r3, [fp, #-12]
	char *indent = "\t\t";
80028bc4:	e30a3380 	movw	r3, #41856	; 0xa380
80028bc8:	e3483002 	movt	r3, #32770	; 0x8002
80028bcc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
	unsigned int pa, va;
	unsigned int entry;

	/* we don't create new mapping. instead, we use kernel's 1:1 mapping */
	unsigned long *pt_base_virt = P2V(l2_base_phys);
80028bd0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
80028bd4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
80028bd8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0

	for (i = 0; i < n; i++) {
80028bdc:	e3a03000 	mov	r3, #0
80028be0:	e50b3008 	str	r3, [fp, #-8]
80028be4:	ea00004c 	b	80028d1c <view_l2_pgtable+0x180>
		entry = pt_base_virt[i];
80028be8:	e51b3008 	ldr	r3, [fp, #-8]
80028bec:	e1a03103 	lsl	r3, r3, #2
80028bf0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80028bf4:	e0823003 	add	r3, r2, r3
80028bf8:	e5933000 	ldr	r3, [r3]
80028bfc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc

		if (entry == 0)
80028c00:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028c04:	e3530000 	cmp	r3, #0
80028c08:	0a00003f 	beq	80028d0c <view_l2_pgtable+0x170>
			continue;

        if ((entry & 3) == 1) {
80028c0c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028c10:	e2033003 	and	r3, r3, #3
80028c14:	e3530001 	cmp	r3, #1
80028c18:	1a00000d 	bne	80028c54 <view_l2_pgtable+0xb8>
            size = "64KB";		// large page
80028c1c:	e30a3384 	movw	r3, #41860	; 0xa384
80028c20:	e3483002 	movt	r3, #32770	; 0x8002
80028c24:	e50b300c 	str	r3, [fp, #-12]
			pa = entry & ~((1<<16)-1);
80028c28:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028c2c:	e1a03823 	lsr	r3, r3, #16
80028c30:	e1a03803 	lsl	r3, r3, #16
80028c34:	e50b3010 	str	r3, [fp, #-16]
	        va = (l1_index << 20) | (i << 16);
80028c38:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80028c3c:	e1a02a03 	lsl	r2, r3, #20
80028c40:	e51b3008 	ldr	r3, [fp, #-8]
80028c44:	e1a03803 	lsl	r3, r3, #16
80028c48:	e1823003 	orr	r3, r2, r3
80028c4c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
80028c50:	ea00001e 	b	80028cd0 <view_l2_pgtable+0x134>
        } else if (entry & 2) {
80028c54:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028c58:	e2033002 	and	r3, r3, #2
80028c5c:	e3530000 	cmp	r3, #0
80028c60:	0a00000d 	beq	80028c9c <view_l2_pgtable+0x100>
        	size = "4KB";		// small page
80028c64:	e30a338c 	movw	r3, #41868	; 0xa38c
80028c68:	e3483002 	movt	r3, #32770	; 0x8002
80028c6c:	e50b300c 	str	r3, [fp, #-12]
			pa = entry & ~((1<<12)-1);
80028c70:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028c74:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
80028c78:	e3c3300f 	bic	r3, r3, #15
80028c7c:	e50b3010 	str	r3, [fp, #-16]
	        va = (l1_index << 20) | (i << 12);
80028c80:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80028c84:	e1a02a03 	lsl	r2, r3, #20
80028c88:	e51b3008 	ldr	r3, [fp, #-8]
80028c8c:	e1a03603 	lsl	r3, r3, #12
80028c90:	e1823003 	orr	r3, r2, r3
80028c94:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
80028c98:	ea00000c 	b	80028cd0 <view_l2_pgtable+0x134>
        } else {
            // entry marked as invalid. this may be due to that it is an
            // read-only page.
            size = "Inv 4KB";
80028c9c:	e30a3390 	movw	r3, #41872	; 0xa390
80028ca0:	e3483002 	movt	r3, #32770	; 0x8002
80028ca4:	e50b300c 	str	r3, [fp, #-12]
			pa = entry & ~((1<<12)-1);
80028ca8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028cac:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
80028cb0:	e3c3300f 	bic	r3, r3, #15
80028cb4:	e50b3010 	str	r3, [fp, #-16]
            //pa = entry;
            //da = 0xdeadbeef;
	        va = (l1_index << 20) | (i << 12);
80028cb8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
80028cbc:	e1a02a03 	lsl	r2, r3, #20
80028cc0:	e51b3008 	ldr	r3, [fp, #-8]
80028cc4:	e1a03603 	lsl	r3, r3, #12
80028cc8:	e1823003 	orr	r3, r2, r3
80028ccc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        }

        cprintf("%s%d: %x -> %x  %s",
80028cd0:	e51b3010 	ldr	r3, [fp, #-16]
80028cd4:	e58d3000 	str	r3, [sp]
80028cd8:	e51b300c 	ldr	r3, [fp, #-12]
80028cdc:	e58d3004 	str	r3, [sp, #4]
80028ce0:	e30a0398 	movw	r0, #41880	; 0xa398
80028ce4:	e3480002 	movt	r0, #32770	; 0x8002
80028ce8:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
80028cec:	e51b2008 	ldr	r2, [fp, #-8]
80028cf0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028cf4:	ebffe325 	bl	80021990 <cprintf>
            indent, i, va, pa, size);

	    cprintf("\t%x\n", entry);	/* the raw entry */
80028cf8:	e30a03ac 	movw	r0, #41900	; 0xa3ac
80028cfc:	e3480002 	movt	r0, #32770	; 0x8002
80028d00:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
80028d04:	ebffe321 	bl	80021990 <cprintf>
80028d08:	ea000000 	b	80028d10 <view_l2_pgtable+0x174>

	for (i = 0; i < n; i++) {
		entry = pt_base_virt[i];

		if (entry == 0)
			continue;
80028d0c:	e1a00000 	nop			; (mov r0, r0)
	unsigned int entry;

	/* we don't create new mapping. instead, we use kernel's 1:1 mapping */
	unsigned long *pt_base_virt = P2V(l2_base_phys);

	for (i = 0; i < n; i++) {
80028d10:	e51b3008 	ldr	r3, [fp, #-8]
80028d14:	e2833001 	add	r3, r3, #1
80028d18:	e50b3008 	str	r3, [fp, #-8]
80028d1c:	e51b2008 	ldr	r2, [fp, #-8]
80028d20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80028d24:	e1520003 	cmp	r2, r3
80028d28:	baffffae 	blt	80028be8 <view_l2_pgtable+0x4c>
        cprintf("%s%d: %x -> %x  %s",
            indent, i, va, pa, size);

	    cprintf("\t%x\n", entry);	/* the raw entry */
	}
}
80028d2c:	e24bd004 	sub	sp, fp, #4
80028d30:	e8bd8800 	pop	{fp, pc}

80028d34 <dump_pgdir>:

static void dump_pgdir(pde_t *pgdir, int count)
{
80028d34:	e92d4800 	push	{fp, lr}
80028d38:	e28db004 	add	fp, sp, #4
80028d3c:	e24dd028 	sub	sp, sp, #40	; 0x28
80028d40:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
80028d44:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
	int i;
	unsigned int entry, pa, va = 0xdeadbeef, super_i;
80028d48:	e30b3eef 	movw	r3, #48879	; 0xbeef
80028d4c:	e34d3ead 	movt	r3, #57005	; 0xdead
80028d50:	e50b300c 	str	r3, [fp, #-12]
	char *size = "?";
80028d54:	e30a337c 	movw	r3, #41852	; 0xa37c
80028d58:	e3483002 	movt	r3, #32770	; 0x8002
80028d5c:	e50b3010 	str	r3, [fp, #-16]

	for (i = 0; i < count; i++) {
80028d60:	e3a03000 	mov	r3, #0
80028d64:	e50b3008 	str	r3, [fp, #-8]
80028d68:	ea00006d 	b	80028f24 <dump_pgdir+0x1f0>
		entry = pgdir[i];
80028d6c:	e51b3008 	ldr	r3, [fp, #-8]
80028d70:	e1a03103 	lsl	r3, r3, #2
80028d74:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80028d78:	e0823003 	add	r3, r2, r3
80028d7c:	e5933000 	ldr	r3, [r3]
80028d80:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

        if ((entry & 3) == 1) {	/* pgtable */
80028d84:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028d88:	e2033003 	and	r3, r3, #3
80028d8c:	e3530001 	cmp	r3, #1
80028d90:	1a000019 	bne	80028dfc <dump_pgdir+0xc8>
            size = "->lv2";
80028d94:	e30a33b4 	movw	r3, #41908	; 0xa3b4
80028d98:	e3483002 	movt	r3, #32770	; 0x8002
80028d9c:	e50b3010 	str	r3, [fp, #-16]
            pa = entry & ~((1<<10)-1);
80028da0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028da4:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
80028da8:	e3c33003 	bic	r3, r3, #3
80028dac:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
            va = (i << 20);
80028db0:	e51b3008 	ldr	r3, [fp, #-8]
80028db4:	e1a03a03 	lsl	r3, r3, #20
80028db8:	e50b300c 	str	r3, [fp, #-12]
            cprintf("%d: %x -> %x  %s",
80028dbc:	e51b3010 	ldr	r3, [fp, #-16]
80028dc0:	e58d3000 	str	r3, [sp]
80028dc4:	e30a03bc 	movw	r0, #41916	; 0xa3bc
80028dc8:	e3480002 	movt	r0, #32770	; 0x8002
80028dcc:	e51b1008 	ldr	r1, [fp, #-8]
80028dd0:	e51b200c 	ldr	r2, [fp, #-12]
80028dd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80028dd8:	ebffe2ec 	bl	80021990 <cprintf>
                i, va, pa, size);
	        cprintf("\t%x\n", entry);	/* the raw entry */
80028ddc:	e30a03ac 	movw	r0, #41900	; 0xa3ac
80028de0:	e3480002 	movt	r0, #32770	; 0x8002
80028de4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
80028de8:	ebffe2e8 	bl	80021990 <cprintf>
            view_l2_pgtable(pa, i);
80028dec:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
80028df0:	e51b1008 	ldr	r1, [fp, #-8]
80028df4:	ebffff68 	bl	80028b9c <view_l2_pgtable>
80028df8:	ea000046 	b	80028f18 <dump_pgdir+0x1e4>
        } else if ((entry & 3) == 2) {
80028dfc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028e00:	e2033003 	and	r3, r3, #3
80028e04:	e3530002 	cmp	r3, #2
80028e08:	1a000031 	bne	80028ed4 <dump_pgdir+0x1a0>
            if (entry & (1<<18)) {  /* supersection */
80028e0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028e10:	e2033701 	and	r3, r3, #262144	; 0x40000
80028e14:	e3530000 	cmp	r3, #0
80028e18:	0a000016 	beq	80028e78 <dump_pgdir+0x144>
                size = "16 MB";
80028e1c:	e30a33d0 	movw	r3, #41936	; 0xa3d0
80028e20:	e3483002 	movt	r3, #32770	; 0x8002
80028e24:	e50b3010 	str	r3, [fp, #-16]
                pa = entry & ~((1<<24)-1);
80028e28:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028e2c:	e20334ff 	and	r3, r3, #-16777216	; 0xff000000
80028e30:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                va = (i << 20);		/* same index as section */
80028e34:	e51b3008 	ldr	r3, [fp, #-8]
80028e38:	e1a03a03 	lsl	r3, r3, #20
80028e3c:	e50b300c 	str	r3, [fp, #-12]
                super_i = (i & 0xf);
80028e40:	e51b3008 	ldr	r3, [fp, #-8]
80028e44:	e203300f 	and	r3, r3, #15
80028e48:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
	            cprintf("%d: %x -> %x  %s (%d/16)",
80028e4c:	e51b3010 	ldr	r3, [fp, #-16]
80028e50:	e58d3000 	str	r3, [sp]
80028e54:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
80028e58:	e58d3004 	str	r3, [sp, #4]
80028e5c:	e30a03d8 	movw	r0, #41944	; 0xa3d8
80028e60:	e3480002 	movt	r0, #32770	; 0x8002
80028e64:	e51b1008 	ldr	r1, [fp, #-8]
80028e68:	e51b200c 	ldr	r2, [fp, #-12]
80028e6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80028e70:	ebffe2c6 	bl	80021990 <cprintf>
80028e74:	ea000011 	b	80028ec0 <dump_pgdir+0x18c>
                	i, va, pa, size, super_i);
            }
            else {	/* section */
                size = "1 MB";
80028e78:	e30a33f4 	movw	r3, #41972	; 0xa3f4
80028e7c:	e3483002 	movt	r3, #32770	; 0x8002
80028e80:	e50b3010 	str	r3, [fp, #-16]
                pa = entry & ~((1<<20)-1);
80028e84:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028e88:	e1a03a23 	lsr	r3, r3, #20
80028e8c:	e1a03a03 	lsl	r3, r3, #20
80028e90:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
                va = (i << 20);
80028e94:	e51b3008 	ldr	r3, [fp, #-8]
80028e98:	e1a03a03 	lsl	r3, r3, #20
80028e9c:	e50b300c 	str	r3, [fp, #-12]
	            cprintf("%d: %x -> %x  %s",
80028ea0:	e51b3010 	ldr	r3, [fp, #-16]
80028ea4:	e58d3000 	str	r3, [sp]
80028ea8:	e30a03bc 	movw	r0, #41916	; 0xa3bc
80028eac:	e3480002 	movt	r0, #32770	; 0x8002
80028eb0:	e51b1008 	ldr	r1, [fp, #-8]
80028eb4:	e51b200c 	ldr	r2, [fp, #-12]
80028eb8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80028ebc:	ebffe2b3 	bl	80021990 <cprintf>
    	            i, va, pa, size);
            }
	        cprintf("\t%x\n", entry);	/* the raw entry */
80028ec0:	e30a03ac 	movw	r0, #41900	; 0xa3ac
80028ec4:	e3480002 	movt	r0, #32770	; 0x8002
80028ec8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
80028ecc:	ebffe2af 	bl	80021990 <cprintf>
80028ed0:	ea000010 	b	80028f18 <dump_pgdir+0x1e4>
        } else {
            size = "(?fault)";
80028ed4:	e30a33fc 	movw	r3, #41980	; 0xa3fc
80028ed8:	e3483002 	movt	r3, #32770	; 0x8002
80028edc:	e50b3010 	str	r3, [fp, #-16]
            pa = entry;
80028ee0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
80028ee4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
            cprintf("%d: %x -> %x  %s",
80028ee8:	e51b3010 	ldr	r3, [fp, #-16]
80028eec:	e58d3000 	str	r3, [sp]
80028ef0:	e30a03bc 	movw	r0, #41916	; 0xa3bc
80028ef4:	e3480002 	movt	r0, #32770	; 0x8002
80028ef8:	e51b1008 	ldr	r1, [fp, #-8]
80028efc:	e51b200c 	ldr	r2, [fp, #-12]
80028f00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80028f04:	ebffe2a1 	bl	80021990 <cprintf>
                i, va, pa, size);
	        cprintf("\t%x\n", entry);	/* the raw entry */
80028f08:	e30a03ac 	movw	r0, #41900	; 0xa3ac
80028f0c:	e3480002 	movt	r0, #32770	; 0x8002
80028f10:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
80028f14:	ebffe29d 	bl	80021990 <cprintf>
{
	int i;
	unsigned int entry, pa, va = 0xdeadbeef, super_i;
	char *size = "?";

	for (i = 0; i < count; i++) {
80028f18:	e51b3008 	ldr	r3, [fp, #-8]
80028f1c:	e2833001 	add	r3, r3, #1
80028f20:	e50b3008 	str	r3, [fp, #-8]
80028f24:	e51b2008 	ldr	r2, [fp, #-8]
80028f28:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
80028f2c:	e1520003 	cmp	r2, r3
80028f30:	baffff8d 	blt	80028d6c <dump_pgdir+0x38>
            cprintf("%d: %x -> %x  %s",
                i, va, pa, size);
	        cprintf("\t%x\n", entry);	/* the raw entry */
        }
	}
}
80028f34:	e24bd004 	sub	sp, fp, #4
80028f38:	e8bd8800 	pop	{fp, pc}

80028f3c <default_isr>:

#define NUM_INTSRC		128 // numbers of interrupt source supported
static ISR isrs[NUM_INTSRC];

static void default_isr (struct trapframe *tf, int n)
{
80028f3c:	e92d4800 	push	{fp, lr}
80028f40:	e28db004 	add	fp, sp, #4
80028f44:	e24dd008 	sub	sp, sp, #8
80028f48:	e50b0008 	str	r0, [fp, #-8]
80028f4c:	e50b100c 	str	r1, [fp, #-12]
    cprintf ("unhandled interrupt: %d\n", n);
80028f50:	e30a0410 	movw	r0, #42000	; 0xa410
80028f54:	e3480002 	movt	r0, #32770	; 0x8002
80028f58:	e51b100c 	ldr	r1, [fp, #-12]
80028f5c:	ebffe28b 	bl	80021990 <cprintf>
}
80028f60:	e24bd004 	sub	sp, fp, #4
80028f64:	e8bd8800 	pop	{fp, pc}

80028f68 <gic_init>:

// initialize the GIC
void gic_init (void * peribase)
{
80028f68:	e92d4800 	push	{fp, lr}
80028f6c:	e28db004 	add	fp, sp, #4
80028f70:	e24dd010 	sub	sp, sp, #16
80028f74:	e50b0010 	str	r0, [fp, #-16]
    int i;
    unsigned long icdictr;

    cpu_peribase = (uint)peribase;
80028f78:	e51b2010 	ldr	r2, [fp, #-16]
80028f7c:	e3003680 	movw	r3, #1664	; 0x680
80028f80:	e348300b 	movt	r3, #32779	; 0x800b
80028f84:	e5832000 	str	r2, [r3]

    icdictr = *ICDICRT;
80028f88:	e3003680 	movw	r3, #1664	; 0x680
80028f8c:	e348300b 	movt	r3, #32779	; 0x800b
80028f90:	e5933000 	ldr	r3, [r3]
80028f94:	e2833a01 	add	r3, r3, #4096	; 0x1000
80028f98:	e2833004 	add	r3, r3, #4
80028f9c:	e5933000 	ldr	r3, [r3]
80028fa0:	e50b300c 	str	r3, [fp, #-12]
    cprintf("#cpus %d max #irqs %d\n", 1 + ((icdictr >> 5) & 7),
80028fa4:	e51b300c 	ldr	r3, [fp, #-12]
80028fa8:	e1a032a3 	lsr	r3, r3, #5
80028fac:	e2033007 	and	r3, r3, #7
80028fb0:	e2832001 	add	r2, r3, #1
    		((icdictr & 0x1f) + 1 ) * 32);
80028fb4:	e51b300c 	ldr	r3, [fp, #-12]
80028fb8:	e203301f 	and	r3, r3, #31
    unsigned long icdictr;

    cpu_peribase = (uint)peribase;

    icdictr = *ICDICRT;
    cprintf("#cpus %d max #irqs %d\n", 1 + ((icdictr >> 5) & 7),
80028fbc:	e2833001 	add	r3, r3, #1
80028fc0:	e1a03283 	lsl	r3, r3, #5
80028fc4:	e30a042c 	movw	r0, #42028	; 0xa42c
80028fc8:	e3480002 	movt	r0, #32770	; 0x8002
80028fcc:	e1a01002 	mov	r1, r2
80028fd0:	e1a02003 	mov	r2, r3
80028fd4:	ebffe26d 	bl	80021990 <cprintf>
    		((icdictr & 0x1f) + 1 ) * 32);

    for (i = 0; i < NUM_INTSRC; i++) {
80028fd8:	e3a03000 	mov	r3, #0
80028fdc:	e50b3008 	str	r3, [fp, #-8]
80028fe0:	ea000008 	b	80029008 <gic_init+0xa0>
        isrs[i] = default_isr;
80028fe4:	e3003684 	movw	r3, #1668	; 0x684
80028fe8:	e348300b 	movt	r3, #32779	; 0x800b
80028fec:	e51b1008 	ldr	r1, [fp, #-8]
80028ff0:	e3082f3c 	movw	r2, #36668	; 0x8f3c
80028ff4:	e3482002 	movt	r2, #32770	; 0x8002
80028ff8:	e7832101 	str	r2, [r3, r1, lsl #2]

    icdictr = *ICDICRT;
    cprintf("#cpus %d max #irqs %d\n", 1 + ((icdictr >> 5) & 7),
    		((icdictr & 0x1f) + 1 ) * 32);

    for (i = 0; i < NUM_INTSRC; i++) {
80028ffc:	e51b3008 	ldr	r3, [fp, #-8]
80029000:	e2833001 	add	r3, r3, #1
80029004:	e50b3008 	str	r3, [fp, #-8]
80029008:	e51b3008 	ldr	r3, [fp, #-8]
8002900c:	e353007f 	cmp	r3, #127	; 0x7f
80029010:	dafffff3 	ble	80028fe4 <gic_init+0x7c>
        isrs[i] = default_isr;
    }
}
80029014:	e24bd004 	sub	sp, fp, #4
80029018:	e8bd8800 	pop	{fp, pc}

8002901c <gic_enable>:

// enable an interrupt (with the ISR)
void gic_enable (int id, ISR isr)
{
8002901c:	e92d4800 	push	{fp, lr}
80029020:	e28db004 	add	fp, sp, #4
80029024:	e24dd020 	sub	sp, sp, #32
80029028:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
8002902c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
	int mask, value;
	int edge = 1; /* edge or level */
80029030:	e3a03001 	mov	r3, #1
80029034:	e50b3008 	str	r3, [fp, #-8]
	int priority = 0xff;	/* lowest priority */
80029038:	e3a030ff 	mov	r3, #255	; 0xff
8002903c:	e50b300c 	str	r3, [fp, #-12]
	int cpus = 0x1; 	/* only send to cpu 0 */
80029040:	e3a03001 	mov	r3, #1
80029044:	e50b3010 	str	r3, [fp, #-16]

    if ((id<0) || (id >= NUM_INTSRC)) {
80029048:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002904c:	e3530000 	cmp	r3, #0
80029050:	ba000002 	blt	80029060 <gic_enable+0x44>
80029054:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
80029058:	e353007f 	cmp	r3, #127	; 0x7f
8002905c:	da000002 	ble	8002906c <gic_enable+0x50>
        panic ("invalid interrupt source");
80029060:	e30a0444 	movw	r0, #42052	; 0xa444
80029064:	e3480002 	movt	r0, #32770	; 0x8002
80029068:	ebffe2d3 	bl	80021bbc <panic>
    }

    *ICDDCR = 0x00;             // Disable the CPU interface and distributor.
8002906c:	e3003680 	movw	r3, #1664	; 0x680
80029070:	e348300b 	movt	r3, #32779	; 0x800b
80029074:	e5933000 	ldr	r3, [r3]
80029078:	e2833a01 	add	r3, r3, #4096	; 0x1000
8002907c:	e3a02000 	mov	r2, #0
80029080:	e5832000 	str	r2, [r3]

    isrs[id] = isr;
80029084:	e3003684 	movw	r3, #1668	; 0x684
80029088:	e348300b 	movt	r3, #32779	; 0x800b
8002908c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
80029090:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
80029094:	e7831102 	str	r1, [r3, r2, lsl #2]

    // Set level or edge sensitive.
    mask = 0x3 << (id % 16);
80029098:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
8002909c:	e1a03fc2 	asr	r3, r2, #31
800290a0:	e1a03e23 	lsr	r3, r3, #28
800290a4:	e0822003 	add	r2, r2, r3
800290a8:	e202200f 	and	r2, r2, #15
800290ac:	e0633002 	rsb	r3, r3, r2
800290b0:	e3a02003 	mov	r2, #3
800290b4:	e1a03312 	lsl	r3, r2, r3
800290b8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    value = (edge ? 0x2 : 0x0) << (id % 16);
800290bc:	e51b3008 	ldr	r3, [fp, #-8]
800290c0:	e3530000 	cmp	r3, #0
800290c4:	0a000001 	beq	800290d0 <gic_enable+0xb4>
800290c8:	e3a03002 	mov	r3, #2
800290cc:	ea000000 	b	800290d4 <gic_enable+0xb8>
800290d0:	e3a03000 	mov	r3, #0
800290d4:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
800290d8:	e1a02fc1 	asr	r2, r1, #31
800290dc:	e1a02e22 	lsr	r2, r2, #28
800290e0:	e0811002 	add	r1, r1, r2
800290e4:	e201100f 	and	r1, r1, #15
800290e8:	e0622001 	rsb	r2, r2, r1
800290ec:	e1a03213 	lsl	r3, r3, r2
800290f0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    ICDICFRn[id / 16] &= ~mask;
800290f4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800290f8:	e283200f 	add	r2, r3, #15
800290fc:	e3530000 	cmp	r3, #0
80029100:	b1a03002 	movlt	r3, r2
80029104:	e1a03243 	asr	r3, r3, #4
80029108:	e1a02003 	mov	r2, r3
8002910c:	e1a03002 	mov	r3, r2
80029110:	e1a01103 	lsl	r1, r3, #2
80029114:	e3003680 	movw	r3, #1664	; 0x680
80029118:	e348300b 	movt	r3, #32779	; 0x800b
8002911c:	e5933000 	ldr	r3, [r3]
80029120:	e0811003 	add	r1, r1, r3
80029124:	e2811b07 	add	r1, r1, #7168	; 0x1c00
80029128:	e1a02102 	lsl	r2, r2, #2
8002912c:	e0823003 	add	r3, r2, r3
80029130:	e2833b07 	add	r3, r3, #7168	; 0x1c00
80029134:	e5932000 	ldr	r2, [r3]
80029138:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
8002913c:	e1e03003 	mvn	r3, r3
80029140:	e0023003 	and	r3, r2, r3
80029144:	e5813000 	str	r3, [r1]
    ICDICFRn[id / 16] |= value;
80029148:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002914c:	e283200f 	add	r2, r3, #15
80029150:	e3530000 	cmp	r3, #0
80029154:	b1a03002 	movlt	r3, r2
80029158:	e1a03243 	asr	r3, r3, #4
8002915c:	e1a02003 	mov	r2, r3
80029160:	e1a03002 	mov	r3, r2
80029164:	e1a01103 	lsl	r1, r3, #2
80029168:	e3003680 	movw	r3, #1664	; 0x680
8002916c:	e348300b 	movt	r3, #32779	; 0x800b
80029170:	e5933000 	ldr	r3, [r3]
80029174:	e0811003 	add	r1, r1, r3
80029178:	e2811b07 	add	r1, r1, #7168	; 0x1c00
8002917c:	e1a02102 	lsl	r2, r2, #2
80029180:	e0823003 	add	r3, r2, r3
80029184:	e2833b07 	add	r3, r3, #7168	; 0x1c00
80029188:	e5932000 	ldr	r2, [r3]
8002918c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80029190:	e1823003 	orr	r3, r2, r3
80029194:	e5813000 	str	r3, [r1]

    // Set the priority.
    mask = 0xFF << (id % 4);
80029198:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
8002919c:	e1a03fc2 	asr	r3, r2, #31
800291a0:	e1a03f23 	lsr	r3, r3, #30
800291a4:	e0822003 	add	r2, r2, r3
800291a8:	e2022003 	and	r2, r2, #3
800291ac:	e0633002 	rsb	r3, r3, r2
800291b0:	e3a020ff 	mov	r2, #255	; 0xff
800291b4:	e1a03312 	lsl	r3, r2, r3
800291b8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    value = (priority & 0xFF) << (id % 4);
800291bc:	e51b300c 	ldr	r3, [fp, #-12]
800291c0:	e6ef1073 	uxtb	r1, r3
800291c4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
800291c8:	e1a03fc2 	asr	r3, r2, #31
800291cc:	e1a03f23 	lsr	r3, r3, #30
800291d0:	e0822003 	add	r2, r2, r3
800291d4:	e2022003 	and	r2, r2, #3
800291d8:	e0633002 	rsb	r3, r3, r2
800291dc:	e1a03311 	lsl	r3, r1, r3
800291e0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    ICDIPRn[id / 4] &= ~mask;
800291e4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800291e8:	e2832003 	add	r2, r3, #3
800291ec:	e3530000 	cmp	r3, #0
800291f0:	b1a03002 	movlt	r3, r2
800291f4:	e1a03143 	asr	r3, r3, #2
800291f8:	e1a02003 	mov	r2, r3
800291fc:	e1a03002 	mov	r3, r2
80029200:	e1a01103 	lsl	r1, r3, #2
80029204:	e3003680 	movw	r3, #1664	; 0x680
80029208:	e348300b 	movt	r3, #32779	; 0x800b
8002920c:	e5933000 	ldr	r3, [r3]
80029210:	e0811003 	add	r1, r1, r3
80029214:	e2811b05 	add	r1, r1, #5120	; 0x1400
80029218:	e1a02102 	lsl	r2, r2, #2
8002921c:	e0823003 	add	r3, r2, r3
80029220:	e2833b05 	add	r3, r3, #5120	; 0x1400
80029224:	e5932000 	ldr	r2, [r3]
80029228:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
8002922c:	e1e03003 	mvn	r3, r3
80029230:	e0023003 	and	r3, r2, r3
80029234:	e5813000 	str	r3, [r1]
    ICDIPRn[id / 4] |= value;
80029238:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002923c:	e2832003 	add	r2, r3, #3
80029240:	e3530000 	cmp	r3, #0
80029244:	b1a03002 	movlt	r3, r2
80029248:	e1a03143 	asr	r3, r3, #2
8002924c:	e1a02003 	mov	r2, r3
80029250:	e1a03002 	mov	r3, r2
80029254:	e1a01103 	lsl	r1, r3, #2
80029258:	e3003680 	movw	r3, #1664	; 0x680
8002925c:	e348300b 	movt	r3, #32779	; 0x800b
80029260:	e5933000 	ldr	r3, [r3]
80029264:	e0811003 	add	r1, r1, r3
80029268:	e2811b05 	add	r1, r1, #5120	; 0x1400
8002926c:	e1a02102 	lsl	r2, r2, #2
80029270:	e0823003 	add	r3, r2, r3
80029274:	e2833b05 	add	r3, r3, #5120	; 0x1400
80029278:	e5932000 	ldr	r2, [r3]
8002927c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80029280:	e1823003 	orr	r3, r2, r3
80029284:	e5813000 	str	r3, [r1]

    // Set the processor(s) to which to send the interrupt.
    mask = 0xFF << (id % 4);
80029288:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
8002928c:	e1a03fc2 	asr	r3, r2, #31
80029290:	e1a03f23 	lsr	r3, r3, #30
80029294:	e0822003 	add	r2, r2, r3
80029298:	e2022003 	and	r2, r2, #3
8002929c:	e0633002 	rsb	r3, r3, r2
800292a0:	e3a020ff 	mov	r2, #255	; 0xff
800292a4:	e1a03312 	lsl	r3, r2, r3
800292a8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    value = (cpus & 0xFF) << (id % 4);
800292ac:	e51b3010 	ldr	r3, [fp, #-16]
800292b0:	e6ef1073 	uxtb	r1, r3
800292b4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
800292b8:	e1a03fc2 	asr	r3, r2, #31
800292bc:	e1a03f23 	lsr	r3, r3, #30
800292c0:	e0822003 	add	r2, r2, r3
800292c4:	e2022003 	and	r2, r2, #3
800292c8:	e0633002 	rsb	r3, r3, r2
800292cc:	e1a03311 	lsl	r3, r1, r3
800292d0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    ICDIPTRn[id / 4] &= ~mask;
800292d4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
800292d8:	e2832003 	add	r2, r3, #3
800292dc:	e3530000 	cmp	r3, #0
800292e0:	b1a03002 	movlt	r3, r2
800292e4:	e1a03143 	asr	r3, r3, #2
800292e8:	e1a02003 	mov	r2, r3
800292ec:	e1a03002 	mov	r3, r2
800292f0:	e1a01103 	lsl	r1, r3, #2
800292f4:	e3003680 	movw	r3, #1664	; 0x680
800292f8:	e348300b 	movt	r3, #32779	; 0x800b
800292fc:	e5933000 	ldr	r3, [r3]
80029300:	e0811003 	add	r1, r1, r3
80029304:	e2811b06 	add	r1, r1, #6144	; 0x1800
80029308:	e1a02102 	lsl	r2, r2, #2
8002930c:	e0823003 	add	r3, r2, r3
80029310:	e2833b06 	add	r3, r3, #6144	; 0x1800
80029314:	e5932000 	ldr	r2, [r3]
80029318:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
8002931c:	e1e03003 	mvn	r3, r3
80029320:	e0023003 	and	r3, r2, r3
80029324:	e5813000 	str	r3, [r1]
    ICDIPTRn[id / 4] |= value;
80029328:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002932c:	e2832003 	add	r2, r3, #3
80029330:	e3530000 	cmp	r3, #0
80029334:	b1a03002 	movlt	r3, r2
80029338:	e1a03143 	asr	r3, r3, #2
8002933c:	e1a02003 	mov	r2, r3
80029340:	e1a03002 	mov	r3, r2
80029344:	e1a01103 	lsl	r1, r3, #2
80029348:	e3003680 	movw	r3, #1664	; 0x680
8002934c:	e348300b 	movt	r3, #32779	; 0x800b
80029350:	e5933000 	ldr	r3, [r3]
80029354:	e0811003 	add	r1, r1, r3
80029358:	e2811b06 	add	r1, r1, #6144	; 0x1800
8002935c:	e1a02102 	lsl	r2, r2, #2
80029360:	e0823003 	add	r3, r2, r3
80029364:	e2833b06 	add	r3, r3, #6144	; 0x1800
80029368:	e5932000 	ldr	r2, [r3]
8002936c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
80029370:	e1823003 	orr	r3, r2, r3
80029374:	e5813000 	str	r3, [r1]

    // Enable the interrupt. xzl: note that write 0 has no effect
    ICDISERn[id / 32] = 1 << (id % 32);
80029378:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
8002937c:	e283201f 	add	r2, r3, #31
80029380:	e3530000 	cmp	r3, #0
80029384:	b1a03002 	movlt	r3, r2
80029388:	e1a032c3 	asr	r3, r3, #5
8002938c:	e1a02103 	lsl	r2, r3, #2
80029390:	e3003680 	movw	r3, #1664	; 0x680
80029394:	e348300b 	movt	r3, #32779	; 0x800b
80029398:	e5933000 	ldr	r3, [r3]
8002939c:	e0823003 	add	r3, r2, r3
800293a0:	e2833c11 	add	r3, r3, #4352	; 0x1100
800293a4:	e1a01003 	mov	r1, r3
800293a8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
800293ac:	e1a03fc2 	asr	r3, r2, #31
800293b0:	e1a03da3 	lsr	r3, r3, #27
800293b4:	e0822003 	add	r2, r2, r3
800293b8:	e202201f 	and	r2, r2, #31
800293bc:	e0633002 	rsb	r3, r3, r2
800293c0:	e3a02001 	mov	r2, #1
800293c4:	e1a03312 	lsl	r3, r2, r3
800293c8:	e5813000 	str	r3, [r1]

    // Set the interrupt mask register. (No interrupts masked.)
    *ICCPMR = 0xFF;
800293cc:	e3003680 	movw	r3, #1664	; 0x680
800293d0:	e348300b 	movt	r3, #32779	; 0x800b
800293d4:	e5933000 	ldr	r3, [r3]
800293d8:	e2833f41 	add	r3, r3, #260	; 0x104
800293dc:	e3a020ff 	mov	r2, #255	; 0xff
800293e0:	e5832000 	str	r2, [r3]

    // Set the interface control register.
    *ICCICR = 0x3;              // Enable secure and non-secure handling.
800293e4:	e3003680 	movw	r3, #1664	; 0x680
800293e8:	e348300b 	movt	r3, #32779	; 0x800b
800293ec:	e5933000 	ldr	r3, [r3]
800293f0:	e2833c01 	add	r3, r3, #256	; 0x100
800293f4:	e3a02003 	mov	r2, #3
800293f8:	e5832000 	str	r2, [r3]
    *ICDDCR = 0x01;             // Enable the CPU interface and distributer.
800293fc:	e3003680 	movw	r3, #1664	; 0x680
80029400:	e348300b 	movt	r3, #32779	; 0x800b
80029404:	e5933000 	ldr	r3, [r3]
80029408:	e2833a01 	add	r3, r3, #4096	; 0x1000
8002940c:	e3a02001 	mov	r2, #1
80029410:	e5832000 	str	r2, [r3]
}
80029414:	e24bd004 	sub	sp, fp, #4
80029418:	e8bd8800 	pop	{fp, pc}

8002941c <pic_disable>:

// disable an interrupt
void pic_disable (int id)
{
8002941c:	e92d4800 	push	{fp, lr}
80029420:	e28db004 	add	fp, sp, #4
80029424:	e24dd008 	sub	sp, sp, #8
80029428:	e50b0008 	str	r0, [fp, #-8]
    if ((id < 0) || (id >= NUM_INTSRC)) {
8002942c:	e51b3008 	ldr	r3, [fp, #-8]
80029430:	e3530000 	cmp	r3, #0
80029434:	ba000002 	blt	80029444 <pic_disable+0x28>
80029438:	e51b3008 	ldr	r3, [fp, #-8]
8002943c:	e353007f 	cmp	r3, #127	; 0x7f
80029440:	da000002 	ble	80029450 <pic_disable+0x34>
        panic ("invalid interrupt source");
80029444:	e30a0444 	movw	r0, #42052	; 0xa444
80029448:	e3480002 	movt	r0, #32770	; 0x8002
8002944c:	ebffe1da 	bl	80021bbc <panic>
    }

    *ICDDCR = 0x00;             // Disable the CPU interface and distributor.
80029450:	e3003680 	movw	r3, #1664	; 0x680
80029454:	e348300b 	movt	r3, #32779	; 0x800b
80029458:	e5933000 	ldr	r3, [r3]
8002945c:	e2833a01 	add	r3, r3, #4096	; 0x1000
80029460:	e3a02000 	mov	r2, #0
80029464:	e5832000 	str	r2, [r3]
    ICDICERn[id / 32] = 1 << (id % 32); /* xzl: note that write 0 has no effect */
80029468:	e51b3008 	ldr	r3, [fp, #-8]
8002946c:	e283201f 	add	r2, r3, #31
80029470:	e3530000 	cmp	r3, #0
80029474:	b1a03002 	movlt	r3, r2
80029478:	e1a032c3 	asr	r3, r3, #5
8002947c:	e1a02103 	lsl	r2, r3, #2
80029480:	e3003680 	movw	r3, #1664	; 0x680
80029484:	e348300b 	movt	r3, #32779	; 0x800b
80029488:	e5933000 	ldr	r3, [r3]
8002948c:	e0823003 	add	r3, r2, r3
80029490:	e2833d46 	add	r3, r3, #4480	; 0x1180
80029494:	e1a01003 	mov	r1, r3
80029498:	e51b2008 	ldr	r2, [fp, #-8]
8002949c:	e1a03fc2 	asr	r3, r2, #31
800294a0:	e1a03da3 	lsr	r3, r3, #27
800294a4:	e0822003 	add	r2, r2, r3
800294a8:	e202201f 	and	r2, r2, #31
800294ac:	e0633002 	rsb	r3, r3, r2
800294b0:	e3a02001 	mov	r2, #1
800294b4:	e1a03312 	lsl	r3, r2, r3
800294b8:	e5813000 	str	r3, [r1]
    *ICDDCR = 0x01;             // Enable the CPU interface and distributer.
800294bc:	e3003680 	movw	r3, #1664	; 0x680
800294c0:	e348300b 	movt	r3, #32779	; 0x800b
800294c4:	e5933000 	ldr	r3, [r3]
800294c8:	e2833a01 	add	r3, r3, #4096	; 0x1000
800294cc:	e3a02001 	mov	r2, #1
800294d0:	e5832000 	str	r2, [r3]

    isrs[id] = default_isr;
800294d4:	e3003684 	movw	r3, #1668	; 0x684
800294d8:	e348300b 	movt	r3, #32779	; 0x800b
800294dc:	e51b1008 	ldr	r1, [fp, #-8]
800294e0:	e3082f3c 	movw	r2, #36668	; 0x8f3c
800294e4:	e3482002 	movt	r2, #32770	; 0x8002
800294e8:	e7832101 	str	r2, [r3, r1, lsl #2]
}
800294ec:	e24bd004 	sub	sp, fp, #4
800294f0:	e8bd8800 	pop	{fp, pc}

800294f4 <pic_dispatch>:

// dispatch the interrupt
/* xzl: will be invoked form trap.c */
void pic_dispatch (struct trapframe *tp)
{
800294f4:	e92d4800 	push	{fp, lr}
800294f8:	e28db004 	add	fp, sp, #4
800294fc:	e24dd010 	sub	sp, sp, #16
80029500:	e50b0010 	str	r0, [fp, #-16]
	int id;
	int ack;

    id = *ICCIAR;
80029504:	e3003680 	movw	r3, #1664	; 0x680
80029508:	e348300b 	movt	r3, #32779	; 0x800b
8002950c:	e5933000 	ldr	r3, [r3]
80029510:	e2833f43 	add	r3, r3, #268	; 0x10c
80029514:	e5933000 	ldr	r3, [r3]
80029518:	e50b3008 	str	r3, [fp, #-8]
    ack = id;                  // The acknowledge word.
8002951c:	e51b3008 	ldr	r3, [fp, #-8]
80029520:	e50b300c 	str	r3, [fp, #-12]
//  cprintf("%s: got an interrupt id %d\n", __func__, id);

    id &= 0x3FF;                // Trim off the ID bits.
80029524:	e51b3008 	ldr	r3, [fp, #-8]
80029528:	e1a03b03 	lsl	r3, r3, #22
8002952c:	e1a03b23 	lsr	r3, r3, #22
80029530:	e50b3008 	str	r3, [fp, #-8]
    if (id == 0x3FF) {
80029534:	e51b2008 	ldr	r2, [fp, #-8]
80029538:	e30033ff 	movw	r3, #1023	; 0x3ff
8002953c:	e1520003 	cmp	r2, r3
80029540:	1a000002 	bne	80029550 <pic_dispatch+0x5c>
    	/* xzl: id 0x3ff (1023) indicates a spurious irq
    	 * that needs sw attention. see GIC TRM for more details
    	 * (look for `ICCIAR')
    	 */
    	panic("spurious irq");
80029544:	e30a0460 	movw	r0, #42080	; 0xa460
80029548:	e3480002 	movt	r0, #32770	; 0x8002
8002954c:	ebffe19a 	bl	80021bbc <panic>
    }

    /* call isr here ... */
    isrs[id](tp, id);
80029550:	e3003684 	movw	r3, #1668	; 0x684
80029554:	e348300b 	movt	r3, #32779	; 0x800b
80029558:	e51b2008 	ldr	r2, [fp, #-8]
8002955c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80029560:	e51b0010 	ldr	r0, [fp, #-16]
80029564:	e51b1008 	ldr	r1, [fp, #-8]
80029568:	e12fff33 	blx	r3

    *ICCEOIR = ack;	/* ack the irq */
8002956c:	e3003680 	movw	r3, #1664	; 0x680
80029570:	e348300b 	movt	r3, #32779	; 0x800b
80029574:	e5933000 	ldr	r3, [r3]
80029578:	e2833e11 	add	r3, r3, #272	; 0x110
8002957c:	e51b200c 	ldr	r2, [fp, #-12]
80029580:	e5832000 	str	r2, [r3]
}
80029584:	e24bd004 	sub	sp, fp, #4
80029588:	e8bd8800 	pop	{fp, pc}

8002958c <ack_timer>:
struct spinlock tickslock;
uint ticks;

// acknowledge the timer, write any value to TIMER_INTCLR should do
static void ack_timer ()
{
8002958c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80029590:	e28db000 	add	fp, sp, #0
80029594:	e24dd00c 	sub	sp, sp, #12
    volatile uint * timer0 = P2V(TIMER0);
80029598:	e3a03a01 	mov	r3, #4096	; 0x1000
8002959c:	e3493001 	movt	r3, #36865	; 0x9001
800295a0:	e50b3008 	str	r3, [fp, #-8]
    timer0[TIMER_INTCLR] = 1;
800295a4:	e51b3008 	ldr	r3, [fp, #-8]
800295a8:	e283300c 	add	r3, r3, #12
800295ac:	e3a02001 	mov	r2, #1
800295b0:	e5832000 	str	r2, [r3]
}
800295b4:	e28bd000 	add	sp, fp, #0
800295b8:	e8bd0800 	pop	{fp}
800295bc:	e12fff1e 	bx	lr

800295c0 <timer_init>:

// initialize the timer: perodical and interrupt based
void timer_init(int hz)
{
800295c0:	e92d4800 	push	{fp, lr}
800295c4:	e28db004 	add	fp, sp, #4
800295c8:	e24dd010 	sub	sp, sp, #16
800295cc:	e50b0010 	str	r0, [fp, #-16]
    volatile uint * timer0 = P2V(TIMER0);
800295d0:	e3a03a01 	mov	r3, #4096	; 0x1000
800295d4:	e3493001 	movt	r3, #36865	; 0x9001
800295d8:	e50b3008 	str	r3, [fp, #-8]

    initlock(&tickslock, "time");
800295dc:	e3000884 	movw	r0, #2180	; 0x884
800295e0:	e348000b 	movt	r0, #32779	; 0x800b
800295e4:	e30a1470 	movw	r1, #42096	; 0xa470
800295e8:	e3481002 	movt	r1, #32770	; 0x8002
800295ec:	ebfff295 	bl	80026048 <initlock>

    timer0[TIMER_LOAD] = CLK_HZ / hz;
800295f0:	e3040240 	movw	r0, #16960	; 0x4240
800295f4:	e340000f 	movt	r0, #15
800295f8:	e51b1010 	ldr	r1, [fp, #-16]
800295fc:	eb00010a 	bl	80029a2c <__aeabi_idiv>
80029600:	e1a03000 	mov	r3, r0
80029604:	e1a02003 	mov	r2, r3
80029608:	e51b3008 	ldr	r3, [fp, #-8]
8002960c:	e5832000 	str	r2, [r3]
    timer0[TIMER_CONTROL] = TIMER_EN|TIMER_PERIODIC|TIMER_32BIT|TIMER_INTEN;
80029610:	e51b3008 	ldr	r3, [fp, #-8]
80029614:	e2833008 	add	r3, r3, #8
80029618:	e3a020e2 	mov	r2, #226	; 0xe2
8002961c:	e5832000 	str	r2, [r3]

    gic_enable (PIC_TIMER01, isr_timer);
80029620:	e3a00022 	mov	r0, #34	; 0x22
80029624:	e3091638 	movw	r1, #38456	; 0x9638
80029628:	e3481002 	movt	r1, #32770	; 0x8002
8002962c:	ebfffe7a 	bl	8002901c <gic_enable>
}
80029630:	e24bd004 	sub	sp, fp, #4
80029634:	e8bd8800 	pop	{fp, pc}

80029638 <isr_timer>:

// interrupt service routine for the timer
void isr_timer (struct trapframe *tp, int irq_idx)
{
80029638:	e92d4800 	push	{fp, lr}
8002963c:	e28db004 	add	fp, sp, #4
80029640:	e24dd008 	sub	sp, sp, #8
80029644:	e50b0008 	str	r0, [fp, #-8]
80029648:	e50b100c 	str	r1, [fp, #-12]
    acquire(&tickslock);
8002964c:	e3000884 	movw	r0, #2180	; 0x884
80029650:	e348000b 	movt	r0, #32779	; 0x800b
80029654:	ebfff28c 	bl	8002608c <acquire>
    ticks++;
80029658:	e30038b8 	movw	r3, #2232	; 0x8b8
8002965c:	e348300b 	movt	r3, #32779	; 0x800b
80029660:	e5933000 	ldr	r3, [r3]
80029664:	e2832001 	add	r2, r3, #1
80029668:	e30038b8 	movw	r3, #2232	; 0x8b8
8002966c:	e348300b 	movt	r3, #32779	; 0x800b
80029670:	e5832000 	str	r2, [r3]
    wakeup(&ticks);
80029674:	e30008b8 	movw	r0, #2232	; 0x8b8
80029678:	e348000b 	movt	r0, #32779	; 0x800b
8002967c:	ebfff1f3 	bl	80025e50 <wakeup>
    release(&tickslock);
80029680:	e3000884 	movw	r0, #2180	; 0x884
80029684:	e348000b 	movt	r0, #32779	; 0x800b
80029688:	ebfff289 	bl	800260b4 <release>
    ack_timer();
8002968c:	ebffffbe 	bl	8002958c <ack_timer>
}
80029690:	e24bd004 	sub	sp, fp, #4
80029694:	e8bd8800 	pop	{fp, pc}

80029698 <micro_delay>:

// a short delay, use timer 1 as the source
void micro_delay (int us)
{
80029698:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
8002969c:	e28db000 	add	fp, sp, #0
800296a0:	e24dd014 	sub	sp, sp, #20
800296a4:	e50b0010 	str	r0, [fp, #-16]
    volatile uint * timer1 = P2V(TIMER1);
800296a8:	e3013020 	movw	r3, #4128	; 0x1020
800296ac:	e3493001 	movt	r3, #36865	; 0x9001
800296b0:	e50b3008 	str	r3, [fp, #-8]

    // load the initial value to timer1, and configure it to be freerun
    timer1[TIMER_CONTROL] = TIMER_EN | TIMER_32BIT;
800296b4:	e51b3008 	ldr	r3, [fp, #-8]
800296b8:	e2833008 	add	r3, r3, #8
800296bc:	e3a02082 	mov	r2, #130	; 0x82
800296c0:	e5832000 	str	r2, [r3]
    timer1[TIMER_LOAD] = us;
800296c4:	e51b2010 	ldr	r2, [fp, #-16]
800296c8:	e51b3008 	ldr	r3, [fp, #-8]
800296cc:	e5832000 	str	r2, [r3]

    // the register will wrap to 0xFFFFFFFF after decrement to 0
    while ((int)timer1[TIMER_CURVAL] > 0) {
800296d0:	e1a00000 	nop			; (mov r0, r0)
800296d4:	e51b3008 	ldr	r3, [fp, #-8]
800296d8:	e2833004 	add	r3, r3, #4
800296dc:	e5933000 	ldr	r3, [r3]
800296e0:	e3530000 	cmp	r3, #0
800296e4:	cafffffa 	bgt	800296d4 <micro_delay+0x3c>

    }

    // disable timer
    timer1[TIMER_CONTROL] = 0;
800296e8:	e51b3008 	ldr	r3, [fp, #-8]
800296ec:	e2833008 	add	r3, r3, #8
800296f0:	e3a02000 	mov	r2, #0
800296f4:	e5832000 	str	r2, [r3]
}
800296f8:	e28bd000 	add	sp, fp, #0
800296fc:	e8bd0800 	pop	{fp}
80029700:	e12fff1e 	bx	lr

80029704 <uart_init>:
#define UART_TXI	(1 << 5)	// transmit interrupt
#define UART_BITRATE 19200

// enable uart
void uart_init (void *addr)
{
80029704:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
80029708:	e28db000 	add	fp, sp, #0
8002970c:	e24dd014 	sub	sp, sp, #20
80029710:	e50b0010 	str	r0, [fp, #-16]
    uint left;

    uart_base = addr;
80029714:	e30038bc 	movw	r3, #2236	; 0x8bc
80029718:	e348300b 	movt	r3, #32779	; 0x800b
8002971c:	e51b2010 	ldr	r2, [fp, #-16]
80029720:	e5832000 	str	r2, [r3]

    // set the bit rate: integer/fractional baud rate registers
    uart_base[UART_IBRD] = UART_CLK / (16 * UART_BITRATE);
80029724:	e30038bc 	movw	r3, #2236	; 0x8bc
80029728:	e348300b 	movt	r3, #32779	; 0x800b
8002972c:	e5933000 	ldr	r3, [r3]
80029730:	e2833024 	add	r3, r3, #36	; 0x24
80029734:	e3a0204e 	mov	r2, #78	; 0x4e
80029738:	e5832000 	str	r2, [r3]

    left = UART_CLK % (16 * UART_BITRATE);
8002973c:	e3a03c96 	mov	r3, #38400	; 0x9600
80029740:	e50b3008 	str	r3, [fp, #-8]
    uart_base[UART_FBRD] = (left * 4 + UART_BITRATE / 2) / UART_BITRATE;
80029744:	e30038bc 	movw	r3, #2236	; 0x8bc
80029748:	e348300b 	movt	r3, #32779	; 0x800b
8002974c:	e5933000 	ldr	r3, [r3]
80029750:	e2832028 	add	r2, r3, #40	; 0x28
80029754:	e51b3008 	ldr	r3, [fp, #-8]
80029758:	e2833e96 	add	r3, r3, #2400	; 0x960
8002975c:	e1a01103 	lsl	r1, r3, #2
80029760:	e30831b5 	movw	r3, #33205	; 0x81b5
80029764:	e3413b4e 	movt	r3, #6990	; 0x1b4e
80029768:	e0830193 	umull	r0, r3, r3, r1
8002976c:	e1a035a3 	lsr	r3, r3, #11
80029770:	e5823000 	str	r3, [r2]

    // enable trasmit and receive
    uart_base[UART_CR] |= (UARTCR_EN | UARTCR_RXE | UARTCR_TXE);
80029774:	e30038bc 	movw	r3, #2236	; 0x8bc
80029778:	e348300b 	movt	r3, #32779	; 0x800b
8002977c:	e5933000 	ldr	r3, [r3]
80029780:	e2832030 	add	r2, r3, #48	; 0x30
80029784:	e30038bc 	movw	r3, #2236	; 0x8bc
80029788:	e348300b 	movt	r3, #32779	; 0x800b
8002978c:	e5933000 	ldr	r3, [r3]
80029790:	e2833030 	add	r3, r3, #48	; 0x30
80029794:	e5933000 	ldr	r3, [r3]
80029798:	e3833c03 	orr	r3, r3, #768	; 0x300
8002979c:	e3833001 	orr	r3, r3, #1
800297a0:	e5823000 	str	r3, [r2]

    // enable FIFO
    uart_base[UART_LCR] |= UARTLCR_FEN;
800297a4:	e30038bc 	movw	r3, #2236	; 0x8bc
800297a8:	e348300b 	movt	r3, #32779	; 0x800b
800297ac:	e5933000 	ldr	r3, [r3]
800297b0:	e283202c 	add	r2, r3, #44	; 0x2c
800297b4:	e30038bc 	movw	r3, #2236	; 0x8bc
800297b8:	e348300b 	movt	r3, #32779	; 0x800b
800297bc:	e5933000 	ldr	r3, [r3]
800297c0:	e283302c 	add	r3, r3, #44	; 0x2c
800297c4:	e5933000 	ldr	r3, [r3]
800297c8:	e3833010 	orr	r3, r3, #16
800297cc:	e5823000 	str	r3, [r2]
}
800297d0:	e28bd000 	add	sp, fp, #0
800297d4:	e8bd0800 	pop	{fp}
800297d8:	e12fff1e 	bx	lr

800297dc <uart_enable_rx>:

// enable the receive (interrupt) for uart (after PIC has initialized)
void uart_enable_rx ()
{
800297dc:	e92d4800 	push	{fp, lr}
800297e0:	e28db004 	add	fp, sp, #4
    uart_base[UART_IMSC] = UART_RXI;
800297e4:	e30038bc 	movw	r3, #2236	; 0x8bc
800297e8:	e348300b 	movt	r3, #32779	; 0x800b
800297ec:	e5933000 	ldr	r3, [r3]
800297f0:	e2833038 	add	r3, r3, #56	; 0x38
800297f4:	e3a02010 	mov	r2, #16
800297f8:	e5832000 	str	r2, [r3]
    gic_enable(PIC_UART0, isr_uart);
800297fc:	e3a00025 	mov	r0, #37	; 0x25
80029800:	e30918b8 	movw	r1, #39096	; 0x98b8
80029804:	e3481002 	movt	r1, #32770	; 0x8002
80029808:	ebfffe03 	bl	8002901c <gic_enable>
}
8002980c:	e8bd8800 	pop	{fp, pc}

80029810 <uartputc>:

void uartputc (int c)
{
80029810:	e92d4800 	push	{fp, lr}
80029814:	e28db004 	add	fp, sp, #4
80029818:	e24dd008 	sub	sp, sp, #8
8002981c:	e50b0008 	str	r0, [fp, #-8]
    // wait a short period if the transmit FIFO is full
    while (uart_base[UART_FR] & UARTFR_TXFF) {
80029820:	ea000001 	b	8002982c <uartputc+0x1c>
        micro_delay(10);
80029824:	e3a0000a 	mov	r0, #10
80029828:	ebffff9a 	bl	80029698 <micro_delay>
}

void uartputc (int c)
{
    // wait a short period if the transmit FIFO is full
    while (uart_base[UART_FR] & UARTFR_TXFF) {
8002982c:	e30038bc 	movw	r3, #2236	; 0x8bc
80029830:	e348300b 	movt	r3, #32779	; 0x800b
80029834:	e5933000 	ldr	r3, [r3]
80029838:	e2833018 	add	r3, r3, #24
8002983c:	e5933000 	ldr	r3, [r3]
80029840:	e2033020 	and	r3, r3, #32
80029844:	e3530000 	cmp	r3, #0
80029848:	1afffff5 	bne	80029824 <uartputc+0x14>
        micro_delay(10);
    }

    uart_base[UART_DR] = c;
8002984c:	e30038bc 	movw	r3, #2236	; 0x8bc
80029850:	e348300b 	movt	r3, #32779	; 0x800b
80029854:	e5933000 	ldr	r3, [r3]
80029858:	e51b2008 	ldr	r2, [fp, #-8]
8002985c:	e5832000 	str	r2, [r3]
}
80029860:	e24bd004 	sub	sp, fp, #4
80029864:	e8bd8800 	pop	{fp, pc}

80029868 <uartgetc>:

//poll the UART for data
int uartgetc (void)
{
80029868:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
8002986c:	e28db000 	add	fp, sp, #0
    if (uart_base[UART_FR] & UARTFR_RXFE) {
80029870:	e30038bc 	movw	r3, #2236	; 0x8bc
80029874:	e348300b 	movt	r3, #32779	; 0x800b
80029878:	e5933000 	ldr	r3, [r3]
8002987c:	e2833018 	add	r3, r3, #24
80029880:	e5933000 	ldr	r3, [r3]
80029884:	e2033010 	and	r3, r3, #16
80029888:	e3530000 	cmp	r3, #0
8002988c:	0a000001 	beq	80029898 <uartgetc+0x30>
        return -1;
80029890:	e3e03000 	mvn	r3, #0
80029894:	ea000003 	b	800298a8 <uartgetc+0x40>
    }

    return uart_base[UART_DR];
80029898:	e30038bc 	movw	r3, #2236	; 0x8bc
8002989c:	e348300b 	movt	r3, #32779	; 0x800b
800298a0:	e5933000 	ldr	r3, [r3]
800298a4:	e5933000 	ldr	r3, [r3]
}
800298a8:	e1a00003 	mov	r0, r3
800298ac:	e28bd000 	add	sp, fp, #0
800298b0:	e8bd0800 	pop	{fp}
800298b4:	e12fff1e 	bx	lr

800298b8 <isr_uart>:

void isr_uart (struct trapframe *tf, int idx)
{
800298b8:	e92d4800 	push	{fp, lr}
800298bc:	e28db004 	add	fp, sp, #4
800298c0:	e24dd008 	sub	sp, sp, #8
800298c4:	e50b0008 	str	r0, [fp, #-8]
800298c8:	e50b100c 	str	r1, [fp, #-12]
    if (uart_base[UART_MIS] & UART_RXI) {
800298cc:	e30038bc 	movw	r3, #2236	; 0x8bc
800298d0:	e348300b 	movt	r3, #32779	; 0x800b
800298d4:	e5933000 	ldr	r3, [r3]
800298d8:	e2833040 	add	r3, r3, #64	; 0x40
800298dc:	e5933000 	ldr	r3, [r3]
800298e0:	e2033010 	and	r3, r3, #16
800298e4:	e3530000 	cmp	r3, #0
800298e8:	0a000002 	beq	800298f8 <isr_uart+0x40>
        consoleintr(uartgetc);
800298ec:	e3090868 	movw	r0, #39016	; 0x9868
800298f0:	e3480002 	movt	r0, #32770	; 0x8002
800298f4:	ebffe0e1 	bl	80021c80 <consoleintr>
    }

    // clear the interrupt
    uart_base[UART_ICR] = UART_RXI | UART_TXI;
800298f8:	e30038bc 	movw	r3, #2236	; 0x8bc
800298fc:	e348300b 	movt	r3, #32779	; 0x800b
80029900:	e5933000 	ldr	r3, [r3]
80029904:	e2833044 	add	r3, r3, #68	; 0x44
80029908:	e3a02030 	mov	r2, #48	; 0x30
8002990c:	e5832000 	str	r2, [r3]
}
80029910:	e24bd004 	sub	sp, fp, #4
80029914:	e8bd8800 	pop	{fp, pc}

80029918 <__aeabi_uidiv>:
80029918:	e2512001 	subs	r2, r1, #1
8002991c:	012fff1e 	bxeq	lr
80029920:	3a000036 	bcc	80029a00 <__aeabi_uidiv+0xe8>
80029924:	e1500001 	cmp	r0, r1
80029928:	9a000022 	bls	800299b8 <__aeabi_uidiv+0xa0>
8002992c:	e1110002 	tst	r1, r2
80029930:	0a000023 	beq	800299c4 <__aeabi_uidiv+0xac>
80029934:	e311020e 	tst	r1, #-536870912	; 0xe0000000
80029938:	01a01181 	lsleq	r1, r1, #3
8002993c:	03a03008 	moveq	r3, #8
80029940:	13a03001 	movne	r3, #1
80029944:	e3510201 	cmp	r1, #268435456	; 0x10000000
80029948:	31510000 	cmpcc	r1, r0
8002994c:	31a01201 	lslcc	r1, r1, #4
80029950:	31a03203 	lslcc	r3, r3, #4
80029954:	3afffffa 	bcc	80029944 <__aeabi_uidiv+0x2c>
80029958:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
8002995c:	31510000 	cmpcc	r1, r0
80029960:	31a01081 	lslcc	r1, r1, #1
80029964:	31a03083 	lslcc	r3, r3, #1
80029968:	3afffffa 	bcc	80029958 <__aeabi_uidiv+0x40>
8002996c:	e3a02000 	mov	r2, #0
80029970:	e1500001 	cmp	r0, r1
80029974:	20400001 	subcs	r0, r0, r1
80029978:	21822003 	orrcs	r2, r2, r3
8002997c:	e15000a1 	cmp	r0, r1, lsr #1
80029980:	204000a1 	subcs	r0, r0, r1, lsr #1
80029984:	218220a3 	orrcs	r2, r2, r3, lsr #1
80029988:	e1500121 	cmp	r0, r1, lsr #2
8002998c:	20400121 	subcs	r0, r0, r1, lsr #2
80029990:	21822123 	orrcs	r2, r2, r3, lsr #2
80029994:	e15001a1 	cmp	r0, r1, lsr #3
80029998:	204001a1 	subcs	r0, r0, r1, lsr #3
8002999c:	218221a3 	orrcs	r2, r2, r3, lsr #3
800299a0:	e3500000 	cmp	r0, #0
800299a4:	11b03223 	lsrsne	r3, r3, #4
800299a8:	11a01221 	lsrne	r1, r1, #4
800299ac:	1affffef 	bne	80029970 <__aeabi_uidiv+0x58>
800299b0:	e1a00002 	mov	r0, r2
800299b4:	e12fff1e 	bx	lr
800299b8:	03a00001 	moveq	r0, #1
800299bc:	13a00000 	movne	r0, #0
800299c0:	e12fff1e 	bx	lr
800299c4:	e3510801 	cmp	r1, #65536	; 0x10000
800299c8:	21a01821 	lsrcs	r1, r1, #16
800299cc:	23a02010 	movcs	r2, #16
800299d0:	33a02000 	movcc	r2, #0
800299d4:	e3510c01 	cmp	r1, #256	; 0x100
800299d8:	21a01421 	lsrcs	r1, r1, #8
800299dc:	22822008 	addcs	r2, r2, #8
800299e0:	e3510010 	cmp	r1, #16
800299e4:	21a01221 	lsrcs	r1, r1, #4
800299e8:	22822004 	addcs	r2, r2, #4
800299ec:	e3510004 	cmp	r1, #4
800299f0:	82822003 	addhi	r2, r2, #3
800299f4:	908220a1 	addls	r2, r2, r1, lsr #1
800299f8:	e1a00230 	lsr	r0, r0, r2
800299fc:	e12fff1e 	bx	lr
80029a00:	e3500000 	cmp	r0, #0
80029a04:	13e00000 	mvnne	r0, #0
80029a08:	ea000059 	b	80029b74 <__aeabi_idiv0>

80029a0c <__aeabi_uidivmod>:
80029a0c:	e3510000 	cmp	r1, #0
80029a10:	0afffffa 	beq	80029a00 <__aeabi_uidiv+0xe8>
80029a14:	e92d4003 	push	{r0, r1, lr}
80029a18:	ebffffbe 	bl	80029918 <__aeabi_uidiv>
80029a1c:	e8bd4006 	pop	{r1, r2, lr}
80029a20:	e0030092 	mul	r3, r2, r0
80029a24:	e0411003 	sub	r1, r1, r3
80029a28:	e12fff1e 	bx	lr

80029a2c <__aeabi_idiv>:
80029a2c:	e3510000 	cmp	r1, #0
80029a30:	0a000043 	beq	80029b44 <.divsi3_skip_div0_test+0x110>

80029a34 <.divsi3_skip_div0_test>:
80029a34:	e020c001 	eor	ip, r0, r1
80029a38:	42611000 	rsbmi	r1, r1, #0
80029a3c:	e2512001 	subs	r2, r1, #1
80029a40:	0a000027 	beq	80029ae4 <.divsi3_skip_div0_test+0xb0>
80029a44:	e1b03000 	movs	r3, r0
80029a48:	42603000 	rsbmi	r3, r0, #0
80029a4c:	e1530001 	cmp	r3, r1
80029a50:	9a000026 	bls	80029af0 <.divsi3_skip_div0_test+0xbc>
80029a54:	e1110002 	tst	r1, r2
80029a58:	0a000028 	beq	80029b00 <.divsi3_skip_div0_test+0xcc>
80029a5c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
80029a60:	01a01181 	lsleq	r1, r1, #3
80029a64:	03a02008 	moveq	r2, #8
80029a68:	13a02001 	movne	r2, #1
80029a6c:	e3510201 	cmp	r1, #268435456	; 0x10000000
80029a70:	31510003 	cmpcc	r1, r3
80029a74:	31a01201 	lslcc	r1, r1, #4
80029a78:	31a02202 	lslcc	r2, r2, #4
80029a7c:	3afffffa 	bcc	80029a6c <.divsi3_skip_div0_test+0x38>
80029a80:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
80029a84:	31510003 	cmpcc	r1, r3
80029a88:	31a01081 	lslcc	r1, r1, #1
80029a8c:	31a02082 	lslcc	r2, r2, #1
80029a90:	3afffffa 	bcc	80029a80 <.divsi3_skip_div0_test+0x4c>
80029a94:	e3a00000 	mov	r0, #0
80029a98:	e1530001 	cmp	r3, r1
80029a9c:	20433001 	subcs	r3, r3, r1
80029aa0:	21800002 	orrcs	r0, r0, r2
80029aa4:	e15300a1 	cmp	r3, r1, lsr #1
80029aa8:	204330a1 	subcs	r3, r3, r1, lsr #1
80029aac:	218000a2 	orrcs	r0, r0, r2, lsr #1
80029ab0:	e1530121 	cmp	r3, r1, lsr #2
80029ab4:	20433121 	subcs	r3, r3, r1, lsr #2
80029ab8:	21800122 	orrcs	r0, r0, r2, lsr #2
80029abc:	e15301a1 	cmp	r3, r1, lsr #3
80029ac0:	204331a1 	subcs	r3, r3, r1, lsr #3
80029ac4:	218001a2 	orrcs	r0, r0, r2, lsr #3
80029ac8:	e3530000 	cmp	r3, #0
80029acc:	11b02222 	lsrsne	r2, r2, #4
80029ad0:	11a01221 	lsrne	r1, r1, #4
80029ad4:	1affffef 	bne	80029a98 <.divsi3_skip_div0_test+0x64>
80029ad8:	e35c0000 	cmp	ip, #0
80029adc:	42600000 	rsbmi	r0, r0, #0
80029ae0:	e12fff1e 	bx	lr
80029ae4:	e13c0000 	teq	ip, r0
80029ae8:	42600000 	rsbmi	r0, r0, #0
80029aec:	e12fff1e 	bx	lr
80029af0:	33a00000 	movcc	r0, #0
80029af4:	01a00fcc 	asreq	r0, ip, #31
80029af8:	03800001 	orreq	r0, r0, #1
80029afc:	e12fff1e 	bx	lr
80029b00:	e3510801 	cmp	r1, #65536	; 0x10000
80029b04:	21a01821 	lsrcs	r1, r1, #16
80029b08:	23a02010 	movcs	r2, #16
80029b0c:	33a02000 	movcc	r2, #0
80029b10:	e3510c01 	cmp	r1, #256	; 0x100
80029b14:	21a01421 	lsrcs	r1, r1, #8
80029b18:	22822008 	addcs	r2, r2, #8
80029b1c:	e3510010 	cmp	r1, #16
80029b20:	21a01221 	lsrcs	r1, r1, #4
80029b24:	22822004 	addcs	r2, r2, #4
80029b28:	e3510004 	cmp	r1, #4
80029b2c:	82822003 	addhi	r2, r2, #3
80029b30:	908220a1 	addls	r2, r2, r1, lsr #1
80029b34:	e35c0000 	cmp	ip, #0
80029b38:	e1a00233 	lsr	r0, r3, r2
80029b3c:	42600000 	rsbmi	r0, r0, #0
80029b40:	e12fff1e 	bx	lr
80029b44:	e3500000 	cmp	r0, #0
80029b48:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
80029b4c:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
80029b50:	ea000007 	b	80029b74 <__aeabi_idiv0>

80029b54 <__aeabi_idivmod>:
80029b54:	e3510000 	cmp	r1, #0
80029b58:	0afffff9 	beq	80029b44 <.divsi3_skip_div0_test+0x110>
80029b5c:	e92d4003 	push	{r0, r1, lr}
80029b60:	ebffffb3 	bl	80029a34 <.divsi3_skip_div0_test>
80029b64:	e8bd4006 	pop	{r1, r2, lr}
80029b68:	e0030092 	mul	r3, r2, r0
80029b6c:	e0411003 	sub	r1, r1, r3
80029b70:	e12fff1e 	bx	lr

80029b74 <__aeabi_idiv0>:
80029b74:	e12fff1e 	bx	lr
