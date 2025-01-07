// WAP to find the intersection of two integer arrays, nums1 and nums2. Each element in the
// result should appear as many times as it appears in both arrays, and the result should be
// returned in sorted order. Example: Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2], Output: [2, 2];
// Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4], Output: [4, 9].

import 'dart:io';

void main() {
  stdout.write("Enter size of List 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  List<int> l1 = [];

  stdout.write("Enter size of List 2 ");
  int n2 = int.parse(stdin.readLineSync()!);
  List<int> l2 = [];

  for (int i = 0; i < n1; i++) {
    stdout.write("Enter number in list 1 ");
    int n1 = int.parse(stdin.readLineSync()!);
    l1.add(n1);
  }

  for (int i = 0; i < n2; i++) {
    stdout.write("Enter number in list 2 ");
    int n1 = int.parse(stdin.readLineSync()!);
    l2.add(n2);
  }

  List<int> result = [];
  int i = 0, j = 0;

  // Use two pointers to find the intersection
  while (i < l1.length && j < l2.length) {
    if (l1[i] == l2[j]) {
      result.add(l1[i]);
      i++;
      j++;
    } else if (l1[i] < l2[j]) {
      i++;
    } else {
      j++;
    }
  }
  print(result);
}
