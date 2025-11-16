// OrderBarangPage class
import 'package:aplikator/src/components/button_submit.dart';
import 'package:aplikator/src/components/input_widget_v2.dart';
import 'package:flutter/material.dart';

class OrderBarangPage extends StatefulWidget {
  const OrderBarangPage({Key? key}) : super(key: key);
  
  @override
  State<OrderBarangPage> createState() => _OrderBarangPageState();
}

class _OrderBarangPageState extends State<OrderBarangPage> {
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
            label: 'Barang Toko',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Semen Batako', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Sak'),
            ),
            controller: emailController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Besi Beton', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Batang'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Baja Ringan', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m²'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Hebel', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Batang'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Paku', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Kg'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Kawat Beton', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Roll'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Gipsum', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Lembar'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Perekat Ubin', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m²'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Cat Tembok', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m²'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Kaca', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m²'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Pipa PVC', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Batang'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Fitting pipa', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Batang'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Kabel Listrik', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Roll'),
            ),
            controller: passwordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Saklar ', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Buah'),
            ),
            controller: passwordController,
          ),

          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Stop Kontak ', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Buah'),
            ),
            controller: passwordController,
          ),

          SizedBox(height: 10),
           InputV2(
            label: 'Barang Alam',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Pasir Pasang', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m³'),
            ),
            controller: confirmPasswordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Pasir Cor', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m³'),
            ),
            controller: confirmPasswordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Krikil / Batu Pecah', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m³'),
            ),
            controller: confirmPasswordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Batu Kali', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m³'),
            ),
            controller: confirmPasswordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Batu Gunung', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m³'),
            ),
            controller: confirmPasswordController,
          ),
          SizedBox(height: 5),
           InputV2(
            label: '',
            hintText: '',
            prefix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Kayu Balok', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),),
            ),
            suffix: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('m³'),
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