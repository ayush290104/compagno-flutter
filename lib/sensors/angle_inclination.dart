import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math.dart';

// class AngleInclination extends StatefulWidget {
//   const AngleInclination({Key? key}) : super(key: key);

//   @override
//   State<AngleInclination> createState() => _AngleInclinationState();
// }

// class _AngleInclinationState extends State<AngleInclination> {
//   double angleOfInclination = 0.0;

//   void _stopListeningToAccelerometer() {
//     _accelerometerSubscription?.cancel();
//     _accelerometerSubscription = null;
//   }

//   double calculateAngleOfInclination(double x, double y, double z) {
//     double radians = atan2(y, sqrt(x * x + z * z));
//     double angle = radians * (180 / pi);
//     return angle;
//   }

//   @override
//   void initState() {
//     _startListeningToAccelerometer();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(angleOfInclination.toString()),
//     );
//   }
// }







class AngleInclinationSensor {
  List<double> angle = [];
  int count = 0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  void startListeningToAccelerometer(Function(double value) valueSetter) {
    _accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      angle.add(calculateLeanAngle(event.x, event.y, event.z));
      count += 1;
       valueSetter.call(calculateLeanAngle(event.x, event.y, event.z));
    });
  }

  double calculateLeanAngle(double x, double y, double z) {
    // Convert accelerometer readings to radians
    double leanAngle = atan2(x, sqrt(y * y + z * z));
            leanAngle =  leanAngle * (180 / pi);
    debugPrint("value is $leanAngle");
    return leanAngle;
  }

  double disposeSensor() {
    double totalLeanAngle = angle.fold(0, (previousValue, element) => previousValue + element);

    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;

    return totalLeanAngle / count;
  }

  double handleValue() {
    double totalLeanAngle = angle.fold(0, (previousValue, element) => previousValue + element);
    final value = totalLeanAngle / count;

    count = 0;
    totalLeanAngle = 0;
    angle.clear();

    return value;
  }
}




