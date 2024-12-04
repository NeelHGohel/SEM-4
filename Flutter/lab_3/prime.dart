import 'dart:io';

void main() {
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  int count = 0;
  for (int i = 2; i < n1; i++) {
    if (n1 % i == 0) {
      count++;
    }
  }
  if (count == 0) {
    print("$n1 is Prime Number");
  } else {
    print("$n1 is not Prime Number");
  }
}
