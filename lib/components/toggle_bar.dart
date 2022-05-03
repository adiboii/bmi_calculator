import 'package:flutter/material.dart';
import 'package:bmi_calculator/themes/app_color.dart';

class CustomToggleBar extends StatefulWidget {
  late final List<bool> isSelected;
  late final List<String> measurementType;
  final returnType;
  //CustomToggleBar({required this.isSelected, required this.measurementType});
  CustomToggleBar(
      {Key? key,
      required this.isSelected,
      required this.measurementType,
      required this.returnType})
      : super(key: key);
  @override
  State<CustomToggleBar> createState() => _CustomToggleBar();
}

class _CustomToggleBar extends State<CustomToggleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Color(0x1521253F),
        ),
      ),
      child: Ink(
        width: 400,
        height: 40,
        color: Colors.white,
        child: GridView.count(
          primary: true,
          crossAxisCount: widget
              .measurementType.length, //set the number of buttons in a row
          crossAxisSpacing: 5, //set the spacing between the buttons
          childAspectRatio: 4.5, //set the width-to-height ratio of the button,
          //>1 is a horizontal rectangle
          children: List.generate(widget.isSelected.length, (index) {
            //using Inkwell widget to create a button
            return InkWell(
                splashColor: Colors.yellow, //the default splashColor is grey
                onTap: () {
                  //set the toggle logic
                  setState(() {
                    for (int indexBtn = 0;
                        indexBtn < widget.isSelected.length;
                        indexBtn++) {
                      if (indexBtn == index) {
                        widget.isSelected[indexBtn] = true;
                      } else {
                        widget.isSelected[indexBtn] = false;
                      }
                    }
                  });
                },
                child: Ink(
                  decoration: BoxDecoration(
                    //set the background color of the button when it is selected/ not selected
                    color: widget.isSelected[index]
                        ? AppColor.secondaryColor
                        : Colors.white,
                    // here is where we set the rounded corner
                    borderRadius: BorderRadius.circular(10),
                    //don't forget to set the border,
                    //otherwise there will be no rounded corner
                  ),
                  child: Center(
                    child: Text(
                      widget.measurementType[index].toString(),
                      //set the color of the icon when it is selected/ not selected
                      style: TextStyle(
                          color: widget.isSelected[index]
                              ? Colors.white
                              : AppColor.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
          }),
        ),
      ),
    );
  }
}

class CustomToggleButton extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback? onPress;
  final String? text;
  final Color textColor;

  CustomToggleButton(
      {this.buttonColor = const Color(0xFFFC6D20),
      this.textColor = const Color(0xff21253F),
      this.onPress,
      this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: InkWell(
          splashColor: Colors.yellow,
          child: Ink(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  text!,
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
