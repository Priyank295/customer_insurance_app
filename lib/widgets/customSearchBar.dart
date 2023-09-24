import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'customSearchDeligate.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

TextEditingController searchController = new TextEditingController();
bool focus = false;

class _CustomSearchBarState extends State<CustomSearchBar> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: focus == false ? Color(0xFFDBE9F5) : Color(0xFFEF7C00),
          ),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 28),
                child: SvgPicture.asset("assets/back2.svg")),
            SizedBox(
              width: 230,
              child: TextFormField(
                onTap: () {
                  setState(() {});
                },
                onTapOutside: (value) {
                  setState(() {
                    focus = false;
                  });
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
                  border: OutlineInputBorder(borderSide: BorderSide.none),
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
        SvgPicture.asset("assets/add.svg"),
      ]),
    );
  }
}
