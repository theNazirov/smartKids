import 'package:smart_kid/screens/login_page.dart';
import 'package:smart_kid/services/responsive.dart';
import 'package:smart_kid/widgets/logo_icon.dart';
import 'package:smart_kid/widgets/primary_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Size size = const Size(0, 0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        splashFactory: InkSplash.splashFactory,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 150.h),
            const LogoIcon(),
            SizedBox(height: 150.h),
            PrimaryButton(
              text: "Profil ID",
              width: 130.w,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
            )
          ]),
        ),
      ),
    );
  }
}
