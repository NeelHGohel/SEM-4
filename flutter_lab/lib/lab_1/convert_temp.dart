import 'dart:io';

void main(){
  stdout.write("Enter temp in Fahrenheit ");
  int f = int.parse(stdin.readLineSync()!);

  double ans = (f-32) * (5/9);

  print("$f = $ans celsius");
  stdout.write("Enter temp in celsius ");
  int c = int.parse(stdin.readLineSync()!);

  double ans1 = (c*(9/5))+32;
  print("$c = $ans1 faherenhit ");
}