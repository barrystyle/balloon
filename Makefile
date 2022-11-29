CC=gcc
CFLAGS=-O2 -g -I./ -I./balloon -I./libballoon -I./include
LDFLAGS=-lcrypto -lssl -lm -pthread

SOURCES= \
        libballoon/api.c           \
        libballoon/balloon.c       \
        libballoon/base64.c        \
        libballoon/bitstream.c     \
        libballoon/compress.c      \
        libballoon/encode.c        \
        libballoon/errors.c        \
        libballoon/hash_state.c    \
        libballoon/parse.c         \
        libballoon/strsep.c        \
        balloon/main.c

OBJECTS=$(SOURCES:.c=.o)
OUTPUT=balloon_hash

all: $(SOURCES) $(OUTPUT)

$(OUTPUT): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDLIBS) $(LDFLAGS) -o $@

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -f *.o
	rm -f libballoon/*.o
	rm -f balloon/*.o
