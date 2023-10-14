import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math.dart';

class LeanAngleSensor {
  List<double> angle = [];
  int count = 0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  void startListeningToAccelerometer() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      angle.add(calculateLeanAngle(event.x, event.y, event.z));
      count += 1;
      // dev.log("lean angle ${calculateLeanAngle(event.x, event.y, event.z).toString()}");
    });
  }

  double calculateLeanAngle(double x, double y, double z) {
    // Convert accelerometer readings to radians
    double roll = atan2(y, z);
    double pitch = atan2(x, sqrt(y * y + z * z));
    // Calculate the lean angle in degrees
    double leanAngle = degrees(pitch);


    return leanAngle;
  }

  double disposeSensor() {
    double counter = 0.0;
    counter =
        angle.fold(0, (previousValue, element) => previousValue + element);

    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
    // dev.log("(counter/count) lean angle ${(counter / count).toString()}");
    return counter / count;
  }

  double handleValue() {
    double counter = 0.0;
    counter = angle.fold(
        0, (previousValue, element) => previousValue + element);
    final value = counter / count;
    count = 0;
    counter = 0;

    return value;
  }
}
