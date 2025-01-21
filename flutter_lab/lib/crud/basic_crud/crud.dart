import 'dart:io';

import '../list_crud/user.dart';


void main() {  User user = User();

  bool flag = true;

  while (flag) {
    print("Enter 1 to Insert User \n" +
        "Enter 2 to get user \n" +
        "Enter 3 to update user info\n" +
        "Enter 4 to delete user\n" +
        "Enter 5 to search user\n"+
        "Enter 6 to exit");
    int choise = int.parse(stdin.readLineSync()!);
    switch (choise) {
      case 1:
        stdout.write("Enter User name ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter User Age ");
        String age = stdin.readLineSync()!;
        stdout.write("Enter User email ");
        String email = stdin.readLineSync()!;

        user.addUser(Name: name, Age: age, email: email);
        break;
      case 2:
        print(user.getUser());
        break;
      case 3:
        stdout.write("Enter User name ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter User Age ");
        String age = stdin.readLineSync()!;
        stdout.write("Enter User email ");
        String email = stdin.readLineSync()!;

        stdout.write("Enter User ID ");
        int id = int.parse(stdin.readLineSync()!);

        user.updateUser(Name: name, Age: age, email: email, id: id);
        break;
      case 4:
        stdout.write("Enter User ID ");
        int id = int.parse(stdin.readLineSync()!);

        user.deleteUser(id: id);
        break;
      case 5:
        stdout.write("Enter Data ");
        String data = stdin.readLineSync()!;

        user.searchDate(data: data);
        break;
      case 6:
        flag = false;
        break;
    }
  }
}
