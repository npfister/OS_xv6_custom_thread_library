#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "arm.h"
#include "proc.h"
#include "spinlock.h"

//
// Process initialization:
// process initialize is somewhat tricky.
//  1. We need to fake the kernel stack of a new process as if the process
//     has been interrupt (a trapframe on the stack), this would allow us
//     to "return" to the correct user instruction.
//  2. We also need to fake the kernel execution for this new process. When
//     swtch switches to this (new) process, it will switch to its stack,
//     and reload registers with the saved context. We use forkret as the
//     return address (in lr register). (In x86, it will be the return address
//     pushed on the stack by the process.)
//
// The design of context switch in xv6 is interesting: after initialization,
// each CPU executes in the scheduler() function. The context switch is not
// between two processes, but instead, between the scheduler. Think of scheduler
// as the idle process.
//
struct {
    struct spinlock lock;
    struct proc proc[NPROC];
} ptable;

static struct proc *initproc;
struct proc *proc;

int nextpid = 1;
int nexttid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void pinit(void)
{
    initlock(&ptable.lock, "ptable");
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc* allocproc(void)
{
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if(p->state == UNUSED) {
            goto found;
        }

    }

    release(&ptable.lock);
    return 0;

    found:
    p->state = EMBRYO;
    p->pid = nextpid++;
    release(&ptable.lock);

    // Allocate kernel stack.
    if((p->kstack = alloc_page ()) == 0){
        p->state = UNUSED;
        return 0;
    }

    sp = p->kstack + KSTACKSIZE;

    // Leave room for trap frame.
    sp -= sizeof (*p->tf);
    p->tf = (struct trapframe*)sp;

    // Set up new context to start executing at forkret,
    // which returns to trapret.
    sp -= 4;
    *(uint*)sp = (uint)trapret;

    sp -= 4;
    *(uint*)sp = (uint)p->kstack + KSTACKSIZE;

    sp -= sizeof (*p->context);
    p->context = (struct context*)sp;
    memset(p->context, 0, sizeof(*p->context));

    // skip the push {fp, lr} instruction in the prologue of forkret.
    // This is different from x86, in which the harderware pushes return
    // address before executing the callee. In ARM, return address is
    // loaded into the lr register, and push to the stack by the callee
    // (if and when necessary). We need to skip that instruction and let
    // it use our implementation.
    p->context->lr = (uint)forkret+4;

    return p;
}

void error_init ()
{
    panic ("failed to craft first process\n");
}


//PAGEBREAK: 32
// hand-craft the first user process. We link initcode.S into the kernel
// as a binary, the linker will generate __binary_initcode_start/_size
void userinit(void)
{
    struct proc *p;
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
    initproc = p;

    if((p->pgdir = kpt_alloc()) == NULL) {
        panic("userinit: out of memory?");
    }

    inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);

    p->sz = PTE_SZ;

    // craft the trapframe as if
    memset(p->tf, 0, sizeof(*p->tf));

    p->tf->r14_svc = (uint)error_init;
    p->tf->spsr = spsr_usr ();
    p->tf->sp_usr = PTE_SZ;	// set the user stack
    p->tf->lr_usr = 0;

    // set the user pc. The actual pc loaded into r15_usr is in
    // p->tf, the trapframe.
    p->tf->pc = 0;					// beginning of initcode.S

    safestrcpy(p->name, "initcode", sizeof(p->name));
    p->cwd = namei("/");

    p->state = RUNNABLE;
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
    uint sz;

    sz = proc->sz;

    if(n > 0){
        if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0) {
            return -1;
        }

    } else if(n < 0){
        if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0) {
            return -1;
        }
    }

    proc->sz = sz;
    switchuvm(proc);

    return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int fork(void)
{
    int i, pid;
    struct proc *np;

    // Allocate process.
    if((np = allocproc()) == 0) {
        return -1;
    }

    // Copy process state from p.
    if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
        free_page(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
    }

    np->sz = proc->sz;
    np->parent = proc;
    *np->tf = *proc->tf;

    // Clear r0 so that fork returns 0 in the child.
    np->tf->r0 = 0;

    for(i = 0; i < NOFILE; i++) {
        if(proc->ofile[i]) {
            np->ofile[i] = filedup(proc->ofile[i]);
        }
    }

    np->cwd = idup(proc->cwd);

    pid = np->pid;
    np->state = RUNNABLE;
    safestrcpy(np->name, proc->name, sizeof(proc->name));

    return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(void)
{
    struct proc *p;
    int fd;

    if(proc == initproc) {
        panic("init exiting");
    }

    // Close all open files.
    for(fd = 0; fd < NOFILE; fd++){
        if(proc->ofile[fd]){
            fileclose(proc->ofile[fd]);
            proc->ofile[fd] = 0;
        }
    }

    iput(proc->cwd);
    proc->cwd = 0;

    acquire(&ptable.lock);

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p->parent == proc){
            p->parent = initproc;

            if(p->state == ZOMBIE) {
                wakeup1(initproc);
            }
        }
    }

    // Jump into the scheduler, never to return.
    proc->state = ZOMBIE;
    sched();

    panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(void)
{
    struct proc *p;
    int havekids, pid;

    acquire(&ptable.lock);

    for(;;){
        // Scan through table looking for zombie children.
        havekids = 0;

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
            if(p->parent != proc) {
                continue;
            }

            havekids = 1;

            if(p->state == ZOMBIE){
                cprintf("Found a zombie: pid: %d, tid: %d\n", p->pid, p->tid);
                // Found one.
                pid = p->pid;
                free_page(p->kstack);
                p->kstack = 0;
                freevm(p->pgdir);
                p->state = UNUSED;
                p->pid = 0;
                p->parent = 0;
                p->name[0] = 0;
                p->killed = 0;
                release(&ptable.lock);

                return pid;
            }
        }

        // No point waiting if we don't have any children.
        if(!havekids || proc->killed){
            release(&ptable.lock);
            return -1;
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock);  //DOC: wait-sleep
    }
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void scheduler(void)
{
    struct proc *p;

    for(;;){
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
            if(p->state != RUNNABLE) {
                continue;
            }

            // Switch to chosen process.  It is the process's job
            // to release ptable.lock and then reacquire it
            // before jumping back to us.
            proc = p;
            switchuvm(p);

            p->state = RUNNING;

            swtch(&cpu->scheduler, proc->context);
            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
        }

        release(&ptable.lock);
    }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.
void sched(void)
{
    int intena;

    //show_callstk ("sched");

    if(!holding(&ptable.lock)) {
        panic("sched ptable.lock");
    }

    if(cpu->ncli != 1) {
        panic("sched locks");
    }

    if(proc->state == RUNNING) {
        panic("sched running");
    }

    if(int_enabled ()) {
        panic("sched interruptible");
    }

    intena = cpu->intena;
    swtch(&proc->context, cpu->scheduler);
    cpu->intena = intena;
}

// Give up the CPU for one scheduling round.
void yield(void)
{
    acquire(&ptable.lock);  //DOC: yieldlock
    proc->state = RUNNABLE;
    sched();
    release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
    static int first = 1;

    // Still holding ptable.lock from scheduler.
    release(&ptable.lock);

    if (first) {
        // Some initialization functions must be run in the context
        // of a regular process (e.g., they call sleep), and thus cannot
        // be run from main().
        first = 0;
        initlog();
    }

    // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
    //show_callstk("sleep");

    if(proc == 0) {
        panic("sleep");
    }

    if(lk == 0) {
        panic("sleep without lk");
    }

    // Must acquire ptable.lock in order to change p->state and then call
    // sched. Once we hold ptable.lock, we can be guaranteed that we won't
    // miss any wakeup (wakeup runs with ptable.lock locked), so it's okay
    // to release lk.
    if(lk != &ptable.lock){  //DOC: sleeplock0
        acquire(&ptable.lock);  //DOC: sleeplock1
        release(lk);
    }

    // Go to sleep.
    proc->chan = chan;
    proc->state = SLEEPING;
    sched();

    // Tidy up.
    proc->chan = 0;

    // Reacquire original lock.
    if(lk != &ptable.lock){  //DOC: sleeplock2
        release(&ptable.lock);
        acquire(lk);
    }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan. The ptable lock must be held.
static void wakeup1(void *chan)
{
    struct proc *p;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if(p->state == SLEEPING && p->chan == chan) {
            p->state = RUNNABLE;
        }
    }
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
    acquire(&ptable.lock);
    wakeup1(chan);
    release(&ptable.lock);
}

// Kill the process with the given pid. Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
    struct proc *p;

    acquire(&ptable.lock);

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p->pid == pid){
            p->killed = 1;

            // Wake process from sleep if necessary.
            if(p->state == SLEEPING) {
                p->state = RUNNABLE;
            }

            release(&ptable.lock);
            return 0;
        }
    }

    release(&ptable.lock);
    return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging. Runs when user
// types ^P on console. No lock to avoid wedging a stuck machine further.
void procdump(void)
{
    static char *states[] = {
            [UNUSED]    "unused",
            [EMBRYO]    "embryo",
            [SLEEPING]  "sleep ",
            [RUNNABLE]  "runble",
            [RUNNING]   "run   ",
            [ZOMBIE]    "zombie"
    };

    struct proc *p;
    char *state;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p->state == UNUSED) {
            continue;
        }

        if(p->state >= 0 && p->state < NELEM(states) && states[p->state]) {
            state = states[p->state];
        } else {
            state = "???";
        }

        cprintf("%d %s %s\n", p->pid, state, p->name);
    }

    show_callstk("procdump: \n");
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int kthread_create(void *(*start_func)(void) )
{   
    int i;
    struct proc *np; //new thread
    //void *stackRet;
     
    // Allocate process.
    if((np = allocproc()) == 0) {
        return -1;
    }

    
    // Copy process state from p.
    if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
        free_page(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
	}
    np->pgdir = proc->pgdir;//threads share page tables
    
    
    // Copy process stack from parent
    /*
    if(copyout(proc->pgdir, *np->kstack, proc->kstack, KSTACKSIZE) != 0){
        free_page(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
    }*/

    //cprintf ("Stack bottom:     %x, Stack ptr: %x\n", np->kstack, np->tf->sp_usr);
    //cprintf ("Stack top addr:   %x, stack top data: %x\n", 
    //    np->kstack+KSTACKSIZE, *(np->kstack+KSTACKSIZE)); 
    //cprintf ("Stack top-1 addr: %x, stack top-1 data: %x\n",
    //    np->kstack+KSTACKSIZE-sizeof(void*), *(np->kstack+KSTACKSIZE - sizeof(void*)));
    //cprintf ("Stack top-2 addr: %x, stack top-2 data: %x\n",
    //    np->kstack+KSTACKSIZE-2*sizeof(void*), *(np->kstack+KSTACKSIZE - 2*sizeof(void*)));

    // Return value should be set to 0xFFFF FFFF
    //stackRet = np->kstack + KSTACKSIZE - sizeof(void*);
    //cprintf ("Current stackRet: %d\n", *(uint *)stackRet);
    //*(uint *)stackRet = 0xFFFFFFFF;
    //cprintf ("Current stackRet: %d\n", *(uint *)stackRet);

    np->sz = proc->sz;
    np->parent = proc;//all threads in process have the same parent
    *np->tf = *proc->tf;
    np->tid = nexttid++;
    np->pid = np->pid - 1;
    nextpid--;
    
    
    // Clear r0 so that the new thread returns 0 in the child.
    np->tf->r0 = 0;
    
    // Thread should resume execution at the specified start_func
    np->tf->pc = (int) (*start_func);

    for(i = 0; i < NOFILE; i++) {
        if(proc->ofile[i]) {
            np->ofile[i] = filedup(proc->ofile[i]);
        }
    }

    np->cwd = idup(proc->cwd);

    np->state = RUNNABLE;
    safestrcpy(np->name, proc->name, sizeof(proc->name));

    cprintf("Created new thread: pid: %d, tid: %d\n", np->pid, np->tid);
    return np->tid; 
      
}

// Exits a running thread that has a thread ID given by the 
// input parameter
int kthread_join (int thread_id) 
{
    //cprintf("Waiting in kthread_join for tid: %d.\n", thread_id);


    struct proc *p;
    int havekids, pid;

    if (proc->tid != 0) {//it is a child thread. (Only parent can call join)
        
    }


    acquire(&ptable.lock);

    cprintf("Current proc: pid: %d, tid: %d\n", proc->pid, proc->tid);

    for(;;){
        // Scan through table looking for zombie children.
        havekids = 0;

        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
           /* if(p->parent != proc) {
                //cprintf("Parent != proc for pid: %d, tid: %d\n", p->pid, p->tid);
                continue;
            }*/

            if (p->pid != proc->pid) {
                continue;
            }

            if(p->tid != thread_id) {
                continue;
            }

            havekids = 1;

            //cprintf ("\nIn join, found a child with tid: %d, state %d\n", p->tid, p->state);
            if(p->state == ZOMBIE){
                cprintf ("\nIn join, found a ZOMBIE child with tid: %d=%d\n", 
                    p->tid, thread_id);
            
                // Found one.
                pid = p->pid;
                free_page(p->kstack);
                p->kstack = 0;
                //freevm(p->pgdir);
                //p->pgdir = 0;
                p->state = UNUSED;
                p->pid = 0;
                p->parent = 0;
                p->name[0] = 0;
                p->killed = 0;
                release(&ptable.lock);

                return pid;
            }
        }

        // No point waiting if we don't have any children.
        if(!havekids || proc->killed){
            release(&ptable.lock);
            return -1;
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock);  //DOC: wait-sleep
    }
}

//Terminate the current thread
int kthread_exit (void)
{
    struct proc *p;
    acquire(&ptable.lock);

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p == proc){
            p->killed = 1;
            p->state = ZOMBIE;
            cprintf ("Killed thread (%d, %d)\n", p->pid, p->tid);
            
            release(&ptable.lock);
            wakeup(p->parent);
            
            acquire(&ptable.lock);
            sched();
            release(&ptable.lock);
            return 0;
        }
    }

    release(&ptable.lock);
    return -1;
}