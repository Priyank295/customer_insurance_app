import 'package:customer_insurance_app/screens/cartScreens/applyPromoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../common/colors.dart';
import '../providers/controllers.dart';
import './policiesScreen.dart';
import 'homeScreen.dart';
import 'myPoliciesScreen.dart';
import 'profileScreen.dart';

class BottomNavigationBarScreens extends StatelessWidget {
  static const bottomNavScreens = "/bottomNavScreens";
  BottomNavigationBarScreens({super.key});

  List<Widget> screens = [
    HomeScreen(),
    MyPoliciesScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
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
        child: GetBuilder(
          init: homeScreenController,
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      controller.selectedIndex.value != 0
                          ? controller.onTabTapped(0)
                          : null;
                    },
                    icon: SvgPicture.asset(
                      "assets/home.svg",
                      color: controller.selectedIndex.value == 0
                          ? AppColors.vectorPrimaryColor
                          : AppColors.vectorSecondaryColor,
                    )),
                IconButton(
                    onPressed: () {
                      controller.selectedIndex.value != 1
                          ? controller.onTabTapped(1)
                          : null;
                    },
                    icon: SvgPicture.asset(
                      "assets/policy.svg",
                      color: controller.selectedIndex.value == 1
                          ? AppColors.vectorPrimaryColor
                          : AppColors.vectorSecondaryColor,
                    )),
                IconButton(
                  onPressed: () {
                    controller.selectedIndex.value != 2
                        ? controller.onTabTapped(2)
                        : null;
                  },
                  icon: SvgPicture.asset(
                    "assets/profile.svg",
                    color: controller.selectedIndex.value == 2
                        ? AppColors.vectorPrimaryColor
                        : AppColors.vectorSecondaryColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: Obx(() => screens[homeScreenController.selectedIndex.value]),
    );
  }
}
