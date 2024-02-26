import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/finally.dart';

class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF02A959)),
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white),
      child: Text(message, style: textStyleCustomPrimeryButton),
    );
  }
}
