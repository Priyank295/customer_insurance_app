import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRadioButton extends StatefulWidget {
  final List<String> radioValuesList;
  final Function(String) callBack;
  const CustomRadioButton(
      {super.key, required this.radioValuesList, required this.callBack});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

int selectedIndex = -1;

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.radioValuesList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 65),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex == index
                  ? selectedIndex = -1
                  : selectedIndex = index;
              widget.callBack(widget.radioValuesList[selectedIndex]);
            });
          },
          child: Container(
            // padding: EdgeInsets.only(left: 33, top: 20, bottom: 20),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: selectedIndex == index
                    ? BorderSide(width: 1, color: Color(0xFF008EFF))
                    : BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 33),
                  child: Text(
                    widget.radioValuesList[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? Color(0xFF008EFF)
                          : Color(0xFF939EAA),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
