import 'dart:io';

void main(){
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2 ");
  int n2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 3 ");
  int n3 = int.parse(stdin.readLineSync()!);

  if(n1 > n2 && n1 > n3){
    print("from $n1 , $n2 and $n3 largest is $n1");
  }
  else if(n2 > n1 && n2 > n3){
    print("from $n1 , $n2 and $n3 largest is $n2");
  }
  else{
    print("from $n1 , $n2 and $n3 largest is $n3");
  }
}