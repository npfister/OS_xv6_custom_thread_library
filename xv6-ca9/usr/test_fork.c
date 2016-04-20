#include "types.h"
#include "stat.h"
#include "user.h"

int counter = 0;

void foo(void){
  counter++;
  printf(1, "IN START FUNCTION, pid: %d, counter: %d\n", getpid(), counter);
}


int main (int argc, char *argv[])
{
  int pid;
  counter = 0;

  printf(1, "In main, initially, counter: %d. Paren't pid: %d\n\n", counter, getpid());
  pid = fork();

  if (pid==0) { 
    foo();   
    exit();
  } 
  else {         
    foo();
    wait(); 
  }

  printf(1, "\n\nIn main, after processes finished, counter: %d\n", counter);
  exit();
}
