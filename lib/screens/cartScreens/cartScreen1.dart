import 'package:customer_insurance_app/screens/cartScreens/applyPromoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen1 extends StatefulWidget {
  const CartScreen1({super.key});

  @override
  State<CartScreen1> createState() => _CartScreen1State();
}

class _CartScreen1State extends State<CartScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 29),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 18,
              offset: Offset(-1, -1),
              spreadRadius: -3,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(
                    color: Color(0xFF939EAA),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '₹300',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        '₹350',
                        style: TextStyle(
                          color: Color(0xFF939EAA),
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                showGeneralDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    barrierColor: Colors.black45,
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (BuildContext buildContext,
                        Animation animation, Animation secondaryAnimation) {
                      return Center(
                        child: Container(
                          width: 350,
                          height: 437,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 32, horizontal: 40),

                          // // height: ,
                          // constraints: BoxConstraints(
                          //     minHeight:
                          //         MediaQuery.of(context).size.height / 2.3,
                          //     maxHeight:
                          //         MediaQuery.of(context).size.height / 2),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 48,
                                offset: Offset(0, 4),
                                spreadRadius: 9,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 13, top: 13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset("assets/close4.svg")
                                  ],
                                ),
                              ),
                              Image.asset("assets/password.gif"),
                              SizedBox(
                                height: 9,
                              ),
                              Material(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text(
                                      'Confirm Password!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Please Enter Your Password to verify Yourself! It’s only for Your Security!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 27.5),
                                      width: 300,
                                      height: 55,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFDBE9F5)),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Enter Password",
                                          labelStyle: TextStyle(
                                            color: Color(0xFF939EAA),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                width: 180,
                height: 55,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [
                      Color(0xFF0D47A1),
                      Color(0xFF0A2472),
                      Color(0xFF0A2472)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    'Pay Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 44),
              padding: EdgeInsets.symmetric(horizontal: 29),
              child: Row(children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("assets/back.svg")),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Summary',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Color(0xFFDBE9F5),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 29, vertical: 20),
              child: Row(children: [
                Container(
                  width: 135,
                  height: 135,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFFFFE7A5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(shape: BoxShape.circle),
                      //   child: Image.asset(
                      //     "assets/lic2.png",
                      //     height: 83,
                      //     width: 86,
                      //   ),
                      // ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'LIC',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Container(
                  child: Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LIC Secure Home Plan',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Plan description Plan description Plan \ndescription Plan description Plan \ndescription Plan description Plan \ndescription Plan description',
                            style: TextStyle(
                              color: Color(0xFF939EAA),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            '₹ 350/-',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]),
                  ),
                )
              ]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ApplyPromoScreen()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 21),
                width: double.infinity,
                height: 70,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/offer.svg",
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Apply Promo Code',
                          style: TextStyle(
                            color: Color(0xFF104E9E),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/rightArrow.svg",
                      height: 10,
                      width: 6,
                      color: Color(0xFF104E9E),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 147),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price (1 item)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '₹350/-',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount on MRP',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '  - ₹50/-',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF00BD79),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '₹300/-',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
