CC = gcc

all: writer.o
	$(CROSS_COMPILE)$(CC) writer.o -o writer

writer.o: writer.c
	$(CROSS_COMPILE)$(CC) -c writer.c -o writer.o

clean:
	rm -f writer.o writer
