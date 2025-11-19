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
      if (isClosed) return;
      isLoading.value = true;

      final result = await _service.fetchBlok();

      if (!isClosed) {
        blokList.assignAll(result);
        print("✅ [BlokController] Data blok berhasil dimuat: ${blokList.length} item");
      }
    } catch (e) {
      if (!isClosed) {
        print("❌ [BlokController] Error: $e");
        Get.snackbar(
          "Error",
          "Gagal memuat data blok: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      if (!isClosed) {
        isLoading.value = false;
      }
    }
  }
}