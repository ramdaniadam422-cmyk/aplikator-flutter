// lib/src/pages/home.dart
import 'package:aplikator/controller/BlokController.dart';
import 'package:aplikator/controller/login_controller.dart';
import 'package:aplikator/src/components/header_widget.dart';
import 'package:aplikator/src/pages/kapling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final BlokController blokController = Get.find<BlokController>();
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BlokController blokController;
  late LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller sekali saat widget dibuat
    blokController = Get.put(BlokController());
    print("🟢 [HomePage] BlokController diinisialisasi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              SizedBox(height: 15),
              Text(
                'Nomor Blok',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 15),

              // LIST BLOK DARI API
              Expanded(
                child: Obx(() {
                  if (blokController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (blokController.errorMessage.isNotEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(blokController.errorMessage.value),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => blokController.refreshData(),
                            child: Text('Coba Lagi'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (blokController.blokList.isEmpty) {
                    return Center(child: Text('Tidak ada data blok'));
                  }

                  return ListView.builder(
                    itemCount: blokController.blokList.length,
                    itemBuilder: (context, index) {
                      final blok = blokController.blokList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => KaplingPage(blok: blok),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Icon(
                                  Icons.home,
                                  size: 30,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      blok.nama,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      blok.deskripsi,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        child: Icon(Icons.output, color: Colors.white),
        onPressed: () {
          loginController.logout();
        },
      ),
    );
  }
}
