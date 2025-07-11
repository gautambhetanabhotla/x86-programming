#include<stdio.h>

void setoutput(long long int* input, long long int* output, long long int n);

int main() {
	long long int n;
	scanf("%lld", &n);
	long long int input[n], output[n];
	for(long long int i = 0; i < n; i++) scanf("%lld", input + i);
	setoutput(input, output, n);
	for(int i = 0; i < n; i++) printf("%lld ", output[i]);
	return 0;
}
