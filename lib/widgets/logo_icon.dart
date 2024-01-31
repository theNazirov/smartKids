import 'package:flutter/cupertino.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/services/responsive.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80.w,
          height: 80.h,
          child: Image.asset(Constants.logo),
        ),
        Text(
          'Smart\nKids',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF02A858),
            fontSize: 44.h,
            fontFamily: 'Linotte-Heavy',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ],
    );
  }
}
