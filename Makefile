CC=gcc
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
LIBDIR=$(PREFIX)/lib

all: libfakehostname.so.1

libfakehostname.so.1: fakehostname.c
	$(CC) -fPIC -shared -Wl,-soname,$@ -ldl -o $@ $<

example: all
	$(PWD)/fakehostname THIS-IS-A-TEST

clean:
	rm libfakehostname.so.1 HostnameApp.class

sources:
	/bin/true

install: all
	install -m 0755 fakehostname $(BINDIR)
	install -m 0755 libfakehostname.so.1 $(LIBDIR)
