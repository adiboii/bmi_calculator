import 'package:flutter/material.dart';
import 'package:bmi_calculator/themes/app_color.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class InputHeight extends StatefulWidget {
  @override
  State<InputHeight> createState() => _InputHeightState();
}

class _InputHeightState extends State<InputHeight> {
  final RulerPickerController _rulerPickerController =
      RulerPickerController(value: 0);
  int currentValue = 150;
  int beginValue = 0;
  int endValue = 300;
  String type = "cm";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Height",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColor.textColor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Color(0x1521253F),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColor.secondaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Centimeters",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Color(0x1521253F),
                      ),
                    ),
                    child: RulerPicker(
                      controller: _rulerPickerController,
                      beginValue: beginValue,
                      endValue: endValue,
                      initValue: currentValue,
                      rulerBackgroundColor: Color(0xFFFEFEFE),
                      scaleLineStyleList: [
                        ScaleLineStyle(
                            color: Colors.grey,
                            width: 1.5,
                            height: 30,
                            scale: 0),
                        ScaleLineStyle(
                            color: Colors.grey, width: 1, height: 25, scale: 5),
                        ScaleLineStyle(
                            color: Colors.grey, width: 1, height: 15, scale: -1)
                      ],
                      // onBuildRulerScalueText: (index, scaleValue) {
                      //   return ''.toString();
                      // },
                      onValueChange: (value) {
                        setState(() {
                          currentValue = value;
                        });
                      },
                      width: MediaQuery.of(context).size.height - 270,
                      height: 80,
                      rulerMarginTop: 8,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Your Height:",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 15,
                            ),
                      ),
                      Text(
                        "$currentValue CM",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image(
                        image: AssetImage("assets/silhouette.png"),
                        height: MediaQuery.of(context).size.height - 330,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input_weight',
                      arguments: {'height': currentValue});
                },
                child: Text(
                  "NEXT",
                  style: Theme.of(context).textTheme.button?.copyWith(
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
