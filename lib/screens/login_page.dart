import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/widgets/custom_text_field.dart';
import 'package:smart_kid/widgets/primary_button.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({required this.onTap, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in user
  void signIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text.toString(), passwordController.text.toString());
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
          child: AlertDialog(
            surfaceTintColor: Colors.white,
            title: Text(
              "Xatolik",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
            content: Text("$e", style: textStyleDrawerListTile),
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
            Text("Kirish", style: textStyleHomeTopBold),
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
                  ],
                )),
            SizedBox(height: 30.h),
            PrimaryButton(
              text: "Kirish",
              width: 120.w,
              onTap: signIn,
            ),
            SizedBox(height: 100.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Hali ro'yxatdan o'tmaganmisiz?",
                  style: textStyleInputSemiBold),
            ),
            ElevatedButton(
              onPressed: widget.onTap,
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(220.w, 38.h),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFF02A858)),
                      borderRadius: BorderRadius.circular(10.h)),
                  backgroundColor: const Color(0xFFF6FEF7),
                  elevation: 0),
              child: Text("Ro'yxatdan o'tish", style: textStyleInputSemiBold),
            ),
          ]),
        ),
      ),
    );
  }
}
