import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'goal_set_chatter_complete.dart';

class GoalSetChatter extends StatefulWidget {
  const GoalSetChatter({Key? key}) : super(key: key);

  @override
  State<GoalSetChatter> createState() => _GoalSetChatterState();
}

class _GoalSetChatterState extends State<GoalSetChatter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k47574C ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
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
                  GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Image.asset("assets/images/back.png")),

                ],
              ),
              InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>GoalSetChatterComplete()));},
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text("A s s i s t  w i t h  C h a t t e r",style: k25_400_bebas,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Image.asset("assets/images/location.png"),
                  SizedBox(width: 10,),
                  Text("McDowell Mountain Loop, Phoenix, AZ",style: k13_400_roboto,)
                ],
              ),
              SizedBox(height: 35,),
              Row(children: [
                Stack(children:[
                  Image.asset("assets/images/Ellipse 7.png"),
                Positioned(
                  left: 8,top: 5,
                    child: Text("1",style: k13_400_roboto,))
                ], ),
                SizedBox(width: 25,),
                Text("A d j u s t  F r o n t  S h o c k",style: k20_400_bebas,)
              ],),
              SizedBox(height: 17,),
              Padding(
                padding: const EdgeInsets.only(left: 57,right: 74),
                child: Text("Locate twist knob on front shock. Twist counter-clockwise until it stops.",style: k13_400_roboto,),
              ),
              SizedBox(height: 27,),
              Image.asset("assets/images/shock.png"),
              SizedBox(height: 33,),
              Padding(
                padding: const EdgeInsets.only(left: 57,right: 74),
                child: Text("Mount the bike and compress the shock three times. Have an assistant slide the o-ring to the bottom of the fork.",style: k13_400_roboto,),
              ),
              SizedBox(height: 33,),
              Image.asset("assets/images/Screenshock2.png"),
              SizedBox(height: 33,),
              Padding(
                padding: const EdgeInsets.only(left: 57,right: 74),
                child: Text("Dismount the bike. Ensure that the o-ring rises 20% of the length of the fork.",style: k13_400_roboto,),
              ),
              SizedBox(height: 33,),
              Image.asset("assets/images/Screenshock3.png"),
              SizedBox(height: 73,),
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
                    child: Text("CONTINUE TO REAR SHOCK",style: k11_800_roboto,),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right:47),
                    child: Image.asset("assets/images/Polygon 1.png"),
                  ),

                ],),
              ),
              SizedBox(height: 166,),
            ],
          ),
        ),
      ),
    );
  }
}
