import 'package:flutter/material.dart';
import 'package:lw45/pages/HomePage.dart';
import 'package:lw45/pages/InfoPage.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const HomePage(),
    '/info': (context) => const InfoPage()
  },
  debugShowCheckedModeBanner: false
));
