import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Center(
        child: Text('Aquí va la calculadora de IMC'),
      ),
    );
  }
}