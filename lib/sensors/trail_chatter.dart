import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:sensors_plus/sensors_plus.dart';


class TrailChatterSensor {
  List<double> trailChatterValue = [];
  int count = 0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  TrailChatterSensor();
  void startListeningToAccelerometer(Function(List<double> value) valueSetter) {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
          // dev.log(event.toString());
          double x = event.x;
          double y = event.y;
          double z = event.z;
          final trail = calculateTrailChatterValue(x, y, z);
          trailChatterValue.add(trail);
          valueSetter.call(trailChatterValue);
          count += 1;
        });
  }

  double calculateTrailChatterValue(double x, double y, double z) {
    // Calculate the magnitude of the acceleration vector
    double magnitude = sqrt(x * x + y * y + z * z);
    // Normalize the magnitude to a specific range (e.g., 0 to 1)
    double normalizedMagnitude = normalizeMagnitude(magnitude);
    // Apply any additional processing or filters if needed
    return normalizedMagnitude;
  }

  double normalizeMagnitude(double magnitude) {
    // Define the minimum and maximum values for normalization
    double minValue = 0;
    double maxValue = 100;
    // Normalize the magnitude to a range of 0 to 1
    double normalizedValue = (magnitude - minValue) / (maxValue - minValue);
    // Clamp the normalized value between 0 and 1
    return normalizedValue.clamp(0, 1);
  }

  double disposeSensor() {
    double counter = 0.0;
    counter = trailChatterValue.fold(
        0, (previousValue, element) => previousValue + element);
    dev.log("disposing");
    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
    return counter / count;
  }

  double handleValue() {
    double counter = 0.0;
    counter = trailChatterValue.fold(
        0, (previousValue, element) => previousValue + element);
    final value = counter / count;
    dev.log("value $value");
    count = 0;
    counter = 0;
    trailChatterValue.clear();
    return value;
  }
}
