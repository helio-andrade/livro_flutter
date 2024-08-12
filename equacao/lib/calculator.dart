import 'dart:math';

String calculateQuadraticRoots(double a, double b, double c) {
  if (a == 0) {
    return "O coeficiente 'a' não pode ser zero.";
  }

  double discriminant = b * b - 4 * a * c;

  if (discriminant > 0) {
    double root1 = (-b + sqrt(discriminant)) / (2 * a);
    double root2 = (-b - sqrt(discriminant)) / (2 * a);
    return "Raízes: $root1 e $root2";
  } else if (discriminant == 0) {
    double root = -b / (2 * a);
    return "Raiz única: $root";
  } else {
    return "Não há raízes reais";
  }
}
