import 'package:flutter/material.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/screens/profile_screen.dart';
import 'package:smart_kid/screens/settings_screen.dart';
import 'package:smart_kid/services/responsive.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.green,
              child: Container(
                margin: EdgeInsets.only(right: 30.w, left: 16.w, top: 32.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 63.w,
                              height: 63.h,
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                              ),
                              child: Image.asset("assets/avatar_icon.png")),
                          Text("Ism familyasi", style: textStyleAppbarTitle)
                        ]),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 31.w,
                          height: 31.h,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                          child: Image.asset("assets/dark_mode_moon.png"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
          },
          child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('Profil', style: textStyleDrawerListTile)),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: const Icon(Icons.message),
              title: Text('Muloqot', style: textStyleDrawerListTile)),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text("Ta'lim", style: textStyleDrawerListTile)),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: const Icon(Icons.assignment_outlined),
              title: Text('Menyular', style: textStyleDrawerListTile)),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: const Icon(Icons.monetization_on_outlined),
              title: Text("To'lovlar", style: textStyleDrawerListTile)),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ));
          },
          child: ListTile(
              leading: const Icon(Icons.settings),
              title: Text('Sozlamalar', style: textStyleDrawerListTile)),
        ),
      ],
    ));
  }
}
