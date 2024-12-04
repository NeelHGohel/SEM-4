import 'dart:io';

void main() {
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2 ");
  int n2 = int.parse(stdin.readLineSync()!);

  List<int> list = [];

  for (int i = n1; i < n2; i++) {
    if (i % 2 == 1 && i % 3 != 0) {
      list.add(i);
    }
  }
  print(list);
}
