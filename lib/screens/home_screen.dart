import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_ephrem/screens/apps_screen.dart';
import 'package:test_ephrem/screens/organize_screen.dart';
import 'package:test_ephrem/screens/profile_screen.dart';
import 'package:test_ephrem/screens/qucon_screen.dart';
import 'package:test_ephrem/screens/zaady_screen.dart';

import '../config/custom_icons_icons.dart';
import '../widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showItems = true;
  int selectedIndex = 0;

  hideShowContent() {
    showItems = showItems ? false : true;
    setState(() {});
  }

  changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  body() {
    switch (selectedIndex) {
      case 0:
        return AppsScreen(
            showItems: showItems, hideShow: hideShowContent);
      case 1:
        return const QuconScreen();
      case 2:
        return const ZaadyScreen();
      case 3:
        return const OrganizeScreen();
      case 4:
        return const ProfileScreen();
      default:
        return AppsScreen(
            showItems: showItems, hideShow: hideShowContent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: showItems
          ? GNav(
              selectedIndex: selectedIndex,
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 13.h),
              iconSize: 24.sp,
              textSize: 13.sp,
              style: GnavStyle.oldSchool,
              backgroundColor: const Color(0xff2E2E2E),
              activeColor: const Color(0xffFFDD5E),
              color: Colors.white,
              tabs: [
                GButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                  icon: CustomIcons.apps,
                  text: 'Apps',
                  onPressed: () {
                    changeIndex(0);
                  },
                ),
                GButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                  icon: CustomIcons.qucon,
                  text: 'Qucon',
                  onPressed: () {
                    changeIndex(1);
                  },
                ),
                GButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                  icon: CustomIcons.bot,
                  text: 'Zaady',
                  onPressed: () {
                    changeIndex(2);
                  },
                ),
                GButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                  icon: CustomIcons.organise,
                  text: 'Organize',
                  onPressed: () {
                    changeIndex(3);
                  },
                ),
                GButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                  icon: CustomIcons.profile,
                  text: 'Profile',
                  onPressed: () {
                    changeIndex(4);
                  },
                ),
              ],
            )
          : const SizedBox.shrink(),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(),
            body(),
          ],
        ),
      ),
    );
  }
}
