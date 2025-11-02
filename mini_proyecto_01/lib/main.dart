import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/imc_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IMCPage(),
    );
  }
}
