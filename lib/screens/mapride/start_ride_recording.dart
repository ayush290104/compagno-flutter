import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:compagno4/post_value_provider.dart';
import 'package:compagno4/screens/mapride/ride_complete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
// Import Sparkline

class StartRiding extends StatefulWidget {
   StartRiding({Key? key}) : super(key: key);


  @override
  _StartRidingState createState() => _StartRidingState();
}

class _StartRidingState extends State<StartRiding> {
  PostValueProvider postValueProvider = Get.find();
  List<double> ab = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
       postValueProvider.cancel();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 26),
              child: Row(
                children: [
                  Text(
                    "COMPAGNO",
                    style: k25_400_noize,
                  ),
                  Spacer(),
                  Text("POWERED BY", style: k10_400_bebas),
                  Image.asset('assets/images/METALLO.png'),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Recording RIDE ...",
              style: k32_400_bebas,
            ),
            SizedBox(
              height: 78,
            ),
            Container(

              width: Get.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.k000000,
              ),
              child: Column(
                children: [

                      SizedBox(
                        height: 10,
                      ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0),
                          child: Text("Trail Chatter",style: TextStyle(color: Colors.white),),
                        ),

                        Obx(() =>Spark()),
                      ],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 38.0),
                        child: Text("Acceleration",style: TextStyle(color: Colors.white),),
                      ),

                      Obx(() =>Spark2()),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 38.0),
                        child: Text("Incline Angle",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),

                      Obx(() =>Spark3()),
                    ],
                  ),



                ],
              ),
            ),
            SizedBox(
              height: 98,
            ),
            InkWell(
              onTap: () {
                postValueProvider.completeRide();
                postValueProvider.cancel();

                Navigator.pop(context);
                
                Get.to(RideComplete());
              },
              child: Stack(
                children: [
                  Image.asset('assets/images/Ellipse22.png'),
                  Positioned(
                    top: 25,
                    left: 30,
                    child: Container(
                      width: 5,
                      height: 45,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 60,
                    child: Container(
                      width: 5,
                      height: 45,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 64,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  "TAP TO STOP",
                  style: k13_700_roboto,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget Spark(){


 if(postValueProvider.trailChatterList.length<500){
   // List<double> ab = [];
   // for(int i = postValueProvider.trailChatterList.length -11;i<postValueProvider.trailChatterList.length;i++){
   //   ab.add(postValueProvider.trailChatterList[i]);
   // }
   return Padding(
     padding: const EdgeInsets.only(right: 10.0),
     child: Container(
       width: Get.width*0.5,
       height: 20,
       child: Sparkline(
         data: postValueProvider.trailvalue,
         lineColor: Colors.blue, // Customize line color
         fillMode: FillMode.none, // Fill area below the line

       ),
     ),
   )
   ;
 }
 else{
   return Padding(
     padding: const EdgeInsets.only(right: 10.0),
     child: Container(
       width: Get.width*0.5,
       height: 20,
       child: Sparkline(
         data: postValueProvider.trailvalue,
         lineColor: Colors.blue, // Customize line color
         fillMode: FillMode.none, // Fill area below the line

       ),
     ),
   )
   ;
 }

  }
  Widget Spark2(){


    if(postValueProvider.trailChatterList.length<500){
      // List<double> ab = [];
      // for(int i = postValueProvider.trailChatterList.length -11;i<postValueProvider.trailChatterList.length;i++){
      //   ab.add(postValueProvider.trailChatterList[i]);
      // }
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: Get.width*0.5,
          height: 30,
          child: Sparkline(
            data: postValueProvider.accelerationvalue,
            lineColor: Colors.blue, // Customize line color
            fillMode: FillMode.none, // Fill area below the line

          ),
        ),
      )
      ;
    }
    else{
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(

          width: Get.width*0.5,
          height: 30,
          child: Sparkline(
            data: postValueProvider.accelerationvalue,
            lineColor: Colors.blue, // Customize line color
            fillMode: FillMode.none, // Fill area below the line

          ),
        ),
      )
      ;
    }

  }
  Widget Spark3() {
    return  Container(
  width: 120,
  height: 120,
  child: SfRadialGauge(
  axes: <RadialAxis>[
  RadialAxis(
  minimum: -90,
  maximum: 91,
  startAngle: 180,
  endAngle: 0,
  radiusFactor: 1,
  showLabels: true,
  interval: 45,
  onLabelCreated: (args) {
  // Custom label formatter to display only positive values
  args.text = '${double.parse(args.text).abs().toInt()}';
  args.labelStyle = const GaugeTextStyle(
  color: Colors.white, fontSize: 10);
  },
  ranges: <GaugeRange>[
  GaugeRange(
  startValue: -90,
  endValue: -45,
  color: Colors.red,

  ),
  GaugeRange(
  startValue: -45,
  endValue: 45,
  color: Colors.green,
  ),
  GaugeRange(
  startValue: 45,
  endValue: 90,
  color: Colors.red,
  ),
  ],
  pointers: <GaugePointer>[
  MarkerPointer(
  value: postValueProvider.inclinevalue.value*-1,
  color: Colors.white,
  enableAnimation: true,
  ),
  ],
  ),
  ],
  ),
  );
}

}
