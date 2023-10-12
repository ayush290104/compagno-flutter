// // import 'dart:math' as math;
// // import 'dart:developer' as dev;

// // import 'package:geolocator/geolocator.dart';
// // import 'package:sensors_plus/sensors_plus.dart';

// // class SensorsClass {
// //   double velocity = 0;
// //   double highestVelocity = 0.0;
// //   void trackAccelration() async {
// //     userAccelerometerEvents.listen((event) {
// //       double newVelocity =
// //           math.sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
// //       // dev.log(newVelocity.toString());
// //     });
// //     _determinePosition();

// //     //   gyroscopeEvents.listen(
// //     //     (GyroscopeEvent event) async {
// //     //       double x = event.x, y = event.y, z = event.z;
// //     //       double norm_Of_g = math
// //     //           .sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
// //     //       // x = event.x / norm_Of_g;
// //     //       // y = event.y / norm_Of_g;
// //     //       // z = event.z / norm_Of_g;

// //     //       double xInclination = -(math.asin(x) * (180 / math.pi));
// //     //       double yInclination = ((math.acos(y)) * (180 / math.pi));
// //     //       double zInclination = ((math.atan(z)) * (180 / math.pi));

// //     //       String xAngle = "${xInclination.round()}°";
// //     //       // String yAngle = "${yInclination.round()}°";
// //     //       // String zAngle = "${zInclination.round()}°";
// //     //       dev.log(xAngle.toString());

// //     //       await Future.delayed(const Duration(seconds: 2), () {
// //     //         // dev.log(event.x.toString());
// //     //       });
// //     //     },
// //     //     onError: (error) {
// //     //       // Logic to handle error
// //     //       // Needed for Android in case sensor is not available
// //     //     },
// //     //     cancelOnError: true,
// //     //   );
// //     // }
// //     accelerometerEvents.listen((AccelerometerEvent event) {
// //       // setState(() {
// //       double x = event.x, y = event.y, z = event.z;
// //       double norm_Of_g =
// //           math.sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
// //       x = event.x / norm_Of_g;
// //       y = event.y / norm_Of_g;
// //       z = event.z / norm_Of_g;

// //       double xInclination = -(math.asin(x) * (180 / math.pi));
// //       double yInclination = (math.acos(y) * (180 / math.pi));
// //       double zInclination = (math.atan(z) * (180 / math.pi));

// //       String xAngle = "${xInclination.round()}°";
// //       String yAngle = "${yInclination.round()}°";
// //       String zAngle = "${zInclination.round()}°";
// //       dev.log(yAngle.toString() +
// //           "  " +
// //           xAngle.toString() +
// //           "   " +
// //           zAngle.toString());
// //     });
// //     // });
// //   }
// // }

// // /// Determine the current position of the device.
// // ///
// // /// When the location services are not enabled or permissions
// // /// are denied the `Future` will return an error.
// // Future<void> _determinePosition() async {
// //   bool serviceEnabled;
// //   LocationPermission permission;

// //   // Test if location services are enabled.
// //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //   if (!serviceEnabled) {
// //     // Location services are not enabled don't continue
// //     // accessing the position and request users of the
// //     // App to enable the location services.
// //     return Future.error('Location services are disabled.');
// //   }

// //   permission = await Geolocator.checkPermission();
// //   if (permission == LocationPermission.denied) {
// //     permission = await Geolocator.requestPermission();
// //     if (permission == LocationPermission.denied) {
// //       // Permissions are denied, next time you could try
// //       // requesting permissions again (this is also where
// //       // Android's shouldShowRequestPermissionRationale
// //       // returned true. According to Android guidelines
// //       // your App should show an explanatory UI now.
// //       return Future.error('Location permissions are denied');
// //     }
// //   }

// //   if (permission == LocationPermission.deniedForever) {
// //     // Permissions are denied forever, handle appropriately.
// //     return Future.error(
// //         'Location permissions are permanently denied, we cannot request permissions.');
// //   }

// //   // When we reach here, permissions are granted and we can
// //   // continue accessing the position of the device.
// //   Geolocator.getPositionStream().listen((position) {
// //     dev.log('wprking');
// //     double speedMps = position.speed; // This is your speed
// //     dev.log(speedMps.toString());
// //   });
// // }
// //   //  if(x > 0){
// //   //          direction = "back";
// //   //      }else if(x < 0){
// //   //          direction = "forward";
// //   //      }else if(y > 0){
// //   //          direction = "left";
// //   //      }else if(y < 0){
// //   //          direction = "right";
// //   //      }
// import 'dart:math';
// import 'dart:developer' as dev;

// class SensorsClass {
//   void getData() {
//     AccelerometerEvent? event1;
//     GyroscopeEvent? event2;
//     final data = [];
//     accelerometerEvents.listen((AccelerometerEvent event) {
//       event1 = event;
//       // Process accelerometer data
//     });
//     gyroscopeEvents.listen((GyroscopeEvent event) {
//       event2 = event;
//       // Process gyroscope data
//     });
//     dev.log(event1.toString());
//     dev.log("event1".toString());
//     dev.log(event2.toString());
//     if (event1 != null && event2 != null) {
//       handleSensorData(event1!, event2!);
//     }
//   }

//   double getLeanAngle(double x, double y, double z) {
//     double radians = atan(y / sqrt(pow(x, 2) + pow(z, 2)));
//     return radians * (180 / pi);
//   }

//   void handleSensorData(
//       AccelerometerEvent accelerometerEvent, GyroscopeEvent gyroscopeEvent) {
//     double leanAngle = getLeanAngle(
//         accelerometerEvent.x, accelerometerEvent.y, accelerometerEvent.z);
//     dev.log(leanAngle.toString());
//     // Use the lean angle value for further operations
//   }
// }
