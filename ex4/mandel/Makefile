#
# Makefile
#

CC = gcc

# CAUTION: Always use '-pthread' when compiling POSIX threads-based
# applications, instead of linking with "-lpthread" directly.
CFLAGS = -Wall -O2 -pthread
LIBS =

all: mandel-sem-fork mandel-fork


## Mandel Sem Fork

mandel-sem-fork: mandel-lib.o mandel-sem-fork.o
	$(CC) $(CFLAGS) -o mandel-sem-fork mandel-lib.o mandel-sem-fork.o $(LIBS)

mandel-lib.o: mandel-lib.h mandel-lib.c
	$(CC) $(CFLAGS) -c -o mandel-lib.o mandel-lib.c $(LIBS)

mandel-sem-fork.o: mandel-sem-fork.c
	$(CC) $(CFLAGS) -c -o mandel-sem-fork.o mandel-sem-fork.c $(LIBS)

## Mandel Fork

mandel-fork: mandel-lib.o mandel-fork.o
	$(CC) $(CFLAGS) -o mandel-fork mandel-lib.o mandel-fork.o $(LIBS)

mandel-fork.o: mandel-fork.c
	$(CC) $(CFLAGS) -c -o mandel-fork.o mandel-fork.c $(LIBS)

clean:
	rm -f *.s *.o mandel-sem-fork mandel-fork
