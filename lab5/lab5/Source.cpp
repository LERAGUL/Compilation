#include <iostream>
#include <string>
#include <string.h>

using namespace std;

extern "C" void __cdecl ADD1(char *a, int n);

extern "C" void PR(char *a, int n) //выраниваниепо максимальной строке
{
	char help[125] = "";
	char b[125] = "";
	int j = 0;
	while (a[j] != '\0') {
		for (int i = 0; i <= n; i++) {
			help[i] = ' ';
		}
		int s = 0;
		int k = j;
		while (a[k] != '\n') {
			s++;
			k++;
		}
		int flag = 0;
		int prob = n - s + 1;
		int i = 0;
		while (a[j] != '\n') {
			if (flag == 1 || a[j] != ' ') {
				help[i] = a[j];
				i++;
				j++;
			}
			if (a[j] == ' ' && flag == 0) {
				i += prob;
				j++;
				flag = 1;
			}
		}
		help[n] = '\n';
		strcat_s(b, help);
		j++;
	}
	strcpy_s(a, 125, b);
}

int main()
{
	char a[125] = "";
	int n;
	cout << "Input Str1: ";
	gets_s(a);
	cout << "\n";
	cout << "Input len: ";
	cin >> n;
	cout << "\n";
	int l = strlen(a);
	a[l] = ' '; // добавила в конец пробел
	for (int i = l + 1; i < 125; ++i)
	{
		a[i] = '\0';
	}
	ADD1(a, n);  //разбиение текста на строки
	cout << a;
	system("pause");
	return 0;
}