#include<stdio.h>

void rotate(long long int* a, long long int n);

int main() {
	long long int n;
	scanf("%lld", &n);
	long long int a[n];
	for(int i = 0; i < n; i++) scanf("%lld", a + i);
	rotate(a, n);
	for(int i = 0; i < n; i++) printf("%lld ", a[i]);
	printf("\n");
	return 0;
}
