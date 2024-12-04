import 'dart:io';

void main() {
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];

  for (int i = 2; i < n1; i++) {
    if (n1 % i == 0) {
      l1.add(i);
    }
  }
  for (int j = 0; j < l1.length; j++) {
    if (l1[j] != 2 && l1[j] != 3 && l1[j] != 5) {
      print("$n1 is ugly");
    }
  }
}
