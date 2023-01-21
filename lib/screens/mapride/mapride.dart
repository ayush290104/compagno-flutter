import 'package:compagno4/screens/goal/goal_set.dart';
import 'package:compagno4/screens/mapride/ride_complete.dart';
import 'package:compagno4/screens/mapride/start_ride_recording.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class MapRide extends StatefulWidget {
  const MapRide({Key? key}) : super(key: key);

  @override
  State<MapRide> createState() => _MapRideState();
}

class _MapRideState extends State<MapRide> {
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
          SizedBox(height: 32,),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RideComplete()));},
              child: Text("C a l i b r a t e  A p p",style: k32_400_bebas,)),
          SizedBox(height: 8,),
          Text("Secure your phone on your bike.",style: k13_400_roboto,),
          SizedBox(height: 66,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 44),
                child: Image.asset("assets/images/phone.png"),
              ),
            ],
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 94),
              child: Image.asset('assets/images/curved.png'),
            )
          ],),
          Image.asset("assets/images/bike.png"),
          SizedBox(height: 64,),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>StartRiding()));},
            child: Stack(children: [
              Image.asset("assets/images/Ellipse 2.png"),
              Positioned(
                top: 23,left: 28,
                  child: Image.asset("assets/images/play.png"))
            ],),
          ),
          Container(
              height: 64,
              color: Colors.transparent,
              child: Center(child: Text("TAP WHEN READY TO RIDE",style: k13_700_roboto,)))
        ],
      ),
    );
  }
}
