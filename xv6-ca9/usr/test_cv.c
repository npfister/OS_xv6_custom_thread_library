#include "types.h"
#include "stat.h"
#include "user.h"

int numThreads = 1;
int counter = 0;
int cond_var = 5;

void* foo1(void);
void* foo2(void);

void* foo1(void){
  counter++;
 
  printf (1, " Thread %d Waiting on cond var\n", gettid());
  kthread_cond_wait(cond_var);
  printf (1, " Thread %d woken up on cond var\n", gettid());
  
  //kthread_exit();
  return NULL;
}

void* foo2(void){
  counter++;
  int i=0;
  printf (1, " Thread %d looping\n", gettid());
  
  while (i<100) { i++; }
  kthread_cond_signal(cond_var);
  printf (1, " Thread %d signalled all sleepers\n", gettid());

  kthread_exit();
  return NULL;
}

int main (int argc, char *argv[])
{
  int i;
  //int tids[numThreads];
  counter = 0;

  printf(1, "In main, initially, counter: %d\n", counter);

  for (i=0; i<numThreads; i++) {
    if (gettid() == 0) { //just a protection. Remove later once thread_exit implemented.
      kthread_create(foo2); 
    }
  }

  if (gettid() == 0)
    foo1();

  //TIDs of children start at 1, since parent's tid = 0.
  //for (i=0; i<numThreads; i++) {
  //    kthread_join(tids[i]);
  //}

  if (gettid() == 0) {
    printf(1, "In main, after threads finished, counter: %d\n", counter);
  }

  printf (1, "Thread #%d Reached exit\n", gettid());
  exit();
}
