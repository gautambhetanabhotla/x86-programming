#include<stdio.h>

long long int sum(long long int* arr, int N, int L, int R);
// solution: maintain prefix sum array and iterate over all combinations of arr[k] and arr[k-L] and so on until arr[k] and arr[k-R]
// time complexity: O(NR - NL)
// space complexity: O(N)

int main() {
	long long int N, L, R; scanf("%lld %lld %lld", &N, &L, &R);
	long long int arr[N];
	for(long long int i = 0; i < N; i++) scanf("%lld", arr + i);
	printf("%lld\n", sum(arr, N, L, R));
	return 0;
}

// 4 1 2
// 2 2 5 6
// 2 4 9 15
