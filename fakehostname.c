#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <stdio.h>

typedef int (*gethostname_t)(char *name, size_t len);

gethostname_t old_gethostname;

void do_redirect() {
	void *libc;
	char *error;

	if (!(libc = dlopen("libc.so.6", RTLD_LAZY))) {
		fprintf(stderr, "Cannot open libc.so.6: %s\n", dlerror());
		exit(1);
	}

	old_gethostname = dlsym(libc, "gethostname");

	if ((error = dlerror()) != NULL) {
		fprintf(stderr, "%s\n", error);
		exit(1);
	}
}

int gethostname(char *name, size_t len) {
	int i;

	if (!old_gethostname)
		do_redirect();

	i = old_gethostname(name, len);

	if (getenv("MYHOSTNAME")) 
		strncpy(name, getenv("MYHOSTNAME"), len);

	return 0;
}
