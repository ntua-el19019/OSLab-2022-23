/*
 * mandel.c
 *
 * A program to draw the Mandelbrot Set on a 256-color xterm.
 *
 */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>
#include <errno.h>
#include <stdlib.h>
#include <semaphore.h>
#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000
#define perror_pthread(ret, msg) \
	do { errno = ret; perror(msg); } while (0)

/* A struct for passing arguments to procs */
typedef struct {
    int proc_id;
    int children;
    int number_of_procs;
} tree_node;


/***************************
 * Compile-time parameters *
 ***************************/

/*
 * Output at the terminal is x_chars wide by y_chars long
*/
int y_chars = 50;
int x_chars = 90;

/*
 * The part of the complex plane to be drawn:
 * upper left corner is (xmin, ymax), lower right corner is (xmax, ymin)
*/
double xmin = -1.8, xmax = 1.0;
double ymin = -1.0, ymax = 1.0;
	
/*
 * Every character in the final output is
 * xstep x ystep units wide on the complex plane.
 */
double xstep;
double ystep;

/*
 * This function computes a line of output
 * as an array of x_char color values.
 */


void fproc(tree_node *root) {
    int status,i;
    change_pname(root->name);
    printf("%s: Starting...\n", root->name);

    number_of_procs=root->number_of_procs;

    if (root->children == 0) {

        exit(8);

    } else {
        pid_t pid;
        for (i=proc_id; i<y_chars; i+=n){
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

        for(i=0; i<root->nr_children; i++) {
            pid = wait(&status);
            explain_wait_status(pid, status);
        }
        printf("%s: Exiting...\n", root->name);

    }
}
void compute_mandel_line(int line, int color_val[])
{
	/*
	 * x and y traverse the complex plane.
	 */
	double x, y;

	int n;
	int val;

	/* Find out the y value corresponding to this line */
	y = ymax - ystep * line;

	/* and iterate for all points on this line */
	for (x = xmin, n = 0; n < x_chars; x+= xstep, n++) {

		/* Compute the point's color value */
		val = mandel_iterations_at_point(x, y, MANDEL_MAX_ITERATION);
		if (val > 255)
			val = 255;

		/* And store it in the color_val[] array */
		val = xterm_color(val);
		color_val[n] = val;
	}
}

/*
 * This function outputs an array of x_char color values
 * to a 256-color xterm.
 */
void output_mandel_line(int fd, int color_val[])
{
	int i;
	
	char point ='@';
	char newline='\n';

	for (i = 0; i < x_chars; i++) {
		/* Set the current color, then output the point */
		set_xterm_color(fd, color_val[i]);
		if (write(fd, &point, 1) != 1) {
			perror("compute_and_output_mandel_line: write point");
			exit(1);
		}
	}

	/* Now that the line is done, output a newline character */
	if (write(fd, &newline, 1) != 1) {
		perror("compute_and_output_mandel_line: write newline");
		exit(1);
	}
}

/* This function is the entry point for each thread. It computes and outputs lines of the Mandelbrot set */
void compute_and_output_mandel_line_threaded(int proc_id,){
    /* The color values for the line currently being computed */
    int color_val[x_chars];
//    int fd = ((thread_args *)args)->fd;
    int thr_id = ((thread_args *)args)->thr_id;
    /* The array of semaphores used for synchronizing the threads */
//    sem_t *sem = ((thread_args *)args)->sem;
    int number_of_threads = ((thread_args *)args)->number_of_threads;


    /*
     * Each thread computes and outputs a subset of the lines.
     * If there are N threads, thread 0 handles lines 0, N, 2N, 3N, etc.,
     * thread 1 handles lines 1, N+1, 2N+1, 3N+1, etc., and so forth.
     */
    for(int i=thr_id; i<y_chars; i+=number_of_threads){
        compute_mandel_line(i, color_val);

        /*
         * Wait for the semaphore corresponding to this thread to become available.*/
        sem_wait(&sem[(thr_id)%number_of_threads]);

        output_mandel_line(fd, color_val); /* critical section */
        /*
         * Signal the next thread in the order that it can now output its line
         * (Round Robin fashion).
         * If this is the last thread, we wrap around to the first one.
         */
        sem_post(&sem[(thr_id+1)%number_of_threads]);
    }
    return 0;
}

int main(int argc, char *argv[]) {
    pid_t root;
    int NPROCS;
    /* The number of threads is read from the program's arguments */
    NPROCS = atoi(argv[1]);




    if (argc != 2) {
        printf("Usage: %s <NPROCS> \n", argv[0]);
        exit(1);
    }


    int i;
    tree_node nodes[NPROCS];
    for(i=0; i<NPROCS; i++){
       nodes[i].proc_id = i;
       nodes[i].children = 0;
       nodes[i].number_of_procs=NPROCS;

    }
    for(i=0; i<NPROCS i++){
        fproc(&nodes[i])
    }


    xstep = (xmax - xmin) / x_chars;
    ystep = (ymax - ymin) / y_chars;



    /*
     * draw the Mandelbrot Set, one line at a time.
     * Output is sent to file descriptor '1', i.e., standard output.
     */

    for (i=0; i<NPROCS; i++){
        pid=fork();
        if (pid < 0) {
            perror("main: fork");
            exit(1);
        }
        if (pid == 0) {
            compute_and_output_mandel_line_threaded(i);
            exit(10);
        }
    }


    /* The main thread waits for all the worker threads to finish */
    for (int i = 0; i < NTHREADS; i++) {
        ret = pthread_join(threads[i], NULL);
        if (ret) perror_pthread(ret, "pthread_join");
    }


    /* The semaphores are destroyed */
    for(int i=0; i<y_chars; i++) {
        ret = sem_destroy(&sem[i]);
        if (ret) perror("sem_destroy");
    }

    /* Reset the terminals color */
	reset_xterm_color(1);
	return 0;
}
