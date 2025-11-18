// lib/service/BlokService.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikator/model/Blok.dart';

class BlokService {
  final String baseUrl = "https://15d9cac645c0.ngrok-free.app/api/aplikator";

  Future<List<Blok>> fetchBlok() async {
    final response = await http.get(
      Uri.parse("$baseUrl/bloks"),
      headers: {"Accept": "application/json"},
      
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
    } else {
      print("❌ [BlokService] Gagal ambil data. Status: ${response.statusCode}");
      throw Exception("Gagal mengambil data blok. Status: ${response.statusCode}");
    }
  }
}