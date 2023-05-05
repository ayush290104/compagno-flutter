import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'awardgallery.dart';

class Awards extends StatefulWidget {
  const Awards({Key? key}) : super(key: key);

  @override
  State<Awards> createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k47574C,
      body: SingleChildScrollView(
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
            SizedBox(height:20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:26),
                  child: GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Image.asset("assets/images/back.png")),
                ),

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26,top: 6),
                  child: Text("A w a r d s",style: k32_400_bebas,),
                ),
              ],
            ),
            SizedBox(height: 29,),
            Row(children: [
            SizedBox(width: 68,) ,

            Image.asset("assets/images/sparkling.png") ,
              SizedBox(width: 4,) ,
              Text("1st Training Session",style: k20_400_bebas,)
            ],),
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Image.asset("assets/images/ethereum-coin 2.png"),
            ),
            SizedBox(height: 29,),
            Text("You completed all lessons in your first",style: k13_400_roboto,),
            Text(" training session. Well done!",style: k13_400_roboto,),
            SizedBox(height: 29,),
            Container(
             height: 240,
              width: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.k000000
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Awards Progress",style: k20_400_bebas,),
                    SizedBox(height: 17,),
                    Row(children: [
                      Image.asset("assets/images/award.png"),
                      SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                        Stack(
                          children: [
                            Container(
                              height: 8.h,
                              width: 199.w,
                              decoration: const BoxDecoration(
                                  color: Color(0xff47574C),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8.h,
                                  width: 153.w,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff69806F),
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                              Text('1 Session Left',style: k11_700_roboto,)
                            ],),
                          ],
                        )
                      ],)
                    ],),
                    SizedBox(height: 7,),
                    Row(children: [
                      Text("5 Training Sessions",style: k11_700_roboto,)
                    ],),
                    SizedBox(height: 17,),
                    Row(children: [
                      Image.asset("assets/images/award.png"),
                      SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 8.h,
                                width: 199.w,
                                decoration: const BoxDecoration(
                                    color: Color(0xff47574C),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 153.w,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff69806F),
                                        borderRadius: BorderRadius.all(Radius.circular(12))),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text('2 Rides Left',style: k11_700_roboto,)
                                ],),
                            ],
                          )
                        ],)
                    ],),
                    SizedBox(height: 7,),
                    Row(children: [
                      Text("3 Tarils Rides",style: k11_700_roboto,)
                    ],),
                ],),
              ),
            ),
            SizedBox(height: 17,),
            Container(
              height: 203,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: AppColors.k000000),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                Padding(
                  padding: const EdgeInsets.only(top:17,left:25),
                  child: Row(
                    children: [
                      Text("Completed Awards",style: k20_400_bebas,),
                    ],
                  ),
                ),
                SizedBox(height: 26,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Image.asset('assets/images/award.png'),
                    Image.asset('assets/images/award.png'),
                    Image.asset('assets/images/Ellipse 5.png'),
                    Image.asset('assets/images/Ellipse 5.png'),
                ],),
                  SizedBox(height: 29,),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AwardGallery()));},
                    child: Container(
                      height: 35,
                      width: 279,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                          ,color: AppColors.k48574C),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text("SEE GALLAERY",style: k13_700_roboto,),
                          SizedBox(width: 10,),
                          Image.asset("assets/images/Polygon 1.png")
                        ],
                      ),
                    ),
                  ),

              ],),
            ),
            SizedBox(height: 17,),
            Container(
              height: 167,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: AppColors.k000000),
              child: Padding(
                padding: const EdgeInsets.only(top: 22,left: 23),
                child: Column(
                  children: [
                  Row(
                    children: [
                      Text("LIFETIME",style:k20_400_bebas),
                    ],
                  ),
                    SizedBox(height: 9,),
                    Row(children: [
                      SizedBox(width: 10,),
                      Image.asset('assets/images/1.png'),
                      SizedBox(width: 22,),
                      Text("Rides completed",style: k13_400_roboto,)
                    ],),
                    SizedBox(height: 17,),
                    Row(children: [
                      Image.asset('assets/images/4.png'),
                      SizedBox(width: 22,),
                      Text("Training sessions",style: k13_400_roboto,)
                    ],),
                    SizedBox(height: 17,),
                    ],),
              ),
            ),
            SizedBox(height: 17,),
            Container(
                height: 167,
                width: 325,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000),
                child:Padding(
                  padding: const EdgeInsets.only(top: 22,left: 23),child: Column(children: [
                  Row(
                    children: [
                      Text("Compagno Rewards",style:k20_400_bebas),
                    ],
                  ),
                  Row(children: [
                    Image.asset("assets/images/gift-box.png"),
                    SizedBox(width: 22,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 30,),
                        Stack(
                          children: [
                            Container(
                              height: 8.h,
                              width: 199.w,
                              decoration: const BoxDecoration(
                                  color: Color(0xffB69F4C),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8.h,
                                  width: 10.w,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text('99 Rides left',style: k11_700_roboto,)
                              ],),
                          ],
                        ),
                      ],
                    )
                  ],),
                  SizedBox(height: 16,),
                  Row(children: [
                    Text("Free t-shirt on your 100th ride",style: k13_400_roboto,)
                  ],)
                ],),
                )
            ),
            SizedBox(height: 122,),
          ],
        ),
      ),
    );
  }
}
