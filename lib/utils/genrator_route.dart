// import 'package:compagno4/screens/register/register_bloc/auth_cubit.dart';
// import 'package:compagno4/save_user/constants/constants.dart';
// import 'package:compagno4/screens/awards/awardgallery.dart';
// import 'package:compagno4/screens/awards/awards.dart';
// import 'package:compagno4/screens/background/background.dart';
// import 'package:compagno4/screens/dashboard/dashboard.dart';
// import 'package:compagno4/screens/dashboard/dashboard_map.dart';
// import 'package:compagno4/screens/login/login.dart';
// import 'package:compagno4/screens/login/loginBloc/login_cubit.dart';
// import 'package:compagno4/screens/register/register.dart';
// import 'package:compagno4/screens/register/register_bloc/register_bloc.dart';
// import 'package:compagno4/screens/splashScreen/splashscreen.dart';
// import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
// import 'package:compagno4/screens/tabsrceen/user_model_cubit.dart';
// import 'package:compagno4/utils/route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../screens/dashboard/trail_chatter.dart';
// import '../screens/goal/goal_set.dart';
// import '../screens/goal/goal_set_chatter_complete.dart';
// import '../screens/goal/goal_set_larger_chatter_step2.dart';
// import '../screens/goal/goalset_larger_chatter.dart';
// import '../screens/loadingscreen/loading.dart';
// import '../screens/mapride/mapride.dart';
// import '../screens/mapride/ride_complete.dart';
// import '../screens/mapride/start_ride_recording.dart';
// import '../screens/settings/setting.dart';
// import '../screens/settings/setting_tuning.dart';
// import '../screens/styleguide.dart';
// import '../screens/taining/lesson_completed.dart';
// import '../screens/taining/training.dart';
// import '../screens/taining/traininglesson.dart';

// class RouteGenerator {
//   final LoginCubit _authBloc = LoginCubit();
//   // final HomeBloc _dashboardBloc = HomeBloc();
//   final RegisterCubit _registerBloc = RegisterCubit();
//   final UserModelCubit _setting = UserModelCubit();
//   Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {

//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Error'),
//         ),
//         body: const Center(
//           child: Text('ERROR IN NAVIGATION'),
//         ),
//       );
//     });
//   }
// }


import 'package:compagno4/screens/awards/awardgallery.dart';
import 'package:compagno4/screens/awards/awards.dart';

import 'package:compagno4/screens/background/background.dart';
import 'package:compagno4/screens/dashboard/dashboard.dart';
import 'package:compagno4/screens/dashboard/dashboard_map.dart';
import 'package:compagno4/screens/dashboard/previous_rides.dart';
import 'package:compagno4/screens/dashboard/trail_chatter.dart';

import 'package:compagno4/screens/goal/goal_set.dart';
import 'package:compagno4/screens/goal/goal_set_chatter_complete.dart';
import 'package:compagno4/screens/goal/goal_set_larger_chatter_step2.dart';
import 'package:compagno4/screens/goal/goalset_larger_chatter.dart';
import 'package:compagno4/screens/loadingscreen/loading.dart';
import 'package:compagno4/screens/login/login.dart';
import 'package:compagno4/screens/mapride/mapride.dart';
import 'package:compagno4/screens/mapride/ride_complete.dart';
import 'package:compagno4/screens/mapride/start_ride_recording.dart';
import 'package:compagno4/screens/register/register.dart';
import 'package:compagno4/screens/settings/add_bikes.dart';
import 'package:compagno4/screens/settings/modify_profile.dart';
import 'package:compagno4/screens/settings/setting.dart';
import 'package:compagno4/screens/settings/setting_tuning.dart';
import 'package:compagno4/screens/splashScreen/splashscreen.dart';
import 'package:compagno4/screens/styleguide.dart';
import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
import 'package:compagno4/screens/taining/more_videos.dart';
import 'package:compagno4/screens/taining/training.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';

class RoutesMap {
  static Map<String, Widget Function(BuildContext ctx)> getRoutesMap() {
    Map<String, Widget Function(BuildContext ctx)> map = {
      splashScreen: (_) => const SplashScreen(),
      login: (_) => const LoginScreen(),
      register: (_) => RegisterScreen(),
      dashBoard: (_) => Dashboard(),
      tabScreen: (_) =>  TabScreen(pageIndex: 0,),
      dashBordMap: (context) => const DashboardMap(),
      trailChatter: (context) => const TrailChatter(),
      awardGallery: (context) => const AwardGallery(),
      award: (context) => const Awards(),
      backGround: (context) => const BackGround(),
      goalSet: (context) => const GoalSet(),
      goalComplete: (context) => const GoalSetChatterComplete(),
      goalChatter2: (context) => const GoalSetLargerChatterStep2(),
      goalChatter: (context) => const GoalSetChatter(),
      loading: (context) => const LoadingScreen(),
      mapRide: (context) => const MapRide(),
      rideComplete: (context) => const RideComplete(),
      startRideRecording: (context) => const StartRiding(),
      setting: (_) => const Settings(),
      settingTuning: (context) => const SettingTuning(),
      training: (context) => const Training(),
      styleguide: (context) => const StyleGuide(),
      modifyProfile: (context) => const ModifyProfile(),
      previousRides: (context) => const PreviousRidesScreen(),
      addBikes: (context) => const AddBikesScreen(),


    };
    return map;
  }
}
