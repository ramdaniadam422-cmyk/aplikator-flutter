// lib/controllers/blok_controller.dart
import 'package:aplikator/model/Blok.dart';
import 'package:aplikator/service/BlokService.dart';
import 'package:aplikator/utils/token_manager.dart'; // tambahkan
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlokController extends GetxController {
  var blokList = <Blok>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final BlokService _service = BlokService();

  @override
  void onInit() {
    print("🟢 [BlokController] onInit dipanggil");

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Cek token sebelum fetch
      final hasToken = await TokenManager.hasValidToken();

      if (hasToken) {
        print("✅ [BlokController] Token valid, mulai fetchBlok");
        await fetchBlok();
      } else {
        print("⚠️ [BlokController] Token tidak valid, skip fetchBlok");
        errorMessage.value = "Anda belum login atau sesi telah berakhir";
      }
    });

    super.onInit();
  }

  Future<void> fetchBlok() async {
    try {
      if (isClosed) return;

      isLoading.value = true;
      errorMessage.value = '';

      print("🔍 [BlokController] Memulai fetchBlok...");

      final result = await _service.fetchBlok();

      if (!isClosed) {
        blokList.assignAll(result);
        print("✅ [BlokController] Data berhasil: ${blokList.length} item");
      }
    } catch (e) {
      if (!isClosed) {
        errorMessage.value = e.toString();
        print("❌ [BlokController] Error: $e");

        // Tampilkan snackbar untuk error selain token expired
        if (!e.toString().contains("Sesi Anda telah berakhir") &&
            !e.toString().contains("Token tidak ditemukan")) {
          Get.snackbar(
            "Error",
            "Gagal memuat data blok",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 3),
          );
        }
      }
    } finally {
      if (!isClosed) {
        isLoading.value = false;
      }
    }
  }

  // Refresh data manual
  Future<void> refreshData() async {
    print("🔄 [BlokController] Manual refresh");
    await fetchBlok();
  }

  // Clear error
  void clearError() {
    errorMessage.value = '';
  }
}
