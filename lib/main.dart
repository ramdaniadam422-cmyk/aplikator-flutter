import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/pages/splash_screen.dart';
import 'controller/LoginController.dart'; // ✅ tambahkan import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  // ✅ Inisialisasi LoginController dan muat data dari storage
  final loginController = Get.put(LoginController());
   await loginController.loadAplikatorFromStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}