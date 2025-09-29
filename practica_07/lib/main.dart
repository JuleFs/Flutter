import 'package:flutter/material.dart';
import 'package:practica_07/src/bottom_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 07',
      home: BottomNavigatorPage(),
    );
  }
}
