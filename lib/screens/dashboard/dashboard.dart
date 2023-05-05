import 'package:compagno4/screens/dashboard/dashboard_map.dart';
import 'package:compagno4/screens/dashboard/trail_chatter.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

import '../goal/goal_set.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: AppColors.kB69F4C,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),

  ];
  void getRequest() async{
    var url = Uri.parse("https://compagno.app/api/users/dashboard");
    var response = await http.get(url);
    print(response.body.toString());


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k47574C,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 71,left: 26),
              child: Row(
                children: [
                  Text("COMPAGNO",style: k25_400_noize,),
                  Spacer(),
                  Text("POWERED BY",style: k10_400_bebas,),
                  Image.asset('assets/images/METALLO.png'),

                ],
              ),
            ),
            SizedBox(height: 35,),
            Text("WELCOME, DAVID",style: k28_400_noize,),
            SizedBox(height: 5,),
            Text("Let’s amplify your ride experience.",style: k13_400_roboto,),
            SizedBox(height: 14,),
            Container(
              height:100,
              width: 100,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/images/user.png"),
            ),
            SizedBox(height: 39,),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Row(
                children: [
                  Text("YOUR LAST RIDE",style: k20_400_bebas,),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:9,left: 26),
              child: Row(
                children: [
                  Image.asset("assets/images/location.png"),
                  SizedBox(width: 8,),
                  Text("McDowell Mountain Loop, Phoenix, AZ",style: k13_400_roboto,),
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardMap()));},
                    child: Container(
                      width: 57,
                      height: 20,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color:AppColors.k000000),
                      child: Row(children: [
                        SizedBox(width: 10,),
                        Text("MAP",style: k10_700_roboto,),
                        SizedBox(width: 5,),
                        Image.asset("assets/images/Polygon 1.png")
                      ],),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 33,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TrailChatter()));},
                child: Container(
    width: 155,
    height: 158,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("Trail Chatter",style: k16_400_bebas,),
                          ),
                          SizedBox(width: 20,),
                          Image.asset("assets/images/iconsforword.png")
                        ],),
                      ),
                      LineGraph(
                        features: features,
                        size: Size(120, 100),
                        labelX: ['', '', '', '', ''],
                        labelY: ['~', '', '', '', '~'],
                        //showDescription: true,
                        graphColor: Colors.white,
                        graphOpacity: 0.2,
                        verticalFeatureDirection: true,
                       // descriptionHeight: 100,
                      ),
                    ],
                  ),
                ),
              ),
                Container(
                  width: 155,
                  height: 158,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("Speed",style: k16_400_bebas,),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset("assets/images/iconsforword.png"),
                          )
                        ],),
                      ),
                      LineGraph(
                        features: features,
                        size: Size(135, 100),
                        labelX: ['', '', '', '', ''],
                        labelY: ['4mph', '', '', '', '26mph'],
                        //showDescription: true,
                        graphColor: Colors.white,
                        graphOpacity: 0.2,
                        verticalFeatureDirection: true,
                        // descriptionHeight: 100,
                      ),
                    ],
                  ),
                ),
            ],),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 155,
                  height: 158,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("TURN INCLIne",style: k16_400_bebas,),
                          ),
                          SizedBox(width: 20,),
                          Image.asset("assets/images/iconsforword.png")
                        ],),
                      ),
                      PrettyGauge(
                        gaugeSize: 100,
                        segments: [
                          GaugeSegment('Low', 20, Colors.red),
                          GaugeSegment('Medium', 40, Colors.orange),
                          GaugeSegment('High', 40, Colors.green),
                        ],
                        currentValue: 60,
                        needleColor: Colors.white,
                        displayWidget: const Text('',
                            style: TextStyle(fontSize: 12)),
                        startMarkerStyle:TextStyle(fontSize: 10, color: Colors.grey),
                        endMarkerStyle:TextStyle(fontSize: 10, color: Colors.grey),
                      ),

                    ],
                  ),
                ),
                Container(
                  width: 155,
                  height: 158,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("Total time",style: k16_400_bebas,),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset("assets/images/iconsforword.png"),
                          )
                        ],),
                      ),
                      SizedBox(height: 30,),
                      Text("2:31:04",style: k30_400_bebas,),

                    ],
                  ),
                ),
              ],),
            SizedBox(height: 50,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Text("Tuning",style: k20_400_bebas,),
                ),
              ],
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>GoalSet()));},
              child: Container(
                height: 54,
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
                        child: Text("Want to improve how you rode this trail?\n Let’s tune your bike.",style: k13_400_roboto,),
                      )
                    ],)
                  ],
                ),
              ),
            ),
            SizedBox(height: 52,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardMap()));},
              child: Padding(
                padding: const EdgeInsets.only(left: 34),
                child: Row(
                  children: [
                    Text("YOUR ROUTE",style: k20_400_bebas,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 13,),
            Image.asset("assets/images/mapimage.png"),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Row(children: [
                Text("PREVIOUS rIDES",style: k20_400_bebas,)
              ],),
            ),
            SizedBox(height: 16,),
            Container(height: 37,
            width: 325,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k39453C),
            child:  Row(
              children: [
                SizedBox(width: 10,),
                Image.asset("assets/images/location.png"),
                SizedBox(width: 10,),
                Text("Tom’s Thumb Trail, Phoenix, AZ",style: k13_400_roboto,),
                Spacer(),
                Image.asset("assets/images/iconplus.png"),
                SizedBox(width: 10,),

              ],
            ),),
            SizedBox(height: 10,),
            Container(height: 37,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k39453C),
              child:  Row(
                children: [
                  SizedBox(width: 10,),
                  Image.asset("assets/images/location.png"),
                  SizedBox(width: 10,),
                  Text("Pinnacle Peak Trail, Phoenix, AZ",style: k13_400_roboto,),
                  Spacer(),
                  Image.asset("assets/images/iconplus.png"),
                  SizedBox(width: 10,),

                ],
              ),),
            SizedBox(height: 10,),
            Container(height: 37,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k39453C),
              child:  Row(
                children: [
                  SizedBox(width: 10,),
                  Image.asset("assets/images/location.png"),
                  SizedBox(width: 10,),
                  Text("Inspiration Point Trail, Phoenix, AZ",style: k13_400_roboto,),
                  Spacer(),
                  Image.asset("assets/images/iconplus.png"),
                  SizedBox(width: 10,),

                ],
              ),),
            SizedBox(height: 10,),
            Container(
              height: 30,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                  ,color: Colors.black),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Text("MORE",style: k13_700_roboto,),
                  SizedBox(width: 10,),
                  Image.asset("assets/images/Polygon 1.png")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

