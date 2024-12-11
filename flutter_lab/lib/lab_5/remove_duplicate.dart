import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];
  List<int> l2 = [];
  Map<int, int> map = {};

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number in List ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }

  for (int i = 0; i < n; i++) {
    if(!map.containsValue(l1[i])){
      map[i] = l1[i];
      l2.add(l1[i]);
    }
  }
  print(l2);
}
