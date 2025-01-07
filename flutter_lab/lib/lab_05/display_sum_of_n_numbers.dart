import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number in List ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }
  int sum = 0;
  for (int i = 0; i < n; i++) {
    if (l1[i] % 3 == 0 || l1[i] % 5 == 0) {
      sum += l1[i];
    }
  }
  print("Sum of numbers which are divisible by 3 or 5 is $sum");
}
