import 'package:compagno4/screens/loadingscreen/loading.dart';
import 'package:compagno4/screens/styleguide.dart';
import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(410
            , 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(


            debugShowCheckedModeBanner: false,
            home: const LoadingScreen(),
          );
        });
  }
}
