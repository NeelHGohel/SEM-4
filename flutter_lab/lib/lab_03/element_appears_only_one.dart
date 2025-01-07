// WAP to find the element that appears only once in a non-empty array of integers, where every
// other element appears twice. The solution should have linear runtime complexity and use only
// constant extra space. Example: Input: nums = [2, 2, 1], Output: 1; Input: nums = [4, 1, 2, 1, 2],
// Output: 4; Input: nums = [1], Output: 1.

import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }

  //a ^ 0 = a
  //a ^ a = 0
  int ans = 0;
  for (int i = 0; i < n; i++) {
    ans ^= l1[i];
  }

  print(ans);
}
