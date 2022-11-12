#include <stdio.h>
extern int B[];
int new_array(int A[], int n){
    int i, j=-1;
    int flag=0;
    for(i=0; i<n; i++){
        if(A[i]>0 && flag==0){
            flag+=1;
            j=i;
            break;
        }
    }
    int index=0;
    for(i=n-1; i>=0; i--){
        if(j!=i){
            B[index]=A[i];
            index++;
        }
    }
    return index;
}
