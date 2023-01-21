import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class DashboardMap extends StatefulWidget {
  const DashboardMap({Key? key}) : super(key: key);

  @override
  State<DashboardMap> createState() => _DashboardMapState();
}

class _DashboardMapState extends State<DashboardMap> {
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: AppColors.k69806F,
      data: [0, 0.8, 0.4, 0.7, 0.6],
    ),

  ];
  final List<Feature> features1 = [
    Feature(
      title: "Drink Water",
      color: AppColors.k69806F,
      data: [0.8, 0.7, 0.4, 0.7, 0.6,0.9,0.7],
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k47574C,
      body: SingleChildScrollView(
        child: Column(children: [
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
                 onTap: (){Navigator.pop(context);},   child: GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Image.asset("assets/images/back.png")),),
              ),

            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26,top: 6),
                child: Text("YOUR ROUTE",style: k32_400_bebas,),
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
          SizedBox(height: 27,),
           Image.asset("assets/images/AllTrails.png"),
          SizedBox(height: 34,),
          Container(height: 287,
            width: 325,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 21),
                child: Row(
                  children: [
                    Text("Elevation",style: k16_400_bebas,),
                  ],
                ),
              ),
              LineGraph(
                features: features,
                size: Size(175, 244),
                labelX: ['0', '2', '4', '6','8'],
                labelY: ['1548ft', '', '', '1781ft',],
                //showDescription: true,
                graphColor: Colors.white,
                graphOpacity: 0.2,
                verticalFeatureDirection: true,
                // descriptionHeight: 100,
              ),
            ],),),
          SizedBox(height: 25,),
          Container(height: 287,
            width: 325,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 21),
                child: Row(
                  children: [
                    Text("Chatter size",style: k16_400_bebas,),
                  ],
                ),
              ),
              LineGraph(
                features: features1,
                size: Size(175, 244),
                labelX: ['0', '2', '4', '6','8'],
                labelY: ['small', 'medium', 'large',],
                //showDescription: true,
                graphColor: Colors.white,
                //graphOpacity: 0.4,
                verticalFeatureDirection: true,
                // descriptionHeight: 100,
              ),
            ],),),
        ],),
      ),
    );
  }
}

