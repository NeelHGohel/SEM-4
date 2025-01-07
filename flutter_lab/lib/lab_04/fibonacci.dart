import 'dart:io';

void main() {
  stdout.write("Enter number 1 ");
  int n = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n; i++) {
    stdout.write(fibonacci(i));
    stdout.write(" ");
  }
}

int fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  }

  return fibonacci(n - 1) + fibonacci(n - 2);
}