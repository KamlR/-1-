#include <stdint.h>
#include <stdio.h>
int files(char *file_name) {
    int decimal_places;
    FILE *input = fopen(file_name, "r");
    if (input == NULL) {
        printf("%s\n", "Problems with file");
        return 0;
    } else {
        fscanf(input, "%d", &decimal_places);
    }
    fclose(input);
    return decimal_places;
}
