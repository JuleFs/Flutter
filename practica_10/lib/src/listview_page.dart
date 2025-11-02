import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  final List<String> _clasesPokemon = [
    'Normal',
    'Fire',
    'Water',
    'Grass',
    'Electric',
    'Psychic',
    'Ice',
    'Dragon',
    'Dark',
    'Fairy',
    'Flying',
    'Bug',
    'Rock',
    'Ghost',
    'Steel',
    'Poison',
    'Ground',
    'Fighting',
    'Shadow',
    'Unknown',
    '--------',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 10 - Pokedex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: _clasesPokemon.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${_clasesPokemon[index]}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/287/287221.png',
              ),
              radius: 16.0,
            ),
            trailing: Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
