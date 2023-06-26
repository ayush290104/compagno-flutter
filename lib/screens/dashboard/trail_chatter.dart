import 'package:compagno4/main.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_state.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/color.dart';
import '../../constant/fonts.dart';

class TrailChatter extends StatefulWidget {
  const TrailChatter({Key? key}) : super(key: key);

  @override
  State<TrailChatter> createState() => _TrailChatterState();
}

class _TrailChatterState extends State<TrailChatter> {
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: AppColors.k69806F,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: dashboardCubit)],
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: SingleChildScrollView(
          child: Column(
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
                    Text(
                      "POWERED BY",
                      style: k10_400_bebas,
                    ),
                    Image.asset('assets/images/METALLO.png'),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset("assets/images/back.png")),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26, top: 6),
                    child: Text(
                      "Trail Chatter",
                      style: k32_400_bebas,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 29),
                    child: Image.asset("assets/images/location.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "McDowell Mountain Loop, Phoenix, AZ",
                    style: k13_400_roboto,
                  )
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Container(
                height: 412,
                width: 325,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 21),
                      child: Row(
                        children: [
                          Text(
                            "Chatter size",
                            style: k16_400_bebas,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<DashboardCubit, DashboardState>(
                        builder: (context, state) {
                      if (state is DashboardSuccessState) {
                        return (dashboardCubit
                                    .dashboardClass!.trailChatter.data.length >
                                1)
                            ? LineGraph(
                                features: [
                                  Feature(
                                      title: "TRAIL CHATTER",
                                      color: AppColors.k69806F,
                                      data: dashboardCubit
                                          .dashboardClass!.trailChatter.data)
                                ],
                                size: Size(
                                    MediaQuery.of(context).size.width - 16 * 2,
                                    307),
                                labelX: [
                                  for (double i in dashboardCubit
                                      .dashboardClass!.trailChatter.data)
                                    i.toString()
                                ],
                                labelY: [
                                  for (double i in dashboardCubit
                                      .dashboardClass!.trailChatter.distance)
                                    i.toString()
                                ],
                                //showDescription: true,
                                graphColor: Colors.white,
                                graphOpacity: 0.2,
                                verticalFeatureDirection: true,
                                // descriptionHeight: 100,
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          16 * 2,
                                      height: 307,
                                      child: const Text(
                                        "sorry, we need more data to display it!",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              );
                      } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width - 16 * 2,
                                height: 307,
                                child: const Text(
                                  "WAITING",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Stack(
                  children: [
                    Container(
                      height: 8.h,
                      width: 324.w,
                      decoration: BoxDecoration(
                          color: Color(0xff39453C),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    Container(
                      height: 8.h,
                      width: 283.w,
                      decoration: BoxDecoration(
                          color: Color(0xff69806F),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 8.h,
                          width: 192.w,
                          decoration: BoxDecoration(
                              color: Color(0xffEAE9E5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 10),
                child: Row(
                  children: [
                    Text(
                      "60%\nSmall",
                      style: k13_400_roboto,
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      "30%\nMedium",
                      style: k13_400_roboto,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "10%\nLarge",
                      style: k13_400_roboto,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
