import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchDelegate extends StatefulWidget {
  @override
  _CustomSearchDelegateState createState() => _CustomSearchDelegateState();
}

bool focus = false;

class _CustomSearchDelegateState extends State<CustomSearchDelegate> {
  String _searchText = '';

  final List<String> historyData = [
    "Lic",
    "Birla",
    "Tata",
  ];
  bool close = false;
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21.5),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              margin: const EdgeInsets.only(top: 39),
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color:
                        focus == false ? Color(0xFFDBE9F5) : Color(0xFFEF7C00),
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: Center(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 28),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset("assets/back2.svg"))),
                          SizedBox(
                            width: 230,
                            child: TextFormField(
                              controller: searchController,
                              onTap: () {
                                setState(() {
                                  focus = true;
                                });
                              },
                              onTapOutside: (value) {
                                setState(() {
                                  focus = false;
                                });
                              },
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    close = false;
                                  });
                                } else {
                                  setState(() {
                                    close = true;
                                  });
                                }
                              },
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                // fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: Colors.black,
                              // cursorHeight: 20,

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  top: 25,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Search Policies",
                                hintStyle: TextStyle(
                                  color: Color(0xFF939EAA),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // SvgPicture.asset("assets/add.svg"),
                      close
                          ? InkWell(
                              onTap: () {
                                searchController.clear();
                                setState(() {
                                  close = false;
                                });
                              },
                              child: Container(
                                height: 52,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: SvgPicture.asset(
                                            "assets/close2.svg")),
                                  ],
                                ),
                              ))
                          : Container(),
                    ]),
              ),
            ),

            //if history is empty

            // Expanded(
            //   child: Container(
            //     margin: EdgeInsets.only(bottom: 60),
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Image.asset(
            //             "assets/searching.gif",
            //             width: 189,
            //             height: 189,
            //           ),
            //           Text(
            //             'No Searches Yet!',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //           Text(
            //             'Start Searching your sold policies now!',
            //             style: TextStyle(
            //               color: Color(0xFF939EAA),
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           )
            //         ]),
            //   ),
            // ),

            Container(
              margin: EdgeInsets.only(top: 35, bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search History',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Clear All',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: historyData.length,
              itemBuilder: (context, index) {
                return historyTile(context, historyData[index]);
              },
            )
          ],
        ),
      )),
    );
  }

  Widget historyTile(context, String data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12.5),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            SvgPicture.asset("assets/clock2.svg"),
            const SizedBox(width: 13),
            Text(
              'Insurance',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SvgPicture.asset("assets/checkIn.svg"),
      ]),
    );
  }
}
