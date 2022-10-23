#include <stdio.h>

int A[1048576];
int B[1048576];
extern int new_array(int A[], int n);
extern void write_array(int index, char* file);
int main(int argc, char *argv[])

{
    int max_size=1000;
    int i,n;
    scanf("%d",&n);
    if(n>max_size || n<=0){
        printf("Incorrect data");
        return 0;
    }
    FILE *input;
    input=fopen(argv[1], "r");
    for(i=0; i<n; i++){
        fscanf(input, "%d", &A[i]);
    }
    fclose(input);
    int index=new_array(A, n);
    write_array(index, argv[2]);
}
