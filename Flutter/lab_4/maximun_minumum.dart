import 'dart:io';

void main(){
  stdout.write("Enter number 1 ");
  int a = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2 ");
  int b = int.parse(stdin.readLineSync()!);

  print("maximun number is ${max_min(a, b)}");
}

int max_min(int a, int b){
  if(a>b){
    return a;
  }

  return b;
}