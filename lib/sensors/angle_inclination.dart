import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
  List<double> angleOfInclination = [];
  int count = 0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  void startListeningToAccelerometer(Function(double value) valueSetter) {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      // Access the accelerometer readings through event.x, event.y, event.z
      double x = event.x;
      double y = event.y;
      double z = event.z;
      final val = calculateAngleOfInclination(x, y, z);
      // Perform necessary calculations based on the accelerometer readings
      angleOfInclination.add(val);
      valueSetter.call(val);
      count += 1;
      // Use the angleOfInclination value for further operations
    });
  }

  double calculateAngleOfInclination(double x, double y, double z) {
    double radians = atan2(y, sqrt(x * x + z * z));
    double angle = radians * (180 / pi);
    return angle;
  }

  double disposeSensor() {
    double counter = 0.0;
    counter = angleOfInclination.fold(
        0, (previousValue, element) => previousValue + element);

    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
    return counter / count;
  }

  double handleValue() {
    double counter = 0.0;
    counter = angleOfInclination.fold(
        0, (previousValue, element) => previousValue + element);
    final value = counter / count;
    count = 0;
    counter = 0;
    return value;
  }
}
