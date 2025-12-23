import 'package:aplikator/controller/BlokController.dart';
import 'package:aplikator/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'src/pages/splash_screen.dart';

// main.dart
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // Tambahkan binding untuk inisialisasi controller
      initialBinding: BindingsBuilder(() {
        Get.put(LoginController(), permanent: true);
        Get.put(BlokController(), permanent: true); // tambahkan
      }),
    );
  }
}
