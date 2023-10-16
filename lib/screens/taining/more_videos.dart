import 'package:compagno4/constant/color.dart';
import 'package:compagno4/screens/taining/bloc/train_cubit.dart';
import 'package:compagno4/screens/taining/bloc/train_state.dart';
import 'package:compagno4/screens/taining/traininglesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/fonts.dart';
import '../../core/class.dart';
import '../../main.dart';
import '../../save_user/constants/constants.dart';
import '../../save_user/network/local_save.dart';

class MoreVideosScreen extends StatefulWidget {
  TrainingClass training;

  MoreVideosScreen({Key? key, required this.training}) : super(key: key);

  @override
  State<MoreVideosScreen> createState() => _MoreVideosScreenState();
}

class _MoreVideosScreenState extends State<MoreVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: trainCubit..fetch(SaveId.getSaveData(key: token)))
      ],
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<TrainCubit, TrainState>(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.training.title,
                                    style: GoogleFonts.bebasNeue(
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kD9D9D9,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2.2,
                                  mainAxisSpacing: .02,
                                  childAspectRatio: 1.3,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                      widget.training.videos.length, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        onTap: () {
                                          trainCubit.currentTrains = trainCubit
                                              .trains!
                                              .indexOf(widget.training);
                                          trainCubit.currentVideo = index;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingLesson(
                                                          video: widget.training
                                                              .videos[index], particular: trainCubit.currentTrains,)));
                                        },
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Image.network(widget.training
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
                                                      widget.training
                                                          .videos[index].title,
                                                      style: k13_400_roboto,
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
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
