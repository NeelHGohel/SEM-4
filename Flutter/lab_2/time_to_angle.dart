import 'dart:io';

void main(){
  stdout.write("Enter hour ");
  int hh = int.parse(stdin.readLineSync()!);
  stdout.write("Enter minute ");
  int mm = int.parse(stdin.readLineSync()!);

  if(mm>60 || hh>12){
    print("Enter valid time");
  }

  
}