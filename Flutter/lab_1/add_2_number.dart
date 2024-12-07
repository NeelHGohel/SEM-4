import 'dart:io';

void main(){
  stdout.write("Enter number 1");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2");
  int n2 = int.parse(stdin.readLineSync()!);

  int ans = n1+n2;
  print("Sum of $n1 and $n2 is $ans");

}