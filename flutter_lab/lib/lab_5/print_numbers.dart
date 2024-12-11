// WAP that prompts the user to enter 5 numbers, stores them in a List, and displays them in increasing order.

import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> list = [];
  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ");
    int n1 = int.parse(stdin.readLineSync()!);
    list.add(n1);
  }
  list.sort();
  print(list);
}
