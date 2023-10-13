import 'package:compagno4/screens/login/login.dart';
import 'package:compagno4/screens/settings/setting_tuning.dart';
import 'package:compagno4/screens/tabsrceen/user_mode_state.datr.dart';
import 'package:compagno4/screens/tabsrceen/user_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserModelCubit()..getUserData(),
      child: BlocConsumer<UserModelCubit, UserModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<UserModelCubit>(context);
          // debugPrint('user Data ${cubit.userData!}');
          return Scaffold(
              backgroundColor: AppColors.k47574C,
              // ignore: unnecessary_null_comparison
              body: cubit.userData != null
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      "COMPAGNO",
                                      style: k25_400_noize,
                                    ),
                                    Spacer(),
                                    Text(
                                      "POWERED BY",
                                      style: k10_400_bebas,
                                    ),
                                    Image.asset('assets/images/METALLO.png'),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "S E T T I N G S",
                                    style: k32_400_bebas,
                                  ),
                                ],
                              ),
                              SizedBox(height: 37),
                              Container(
                                height: 150,
                                width: 150,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Image.asset("assets/images/user.png"),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.k000000,
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/edit.png"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Text(
                                cubit.userData!.name!,
                                style: k32_400_bebas,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "RIDER SINCE ${cubit.userData!.created_at!.substring(0, 4)}",
                                style: k13_700_roboto,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingTuning()));
                                },
                                child: Container(
                                  height: 84,
                                  width: 324,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.k000000),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 18, right: 9),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Rider Level",
                                              style: k20_400_bebas,
                                            ),
                                            Spacer(),
                                            Image.asset(
                                                "assets/images/edit2.png")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                cubit.userData!.rider_level!
                                                    .toUpperCase(),
                                                style: k13_400_roboto,
                                              ),
                                            ),
                                            // SizedBox(width: 20),
                                            Expanded(
                                              flex: 3,
                                              child: LinearProgressIndicator(
                                                minHeight: 10,
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                value: () {
                                                  if (cubit.userData!
                                                          .rider_level ==
                                                      'beginner') {
                                                    return 1 / 3;
                                                  } else if (cubit.userData!
                                                          .rider_level ==
                                                      'intermediate') {
                                                    return 2 / 3;
                                                  } else if (cubit.userData!
                                                          .rider_level ==
                                                      'expert') {
                                                    return 1.0;
                                                  }
                                                  // Return a default value if rider_level doesn't match any of the options.
                                                  return 0.0;
                                                }(),
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        Color(0xffB69F4C)),
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Container(
                                  height: 274,
                                  width: 325,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.k000000),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 19, right: 9),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Bikes",
                                              style: k20_400_bebas,
                                            ),
                                            Spacer(),
                                            Image.asset(
                                                "assets/images/edit2.png")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 19,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                  "assets/images/bikeimg.png"),
                                            ),
                                            SizedBox(
                                              width: 17,
                                            ),
                                            Column(
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text: 'Monte',
                                                          style:
                                                              k13_800_roboto),
                                                      TextSpan(
                                                        text:
                                                            '\nMETALLO M150 STR 2022',
                                                        style: k13_400_roboto,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SettingTuning()));
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 185,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            AppColors.k69806F),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              top: 5,
                                                              right: 4),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "CURRENT TUNING SETTINGS",
                                                            style:
                                                                k11_800_roboto,
                                                          ),
                                                          Spacer(),
                                                          Image.asset(
                                                              "assets/images/Polygon 1.png")
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 28,
                                        ),
                                        Row(children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  "assets/images/dottedcircle.png"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 17,
                                          ),
                                          Text(
                                            "Add new bike",
                                            style: k13_400_roboto,
                                          )
                                        ]),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 18,
                              ),
                              Container(
                                  height: 97,
                                  width: 325,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.k000000)),
                              SizedBox(
                                height: 18,
                              ),
                              Container(
                                height: 186,
                                width: 325,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.k000000),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 18, right: 18),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Personal Info",
                                            style: k20_400_bebas,
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: (){},
                                              child: Image.asset('assets/images/edit2.png'))
                                        ],
                                      ),
                                      SizedBox(height: 22),
                                      Row(
                                        children: [
                                          Text(
                                            "Email",
                                            style: k13_400_roboto,
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            cubit.userData!.email!,
                                            style: k13_400_roboto,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text(
                                            "Phone",
                                            style: k13_400_roboto,
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            (cubit.userData!.phone!.isNotEmpty)? cubit.userData!.phone!: "Empty",
                                            style: k13_400_roboto,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Address",
                                              style: k13_400_roboto,
                                            ),
                                          ),

                                          Expanded(
                                            flex:3,
                                            child: Text(
                                              (cubit.userData!.address_line!
                                                      .isNotEmpty)
                                                  ? cubit.userData!.address_line!
                                                  : "Empty",
                                              style: k13_400_roboto,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen()));
                                },
                                child: Container(
                                  height: 57,
                                  width: 324,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.k000000),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 9),
                                    child: Row(
                                      children: [
                                        Text(
                                          "LOG OUT",
                                          style: k20_400_bebas,
                                        ),
                                        Spacer(),
                                        Image.asset('assets/images/forback.png')
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ));
        },
      ),
    );
  }
}
