import 'dart:math';

void clear() {
  print("\x1B[2J\x1B[0;0H");
}

bool randomBool() {
  final randomNumberGenerator = Random();
  return randomNumberGenerator.nextBool();
}
