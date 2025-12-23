// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikator/model/aplikator_model.dart';
import '../utils/constants.dart';

class ApiService {
  // lib/services/api_service.dart

  // lib/services/api_service.dart

  static Future<Aplikator> login(String email, String password) async {
    final url = Uri.parse('${Constants.baseUrl}/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );

      // SELALU decode dulu, jangan langsung throw
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Aplikator.fromJson(data);
      }

      // ===== KHUSUS ERROR VALIDASI LARAVEL (422) =====
      if (response.statusCode == 422) {
        String errorMsg = 'Email atau password salah.';

        // Prioritas 1: ambil dari errors.email
        if (data['errors']?['email'] != null &&
            (data['errors']['email'] as List).isNotEmpty) {
          errorMsg = data['errors']['email'][0];
        }
        // Prioritas 2: ambil dari message
        else if (data['message'] != null) {
          errorMsg = data['message'];
        }

        // PAKAI Exception biasa, bukan String langsung
        throw Exception(errorMsg);
      }

      // Error lain (500, 401, dll)
      throw Exception(
        data['message'] ?? 'Terjadi kesalahan (${response.statusCode})',
      );
    } on FormatException {
      throw Exception('Respons server tidak valid');
    } on Exception catch (e) {
      // Semua error akan sampai sini → pasti masuk ke catch di controller
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Fungsi logout (opsional, bisa dipanggil dari controller lain)
  static Future<void> logout(String token) async {
    final url = Uri.parse('${Constants.baseUrl}/logout');
    await http.post(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
  }
}
