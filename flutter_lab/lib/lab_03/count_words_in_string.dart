// WAP to count the occurrences of each word in a given sentence. Return a map where the keys
// are the words, and the values are the number of occurrences of each word. Example: Input:
// "this is a test this is a", Output: {'this': 2, 'is': 2, 'a': 2, 'test': 1}.

import 'dart:io';
import 'dart:io';

void main() {
  stdout.write("Enter String: ");
  String str = stdin.readLineSync()!;

  List<String> words = str.split(" ");
  Map<String, int> wordCountMap = {};

  for (String word in words) {
    if (wordCountMap.containsKey(word)) {
      wordCountMap[word] = wordCountMap[word]! + 1;
    } else {
      wordCountMap[word] = 1;
    }
  }

  print(wordCountMap);
}

