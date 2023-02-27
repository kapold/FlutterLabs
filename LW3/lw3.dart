import 'dart:convert';
import 'dart:async';

class Developer {
  String position;
  String experience;
  Developer(this.position, this.experience);
}

// Миксин
mixin Person {
  String name = "";
  String surname = "";

  void getInfo() {
    print("Name: $name");
    print("Surname: $surname");
  }
}

class FullstackDeveloper extends Developer with Person {
  FullstackDeveloper(position, experience, devName, devSurname)
      : super(position, experience) {
    name = devName;
    surname = devSurname;
  }
}

// Интерфейсы
class Programmer implements Comparable<Programmer> {
  String name;
  int age;

  Programmer(this.name, this.age);

  @override
  int compareTo(Programmer other) {
    if (this.age == other.age) return this.name.compareTo(other.name);
    return this.age - other.age;
  }
}

class ProgrammerIterator implements Iterator<Programmer>, Iterable<Programmer> {
  List<Programmer> _programmers;
  int _currentIndex = 0;

  ProgrammerIterator(this._programmers);

  @override
  Programmer get current => _programmers[_currentIndex];

  @override
  bool moveNext() {
    _currentIndex++;
    return _currentIndex < _programmers.length;
  }

  @override
  Iterator<Programmer> get iterator => _programmers.iterator;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MyClass {
  int id;
  String name;

  MyClass({required this.id, required this.name});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  static MyClass fromJson(Map<String, dynamic> json) => MyClass(
        id: json['id'],
        name: json['name'],
      );

  @override
  String toString() {
    return "$id : $name";
  }
}

Future<int> getFutureData() async {
  await Future.delayed(Duration(seconds: 2));
  return 99;
}

Stream<int> getStreamData() async* {
  yield 1;
  await Future.delayed(Duration(seconds: 1));
  yield 2;
  await Future.delayed(Duration(seconds: 1));
  yield 3;
}

Stream<int> getSingleStreamData() {
  final controller = StreamController<int>();
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.close();
  return controller.stream;
}

Stream<int> getBroadcastData() {
  final controller = StreamController<int>.broadcast();
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  return controller.stream;
}

void main() async {
  // 1. Mixin
  FullstackDeveloper fullDev =
      FullstackDeveloper("Junior", "1 year", "Ivan", "Mashuk");
  fullDev.getInfo();
  print("\n");

  // 2. Comparable, Iterator, Iterable
  Programmer p1 = Programmer("P1", 14);
  Programmer p2 = Programmer("P2", 20);
  print(p1.compareTo(p2));

  List<Programmer> pList = [p1, p2];
  ProgrammerIterator pIter = new ProgrammerIterator(pList);
  print(pIter.moveNext());

  for (var element in pIter) {
    print(element);
  }
  print("\n");

  // 3. JSON
  var myClass = MyClass(id: 1, name: 'John Doe');

  var json = jsonEncode(myClass.toJson());
  print(json);

  var fromJson = MyClass.fromJson(jsonDecode(json));
  print(fromJson.toString());
  print("\n");

  // 4-5. Async, Future
  print("FUTURE: ");
  var result = await getFutureData();
  print(result);
  print("\n");

  // 6. Stream, Single
  print("STREAMS: ");
  var subscription1 = getStreamData().listen((data) => print(data));
  subscription1.onDone(() => print('Done!'));

  var subscription2 = getSingleStreamData().listen((data) => print(data));
  subscription2.onDone(() => print('Done!'));

  var subscription3 =
      getBroadcastData().listen((data) => print('Subscription 3: $data'));
  var subscription4 =
      getBroadcastData().listen((data) => print('Subscription 4: $data'));
}
