import 'package:compagno4/utils/route.dart';

class DashboardClass {
  User user;
  dynamic lastRide;
  List<dynamic> previousRide;
  List<dynamic> yourRoute;
  TrailChatter trailChatter;
  Speed speed;
  TurnIncline turnIncline;
  String totalTime;

  DashboardClass(
      {required this.user,
      this.lastRide,
      required this.previousRide,
      required this.yourRoute,
      required this.trailChatter,
      required this.speed,
      required this.turnIncline,
      required this.totalTime});
}

class User {
  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});
}

class TrailChatter {
  List<double> data;
  List<double> distance;

  TrailChatter({required this.data, required this.distance});
  List<String> getLabelYmin() {
    double ma = 0;
    double mi = 999999;
    List<String> labels = [];
    for (double y in data) {
      labels.add(' ');
      if (y < mi) {
        mi = y;
      }
      if (y > ma) {
        ma = y;
      }
    }
    if (labels.isNotEmpty) labels[0] = mi.toString();
    if (labels.length > 1) labels[labels.length - 1] = ma.toString();
    return labels;
  }
}

class Speed {
  List<double> speed;
  List<dynamic> time;

  Speed({required this.speed, required this.time});

  double getAvg() {
    double avg = 0;
    for (double y in speed) {
      avg += y;
    }
    if (avg == 0) return avg;
    return avg / speed.length;
  }

  double getMin() {
    double mi = 999999;
    List<String> labels = [];
    for (double y in speed) {
      labels.add(' ');
      if (y < mi) {
        mi = y;
      }
    }
    if (mi == 999999) return 0;
    return mi;
  }

  double getMax() {
    double m = 0;
    List<String> labels = [];
    for (double y in speed) {
      labels.add(' ');
      if (y > m) {
        m = y;
      }
    }
    return m;
  }

  List<String> getLabelYMin() {
    double ma = 0;
    double mi = 999999;
    List<String> labels = [];
    for (double y in speed) {
      labels.add(' ');
      if (y < mi) {
        mi = y;
      }
      if (y > ma) {
        ma = y;
      }
    }
    if (labels.isNotEmpty) labels[0] = "${mi.toString()}mph";
    if (labels.length > 1) labels[labels.length - 1] = "${ma.toString()}mph";
    return labels;
  }
}

class TurnIncline {
  double? avg;
  double? max;

  TurnIncline({this.avg, this.max});
}

class TrainingClass {
  int id;
  String title;
  String createdAt;
  String updatedAt;
  List<Videos> videos;

  TrainingClass(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      required this.videos});
}

class Videos {
  int id;
  String title;
  String subTitle;
  String url;
  String thumbnail;
  int point;
  int videoSession;
  String trainingSteps;
  String createdAt;
  String updatedAt;

  Videos(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.url,
      required this.thumbnail,
      required this.point,
      required this.videoSession,
      required this.trainingSteps,
      required this.createdAt,
      required this.updatedAt});
}

class AwardsClass {
  List<AwardsProgress> awardsProgress;
  List<dynamic> completedAwards;
  LifeTime lifeTime;
  List<dynamic> compagnoRewards;

  AwardsClass(
      {required this.awardsProgress,
      required this.completedAwards,
      required this.lifeTime,
      required this.compagnoRewards});
}

class AwardsProgress {
  int id;
  int userId;
  int? awardId;
  int? progressCount;
  int? completeCount;
  int? isCompleted;
  String createdAt;
  String updatedAt;
  String title;
  String icon;
  String completionType;
  int? sessionCount;
  int? rideCount;

  AwardsProgress(
      {required this.id,
      required this.userId,
      required this.awardId,
      required this.progressCount,
      required this.completeCount,
      required this.isCompleted,
      required this.createdAt,
      required this.updatedAt,
      required this.title,
      required this.icon,
      required this.completionType,
      required this.sessionCount,
      required this.rideCount});
}

class LifeTime {
  int? ridesCompleted;
  int? sessionsCompleted; // Update the type to allow for null values

  LifeTime({
     this.ridesCompleted,
    this.sessionsCompleted,
  });
}