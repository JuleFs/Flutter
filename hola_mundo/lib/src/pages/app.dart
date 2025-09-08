import 'package:flutter/material.dart';
import 'package:hola_mundo/src/pages/increment_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primer App en Flutter',
      home: Center(
        child: IncrementPage(),
      ),
    );
  }
}