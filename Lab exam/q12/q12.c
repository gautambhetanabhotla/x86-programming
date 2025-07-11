#include<stdio.h>

long long int isSpecial(long long int n);

int main() {
    long long int N; scanf("%lld", &N);
    printf("%s\n", isSpecial(N) ? "TRUE" : "FALSE");
    return 0;
}