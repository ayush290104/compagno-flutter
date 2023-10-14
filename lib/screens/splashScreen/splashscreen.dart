import 'dart:async';

import 'package:compagno4/constant/fonts.dart';
import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/dashboardController.dart';
import '../../main.dart';
import '../dashboard/bloc/dashboard_cubit.dart';
import '../dashboard/bloc/dashboard_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5); // Reduced from 500 seconds
    return Timer(duration, route);
  }

  route() {
    final accessToken = SaveId.getSaveData(key: token).isNotEmpty;
    if (accessToken) {
      debugPrint("SaveId.getSaveData(key: token): ${SaveId.getSaveData(key: token)}");
    }
    Navigator.pop(context);
    Navigator.pushNamed(context, accessToken ? tabScreen : login);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: dashboardCubit..fetch(SaveId.getSaveData(key: token)))
      ],
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40.0), // Added SizedBox for top spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  ],
                ),
              ),
              SizedBox(height: 40.0), // Added SizedBox for spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                    return Text(
                      (state is DashboardSuccessState)
                          ? "WELCOME,\n BACK ${dashboardCubit.dashboardClass!.data!.user!.name!.toUpperCase()}"
                          : "WAIT...",
                      style: k28_400_noize,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
              SizedBox(
                height:30
              ),
              Text(
                "LET’S RIDE.",
                style: k28_400_noize,
              ),
              Text(
                "YOUR LAST RIDE",
                style: k16_400_bebas,
              ),
              SizedBox(height: 20.0), // Added SizedBox for spacing
              Text("YOUR LAST RIDE"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/location.png"),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: BlocBuilder<DashboardCubit, DashboardState>(
                        builder: (context, state) {
                          if (state is DashboardSuccessState) {
                            if (dashboardCubit.dashboardClass?.data?.yourRoute != null) {
                              var latitude = 0.0;
                              var longitude = 0.0;
                              for (var i in dashboardCubit.dashboardClass!.data!.yourRoute!) {
                                if (i == dashboardCubit.dashboardClass!.data!.yourRoute!.last) {
                                  latitude = i.lat!.toDouble();
                                  longitude = i.lng!.toDouble();
                                }
                              }
                              dashboardController.getAddressFromLatLng(LatLng(latitude, longitude));
                            }
                            return Obx(() => Text(dashboardController.address.value, style: k13_400_roboto));
                          } else {
                            return Text("Wait", style: k13_400_roboto);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0), // Added SizedBox for spacing
              Text(
                "Current tuning settings",
                style: k16_400_bebas,
              ),
              Text(
                "Assist with Chatter",
                style: k13_400_roboto,
              ),
              Text(
                "Next Award",
                style: k16_400_bebas,
              ),
              Text(
                "5 Training Sessions Complete",
                style: k13_400_roboto,
              ),
              SizedBox(height: 20.0), // Added SizedBox for spacing
              GestureDetector(
                child: Container(
                  height: 40.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "CONTINUE", // Fixed the typo in "COUNTINUE"
                      style: k13_700_roboto,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
