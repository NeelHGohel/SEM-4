// WAP to create and read phonebook dictionary.

import 'dart:io';

void main() {
  stdout.write("Enter size of Map ");
  int n = int.parse(stdin.readLineSync()!);
  Map<int, String> phonebook = {};

  for (int i = 0; i < n; i++) {
    stdout.write("Enter Phone Number ");
    int phone = int.parse(stdin.readLineSync()!);

    if (phonebook.containsKey(phone)) {
      print("Already number exist");
      break;
    }
    stdout.write("Enter name ");
    String name = stdin.readLineSync()!;
    phonebook[phone] = name;
  }
  print(phonebook);
}
