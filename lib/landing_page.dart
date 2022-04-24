import 'package:flutter/material.dart';
import 'package:bmi_calculator/themes/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(
                FontAwesomeIcons.weightScale,
                color: Colors.white,
                size: 70,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Body Mass Index Calculator",
              textAlign: TextAlign.center,
              softWrap: true,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColor.primaryColor)),
              child: Text(
                "Start",
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
