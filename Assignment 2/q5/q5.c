#include<stdio.h>

void binarysearch(short int* output,
				short int* L,
				short int X,
				short int l,
				short int r);

int main() {
	short int X, L[32], output[2];
	for(int i = 0; i < 32; i++) scanf("%hd", L + i);
	scanf("%hd", &X);
	binarysearch(output, L, X, 0, 31);
	printf("%d %d\n", output[0], output[1]);
	return 0;
}
