// BSP support routine
#include "types.h"
#include "defs.h"
#include "param.h"
#include "arm.h"
#include "proc.h"
#include "memlayout.h"
#include "mmu.h"

extern void* end;

struct cpu	cpus[NCPU];
struct cpu	*cpu;

#define MB (1024*1024)

void kmain (void)
{
    uint vectbl;

    cpu = &cpus[0];

    uart_init (P2V(UART0));

    // interrrupt vector table is in the middle of first 1MB. We use the left
    // over for page tables

    /* xzl: vector table has dual mapping.
     * one in the kernel's 1MB, vaddr starting at 0x8000:0000.
     * one in the section, vaddr starting at 0xfff0:0000.
     * in both place, the offset within the section is 0xf:0000.
     * every PDE is 1MB. */

    vectbl = P2V_WO (VEC_TBL & PDE_MASK);

    init_vmm ();
    kpt_freerange (align_up(&end, PT_SZ), vectbl);
    kpt_freerange (vectbl + PT_SZ, P2V_WO(INIT_KERNMAP));
    paging_init (INIT_KERNMAP, PHYSTOP);

    kmem_init ();
    kmem_init2(P2V(INIT_KERNMAP), P2V(PHYSTOP));

    trap_init ();				// vector table and stacks for models
    gic_init (P2V(PERI_BASE));	// interrupt controller
    uart_enable_rx ();			// interrupt for uart
    consoleinit ();				// console
    pinit ();					// process (locks)

    binit ();					// buffer cache
    fileinit ();				// file table
    iinit ();					// inode cache
    ideinit ();					// ide (memory block device)
    timer_init (HZ);			// the timer (ticker)


    sti ();

    userinit();					// first user process
    scheduler();				// start running processes
}
