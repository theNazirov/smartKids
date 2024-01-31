import 'package:flutter/material.dart';
import 'package:smart_kid/services/responsive.dart';
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
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
              titleText: "Ism famiyadsi",
              onTap: () => _scaffoldKey.currentState?.openDrawer()),
          Expanded(child: Container()),
          Container(
            width: size.width,
            height: 500.h,
            decoration: ShapeDecoration(
              color: Color(0xFFCEF8D5),
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
                          text: "To'lov qilish", onTap: () {}, width: 190.w),
                    ],
                  ),
                  AddCard(onPressed: () {
                    print("object");
                  }),
                ]),
          )
        ],
      )),
    );
  }
}
