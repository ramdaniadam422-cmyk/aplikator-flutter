// ProgresPage class
import 'package:aplikator/src/components/button_submit.dart';
import 'package:aplikator/src/components/input_widget_v2.dart';
import 'package:flutter/material.dart';

class ProgresPage extends StatefulWidget {
  const ProgresPage({Key? key}) : super(key: key);
  
  @override
  State<ProgresPage> createState() => _ProgresPageState();
}

class _ProgresPageState extends State<ProgresPage> {
  bool agreeChecked = false;

  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  void onRegister() {
    // contoh aksi submit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Register pressed!")),
    );
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
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
              child: Text('Galian Pondasi', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
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
              child: Text('Pondasi', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
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
              child: Text('Alumunium', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('%'),
            ),
            controller: confirmPasswordController,
          ),
          SizedBox(height: 10),

                ButtonSubmit(
            onPressed: agreeChecked ? onRegister : null,
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}