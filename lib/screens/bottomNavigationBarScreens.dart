import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/colors.dart';
import './policiesScreen.dart';
import 'homeScreen.dart';
import 'myPoliciesScreen.dart';
import 'profileScreen.dart';

class BottomNavigationBarScreens extends StatefulWidget {
  static const bottomNavScreens = "/bottomNavScreens";
  const BottomNavigationBarScreens({super.key});

  @override
  State<BottomNavigationBarScreens> createState() =>
      _BottomNavigationBarScreensState();
}

const List<Widget> screens = [
  HomeScreen(),
  MyPoliciesScreen(),
  ProfileScreen(),
];
int _selectedIndex = 0;

class _BottomNavigationBarScreensState
    extends State<BottomNavigationBarScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 77,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 17,
              offset: Offset(1, -2),
              spreadRadius: -8,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex != 0 ? _selectedIndex = 0 : null;
                  });
                },
                icon: SvgPicture.asset(
                  "assets/home.svg",
                  color: _selectedIndex == 0
                      ? AppColors.vectorPrimaryColor
                      : AppColors.vectorSecondaryColor,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex != 1 ? _selectedIndex = 1 : null;
                  });
                },
                icon: SvgPicture.asset(
                  "assets/policy.svg",
                  color: _selectedIndex == 1
                      ? AppColors.vectorPrimaryColor
                      : AppColors.vectorSecondaryColor,
                )),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex != 2 ? _selectedIndex = 2 : null;
                });
              },
              icon: SvgPicture.asset(
                "assets/profile.svg",
                color: _selectedIndex == 2
                    ? AppColors.vectorPrimaryColor
                    : AppColors.vectorSecondaryColor,
              ),
            ),
          ],
        ),
      ),
      body: screens[_selectedIndex],
    );
  }
}
