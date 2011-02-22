ARCH := $(shell uname -m)
X64 = x86_64
CC = gcc
PROGS =	magent
ifeq ($(ARCH), $(X64))
	M64 = -m64
endif
LIBS = -levent -lm

CFLAGS = -Wall -g -O2 $(M64)

all: $(PROGS)

STPROG = magent.o ketama.o

ketama.o: ketama.c ketama.h
	$(CC) $(CFLAGS) -c -o $@ ketama.c

magent.o: magent.c ketama.h
	$(CC) $(CFLAGS) -c -o $@ magent.c

magent: $(STPROG)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f *.o *~ $(PROGS)
