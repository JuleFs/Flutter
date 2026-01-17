import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/appointment.dart';
import 'api_config.dart';
import 'storage_service.dart';

class AppointmentsService {
  // Get authorization headers
  static Future<Map<String, String>> _getHeaders() async {
    final token = await StorageService.getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Get my appointments
  static Future<Map<String, dynamic>> getMyAppointments() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.myAppointments}');
      final headers = await _getHeaders();
      
      final response = await http.get(url, headers: headers);

      debugPrint('[v0] Get appointments response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Convert response to list of Appointment objects
        final List<Appointment> appointments = [];
        if (data != null) {
          for (var appointmentData in data) {
            appointments.add(Appointment.fromJson(appointmentData));
          }
        }
        
        return {
          'success': true,
          'appointments': appointments,
        };
      } else if (response.statusCode == 401) {
        return {
          'success': false,
          'message': 'Sesión expirada. Por favor inicia sesión nuevamente.',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['mensaje'] ?? 'Error al obtener citas',
        };
      }
    } catch (e) {
      debugPrint('[v0] Get appointments error: $e');
      return {
        'success': false,
        'message': 'Error de conexión. Verifica tu conexión a internet.',
      };
    }
  }

  // Create new appointment
  static Future<Map<String, dynamic>> createAppointment({
    required String mascotaId,
    required DateTime fecha,
    required String motivo,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.createAppointment}');
      final headers = await _getHeaders();
      
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'mascota_id': mascotaId,
          'fecha': fecha.toIso8601String(),
          'motivo': motivo,
        }),
      );

      debugPrint('[v0] Create appointment response status: ${response.statusCode}');
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        
        return {
          'success': true,
          'appointment': Appointment.fromJson(data['cita'] ?? data),
          'message': 'Cita agendada exitosamente',
        };
      } else if (response.statusCode == 401) {
        return {
          'success': false,
          'message': 'Sesión expirada. Por favor inicia sesión nuevamente.',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['mensaje'] ?? 'Error al agendar cita',
        };
      }
    } catch (e) {
      debugPrint('[v0] Create appointment error: $e');
      return {
        'success': false,
        'message': 'Error de conexión. Verifica tu conexión a internet.',
      };
    }
  }

  // Update appointment status
  static Future<Map<String, dynamic>> updateAppointmentStatus({
    required String appointmentId,
    required String estado,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiConfig.baseUrl}${ApiConfig.updateAppointmentStatus(appointmentId)}'
      );
      final headers = await _getHeaders();
      
      final response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode({
          'estado': estado,
        }),
      );

      debugPrint('[v0] Update appointment status response: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        return {
          'success': true,
          'message': 'Estado de cita actualizado',
          'data': data,
        };
      } else if (response.statusCode == 401) {
        return {
          'success': false,
          'message': 'Sesión expirada. Por favor inicia sesión nuevamente.',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['mensaje'] ?? 'Error al actualizar estado',
        };
      }
    } catch (e) {
      debugPrint('[v0] Update appointment error: $e');
      return {
        'success': false,
        'message': 'Error de conexión. Verifica tu conexión a internet.',
      };
    }
  }
}
