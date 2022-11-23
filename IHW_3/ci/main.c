#include "time.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int files();
extern double algorithm_pi();
void write_to_file(char *file_name, double result_pi, int decimal_places);
double accuracy;
int main(int argc, char *argv[]) {
    int decimal_places;
    char *g = "g";
    char *file = "file";
    srand(time(NULL));
    double number = 1 + rand() % (5 - 1);
    double del = 10000 + rand() % (100000 - 10000);
    accuracy = number / del;
    if (argc == 3 && strcmp(argv[1], g) == 0) {
        decimal_places = 1 + rand() % (9 - 1);
        double result_pi = algorithm_pi();
        write_to_file(argv[2], result_pi, decimal_places);
    } else if (argc == 4 && strcmp(argv[1], file) == 0) {
        decimal_places = files(argv[2]);
        double result_pi = algorithm_pi();
        write_to_file(argv[3], result_pi, decimal_places);
    } else {
        printf("%s\n", "Incorrect input");
        return 0;
    }
}
void write_to_file(char *file_name, double result_pi, int decimal_places) {
    FILE *output = fopen(file_name, "w");
    if (output == NULL) {
        printf("%s\n", "Problems with file");
        return;
    }
    fprintf(output, "%.*lf\n", decimal_places, result_pi);
    fclose(output);
    printf("result: %.*lf\n", decimal_places, result_pi);
    printf("number of decimal places: %d\n", decimal_places);
    printf("accuracy of calculations: %lf\n", accuracy);
}
