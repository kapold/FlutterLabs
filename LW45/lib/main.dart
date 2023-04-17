import 'package:flutter/material.dart';
import 'package:lw45/pages/HomePage.dart';
import 'package:lw45/pages/InfoPage.dart';
import 'package:lw45/pages/ViewPage.dart';
import 'package:lw45/pages/FirstPage.dart';
import 'package:lw45/pages/SecondPage.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/view',
  routes: {
    '/': (context) => const HomePage(),
    '/info': (context) => const InfoPage(),
    '/view': (context) => const ViewPage(),
    '/first': (context) => const FirstPage(),
    '/second': (context) => const SecondPage()
  },
  debugShowCheckedModeBanner: false
));
