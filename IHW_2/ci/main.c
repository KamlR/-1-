#include "time.h"
#include <stdint.h>
#include <stdio.h>
extern void work_with_file(char *file_input, char *file_output);
extern void generate_choice();
int64_t time_count = 0;
int main(int argc, char *argv[]) {
    if (argc == 1) {
        printf("%s\n", "Incorrect input");
        return 0;
    } else if (argc == 2) {
        generate_choice();
    } else if (argc == 3) {
        work_with_file(argv[1], argv[2]);
    }
}

int64_t timespecDiff(struct timespec timeA, struct timespec timeB) {
    int64_t nsecA, nsecB;

    nsecA = timeA.tv_sec;
    nsecA *= 1000000000;
    nsecA += timeA.tv_nsec;


    nsecB = timeB.tv_sec;
    nsecB *= 1000000000;
    nsecB += timeB.tv_nsec;

    return nsecA - nsecB;
}
