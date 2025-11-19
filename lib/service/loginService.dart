import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikator/model/Login.dart';

class LoginService {
  static const String baseUrl = 'https://ivory-boar-466427.hostingersite.com';
  static const String loginEndpoint = '/api/aplikator/login';

  Future<LoginResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl$loginEndpoint'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // ✅ Selalu coba parse JSON, terlepas dari status code
    try {
      final jsonData = jsonDecode(response.body);
      return LoginResponse.fromJson(jsonData);
    } catch (e) {
      // Jika gagal parse JSON, kembalikan error umum
      return LoginResponse(
        message: 'Terjadi kesalahan server',
        errors: {'general': ['Respons tidak valid dari server']},
      );
    }
  }
}