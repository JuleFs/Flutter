import 'package:flutter/material.dart';
import 'package:practica_11/src/shared_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 11',
      home: SharedPage(),
    );
  }
}
