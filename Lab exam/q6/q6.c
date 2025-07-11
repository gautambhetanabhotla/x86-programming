#include<stdio.h>

long long int GCD(long long int M, long long int N);

int main() {
	long long int M, N; scanf("%lld%lld", &M, &N);
	printf("%lld\n", GCD(M, N));
	return 0;
}
