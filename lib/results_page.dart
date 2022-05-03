import 'package:flutter/material.dart';
import 'package:bmi_calculator/themes/app_color.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultPage extends StatelessWidget {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Result",
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
                            data['result'],
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    showAxisLine: false,
                    showTicks: false,
                    showLabels: false,
                    minimum: 13.5,
                    maximum: 30.0,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 13.5,
                          endValue: 18.5,
                          color: Color(0xffFFC93E),
                          startWidth: 10,
                          endWidth: 30),
                      GaugeRange(
                          startValue: 18.5,
                          endValue: 24.9,
                          color: Color(0xff0DC9AB),
                          startWidth: 30,
                          endWidth: 30),
                      GaugeRange(
                          startValue: 24.9,
                          endValue: 30.0,
                          color: Color(0xffF45656),
                          startWidth: 30,
                          endWidth: 10)
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: double.parse(data['bmiResult']),
                        enableAnimation: true,
                      ),
                    ],
                    annotations: [
                      GaugeAnnotation(
                        angle: 90,
                        positionFactor: 1.8,
                        widget: Column(
                          children: [
                            Text(
                              "Your BMI:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 15,
                                  ),
                            ),
                            Text(
                              "${double.parse(data['bmiResult'])}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                    fontSize: 50,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  data['interpretation'],
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                child: Text(
                  "FINISH",
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
