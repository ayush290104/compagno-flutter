import 'package:compagno4/constant/color.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  final bool isBack;
  final VoidCallback onBackTap;

  Header({Key? key,
    this.isBack = false,
    required this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // ClipPath(
        //   clipper: BottomWaveClipper(),
        //   child: Container(
        //     height: 250,
        //     decoration: const BoxDecoration(
        //       color: AppColors.k47574C,
        //     ),
        //   ),
        // ),
        Image.asset('assets/images/Background.png'),
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width / 2 - 62,
          child: Column(
            children: <Widget>[
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120 / 2),
                    border: Border.all(
                      width: 5,
                      color: AppColors.k47574C,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/logo_small.png",
                      height: 72,
                      width: 72,
                    ),
                  ))
            ],
          ),
        ),
        isBack
            ? GestureDetector(
          onTap: onBackTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.topLeft,
              // child: AppBar(
              //   AppBarIcon : ViitAppBarIconTypes.BACK, myLeadingIcon: const Icon(
              //   Icons.arrow_back_ios,), bgColor: Colors.white , iconColor: mPrimaryColor,

            ),
          ),
        )
            : const SizedBox(),
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    var secondControlPoint =
    Offset(size.width - (size.width / 2), size.height - 120);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 5);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}