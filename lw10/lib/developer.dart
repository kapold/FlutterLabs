import 'package:cloud_firestore/cloud_firestore.dart';

class Developer {
  String name;
  String position;

  Developer(this.name, this.position);

  Map<String, dynamic> toMap() {
    return {'name': name, 'position': position};
  }

  static List<Developer> fromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Developer(doc.get('name'), doc.get('position')))
        .toList();
  }
}