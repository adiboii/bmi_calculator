import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/themes/app_color.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calculator/components/BMI_calculator.dart';

class InputWeight extends StatefulWidget {
  const InputWeight({Key? key}) : super(key: key);

  @override
  State<InputWeight> createState() => _InputWeightState();
}

class _InputWeightState extends State<InputWeight> {
  Map data = {};
  int weight = 90;
  late int height;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    height = data['height'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Weight",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            "Kilograms",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 180,
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 60,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 60,
                        endValue: 120,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 120,
                        endValue: 180,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10)
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: weight.toDouble(),
                      enableAnimation: true,
                      enableDragging: true,
                      onValueChanged: (double newValue) {
                        setState(() {
                          weight = newValue.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Your Weight:",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 15,
                      ),
                ),
                Text(
                  "$weight KG",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                onPressed: () {
                  Calculator calc = Calculator(weight: weight, height: height);

                  Navigator.pushNamed(
                    context,
                    '/results_page',
                    arguments: {
                      'bmiResult': calc.calculateBMI(),
                      'result': calc.getResult(),
                      'interpretation': calc.getInterpretation(),
                    },
                  );
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
