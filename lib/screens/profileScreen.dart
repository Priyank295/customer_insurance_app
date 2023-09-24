import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/colors.dart';
import '../common/functions.dart';
import '../widgets/profilePictureWidget.dart';
import 'editProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

DateTime selectedDate = DateTime.now();
const List<Map<String, String>> profileData = [
  {
    "name": "My Policies",
    "icon": "assets/myPolicies.svg",
    "route": "/myPolicies",
  },
  {
    "name": "My Rewards",
    "icon": "assets/myRewards.svg",
    "route": "/myPolicies",
  },
  {
    "name": "My Claims",
    "icon": "assets/myClaims.svg",
    "route": "/myClaimsScreen",
  },
  {
    "name": "Contact Us",
    "icon": "assets/contactUs.svg",
    "route": "/myPolicies",
  },
  {
    "name": "Add Complaints",
    "icon": "assets/empty.svg",
    "route": "/myPolicies",
  },
  {
    "name": "Our Website",
    "icon": "assets/ourWebsite.svg",
    "route": "/myPolicies",
  },
  {
    "name": "Terms and Conditions",
    "icon": "assets/empty.svg",
    "route": "/myPolicies",
  },
  {
    "name": "Log Out",
    "icon": "assets/logout.svg",
    "route": "/myPolicies",
  },
];

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 168,
              decoration: BoxDecoration(color: AppColors.vectorPrimaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 30),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ProfilePictureWidget(context),
                              const SizedBox(
                                width: 18,
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mansi N V',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      // fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                      // height: 22.78,
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  Text(
                                    'user123@gmail.com',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      // fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => EditProfileScreen()));
                              },
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                    child: SvgPicture.asset(
                                        "assets/editProfile.svg"),
                                  )))
                        ]),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: profileData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        navigate(
                            context, profileData[index]["route"].toString());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 39, vertical: 22),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      profileData[index]["icon"].toString()),
                                  const SizedBox(
                                    width: 27,
                                  ),
                                  Text(
                                    profileData[index]["name"].toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      // fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              SvgPicture.asset("assets/rightArrow.svg")
                            ]),
                      ),
                    ),
                    Container(
                      height: 0.8,
                      width: width,
                      color: const Color(0xFFDBE9F5),
                    )
                  ],
                );
              },
            ),
            Container(
              width: width,
              margin: const EdgeInsets.symmetric(vertical: 45),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset("assets/fb.svg")),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset("assets/linkedin.svg")),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset("assets/insta.svg")),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
