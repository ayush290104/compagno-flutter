import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../dashboard/dashboard.dart';
import '../loadingscreen/loading.dart';
import '../mapride/mapride.dart';
import '../settings/setting.dart';
import '../taining/taining.dart';



class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 113,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                selectedIndex = pageIndex = 0;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 0;
                setState(() {});
              },
              child: Column(children: [
                SizedBox(height: 19,),
                Image.asset('assets/images/bicycle.png'),
                SizedBox(height: 5,),
                Text("Dashboard",style: k13_400_roboto,),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      color: pageIndex == 0
                          ? Color(0xffFFFFFF)
                          : Colors.transparent,
                  )
                )
              ],),
            ),
            InkWell(
              onTap: () {
                selectedIndex = pageIndex = 1;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 1;
                setState(() {});
              },
              child: Column(children: [
                SizedBox(height: 19,),
                Image.asset('assets/images/play.png'),
                SizedBox(height: 5,),
                Text("Map Ride",style: k13_400_roboto,),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: pageIndex == 1
                      ? Color(0xffFFFFFF)
                      : Colors.transparent,),
                )
              ],),
            ),
            InkWell(
              onTap: () {
                selectedIndex = pageIndex = 2;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 2;
                setState(() {});
              },
              child: Column(children: [
                SizedBox(height: 19,),
                Image.asset('assets/images/barbell.png'),
                SizedBox(height: 5,),
                Text("Training",style: k13_400_roboto,),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: pageIndex == 2
                      ? Color(0xffFFFFFF)
                      : Colors.transparent,),
                )
              ],),
            ),
            InkWell(
              onTap: () {
                selectedIndex = pageIndex = 3;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 3;
                setState(() {});
              },
              child: Column(children: [
                SizedBox(height: 19,),
                Image.asset('assets/images/slider.png'),
                SizedBox(height: 5,),
                Text("Settings",style: k13_400_roboto,),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: pageIndex == 3
                      ? Color(0xffFFFFFF)
                      : Colors.transparent,),
                )
              ],),
            ),


          ],),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(
                () {
              pageIndex = page;
            },
          );
        },
        children: [

          Dashboard(),
          MapRide(),
          Training(),
          Settings()
        ],
      ),
    );
  }
}
