class Appointment {
  final String id;
  final String petName;
  final String? petId;
  final DateTime date;
  final String reason;
  final String status;
  final String? veterinarian;
  final String? notes;

  Appointment({
    required this.id,
    required this.petName,
    this.petId,
    required this.date,
    required this.reason,
    required this.status,
    this.veterinarian,
    this.notes,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id']?.toString() ?? json['cita_id']?.toString() ?? '',
      petName: json['mascota_nombre'] ?? json['petName'] ?? '',
      petId: json['mascota_id']?.toString(),
      date: json['fecha'] != null 
          ? DateTime.parse(json['fecha'])
          : json['date'] != null
              ? DateTime.parse(json['date'])
              : DateTime.now(),
      reason: json['motivo'] ?? json['reason'] ?? '',
      status: json['estado'] ?? json['status'] ?? 'Pendiente',
      veterinarian: json['veterinario'] ?? json['veterinarian'],
      notes: json['notas'] ?? json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mascota_id': petId,
      'mascota_nombre': petName,
      'fecha': date.toIso8601String(),
      'motivo': reason,
      'estado': status,
      'veterinario': veterinarian,
      'notas': notes,
    };
  }
}
