import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  final VoidCallback? onPressed; // Bisa nullable agar bisa disable button

  const ButtonSubmit({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black54,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: isEnabled
              ? LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.grey.shade800,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 24,
          child: Text(
            'Submit',
            style: TextStyle(
              color: isEnabled ? Colors.white : Colors.white54,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool agreeChecked = false;

  void onRegister() {
    print('Register pressed');
    // Tambahkan aksi sesuai kebutuhan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonSubmit(
          onPressed: agreeChecked ? onRegister : null, // disini null bukan ''
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          setState(() {
            agreeChecked = !agreeChecked;
          });
        },
      ),
    );
  }
}