import 'dart:io';

void main(){
  stdout.write("Enter p ");
  int p = int.parse(stdin.readLineSync()!);
  stdout.write("Enter r ");
  int r = int.parse(stdin.readLineSync()!);
  stdout.write("Enter n ");
  int n = int.parse(stdin.readLineSync()!);

  print(simple_interest(p, r, n));

}

double simple_interest(int p , int r , int n){
  double ans = 0;
  ans = ((p*r*n)/100);
  return ans;
}