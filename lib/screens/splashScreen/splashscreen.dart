import 'dart:async';

import 'package:compagno4/constant/fonts.dart';
import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/dashboardController.dart';
import '../../constant/color.dart';
import '../../main.dart';
import '../dashboard/bloc/dashboard_cubit.dart';
import '../dashboard/bloc/dashboard_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final DashboardController dashboardController = Get.find();

  @override
  void initState() {
    super.initState();
    // startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5); // Reduced from 500 seconds
    return Timer(duration, route);
  }

  route() {
    final accessToken = SaveId.getSaveData(key: token).isNotEmpty;
    if (accessToken) {
      debugPrint(
          "SaveId.getSaveData(key: token): ${SaveId.getSaveData(key: token)}");
    }
    Navigator.pop(context);
    Navigator.pushNamed(context, accessToken ? tabScreen : login);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: dashboardCubit..fetch(SaveId.getSaveData(key: token)))
      ],
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        // Added SizedBox for top spacing
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            children: [
                              const Text(
                                "COMPAGNO",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Noize Sport Free Vertion",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kFFFFFF,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "POWERED BY",
                                style: GoogleFonts.bebasNeue(
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kFFFFFF,
                                  ),
                                ),
                              ),
                              Image.asset('assets/images/METALLO.png'),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 40.0), // Added SizedBox for spacing
                        BlocBuilder<DashboardCubit, DashboardState>(
                          builder: (context, state) {
                            return Container(
                              child: Text(
                                (state is DashboardSuccessState)
                                    ? "WELCOME \n BACK, ${dashboardCubit.dashboardClass!.data!.user!.name!.toUpperCase()}."
                                    : "WAIT...",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: "Noize Sport Free Vertion",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kFFFFFF,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text('YOUR LAST RIDE',
                              style: GoogleFonts.bebasNeue(
                                textStyle: GoogleFonts.bebasNeue(
                                  textStyle: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset("assets/images/location.png"),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child:
                              BlocBuilder<DashboardCubit, DashboardState>(
                                builder: (context, state) {
                                  if (state is DashboardSuccessState) {
                                    if (dashboardCubit
                                        .dashboardClass!.data!.lastRide!.route !=
                                        null) {
                                      var latitude = 0.0;
                                      var longitude = 0.0;
                                      for (var i in dashboardCubit
                                          .dashboardClass!.data!.lastRide!.route!) {
                                        if (i ==
                                            dashboardCubit.dashboardClass!.data!.lastRide!
                                                .route!.last) {
                                          latitude = i.lat!.toDouble();
                                          longitude = i.lng!.toDouble();
                                        }
                                      }
                                      dashboardController.getAddressFromLatLng(
                                          LatLng(latitude, longitude));
                                    }
                                    return Obx(() =>
                                        Text(dashboardController.address.value,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            )));
                                  } else {
                                    return Text("Wait", style: k13_400_roboto);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0), // Added SizedBox for spacing
                        Text(
                          "Current tuning settings",
                          style: GoogleFonts.bebasNeue(
                            textStyle: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Assist with Chatter",
                          style: k13_400_roboto,
                        ),
                        const SizedBox(height: 25.0),
                        Text(
                          "Next Award",
                          style: GoogleFonts.bebasNeue(
                            textStyle: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "5 Training Sessions Complete",
                          style: k13_400_roboto,
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),

                  // Added SizedBox for spacing
                  GestureDetector(
                    onTap: () => route(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 38,
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "CONTINUE", // Fixed the typo in "COUNTINUE"
                            style: k13_700_roboto,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
