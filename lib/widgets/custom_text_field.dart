import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/finally.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputAction textInputAction;

  const CustomTextField(
      {required this.textInputAction,
      required this.hintText,
      required this.textEditingController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: textStyleInputSemiBold,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 22.w),
          hintText: hintText,
          hintStyle: textStyleInputSemiBold,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF35CE7C), width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF35CE7C), width: 1.w),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.h)),
          filled: true,
          fillColor: const Color(0xFFF6FEF7)),
      controller: textEditingController,
      textInputAction: textInputAction,
    );
  }
}
