#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

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

    pid_t pidC,pidB,pidD;


    /* Fork root of process tree */
    pidB = fork();
    if (pidB < 0) {
        perror("main: fork");
        exit(1);
    }
    if (pidB== 0) {

        change_pname("B");
        printf("B: Waiting...\n"); /* Wait for the children to be created*/



        pidD = fork();
        if (pidD < 0) {
            perror("main: fork");
            exit(1);
        }
        if (pidD== 0) {
            /* Child */
            change_pname("D");
            printf("D: Sleeping...\n");
            sleep(SLEEP_PROC_SEC); /* Sleep so the tree can be printed*/

            printf("D: Exiting...\n");
            exit(13);
        }

        pidD = wait(&status);
        explain_wait_status(pidD, status);
        printf("B: Exiting...\n");
        exit(19);
    }

    pidC = fork();
    if (pidC < 0) {
        perror("main: fork");
        exit(1);
    }
    if (pidC== 0) {

        change_pname("C");
        printf("C: Sleeping...\n");
        sleep(SLEEP_PROC_SEC); /* Sleep so the tree can be printed*/
        printf("C: Exiting...\n");
        exit(17);
    }
    pidC = wait(&status);
    explain_wait_status(pidC, status);


    pidB = wait(&status);
    explain_wait_status(pidB, status);




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
    change_pname("A");
    if (pidA < 0) {
        perror("main: fork");
        exit(1);
    }
    if (pidA== 0) {
        printf("A: Waiting...\n");
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

    pidA = wait(&status);
    explain_wait_status(pidA, status);


    /* for ask2-signals */
    /* kill(pid, SIGCONT); */

    /* Wait for the root of the process tree to terminate */

    return 0;
}