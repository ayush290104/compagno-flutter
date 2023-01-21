import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'goal_set_larger_chatter_step2.dart';

class GoalSetChatterComplete extends StatefulWidget {
  const GoalSetChatterComplete({Key? key}) : super(key: key);

  @override
  State<GoalSetChatterComplete> createState() => _GoalSetChatterCompleteState();
}

class _GoalSetChatterCompleteState extends State<GoalSetChatterComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.k47574C ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GoalSetLargerChatterStep2()));
                },
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

            ],
      ),
    ),
            SizedBox(height: 53,),
            Image.asset('assets/images/ok.png'),
            Text("TUNING SETTINGS SAVED!",style: k20_400_bebas_B69F4C,),
            SizedBox(height: 53,),
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
                      child: Text("The next time you ride this trail, you’ll\n know how to tune your bike to\n achieve this goal.",style: k13_400_roboto,),
                    )
                  ],)
                ],
              ),
            ),
            SizedBox(height: 59,),
            Padding(
              padding: const EdgeInsets.only(left: 86,right: 69,bottom: 20),
              child: Text("We updated your current bike tuning configuration under Settings.",style: k13_400_roboto,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 86,right: 69),
              child: Text(" Bike tuning tips can be revisited on the Dashboard.",style: k13_400_roboto,),
            ),
            SizedBox(height: 75,),
            Container(
              height: 38,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: AppColors.k000000),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("RETURN TO DASHBOARD",style: k11_700_roboto,),
                ),
                SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.only(right:47),
                  child: Image.asset("assets/images/Polygon 1.png"),
                ),

              ],),
            ),
            SizedBox(height: 166,),
          ],
        )));
  }
}
