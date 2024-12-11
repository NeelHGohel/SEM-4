import 'dart:io';

void main(){
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2 ");
  int n2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 3 ");
  int n3 = int.parse(stdin.readLineSync()!);

  (n1>n2 && n1>n3) ? print("$n1 is largest") : (n2>n3 && n2>n1) ? print("$n2 is largest") : print("$n3 is largest");
}