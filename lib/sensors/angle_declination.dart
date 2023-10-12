import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AngleDeclination extends StatefulWidget {
  const AngleDeclination({Key? key}) : super(key: key);

  @override
  State<AngleDeclination> createState() => _AngleDeclinationState();
}

class _AngleDeclinationState extends State<AngleDeclination> {
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;
  double angleOfDeclination = 0.0;
  void _startListeningToMagnetometer() {
    _magnetometerSubscription =
        magnetometerEvents.listen((MagnetometerEvent event) {
      // Access the magnetometer readings through event.x, event.y, event.z
      double x = event.x;
      double y = event.y;
      double z = event.z;
      // Perform necessary calculations based on the magnetometer readings
      angleOfDeclination = calculateAngleOfDeclination(x, y, z);
      setState(() {});
      // Use the angleOfDeclination value for further operations
    });
  }

  void _stopListeningToMagnetometer() {
    _magnetometerSubscription?.cancel();
    _magnetometerSubscription = null;
  }

  double calculateAngleOfDeclination(double x, double y, double z) {
    double radians = atan2(y, x);
    double angle = radians * (180 / pi);
    return angle;
  }

  @override
  void initState() {
    _startListeningToMagnetometer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(angleOfDeclination.toString()));
  }
}

class AngleDelinationSensor {
  List<double> angleOfDeclination = [];
  int count = 0;
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;
  void startListeningToMagnetometer() {
    _magnetometerSubscription =
        magnetometerEvents.listen((MagnetometerEvent event) {
      // Access the magnetometer readings through event.x, event.y, event.z
      double x = event.x;
      double y = event.y;
      double z = event.z;
      // Perform necessary calculations based on the magnetometer readings
      angleOfDeclination.add(calculateAngleOfDeclination(x, y, z));
      // Use the angleOfDeclination value for further operations
    });
  }

  double calculateAngleOfDeclination(double x, double y, double z) {
    double radians = atan2(y, x);
    double angle = radians * (180 / pi);
    return angle;
  }

  double disposeSensor() {
    double counter = 0.0;
    counter = angleOfDeclination.fold(
        0, (previousValue, element) => previousValue + element);

    _magnetometerSubscription?.cancel();
    _magnetometerSubscription = null;
    return counter / count;
  }
   double handleValue() {
    double counter = 0.0;
    counter = angleOfDeclination.fold(
        0, (previousValue, element) => previousValue + element);
    final value = counter / count;
    count = 0;
    counter = 0;
    return value;
  }
}
