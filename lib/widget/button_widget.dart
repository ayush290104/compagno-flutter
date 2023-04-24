import 'package:bulbul_taxi_driver_main/screens/add_car_info.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ButtonWidget({Key? key,
    required this.text,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(

    height: 50,width: 170,
    decoration: BoxDecoration(
     color: AppColors.primaryColorGreen,
       borderRadius: BorderRadius.all(Radius.circular(120.0)),),
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColorGreen),
      ),
        onPressed: onTap, child: Text(text, style: TextStyle(color: AppColors.secondaryColorWhite, fontSize: 20),)),
  );
}
