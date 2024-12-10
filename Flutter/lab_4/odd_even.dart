import 'dart:io';

void main() {
  stdout.write("Enter size ");
  int n = int.parse(stdin.readLineSync()!);
  print(count(n));
}

List count(int n) {
  List<int> l1 = [];
  for (int i = 0; i < n; i++) {
    stdout.write("Enter value ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }
  List<int> l2 = [];
  int counteven = 0;
  int countodd = 0;
  for (int i = 0; i < l1.length; i++) {
    if (l1[i] % 2 == 0) {
      counteven++;
    } else {
      countodd++;
    }
  }
  l2.add(countodd);
  l2.add(counteven);
  return l2;
}
