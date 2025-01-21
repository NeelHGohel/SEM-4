import 'dart:io';

import 'package:flutter_lab/crud/list_crud/temp/string_constants.dart';
import 'package:flutter_lab/crud/list_crud/temp/user.dart';

void main() {
  User user = User();

  int choice;
  do {
    print('Select Your Choice From Below Available Options:'
        '\n1. Insert User'
        '\n2. List User'
        '\n3. Update User'
        '\n4. Delete User'
        '\n5. Search User'
        '\n6. Exit Application');
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
      //region INSERT USER
        stdout.write('Enter Name : ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter Age : ');
        int age = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Email : ');
        String email = stdin.readLineSync()!;
        user.addUserInList(name: name, age: age, email: email);
        //endregion
        break;
      case 2:
      //region LIST USER
        List<Map<String, dynamic>> userList = user.getUserList();
        for (var element in userList) {
          printResultText(
              '${element[NAME]} . ${element[AGE]} . ${element[EMAIL]}');
        }
        //endregion
        break;
      case 3:
      //region UPDATE USER
        stdout.write('Enter Name : ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter Age : ');
        int age = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Email : ');
        String email = stdin.readLineSync()!;

        stdout.write('Enter Primary key : ');
        int index = int.parse(stdin.readLineSync()!);
        user.updateUser(name: name, age: age, email: email, id: index);
        //endregion
        break;
      case 4:
      //region DELETE USER
        stdout.write('Enter Primary key : ');
        int index = int.parse(stdin.readLineSync()!);
        user.deleteUser(index);
        //endregion
        break;
      case 5:
      //region SEARCH USER
        stdout.write('\nType Here To Search');
        String searchString = stdin.readLineSync()!;
        user.searchDeatil(searchData: searchString);
        //endregion
        break;
      case 6:
        stdout.write('Thank You Visit Again');
        break;
      default:
        print('Invalid Choice Please Try Again');
        break;
    }
  } while (choice != 6);
}