import 'package:compagno4/core/class.dart';
import 'package:compagno4/core/network/app_api.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/screens/awards/bloc/awards_bloc.dart';
import 'package:compagno4/screens/awards/bloc/awards_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../save_user/constants/constants.dart';
import '../../save_user/network/local_save.dart';
import 'awardgallery.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Awards extends StatefulWidget {
  const Awards({Key? key}) : super(key: key);

  @override
  State<Awards> createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {
  @override
  Widget build(BuildContext context) {
    debugPrint(
        'awardsCubit.award!.completedAwards ${awardsCubit.award?.completedAwards
            .length}');
    return MultiBlocProvider(
      providers: [
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
                  padding: const EdgeInsets.only(left: 26),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset("assets/images/back.png")),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26, top: 6),
                      child: Text(
                        "A w a r d s",
                        style: k32_400_bebas,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 29,
                ),
                /*      Row(children: [
                SizedBox(width: 68,) ,

                Image.asset("assets/images/sparkling.png") ,
                  SizedBox(width: 4,) ,
                  Text("1st Training Session",style: k20_400_bebas,)
                ],),
                Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: Image.asset("assets/images/ethereum-coin 2.png"),
                ),
                SizedBox(height: 29,),
                Text("You completed all lessons in your first",style: k13_400_roboto,),
                Text(" training session. Well done!",style: k13_400_roboto,),
                SizedBox(height: 29,),*/
                Container(
                  width: 325,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k000000),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Awards Progress",
                          style: k20_400_bebas,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        BlocBuilder<AwardsCubit, AwardsState>(
                            builder: (context, state) {
                              if (state is! AwardsSuccessState) {
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("WAIT...",
                                      style: TextStyle(color: Colors.white)),
                                );
                              }
                              if (awardsCubit.award!.awardsProgress.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      "nothing yet , go do some training!",
                                      style: TextStyle(color: Colors.white)),
                                );
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (AwardsProgress progress in awardsCubit.award!.awardsProgress)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset("assets/images/award.png"),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  LinearProgressIndicator(
                                                    value: ((progress.progressCount ?? 0) / (200 ?? 0)),
                                                    borderRadius: BorderRadius.circular(10),
                                                    minHeight: 10,
                                                    backgroundColor: const Color(0xffB69F4C),
                                                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFFFFFF)),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${((progress.completeCount ?? 0) - (progress.progressCount ?? 0))} Session Left',
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
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${progress.completeCount} ${progress.completionType} sessions",
                                                style: k11_700_roboto,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 17,
                                        ),
                                      ],
                                    ),
                                ],
                              );

                            })
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Container(
                  height: 203,
                  width: 325,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k000000),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 17, left: 25),
                        child: Row(
                          children: [
                            Text(
                              "Completed Awards",
                              style: k20_400_bebas,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      BlocBuilder<AwardsCubit, AwardsState>(
                          builder: (context, state) {
                            if (state is! AwardsSuccessState) {
                              return const Text("WAIT...",
                                  style: TextStyle(color: Colors.white));
                            }

                            if (awardsCubit.award!.completedAwards.isEmpty) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    "No completed awards yet, go do some training!",
                                    style: TextStyle(color: Colors.white)),
                              );
                            }

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (AwardsProgress completed in awardsCubit
                                    .award!
                                    .completedAwards)
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                    child: (completed.icon == "")
                                        ? Image.asset(
                                      'assets/images/award.png',
                                      fit: BoxFit.fill,
                                    )
                                        : Image.network(
                                      "https://compagno.app${completed.icon.replaceFirst("/api/", "")}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                if (awardsCubit.award!.completedAwards.length <
                                    4)
                                  for (int i = 0; i < (4 -
                                      awardsCubit.award!.completedAwards
                                          .length); i++)
                                    Image.asset('assets/images/Ellipse 5.png'),
                              ],
                            );
                          }),
                      const SizedBox(
                        height: 29,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AwardGallery()));
                        },
                        child: Container(
                          height: 35,
                          width: 279,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.k48574C),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "SEE GALLERY",
                                style: k13_700_roboto,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset("assets/images/Polygon 1.png")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Container(
                  height: 167,
                  width: 325,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k000000),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22, left: 23),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("LIFETIME", style: k20_400_bebas),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [

                            Expanded(
                              flex:1,
                              child: Text(
                                  '${awardsCubit.award?.lifeTime.ridesCompleted ??
                                      '-'}',
                                  style: const TextStyle(
                                    color: Color(0xFFB59E4C),
                                    fontSize: 40,
                                    fontFamily: 'Noize Sport Free Vertion',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 6,
                                  )),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Rides completed",
                                style: k13_400_roboto,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Text(
                                  '${awardsCubit.award?.lifeTime.sessionsCompleted ??
                                      '-'}',
                                  style: const TextStyle(
                                    color: Color(0xFFB59E4C),
                                    fontSize: 40,
                                    fontFamily: 'Noize Sport Free Vertion',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 6,
                                  )),
                            ),

                            Expanded(
                              flex:2,
                              child: Text(
                                "Training sessions completed",
                                style: k13_400_roboto,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Container(
                    height: 167,
                    width: 325,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.k000000),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22, left: 23),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Compagno Rewards", style: k20_400_bebas),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                  child: Image.asset("assets/images/gift-box.png")),
                              Expanded(
                                flex:3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:10,right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),

                                      LinearProgressIndicator(

                                        value: ((awardsCubit.award?.awardsProgress.where((element) => element.completionType == "rewards").length ?? 0) / 100),
                                        borderRadius: BorderRadius.circular(10),
                                        minHeight: 10,
                                        backgroundColor: const Color(0xffB69F4C),
                                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFFFFFF)),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${100 - (awardsCubit.award?.awardsProgress.where((element) => element.completionType == "rewards").length ?? 0)} Rides left',
                                                style: k11_700_roboto,
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                "Free t-shirt on your 100th ride",
                                style: k13_400_roboto,
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 122,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
