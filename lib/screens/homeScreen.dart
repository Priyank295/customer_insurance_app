import 'package:carousel_slider/carousel_slider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../common/functions.dart';
import '../widgets/CustomAppbar.dart';
import '../widgets/tourWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

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
    "navigate": "/marineScreen3",
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

List<String> loader = [
  "assets/bannerLoader.svg",
  "assets/vector_loader2.svg",
  "assets/vector_loader3.svg",
  "assets/vector_loader4.svg"
];

showAppTour(
  context,
) async {
  await Future.delayed(const Duration(milliseconds: 1500)).then((value) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return tour1(context);
        });
  });
}

int _currentIndex = 0;
bool showTour = false;
Future startTour(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  showTour = prefs.getBool('showTour') ?? false;
  showTour ? showAppTour(context) : null;
  prefs.setBool("showTour", false);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    startTour(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 40),
          child: Column(
            children: [
              CustomAppBar(context),
              CarouselSlider.builder(
                itemCount: 4,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return SvgPicture.asset("assets/banner1.svg");
                },
                options: CarouselOptions(
                  height: 150,
                  aspectRatio: 16 / 9,
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
                margin: EdgeInsets.symmetric(vertical: 10),
                child: SvgPicture.asset(loader[_currentIndex]),
              ),
              Container(
                margin: EdgeInsets.only(top: 14, bottom: 10),
                width: double.infinity,
                child: const Text(
                  'Buy Insurance Policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DynamicHeightGridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
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
            ],
          ),
        )),
      ),
    );
  }
}
