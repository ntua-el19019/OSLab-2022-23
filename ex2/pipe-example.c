/*
 * pipe-example.c
 */

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <assert.h>

#include <sys/wait.h>
#include <string.h>

#include "proc-common.h"
#include "tree.h"

void fork_procs(struct tree_node *root, int desc) {
    /*
     * Start
     */
    pid_t pid;
    int status;
    int val[2];
    int res,i;

    printf("PID = %ld, name %s, starting...\n",
           (long) getpid(), root->name);
    change_pname(root->name);


    if (root->nr_children == 0) {
        int name=atoi(root->name);

        if(write(desc, &name, sizeof(name))!=sizeof(name)){
            perror("child number: write to pipe");
            exit(1);
        } /* Write the value into the pipe */
        close(desc);
        sleep(3);
        /* WE USE SLEEP IN ORDER TO PRINT THE PROC TREE, THERE IS NO */
        /* NEED FOR SYNCHRONIZATION */



        exit(2); /* 2 = For leaf nodes */
    }


    else {

        int pfd_child[2];
        if (pipe(pfd_child) < 0) {
            perror("pipe");
            exit(1);
        }
        for (int i = 0; i < root->nr_children; i++) {
            pid = fork();
            if (pid < 0) {
                perror("main: fork");
                exit(1);
            }
            if (pid == 0) {
                close(pfd_child[0]);
                fork_procs(root->children + i, pfd_child[1]);

            }

        }

        close(pfd_child[1]);



        for (i = 0; i < root->nr_children; i++) {
            pid = wait(&status);
            explain_wait_status(pid, status);
        }
        for(i=0; i < root->nr_children; i++) { //wait for all children values

            if (read(pfd_child[0], &val[i], sizeof(val[i])) != sizeof(val[i])) {

                perror("read from pipe");
                exit(1);
            }
            printf("Parent %s: received value %d from the pipe.\n", root->name,val[i]);

        }
        close(pfd_child[0]);


        /* Close the read end of the pipe */

        printf("Parent: received value1 %d and value2 %d from the pipe. Will now compute.\n", val[0],val[1]);

        if (strcmp(root->name, "+") == 0) {
            res=val[0]+val[1];
            printf("Parent: %d + %d = %d,value1+value2\n",val[0],val[1],res);
        }
        else{
            res=val[0]*val[1];
            printf("Parent: %d * %d = %d,value1*value2\n",val[0],val[1],res);
        }

        if((write(desc, &res, sizeof(res)))!=sizeof(res)){
            perror("parent: write to pipe");
            exit(1);
        } /* Write the value into the pipe */

        close(desc);






        exit(8); /* 8 = For non-leaf nodes */
    }

}



int main(int argc, char *argv[])
{
	pid_t p;
	int pfd[2];
	int status;
	int res;
    struct tree_node *root;

    /* Read tree into memory */
    root = get_tree_from_file(argv[1]);
	
	printf("Parent: Creating pipe...\n");
	if (pipe(pfd) < 0) {
		perror("pipe");
		exit(1);
	}

	printf("Parent: Creating child...\n");
	p = fork();
	if (p < 0) {
		/* fork failed */
		perror("fork");
		exit(1);
	}
	if (p == 0) {
        close(pfd[0]);
		/* In child process */
        fork_procs(root,pfd[1]);
		/*
		 * Should never reach this point,
		 * child() does not return
		 */

	}


    show_pstree(p);



	/* Wait for the child to terminate */
	printf("Parent: Created child with PID = %ld, waiting for it to terminate...\n",
		(long)p);


    if((read(pfd[0], &res, sizeof(res) )!= sizeof(res))){
        perror("parent: read from pipe");
        exit(1);
    } /* Read the value from the pipe */
    close(pfd[0]);

    printf("Final result: %d .\n", res);


    p = wait(&status);
    explain_wait_status(p, status);

    printf("Parent: All done, exiting...\n");

	return 0;
}
