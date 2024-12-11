import 'dart:io';

void main() {
  stdout.write('Enter the length in meters: ');
  double meters = double.parse(stdin.readLineSync()!);
  double feet = meters * 3.28084;
  stdout.write('Length in feet: $feet ');

  stdout.write('Enter your weight in pounds: ');
  double weightInPounds = double.parse(stdin.readLineSync()!);

  stdout.write('Enter your height in inches: ');
  double heightInInches = double.parse(stdin.readLineSync()!);

  double weightInKg = weightInPounds * 0.45359237;

  double heightInMeters = heightInInches * 0.0254;

  double bmi = weightInKg / (heightInMeters * heightInMeters);

  stdout.write('Your BMI is: $bmi ');
}
