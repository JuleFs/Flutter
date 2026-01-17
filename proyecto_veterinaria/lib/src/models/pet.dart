class Pet {
  final int id;
  final String name;
  final String species;
  final String breed;
  final int age;
  final String? imageUrl;
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
    this.imageUrl,
    this.gender,
    this.weight,
    this.color,
    this.birthDate,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] ?? json['mascota_id'] ?? 0,
      name: json['nombre'] ?? json['name'] ?? '',
      species: json['especie'] ?? json['species'] ?? '',
      breed: json['raza'] ?? json['breed'] ?? '',
      age: json['edad'] ?? json['age'] ?? 0,
      imageUrl: json['imagen_url'] ?? json['imageUrl'] ?? '/placeholder.svg?height=100&width=100',
      gender: json['genero'] ?? json['gender'],
      weight: json['peso']?.toDouble() ?? json['weight']?.toDouble(),
      color: json['color'],
      birthDate: json['fecha_nacimiento'] != null
          ? DateTime.parse(json['fecha_nacimiento'])
          : json['birthDate'] != null
              ? DateTime.parse(json['birthDate'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': name,
      'especie': species,
      'raza': breed,
      'edad': age,
      'imagen_url': imageUrl,
      'genero': gender,
      'peso': weight,
      'color': color,
      'fecha_nacimiento': birthDate?.toIso8601String(),
    };
  }
}
