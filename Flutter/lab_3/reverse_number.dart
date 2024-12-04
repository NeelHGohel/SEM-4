import 'dart:io';

void main() {
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  int rem = 0;
  while(n1 != 0){
    rem = n1 % 10 + rem*10;
    n1 ~/= 10;
  }
  print(rem);
}