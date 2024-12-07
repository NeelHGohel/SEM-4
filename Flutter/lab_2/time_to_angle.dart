import 'dart:io';

void main() {
  stdout.write("Enter hours: ");
  int hours = int.parse(stdin.readLineSync()!);

  stdout.write("Enter minutes: ");
  int minutes = int.parse(stdin.readLineSync()!);

  hours = hours % 12;

  int minuteAngle = 6 * minutes;

  double hourAngle = 30 * hours + 0.5 * minutes;

  double angle = (hourAngle - minuteAngle).abs();

  if (angle > 180) {
    angle = 360 - angle;
  }

  print("The angle between the hour and minute hands is: $angle degrees");
}
