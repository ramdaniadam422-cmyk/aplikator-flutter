// lib/utils/token_manager.dart
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static final GetStorage _box = GetStorage();

  // ================== SIMPAN TOKEN ==================
  static Future<void> saveToken(String token) async {
    try {
      // 1. Simpan ke GetStorage (utama)
      await _box.write('token', token);
      print("✅ [TokenManager] Token disimpan ke GetStorage");

      // 2. Simpan ke SharedPreferences (untuk kompatibilitas)
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      print("✅ [TokenManager] Token disimpan ke SharedPreferences");

      // 3. Pastikan token tersimpan dengan benar
      final verify1 = _box.read('token');
      final verify2 = prefs.getString('auth_token');

      if (verify1 == token && verify2 == token) {
        print(
          "✅ [TokenManager] Token berhasil disinkronisasi di kedua penyimpanan",
        );
      } else {
        print("⚠️ [TokenManager] Peringatan: Token mungkin tidak sinkron");
      }
    } catch (e) {
      print("❌ [TokenManager] Error saveToken: $e");
      rethrow;
    }
  }

  // ================== AMBIL TOKEN ==================
  static Future<String?> getToken() async {
    try {
      // Prioritas: GetStorage
      final token = _box.read('token');

      if (token != null && token.isNotEmpty) {
        print(
          "✅ [TokenManager] Token ditemukan di GetStorage: ${token.substring(0, 20)}...",
        );
        return token;
      }

      // Fallback: SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final fallbackToken = prefs.getString('auth_token');

      if (fallbackToken != null && fallbackToken.isNotEmpty) {
        print(
          "⚠️ [TokenManager] Token diambil dari SharedPreferences (fallback)",
        );

        // Sinkronkan kembali ke GetStorage
        await _box.write('token', fallbackToken);
        return fallbackToken;
      }

      print("❌ [TokenManager] Token tidak ditemukan di kedua penyimpanan");
      return null;
    } catch (e) {
      print("❌ [TokenManager] Error getToken: $e");
      return null;
    }
  }

  // ================== HAPUS TOKEN ==================
  static Future<void> clearToken() async {
    try {
      // Hapus dari GetStorage
      await _box.remove('token');

      // Hapus dari SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');

      print("✅ [TokenManager] Token dihapus dari semua penyimpanan");
    } catch (e) {
      print("❌ [TokenManager] Error clearToken: $e");
    }
  }

  // ================== CEK TOKEN VALID ==================
  static Future<bool> hasValidToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // ================== GET TOKEN INFO ==================
  static Future<void> printTokenInfo() async {
    final token = await getToken();

    if (token == null) {
      print("🔴 [TokenManager] Token: NULL (belum login)");
    } else {
      print("🟢 [TokenManager] Token: ${token.length} karakter");
      print(
        "🔑 [TokenManager] Token preview: ${token.substring(0, min(20, token.length))}...",
      );

      // Cek kesinkronan
      final prefs = await SharedPreferences.getInstance();
      final spToken = prefs.getString('auth_token');
      final gsToken = _box.read('token');

      if (spToken == gsToken) {
        print(
          "✅ [TokenManager] Token sinkron antara GetStorage dan SharedPreferences",
        );
      } else {
        print("⚠️ [TokenManager] Token TIDAK sinkron!");
        print("   GetStorage: ${gsToken?.length ?? 0} karakter");
        print("   SharedPreferences: ${spToken?.length ?? 0} karakter");
      }
    }
  }

  // Helper untuk min function
  static int min(int a, int b) => a < b ? a : b;
}
