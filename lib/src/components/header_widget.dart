import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '/controller/LoginController.dart'; // Sesuaikan path

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final loginCtrl = Get.find<LoginController>();

    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4FC3F7),
            Color(0xFF60B5F8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(width * 0.15),
          bottomRight: Radius.circular(width * 0.15),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, 30, 24, 14),
      child: Obx(() {
        final data = loginCtrl.aplikatorData.value;
        String namaAplikator = 'Aplikator';

        // Ambil dari "nama_lengkap" (sesuai respons API)
        if (data.isNotEmpty && data.containsKey('nama_lengkap')) {
          namaAplikator = data['nama_lengkap'];
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi $namaAplikator!',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            // 🔻 Opsional: Hapus bagian lokasi jika tidak ada datanya
            // Atau ganti dengan teks statis seperti "Selamat datang"
            Text(
              'Selamat datang kembali!',
              style: GoogleFonts.inter(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ],
        );
      }),
    );
  }
}