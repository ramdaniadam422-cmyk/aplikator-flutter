import 'package:aplikator/src/pages/kapling_detail.dart';
import 'package:aplikator/src/pages/progres.dart';
import 'package:flutter/material.dart';

class NotificationTogglePage extends StatefulWidget {
  @override
  _NotificationTogglePageState createState() => _NotificationTogglePageState();
}

class _NotificationTogglePageState extends State<NotificationTogglePage> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  void onToggleChanged(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(24),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    )
                  ]
                : null,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade600,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikator', style: TextStyle( fontWeight: FontWeight.w800,
            fontSize: 18,),),
        centerTitle: true,
        bottom: PreferredSize(
    preferredSize: Size.fromHeight(1),
    child: Container(
      color: Colors.black,
      height: 1,
    ),
  ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Proyek Sakura Indah',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 24),

            // Toggle Buttons
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  buildToggleButton(
                    'Progres',
                    selectedIndex == 0,
                    () => onToggleChanged(0),
                  ),
                  buildToggleButton(
                    'Order Barang',
                    selectedIndex == 1,
                    () => onToggleChanged(1),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Expanded page view menampilkan isi halaman sesuai pilihan toggle
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                children: [
                  ProgresPage(),
                  UnreadNotificationPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Contoh halaman All Notification
class AllNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('All Notifications Content',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
    );
  }
}

// Contoh halaman Unread Notification
class UnreadNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Unread Notifications Content',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotificationTogglePage(),
  ));
}