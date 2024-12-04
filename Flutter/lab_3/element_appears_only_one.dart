import 'dart:io';

void main(){
  stdout.write("Enter numbers and enter -1 to exit ");
  int n1 = int.parse(stdin.readLineSync()!);

  List<int> l1 = [];
  while(n1 != -1){
    l1.add(n1);
    stdout.write("Enter numbers and enter -1 to exit ");
    n1 = int.parse(stdin.readLineSync()!);
  }
  
  print(l1);
}