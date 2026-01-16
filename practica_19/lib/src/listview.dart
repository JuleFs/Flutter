import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ui/list_tile.dart';
import '../ui/head_container.dart';

// Modelo para los metadatos de la API
class Info {
  int count;
  int pages;
  String? next;
  String? prev;

  Info({required this.count, required this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );
}

// Modelo para un personaje
class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String image;
  String url;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.url,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"],
    gender: json["gender"],
    image: json["image"],
    url: json["url"],
  );
}

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List<Character> characters = [];
  Info? info;
  String nextUrl = 'https://rickandmortyapi.com/api/character';
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (info?.next != null && !isLoading) {
          _fetchCharacters();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchCharacters() async {
    if (nextUrl.isEmpty || isLoading) return;

    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(nextUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      info = Info.fromJson(data["info"]);
      final List<dynamic> results = data["results"];
      final List<Character> newCharacters = results
          .map((json) => Character.fromJson(json))
          .toList();

      setState(() {
        characters.addAll(newCharacters);
        nextUrl = info?.next ?? '';
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practica 19-API'), centerTitle: true),
      body: Column(
        children: [
          const HeadContainer(),
          Expanded(
            child: characters.isEmpty
                ? Center(
                    child: Image.asset(
                      'assets/progress.gif',
                      width: 100,
                      height: 100,
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: characters.length + 1,
                    itemBuilder: (context, index) {
                      if (index < characters.length) {
                        return ListTileWidget(character: characters[index]);
                      } else {
                        return nextUrl.isNotEmpty
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : const SizedBox.shrink();
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
