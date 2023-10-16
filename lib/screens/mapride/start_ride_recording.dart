import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:compagno4/post_value_provider.dart';
import 'package:compagno4/screens/mapride/ride_complete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class StartRiding extends StatefulWidget {
  const StartRiding({Key? key}) : super(key: key);

  @override
  State<StartRiding> createState() => _StartRidingState();
}

class _StartRidingState extends State<StartRiding> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PostValueProvider>().cancel();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    "COMPAGNO",
                    style: k25_400_noize,
                  ),
                  const Spacer(),
                  Text(
                    "POWERED BY",
                    style: k10_400_bebas,
                  ),
                  Image.asset('assets/images/METALLO.png'),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Recording RIDE ...",
              style: k32_400_bebas,
            ),
            SizedBox(
              height: 78,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.k000000,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 17, left: 11),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "TRAIL CHATTER",
                              style: k11_700_roboto,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: 200.0,
                              height: 20.0,
                              decoration: BoxDecoration(

                              ),
                              child: Selector<PostValueProvider, List<double>>(
                                selector: (p0, p1) => p1.trailChatterList,
                                shouldRebuild: (previous, next) => true,
                                builder: (context, value, child) => Sparkline(
                                  data: value,
                                  useCubicSmoothing: true,
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 2.0,
                              height: 20.0,

                              child: Selector<PostValueProvider, List<double>>(
                                selector: (p0, p1) => p1.trailChatterList,
                                shouldRebuild: (previous, next) => true,
                                builder: (context, value, child) => Text(value.last.toString())
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, left: 11),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "ACCELERATION",
                              style: k11_700_roboto,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: 200.0,
                              height: 20.0,
                              child: Selector<PostValueProvider, List<double>>(
                                selector: (p0, p1) => p1.accelerationList,
                                shouldRebuild: (previous, next) => true,
                                builder: (context, value, child) => Sparkline(
                                  data: value,
                                  useCubicSmoothing: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, left: 11),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "INCLINE",
                              style: k11_700_roboto,
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Expanded(
                            flex: 6,

                            child: Selector<PostValueProvider, double>(
                              selector: (p0, p1) => p1.inclineAngle ,
                              builder: (context, value, child) {
                                double normalizedValue =
                                (-1*value);

                                return

                                  Container(
                                    width: 120,
                                    height: 120,
                                    child: SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          minimum: -90,
                                          maximum: 91,
                                          startAngle: 180,
                                          endAngle: 0,
                                          radiusFactor: 1,
                                          showLabels: true,
                                          interval: 45,
                                          onLabelCreated: (args) {
                                            // Custom label formatter to display only positive values
                                            args.text = '${double.parse(args.text).abs().toInt()}';
                                            args.labelStyle = const GaugeTextStyle(
                                                color: Colors.white, fontSize: 10);
                                          },
                                          ranges: <GaugeRange>[
                                            GaugeRange(
                                              startValue: -90,
                                              endValue: -45,
                                              color: Colors.red,

                                            ),
                                            GaugeRange(
                                              startValue: -45,
                                              endValue: 45,
                                              color: Colors.green,
                                            ),
                                            GaugeRange(
                                              startValue: 45,
                                              endValue: 90,
                                              color: Colors.red,
                                            ),
                                          ],
                                          pointers: <GaugePointer>[
                                            MarkerPointer(
                                              value: normalizedValue,
                                              color: Colors.white,
                                              enableAnimation: true,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );


                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 98,
            ),
            InkWell(
              onTap: () {
                context.read<PostValueProvider>().completeRide();
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RideComplete()));
              },
              child: Stack(
                children: [
                  Image.asset('assets/images/Ellipse22.png'),
                  Positioned(
                    top: 25,
                    left: 30,
                    child: Container(
                      width: 5,
                      height: 45,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 60,
                    child: Container(
                      width: 5,
                      height: 45,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: 64,
                color: Colors.transparent,
                child: Center(
                    child: Text(
                      "TAP TO STOP",
                      style: k13_700_roboto,
                    ))),
          ],
        ),
      ),
    );
  }
}


class AxisLabelWidget extends StatelessWidget {
  final String text;
  final double angle;

  const AxisLabelWidget({
    Key? key,
    required this.text,
    required this.angle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * (pi / 180),
      child: Text(text,),
    );
  }
}