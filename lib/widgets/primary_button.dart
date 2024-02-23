import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/models/finally.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback onTap;

  const PrimaryButton(
      {required this.text,
      this.width,
      this.height,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? size.width.w, height ?? 38.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
          backgroundColor: const Color(0xFF24C26D),
          elevation: 0),
      child: Text(text, style: textStyleButtonSemibold),
    );
  }
}
