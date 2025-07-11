#include<stdio.h>

long long int sum(char* a, long long int N);

int main() {
	int N; scanf("%d", &N);
	char a[2*N];
	for(int i = 0; i < 2*N; i++) scanf("%c", a + i);
	printf("%lld\n", sum(a, 2*N));
	return 0;
}

/*

5
5 -2
5 -2 4
5 -2
5 -2 -4
5 -2 -4 9
5 -2 -4 9 5
5 -2 -4 9 5 14

5
5 2
5 2 4
5 2
5 2 4
5 2 4 9
5 2 4 9 13
5 2 4 9 13 22

*/
