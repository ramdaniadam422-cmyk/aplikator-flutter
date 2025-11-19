// lib/controller/LoginController.dart
import 'dart:convert';

import 'package:aplikator/service/loginService.dart';
import 'package:aplikator/src/pages/home.dart';
import 'package:aplikator/src/pages/sign_in_9.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginService _authService = LoginService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var aplikatorData = <String, dynamic>{}.obs; // Lebih aman: tipe eksplisit

Future<void> login(String email, String password) async {
  isLoading.value = true;
  errorMessage.value = '';

  try {
    final response = await _authService.login(email, password);
    print('Parsed response: ${response.toJson()}');

    // 💡 Ambil token dan aplikator ke local var
    final token = response.token;
    final aplikator = response.aplikator; // 👈 simpan ke local variable

    if (token != null && token.isNotEmpty && response.errors == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      if (aplikator != null) {
        // ✅ Sekarang `aplikator` sudah dipromote ke non-null!
        await prefs.setString('aplikator_data', jsonEncode(aplikator));
        // Pastikan tipe target sesuai
        aplikatorData.value = Map<String, dynamic>.from(aplikator);
        print('DEBUG: Aplikator disimpan: $aplikator');
      } else {
        aplikatorData.value = {};
        await prefs.remove('aplikator_data');
      }

      Get.offAll(() => HomePage());
    } else {
      // ... (sama seperti sebelumnya)
      String errorMsg = response.message ?? 'Login gagal';
      if (response.errors != null && response.errors!['email'] != null) {
        errorMsg = response.errors!['email'][0];
      }
      errorMessage.value = errorMsg;
      Get.snackbar('Login Gagal', errorMsg, );
    }
  } catch (e) {
    // ... (sama)
  } finally {
    isLoading.value = false;
  }
}

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<Map<String, dynamic>?> getAplikatorData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('aplikator_data');
    if (data != null) {
      print('DEBUG: Aplikator dibaca dari SharedPreferences: $data');
      return jsonDecode(data) as Map<String, dynamic>;
    }
    return null;
  }

  /// Memuat data aplikator dari SharedPreferences saat app dibuka
  Future<void> loadAplikatorFromStorage() async {
    final data = await getAplikatorData();
    if (data != null) {
      aplikatorData.value = data;
    } else {
      aplikatorData.value = {};
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('aplikator_data');
    aplikatorData.value = {};
    Get.offAll(() => const SignInPage());
  }
}