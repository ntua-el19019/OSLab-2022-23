#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <wait.h>

#include "tree.h"
#include "proc-common.h"

void fproc(struct tree_node *root) {
    int status;
    change_pname(root->name);
    printf("%s: Starting...\n", root->name);

    if (root->nr_children == 0) {
        printf("%s: Sleeping...\n", root->name);
        sleep(3);
        printf("%s: Exiting...\n", root->name);
        exit(8);
    } else {
        pid_t pid;
        for (int i=0; i<root->nr_children; i++){
            pid=fork();
            if (pid < 0) {
                perror("main: fork");
                exit(1);
            }
            if (pid == 0) {
                fproc(root->children + i);
                exit(10);
            }
        }

    for(int i=0; i<root->nr_children; i++) {
        pid = wait(&status);
        explain_wait_status(pid, status);
    }
    printf("%s: Exiting...\n", root->name);

    }
}

int main(int argc, char *argv[])
{
	struct tree_node *root;


	if (argc != 2) {
		fprintf(stderr, "Usage: %s <input_tree_file>\n\n", argv[0]);
		exit(1);
	}

	root = get_tree_from_file(argv[1]);
	print_tree(root);

    pid_t initial;
    int status;
    initial=fork();

    if (initial < 0) {
        perror("main: fork");
        exit(1);
    }
    if(initial==0){
        fproc(root);
        exit(10);
    }

    show_pstree(initial);


    initial=wait(&status);
    explain_wait_status(initial, status);


	return 0;
}
