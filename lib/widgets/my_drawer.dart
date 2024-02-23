import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/screens/profile_screen.dart';
import 'package:smart_kid/screens/settings_screen.dart';
import 'package:smart_kid/services/auth/auth_gate.dart';
import 'package:smart_kid/services/auth/auth_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // get instance on firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign Out
  void signOut() {
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: Colors.green,
                  child: Container(
                    margin: EdgeInsets.only(right: 30.w, left: 16.w, top: 32.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 63.w,
                                  height: 63.h,
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(),
                                  ),
                                  child: Image.asset("assets/avatar_icon.png")),
                              Text("Ism familyasi", style: textStyleAppbarTitle)
                            ]),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 31.w,
                              height: 31.h,
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                              ),
                              child: Image.asset("assets/dark_mode_moon.png"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              },
              child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Profil', style: textStyleDrawerListTile)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: const Icon(Icons.message),
                  title: Text('Muloqot', style: textStyleDrawerListTile)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: Text("Ta'lim", style: textStyleDrawerListTile)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: const Icon(Icons.assignment_outlined),
                  title: Text('Menyular', style: textStyleDrawerListTile)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: const Icon(Icons.monetization_on_outlined),
                  title: Text("To'lovlar", style: textStyleDrawerListTile)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
              },
              child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text('Sozlamalar', style: textStyleDrawerListTile)),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
                        child: AlertDialog(
                          surfaceTintColor: Colors.white,
                          title: Text(
                            "Diqat!",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp),
                          ),
                          content: Text(
                              "Akkauntingizdan chiqib ketishni xohlaysizmi?",
                              style: textStyleDrawerListTile),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                  "Yo'q", style: textStyleInputSemiBold),
                            ),
                            TextButton(
                              onPressed: () {
                                signOut();
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                      builder: (context) => AuthGate(),), (
                                        route) => false);
                              },
                              child: Text("Ha", style: textStyleInputSemiBold),
                            ),
                          ],
                        ),
                      ),
                );
              },
              child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: Text('Chiqish',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                        fontFamily: 'Linotte-SemiBold',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ))),
            ),
          ],
        ));
  }
}
