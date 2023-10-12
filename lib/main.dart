import 'package:compagno4/sensors/acceleration.dart';
import 'package:compagno4/sensors/angle_declination.dart';
import 'package:compagno4/sensors/angle_inclination.dart';
import 'package:compagno4/sensors/lean_angle.dart';
import 'package:compagno4/repository/database.dart';
import 'package:compagno4/screens/awards/bloc/awards_bloc.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/screens/taining/bloc/train_cubit.dart';
import 'package:compagno4/sensors/sensor.dart';
import 'package:compagno4/sensors/speed.dart';
import 'package:compagno4/sensors/trail_chatter.dart';
import 'package:compagno4/utils/genrator_route.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

DashboardCubit dashboardCubit = DashboardCubit();
TrainCubit trainCubit = TrainCubit();
AwardsCubit awardsCubit = AwardsCubit();
DatabaseRepo databaseRepo = DatabaseRepo();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveId.saveInitialization();
  token = SaveId.getSaveData(key: 'token');
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(410, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: loading,
            navigatorKey: navigatorKey,
            routes: RoutesMap.getRoutesMap(),
            // home: Scaffold(body: AccelerationWidget()),
            // home: Scaffold(body: AngleInclination()),
            // home: Scaffold(body: AngleDeclination()),
            // home: Scaffold(body: TrailCharter()),
            // home: Scaffold(body: Speedometer()),
            // home: LeanAngle(),
          );
        });
  }
}
