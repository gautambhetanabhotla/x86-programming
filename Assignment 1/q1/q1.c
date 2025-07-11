#include<stdio.h>

long long int lonelynum(long long int* a, long long int m);

int main() {
	long long int n;
	scanf("%lld", &n);
	long long int a[2*n + 1];
	for(long long int i = 0; i < 2*n + 1; i++) scanf("%lld", a + i);
	printf("%lld\n", lonelynum(a, 2*n + 1));
	return 0;
}
