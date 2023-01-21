import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class SettingTuning extends StatefulWidget {
  const SettingTuning({Key? key}) : super(key: key);

  @override
  State<SettingTuning> createState() => _SettingTuningState();
}

class _SettingTuningState extends State<SettingTuning> {

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
                  child: Image.asset("assets/images/back.png")),),


              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26,top: 6),
                  child: Text("Current Tuning",style: k32_400_bebas,),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right:39,left: 26),
                child: Text("Input your current tuning settings for this bike so\n we can recommend changes based on the trails\n you ride.",style:k13_400_roboto,),
              )
            ],),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Row(children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle,),
                  child:Image.asset("assets/images/bikeimg.png")
                ),
                SizedBox(width: 17,),
                Column(children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Monte',style: k13_800_roboto),
                        TextSpan(
                          text: '\nMETALLO M150 STR 2022',
                          style: k13_400_roboto,
                        ),

                      ],
                    ),
                  ),

                ],)
              ],),
            ),
            SizedBox(height: 34,),
            Container(
              height: 187,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
              child: Padding(
                padding: const EdgeInsets.only(top: 14,left: 20,right: 9),
                child: Column(children: [
                  Row(children: [
                    Text("Rider Level",style: k20_400_bebas,),
                    Spacer(),
                    Image.asset("assets/images/edit2.png")
                  ],),
    SizedBox(height: 10,),
    Row(children: [
    Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text("81",style: k13_400_roboto,),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text("30%",style: k13_400_roboto,),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text("???",style: k13_400_roboto,),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text("???",style: k13_400_roboto,),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text("???",style: k13_400_roboto,),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text("???",style: k13_400_roboto,),
          )
          ],
           ),
        SizedBox(width: 22,),
        Container(
          height: 112,
          width: 1,
          color: Colors.white,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text("PSI",style: k13_400_roboto,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text("Sag %",style: k13_400_roboto,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text("Compression, HSC",style: k13_400_roboto,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text("Compression, LSC",style: k13_400_roboto,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text("Rebound, HSR",style: k13_400_roboto,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text("Rebound, LSR",style: k13_400_roboto,),
            )
          ],
        ),
        ],
    )


            ],)

        ),
    ),
            SizedBox(height: 21,),
            Container(
              height: 187,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
              child: Padding(
                  padding: const EdgeInsets.only(top: 14,left: 20,right: 9),
                  child: Column(children: [
                    Row(children: [
                      Text("REAR Shock",style: k20_400_bebas,),
                      Spacer(),
                      Image.asset("assets/images/edit2.png")
                    ],),
                    SizedBox(height: 10,),
                    Row(children: [
                      Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text("165",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text("27%",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text("???",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text("???",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text("???",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text("???",style: k13_400_roboto,),
                          )
                        ],
                      ),
                      SizedBox(width: 22,),
                      Container(
                        height: 112,
                        width: 1,
                        color: Colors.white,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text("PSI",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text("Sag %",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text("Compression, HSC",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text("Compression, LSC",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text("Rebound, HSR",style: k13_400_roboto,),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text("Rebound, LSR",style: k13_400_roboto,),
                          )
                        ],
                      ),
                    ],
                    )


                  ],)

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 187,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
              child:Padding(
                padding: const EdgeInsets.only(top: 14,left: 20,right: 9),
                child: Column(children: [
                Row(children: [
                  Text("Tire Pressure",style: k20_400_bebas,),
                  Spacer(),
                  Image.asset("assets/images/edit2.png")
                ],),
              ],),
            ))
          ]),
      ));
  }
}
