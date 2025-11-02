import 'package:flutter/material.dart';
import 'package:practica_12/src/view_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 12',
      home: ViewPage(),
    );
  }
}