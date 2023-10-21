import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
import 'package:compagno4/screens/mapride/ride_complete.dart';

class PostValueProvider extends GetxController {
  final speedSensor = SpeedSensor();
  final trailSensor = TrailChatterSensor();
  final accelrationSensor = AccelrationSensor();
  final declineSensor = AngleDelinationSensor();
  final inclineSensor = AngleInclinationSensor();
  final leanAngleSensor = LeanAngleSensor();
  final timerHelper = TimerHelper();

  var trailChatter = 0.0.obs;
  // double get trailChatter => _trailChatter.value;
  // set trailChatter(double value) => _trailChatter.value = value;
 RxList<double> trailvalue = <double>[].obs;
 RxList<double> accelerationvalue = <double>[].obs;
 RxDouble inclinevalue = 0.0.obs;
  var _inclineAngle = 0.0.obs;
  double get inclineAngle => _inclineAngle.value;
  set inclineAngle(double value) => _inclineAngle.value = value;

  var _declineAngle = 0.0.obs;
  double get declineAngle => _declineAngle.value;
  set declineAngle(double value) => _declineAngle.value = value;

  var _accelration = 0.0.obs;
  double get accelration => _accelration.value;
  set accelration(double value) => _accelration.value = value;

  var _speed = 0.0.obs;
  double get speed => _speed.value;
  set speed(double value) => _speed.value = value;

  var _leanAngle = 0.0.obs;
  double get leanAngle => _leanAngle.value;
  set leanAngle(double value) => _leanAngle.value = value;

  Timer? _timer;
  String? id;
  RxList<double> trailChatterList = <double>[].obs;

  List<double> _accelerationList = [];
  double _inclinationList = 0.0;
  List<Map> data = [];

  void startRide() {
    hitStarRideApi();
    speedSensor.startSpeedSensor();
    leanAngleSensor.startListeningToAccelerometer();

    inclineSensor.startListeningToAccelerometer((value) {
      inclinevalue.value = value;
      _inclinationList = value;
    });
    declineSensor.startListeningToMagnetometer();
    trailSensor.startListeningToAccelerometer((value){
      trailvalue.value.add(value.last);
      trailChatterList.value = value;
      trailChatterList.refresh();

      update(); // Notify listeners
    });
    accelrationSensor.startListeningToMagnetometer((value) {
      accelerationvalue.add(value.last);
      _accelerationList = value;
      update(); // Notify listeners
    });
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
    _speed.value = speedSensor.handleValue();
    final time = DateFormat('HH:mm:ss').format(DateTime.now());
    debugPrint("speed is $speed");
    _accelration.value = accelrationSensor.handleValue();
    _leanAngle.value = leanAngleSensor.handleValue();
    _declineAngle.value = declineSensor.handleValue();
    _inclineAngle.value = inclineSensor.handleValue();
    trailChatter.value = trailSensor.handleValue();
    final lat = speedSensor.getLat();
    final lng = speedSensor.getLng();
    final distance = speedSensor.getDistance().round();
    data.add({
      "speed": (speed != null && !speed.isNaN) ? speed.round().toString() : "0",
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
      "speed": (speed != null && !speed.isNaN) ? speed.round().toString() : "0",
      "time": time,
      "ride_id": id.toString(),
      "lat": lat.toString(),
      "lng": lng.toString(),
      "distance": distance.toString(),
      "turn_incline": leanAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "elevation": inclineAngle?.toStringAsFixed(1).replaceAll("-", ""),
      "trail_chatter": trailChatter?.toStringAsFixed(1).replaceAll("-", "")
    };
    if (lat != 0.00) {
      debugPrint("hello ${x}");
      final response = await DioClient.instance.post("recording-ride", body: x);
    }
  }

  Future<void> cancel() async {
    trailvalue.clear();
    accelerationvalue.clear();
    trailChatterList.clear();
    debugPrint("I cancelled everything");
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = null;
    final time = DateFormat('HH:mm:ss').format(DateTime.now());
    final lat = speedSensor.getLat();
    final lng = speedSensor.getLng();
    final distance = speedSensor.getDistance();
    speed = speedSensor.disposeSensor();
    accelration = accelrationSensor.disposeSensor();
    leanAngle = leanAngleSensor.disposeSensor();
    declineAngle = declineSensor.disposeSensor();
    inclineAngle = inclineSensor.disposeSensor();
    trailChatter.value = trailSensor.disposeSensor();
    data.add({
      "speed": (speed != null && !speed.isNaN) ? speed.round().toString() : "0",
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
      "speed": (speed != null && !speed.isNaN) ? speed.round().toString() : "0",
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
      // Get.to(() => RideComplete());
    });
  }
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
}
