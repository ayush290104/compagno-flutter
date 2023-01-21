import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class AwardGallery extends StatefulWidget {
  const AwardGallery({Key? key}) : super(key: key);

  @override
  State<AwardGallery> createState() => _AwardGalleryState();
}

class _AwardGalleryState extends State<AwardGallery> {
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
                SizedBox(width: 20,),

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
          Row(children: [Padding(
    padding: const EdgeInsets.only(left:26),
    child:
            Text("A w a r d s  G A L L E R Y",style: k32_400_bebas,)
          )],),
          SizedBox(height: 11,),
          Row(children: [Padding(
              padding: const EdgeInsets.only(left:26),
              child:
              Text("Click on an award to expand.",style: k13_400_roboto,)
          )],),
          SizedBox(height: 40,),
          Container(
            height: 473,
            width: 325,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                ,color: AppColors.k000000),
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/award.png'),
                      SizedBox(height: 11,),
                      Text("1st Training ",style: k13_400_roboto,),
                      Text("Session",style: k13_400_roboto,)
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/award.png'),
                      SizedBox(height: 11,),
                      Text("1st Trail Ride",style: k13_400_roboto,),
                    ],
                  ),
                  Image.asset('assets/images/Ellipse 5.png'),

                ],),
              ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                    ],),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                    ],),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                    ],),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                      Image.asset('assets/images/Ellipse 5.png'),
                    ],),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

