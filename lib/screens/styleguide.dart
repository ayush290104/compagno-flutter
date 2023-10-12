import 'package:compagno4/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/fonts.dart';
import 'background/background.dart';

class StyleGuide extends StatefulWidget {
  const StyleGuide({Key? key}) : super(key: key);

  @override
  State<StyleGuide> createState() => _StyleGuideState();
}

class _StyleGuideState extends State<StyleGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k000000,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52),
            Image.asset("assets/images/Sample image trail.png"),
            SizedBox(height: 33),
            Row(
              children: [
                SizedBox(width: 40),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: AppColors.kB69F4C,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColors.kD9D9D9),
                          color: AppColors.k000000),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: AppColors.k262726,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: AppColors.k48574C,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: AppColors.k69806F,
                    ),
                  ],
                ),
                SizedBox(
                  width: 33,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //gSizedBox(height:10),

                    Container(
                        height: 62,
                        child: Text(
                          "NOIZE",
                          style: k48_400_noize,
                        )),
                    Container(
                        height: 46,
                        child: Text(
                          "BEBAS NEUE",
                          style: k25_400_bebas,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BackGround()));
                      },
                      child: Container(
                          width: 232,
                          child: Text(
                            "Roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto roboto",
                            style: k15_400_roboto,
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
