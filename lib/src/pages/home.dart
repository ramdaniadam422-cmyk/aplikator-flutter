import 'package:aplikator/src/components/header_widget.dart';
import 'package:aplikator/src/pages/kapling_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lengkungan di atas dengan warna 0xFF4FC3F7 dan radius bawah 25%
            HeaderWidget(),

              SizedBox(height: 15),

              Text(
            'Nomor Kapling',
            style:  GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black45,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          ),
              SizedBox(height: 15),

              // Lamp card dengan background putih dan shadow
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => KaplingDetailPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background putih
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Posisi shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.lightbulb_outline,
                          size: 30,
                          color: Colors.yellow.shade700,
                        ),
                      ),

                      SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lamp',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey[800],
                              )),
                            SizedBox(height: 4),
                            Text('Kitchen - Bedroom',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              )),
                            SizedBox(height: 4),
                            Text('8 devices | 12 hours',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600],
                              )),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('1000 Kw/h',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[800],
                            )),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.arrow_downward, size: 14, color: Colors.red.shade400),
                              SizedBox(width: 4),
                              Text('-11.2%',
                                style: TextStyle(
                                  color: Colors.red.shade400,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Air Conditioner card dengan background putih dan shadow
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background putih
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Posisi shadow
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
                      child: Icon(Icons.ac_unit,
                        size: 30,
                        color: Colors.blue.shade700,
                      ),
                    ),

                    SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Air Conditioner',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[800],
                            )),
                          SizedBox(height: 4),
                          Text('Kitchen - Living Room',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            )),
                          SizedBox(height: 4),
                          Text('8 devices | 12 hours',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                            )),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('1000 Kw/h',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[800],
                          )),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.arrow_upward, size: 14, color: Colors.green.shade400),
                            SizedBox(width: 4),
                            Text('10.2%',
                              style: TextStyle(
                                color: Colors.green.shade400,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Wireless Speaker card dengan background putih dan shadow
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background putih
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Posisi shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.speaker,
                        size: 30,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Wireless Speaker',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[800],
                            )),
                          SizedBox(height: 4),
                          Text('Bedroom',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            )),
                          SizedBox(height: 4),
                          Text('2 devices | 3 hours',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                            )),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('1090 Kw/h',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[800],
                          )),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.arrow_upward, size: 14, color: Colors.green.shade400),
                            SizedBox(width: 4),
                            Text('10.2%',
                              style: TextStyle(
                                color: Colors.green.shade400,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}