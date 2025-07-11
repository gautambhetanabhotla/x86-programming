#include<stdio.h>

void answer(long long int n, long long int input[], long long int output[]);

int main() {
	long long int n; scanf("%lld", &n);
	long long int input[n], output[n];
	for(long long int i = 0; i < n; i++) scanf("%lld", input + i);
	answer(n, input, output);
	for(long long int i = 0; i < n; i++) printf("%lld ", output[i]);
	printf("\n");
	return 0;
}
