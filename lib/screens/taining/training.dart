import 'dart:math';

import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/screens/taining/bloc/train_cubit.dart';
import 'package:compagno4/screens/taining/bloc/train_state.dart';
import 'package:compagno4/screens/taining/more_videos.dart';
import 'package:compagno4/screens/taining/traininglesson.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../save_user/constants/constants.dart';
import '../../save_user/network/local_save.dart';
import '../awards/bloc/awards_bloc.dart';
import '../awards/bloc/awards_state.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: trainCubit..fetch(SaveId.getSaveData(key: token))),
        BlocProvider.value(
            value: awardsCubit..fetch(SaveId.getSaveData(key: token)))
      ],
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
                      // ignore: prefer_const_constructors
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
                      const SizedBox(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          training.title,
                                          style: k20_400_bebas,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2.2,
                                        mainAxisSpacing: .02,
                                        childAspectRatio: 1.3,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            min(training.videos.length, 4),
                                            (index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: InkWell(
                                              onTap: () {
                                                trainCubit.currentTrains =
                                                    trainCubit.trains!
                                                        .indexOf(training);
                                                trainCubit.currentVideo = index;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TrainingLesson(
                                                                video: training
                                                                        .videos[
                                                                    index],
                                                                particular:
                                                                    trainCubit
                                                                        .currentTrains)));
                                              },
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Image.network(training
                                                          .videos[index]
                                                          .thumbnail),
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
                                                                .videos[index]
                                                                .title,
                                                            style:
                                                                k13_400_roboto,
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MoreVideosScreen(
                                                      training: training,
                                                    )));
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 325,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "MORE",
                                              style: k13_700_roboto,
                                            ),
                                            const SizedBox(
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
                              ),
                          ],
                        );
                      }),

                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "A W A R D S",
                              style: k20_400_bebas,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, award);
                        },
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10,left: 5, right: 5),
                            width: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlocBuilder<AwardsCubit, AwardsState>(
                                builder: (context, state) {
                                  if (state is! AwardsSuccessState) {
                                    return const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("WAIT...", style: TextStyle(color: Colors.white)),
                                    );
                                  }
                                  if (awardsCubit.award!.awardsProgress.isEmpty) {
                                    return const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "nothing yet, go do some training!",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/award.png"),
                                          const SizedBox(width: 30),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "${awardsCubit.award!.awardsProgress[0].completeCount} ${awardsCubit.award!.awardsProgress[0].completionType} sessions",
                                                        style: k11_700_roboto,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pushNamed(context, award);
                                                      },
                                                      child: const Row(
                                                        children: [
                                                          Text(
                                                            "VIEW PROGRESS",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.arrow_forward,
                                                            color: Colors.white,
                                                            size: 16,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                LinearProgressIndicator(
                                                  value: ((awardsCubit.award!.awardsProgress[0].progressCount ?? 0) / (200 ?? 0)),
                                                  borderRadius: BorderRadius.circular(10),
                                                  minHeight: 10,
                                                  backgroundColor: const Color(0xffB69F4C),
                                                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFFFFFF)),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${((awardsCubit.award!.awardsProgress[0].completeCount ?? 0) - (awardsCubit.award!.awardsProgress[0].progressCount ?? 0))} Session Left',
                                                          style: k11_700_roboto,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 7),
                                      const SizedBox(height: 17),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                      ),
                      const SizedBox(
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
