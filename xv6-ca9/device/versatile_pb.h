//
// Board specific information for the VersatilePB board
//
#ifndef VERSATILEPB
#define VERSATILEPB


// the VerstatilePB board can support up to 256MB memory.
// but we assume it has 128MB instead. During boot, the lower
// 64MB memory is mapped to the flash, needs to be remapped
// the the SDRAM. We skip this for QEMU
#define PHYSTOP         0x04000000
#define BSP_MEMREMAP    0x04000000

#define DEVBASE         0x10000000
#define DEV_MEM_SZ      0x0f000000
#define VEC_TBL         0xFFFF0000


#define STACK_FILL      0xdeadbeef

//#define UART0           0x101f1000
#define UART0			0x10009000	// xzl: on vexpress
#define UART_CLK        24000000    // Clock rate for UART

/* xzl: sp804, also present on vexpress. see ellc arm_sp804.h */
#define TIMER0          0x10011000
#define TIMER1          0x10011020
#define CLK_HZ          1000000     // the clock is 1MHZ

/* xzl: interrupt defs. see
 * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0447j/index.html
 */
#define VIC_BASE        0x10140000
#define PIC_TIMER01     (2 + 32)
#define PIC_TIMER23     (3 + 32)
//#define PIC_UART0       12
#define PIC_UART0       (5 + 32)
#define PIC_GRAPHIC     19

/* xzl */
#define PERI_BASE		0x1e000000	/* core peripheral base phys */

#endif
