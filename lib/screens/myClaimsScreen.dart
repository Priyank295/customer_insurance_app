import 'package:customer_insurance_app/widgets/bottom_nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyClaimsScreen extends StatefulWidget {
  static const myClaimsScreen = "/myClaimsScreen";
  const MyClaimsScreen({super.key});

  @override
  State<MyClaimsScreen> createState() => _MyClaimsScreenState();
}

class _MyClaimsScreenState extends State<MyClaimsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29, vertical: 50),
          child: Column(
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
                        'My Claims',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            // enableDrag: false,
                            backgroundColor: Colors.transparent,
                            builder: (c) {
                              return DraggableScrollableSheet(
                                  expand: false,
                                  initialChildSize: 0.45,
                                  builder: (context, scrollController) {
                                    return BottomCard();
                                  });
                            });
                      },
                      child: SvgPicture.asset("assets/add.svg")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomCard extends StatefulWidget {
  const BottomCard({super.key});

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23),
                width: double.infinity,
                height: 147,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFDBE9F5),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: TextField(
                  maxLines: null, // Allow unlimited lines for TextArea
                  // maxLength: 300,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      // constraints: BoxConstraints(minHeight: 147),
                      hintText: 'Write your Text Here.....',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BottomNavOneButton(context, "Add Claim", "")
            ],
          ),
        ));
  }
}
