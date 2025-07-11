#include<stdio.h>

long long int evaluatePostfix(char* s, long long int N);

int main() {
	int N; scanf("%d", &N);
	char s[N+1]; for(int i = 0; i <= N; i++) scanf("%c", s + i);
	// scanning the extra character because the first character is a line feed (\10).
	printf("%lld\n", evaluatePostfix(s, N));
	return 0;
}
