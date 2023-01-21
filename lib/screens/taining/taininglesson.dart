import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'lesson_completed.dart';

class TrainingLesson extends StatefulWidget {
  const TrainingLesson({Key? key}) : super(key: key);

  @override
  State<TrainingLesson> createState() => _TrainingLessonState();
}

class _TrainingLessonState extends State<TrainingLesson> {
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
          SizedBox(height: 6,),
          Padding(
            padding: const EdgeInsets.only(left: 26,top: 6),
            child: Row(
              children: [
                Text("balance on uneven ground",style: k26_400_bebas,),
              ],
            ),
          ),
          SizedBox(height: 36,),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LessonCompleted()));},
            child: Container(
              width: 325,
              height: 31,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: AppColors.k000000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("+1 Training Point",style: k13_700_roboto,),
                    Image.asset("assets/images/award.png",width: 15,height: 17,)
                ],),
              ),
            ),
          ),
          SizedBox(height: 45,),
          Padding(
            padding: const EdgeInsets.only(left: 37),
            child: Row(
              children: [
                Text("You’ll gain skills on",style: k20_400_bebas,),
              ],
            ),
          ),
          SizedBox(height: 21,),
          Padding(
            padding: const EdgeInsets.only(left: 51,bottom: 21),
            child: Row(
              children: [
                Text("Engaging core during uphill pedaling",style: k13_400_roboto,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 51,bottom: 21),
            child: Row(
              children: [
                Text("Correcting steering in sudden slipping",style: k13_400_roboto,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 51,bottom: 21),
            child: Row(
              children: [
                Text("Tuning rear shock for added grip",style: k13_400_roboto,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 51,bottom: 21),
            child: Row(
              children: [
                Text("Adjusting tire pressure to absorb chatter",style: k13_400_roboto,),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Container(
            height: 54,
            width: 325,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color:AppColors.kB69F4C),
            child: Row(children: [
              SizedBox(width: 17,),
              Image.asset('assets/images/light.png'),
              SizedBox(width: 17,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 12,),
                Text("This session supports your latest bike",style: k13_700_roboto,),
                Text("tuning goal of Assist with Chatter.",style: k13_700_roboto,)
              ],),

            ],),
          ),
          SizedBox(height: 40,),
          Stack(
            children: [
              Image.asset('assets/images/imageride.png'
              ),
              Positioned(
                  top:45,left:90,
                  child: Image.asset("assets/images/play96.png")),
              Positioned(
                  left: 10,
                  bottom:10,
                  child: Text("Begin Lesson 1",style: k13_400_roboto,))
            ],
          )
        ],
      ),
    );
  }
}

