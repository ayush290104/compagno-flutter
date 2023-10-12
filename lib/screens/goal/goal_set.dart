import 'package:compagno4/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:compagno4/main.dart';
import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../settings/setting_tuning.dart';
import 'goalset_larger_chatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalSet extends StatefulWidget {
  const GoalSet({Key? key}) : super(key: key);

  @override
  State<GoalSet> createState() => _GoalSetState();
}

class _GoalSetState extends State<GoalSet> {
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
                      "SUSPENSION TUNING",
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
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 16.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 23, bottom: 19),
                        child: Text(
                          "Trail Summary",
                          style: k20_400_bebas,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Text(
                              "Chatter",
                              style: k13_400_roboto,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 200.w,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff47574C),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                  ),
                                  Container(
                                    height: 8.h,
                                    width: 175.w,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff69806F),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 8.h,
                                        width: 119.w,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffEAE9E5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "60%\nSmall",
                                    style: k13_400_roboto,
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "30%\nMedium",
                                    style: k13_400_roboto,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "10%\nLarge",
                                    style: k13_400_roboto,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      BlocBuilder<DashboardCubit, DashboardState>(
                          builder: (context, state) {
                        if (state is! DashboardSuccessState) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "WAIT...",
                              style: k13_400_roboto,
                            ),
                          );
                        }
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: SizedBox(
                                width: 60,
                                child: Text(
                                  "Speed",
                                  style: k13_400_roboto,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width: MediaQuery.of(context).size.width -
                                          16 * 2 -
                                          80 -
                                          23 * 2 -
                                          16.0,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff47574C),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       height: 8.h,
                                    //       width: (dashboardCubit
                                    //                   .dashboardClass!.speed
                                    //                   .getMax() ==
                                    //               0
                                    //           ? 0.0
                                    //           : (dashboardCubit
                                    //                   .dashboardClass!.speed
                                    //                   .getAvg()) *
                                    //               (MediaQuery.of(context)
                                    //                       .size
                                    //                       .width -
                                    //                   16 * 2 -
                                    //                   80 -
                                    //                   23 * 2 -
                                    //                   16.0) /
                                    //               (dashboardCubit
                                    //                   .dashboardClass!.speed
                                    //                   .getMax())),
                                    //       decoration: const BoxDecoration(
                                    //           color: Color(0xffEAE9E5),
                                    //           borderRadius: BorderRadius.all(
                                    //               Radius.circular(12))),
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // SizedBox(
                                //   width: (MediaQuery.of(context).size.width -
                                //       16 * 2 -
                                //       80 -
                                //       23 * 2 -
                                //       16.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     children: [
                                //       Text(
                                //         "${dashboardCubit.dashboardClass!.speed.getMin()} mph\nSlowest",
                                //         style: k13_400_roboto,
                                //       ),
                                //       Text(
                                //         "${dashboardCubit.dashboardClass!.speed.getAvg()} mph\nAverage",
                                //         style: k13_400_roboto,
                                //       ),
                                //       Text(
                                //         "${dashboardCubit.dashboardClass!.speed.getMax()} mph\nFastest",
                                //         style: k13_400_roboto,
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
                            )
                          ],
                        );
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      BlocBuilder<DashboardCubit, DashboardState>(
                          builder: (context, state) {
                        if (state is! DashboardSuccessState)
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "WAIT...",
                              style: k13_400_roboto,
                            ),
                          );
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: SizedBox(
                                width: 60,
                                child: Text(
                                  "Incline",
                                  style: k13_400_roboto,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                              16 * 2 -
                                              80 -
                                              23 * 2 -
                                              16.0),
                                      decoration: const BoxDecoration(
                                          color: Color(0xff47574C),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                    Row(
                                      children: [
                                        // Container(
                                        //   height: 8.h,
                                        //   width: ((dashboardCubit
                                        //               .dashboardClass!
                                        //               .turnIncline
                                        //               .max ==
                                        //           0.0)
                                        //       ? 0.0
                                        //       : ((dashboardCubit.dashboardClass!
                                        //                   .turnIncline.avg ??
                                        //               0) *
                                        //           (MediaQuery.of(context)
                                        //                   .size
                                        //                   .width -
                                        //               16 * 2 -
                                        //               80 -
                                        //               23 * 2 -
                                        //               16.0) /
                                        //           ((dashboardCubit
                                        //                   .dashboardClass!
                                        //                   .turnIncline
                                        //                   .max ??
                                        //               1)))),
                                        //   decoration: const BoxDecoration(
                                        //       color: Color(0xff69806F),
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(12))),
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // SizedBox(
                                //   width: (MediaQuery.of(context).size.width -
                                //       16 * 2 -
                                //       80 -
                                //       23 * 2 -
                                //       16.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       SizedBox(
                                //         width: 20,
                                //       ),
                                //       Text(
                                //         "${dashboardCubit.dashboardClass!.turnIncline.avg ?? 0}°\nAverage",
                                //         style: k13_400_roboto,
                                //       ),
                                //       Text(
                                //         "${dashboardCubit.dashboardClass!.turnIncline.max ?? 0}°\nSteepest",
                                //         style: k13_400_roboto,
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
                            )
                          ],
                        );
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Time",
                            style: k13_400_roboto,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          // BlocBuilder<DashboardCubit, DashboardState>(
                          //     builder: (context, state) {
                          //   return Text(
                          //     (state is DashboardSuccessState)
                          //         ? dashboardCubit.dashboardClass!.totalTime
                          //         : "WAIT...",
                          //     style: k16_800_roboto,
                          //   );
                          // }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 51),
                child: Text(
                  "How would you like to tune your bike to improve your next ride on McDowell Mountain Loop?",
                  style: k16_400_roboto,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoalSetChatter()));
                },
                child: Container(
                  width: 325,
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k000000),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Image.asset("assets/images/wavyline.png"),
                      ),
                      Spacer(),
                      Text(
                        "Assist with chatter",
                        style: k18_400_bebas,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset("assets/images/iconsforword.png"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 325,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Image.asset("assets/images/curved.png"),
                    ),
                    Spacer(),
                    Text(
                      "Faster turns",
                      style: k18_400_bebas,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("assets/images/iconsforword.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 325,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Image.asset(
                        "assets/images/rightarrow.png",
                        height: 20,
                        width: 30,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Efficient pedaling",
                      style: k18_400_bebas,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("assets/images/iconsforword.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 325,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Image.asset("assets/images/timer.png"),
                    ),
                    Spacer(),
                    Text(
                      "Improve overall time",
                      style: k18_400_bebas,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("assets/images/iconsforword.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 61,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingTuning()));
                },
                child: Container(
                  height: 31,
                  width: 325,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k69806F),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text(
                          "How is my bike currently tuned?",
                          style: k13_400_roboto,
                        ),
                      ),
                      SizedBox(
                        width: 19,
                      ),
                      Image.asset('assets/images/Polygon 1.png')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 61,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
