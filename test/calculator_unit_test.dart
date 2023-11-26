import 'package:calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  

  group('Calculator', () {
    late Calculator calculator;
  
    setUp(() {
      calculator = Calculator();
    });
    
    test('Addition', () {
      expect(calculator.add(2, 3), equals(5));
    });

    test('Subtraction', () {
      expect(calculator.minus(5, 3), equals(2));
    });

    test('Multiplication', () {
      expect(calculator.multiply(2, 3), equals(6));
    });

    test('Division', () {
      expect(calculator.divide(6, 2), equals(3));
    });

    test('Division by Zero', () {
      expect(() => calculator.divide(6, 0), throwsArgumentError);
    });
  });
}
