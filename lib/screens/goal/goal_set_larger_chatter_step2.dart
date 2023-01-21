import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class GoalSetLargerChatterStep2 extends StatefulWidget {
  const GoalSetLargerChatterStep2({Key? key}) : super(key: key);

  @override
  State<GoalSetLargerChatterStep2> createState() => _GoalSetLargerChatterStep2State();
}

class _GoalSetLargerChatterStep2State extends State<GoalSetLargerChatterStep2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.k47574C,
        body: SingleChildScrollView(
            child: Column(
                children: [Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              Text("COMPAGNO", style: k25_400_noize,),
                              Spacer(),
                              Text("POWERED BY",style: k10_400_bebas,),
                              Image.asset('assets/images/METALLO.png'),


                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(children: [
                          Stack(children: [
                            Image.asset("assets/images/Ellipse 7.png"),
                            Positioned(
                                left: 8, top: 5,
                                child: Text("2", style: k13_400_roboto,))
                          ],),
                          SizedBox(width: 35,),
                          Text("A d j u s t  R e a r  S h o c k",
                            style: k20_400_bebas,)
                        ],),
                        SizedBox(height: 43,),
                        Padding(
                          padding: const EdgeInsets.only(left: 74, right: 71),
                          child: Text(
                            "Locate the head of the piston on your rear shock.",
                            style: k13_400_roboto,),
                        ),
                        SizedBox(height: 25,),
                        Image.asset("assets/images/shockrear.png"),
                        SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 74, right: 71),
                          child: Text(
                            "Rotate the piston head clockwise. This decreases the “bounce” or rebound speed of the shock.",
                            style: k13_400_roboto,),
                        ),
                        SizedBox(height: 25,),
                        Image.asset("assets/images/shock4.png"),
                        SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 74, right: 71),
                          child: Text(
                            "Mount the bike and push on the rear shock several times. If you feel it rebounds too slowly, adjust the knob counter-clockwise.",
                            style: k13_400_roboto,),
                        ),
                        SizedBox(height: 44,),
                        Container(
                          height: 70,
                          width: 325,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.kB69F4C
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset("assets/images/light.png"),
                              ),
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 19,top: 11),
                                  child: Text("What does this do? We’re allowing your\n front shock to loosen and absorb more\n energy from large chatter on the trail.",style: k13_400_roboto,),
                                )
                              ],)
                            ],
                          ),
                        ),
                        SizedBox(height: 65,),
                        Container(
                          height: 38,
                          width: 325,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: AppColors.k000000),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("SAVE THESE TUNING SETTINGS FOR THIS TRAIL",style: k11_800_roboto,),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left:10,right:10),
                              child: Image.asset("assets/images/Polygon 1.png"),
                            ),

                          ],),
                        ),
                        SizedBox(height: 166,),
                      ]
                  ),
                )
                ])));
  }
}