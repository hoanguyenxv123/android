import 'dart:math';

void main() {
  print(solveQuadratic(0, -1, 4));
}

String solveQuadratic(double a, double b, double c) {
  if (a == 0) {
    if (b == 0) {
      return (c == 0)
          ? 'Phương trình có vô số nghiệm'
          : 'Phương trình vô nghiệm';
    } else {
      double x = -c / b;
      return 'Phương trình bậc nhất có nghiệm: x=$x';
    }
  }

  double delta = (b * b) - 4 * a * c;
  double x1, x2;
  if (delta == 0) {
    x1 = -b / (2 * a);
    return 'Phương trình có nghiệm kép: x1=$x1';
  } else if (delta < 0) {
    return 'Phương trình vô nghiệm';
  } else {
    x1 = (-b + sqrt(delta)) / (2 * a);
    x2 = (-b - sqrt(delta)) / (2 * a);
    return 'Phương trình có 2 nghiệm: x1=$x1, x2=$x2';
  }
}
