import 'dart:convert';

class HomePageResponse {
    final bool? status;
    final int? statusCode;
    final String? message;
    final Data? data;

    HomePageResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    factory HomePageResponse.fromRawJson(String str) => HomePageResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HomePageResponse.fromJson(Map<String, dynamic> json) => HomePageResponse(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final User? user;
    final LastRide? lastRide;
      final List<PreviousRide>? previousRide;


    Data({
        this.user,
        this.lastRide,
         this.previousRide,

    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
         lastRide: json["last_ride"] == null ? null : LastRide.fromJson(json["last_ride"]),
        previousRide: json["previous_ride"] == null ? [] : List<PreviousRide>.from(json["previous_ride"]!.map((x) => PreviousRide.fromJson(x))),

    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
         "last_ride": lastRide?.toJson(),
         "previous_ride": previousRide == null ? [] : List<dynamic>.from(previousRide!.map((x) => x.toJson())),

    };
}
class LastRide {
    final int? id;
    final String? name;
    final String? totalTime;
    final TrailChatter? trailChatter;
    final Speed? speed;
    final Turnincline? turnincline;
    final Acceleration? acceleration;
    final Elevation? elevation;
    final List<YourRoute>? route;

    LastRide({
        this.id,
        this.name,
        this.totalTime,
        this.trailChatter,
        this.speed,
        this.turnincline,
        this.acceleration,
        this.elevation,
        this.route,
    });

    factory LastRide.fromRawJson(String str) => LastRide.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LastRide.fromJson(Map<String, dynamic> json) => LastRide(
        id: json["id"],
        name: json["name"],
        totalTime: json["total_time"],
        trailChatter: TrailChatter.fromJson(json["trail_chatter"]),
        speed: Speed.fromJson(json["speed"]),
        turnincline: Turnincline.fromJson(json["turn_incline"]),
        acceleration: Acceleration.fromJson(json["acceleration"]),
        elevation: Elevation.fromJson(json["elevation"]),
        route: (json["route"] as List)
            .map((route) => YourRoute.fromJson(route))
            .toList(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "total_time": totalTime,
        "trail_chatter": trailChatter?.toJson(),
        "speed": speed?.toJson(),
        "turn_incline": turnincline?.toJson(),
        "acceleration": acceleration?.toJson(),
        "elevation": elevation?.toJson(),
        "route": route?.map((r) => r.toJson()).toList(),
    };
}

class Elevation {
    final List<int>? elevation;
    final List<String>? time;

    Elevation({
        this.elevation,
        this.time,
    });

    factory Elevation.fromRawJson(String str) =>
        Elevation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Elevation.fromJson(Map<String, dynamic> json) => Elevation(
        elevation: List<int>.from(json["elevation"].map((x) => x)),
        time: List<String>.from(json["time"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "elevation": List<dynamic>.from(elevation!.map((x) => x)),
        "time": List<dynamic>.from(time!.map((x) => x)),
    };
}

class Turnincline {
    final double? average;
    final int? max;

    Turnincline({
        this.average,
        this.max,
    });

    factory Turnincline.fromRawJson(String str) =>
        Turnincline.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Turnincline.fromJson(Map<String, dynamic> json) => Turnincline(
        average: json["avg"]?.toDouble(),
        max: json["max"],
    );

    Map<String, dynamic> toJson() => {
        "avg": average,
        "max": max,
    };
}
class Acceleration {
    final List<double>? acceleration;
    final List<String>? time;

    Acceleration({
        this.acceleration,
        this.time,
    });

    factory Acceleration.fromRawJson(String str) =>
        Acceleration.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Acceleration.fromJson(Map<String, dynamic> json) => Acceleration(
        acceleration: List<double>.from(json["acceleration"].map((x) => x.toDouble())),
        time: List<String>.from(json["time"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "acceleration": List<dynamic>.from(acceleration!.map((x) => x)),
        "time": List<dynamic>.from(time!.map((x) => x)),
    };
}


class PreviousRide {
    final int? id;
    final String? name;
    final String? totalTime;
    final TrailChatter? trailChatter;
    final Speed? speed;
    final Turnincline? turnincline;
    final Acceleration? acceleration;
    final Elevation? elevation;
    final List<YourRoute>? route;

    PreviousRide({
        this.id,
        this.name,
        this.totalTime,
        this.trailChatter,
        this.speed,
        this.turnincline,
        this.acceleration,
        this.elevation,
        this.route,
    });

    factory PreviousRide.fromJson(Map<String, dynamic> json) {
        return PreviousRide(
            id: json["id"],
            name: json["name"],
            totalTime: json["total_time"],
            trailChatter: TrailChatter.fromJson(json["trail_chatter"]),
            speed: Speed.fromJson(json["speed"]),
            turnincline: Turnincline.fromJson(json["turn_incline"]),
            acceleration: Acceleration.fromJson(json["acceleration"]),
            elevation: Elevation.fromJson(json["elevation"]),
            route: (json["route"] as List).map((route) => YourRoute.fromJson(route)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            "id": id,
            "name": name,
            "total_time": totalTime,
            "trail_chatter": trailChatter?.toJson(),
            "speed": speed?.toJson(),
            "turn_incline": turnincline?.toJson(),
            "acceleration": acceleration?.toJson(),
            "elevation": elevation?.toJson(),
            "route": route?.map((r) => r.toJson()).toList(),
        };
    }
}
class Speed {
    final List<int>? speed;
    final List<String>? time;

    Speed({
        this.speed,
        this.time,
    });

    factory Speed.fromRawJson(String str) => Speed.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Speed.fromJson(Map<String, dynamic> json) => Speed(
        speed: json["speed"] == null ? [] : List<int>.from(json["speed"]!.map((x) => x)),
        time: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed == null ? [] : List<dynamic>.from(speed!.map((x) => x)),
        "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
    };
}

class TrailChatter {
     final List<double>? data;
    final List<String>? distance;

    TrailChatter({
         this.data,
        this.distance,
    });

    factory TrailChatter.fromRawJson(String str) => TrailChatter.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TrailChatter.fromJson(Map<String, dynamic> json) => TrailChatter(
        data: json["data"] == null ? [] : List<double>.from(json["data"]!.map((x) => x?.toDouble())),
        distance: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "time": distance == null ? [] : List<dynamic>.from(distance!.map((x) => x)),
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;

    User({
        this.id,
        this.name,
        this.email,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
    };
}

class YourRoute {
    final num? lat;
    final num? lng;

    YourRoute({
        this.lat,
        this.lng,
    });

    factory YourRoute.fromRawJson(String str) => YourRoute.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory YourRoute.fromJson(Map<String, dynamic> json) => YourRoute(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
