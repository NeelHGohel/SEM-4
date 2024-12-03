import 'dart:io';

void main(){
  stdout.write("Enter Oprator ");
  String op = stdin.readLineSync()!;
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2 ");
  int n2 = int.parse(stdin.readLineSync()!);
  if(op == '+'){
    print("Sum of $n1 and $n2 is ${n1+n2}");
  }
  else if(op == '-'){
    print("Subtraction of $n1 and $n2 is ${n1-n2}");
  }
  else if(op == '*'){
    print("Multipication of $n1 and $n2 is ${n1*n2}");
  }
  else{
    print("division of $n1 and $n2 is ${n1/n2}");
  }
}