CROSS_COMPILE ?=

CC	:= $(CROSS_COMPILE)gcc
CFLAGS ?= -Iinclude -I/opt/vc/include -pipe -W -Wall -Wextra -g -O2
LDFLAGS	?=
LIBS	:= -L/opt/vc/lib -lrt -lbcm_host -lvcos -lvchiq_arm -pthread -lmmal_core -lmmal_util -lmmal_vc_client -lvcsm

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: example_basic_1

example_basic_1: example_basic_1.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	-rm -f *.jpg
	-rm -f *.o
	-rm -f example_basic_1

