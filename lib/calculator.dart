class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double minus(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Нельзя делить на ноль! Учи матешу");
    }
    return a / b;
  }
}