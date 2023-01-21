import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class LessonCompleted extends StatefulWidget {
  const LessonCompleted({Key? key}) : super(key: key);

  @override
  State<LessonCompleted> createState() => _LessonCompletedState();
}

class _LessonCompletedState extends State<LessonCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.k47574C,
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 30,left: 26),
            child: Row(
              children: [
                Text("COMPAGNO",style: k25_400_noize,),
                Spacer(),
                Text("POWERED BY",style: k10_400_bebas,),
                Image.asset('assets/images/METALLO.png'),
                SizedBox(width: 20,)
              ],
            ),
          ),
          SizedBox(height: 121,),
          Image.asset("assets/images/ok.png"),
          Text("L E S S O N  1  C O M P L E T E D",style: k20_400_bebas_B69F4C,),
          SizedBox(height: 20,),
          Text("Great work! Ready to move on?",style: k13_400_roboto,),
          SizedBox(height: 50,),
          Padding(
    padding: const EdgeInsets.only(left: 62,bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("Balance on Uneven Ground",style: k13_400_roboto,),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: 8.h,
                      width: 266.w,
                      decoration: BoxDecoration(
                          color: Color(0xff39453C),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 8.h,
                          width: 91.w,
                          decoration: BoxDecoration(
                              color: Color(0xff69806F),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 9,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: 3,
                      height: 20,
                      color: AppColors.kFFFFFF,
                    ),
                    Container(
                      width: 3,
                      height: 20,
                      color: AppColors.kFFFFFF,
                    ),
                    Container(
                      width: 3,
                      height: 20,
                      color: AppColors.kFFFFFF,
                    ),
                    Container(
                      width: 3,
                      height: 20,
                      color: AppColors.kFFFFFF,
                    ),
                    Container(
                      width: 3,
                      height: 20,
                      color: Colors.transparent,
                    ),

                  ],
                ),
                SizedBox(height: 9,),
                Row(
                  children: [
                    Text("LESSON PROGRESS",style: k11_700_roboto,),
                  ],
                ),
                SizedBox(height: 68,),

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 141,
                width: 132,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000
                ),
                child: Column(children: [
                  SizedBox(height: 20,),
                  Image.asset('assets/images/leftarrow.png'),
                  SizedBox(height: 20,),
                  Text("Return to Training",style: k13_400_roboto,)
                ],),
              ),
              Container(
                height: 141,
                width: 132,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k39453C
                ),
                child: Column(children: [
                  SizedBox(height: 20,),
                  Image.asset('assets/images/rightarrow.png'),
                  SizedBox(height: 20,),
                  Text("Continue to",style: k13_400_roboto,),
                  Text("Lesson 2",style: k13_400_roboto,)
                ],),
              ),
            ],
          )
        ],
      ),
    );
  }
}

