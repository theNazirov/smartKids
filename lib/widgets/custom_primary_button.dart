import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/models/finally.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomPrimaryButton(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.only(left: 12.w),
          width: 298.w,
          height: 34.h,
          decoration: ShapeDecoration(
            color: const Color(0xFFCEF8D5),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.w, color: const Color(0xFF02A858)),
              borderRadius: BorderRadius.circular(12.h),
            ),
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(text, style: textStyleCustomPrimeryButton),
          ),
        ),
      ),
    );
  }
}
