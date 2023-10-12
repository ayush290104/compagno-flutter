import 'package:compagno4/post_value_provider.dart';
import 'package:compagno4/screens/mapride/ride_complete.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

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
              padding: const EdgeInsets.only(top: 30, left: 26),
              child: Row(
                children: [
                  Text(
                    "COMPAGNO",
                    style: k25_400_noize,
                  ),
                  Spacer(),
                  Text("POWERED BY", style: k10_400_bebas),
                  Image.asset('assets/images/METALLO.png'),
                  SizedBox(
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
            Container(
              height: 200,
              width: 325,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.k000000),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 17, left: 11),
                    child: Row(
                      children: [
                        Text(
                          "TRAIL CHATTER",
                          style: k11_700_roboto,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200.0,
                          height: 20.0,
                          child: Selector<PostValueProvider, List<double>>(
                            selector: (p0, p1) => p1.trailChatterList,
                            shouldRebuild: (previous, next) => true,
                            builder: (context, value, child) => Sparkline(
                              data: value,
                              useCubicSmoothing: true,
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
                        Text(
                          "ACCELERATION",
                          style: k11_700_roboto,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 19, left: 11),
                    child: Row(
                      children: [
                        Text(
                          "INCLINE",
                          style: k11_700_roboto,
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Selector<PostValueProvider, double>(
                          selector: (p0, p1) => p1.inclinationList,
                          builder: (context, value, child) => PrettyGauge(
                            gaugeSize: 100,
                            segments: [
                              GaugeSegment('Low', 20, Colors.red),
                              GaugeSegment('Medium', 40, Colors.orange),
                              GaugeSegment('High', 40, Colors.green),
                            ],
                            needleColor: Colors.white,
                            currentValue: value,
                            displayWidget: const Text('Fuel in tank',
                                style: TextStyle(fontSize: 12)),
                            startMarkerStyle:
                                TextStyle(fontSize: 10, color: Colors.grey),
                            endMarkerStyle:
                                TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 98,
            ),
            InkWell(
              onTap: () {
                context.read<PostValueProvider>().completeRide();

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
