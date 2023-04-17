import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileIOExample extends StatefulWidget {
  @override
  _FileIOExampleState createState() => _FileIOExampleState();
}

class _FileIOExampleState extends State<FileIOExample> {
  String _content = '';
  String _selectedDirectory = '';

  Future<File> _getFile(String directory) async {
    Directory appDirectory;
    if (Platform.isIOS) {
      switch (directory) {
        case 'TemporaryDirectory':
          appDirectory = await getTemporaryDirectory();
          break;
        case 'ApplicationDocumentsDirectory':
          appDirectory = await getApplicationDocumentsDirectory();
          break;
        case 'Application Support':
          appDirectory = await getApplicationSupportDirectory();
          break;
        case 'LibraryDirectory':
          appDirectory = await getLibraryDirectory();
          break;
        default:
          throw Exception('Invalid directory name');
      }
    } else if (Platform.isAndroid) {
      switch (directory) {
        case 'TemporaryDirectory':
          appDirectory = await getTemporaryDirectory();
          break;
        case 'ApplicationDocumentsDirectory':
          appDirectory = await getApplicationDocumentsDirectory();
          break;

        default:
          throw Exception('Invalid directory name');
      }
    } else {
      throw Exception('Unsupported platform');
    }

    return File('${appDirectory.path}/example.txt');
  }

  Future<String> _readFile(String directory) async {
    try {
      final file = await _getFile(directory);
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'Error reading file: $e';
    }
  }

  Future<void> _writeFile(String directory, String content) async {
    try {
      final file = await _getFile(directory);
      await file.writeAsString(content);
      setState(() {
        _content = content;
      });
    } catch (e) {
      setState(() {
        _content = 'Error writing file: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dirs'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Content of the file:'),
          SizedBox(height: 8),
          Text('$_content'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDirectory = 'TemporaryDirectory';
                  });
                },
                child: Text('Temporary'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDirectory = 'ApplicationDocumentsDirectory';
                  });
                },
                child: Text('Documents'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDirectory = 'ApplicationSupportDirectory';
                  });
                },
                child: Text('Support'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(
              onPressed: () {
        setState(() {
        _selectedDirectory = 'LibraryDirectory';
        });
        },
          child: Text('Library'),
        ),
        ElevatedButton(
        onPressed: () {
      setState(() {
        _selectedDirectory = 'ExternalStorageDirectory';
      });
        },
          child: Text('External Storage'),
        ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDirectory = 'ExternalCacheDirectories';
                    });
                  },
                  child: Text('External Cache'),
                ),
              ],
          ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final content = await _readFile(_selectedDirectory);
                    setState(() {
                      _content = content;
                    });
                  },
                  child: Text('Read File'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await _writeFile(_selectedDirectory, 'Hell 76');
                  },
                  child: Text('Write File'),
                ),
              ],
          ),
        ),
    );
  }
}
