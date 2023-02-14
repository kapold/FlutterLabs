// 1. Иерархия
class Developer {
  String name;
  String position;
  Developer(this.name, this.position);
}

class FrontendDeveloper extends Developer implements Codeable {
  FrontendDeveloper(String name, String position) : super(name, position);

  void writeCode() {
    print("Whats'up, my name's $name");
  }
}

class BackendDeveloper extends Developer {
  BackendDeveloper(String name, String position) : super(name, position);
}

class FullstackDeveloper extends Developer {
  FullstackDeveloper(String name, String position) : super(name, position);
}

// 2. Интерфейс
class Codeable {
  void writeCode() {
    print("Override this one");
  }
}

// 3. Абстрактный класс
abstract class Programmer {
  void debugCode() {}
}

// 4. Класс, который содержит: конст, именованный констр, геттер и сеттер,
// статик поля и функции (с именованным параметром, с параметром по
// умолчанию, c параметром типа функция, c необязательным параметром).
class JuniorDeveloper extends Programmer {
  JuniorDeveloper(String name, String position);

  // константа, статик
  static const university = "BSTU";
  static int experience = 1;
  String surname = "";

  // геттер, сеттер
  int get exp {
    return experience;
  }

  void set exp(int newExperience) {
    experience = newExperience;
  }

  // функции
  static void showProgrammer({String name = "undefined", int age = 0}) {
    print("Name: $name");
    print("Age: $age");
  }

  static void execFunction(Function func) {
    func();
  }

  static void showAge([int age = 666]) {
    print("Age: $age");
  }

  // именованный конструктор
  JuniorDeveloper.undefined() {
    this.surname = "undefined";
  }

  void debugCode() {
    print("Overloaded from Abstract class");
  }
}

void demonstrateContinueAndBreak() {
  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      continue;
    }
    print(i);
    if (i == 5) {
      break;
    }
  }
}

void demonstrateExceptionHandling() {
  try {
    int result = 12 ~/ 0;
    print("Result: $result");
  } on IntegerDivisionByZeroException {
    print("Cannot divide by zero");
  } catch (e) {
    print("Unknown exception: $e");
  } finally {
    print("This is always executed");
  }
}

void main() {
  Developer dev = Developer("Ivan", "Junior");
  print(dev.name);

  FrontendDeveloper frontDev = FrontendDeveloper("Dima", "Senior");
  frontDev.writeCode();

  JuniorDeveloper junDev = JuniorDeveloper.undefined();
  print(junDev.exp);

  JuniorDeveloper.showProgrammer(name: "Egor", age: 20);
  JuniorDeveloper.showAge();

  // 5. Коллекция, множество
  List<int> l = [5, 7, 2, 8, 91, 13];
  print("\n");
  print(l.length);
  print(l.reversed);
  print(l.first);
  print(l.last);
  print(l.isNotEmpty);

  Set<int> s = {5, 7, 2, 8, 91, 13};
  print("\n");
  print(s.add(521));
  print(s.elementAt(4));
  print(s.first);
  print(s.last);
  print(s.isNotEmpty);

  // 6. Работа с break/continue
  print("\n");
  demonstrateContinueAndBreak();

  // 7. Обработка ошибок
  print("\n");
  demonstrateExceptionHandling();
}
