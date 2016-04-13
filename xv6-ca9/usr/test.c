#include "types.h"
#include "stat.h"
#include "user.h"

void test_kthread()
{
  int i, tid=0;
  printf (1, "MZ - Calling kthread_create.\n");
 
  for (i=0; i<1; i++) {
    tid = kthread_create();
    printf (1, "MZ - Created a thread with tid: %d, pid: %d\n", tid, getpid());
  }

}

void test_fork()
{
  int i, pid;
  int m = 0;
  printf (1, "MZ - Calling fork.\n");
 
  for (i=0; i<1; i++) {
    pid = fork();
    
    if (pid == 0) {
      m = 5;
      printf (1, "MZ - Child process. pid: %d, mypid: %d, m: %d\n", pid, getpid(), m);
    }
    else {
      printf (1, "MZ - Parent process. pid: %d, mypid: %d, m: %d\n", pid, getpid(), m);
    }
  }
}

int main (int argc, char *argv[])
{
  test_kthread();
  test_fork();

  exit();
}
