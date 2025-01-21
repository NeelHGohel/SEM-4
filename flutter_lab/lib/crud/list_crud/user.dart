import 'package:flutter_lab/crud/basic_crud/string_const.dart';

class User {
  List<Map<String, dynamic>> userList = [];

  void addUser({required Name, required Age, required email}) {
    Map<String, dynamic> map = {};
    map[NAME] = Name;
    map[AGE] = Age;
    map[EMAIL] = email;
    userList.add(map);
  }

  List<Map<String, dynamic>> getUser() {
    return userList;
  }

  void updateUser({required Name, required Age, required email, required id}) {
    Map<String, dynamic> map = {};
    map[NAME] = Name;
    map[AGE] = Age;
    map[EMAIL] = email;
    userList[id] = map;
  }

  void deleteUser({required id}) {
    userList.removeAt(id);
  }

  void searchDate({required data}){
    for(var element in userList){
      if(element[NAME].toString().toLowerCase().contains(data.toString().toLowerCase()) ||
          element[AGE].toString().toLowerCase().contains(data.toString().toLowerCase()) ||
          element[EMAIL].toString().toLowerCase().contains(data.toString().toLowerCase())){
        print("Name :${element[NAME]} Age : ${element[AGE]} Email :${element[EMAIL]}");
      }
    }
  }
}
