#include "types.h"
#include "stat.h"
#include "user.h"
#include "proc.h"

int main (int argc, char *argv[])
{
  printf (1, "MZ - hi.\n");
  kthread_create();

  exit();
}
