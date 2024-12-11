import 'dart:io';

void main() {
  stdout.write("Enter number: ");
  int n1 = int.parse(stdin.readLineSync()!);

  while (n1 % 2 == 0) {
    n1 ~/= 2;
  }
  while (n1 % 3 == 0) {
    n1 ~/= 3;
  }
  while (n1 % 5 == 0) {
    n1 ~/= 5;
  }

  if (n1 == 1) {
    print("Ugly number");
  } else {
    print("Not an ugly number");
  }
}
