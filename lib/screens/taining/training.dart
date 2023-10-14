import 'dart:math';

import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/screens/taining/bloc/train_cubit.dart';
import 'package:compagno4/screens/taining/bloc/train_state.dart';
import 'package:compagno4/screens/taining/traininglesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../awards/awards.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: trainCubit..fetch())],
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10, left: 10),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "T R A I N I N G",
                            style: k32_400_bebas,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      BlocBuilder<TrainCubit, TrainState>(
                          builder: (context, state) {
                        if (state is! TrainSuccessState) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("WAIT...",
                                style: TextStyle(color: Colors.white)),
                          );
                        }
                        debugPrint('trainCubit.trains ${trainCubit.trains}');
                        return Column(
                          children: [
                            for (TrainingClass training
                                in trainCubit.trains ?? [])

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        training.title,
                                        style: k20_400_bebas,
                                      ),
                                    ],
                                  ),
                                  GridView.count(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 2.2,
                                      mainAxisSpacing: .02,
                                      childAspectRatio: 1.3,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      children: List.generate(
                                          min(training.videos.length, 4),
                                          (index) {
                                        return InkWell(
                                          onTap: () {
                                            trainCubit.currentTrains = trainCubit
                                                .trains!
                                                .indexOf(training);
                                            trainCubit.currentVideo = index;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TrainingLesson(
                                                            video: training
                                                                .videos[index])));
                                          },
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Image.network(training
                                                      .videos[index].thumbnail),
                                                  Positioned(
                                                      top: 29,
                                                      left: 57,
                                                      child: Image.asset(
                                                          "assets/images/play96.png")),
                                                  Positioned(
                                                      left: 10,
                                                      bottom: 10,
                                                      child: Text(
                                                        training
                                                            .videos[index].title,
                                                        style: k13_400_roboto,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      })),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Awards()));
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 325,
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
                                          Image.asset(
                                              "assets/images/Polygon 1.png")
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                      }),
                      Row(
                        children: [
                          Text(
                            "A W A R D S",
                            style: k20_400_bebas,
                          ),
                        ],
                      ),
                      Container(
                        height: 83,
                        width: 360,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Image.asset("assets/images/award.png"),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 17,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 130,
                                        child: Text("5 Training Sessions",
                                            style: k13_400_roboto)),
                                    Text("VIEW PROGRESS", style: k11_400_roboto),
                                    Image.asset("assets/images/Polygon 1.png")
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width: 218.w,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff47574C),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 8.h,
                                          width: 160.w,
                                          decoration: const BoxDecoration(
                                              color: Color(0xff69806F),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12))),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
