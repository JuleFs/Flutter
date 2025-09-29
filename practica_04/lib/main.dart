import 'package:flutter/material.dart';
import 'package:practica_04/src/splash_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 04',
      home: SplashScreen()
    );
  }
}
