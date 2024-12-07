/*WAP to find the subarray with the largest sum from a given integer array.
Example: Input: nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4], Output: 6 (subarray [4, -1, 2, 1]).*/

import 'dart:io';

void main(){
  List<int> l1 = [];
  stdout.write("Enter size of Array ");
  int n = int.parse(stdin.readLineSync()!);
  for(int i = 0 ; i < n ; i++) {
    stdout.write("enter value ");
    int val = int.parse(stdin.readLineSync()!);
    l1.add(val);
  }
  print(maxSubArray(l1));
}
int maxSubArray(List<int> nums) {
  int currentSum = nums[0];
  int maxSum = nums[0];

  for (int i = 1; i < nums.length; i++) {
    currentSum = (currentSum + nums[i] > nums[i]) ? currentSum + nums[i] : nums[i];
    maxSum = (currentSum > maxSum) ? currentSum : maxSum;
  }

  return maxSum;
}
