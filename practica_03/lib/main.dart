import 'package:flutter/material.dart';
import 'package:practica_03/src/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 03',
      home: HomePage()
    );
  }
}