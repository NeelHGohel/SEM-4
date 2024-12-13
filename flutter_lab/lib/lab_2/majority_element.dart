// WAP to find the majority element in a given array, where the majority element is the one that
// appears more than [n / 2] times. You may assume that the majority element always exists in
// the array. Example: Input: nums = [3, 2, 3], Output: 3; Input: nums = [2, 2, 1, 1, 1, 2, 2], Output:
// 2.

import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number in ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }
    int temp = 0;
    int count = 0;

    for (int i in l1) {
      if (count == 0) {
        temp = i;
        count = 1;
      } else if (i == temp) {
        count++;
      } else {
        count--;
      }
    }

    print("Majority element: $temp");
  }
