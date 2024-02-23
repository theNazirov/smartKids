import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/widgets/custom_text_field.dart';
import 'package:smart_kid/widgets/primary_button.dart';

import '../services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({required this.onTap, super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

// Ro'yxatdan o'tish
  void signUp() async {
    if (passwordController.text != confirmpasswordController.text) {
      showDialog(
        context: context,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
          child: AlertDialog(
            surfaceTintColor: Colors.white,
            title:  Text(
              "Xatolik",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
            content: Text(
              "Parol mos emas",
              style: textStyleDrawerListTile,
            ),
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

      return;
    }
    //get auth service
    final AuthService authService =
        Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
          child: AlertDialog(
            surfaceTintColor: Colors.white,
            title: const Text(
              "Xatolik",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            content: Text("$e"),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                width: 80.w, height: 80.h, child: Image.asset(Constants.logo)),
            SizedBox(height: 30.h),
            Text("Ro'yxatdan o'tish", style: textStyleHomeTopBold),
            SizedBox(height: 60.h),
            SizedBox(
                width: 268.w,
                child: Column(
                  children: [
                    CustomTextField(
                        textInputAction: TextInputAction.next,
                        hintText: "Email",
                        textEditingController: emailController),
                    const SizedBox(height: 20),
                    CustomTextField(
                        textInputAction: TextInputAction.done,
                        hintText: "Parol",
                        textEditingController: passwordController),
                    const SizedBox(height: 20),
                    CustomTextField(
                        textInputAction: TextInputAction.done,
                        hintText: "Parolni takrorlang",
                        textEditingController: confirmpasswordController),
                  ],
                )),
            SizedBox(height: 30.h),
            PrimaryButton(
              text: "Ro'yxatdan o'tish",
              width: 220.w,
              onTap: signUp,
            ),
            SizedBox(height: 100.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Allaqachon ro'yxatdan o'tganmisiz?",
                  style: textStyleInputSemiBold),
            ),
            ElevatedButton(
              onPressed: widget.onTap,
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(160.w, 38.h),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFF02A858)),
                      borderRadius: BorderRadius.circular(1.h)),
                  backgroundColor: const Color(0xFFF6FEF7),
                  elevation: 0),
              child: Text("Hozir kirish", style: textStyleInputSemiBold),
            ),
          ]),
        ),
      ),
    );
  }
}
