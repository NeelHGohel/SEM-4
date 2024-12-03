import 'dart:io';

void main(){
  stdout.write("Enter number ");
  int n1 = int.parse(stdin.readLineSync()!);
  if(n1 > 0){
    print("Number is positive");
  }
  else{
    print("number is negative");
  }

}