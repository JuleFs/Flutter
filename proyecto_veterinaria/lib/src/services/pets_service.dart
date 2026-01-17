import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/pet.dart';
import 'api_config.dart';
import 'storage_service.dart';

class PetsService {
  // Get authorization headers
  static Future<Map<String, String>> _getHeaders() async {
    final token = await StorageService.getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Get my pets
  static Future<Map<String, dynamic>> getMyPets() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.myPets}');
      final headers = await _getHeaders();

      final response = await http.get(url, headers: headers);

      debugPrint('[v0] Get pets response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Normalize mascotas to a List<dynamic> to handle cases where the API
        // returns a JSON string, a Map or a List.
        final raw = data;
        List<dynamic> mascotasList = [];
        if (raw == null) {
          mascotasList = [];
        } else if (raw is String) {
          try {
            final decoded = jsonDecode(raw);
            mascotasList = decoded is List
                ? decoded
                : (decoded is Map ? decoded.values.toList() : []);
          } catch (_) {
            mascotasList = [];
          }
        } else if (raw is List) {
          mascotasList = raw;
        } else if (raw is Map) {
          mascotasList = raw.values.toList();
        }

        // Convert response to list of Pet objects
        final List<Pet> pets = [];
        for (var petData in mascotasList) {
          if (petData is Map<String, dynamic>) {
            pets.add(Pet.fromJson(petData));
          } else if (petData is Map) {
            pets.add(Pet.fromJson(Map<String, dynamic>.from(petData)));
          }
        }

        return {
          'success': true,
          'pets': pets,
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
          'message': errorData['mensaje'] ?? 'Error al obtener mascotas',
        };
      }
    } catch (e) {
      debugPrint('[v0] Get pets error: $e');
      return {
        'success': false,
        'message': 'Error de conexión. Verifica tu conexión a internet.',
      };
    }
  }

  // Register new pet
  static Future<Map<String, dynamic>> registerPet({
    required String nombre,
    required String especie,
    required String raza,
    required int edad,
    required String genero,
    required double peso,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.registerPet}');
      final headers = await _getHeaders();

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'nombre': nombre,
          'especie': especie,
          'raza': raza,
          'edad': edad,
          'genero': genero,
          'peso': peso,
        }),
      );

      debugPrint('[v0] Register pet response status: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        return {
          'success': true,
          'pet': Pet.fromJson(data['mascota'] ?? data),
          'message': 'Mascota registrada exitosamente',
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
          'message': errorData['mensaje'] ?? 'Error al registrar mascota',
        };
      }
    } catch (e) {
      debugPrint('[v0] Register pet error: $e');
      return {
        'success': false,
        'message': 'Error de conexión. Verifica tu conexión a internet.',
      };
    }
  }
}
