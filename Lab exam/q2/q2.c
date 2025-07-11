#include<stdio.h>

long long int ans(long long int x);

int main() {
	long long int x; scanf("%lld", &x);
	printf("%s\n", ans(x) ? "TRUE" : "FALSE");
	return 0;
}
