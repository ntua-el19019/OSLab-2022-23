/*
 * mandel.c
 *
 * A program to draw the Mandelbrot Set on a 256-color xterm.
 *
 */

#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <math.h>
#include <pthread.h>
#include <errno.h>
#include <stdlib.h>
#include <semaphore.h>

#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000
#define perror_pthread(ret, msg) \
	do { errno = ret; perror(msg); } while (0)

typedef struct {
    int fd;
    sem_t *sem;
    int thr_id;
    int number_of_threads;
} thread_args;


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


void *compute_and_output_mandel_line_threaded(void *args){
    int color_val[x_chars];
    int fd = ((thread_args *)args)->fd;
    int thr_id = ((thread_args *)args)->thr_id;
    sem_t sem = *((thread_args *)args)->sem;
    int number_of_threads = ((thread_args *)args)->number_of_threads;


    for(int i=thr_id; i<y_chars; i+=number_of_threads){
        compute_mandel_line(i, color_val);
        sem_wait(&sem);

        output_mandel_line(fd, color_val);
        sem_post(&sem);
    }
    return 0;
}

int main(int argc, char *argv[]) {
    int ret;
    int NTHREADS;
    NTHREADS = atoi(argv[1]);
    pthread_t threads[NTHREADS];
    sem_t sem[NTHREADS];

    if (argc != 2) {
        printf("Usage: %s <NTHREADS> \n", argv[0]);
        exit(1);
    }


    thread_args targs[NTHREADS];
    for(int i=0; i<NTHREADS; i++){
       targs[i].fd = 1;
       targs[i].thr_id = i;
       targs[i].sem = &sem[i];
       targs[i].number_of_threads = NTHREADS;

    }


    xstep = (xmax - xmin) / x_chars;
    ystep = (ymax - ymin) / y_chars;


    for(int i=0; i<NTHREADS; i++){
        if (sem_init(&sem[i], 0, 1) != 0) {
            perror("sem_init");
            exit(1);
        }
    }

    /*
     * draw the Mandelbrot Set, one line at a time.
     * Output is sent to file descriptor '1', i.e., standard output.
     */

    for(int i=0; i<NTHREADS; i++){
        ret = pthread_create(&threads[0], NULL, compute_and_output_mandel_line_threaded,&targs[i]);
        if (ret) {
            perror_pthread(ret, "pthread_create");
            exit(1);
        }
    }



    for (int i = 0; i < NTHREADS; i++) {
        ret = pthread_join(threads[i], NULL);
        if (ret) perror_pthread(ret, "pthread_join");
    }

    for (int i = 0; i < NTHREADS; i++) {
        ret = sem_destroy(&sem[i]);
        if (ret) perror("sem_destroy");
    }

	reset_xterm_color(1);
	return 0;
}
