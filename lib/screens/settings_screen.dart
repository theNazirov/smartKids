import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/widgets/custom_app_bar.dart';
import 'package:smart_kid/widgets/custom_primary_button.dart';
import 'package:smart_kid/widgets/my_drawer.dart';

class SettingsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(onTap: () => _scaffoldKey.currentState?.openDrawer()),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 124.h,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFCEF8D5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF02A858)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 56.h,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF02A858),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  child: Text('Sozlamalar', style: textStyleScreenTopTitle),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 68.h),
                  CustomPrimaryButton("Parolni o‘zgartirish", () {}),
                  SizedBox(height: 20.h),
                  CustomPrimaryButton("Dastur haqida", () {}),
                  SizedBox(height: 20.h),
                  CustomPrimaryButton("Fikr va mulohazalar", () {}),
                  SizedBox(height: 120.h),
                  Image.asset("assets/profile.png")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
