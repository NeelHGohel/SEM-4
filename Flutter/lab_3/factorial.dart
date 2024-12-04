import 'dart:io';

void main() {
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  int ans = 1;

  for (int i = 1; i <= n1; i++) {
    ans = ans * i;
  }
  print(ans);
}
