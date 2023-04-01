#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "proc-common.h"

#define SLEEP_PROC_SEC  10
#define SLEEP_TREE_SEC  3

/*
 * Create this process tree:
 * A-+-B---D
 *   `-C
 */
void fork_procs(void)
{
	/*
	 * initial process is A.
	 */

    int status;
	change_pname("A");
	printf("A: Sleeping...\n");
//    sleep(SLEEP_PROC_SEC);

    pid_t pidC,pidB,pidD;
    pidC = fork();
    if (pidC < 0) {
        perror("main: fork");
        exit(1);
    }
    if (pidC== 0) {

        change_pname("C");
        printf("C: Sleeping...\n");
        sleep(SLEEP_PROC_SEC);
        exit(17);
        }
    pidC = wait(&status);
    explain_wait_status(pidC, status);




    /* Fork root of process tree */
    pidB = fork();
    if (pidB < 0) {
        perror("main: fork");
        exit(1);
    }
    if (pidB== 0) {

        change_pname("B");
        printf("B: Sleeping...\n");
        sleep(SLEEP_PROC_SEC);

        pidD = fork();
        if (pidD < 0) {
            perror("main: fork");
            exit(1);
        }
        if (pidD== 0) {
            /* Child */
            change_pname("D");
            printf("D: Sleeping...\n");
//            sleep(SLEEP_PROC_SEC);
            exit(13);
        }

        pidD = wait(&status);
        explain_wait_status(pidD, status);
    }

    pidB = wait(&status);
    explain_wait_status(pidB, status);
    exit(19);


	/* ... */

	printf("A: Exiting...\n");
	exit(16);
}

/*
 * The initial process forks the root of the process tree,
 * waits for the process tree to be completely created,
 * then takes a photo of it using show_pstree().
 *
 * How to wait for the process tree to be ready?
 * In ask2-{fork, tree}:
 *      wait for a few seconds, hope for the best.
 * In ask2-signals:
 *      use wait_for_ready_children() to wait until
 *      the first process raises SIGSTOP.
 */
int main(void)
{
	pid_t pidA;
	int status;

	/* Fork root of process tree */
	pidA = fork();
	if (pidA < 0) {
		perror("main: fork");
		exit(1);
	}
	if (pidA== 0) {
		/* Child */
		fork_procs();

	}

	/*
	 * Father
	 */
	/* for ask2-signals */
	/* wait_for_ready_children(1); */

	/* for ask2-{fork, tree} */
	sleep(SLEEP_TREE_SEC);

	/* Print the process tree root at pid */
	show_pstree(pidA);

	/* for ask2-signals */
	/* kill(pid, SIGCONT); */

	/* Wait for the root of the process tree to terminate */
	pidA = wait(&status);
	explain_wait_status(pidA, status);

	return 0;
}
