import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _height = 150;
  double _width = 150;
  double _font = 25;

  void _updateState() {
    setState(() {
      _height = _height == 150 ? 300 : 150;
      _width = _width == 150 ? 300 : 150;
      _font = _font == 25 ? 50 : 25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated'), centerTitle: true),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 900),
          curve: Curves.bounceOut,
          width: _width,
          height: _height,
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              'HOLA',
              style: TextStyle(fontSize: _font, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateState();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
