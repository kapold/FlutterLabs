import 'package:flutter/material.dart';
import 'package:lw45/battery_service.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class DataRequiredForBuild {
  String battery;

  DataRequiredForBuild({
    required this.battery,
  });
}

class _FirstPageState extends State<FirstPage> {
  late Future<int> _dataRequiredForBuild;

  @override
  void initState() {
    _dataRequiredForBuild = BatteryService.getBatteryLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //removed
      body: FutureBuilder<int>(
        future: _dataRequiredForBuild,
        builder: (context, snapshot) {
          return snapshot.hasData ? Text(snapshot.data.battery.toString());
        }
      ),
    );
  }
}