
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <unistd.h>
#include <sys/signal.h>

int main(void)
{
	struct sigaction act = { .sa_handler = SIG_IGN };

	sigaction(SIGCHLD, &act, NULL);
	sigaction(SIGHUP, &act, NULL);

	while (1)
		sleep(10000);
}
