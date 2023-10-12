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
    final List<YourRoute>? yourRoute;
    final TrailChatter? trailChatter;
    final Speed? speed;
    final Map<String, int>? turnIncline;
    final String? totalTime;

    Data({
        this.user,
        this.lastRide,
        this.previousRide,
        this.yourRoute,
        this.trailChatter,
        this.speed,
        this.turnIncline,
        this.totalTime,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        lastRide: json["last_ride"] == null ? null : LastRide.fromJson(json["last_ride"]),
        previousRide: json["previous_ride"] == null ? [] : List<PreviousRide>.from(json["previous_ride"]!.map((x) => PreviousRide.fromJson(x))),
        yourRoute: json["your_route"] == null ? [] : List<YourRoute>.from(json["your_route"]!.map((x) => YourRoute.fromJson(x))),
        trailChatter: json["trail_chatter"] == null ? null : TrailChatter.fromJson(json["trail_chatter"]),
        speed: json["speed"] == null ? null : Speed.fromJson(json["speed"]),
        turnIncline: Map.from(json["turn_incline"]!).map((k, v) => MapEntry<String, int>(k, v)),
        totalTime: json["total_time"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "last_ride": lastRide?.toJson(),
        "previous_ride": previousRide == null ? [] : List<dynamic>.from(previousRide!.map((x) => x.toJson())),
        "your_route": yourRoute == null ? [] : List<dynamic>.from(yourRoute!.map((x) => x.toJson())),
        "trail_chatter": trailChatter?.toJson(),
        "speed": speed?.toJson(),
        "turn_incline": Map.from(turnIncline!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_time": totalTime,
    };
}

class LastRide {
    final int? id;
    final String? name;

    LastRide({
        this.id,
        this.name,
    });

    factory LastRide.fromRawJson(String str) => LastRide.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LastRide.fromJson(Map<String, dynamic> json) => LastRide(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class PreviousRide {
    final int? id;
    final String? name;
    final String? totalTime;

    PreviousRide({
        this.id,
        this.name,
        this.totalTime,
    });

    factory PreviousRide.fromRawJson(String str) => PreviousRide.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PreviousRide.fromJson(Map<String, dynamic> json) => PreviousRide(
        id: json["id"],
        name: json["name"],
        totalTime: json["total_time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "total_time": totalTime,
    };
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
        distance: json["distance"] == null ? [] : List<String>.from(json["distance"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "distance": distance == null ? [] : List<dynamic>.from(distance!.map((x) => x)),
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
    final double? lat;
    final double? lng;

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
