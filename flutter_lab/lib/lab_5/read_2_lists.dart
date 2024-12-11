// WAP to read 2 list and return list that contains only the elements that are common between them.

import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];
  List<int> l2 = [];
  List<int> l3 = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number in List 1 ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }
  for (int i = 0; i < n; i++) {
    stdout.write("Enter number in List 2 ");
    int n2 = int.parse(stdin.readLineSync()!);
    l2.add(n2);
  }
  l1.sort();
  l2.sort();

  for (int i = 0; i < n; i++) {
    if (l2.contains(l1[i])) {
      l3.add(l1[i]);
    }
  }
  print(l3);
}
