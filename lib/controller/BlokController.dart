// lib/controller/BlokController.dart
import 'package:aplikator/model/Blok.dart';
import 'package:aplikator/service/BlokService.dart';
import 'package:get/get.dart';

class BlokController extends GetxController {
  var blokList = <Blok>[].obs;
  var isLoading = false.obs;

  final BlokService _service = BlokService();

  @override
  void onInit() {
    print("🟢 [BlokController] onInit dipanggil → fetchBlok()");
    fetchBlok();
    super.onInit();
  }

  void fetchBlok() async {
    try {
      isLoading(true);
      var result = await _service.fetchBlok();
      blokList.assignAll(result);
      print("✅ [BlokController] Data blok berhasil dimuat: ${blokList.length} item");
    } catch (e) {
      print("❌ [BlokController] Error: $e");
      // Opsional: tampilkan snackbar error
      Get.snackbar("Error", "Gagal memuat data blok: $e");
    } finally {
      isLoading(false);
    }
  }
}