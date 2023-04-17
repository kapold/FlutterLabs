abstract class MathService {
  int multiply(int a, int b);
}

class Calculator {
  final MathService mathService;

  Calculator(this.mathService);

  int add(int a, int b) => a + b;
  int subtract(int a, int b) => a - b;
  int multiply(int a, int b) => mathService.multiply(a, b);
}