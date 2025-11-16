import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar untuk menentukan radius lengkungan sesuai persentase
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: 110, // Sesuaikan tinggi header
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
          bottomLeft: Radius.circular(width * 0.15), // 15% dari lebar layar
          bottomRight: Radius.circular(width * 0.15),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, 30, 24, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Aplikator!',
            style:  GoogleFonts.inter(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white.withOpacity(0.8),
                size: 16,
              ),
              SizedBox(width: 6),
              Text(
                'Perum Sakura Indah',
                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}