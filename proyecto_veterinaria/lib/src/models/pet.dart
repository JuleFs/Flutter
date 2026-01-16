class Pet {
  final String id;
  final String name;
  final String species;
  final String breed;
  final int age;
  final String imageUrl;
  final String? gender;
  final double? weight;
  final String? color;
  final DateTime? birthDate;

  Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.age,
    required this.imageUrl,
    this.gender,
    this.weight,
    this.color,
    this.birthDate,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      breed: json['breed'],
      age: json['age'],
      imageUrl: json['imageUrl'] ?? '',
      gender: json['gender'],
      weight: json['weight']?.toDouble(),
      color: json['color'],
      birthDate: json['birthDate'] != null
          ? DateTime.parse(json['birthDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'species': species,
      'breed': breed,
      'age': age,
      'imageUrl': imageUrl,
      'gender': gender,
      'weight': weight,
      'color': color,
      'birthDate': birthDate?.toIso8601String(),
    };
  }
}
