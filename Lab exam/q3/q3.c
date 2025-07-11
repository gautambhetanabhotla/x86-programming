#include<stdio.h>

void changearray(long long int* arr, long long int N);

int main() {
	long long int N; scanf("%lld", &N);
	long long int arr[N];
	changearray(arr, N);
	for(long long int i = 0; i < N; i++) printf("%lld ", arr[i]);
	printf("\n");
	return 0;
}
