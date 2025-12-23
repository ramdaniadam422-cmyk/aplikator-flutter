import 'package:aplikator/src/components/input_widget_v2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialOrderPage extends StatelessWidget {
  MaterialOrderPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Permintaan Material',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w800, fontSize: 18),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade800, height: 1),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul
                InputV2(
                  label: '',
                  hintText: '10% - 100%',
                  prefix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Galian Pondasi',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  suffix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('%'),
                  ),
                  controller: emailController,
                ),
                SizedBox(height: 6),
                InputV2(
                  label: '',
                  hintText: '10% - 100%',
                  prefix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Pondasi',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  suffix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('%'),
                  ),
                  controller: passwordController,
                ),
                SizedBox(height: 6),
                InputV2(
                  label: '',
                  hintText: '10% - 100%',
                  prefix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Alumunium',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  suffix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('%'),
                  ),
                  controller: confirmPasswordController,
                ),
                SizedBox(height: 10),

                // tombol submit
                Center(
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
