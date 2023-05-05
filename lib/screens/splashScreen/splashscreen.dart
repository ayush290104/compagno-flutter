import 'dart:async';

import 'package:compagno4/screens/login/login.dart';
import 'package:compagno4/screens/register/register.dart';
import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushNamed(context, login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(

            children: [
              Image.asset('assets/images/splash1.png',
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26,top:61,),
                child: Row(
                  children: [
                    Text("COMPAGNO",style: k25_400_noize,),
                    Spacer(),
                    Text("POWERED BY",style: k10_400_bebas,),
                    Image.asset('assets/images/METALLO.png'),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 150,left: 26),
                child: Text("WELCOME \nBACK, DAVID.",style: k36_400_noize,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 241,left: 26),
                child: Text("LET’S RIDE.",style: k32_400_bebas,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 406,left: 26),
                child: Text("YOUR LAST RIDE",style: k16_400_bebas,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 431,left: 26),
                child: Row(
                  children: [
                    Image.asset("assets/images/location.png"),
                    SizedBox(width: 10,),
                    Text("McDowell Mountain Loop, Phoenix, AZ",style: k13_400_roboto,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 484,left: 26),
                child: Text("Current tuning settings",style: k16_400_bebas,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 512,left: 26),
                child: Text("Assist with Chatter",style: k13_400_roboto,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 560,left: 26),
                child: Text("Next Award",style: k16_400_bebas,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 588,left: 26),
                child: Text("5 Training Sessions Complete",style: k13_400_roboto,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 622,left: 26),
                child: Stack(
                  children: [
                    Container(
                      height: 8.h,
                      width: 317.w,
                      decoration: BoxDecoration(
                          color: Color(0xff979797),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 8.h,
                          width: 242.w,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:773,left:26),
                child: Container(
                  height: 30,
                  width: 325,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                      ,color: Colors.black),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("COUNTINUE",style: k13_700_roboto,),
                      SizedBox(width: 10,),
                      Image.asset("assets/images/Polygon 1.png")
                    ],
                  ),
                ),
              ),
            ])
    );
  }
}
