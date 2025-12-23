// src/pages/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikator/controller/login_controller.dart';
import 'package:aplikator/src/pages/home.dart';
import 'package:aplikator/src/pages/sign_in.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCtrl = Get.find<LoginController>();

    Future.delayed(const Duration(seconds: 2), () {
      if (authCtrl.isLoggedIn) {
        Get.offAll(() => HomePage());
      } else {
        Get.offAll(() => const SignInPage());
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(160, 160),
            const SizedBox(height: 30),
            // richText(32),
            // const SizedBox(height: 50),
            // const CircularProgressIndicator(
            //   color: Color(0xFF4FC3F7),
            //   strokeWidth: 3,
            // ),
          ],
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return Image.asset(
      'assets/images/logo-sic-v2.png',
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
          fontWeight: FontWeight.w800,
        ),
        children: const [
          TextSpan(text: 'LOGIN '),
          TextSpan(
            text: 'PAGES\nUI ',
            style: TextStyle(color: Color(0xFFFE9879)),
          ),
          TextSpan(text: 'KIT'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
