#include<stdio.h>

long long int ncr(long long int n, long long int r);

int main() {
	int n, r; scanf("%d %d", &n, &r);
	printf("%lld\n", ncr(n, r));
	return 0;
}
