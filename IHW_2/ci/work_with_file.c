#include "time.h"
#include <malloc.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
extern int64_t time_count;
extern int64_t timespecDiff(struct timespec timeA, struct timespec timeB);
void work_with_file(char *file_input, char *file_output) {
    struct timespec start;
    struct timespec end;
    char *string;
    char vowels[] = "AaEeIiOoUuYy";
    char consonants[] = "BbCcDdFfGgHhJjLlKkMmNnPpQqRrSsTtVvWwXxZz";
    int count_vowels = 0;
    int count_consonants = 0;
    FILE *input = fopen(file_input, "rb");
    if (input == NULL) {
        printf("%s\n", "Problems with file");
        return;
    }
    fseek(input, 0, SEEK_END);
    int64_t file_size = ftello(input);
    fclose(input);
    string = malloc(file_size);
    input = fopen(file_input, "r");

    for (int64_t i = 0; i < file_size; ++i) {
        string[i] = (char) fgetc(input);
    }
    fclose(input);
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int64_t i = 0; i < file_size; ++i) {
        if ((strchr(vowels, (int) string[i]) != NULL)) {
            count_vowels++;
        }
        if ((strchr(consonants, (int) string[i]) != NULL)) {
            count_consonants++;
        }
    }

    clock_gettime(CLOCK_MONOTONIC, &end);
    time_count += timespecDiff(end, start);
    FILE *output = fopen(file_output, "w");
    fprintf(output, "number of vowels: %d\n", count_vowels);
    fprintf(output, "numbers of consonants: %d\n", count_consonants);
    printf("Algorithm operation time: %ld\n", time_count);
    fclose(output);
}
