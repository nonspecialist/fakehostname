What is this?
=============

An example override of the libc function gethostname(2).

How do I use it?
================

* build the shared library (`make`) or the RPM (`make rpm`)
* install it somewhere (`make install`) or (`rpm -ivh .../path/to/new-rpm`)
* either:
  * set the installed shared library to be loaded prior to libc
    (`export LD_PRELOAD=/path/to/shared/library.so.1`)
  * set the environment variable `MYHOSTNAME` to whatever hostname
    you want (note HOST\_NAME\_MAX is usually 64 characters)
  * run your application normally
* or
  * use the included `fakehostname` wrapper to launch your application

If you don't set `$MYHOSTNAME`, the actual hostname returned by the 
real gethostname(2) call will be used

Wrapper Script
==============

I also wrote a little wrapper script called `fakehostname` which you can 
install in your $PATH (eg /usr/local/bin) which will set LD\_PRELOAD for you
and call your binary with the hostname set:

> `fakehostname <pretend-hostname> <original-command> [original-command-args]`

License
=======

This code is licensed under the GPLv3 -- a copy of the license can be found in
the file LICENSE.
