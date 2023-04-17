import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  SharedPreferencesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final _keyController = TextEditingController();
  final _valueController = TextEditingController();

  String? _value;

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyController.text, _valueController.text);
  }

  Future<void> _readData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _value = prefs.getString(_keyController.text);
    });
  }

  Future<void> _deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _keyController,
              decoration: InputDecoration(
                labelText: 'Key',
              ),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                labelText: 'Value',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveData,
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: _readData,
                  child: Text('Read'),
                ),
                ElevatedButton(
                  onPressed: _deleteData,
                  child: Text('Delete'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(_value ?? ''),
          ],
        ),
      ),
    );
  }
}
