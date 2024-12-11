import 'dart:io';

void main(){
  stdout.write("Enter String ");
  String str = stdin.readLineSync()!;
  List<String> l1 = [];
  l1.addAll(str.split(' '));

  print("${l1.last.length} (last word is ${l1.last})");
}