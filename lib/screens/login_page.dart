import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/screens/home_page.dart';
import 'package:smart_kid/services/responsive.dart';
import 'package:smart_kid/widgets/logo_icon.dart';
import 'package:smart_kid/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController profileIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 50.h),
            const LogoIcon(),
            SizedBox(height: 150.h),
            SizedBox(
              height: 38.h,
              width: 268.w,
              child: TextField(
                onSubmitted: (value) {
                  tab();
                },
                keyboardType: TextInputType.number,
                style: textStyleInputSemiBold,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 22.w),
                    hintText: "Profil ID",
                    hintStyle: textStyleInputSemiBold,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF35CE7C), width: 1.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF35CE7C), width: 1.w),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.h)),
                    filled: true,
                    fillColor: const Color(0xFFF6FEF7)),
                controller: profileIDController,
                textInputAction: TextInputAction.done,
              ),
            ),
            SizedBox(height: 100.h),
            PrimaryButton(
              text: "Sign in",
              width: 120.w,
              onTap: () {
                tab();
              },
            )
          ]),
        ),
      ),
    );
  }

  void tab() {
    if (profileIDController.text == "1234") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
          (route) => false);
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
            child: AlertDialog(
              surfaceTintColor: Colors.white,
              title: Text(
                "Xatolik",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              content: Text("Id raqami xato kiritilgan"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK", style: textStyleInputSemiBold),
                ),
              ],
            ),
          ),
        );
      });
    }
  }
}
