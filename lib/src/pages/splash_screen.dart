import 'dart:async';

import 'package:aplikator/src/pages/home.dart';
import 'package:aplikator/src/pages/sign_in_9.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikator/controller/LoginController.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController authController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    String? token = await authController.getToken();
    if (token != null) {
      Get.offAll(() => HomePage());
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.offAll(() => const SignInPage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo(160, 160),
            const SizedBox(height: 25),
            richText(30),
          ],
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return SvgPicture.asset(
      'assets/logo.svg',
      height: height_,
      width: width_,
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: const Color(0xFF21899C),
          letterSpacing: 3,
          height: 1.03,
        ),
        children: const [
          TextSpan(
            text: 'LOGIN ',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          TextSpan(
            text: 'PAGES \nUI ',
            style: TextStyle(
              color: Color(0xFFFE9879),
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'KIT',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
