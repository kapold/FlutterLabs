import 'package:flutter/material.dart';
import 'package:lw45/pages/FirstPage.dart';
import 'package:lw45/pages/HomePage.dart';
import 'package:lw45/pages/InfoPage.dart';
import 'package:lw45/pages/SecondPage.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final _controller = PageController(
    initialPage: 0,
    //viewportFraction: 0.8
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: const [
        FirstPage(),
        SecondPage()
      ],
    );
  }
}