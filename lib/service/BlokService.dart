import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikator/model/Blok.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlokService {
  final String baseUrl = "https://ivory-boar-466427.hostingersite.com/api/aplikator";

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<List<Blok>> fetchBlok() async {
    final token = await _getToken();
    if (token == null || token.isEmpty) {
      print("❌ [BlokService] Token tidak tersedia. Pengguna belum login.");
      throw Exception("Token tidak ditemukan. Silakan login terlebih dahulu.");
    }

    final response = await http.get(
      Uri.parse("$baseUrl/bloks"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token", // 🔑 Kirim token di header
      },
    );

    print("🔥 [BlokService] Status: ${response.statusCode}");
    print("🔥 [BlokService] Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        final dynamic data = json.decode(response.body);
        final List blokList = data['data'] as List;
        print("✅ [BlokService] Jumlah blok: ${blokList.length}");
        return blokList.map((e) => Blok.fromJson(e as Map<String, dynamic>)).toList();
      } catch (e) {
        print("❌ [BlokService] Error parsing: $e");
        throw Exception("Gagal parsing JSON: $e");
      }
    } else if (response.statusCode == 401) {
      print("❌ [BlokService] Unauthorized – Token tidak valid atau kadaluarsa");
      throw Exception("Sesi Anda telah berakhir. Silakan login ulang.");
    } else {
      print("❌ [BlokService] Gagal ambil data. Status: ${response.statusCode}");
      throw Exception("Gagal mengambil data blok. Status: ${response.statusCode}");
    }
  }
}