import 'dart:io';

void main(){
  stdout.write("Enter numbers and enter -1 to exit ");
  int n1 = int.parse(stdin.readLineSync()!);

  Map<int,bool> map = {};
  while(n1 != -1){
    stdout.write("Enter numbers and enter -1 to exit ");
    n1 = int.parse(stdin.readLineSync()!);
  }
}