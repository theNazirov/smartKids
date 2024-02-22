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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 50.h),
            const LogoIcon(),
            Text("Kirish",style: textStyleHomeTopBold,),
            SizedBox(height: 50.h),
            SizedBox(
                width: 268.w,
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (value) {
                        tab();
                      },
                      style: textStyleInputSemiBold,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 22.w),
                          hintText: "Email",
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
                              borderRadius: BorderRadius.circular(15.h)),
                          filled: true,
                          fillColor: const Color(0xFFF6FEF7)),
                      controller: emailController,
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      onSubmitted: (value) {
                        tab();
                      },
                      style: textStyleInputSemiBold,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 22.w),
                          hintText: "Parol",
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
                              borderRadius: BorderRadius.circular(15.h)),
                          filled: true,
                          fillColor: const Color(0xFFF6FEF7)),
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                )),
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
    if (true) {
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
