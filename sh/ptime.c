#include <sys/types.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    int i = 0;
    if (argc == 1) {
        time_t tm_sec = time(NULL);
        printf("%ld\n", tm_sec);
    }
    else {
        while (++i != argc) {
            time_t tm_sec = (time_t)atol(argv[i]);
            char *ctm = ctime(&tm_sec);
            printf("%s => %s", argv[i], ctm); 
        }
    }

    return 0;
}
