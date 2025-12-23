// lib/controllers/login_controller.dart
import 'package:aplikator/src/pages/home.dart';
import 'package:aplikator/service/api_service.dart';
import 'package:aplikator/src/pages/sign_in.dart';
import 'package:aplikator/utils/token_manager.dart'; // tambahkan
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<Map<String, dynamic>>();
  final box = GetStorage();
  var obscure = true.obs;

  // 🔴 TAMBAHKAN INI: TextEditingController untuk form login
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print("🟢 [LoginController] onInit dipanggil");
    _loadUserFromStorage();

    // Debug info token
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TokenManager.printTokenInfo();
    });
  }

  void onClose() {
    // 🔴 PENTING: Dispose controller agar tidak memory leak
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void _loadUserFromStorage() {
    if (box.hasData('user')) {
      user.value = box.read('user');
      print(
        "✅ [LoginController] User loaded from storage: ${user.value?['email']}",
      );
    }
  }

  Future<void> login(String email, String password) async {
    if (email.trim().isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password harus diisi');
      return;
    }

    try {
      isLoading(true);

      final aplikator = await ApiService.login(email.trim(), password).timeout(
        const Duration(seconds: 15),
        onTimeout: () => throw Exception('Koneksi timeout'),
      );

      final userData = {
        'id': aplikator.id,
        'nama_lengkap': aplikator.namaLengkap,
        'email': aplikator.email,
      };

      // SIMPAN MENGGUNAKAN TOKEN MANAGER
      await TokenManager.saveToken(aplikator.token);

      // Simpan user data ke GetStorage
      await box.write('user', userData);

      user.value = userData;

      Get.snackbar(
        'Sukses',
        'Selamat datang, ${aplikator.namaLengkap}!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      await Future.delayed(const Duration(milliseconds: 500));
      Get.offAll(() => HomePage());
    } catch (e) {
      String msg = e.toString();
      if (msg.contains('Exception: ')) {
        msg = msg.replaceFirst('Exception: ', '');
      }

      Get.snackbar(
        'Login Gagal',
        msg,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 5),
      );
      print('Snackbar dipanggil: $msg');
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    final token = await TokenManager.getToken();

    if (token != null) {
      try {
        await ApiService.logout(token);
      } catch (_) {
        print(
          "⚠️ [LoginController] Error logout API, tetap lanjut hapus token lokal",
        );
      }
    }

    // Hapus semua data menggunakan TokenManager
    await TokenManager.clearToken();
    await box.erase();
    user.value = null;

    print("✅ [LoginController] Logout berhasil");

    Get.offAll(() => SignInPage());
  }

  bool get isLoggedIn => user.value != null;

  Future<String?> get token async => await TokenManager.getToken();

  String get namaLengkap => user.value?['nama_lengkap'] ?? 'Aplikator';

  // Method untuk cek token
  Future<void> checkTokenStatus() async {
    await TokenManager.printTokenInfo();
  }
}
