import 'dart:math';

import 'package:compagno4/main.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_state.dart';
import 'package:compagno4/screens/dashboard/dashboard_map.dart';
import 'package:compagno4/screens/dashboard/speed.dart';
import 'package:compagno4/screens/dashboard/trail_chatter.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../goal/goal_set.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: AppColors.kB69F4C,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: dashboardCubit..fetch())],
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 71, left: 26),
                child: Row(
                  children: [
                    Text(
                      "COMPAGNO",
                      style: k25_400_noize,
                    ),
                    Spacer(),
                    Text(
                      "POWERED BY",
                      style: k10_400_bebas,
                    ),
                    Image.asset('assets/images/METALLO.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                return Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          (state is DashboardSuccessState)
                              ? "WELCOME, ${dashboardCubit.dashboardClass!.user.name.toUpperCase()}"
                              : "WAIT...",
                          style: k28_400_noize,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 5,
              ),
              Text(
                "Let’s amplify your ride experience.",
                style: k13_400_roboto,
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset("assets/images/user.png"),
              ),
              SizedBox(
                height: 39,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Row(
                  children: [
                    Text(
                      "YOUR LAST RIDE",
                      style: k20_400_bebas,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9, left: 26),
                child: Row(
                  children: [
                    Image.asset("assets/images/location.png"),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "McDowell Mountain Loop, Phoenix, AZ",
                      style: k13_400_roboto,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardMap()));
                      },
                      child: Container(
                        width: 57,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.k000000),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "MAP",
                              style: k10_700_roboto,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset("assets/images/Polygon 1.png")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrailChatter()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 8 * 3,
                      height: 158,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.k000000),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    "Trail Chatter",
                                    style: k16_400_bebas,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Image.asset("assets/images/iconsforword.png")
                              ],
                            ),
                          ),
                          BlocBuilder<DashboardCubit, DashboardState>(
                              builder: (context, state) {
                            return (state is DashboardSuccessState)
                                ? (dashboardCubit.dashboardClass!.trailChatter
                                            .data.length >
                                        1)
                                    ? LineGraph(
                                        features: [
                                          Feature(
                                            title: "TRAIL CHATTER",
                                            color: AppColors.kB69F4C,
                                            data: dashboardCubit.dashboardClass!
                                                .trailChatter.data,
                                          )
                                        ],
                                        size: Size(
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                8 * 3,
                                            100),
                                        labelX: [
                                          for (var i in dashboardCubit
                                              .dashboardClass!
                                              .trailChatter
                                              .data)
                                            ' '
                                        ],
                                        labelY: dashboardCubit
                                            .dashboardClass!.trailChatter
                                            .getLabelYmin(),
                                        //showDescription: true,
                                        graphColor: Colors.white,
                                        graphOpacity: 0.2,
                                        verticalFeatureDirection: true,
                                        // descriptionHeight: 100,
                                      )
                                    : SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                8 * 5,
                                        height: 100,
                                        child: Text(
                                            "sorry, we need more data to display it!",
                                            style:
                                                TextStyle(color: Colors.white)))
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            8 * 5,
                                    height: 100,
                                    child: Text("WAIT...",
                                        style: TextStyle(color: Colors.white)));
                          }),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpeedGraph()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 8 * 3,
                      height: 158,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.k000000),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    "Speed",
                                    style: k16_400_bebas,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                      "assets/images/iconsforword.png"),
                                )
                              ],
                            ),
                          ),
                          BlocBuilder<DashboardCubit, DashboardState>(
                              builder: (context, state) {
                            if (!(state is DashboardSuccessState))
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      8 * 5,
                                  height: 100,
                                  child: Text("WAIT...",
                                      style: TextStyle(color: Colors.white)));

                            if (dashboardCubit
                                    .dashboardClass!.speed.speed.length >
                                1)
                              return LineGraph(
                                features: [
                                  Feature(
                                      title: "speed",
                                      color: AppColors.kB69F4C,
                                      data: dashboardCubit
                                          .dashboardClass!.speed.speed)
                                ],
                                size: Size(
                                    MediaQuery.of(context).size.width / 2 -
                                        8 * 3,
                                    100),
                                labelX: [
                                  for (var i in dashboardCubit
                                      .dashboardClass!.speed.speed)
                                    ''
                                ],
                                labelY: dashboardCubit.dashboardClass!.speed
                                    .getLabelYMin(),
                                //showDescription: true,
                                graphColor: Colors.white,
                                graphOpacity: 0.2,
                                verticalFeatureDirection: true,
                                // descriptionHeight: 100,
                              );
                            return SizedBox(
                                width: MediaQuery.of(context).size.width / 2 -
                                    8 * 5,
                                height: 100,
                                child: Text(
                                    "sorry, we need more data to display it!",
                                    style: TextStyle(color: Colors.white)));
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<DashboardCubit, DashboardState>(
                      builder: (context, state) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 2 - 8 * 3,
                      height: 158,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.k000000),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    "TURN INCLIne",
                                    style: k16_400_bebas,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Image.asset("assets/images/iconsforword.png")
                              ],
                            ),
                          ),
                          if (state is DashboardSuccessState)
                            PrettyGauge(
                              gaugeSize: 100,
                              segments: [
                                GaugeSegment('Low', 20, Colors.red),
                                GaugeSegment('Medium', 40, Colors.orange),
                                GaugeSegment('High', 40, Colors.green),
                              ],
                              currentValue: (dashboardCubit
                                      .dashboardClass!.turnIncline.avg ??
                                  0),
                              needleColor: Colors.white,
                              displayWidget: const Text('',
                                  style: TextStyle(fontSize: 12)),
                              startMarkerStyle:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                              endMarkerStyle:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                          if (!(state is DashboardSuccessState))
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2 -
                                    8 * 5,
                                height: 100,
                                child: Text("WAIT...",
                                    style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    );
                  }),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 8 * 3,
                    height: 158,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.k000000),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  "Total time",
                                  style: k16_400_bebas,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                    "assets/images/iconsforword.png"),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<DashboardCubit, DashboardState>(
                            builder: (context, state) {
                          return Text(
                            (state is DashboardSuccessState)
                                ? dashboardCubit.dashboardClass!.totalTime
                                : "WAIT...",
                            style: k30_400_bebas,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 34),
                    child: Text(
                      "Tuning",
                      style: k20_400_bebas,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GoalSet()));
                },
                child: Container(
                  height: 54,
                  width: 325,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.kB69F4C),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset("assets/images/light.png"),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 19, top: 11),
                            child: Text(
                              "Want to improve how you rode this trail?\n Let’s tune your bike.",
                              style: k13_400_roboto,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 52,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMap()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Row(
                    children: [
                      Text(
                        "YOUR ROUTE",
                        style: k20_400_bebas,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Image.asset("assets/images/mapimage.png"),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Row(
                  children: [
                    Text(
                      "PREVIOUS rIDES",
                      style: k20_400_bebas,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                if ((state is! DashboardSuccessState)) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Text("WAIT...", style: TextStyle(color: Colors.white)),
                  );
                }
                if (dashboardCubit.dashboardClass!.previousRide.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("nothing yet !  first lets go to a ride ",
                        style: TextStyle(color: Colors.white)),
                  );
                }
                return Column(
                  children: [
                    for (dynamic ride
                        in dashboardCubit.dashboardClass!.previousRide)
                      Container(
                        height: 37,
                        width: MediaQuery.of(context).size.width - 16.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.k39453C),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset("assets/images/location.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              ride.tpString(),
                              style: k13_400_roboto,
                            ),
                            Spacer(),
                            Image.asset("assets/images/iconplus.png"),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              }),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width - 16.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "MORE",
                      style: k13_700_roboto,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset("assets/images/Polygon 1.png")
                  ],
                ),
              ),
              SizedBox(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}
