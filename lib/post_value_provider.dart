import 'dart:async';
import 'dart:developer';

import 'package:compagno4/core/network/dio_client.dart';
import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/sensors/acceleration.dart';
import 'package:compagno4/sensors/angle_declination.dart';
import 'package:compagno4/sensors/angle_inclination.dart';
import 'package:compagno4/sensors/lean_angle.dart';
import 'package:compagno4/sensors/speed.dart';
import 'package:compagno4/sensors/time_duration.dart';
import 'package:compagno4/sensors/trail_chatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostValueProvider extends ChangeNotifier {
  final speedSensor = SpeedSensor();
  final trailSensor = TrailChatterSensor();
  final accelrationSensor = AccelrationSensor();
  final declineSensor = AngleDelinationSensor();
  final inclineSensor = AngleInclinationSensor();
  final leanAngleSensor = LeanAngleSensor();
  final timerHelper = TimerHelper();
  double? _trailChatter;

  double? get trailChatter => _trailChatter;

  set trailChatter(double? value) {
    _trailChatter = value;
    notifyListeners();
  }

  void setValue(List<double> value) {
    trailChatterList = value;
  }

  double _inclineAngle = 0;

  double get inclineAngle => _inclineAngle;

  set inclineAngle(double? value) {
    _inclineAngle = value!;
    notifyListeners();
  }

  double? _declineAngle;

  double? get declineAngle => _declineAngle;

  set declineAngle(double? value) {
    _declineAngle = value;
    notifyListeners();
  }

  double? _accelration;

  double? get accelration => _accelration;

  set accelration(double? value) {
    _accelration = value;
    notifyListeners();
  }

  double? _speed;

  double? get speed => _speed;

  set speed(double? value) {
    _speed = value;
    notifyListeners();
  }

  double? _leanAngle;

  double? get leanAngle => _leanAngle;

  set leanAngle(double? value) {
    _leanAngle = value;
    notifyListeners();
  }

  Timer? _timer;

  void startRide() {

    speedSensor.startSpeedSensor();
    leanAngleSensor.startListeningToAccelerometer();
    inclineSensor.startListeningToAccelerometer((value) {
      inclinationList = value;
    });
    declineSensor.startListeningToMagnetometer();
    trailSensor.startListeningToAccelerometer((value) {
      trailChatterList = value;
    });
    accelrationSensor.startListeningToMagnetometer((value) {
      accelerationList = value;
    });
    hitStarRideApi();
  }

  Future<void> hitStarRideApi() async {
    try {
      final response = await DioClient.instance.post(
        "start-ride",
        body: {"name": DateTime.now().millisecondsSinceEpoch.toString()},
      );
      id = response.data["data"]["id"].toString();
      debugPrint("id is-${id} ");
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        onValue();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> onValue() async {

    // debugPrint("data is ${data.length}");
    speed = speedSensor.handleValue();
    final time = DateFormat('HH:mm:ss').format(DateTime.now());
    debugPrint("speed is $speed");
    accelration = accelrationSensor.handleValue();
    leanAngle = leanAngleSensor.handleValue();
    declineAngle = declineSensor.handleValue();
    inclineAngle = inclineSensor.handleValue();
    trailChatter = trailSensor.handleValue();
    final lat = speedSensor.getLat();
    final lng = speedSensor.getLng();
    final distance = speedSensor.getDistance().round();
    data.add({
    "speed": (speed != null && !speed!.isNaN) ? speed!.round().toString() : "0",
      // "time": "${time.hour}:${time.minute}:${time.second}",
      "time": time,
      "ride_id": id.toString(),
      "lat": lat.toString(),
      "lng": lng.toString(),
      "distance": distance.toString(),
      "turn_incline": leanAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "elevation": inclineAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "trail_chatter": trailChatter?.toStringAsFixed(1).replaceAll("-", "")
    });

    final x = {
      "speed": (speed != null && !speed!.isNaN) ? speed!.round().toString() : "0",
      //

      // "time": "${time.hour}:${time.minute}:${time.second}",
      "time": time,

      "ride_id": id.toString(),
      "lat": lat.toString(),
      "lng": lng.toString(),
      "distance": distance.toString(),
      "turn_incline": leanAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "elevation": inclineAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "trail_chatter": trailChatter?.toStringAsFixed(1).replaceAll("-", "")
    };
    if(lat!=0.00){
      debugPrint("hello ${x}");
      final response = await DioClient.instance.post("recording-ride", body: x);
    }


  }

  Future<void> cancel() async {
    _timer?.cancel();
    _timer = null;
    final time = DateFormat('HH:mm:ss').format(DateTime.now());
    // final formattedTime = DateFormat('HH:mm:ss').format(time);
    final lat = speedSensor.getLat();
    final lng = speedSensor.getLng();
    final distance = speedSensor.getDistance();
    speed = speedSensor.disposeSensor();
    accelration = accelrationSensor.disposeSensor();
    leanAngle = leanAngleSensor.disposeSensor();
    declineAngle = declineSensor.disposeSensor();
    inclineAngle = inclineSensor.disposeSensor();
    trailChatter = trailSensor.disposeSensor();

    data.add({
      "speed": (speed != null && !speed!.isNaN) ? speed!.round().toString() : "0",
      //(speed != null && !speed!.isNaN) ? speed!.round().toString() :
      "time": time,
      "ride_id": id.toString(),
      "lat": lat.toString(),
      "lng": lng.toString(),
      "distance": distance.toString(),
      "turn_incline": leanAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "elevation": inclineAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "trail_chatter": trailChatter?.toStringAsFixed(1).replaceAll("-", "")
    });

    final x = {
      "speed": (speed != null && !speed!.isNaN) ? speed!.round().toString() : "0",
      //(speed != null && !speed!.isNaN) ? speed!.round().toString() :
      "time": time,
      "ride_id": id.toString(),
      "lat": lat.toString(),
      "lng": lng.toString(),
      "distance": distance.toString(),
      "turn_incline": leanAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "elevation": inclineAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "trail_chatter": trailChatter?.toStringAsFixed(1).replaceAll("-", "")
    };
    debugPrint("hello $x");
    final response = await DioClient.instance.post("recording-ride", body: x);
  }

  void completeRide() async {
    cancel();
    await Future.delayed(const Duration(seconds: 2), () {
      hitCompleteRide();
    });
  }

  List<double> _trailChatterList = [];

  List<double> get trailChatterList => _trailChatterList;

  set trailChatterList(List<double> value) {
    _trailChatterList = value;
    notifyListeners();
  }

  List<double> _accelerationList = [];

  List<double> get accelerationList => _accelerationList;

  set accelerationList(List<double> value) {
    _accelerationList = value;
    notifyListeners();
  }

  double _inclinationList = 0.0;

  double get inclinationList => _inclinationList;

  set inclinationList(double value) {
    _inclinationList = value;
    notifyListeners();
  }

  List<Map> data = [];

  Future<void> hitCompleteRide() async {
    try {
      debugPrint("data is ${data}");
      // final response = await DioClient.instance.post("save-ride",
      //     body: {"json_data": data});
      debugPrint("ride_id ${SaveId.getSaveData(key: token)}");
      final newresponse = await DioClient.instance.post("end-ride", body: {
        "ride_id": id,
      });
      // debugPrint(response.data);
      debugPrint(newresponse.data);
    } catch (e) {
      print(e.toString());
    }
  }

  String? id;
}
