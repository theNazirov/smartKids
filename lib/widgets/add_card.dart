import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/models/finally.dart';

class AddCard extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCard({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Karta bog'lash",
          style: textStyleHomeBold20,
        ),
        Material(color: Colors.transparent,
          child: InkWell(borderRadius: BorderRadius.circular(17.h),
            onTap: onPressed,
            child: Ink(
              width: 208.w,
              height: 118.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF35CE7C),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: const Color(0xFF02A858)),
                  borderRadius: BorderRadius.circular(17.r),
                ),
              ),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 50.w,
                  height: 50.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.grey[350],
                    size: 50.h,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
