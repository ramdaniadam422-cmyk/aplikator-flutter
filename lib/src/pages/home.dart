import 'package:aplikator/src/components/nav_toggle_widget.dart';
import 'package:aplikator/src/pages/kapling_detail.dart';
import 'package:flutter/material.dart';


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
                Text(
                  'Nomor Kapling',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),

                SizedBox(height: 24),

                // Lamp card
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
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
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

                // Air Conditioner card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
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
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Wireless Speaker card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
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
                            ],
                          )
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 343,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.50, -0.00),
              end: Alignment(0.50, 1.00),
              colors: [const Color(0xFFA5B79F), const Color(0x00D5DDDD)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x1E0E1F35),
                blurRadius: 2,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: const Color(0xFFEDF3F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://placehold.co/40x40"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    width: 155,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        SizedBox(
                          width: 155,
                          child: Text(
                            'Lamp',
                            style: TextStyle(
                              color: const Color(0xFF404040),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1,
                              letterSpacing: 0.07,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 155,
                          child: Text(
                            'Kitchen - Bedroom',
                            style: TextStyle(
                              color: const Color(0xFF404040),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0.06,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Text(
                                '8 devices',
                                style: TextStyle(
                                  color: const Color(0xFF868686),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  letterSpacing: 0.06,
                                ),
                              ),
                              Container(
                                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                width: 12,
                                height: double.infinity,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.30,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: const Color(0xFF868686),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '12 hours',
                                style: TextStyle(
                                  color: const Color(0xFF868686),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  letterSpacing: 0.06,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 2,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '1000 ',
                              style: TextStyle(
                                color: const Color(0xFF4C7380),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 1,
                                letterSpacing: 0.07,
                              ),
                            ),
                            TextSpan(
                              text: 'Kw/h',
                              style: TextStyle(
                                color: const Color(0xFF4C7380),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4,
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Text(
                              '-11.2%',
                              style: TextStyle(
                                color: const Color(0xFF9A7265),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: 0.06,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }