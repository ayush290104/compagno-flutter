import 'package:compagno4/constant/color.dart';
import 'package:compagno4/screens/loadingscreen/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/fonts.dart';

class BackGround extends StatefulWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  State<BackGround> createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
       height: 113,
       color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Column(children: [
            SizedBox(height: 19,),
            Image.asset('assets/images/bicycle.png'),
            SizedBox(height: 5,),
            Text("Dashboard",style: k13_400_roboto,),
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.kFFFFFF),
            )
          ],),
            Column(children: [
              SizedBox(height: 19,),
              Image.asset('assets/images/play.png'),
              SizedBox(height: 5,),
              Text("Map Ride",style: k13_400_roboto,),
              /*Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.kFFFFFF),
              )*/
            ],),
            Column(children: [
              SizedBox(height: 19,),
              Image.asset('assets/images/barbell.png'),
              SizedBox(height: 5,),
              Text("Training",style: k13_400_roboto,),
              /*Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.kFFFFFF),
              )*/
            ],),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));
              },
              child: Column(children: [
                SizedBox(height: 19,),
                Image.asset('assets/images/slider.png'),
                SizedBox(height: 5,),
                Text("Settings",style: k13_400_roboto,),
                /*Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.kFFFFFF),
                )*/
              ],),
            ),


        ],),
      ),
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
        )
      ],
    ),
    );
  }
}
