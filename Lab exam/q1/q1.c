#include<stdio.h>

long long int result(long long int M, long long int N, long long int S);

int main() {
	int N, M, S; scanf("%d%d%d", &M, &N, &S);
	printf("%lld\n", result(M, N, S));
	return 0;
}
