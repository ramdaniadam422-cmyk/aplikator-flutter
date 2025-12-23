// HeaderWidget.dart (sudah bagus, cuma diperbaiki sedikit)

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:aplikator/controller/login_controller.dart'; // pastikan path benar

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4FC3F7), Color(0xFF60B5F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(width * 0.15),
          bottomRight: Radius.circular(width * 0.15),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, 30, 24, 14),
      child: GetX<LoginController>(
        // Lebih aman dari Obx + Get.find
        builder: (ctrl) {
          final nama = ctrl.user.value?['nama_lengkap'] ?? 'Aplikator';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi $nama!',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Selamat datang kembali!',
                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
