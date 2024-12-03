import 'dart:io';

void main(){
  stdout.write("Enter mark 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter mark 2 ");
  int n2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter mark 3 ");
  int n3 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter mark 4 ");
  int n4 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter mark 5 ");
  int n5 = int.parse(stdin.readLineSync()!);

  int total = n1+n2+n3+n4+n5;
  double per = (total/500)*100;

  if(per<35){
    print("Your total marks is $total");
    print("Percentage is $per");
    print("You are fail");
  }
  else if(per>35 && per<45){
    print("Your total marks is $total");
    print("Percentage is $per");
    print("You get pass class");
  }
  else if(per>45 && per<60){
    print("Your total marks is $total");
    print("Percentage is $per");
    print("You second class");
  }
  else if(per<60 && per>70){
    print("Your total marks is $total");
    print("Percentage is $per");
    print("You got first class");
  }
  else{
    print("Your total marks is $total");
    print("Percentage is $per");
    print("You get Distinction");
  }
}