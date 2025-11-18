// CONTROLLER: Update logic untuk cek token, tambah debug
import 'dart:convert';

import 'package:aplikator/service/loginService.dart';
import 'package:aplikator/src/pages/home.dart';
import 'package:aplikator/src/pages/sign_in_9.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginService _authService = LoginService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _authService.login(email, password);
      print('Parsed response: ${response.toJson()}');

      if (response.token != null && response.token!.isNotEmpty && response.errors == null) {
        // sukses
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response.token!);
        if (response.aplikator != null) {
          await prefs.setString('aplikator_data', jsonEncode(response.aplikator));
          print('DEBUG: Aplikator disimpan ke SharedPreferences: ${jsonEncode(response.aplikator)}');
        }
        Get.offAll(() => HomePage());
      } else {
        // gagal
        String errorMsg = response.message ?? 'Login gagal';
        if (response.errors != null && response.errors!['email'] != null) {
          errorMsg = response.errors!['email'][0];
        }
        errorMessage.value = errorMsg;
        Get.snackbar(
          'Login Gagal',
          errorMsg,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Exception: $e');
      errorMessage.value = 'Error: $e';
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
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
    }
    return data != null ? jsonDecode(data) : null;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('aplikator_data');
    Get.offAll(() => const SignInPage());
  }
}