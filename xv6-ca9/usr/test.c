#include "types.h"
#include "stat.h"
#include "user.h"

int m = 0;
void * foo(void);


void test_kthread()
{
  int i, tid=0;
  printf (1, "\n-------- test_kthread (pid: %d) --------\n", getpid());

  void* (*fooptr)() = foo;
  printf (1, "MZ - Calling kthread_create. start_func: %d, %d\n", fooptr, (void *)&foo);
 
  for (i=0; i<5; i++) {
    tid = kthread_create( foo );
    printf (1, "MZ - Created a thread with tid: %d, pid: %d\n", tid, getpid());
  }

}

void test_fork()
{
  int i, pid;
  //int m = 0;
  printf (1, "\n-------- test_fork (pid; %d) -------- \n", getpid());
 
  for (i=0; i<1; i++) {
    pid = fork();
    
    if (pid == 0) {
      //m = 5;
      printf (1, "MZ - Child process. pid: %d, mypid: %d, m: %d\n", pid, getpid(), m);
    }
    else {
      m = 5;
      printf (1, "MZ - Parent process. pid: %d, mypid: %d, m: %d\n", pid, getpid(), m);
      wait();
    }
  }
}



void* foo(void){
  printf(1, "MZ - IN START FUNCTION, pid: %d, tid: %d\n", getpid(), gettid());
  exit();
}

int main (int argc, char *argv[])
{
  //int pid;
  //pid = fork();

  // Let one thread execute test_fork(), while other executes test_kthread()
  //if (pid==0) { 
  //  printf (1, "Main - Child process pid: %d\n", getpid()); 
    test_kthread(); 
  //} 
  //else {         
  //  printf (1, "Main - Parent process pid: %d\n", getpid());
    //test_fork();
  //  wait(); 
  //}

  exit();
}
