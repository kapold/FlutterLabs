import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lab7_8/dirs.dart';
import 'package:lab7_8/shaPref.dart';
import 'package:lab7_8/sqflitePage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive.dart';
import 'person_adapter.dart';

void main() {
  runApp(const MyApp());
}

Future<void> initHive() async {
  Hive.registerAdapter(PersonAdapter());
  await Hive.initFlutter();
  final hiveDB = HiveDB();

  // Creating a new person
  final person = Person(name: 'John Doe', age: 35, address: '123 Main St', phone: '+543523525');
  final person2 = Person(name: 'Dima Zayank', age: 19, address: 'Odoevskogo 122', phone: '+375295437543');

  await hiveDB.addPerson(person);
  await hiveDB.addPerson(person2);

  //await hiveDB.delAll();

  // Reading all persons
  List<Person> persons = await hiveDB.getAllPersons();
  for (int i =0;i<persons.length;i++){
    print('${persons[i].name}  ${persons[i].age}  ${persons[i].address}  ${persons[i].phone}');
  }

  // Updating a person
  final updatedPerson = Person(name: 'Aleksii Tihon', age: 20, address: 'Brest', phone: '+32553453');
  await hiveDB.updatePerson(0, updatedPerson);
  persons = await hiveDB.getAllPersons();

  for (int i =0;i<persons.length;i++){
    print('${persons[i].name}  ${persons[i].age}  ${persons[i].address}  ${persons[i].phone}');
  }

  // Deleting a person
  await hiveDB.deletePerson(0);
  persons = await hiveDB.getAllPersons();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SharedPreferencesPage(title: "Shared Preferences"),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
              ),
              child: const Text(
                "Shared Preferenced",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HomePage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
              ),
              child: const Text(
                "SQFLITE",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        FileIOExample(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
              ),
              child: const Text(
                "Dirs",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                initHive();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
              ),
              child: const Text(
                "Hive",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
      )
    );
  }
}
