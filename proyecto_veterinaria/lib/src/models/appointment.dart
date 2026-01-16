class Appointment {
  final String id;
  final String petName;
  final DateTime date;
  final String reason;
  final String status;
  final String? veterinarian;
  final String? notes;

  Appointment({
    required this.id,
    required this.petName,
    required this.date,
    required this.reason,
    required this.status,
    this.veterinarian,
    this.notes,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      petName: json['petName'],
      date: DateTime.parse(json['date']),
      reason: json['reason'],
      status: json['status'],
      veterinarian: json['veterinarian'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'petName': petName,
      'date': date.toIso8601String(),
      'reason': reason,
      'status': status,
      'veterinarian': veterinarian,
      'notes': notes,
    };
  }
}
