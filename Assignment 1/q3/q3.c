#include<stdio.h>
#include<string.h>

long long int ispalindrome(char* s, long long int n);

int main() {
	char s[10001];
	scanf("%s", s);
	long long int n = strlen(s);
	printf("%lld\n", ispalindrome(s, n));
	return 0;
}
