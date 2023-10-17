import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerationWidget extends StatefulWidget {
  const AccelerationWidget({Key? key}) : super(key: key);

  @override
  State<AccelerationWidget> createState() => _AccelerationWidgetState();
}

class _AccelerationWidgetState extends State<AccelerationWidget> {
  double acceleration = 0.0;
  StreamSubscription<UserAccelerometerEvent>? _accelerometerSubscription;
  void _startListeningToAccelerometer() {
    _accelerometerSubscription =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
          // Access the accelerometer readings through event.x, event.y, event.z
          double x = event.x;
          double y = event.y;
          double z = event.z;
          // Perform necessary calculations based on the accelerometer readings
          acceleration = calculateAcceleration(x, y, z);
          setState(() {});
          // Use the acceleration value for further operations
        });
  }

  double calculateAcceleration(double x, double y, double z) {
    return sqrt(x * x + y * y + z * z);
    // You can perform additional calculations or adjustments based on your requirements
  }

  void _stopListeningToAccelerometer() {
    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
  }

  @override
  void initState() {
    _startListeningToAccelerometer();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(acceleration.toString()),
      ),
    );
  }
}

class AccelrationSensor {
  List<double> acceleration = [];
  int count = 0;
  StreamSubscription<UserAccelerometerEvent>? _accelerometerSubscription;
  void startListeningToMagnetometer(Function(List<double> value) valueSetter) {
    _accelerometerSubscription =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
          // Access the accelerometer readings through event.x, event.y, event.z
          double x = event.x;
          double y = event.y;
          double z = event.z;
          final val = calculateAcceleration(x, y, z);
          // Perform necessary calculations based on the accelerometer readings
          acceleration.add(val);
          valueSetter.call(acceleration);
          count += 1;
          // Use the acceleration value for further operations
        });
  }

  double calculateAcceleration(double x, double y, double z) {
    return sqrt(x * x + y * y + z * z);
    // You can perform additional calculations or adjustments based on your requirements
  }

  double disposeSensor() {
    double counter = 0.0;
    counter = acceleration.fold(
        0, (previousValue, element) => previousValue + element);

    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
    return counter / count;
  }

  double handleValue() {
    double counter = 0.0;
    counter = acceleration.fold(
        0, (previousValue, element) => previousValue + element);
    final value = counter / count;
    count = 0;
    counter = 0;

    return value;
  }
}
