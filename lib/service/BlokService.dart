// lib/service/BlokService.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikator/model/Blok.dart';
import 'package:aplikator/utils/token_manager.dart'; // tambahkan

class BlokService {
  // PERBAIKI URL (hapus double slash)
  final String baseUrl = "https://sakuraindahcipatujah.com/api/aplikator";

  Future<String?> _getToken() async {
    return await TokenManager.getToken();
  }

  Future<List<Blok>> fetchBlok() async {
    final token = await _getToken();

    print(
      "🔑 [BlokService] Token: ${token != null ? '${token.substring(0, min(20, token.length))}...' : 'NULL'}",
    );

    if (token == null || token.isEmpty) {
      print("❌ [BlokService] Token tidak tersedia.");
      throw Exception("Token tidak ditemukan. Silakan login terlebih dahulu.");
    }

    final response = await http.get(
      Uri.parse("$baseUrl/bloks"),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print("🔥 [BlokService] URL: $baseUrl/bloks");
    print("🔥 [BlokService] Status: ${response.statusCode}");
    print(
      "🔥 [BlokService] Body: ${response.body.length > 200 ? '${response.body.substring(0, 200)}...' : response.body}",
    );

    if (response.statusCode == 200) {
      try {
        final dynamic data = json.decode(response.body);

        // Handle berbagai format response
        List blokList = [];

        if (data is Map && data.containsKey('data')) {
          blokList = data['data'] as List;
        } else if (data is List) {
          blokList = data;
        } else {
          throw Exception("Format response tidak dikenali");
        }

        print("✅ [BlokService] Jumlah blok: ${blokList.length}");

        return blokList
            .map((e) => Blok.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (e) {
        print("❌ [BlokService] Error parsing: $e");
        throw Exception("Gagal parsing JSON: $e");
      }
    } else if (response.statusCode == 401) {
      print("❌ [BlokService] Unauthorized - Token tidak valid");

      // Bersihkan token yang tidak valid
      await TokenManager.clearToken();

      throw Exception("Sesi Anda telah berakhir. Silakan login ulang.");
    } else {
      print("❌ [BlokService] Gagal ambil data. Status: ${response.statusCode}");
      throw Exception(
        "Gagal mengambil data blok. Status: ${response.statusCode}",
      );
    }
  }

  // Helper untuk min function
  static int min(int a, int b) => a < b ? a : b;
}
