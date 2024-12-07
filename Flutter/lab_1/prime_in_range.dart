import 'dart:io';

void main() {
  stdout.write("Enter the start number: ");
  int start = int.parse(stdin.readLineSync()!);

  stdout.write("Enter the end number: ");
  int end = int.parse(stdin.readLineSync()!);

  List<int> primes = [];

  for (int i = start; i <= end; i++) {
    bool isPrime = true;
    for (int j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      primes.add(i);
    }
  }

  print("Prime numbers between $start and $end: $primes");
}
