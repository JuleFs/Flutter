import 'package:flutter/material.dart';
import 'package:practica_14/src/crud_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 14',
      home: CrudPage(),
    );
  }
}
