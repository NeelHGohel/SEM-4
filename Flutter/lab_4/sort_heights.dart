import 'dart:io';

void main() {
  stdout.write("Enter size ");
  int n = int.parse(stdin.readLineSync()!);
  print(sort(n));
}

List sort(int n) {
  List<String> names = [];
  List<int> heights = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter names ");
    String n1 = stdin.readLineSync()!;
    names.add(n1);
    stdout.write("Enter height ");
    int n2 = int.parse(stdin.readLineSync()!);
    heights.add(n2);
  }

  String temp1;
  int temp2;
  for (int i = heights.length - 1; i >= 0 ; i--) {
    for (int j = heights.length - 2; j >= 0 ; j--) {
      if (heights[j+1] > heights[j]) {
        temp1 = names[j];
        names[j] = names[j + 1];
        names[j + 1] = temp1;

        temp2 = heights[j];
        heights[j] = heights[j + 1];
        heights[j + 1] = temp2;
      }
    }
  }
  return names;
}
