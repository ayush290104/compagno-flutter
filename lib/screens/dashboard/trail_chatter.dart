import 'dart:math';

import 'package:compagno4/Controller/dashboardController.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_state.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    DashboardController dashboardController = Get.find();
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
                  BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      if (state is DashboardSuccessState) {
                        if (dashboardCubit.dashboardClass?.data?.lastRide!
                            .route !=
                            null ) {

                          dashboardController.getAddressFromLatLng(
                            LatLng( dashboardCubit.dashboardClass!.data!.lastRide!
                                .route!.last.lat!.toDouble(), dashboardCubit.dashboardClass!.data!.lastRide!
                                .route!.last.lng!.toDouble())


                          );
                          //debugPrint("listLocations at debug $listLocations");
                        }


                        return Expanded(
                          child: Obx(() => Text(
                              dashboardController.address.value,
                              style: k13_400_roboto)),
                        );
                      } else {
                        return const SizedBox(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("Wait!",
                                  style: TextStyle(color: Colors.white))),
                        );
                      }
                    },
                  )
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Container(
                height: 412,
                width: 350,
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
                    SizedBox(height: 39,),
                    BlocBuilder<DashboardCubit, DashboardState>(
                        builder: (context, state) {
                          if (state is DashboardSuccessState) {
                            double maxElement = fnToDouble2(dashboardCubit
                                .dashboardClass!
                                .data!
                                .lastRide!.trailChatter!
                                .data!).reduce((value, element) => value > element ? value : element);
                            return (dashboardCubit.dashboardClass!.data!
                                .lastRide!.trailChatter!.data!.length >
                                1)
                                ? Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: LineGraph(
                              features: [
                                  Feature(
                                      title: "TRAIL CHATTER",
                                      color: AppColors.k69806F,
                                      data: fnToDouble2(dashboardCubit
                                          .dashboardClass!
                                          .data!
                                          .lastRide!.trailChatter!
                                          .data!))
                              ],
                              size: Size(
                                    600,
                                    307),
                              labelX: [


                                  for (int i = 0; i < fnToDouble2(dashboardCubit.dashboardClass!.data!.lastRide!.trailChatter!.data!).length; i++)
                                    i==0||i == fnToDouble2(dashboardCubit.dashboardClass!.data!.lastRide!.trailChatter!.data!).length - 1
                                        ? dashboardCubit.dashboardClass!.data!.lastRide!.trailChatter!.distance![i]
                                        : "",


                              ],
                              labelY: [
                                 "0.33","0.667","1"
                              ],




                              //showDescription: true,
                              graphColor: Colors.white,
                              graphOpacity: 0.2,
                              verticalFeatureDirection: true,
                              // descriptionHeight: 100,
                            ),
                                )
                                : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        16 * 3,
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
                                    MediaQuery.of(context).size.width - 16 * 4,
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
              BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                    if (state is DashboardSuccessState) {
                      List<double> percent = fnToDouble3(dashboardCubit.dashboardClass!.data!
                          .lastRide!.trailChatter!.data!);
                      return (dashboardCubit.dashboardClass!.data!
                          .lastRide!.trailChatter!.data!.length >
                          1)
                          ? Column(
                            children: [
                              Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Stack(
                              children: [
                                Container(
                                  height: 8.h,
                                  width: Get.width*0.8,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF3F4640),
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                ),
                                Container(
                                  height: 8.h,
                                  width: Get.width*0.8*(percent[0]+percent[1]),
                                  decoration: BoxDecoration(
                                      color: Color(0xff69806F),
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width: Get.width*0.8*(percent[0]),
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
                                      "${(percent[0] * 100).toStringAsFixed(2)}%\nSmall",
                                      style: k13_400_roboto,
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Text(
                                      "${((percent[1]) * 100).toStringAsFixed(2)}%\nMedium",
                                      style: k13_400_roboto,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "${(percent[2] * 100).toStringAsFixed(2)}%\nLarge",
                                      style: k13_400_roboto,
                                    ),
                                  ],
                                ),
                              )
                            ],
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
                              MediaQuery.of(context).size.width - 16 * 7,
                              height: 307,
                              child: Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  "WAITING",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      );
                    }
                  }),


            ],
          ),
        ),
      ),
    );
  }

  List<double> fnToDouble3(List<double> ab) {
    List<double> rate = [0.0,0.0,0.0];
   if(ab.length==0){
     return rate;
   }
    for(var i in ab){
      if(i<0.3){
        rate[0]++;
      }
      else if(i<0.6){
        rate[1]++;
      }
      else{
        rate[2]++;
      }
    }

    rate[0] = (rate[0]/ab.length);
    rate[1] = (rate[1]/ab.length);
    rate[2] = (rate[2]/ab.length);

    debugPrint("rate of values = ${rate.toString()}");
    return rate;


  }



  List<double> fnToDouble2(List<double> ab) {
    List<double> hello = [];
    for(var a in ab){
        hello.add(a.toDouble());
    }
    double max = hello.reduce((value, element) => value > element ? value : element);
    for(int i = 0;i<hello.length;i++){
      hello[i] = hello[i]/max;
    }
     debugPrint("hello is :$hello");
    return hello;
  }
}
