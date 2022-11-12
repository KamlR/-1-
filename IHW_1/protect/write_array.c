#include <stdio.h>
extern int B[];
void write_array(int index, char* file){
    int i;
    FILE *output;
    output=fopen(file, "w");
    for(i=0; i<index; i++){
        if (i!=index-1){
            fprintf(output, "%d ", B[i]);
        }
        else{
            fprintf(output, "%d", B[i]);
        }
    }
    fclose(output);
}
