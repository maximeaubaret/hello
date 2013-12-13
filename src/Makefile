CC     ?= ggc
CFLAGS ?= -g -O0

libs    = -I../libhello/include/ -L../libhello/src/
CFLAGS += -lhello

all: hello

hello: main.c
	$(CC) $(libs) $(CFLAGS) -o $@ $+

clean:
	-rm hello

.PHONY: all clean
