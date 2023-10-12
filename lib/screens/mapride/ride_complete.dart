import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
import 'package:compagno4/screens/taining/traininglesson.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class RideComplete extends StatefulWidget {
  const RideComplete({Key? key}) : super(key: key);

  @override
  State<RideComplete> createState() => _RideCompleteState();
}

class _RideCompleteState extends State<RideComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Spacer(),
                Text(
                  "POWERED BY",
                  style: k10_400_bebas,
                ),
                Image.asset('assets/images/METALLO.png'),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Text(
              "R i d e  c o m p l e t e",
              style: k32_400_bebas,
            ),
          ),
          const SizedBox(
            height: 190,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TabScreen()));
            },
            child: Stack(
              children: [
                Image.asset("assets/images/Ellipse 2.png"),
                Positioned(
                    top: 23,
                    left: 28,
                    child: Image.asset("assets/images/done.png"))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "GREAT WORK!",
            style: k13_700_roboto,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Your ride data will be available on the ",
            style: k13_400_roboto,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Dashboard ', style: k13_700_roboto),
                TextSpan(
                  text: 'tab.',
                  style: k13_400_roboto,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
