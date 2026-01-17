import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';
import 'storage_service.dart';

class AuthService {
  // Login user
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.authLogin}');
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      debugPrint('[v0] Login response status: ${response.statusCode}');
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        
        // Save token and user data
        if (data['token'] != null) {
          await StorageService.saveToken(data['token']);
        }
        
        if (data['usuario'] != null) {
          await StorageService.saveUserData(
            userId: data['usuario']['id']?.toString() ?? '',
            email: data['usuario']['email'] ?? email,
            name: data['usuario']['nombre'],
          );
        }
        
        return {
          'success': true,
          'data': data,
          'message': 'Inicio de sesión exitoso',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['mensaje'] ?? 'Error al iniciar sesión',
        };
      }
    } catch (e) {
      debugPrint('[v0] Login error: $e');
      return {
        'success': false,
        'message': 'Error de conexión. Verifica tu conexión a internet.',
      };
    }
  }

  // Register new user
  static Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String nombre,
    required String telefono,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.authRegister}');
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'nombre': nombre,
          'telefono': telefono,
        }),
      );

      debugPrint('[v0] Register response status: ${response.statusCode}');
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        
        // Save token and user data if provided
        if (data['token'] != null) {
          await StorageService.saveToken(data['token']);
        }
        
        if (data['usuario'] != null) {
          await StorageService.saveUserData(
            userId: data['usuario']['id']?.toString() ?? '',
            email: data['usuario']['email'] ?? email,
            name: data['usuario']['nombre'] ?? nombre,
          );
        }
        
        return {
          'success': true,
          'data': data,
          'message': 'Registro exitoso',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['mensaje'] ?? 'Error al registrarse',
        };
      }
    } catch (e) {
      debugPrint('[v0] Register error: $e');
      return {
        'success': false,
        'message': 'Error de conexión. Verifica tu conexión a internet.',
      };
    }
  }

  // Logout user
  static Future<void> logout() async {
    await StorageService.clearAll();
  }
}
