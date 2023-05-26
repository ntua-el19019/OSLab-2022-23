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
#include <semaphore.h>
#include <stdlib.h>
#include <wait.h>
#include <sys/mman.h>

#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000

/***************************
 * Compile-time parameters *
 ***************************/

sem_t *shared;
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

void compute_and_output_mandel_line(int proc_id,int number_of_procs){
    /*
     * A temporary array, used to hold color values for the line being drawn
     */
    int color_val[x_chars];

    int i;
    for(i=proc_id; i<y_chars; i+=number_of_procs) {
        compute_mandel_line(i, color_val);


        sem_wait(&shared[(proc_id) % number_of_procs]);
        output_mandel_line(1, color_val);
        sem_post(&shared[(proc_id + 1) % number_of_procs]);

    }

}

/*
 * Create a shared memory area, usable by all descendants of the calling
 * process.
 */
void *create_shared_memory_area(unsigned int numbytes)
{
    int pages;
    void *addr;

    if (numbytes == 0) {
        fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
        exit(1);
    }

    /*
     * Determine the number of pages needed, round up the requested number of
     * pages
     */
    pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;

    /* Create a shared, anonymous mapping for this number of pages */

        addr = mmap(NULL,pages,PROT_READ|PROT_WRITE,MAP_SHARED|MAP_ANONYMOUS,0,0);

    return addr;
}

void destroy_shared_memory_area(void *addr, unsigned int numbytes) {
    int pages;

    if (numbytes == 0) {
        fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
        exit(1);
    }

    /*
     * Determine the number of pages needed, round up the requested number of
     * pages
     */
    pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;

    if (munmap(addr, pages * sysconf(_SC_PAGE_SIZE)) == -1) {
        perror("destroy_shared_memory_area: munmap failed");
        exit(1);
    }
}

int main(int argc, char *argv[])
{
    pid_t root;
    int NPROCS;
    int i;
    /* The number of threads is read from the program's arguments */
    NPROCS = atoi(argv[1]);

    shared=create_shared_memory_area(sizeof(sem_t)*NPROCS);

    if (argc != 2) {
        printf("Usage: %s <NPROCS> \n", argv[0]);
        exit(1);
    }
    for(i=0; i<NPROCS; i++){
        if (i==0){
        sem_init(&shared[i],1,1);
        }
        else{
            sem_init(&shared[i],1,0);
        }

    }


    xstep = (xmax - xmin) / x_chars;
    ystep = (ymax - ymin) / y_chars;



    /*
     * draw the Mandelbrot Set, one line at a time.
     * Output is sent to file descriptor '1', i.e., standard output.
     */

    for (i=0; i<NPROCS; i++){
        root=fork();
        if (root < 0) {
            perror("main: fork");
            exit(1);
        }
        if (root == 0) {
            compute_and_output_mandel_line(i,NPROCS);
            exit(10);
        }
    }

    for (i=0; i<NPROCS; i++){
        wait(NULL);
    }
    destroy_shared_memory_area(shared,sizeof(sem_t)*NPROCS);

    for(i=0; i<NPROCS; i++){
        sem_destroy(&shared[i]);
    }
    reset_xterm_color(1);
    return 0;
}
