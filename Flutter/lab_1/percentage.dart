import 'dart:io';

void main(){
  List<int> l1 = [];
  int count=1;
  double ans = 0;
  for(int i = 0 ; i < 5 ; i++){
    stdout.write("enter marks $count ");
    count++;
    int mark = int.parse(stdin.readLineSync()!);
    l1.add(mark);
    ans += mark;
  }

  ans = (ans/500)*100;
  print("Student get $ans%");
}