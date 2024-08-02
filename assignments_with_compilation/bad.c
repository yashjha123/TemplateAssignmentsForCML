#include <stdio.h>

int main(){
    int a,b;
    scanf("%d %d", &a, &b);
    int c = a + b + 100;
    printf("The sum of %d and %d is %d\n", a, b, c);
    return 0;
}