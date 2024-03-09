import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/widgets/add_card.dart';
import 'package:smart_kid/widgets/custom_app_bar.dart';
import 'package:smart_kid/widgets/my_drawer.dart';
import 'package:smart_kid/widgets/primary_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Scaffold(
          key: _scaffoldKey,
          drawer: const MyDrawer(),
          body: SafeArea(
              child: Column(
            children: [
              CustomAppBar(
                  onTap: () => _scaffoldKey.currentState?.openDrawer()),
              Container(
                width: size.width,
                height: 500.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFCEF8D5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.h),
                      topRight: Radius.circular(30.h),
                    ),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          PrimaryButton(
                              text: "To'lovlar", onTap: () {}, width: 190.w),
                          SizedBox(height: 12.h),
                          PrimaryButton(
                              text: "To'lov qilish",
                              onTap: () {},
                              width: 190.w),
                        ],
                      ),
                      AddCard(onPressed: () {}),
                    ]),
              )
            ],
          )),
        );
      },
    );
  }
}
