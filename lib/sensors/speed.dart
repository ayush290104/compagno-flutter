// import 'dart:async';
// import 'dart:developer';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// class SpeedWidget extends StatefulWidget {
//   const SpeedWidget({Key? key}) : super(key: key);

//   @override
//   State<SpeedWidget> createState() => SpeedWidgetState();
// }

// class SpeedWidgetState extends State<SpeedWidget> {
//   final BicycleSpeedCalculator data = BicycleSpeedCalculator();
//   double acceleration = 0.0; // Track the acceleration
//   double velocity = 0.0; // Track the velocity
//   double distance = 0.0; // Track the distance traveled
//   double prevTime = 0.0; // Previous timestamp
//   final double averageRadius =
//       0.35; // Assuming an average bicycle wheel radius of 0.35 meters
//   StreamSubscription? accelSubscription;
//   @override
//   void initState() {
//   data.bicycleSpeedCalculator();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(data.velocity.toString()),
//       ),
//     );
//   }
// }

// class BicycleSpeedCalculator {
//   double acceleration = 0.0; // Track the acceleration
//   double velocity = 0.0; // Track the velocity
//   double distance = 0.0; // Track the distance traveled
//   double prevTime = 0.0; // Previous timestamp
//   final double averageRadius = 0.35; // Assuming an average bicycle wheel radius of 0.35 meters
//   StreamSubscription<AccelerometerEvent>? accelSubscription;
//   bicycleSpeedCalculator() {
//     // Initialize the accelerometer subscription
//     accelSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
//       // Calculate acceleration using the formula: √(x^2 + y^2 + z^2)
//       acceleration = sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));
//       calculateSpeed(0);
//     });
//   }
//   void calculateSpeed(double currentTime) {
//     // Calculate the bicycle speed
//     velocity += acceleration * (1) / 1000; // velocity = acceleration * time (in seconds)
//     distance += velocity * (1) / 1000; // distance = velocity * time (in seconds)
//     prevTime = currentTime;
//   }
//   double getSpeedInKmph() {
//     // Calculate the speed (in km/h) using the equation: v = 3.6 * r * w
//     // where 'v' is the speed, 'r' is the radius of the tire (0.35 meters), and 'w' is the angular velocity (velocity / r)
//     return 3.6 * averageRadius * velocity / averageRadius; // Final speed in km/h
//   }
//   void start() {
//     prevTime = DateTime.now().millisecondsSinceEpoch.toDouble();
//   }
//   void stop() {
//     accelSubscription?.cancel();
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class Speedometer extends StatefulWidget {
  @override
  _SpeedometerState createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  double _speed = 0;
  StreamSubscription<Position>? _positionStreamSubscription;
  Position? _previousPosition;
  @override
  void initState() {
    super.initState();
    _positionStreamSubscription =
        Geolocator.getPositionStream().listen(_onPositionUpdate);
  }

  void _onPositionUpdate(Position newPosition) {
    if (_previousPosition != null) {
      double distance = Geolocator.distanceBetween(
        _previousPosition?.latitude ?? 0.0,
        _previousPosition?.longitude ?? 0.0,
        newPosition.latitude,
        newPosition.longitude,
      );
      double time = newPosition.timestamp
              ?.difference(_previousPosition!.timestamp!)
              .inSeconds
              .toDouble() ??
          0.0;
      setState(() {
        _speed = distance / time;
      });
    }
    _previousPosition = newPosition;
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Speed: ${_speed * 18 / 5} km/hr',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SpeedSensor {
  List<double> speedList = [];
  int count = 0;
  StreamSubscription<Position>? _positionStreamSubscription;
  void startSpeedSensor() async {
    Location location = Location();
    PermissionStatus _permissionGranted;
    await location.requestPermission().then((value) {
      _permissionGranted = value;
    });
    bool _serviceEnabled;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
        // Service not enabled, handle accordingly
      }
    }
    _positionStreamSubscription =
        Geolocator.getPositionStream().listen(_onPositionUpdate);
  }

  Position? _previousPosition;
  double? lat;
  double? lng;
  double getLat() {
    return lat ?? 0;
  }

  double getLng() {
    return lng ?? 0;
  }
  double? kdistance;
double getDistance(){
return kdistance ?? 0;
} 
  void _onPositionUpdate(Position newPosition) {
    if (_previousPosition != null) {
      lat = newPosition.latitude;
      lng = newPosition.longitude;

      double distance = Geolocator.distanceBetween(
        _previousPosition?.latitude ?? 0.0,
        _previousPosition?.longitude ?? 0.0,
        newPosition.latitude,
        newPosition.longitude,
      );
      kdistance= distance;
      double time = newPosition.timestamp
              ?.difference(_previousPosition!.timestamp!)
              .inSeconds
              .toDouble() ??
          0.0;
      double _speed = distance / time;
      count += 1;
      speedList.add(_speed);
    }
    _previousPosition = newPosition;
  }

  double disposeSensor() {
    double counter = 0.0;
    counter =
        speedList.fold(0, (previousValue, element) => previousValue + element);

    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    return counter / count;
  }

  double handleValue() {
    double counter = 0.0;
    counter =
        speedList.fold(0, (previousValue, element) => previousValue + element);
    final value = counter / count;
    count = 0;
    counter = 0;
    return value;
  }
}
