#include "types.h"
#include "user.h"
#include "fcntl.h"

int
main(void)
{
	kthread_create();
	printf(1,"hello world\n");
	exit();
}