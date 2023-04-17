import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Person {
  String? name;
  int? age;
  String? address;
  String? phone;

  Person({this.name, this.age, this.address, this.phone});
}

class HiveDB {
  static const String _personBoxName = 'personBox';

  Future<Box<Person>> _getPersonBox() async {
    final personBox = await Hive.openBox<Person>(_personBoxName);
    return personBox;
  }

  Future<List<Person>> getAllPersons() async {
    final personBox = await _getPersonBox();
    final persons = personBox.values.toList();
    return persons;
  }

  Future<void> addPerson(Person person) async {
    final personBox = await _getPersonBox();
    await personBox.add(person);
  }

  Future<void> updatePerson(int index, Person person) async {
    final personBox = await _getPersonBox();
    await personBox.putAt(index, person);
  }

  Future<void> delAll()async{
    final personBox = await _getPersonBox();
    await personBox.clear();
  }

  Future<void> deletePerson(int index) async {
    final personBox = await _getPersonBox();
    await personBox.deleteAt(index);
  }
}

