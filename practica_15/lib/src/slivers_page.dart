import 'package:flutter/material.dart';
import 'dart:math';

class SliversPage extends StatelessWidget {
  final rnd = new Random();
  final List<Color> colores = [
    Colors.black,
    Colors.white,
    Colors.amber,
    Colors.brown,
    Colors.cyan,
    Colors.green,
    Colors.grey,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.lime,
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      70,
      (index) => Container(
        height: 100,
        color: colores[rnd.nextInt(this.colores.length)],
        width: double.infinity,
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Practica 15 Slivers'),
            centerTitle: true,
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://wallpaperaccess.com/full/496878.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(items)),
        ],
      ),
    );
  }
}
