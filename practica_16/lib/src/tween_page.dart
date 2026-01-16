import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  @override
  _TweenPageState createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> {
  double _font = 25;
  Tween<double> _escalaTween = Tween<double>(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tween'), centerTitle: true),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: _escalaTween,
          curve: Curves.bounceOut,
          duration: Duration(milliseconds: 1800),
          builder: (BuildContext context, double escala, Widget? hijo) {
            return Transform.scale(scale: escala, child: hijo);
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.orangeAccent,
            child: Center(
              child: Text(
                'HOLA',
                style: TextStyle(fontSize: _font, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
