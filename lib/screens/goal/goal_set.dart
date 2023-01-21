import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../settings/setting_tuning.dart';
import 'goalset_larger_chatter.dart';

class GoalSet extends StatefulWidget {
  const GoalSet({Key? key}) : super(key: key);

  @override
  State<GoalSet> createState() => _GoalSetState();
}

class _GoalSetState extends State<GoalSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.k47574C,
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height:20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:26),
                  child: GestureDetector(
                      onTap: (){Navigator.pop(context);},
                      child: GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Image.asset("assets/images/back.png")),),
                ),

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26,top: 6),
                  child: Text("SUSPENSION TUNING",style: k32_400_bebas,),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 29),
                  child: Image.asset("assets/images/location.png"),

                ),
SizedBox(width: 10,),
                Text("McDowell Mountain Loop, Phoenix, AZ",style: k13_400_roboto,)
              ],
            ),
            SizedBox(height: 40,)
            ,Container(
              height: 350,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color:AppColors.k000000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23,bottom:19),
                      child: Text("Trail Summary",style: k20_400_bebas,),
                    ),
                    Row(
                      children: [
                       Padding(
                         padding: const EdgeInsets.only(bottom: 30),
                         child: Text("Chatter",style: k13_400_roboto,),
                       ),
                       SizedBox(width: 20,),
                       Column(children: [
                         SizedBox(height: 10,),
                         Stack(
                           children: [
                             Container(
                               height: 8.h,
                               width: 200.w,
                               decoration: BoxDecoration(
                                   color: Color(0xff47574C),
                                   borderRadius: BorderRadius.all(Radius.circular(12))),
                             ),
                             Container(
                               height: 8.h,
                               width: 175.w,
                               decoration: BoxDecoration(
                                   color: Color(0xff69806F),
                                   borderRadius: BorderRadius.all(Radius.circular(12))),
                             ),
                             Row(
                               children: [
                                 Container(
                                   height: 8.h,
                                   width: 119.w,
                                   decoration: BoxDecoration(
                                       color: Color(0xffEAE9E5),
                                       borderRadius: BorderRadius.all(Radius.circular(12))),
                                 ),
                               ],
                             )
                           ],
                         ),
                         SizedBox(height: 8,),
                         Row(

                           children: [
                          Text("60%\nSmall",style: k13_400_roboto,) ,
                           SizedBox(width: 40,),
                           Text("30%\nMedium",style: k13_400_roboto,),
                             SizedBox(width: 20,),
                           Text("10%\nLarge",style: k13_400_roboto,)
                         ],)
                       ],)
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text("Speed",style: k13_400_roboto,),
                        ),
                        SizedBox(width: 20,),
                        Column(children: [
                          SizedBox(height: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 8.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                    color: Color(0xff47574C),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                              ),

                              Row(
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 42.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xffEAE9E5),
                                        borderRadius: BorderRadius.all(Radius.circular(12))),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(

                            children: [
                              Text("8 mph\nSlowest",style: k13_400_roboto,) ,
                              SizedBox(width: 40,),
                              Text("16 mph\nAverage",style: k13_400_roboto,),
                              SizedBox(width: 20,),
                              Text("25 mph\nFastest",style: k13_400_roboto,)
                            ],)
                        ],)
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text("Incline",style: k13_400_roboto,),
                        ),
                        SizedBox(width: 20,),
                        Column(children: [
                          SizedBox(height: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 8.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                    color: Color(0xff47574C),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                              ),

                              Row(
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 175.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xff69806F),
                                        borderRadius: BorderRadius.all(Radius.circular(12))),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(

                            children: [
                              SizedBox(width: 80,),
                              Text("28°\nAverage",style: k13_400_roboto,),
                              SizedBox(width: 20,),
                              Text("49°\nSteepest",style: k13_400_roboto,)
                            ],)
                        ],)
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text("Time",style: k13_400_roboto,),
                        SizedBox(width: 20,),
                       Text("2:31:04",style: k16_800_roboto,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 56,),
            Padding(
              padding: const EdgeInsets.only(left:44,right: 51),
              child: Text("How would you like to tune your bike to improve your next ride on McDowell Mountain Loop?",style: k16_400_roboto,),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>GoalSetChatter()));},
              child: Container(
                width:325,
                height:54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:AppColors.k000000
                ),
                child:Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left:14),
                    child: Image.asset("assets/images/wavyline.png"),
                  ),
                  Spacer(),
                  Text("Assist with chatter",style: k18_400_bebas,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset("assets/images/iconsforword.png"),
                  ),
                ],),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              width:325,
              height:54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:AppColors.k000000
              ),
              child:Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left:14),
                  child: Image.asset("assets/images/curved.png"),
                ),
                Spacer(),
                Text("Faster turns",style: k18_400_bebas,),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset("assets/images/iconsforword.png"),
                ),

              ],),
            ),
            SizedBox(height: 50,),
            Container(
              width:325,
              height:54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:AppColors.k000000
              ),
              child:Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left:14),
                  child: Image.asset("assets/images/rightarrow.png",
                  height: 20,width: 30,),
                ),
                Spacer(),
                Text("Efficient pedaling",style: k18_400_bebas,),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset("assets/images/iconsforword.png"),
                ),

              ],),
            ),
            SizedBox(height: 50,),
            Container(
              width:325,
              height:54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:AppColors.k000000
              ),
              child:Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left:14),
                  child: Image.asset("assets/images/timer.png"),
                ),
                Spacer(),
                Text("Improve overall time",style: k18_400_bebas,),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset("assets/images/iconsforword.png"),
                ),

              ],),
            ),
            SizedBox(height: 61,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingTuning()));},
              child: Container(
                height:31,
                width: 325,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color:AppColors.k69806F),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text("How is my bike currently tuned?",style: k13_400_roboto,),
                  ),
                  SizedBox(width: 19,),
                  Image.asset('assets/images/Polygon 1.png')
                ],),
              ),
            ),
            SizedBox(height: 61,),
          ],
        ),
      ),
    );
  }
}
