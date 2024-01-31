import 'package:flutter/material.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/services/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;

  const CustomAppBar({required this.titleText, required this.onTap, super.key});

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
              child: Text('Ism familiyasi', style: textStyleAppbarTitle),
            )
          ],
        ),
      ),
    ]);
  }
}
