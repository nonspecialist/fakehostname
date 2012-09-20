What is this?
=============

An example override of the libc function gethostname(2).

How do I use it?
================

* build the shared library (`make`)
* install it somewhere
* set the installed shared library to be loaded prior to libc
  (`export LD_PRELOAD=/path/to/shared/library.so.1`)
* set the environment variable `MYHOSTNAME` to whatever hostname
  you want (note HOST\_NAME\_MAX is usually 64 characters)
* run your application normally

If you don't set `$MYHOSTNAME`, the actual hostname returned by the 
real gethostname(2) call will be used

I also wrote a little wrapper script called `fakehostname` which you can 
install in your $PATH (eg /usr/local/bin) which will set LD_PRELOAD for you
and call your binary with the hostname set:

> `fakehostname <pretend-hostname> <original-command> [original-command-args]`
