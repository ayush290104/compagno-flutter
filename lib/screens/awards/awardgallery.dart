import 'package:compagno4/screens/awards/completed_award.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../core/class.dart';
import '../../main.dart';
import '../../save_user/constants/constants.dart';
import '../../save_user/network/local_save.dart';
import 'bloc/awards_bloc.dart';
import 'bloc/awards_state.dart';

class AwardGallery extends StatefulWidget {
  const AwardGallery({Key? key}) : super(key: key);

  @override
  State<AwardGallery> createState() => _AwardGalleryState();
}

class _AwardGalleryState extends State<AwardGallery> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: awardsCubit..fetch(SaveId.getSaveData(key: token)))
      ],
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
                  Text(
                    "POWERED BY",
                    style: k10_400_bebas,
                  ),
                  Image.asset('assets/images/METALLO.png'),
                  SizedBox(
                    width: 20,
                  ),
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
                      child: Image.asset("assets/images/back.png")),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "A w a r d s  G A L L E R Y",
                      style: k32_400_bebas,
                    ))
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "Click on an award to expand.",
                      style: k13_400_roboto,
                    ))
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 550,
              width: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.k000000,
              ),
              child: BlocBuilder<AwardsCubit, AwardsState>(
                builder: (context, state) {
                  if (state is! AwardsSuccessState) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "WAIT...",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }

                  if (awardsCubit.award!.completedAwards.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "No completed awards yet, go do some training!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k000000,
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        if (index < awardsCubit.award!.completedAwards.length) {
                          AwardsProgress completed =
                              awardsCubit.award!.completedAwards[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompletedAward(
                                                    awardsProgress:
                                                        completed)));
                                  },
                                  child: CircleAvatar(
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
                                ),
                              ),
                              Text(
                                _truncateText(completed.title, 3),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          );
                        } else {
                          return SizedBox(
                            height: 473 / 6,
                            width: 325 / 4,
                            child: Image.asset('assets/images/Ellipse 5.png'),
                          );
                        }
                      },
                      itemCount: 6 * 4,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String _truncateText(String text, int wordLimit) {
    List<String> words = text.split(' ');
    if (words.length <= wordLimit) {
      return text;
    }
    return words.sublist(0, wordLimit).join(' ') + '...';
  }
}

// Column(
// children: [
// Padding(
// padding: const EdgeInsets.only(top: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Column(
// children: [
// Image.asset('assets/images/award.png'),
// SizedBox(height: 11,),
// Text("1st Training ",style: k13_400_roboto,),
// Text("Session",style: k13_400_roboto,)
// ],
// ),
// Column(
// children: [
// Image.asset('assets/images/award.png'),
// SizedBox(height: 11,),
// Text("1st Trail Ride",style: k13_400_roboto,),
// ],
// ),
// Image.asset('assets/images/Ellipse 5.png'),
//
// ],),
// ),
// SizedBox(height: 30,),
// Padding(
// padding: const EdgeInsets.only(top: 10,left: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// ],),
// ),
// SizedBox(height: 30,),
// Padding(
// padding: const EdgeInsets.only(top: 10,left: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// ],),
// ),
// SizedBox(height: 30,),
// Padding(
// padding: const EdgeInsets.only(top: 10,left: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// ],),
// ),
// SizedBox(height: 30,),
// Padding(
// padding: const EdgeInsets.only(top: 10,left: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// Image.asset('assets/images/Ellipse 5.png'),
// ],),
// ),
// ],
// )
