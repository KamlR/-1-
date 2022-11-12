#include "time.h"
#include <malloc.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
extern int64_t time_count;
extern int64_t timespecDiff(struct timespec timeA, struct timespec timeB);
void generate_choice() {
    struct timespec start;
    struct timespec end;
    char vowels[] = "AaEeIiOoUuYy";
    char consonants[] = "BbCcDdFfGgHhJjLlKkMmNnPpQqRrSsTtVvWwXxZz";
    int count_vowels = 0;
    int count_consonants = 0;
    srand(time(NULL));
    printf("%s\n", "In the generator mode, a random string length and a random string will be obtained");
    int length = 1 + rand() % 100;
    char *string = malloc(length);
    for (int i = 0; i < length; ++i) {
        int generate_sym = 32 + rand() % (127 - 32);
        string[i] = (char) (generate_sym);
    }

    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int i = 0; i < length; ++i) {
        if ((strchr(vowels, (int) string[i]) != NULL)) {
            count_vowels++;
        }
        if ((strchr(consonants, (int) string[i]) != NULL)) {
            count_consonants++;
        }
    }
    clock_gettime(CLOCK_MONOTONIC, &end);

    time_count += timespecDiff(end, start);
    printf("%s\n", string);
    printf("number of vowels: %d\n", count_vowels);
    printf("numbers of consonants: %d\n", count_consonants);
    printf("Algorithm operation time: %ld\n", time_count);
}
