import 'package:compagno4/screens/taining/taininglesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../awards/awards.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k47574C,
      body:

      SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(

                children: [
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text("T R A I N I N G",style: k32_400_bebas,),
                    ],
                  ),
                  SizedBox(height: 27,),
                  Row(
                    children: [
                      Text("BIKE SKILLS",style: k20_400_bebas,),
                    ],
                  ),
    GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 2.2,
    //mainAxisSpacing: .02,
          childAspectRatio: 1.3,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: List.generate(4, (index) {
    return InkWell( onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainingLesson()));},
      child: Column(children: [
      Stack(
      children: [
      Image.asset('assets/images/brunst.png'),
      Positioned(
          top:29,left:57,
            child: Image.asset("assets/images/play96.png")),
      Positioned(
          left: 10,
          bottom:10,
            child: Text("Balance on uneven\n ground",style: k13_400_roboto,))
      ],
      )
      ],),
    );

    })),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Awards()));},
                  child: Container(
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
                ),
                  SizedBox(height: 45,),
                  Row(
                    children: [
                      Text("Strength Training",style: k20_400_bebas,),
                    ],
                  ),
                  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.5,
                      //mainAxisSpacing: .02,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(4, (index) {
                        return Column(children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/ax.png'),
                              Positioned(
                                  top:29,left:57,
                                  child: Image.asset("assets/images/play96.png")),
                              Positioned(
                                  left: 10,
                                  bottom:10,
                                  child: Text("Balance on uneven\n ground",style: k13_400_roboto,))
                            ],
                          )
                        ],);

                      })),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 45,),
                  Row(
                    children: [
                      Text("RACE PREPARATION",style: k20_400_bebas,),
                    ],
                  ),
                  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.5,
                      //mainAxisSpacing: .02,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(4, (index) {
                        return Column(children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/ax.png'),
                              Positioned(
                                  top:29,left:57,
                                  child: Image.asset("assets/images/play96.png")),
                              Positioned(
                                  left: 10,
                                  bottom:10,
                                  child: Text("Balance on uneven\n ground",style: k13_400_roboto,))
                            ],
                          )
                        ],);

                      })),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 45,),
                  Row(
                    children: [
                      Text("Nutrition",style: k20_400_bebas,),
                    ],
                  ),
                  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.5,
                      //mainAxisSpacing: .02,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(4, (index) {
                        return Column(children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/nurti.png'),
                              Positioned(
                                  top:29,left:57,
                                  child: Image.asset("assets/images/play96.png")),
                              Positioned(
                                  left: 10,
                                  bottom:10,
                                  child: Text("Balance on uneven\n ground",style: k13_400_roboto,))
                            ],
                          )
                        ],);

                      })),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 45,),
                  Row(
                    children: [
                      Text("BIKE MAINTENANCE",style: k20_400_bebas,),
                    ],
                  ),
                  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.5,
                      //mainAxisSpacing: .02,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(4, (index) {
                        return Column(children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/maintance.png'),
                              Positioned(
                                  top:29,left:57,
                                  child: Image.asset("assets/images/play96.png")),
                              Positioned(
                                  left: 10,
                                  bottom:10,
                                  child: Text("Balance on uneven\n ground",style: k13_400_roboto,))
                            ],
                          )
                        ],);

                      })),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 45,),
                  Row(
                    children: [
                      Text("A W A R D S",style: k20_400_bebas,),
                    ],
                  ),
                  Container(
                    height: 73,
                    width: 360,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                        ,color: Colors.black),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15),
                        child: Image.asset("assets/images/award.png"),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox(height: 17,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:130,
                                child: Text("5 Training Sessions",style:k13_400_roboto)),
                            Text("VIEW PROGRESS",style:k11_400_roboto),
                            Image.asset("assets/images/Polygon 1.png")
                          ],
                        ),
                        SizedBox(height: 10,),
                        Stack(
                          children: [
                            Container(
                              height: 8.h,
                              width: 218.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff47574C),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8.h,
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xff69806F),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],)
                    ],),
                  ),
                  SizedBox(height: 45,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

