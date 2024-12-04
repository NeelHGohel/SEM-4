import 'dart:io';

void main() {
  stdout.write("Enter negative number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter positive number 2 ");
  int n2 = int.parse(stdin.readLineSync()!);

  int oddsum = 0;
  int evensum = 0;


  for (int i = n1; i < 0; i++) {
    if (i % 2 != 0) {
      oddsum += i;
    }
  }
  for (int i = 0; i <= n2; i++) {
    if (i % 2 == 0) {
      evensum += i;
    }
  }
  if(n1 > 0 || n2 < 0){
    print("not have any number");
  }
  print("From $n1 to $n2 sum of all negative odd number is $oddsum");
  print("From $n1 to $n2 sum of all positive even number is $evensum");

}
