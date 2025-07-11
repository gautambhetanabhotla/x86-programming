#include<stdio.h>

long long int sum(long long int* A, long long int N);

int main() {
	long long int N;
	scanf("%lld", &N);
	long long int A[N];
	for(long long int i = 0; i < N; i++) scanf("%lld", A + i);
	printf("%lld\n", sum(A, N));
	return 0;
}
