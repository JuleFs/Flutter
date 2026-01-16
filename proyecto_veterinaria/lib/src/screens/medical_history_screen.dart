import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/pet.dart';
import '../models/medical_record.dart';

class MedicalHistoryScreen extends StatelessWidget {
  final Pet pet;

  const MedicalHistoryScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    // Mock data - Replace with actual data from backend
    final List<MedicalRecord> records = [
      MedicalRecord(
        id: '1',
        date: DateTime.now().subtract(const Duration(days: 30)),
        diagnosis: 'Vacunación antirrábica',
        treatment: 'Vacuna antirrábica aplicada',
        veterinarian: 'Dr. García',
        notes: 'Mascota en buen estado de salud. Próxima vacunación en 1 año.',
      ),
      MedicalRecord(
        id: '2',
        date: DateTime.now().subtract(const Duration(days: 90)),
        diagnosis: 'Desparasitación',
        treatment: 'Medicamento desparasitante oral',
        veterinarian: 'Dra. López',
        notes: 'Administrar cada 3 meses',
      ),
      MedicalRecord(
        id: '3',
        date: DateTime.now().subtract(const Duration(days: 180)),
        diagnosis: 'Revisión general',
        treatment: 'Chequeo completo, análisis de sangre',
        veterinarian: 'Dr. García',
        notes: 'Todos los valores normales. Peso adecuado.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de ${pet.name}'),
      ),
      body: records.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medical_services_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No hay registros médicos',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return _MedicalRecordCard(
                  record: record,
                  onTap: () => _showRecordDetails(context, record),
                );
              },
            ),
    );
  }

  void _showRecordDetails(BuildContext context, MedicalRecord record) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Detalles del Registro',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              _DetailSection(
                icon: Icons.calendar_today,
                label: 'Fecha',
                value: '${record.date.day}/${record.date.month}/${record.date.year}',
              ),
              const SizedBox(height: 16),
              _DetailSection(
                icon: Icons.person,
                label: 'Veterinario',
                value: record.veterinarian,
              ),
              const SizedBox(height: 16),
              _DetailSection(
                icon: Icons.medical_services,
                label: 'Diagnóstico',
                value: record.diagnosis,
              ),
              const SizedBox(height: 16),
              _DetailSection(
                icon: Icons.healing,
                label: 'Tratamiento',
                value: record.treatment,
              ),
              const SizedBox(height: 16),
              _DetailSection(
                icon: Icons.notes,
                label: 'Observaciones',
                value: record.notes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MedicalRecordCard extends StatelessWidget {
  final MedicalRecord record;
  final VoidCallback onTap;

  const _MedicalRecordCard({
    required this.record,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      record.date.day.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                    Text(
                      _getMonthName(record.date.month),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.diagnosis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.treatment,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.veterinarian,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppTheme.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];
    return months[month - 1];
  }
}

class _DetailSection extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailSection({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppTheme.primaryColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
