import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }

  stdout.write("Enter number to insert ");
  int num = int.parse(stdin.readLineSync()!);
  stdout.write("Enter position to insert ");
  int position = int.parse(stdin.readLineSync()!);

  if (position >= 0 && position <= l1.length) {
    l1.insert(position, num);
  } else {
    print("Invalid position.");
  }
  print(l1);
}
