// WAP that create following value:“Delhi”, “Mumbai”, “Bangalore”, “Hyderabad” and “Ahmedabad”
// Replace “Ahmedabad” with “Surat” in above List.

import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<String> l1 = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter City ");
    String city = stdin.readLineSync()!;
    l1.add(city);
  }
  for (int i = 0; i < n; i++) {
    if (l1[i] == 'Ahmedabad') {
      l1[i] = 'Surat';
    }
  }

  print(l1);
}
