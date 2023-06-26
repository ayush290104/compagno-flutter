import 'package:bloc/bloc.dart';
import 'package:compagno4/repository/database.dart';
import 'package:compagno4/screens/awards/bloc/awards_bloc.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:compagno4/screens/login/loginBloc/login_cubit.dart';
import 'package:compagno4/screens/register/register_bloc/auth_cubit.dart';
import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/save_user/user_bloc/bloc_observer.dart';
import 'package:compagno4/screens/taining/bloc/train_cubit.dart';
import 'package:compagno4/utils/genrator_route.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

RegisterCubit registerCubit = RegisterCubit();
LoginCubit loginCubit = LoginCubit();
DashboardCubit dashboardCubit = DashboardCubit();
TrainCubit trainCubit = TrainCubit();
AwardsCubit awardsCubit = AwardsCubit();
DatabaseRepo databaseRepo = DatabaseRepo();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveId.saveInitialization();
  token = SaveId.getSaveData(key: 'token');
  print("token");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(410, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => RegisterCubit()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: loading,
              onGenerateRoute: RouteGenerator().generateRoute,
            ),
          );
        });
  }
}
