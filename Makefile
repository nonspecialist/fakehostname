CC=gcc
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
LIBDIR=$(PREFIX)/lib

SPEC=fakehostname.spec
SRCS=$(shell spectool -lf -S $(SPEC) | awk '{ print $$2 }' )

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

rpm: $(SRCS) $(SPEC)
	-mkdir -p $(HOME)/rpmbuild/SPECS $(HOME)/rpmbuild/SOURCES
	cp $(SRCS) $(HOME)/rpmbuild/SOURCES
	cp $(SPEC) $(HOME)/rpmbuild/SPECS
	rpmbuild -bs $(HOME)/rpmbuild/SPECS/$(SPEC)
	rpmbuild -bb $(HOME)/rpmbuild/SPECS/$(SPEC)
	@echo resulting package is in $(HOME)/rpmbuild/RPMS
