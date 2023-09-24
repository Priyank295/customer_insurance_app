import 'package:customer_insurance_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget tour1(context) {
  return GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/tourVector1.svg",
                width: MediaQuery.of(context).size.width,
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      top: 26, left: 26, right: 13, bottom: 20),
                  // height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome Home!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    "assets/close.svg",
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            width: 290,
                            child: Text(
                              'Get Daily Updates, Buy new Insurance Policies, Services from Soteria! ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                // fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/tourLoader1.svg"),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              showGeneralDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  pageBuilder: (BuildContext buildContext,
                                      Animation animation,
                                      Animation secondaryAnimation) {
                                    return tour2(context);
                                  });
                            },
                            child: Container(
                              width: 60,
                              height: 25,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Next',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.fontSecondaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget tour2(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/tourVector2.svg",
              width: MediaQuery.of(context).size.width,
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 26, left: 26, right: 13, bottom: 20),
                // height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Manage Your Policies',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset("assets/close.svg"))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          width: 290,
                          child: Text(
                            'Get Daily Updates, Buy new Insurance Policies, Services from Soteria! ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              // fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/tourLoader2.svg"),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.black45,
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return tour3(context);
                                });
                          },
                          child: Container(
                            width: 60,
                            height: 25,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.fontSecondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget tour3(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/tourVector3.svg",
              width: MediaQuery.of(context).size.width,
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 26, left: 26, right: 13, bottom: 20),
                // height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Manage Your Profile!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset("assets/close.svg"))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          width: 290,
                          child: Text(
                            'Get Daily Updates, Buy new Insurance Policies, Services from Soteria! ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              // fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/tourLoader4.svg"),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.black45,
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return tour4(context);
                                });
                          },
                          child: Container(
                            width: 60,
                            height: 25,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Got it',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.fontSecondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget tour4(context) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SvgPicture.asset(
                  "assets/tourVector4.svg",
                  // width: MediaQuery.of(context).size.width,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
