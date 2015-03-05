SHELL = /bin/sh
CC    = gcc
CFLAGS  =   -Iinclude -Isrc -lcurl  -I/home/vagrant/usr/include -L/home/vagrant/usr/lib/ -ljansson

TARGET  = cellophane
SOURCES = $(shell echo src/*.c) 
OBJECTS = $(SOURCES:.c=.o)


all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS)

install:
	cp include/ /usr/include/cellophaneio/ -R
	cp $(TARGET) /usr/lib/
	ln -s -i /usr/lib/$(TARGET) /usr/lib/libcellophane.so

clean:
	rm -rf *.so
	rm -rf src/*.o

run:
	./cellophane
