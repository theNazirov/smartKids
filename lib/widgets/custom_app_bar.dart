import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/models/finally.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onTap;

  const CustomAppBar({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
          width: size.width,
          height: 50.h,
          decoration: const BoxDecoration(color: Colors.white),
          child: Text('Smart Kids',
              textAlign: TextAlign.center, style: textStyleHomeTopBold)),
      Container(
        width: size.width,
        height: 62.h,
        decoration: const BoxDecoration(color: Color(0xFF02A858)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => onTap(),
              child: Container(
                padding: const EdgeInsets.only(left: 14),
                child: Image.asset("assets/drawer_logo.png"),
              ),
            ),
            Container(
                padding: EdgeInsets.only(right: 26.w),
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Text("Error", style: textStyleHomeTopBold));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Text(data['name'], style: textStyleAppbarTitle);
                    }))
          ],
        ),
      ),
    ]);
  }
}
