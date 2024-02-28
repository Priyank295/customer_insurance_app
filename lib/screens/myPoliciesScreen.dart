import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_insurance_app/screens/homeScreen.dart';
import 'package:customer_insurance_app/widgets/customTabWidget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/functions.dart';
import '../widgets/customSearchDeligate.dart';
import '../widgets/mainBtn.dart';
import '../widgets/soldPolicyWidgetTile.dart';
import 'bottomNavigationBarScreens.dart';

class MyPoliciesScreen extends StatefulWidget {
  static const String myPoliciesRoute = "/myPolicies";
  const MyPoliciesScreen({super.key});

  @override
  State<MyPoliciesScreen> createState() => _MyPoliciesScreenState();
}

int index = 1;
int totalPolicy = 33;
bool view = false;

const List<Map<String, String>> insurancesData = [
  {
    "name": "Individual Medical \nInsurance ",
    "icon": "assets/medicalInsurance.svg",
    "navigate": "/medicalInsuranceScreen1",
  },
  {
    "name": "Life \nInsurance",
    "icon": "assets/lifeInsurance.svg",
    "navigate": "/lifeInsurance",
  },
  {
    "name": "Home \nInsurance",
    "icon": "assets/homeInsurance.svg",
    "navigate": "/homeInsurance",
  },
  {
    "name": "Personal Accident \nInsurance ",
    "icon": "assets/accidentInsurance.svg",
    "navigate": "/accidentInsurancePlan",
  },
  {
    "name": "Travel \nInsurance",
    "icon": "assets/travelInsurance.svg",
    "navigate": "/travelInsurance",
  },
  {
    "name": "Marine \nInsurance",
    "icon": "assets/marineInsurance.svg",
    "navigate": "/marineScreen1",
  },
  {
    "name": "Automotive \nInsurance",
    "icon": "assets/automativeInsurance.svg",
    "navigate": "/automativeScreen1",
  },
  {
    "name": "Office \nInsurance",
    "icon": "assets/officeInsurance.svg",
    "navigate": "/officeScreen1",
  },
  {
    "name": "Critical Illness \nInsurance",
    "icon": "assets/criticalInsurance.svg",
    "navigate": "/illnessScreen1",
  },
  {
    "name": "Pet \nInsurance",
    "icon": "assets/petInsurance.svg",
    "navigate": "/petScreen1",
  },
];
int _currentIndex = 0;
TextEditingController searchController = TextEditingController();

class _MyPoliciesScreenState extends State<MyPoliciesScreen> {
  void _startSearch() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomSearchDelegate();
      },
    ).then((value) {
      // Handle the search result
      if (value != null) {
        print('Search Result: $value');
      }
    });
  }

  bool focus = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset("assets/back.svg")),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'My Policies',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset("assets/add.svg"),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return SvgPicture.asset(
                      "assets/banner2.svg",
                      width: double.infinity,
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: 16 / 10,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    // disableCenter: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(loader[_currentIndex]),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFFFE7A5)),
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color:
                                  index == 0 ? Color(0xFFFFE7A5) : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Expired',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color:
                                  index == 1 ? Color(0xFFFFE7A5) : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Active',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 310,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFFFE7A5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/noSearch.gif",
                        height: 189,
                        width: 189,
                      ),
                      Text(
                        'No Active Policies!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'You Don’t have any policies with us yet.',
                        style: TextStyle(
                          color: Color(0xFF939EAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Buy Insurance Policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: DynamicHeightGridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: view ? 10 : 6,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    builder: (context, index) {
                      return InkWell(
                        onTap: () {
                          navigate(context,
                              insurancesData[index]["navigate"].toString());
                        },
                        child: Container(
                          // margin: EdgeInsets.only(bottom: 30),
                          child: Column(children: [
                            SvgPicture.asset(
                              insurancesData[index]["icon"].toString(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              // constraints: BoxConstraints(minHeight: 90),

                              child: Text(
                                insurancesData[index]["name"].toString(),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  ),
                ),
                !view
                    ? Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        margin: EdgeInsets.only(top: 18),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              view = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'View all',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFD6B268),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset("assets/viewMore.svg")
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
