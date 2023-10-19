import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../dashboard/dashboard.dart';
import '../mapride/mapride.dart';
import '../settings/setting.dart';
import '../taining/training.dart';

class TabScreen extends StatefulWidget {
  final int pageIndex;
  TabScreen({Key? key, required this.pageIndex}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState(pageIndex);
}

class _TabScreenState extends State<TabScreen> {
  late PageController _pageController;
  int pageIndex;

  _TabScreenState(this.pageIndex);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 113,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(0, 'Dashboard', 'assets/images/bicycle.png'),
            buildTabItem(1, 'Map Ride', 'assets/images/play.png'),
            buildTabItem(2, 'Training', 'assets/images/barbell.png'),
            buildTabItem(3, 'Settings', 'assets/images/slider.png'),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
             pageIndex = page;
          });
          // You can remove the _navigateToPage method from here
        },
        children: [
          Dashboard(),
          MapRide(),
          Training(),
          Settings(),
        ],
      ),
    );
  }

  Widget buildTabItem(int index, String label, String imagePath) {
    return InkWell(
      onTap: () {
        setState(() {
          _navigateToPage(index);
        });
      },
      child: Column(
        children: [
          SizedBox(height: 19),
          Image.asset(imagePath),
          SizedBox(height: 5),
          Text(label, style: k13_400_roboto),
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pageIndex == index ? Color(0xffFFFFFF) : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
