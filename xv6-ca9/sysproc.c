#include "types.h"
#include "arm.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int sys_kthread_create(void)
{   
    //get pointer for start function
    int pc;
    argint (0, &pc);

    return kthread_create((void*) pc);
}

int sys_kthread_join(void)
{
    //get thread ID from arguments
    int thread_id;
    argint (0, &thread_id);
    return kthread_join (thread_id);
}

int sys_kthread_cond_signal(void)
{
    int cond_id;
    argint(0, &cond_id);
    return kthread_cond_signal(cond_id);
}

int sys_kthread_cond_wait(void)
{
    int cond_id;
    argint(0, &cond_id);
    return kthread_cond_wait(cond_id);
}

int sys_kthread_exit(void)
{
    return kthread_exit();
}

int sys_fork(void)
{
    return fork();
}

int sys_exit(void)
{
    exit();
    return 0;  // not reached
}

int sys_wait(void)
{
    return wait();
}

int sys_kill(void)
{
    int pid;

    if(argint(0, &pid) < 0) {
        return -1;
    }

    return kill(pid);
}

int sys_getpid(void)
{
    return proc->pid;
}


int sys_gettid(void)
{
    return proc->tid;
}

int sys_sbrk(void)
{
    int addr;
    int n;

    if(argint(0, &n) < 0) {
        return -1;
    }

    addr = proc->sz;

    if(growproc(n) < 0) {
        return -1;
    }

    return addr;
}

int sys_sleep(void)
{
    int n;
    uint ticks0;

    if(argint(0, &n) < 0) {
        return -1;
    }

    acquire(&tickslock);

    ticks0 = ticks;

    while(ticks - ticks0 < n){
        if(proc->killed){
            release(&tickslock);
            return -1;
        }

        sleep(&ticks, &tickslock);
    }

    release(&tickslock);
    return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int sys_uptime(void)
{
    uint xticks;

    acquire(&tickslock);
    xticks = ticks;
    release(&tickslock);

    return xticks;
}