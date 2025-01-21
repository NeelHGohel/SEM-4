

import '../../basic_crud/string_const.dart';

class User {
  List<Map<String, dynamic>> userList = [];

  void addUserInList({required name, required age, required email}) {
    Map<String, dynamic> map = {};
    map[NAME] = name;
    map[AGE] = age;
    map[EMAIL] = email;
    userList.add(map);
  }

  List<Map<String, dynamic>> getUserList() {
    return userList;
  }

  void updateUser({required name, required age, required email, required id}) {
    Map<String, dynamic> map = {};
    map[NAME] = name;
    map[AGE] = age;
    map[EMAIL] = email;
    userList[id] = map;
  }

  void deleteUser(id) {
    userList.removeAt(id);
  }

  void searchDeatil({required searchData}) {
    for (var element in userList) {
      if (element[NAME]
          .toString()
          .toLowerCase()
          .contains(searchData.toString().toLowerCase()) ||
          element[AGE]
              .toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ||
          element[EMAIL]
              .toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase())) {
        print(
            '${element[NAME]} . ${element[AGE]} . ${element[EMAIL]}');
      }
    }
  }
}