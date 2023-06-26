import 'package:compagno4/screens/register/register_bloc/auth_cubit.dart';
import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/screens/awards/awardgallery.dart';
import 'package:compagno4/screens/awards/awards.dart';
import 'package:compagno4/screens/background/background.dart';
import 'package:compagno4/screens/dashboard/dashboard.dart';
import 'package:compagno4/screens/dashboard/dashboard_map.dart';
import 'package:compagno4/screens/login/login.dart';
import 'package:compagno4/screens/login/loginBloc/login_cubit.dart';
import 'package:compagno4/screens/register/register.dart';
import 'package:compagno4/screens/register/register_bloc/register_bloc.dart';
import 'package:compagno4/screens/splashScreen/splashscreen.dart';
import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
import 'package:compagno4/screens/tabsrceen/user_model_cubit.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/dashboard/trail_chatter.dart';
import '../screens/goal/goal_set.dart';
import '../screens/goal/goal_set_chatter_complete.dart';
import '../screens/goal/goal_set_larger_chatter_step2.dart';
import '../screens/goal/goalset_larger_chatter.dart';
import '../screens/loadingscreen/loading.dart';
import '../screens/mapride/mapride.dart';
import '../screens/mapride/ride_complete.dart';
import '../screens/mapride/start_ride_recording.dart';
import '../screens/settings/setting.dart';
import '../screens/settings/setting_tuning.dart';
import '../screens/styleguide.dart';
import '../screens/taining/lesson_completed.dart';
import '../screens/taining/training.dart';
import '../screens/taining/traininglesson.dart';

class RouteGenerator {
  final LoginCubit _authBloc = LoginCubit();
  // final HomeBloc _dashboardBloc = HomeBloc();
  final RegisterCubit _registerBloc = RegisterCubit();
  final UserModelCubit _setting = UserModelCubit();
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>.value(
              value: _authBloc, child: LoginScreen()),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterCubit>.value(
            value: _registerBloc,
            child: RegisterScreen(),
          ),
        );
      case tapScreen:
        return MaterialPageRoute(builder: (context) => TabScreen());
      case dashBoard:
        return MaterialPageRoute(builder: (context) => Dashboard());
      case dashBordMap:
        return MaterialPageRoute(builder: (context) => DashboardMap());
      case trailChatter:
        return MaterialPageRoute(builder: (context) => TrailChatter());
      case awardGallery:
        return MaterialPageRoute(builder: (context) => AwardGallery());
      case award:
        return MaterialPageRoute(builder: (context) => Awards());

      case backGround:
        return MaterialPageRoute(builder: (context) => BackGround());
      case goalSet:
        return MaterialPageRoute(builder: (context) => GoalSet());
      case goalComplete:
        return MaterialPageRoute(
            builder: (context) => GoalSetChatterComplete());
      case goalChatter2:
        return MaterialPageRoute(
            builder: (context) => GoalSetLargerChatterStep2());
      case goalChatter:
        return MaterialPageRoute(builder: (context) => GoalSetChatter());
      case loading:
        return MaterialPageRoute(builder: (context) => LoadingScreen());
      case mapRide:
        return MaterialPageRoute(builder: (context) => MapRide());
      case rideComplete:
        return MaterialPageRoute(builder: (context) => const RideComplete());
      case startRideRecording:
        return MaterialPageRoute(builder: (context) => const StartRiding());

      case setting:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<UserModelCubit>.value(
              value: _setting, child: Settings()),
        );
      case settingTuning:
        return MaterialPageRoute(builder: (context) => SettingTuning());
      case training:
        return MaterialPageRoute(builder: (context) => Training());
      case styleguide:
        return MaterialPageRoute(builder: (context) => StyleGuide());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}
