#include "time.h"
#include <math.h>
#include <stdint.h>
#include <stdio.h>
extern double accuracy;
int64_t timespecDiff(struct timespec timeA, struct timespec timeB);
double algorithm_pi() {
    struct timespec start;
    struct timespec end;
    double original_pi = 3.141592653;
    double not_original_pi = 1;
    double sqr_two = 0;
    double not_result = 1;
    clock_gettime(CLOCK_MONOTONIC, &start);
    while (original_pi - not_original_pi > accuracy) {
        sqr_two = sqrt(2 + sqr_two);
        double denominator = sqr_two / 2;
        not_result *= denominator;
        not_original_pi = 2 / not_result;
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    int64_t time_count = timespecDiff(end, start);
    printf("Algorithm operation time: %ld\n", time_count);
    return not_original_pi;
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
