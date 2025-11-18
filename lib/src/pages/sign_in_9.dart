import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikator/controller/LoginController.dart';

// SignInPage: Form login dengan GetX
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gunakan Get.put jika belum ada, agar aman (jangan sampai crash karena controller belum terdaftar)
    final LoginController authController = Get.isRegistered<LoginController>()
        ? Get.find<LoginController>()
        : Get.put(LoginController());

    final size = MediaQuery.of(context).size;

    final emailController = TextEditingController();
    final passController = TextEditingController();

    // Bersihkan controller saat widget dibuang (opsional, tapi baik untuk kebersihan)
    // Karena ini StatelessWidget, sebenarnya tidak perlu, tapi jika nanti jadi Stateful, ini berguna.

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 89, 196, 245),
              Colors.white,
            ],
            center: Alignment.topRight,
            radius: 0.8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeText(),
                    SizedBox(height: size.height * 0.03),
                    logo(size.height / 8, size.height / 8),
                    SizedBox(height: size.height * 0.02),
                    richText(20.42),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    emailTextField(size, emailController),
                    SizedBox(height: size.height * 0.02),
                    passwordTextField(size, passController),
                    SizedBox(height: size.height * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Recovery Password?',
                        style: GoogleFonts.inter(
                          fontSize: 11.0,
                          color: const Color(0xFF6A6F7D),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: signInPageButton(
                      size, authController, emailController, passController)),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget welcomeText() {
    return Center(
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.inter(
            fontSize: 22.0,
            color: Colors.black,
            height: 1.59,
          ),
          children: const [
            TextSpan(text: 'Welcome Back'),
            TextSpan(
              text: ', ',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: 'for Continue !'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return SvgPicture.asset(
      'assets/logo2.svg',
      height: height_,
      width: width_,
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: const Color(0xFF21899C),
          letterSpacing: 2.000000061035156,
        ),
        children: const [
          TextSpan(
            text: 'LOGIN',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          TextSpan(
            text: 'PAGE',
            style: TextStyle(
              color: Color(0xFFFE9879),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget emailTextField(Size size, TextEditingController controller) {
    return SizedBox(
      height: size.height / 13,
      child: TextField(
        controller: controller,
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xFF21899C),
        decoration: InputDecoration(
          hintText: 'Enter your email',
          hintStyle: GoogleFonts.inter(
            fontSize: 16.0,
            color: const Color(0xFFABB3BB),
            height: 1.0,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(248, 247, 251, 1),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: controller.text.isEmpty ? Colors.transparent : const Color(0xFF21899C),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: controller.text.isEmpty ? Colors.transparent : const Color(0xFF21899C),
            ),
          ),
          prefixIcon: Icon(
            Icons.mail_outline_rounded,
            color: controller.text.isEmpty
                ? const Color(0xFF151624).withOpacity(0.5)
                : const Color.fromRGBO(44, 185, 176, 1),
            size: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget passwordTextField(Size size, TextEditingController controller) {
    return Container(
      height: size.height / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(248, 247, 251, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              size: 16,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: controller,
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: const Color(0xFF151624),
                ),
                cursorColor: const Color(0xFF21899C),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.0,
                    color: const Color(0xFFABB3BB),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            controller.text.isEmpty
                ? const Center()
                : Container(
                    height: 30,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(249, 225, 224, 1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color.fromRGBO(254, 152, 121, 1),
                      ),
                    ),
                    child: Text(
                      'View',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 12.0,
                        color: const Color(0xFFFE9879),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget signInPageButton(Size size, LoginController authController,
      TextEditingController emailController, TextEditingController passController) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: authController.isLoading.value ? Colors.grey : const Color(0xFF4FC3F7),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4C2E84).withOpacity(0.2),
            offset: const Offset(0, 15.0),
            blurRadius: 60.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: authController.isLoading.value
            ? null
            : () {
                if (emailController.text.isEmpty || passController.text.isEmpty) {
                  Get.snackbar('Error', 'Email dan password harus diisi');
                  return;
                }
                authController.login(emailController.text, passController.text);
              },
        child: Obx(() => authController.isLoading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'Sign in',
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              )),
      ),
    );
  }
}