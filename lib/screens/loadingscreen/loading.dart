import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/fonts.dart';
import '../splashScreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

        children: [
          Image.asset('assets/images/Background.png',
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
              top: 608,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("COMPAGNO",style: k45_400_noize,),
              )),
               SizedBox(height: 5,),
      Positioned(
        top: 665,left:171,child:Row(
                children: [
                  Text("POWERED BY",style: k10_400_bebas,),
                  Image.asset("assets/images/METALLO.png",
                  width: 123,height: 35,)
                ],
              )
      ),
      Positioned(
        top: 728,left: 171,
          child: Image.asset("assets/images/Loading icon.png")) ],

      ),
    );
  }
}
