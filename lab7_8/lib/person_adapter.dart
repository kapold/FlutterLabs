import 'package:hive/hive.dart';

import 'hive.dart';
import 'hive.dart';

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final typeId = 0;

  @override
  Person read(BinaryReader reader) {
    final name = reader.read();
    final age = reader.read();
    final address = reader.read();
    final phone = reader.read();
    return Person(name: name, age: age, address: address, phone: phone);
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer.write(obj.name);
    writer.write(obj.age);
    writer.write(obj.address);
    writer.write(obj.phone);
  }
}
