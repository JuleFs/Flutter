class MedicalRecord {
  final String id;
  final DateTime date;
  final String diagnosis;
  final String treatment;
  final String veterinarian;
  final String notes;
  final List<String>? vaccines;
  final List<String>? medications;

  MedicalRecord({
    required this.id,
    required this.date,
    required this.diagnosis,
    required this.treatment,
    required this.veterinarian,
    required this.notes,
    this.vaccines,
    this.medications,
  });

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    return MedicalRecord(
      id: json['id'],
      date: DateTime.parse(json['date']),
      diagnosis: json['diagnosis'],
      treatment: json['treatment'],
      veterinarian: json['veterinarian'],
      notes: json['notes'],
      vaccines: json['vaccines'] != null
          ? List<String>.from(json['vaccines'])
          : null,
      medications: json['medications'] != null
          ? List<String>.from(json['medications'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'diagnosis': diagnosis,
      'treatment': treatment,
      'veterinarian': veterinarian,
      'notes': notes,
      'vaccines': vaccines,
      'medications': medications,
    };
  }
}
