import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/widgets/user_chat_list.dart';

import '../models/finally.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/my_drawer.dart';

class ChatSelectPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ChatSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
                onTap: () => _scaffoldKey.currentState?.openDrawer()),
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
                  child: Text('Muloqot', style: textStyleScreenTopTitle),
                ),
              ],
            ),
            const Expanded(child: HomePage())
            // SizedBox(height: 68.h),
            // CustomPrimaryButton("Hodimlar bilan muloqot", () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => EmployeeChatScreen(),
            //       ));
            // }),
            // SizedBox(height: 20.h),
            // CustomPrimaryButton("Ota-onalar bilan muloqot", () {}),
          ],
        ),
      ),
    );
  }
}
