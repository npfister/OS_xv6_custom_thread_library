#include "types.h"
#include "stat.h"
#include "user.h"

int numThreads = 3;
int counter = 0;
void* foo(void);

void* foo(void){
  counter++;
  printf(1, "  IN START FUNCTION, pid: %d, tid: %d, counter: %d\n", getpid(), gettid(), counter);
  
  kthread_exit();
  //exit();
  return NULL;
}

int main (int argc, char *argv[])
{
  int i;
  counter = 0;

  printf(1, "In main, initially, counter: %d\n", counter);

  for (i=0; i<numThreads; i++) {
    if (gettid() == 0) { //just a protection. Remove later once thread_exit implemented.
      kthread_create(foo); 
    }
    printf (1, "Hi, tid: %d\n", gettid());
  }

  //TIDs of children start at 1, since parent's tid = 0.
  for (i=1; i<=numThreads; i++) {
    kthread_join(i);
  }

  if (gettid() == 0) {
    printf(1, "In main, after threads finished, counter: %d\n", counter);
  }
  exit();
}
