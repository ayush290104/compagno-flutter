// To parse this JSON data, do
//
//     final LoginResponse = LoginResponseFromJson(jsonString);

import 'dart:convert';

class LoginResponse {
  final bool status;
  final int statusCode;
  final String? message;
  final Data? data;

  LoginResponse({
    required this.status,
    required this.statusCode,
    this.message,
    this.data,
  });

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
  final String? token;
  final String? error;

  Data({
    this.user,
    this.token,
    this.error,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      token: json["token"],
      error: json["error"]);

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? profilePic;
  final String? riderLevel;
  final String? phone;
  final String? addressLine;
  final String? city;
  final String? state;
  final String? zip;
  final String? country;
  final int? isBlocked;
  final List<dynamic>? interests;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic currentTuning;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.profilePic,
    this.riderLevel,
    this.phone,
    this.addressLine,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.isBlocked,
    this.interests,
    this.createdAt,
    this.updatedAt,
    this.currentTuning,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        profilePic: json["profile_pic"],
        riderLevel: json["rider_level"],
        phone: json["phone"],
        addressLine: json["address_line"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        country: json["country"],
        isBlocked: json["is_blocked"],
        interests: json["interests"] == null
            ? []
            : List<dynamic>.from(json["interests"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        currentTuning: json["current_tuning"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "profile_pic": profilePic,
        "rider_level": riderLevel,
        "phone": phone,
        "address_line": addressLine,
        "city": city,
        "state": state,
        "zip": zip,
        "country": country,
        "is_blocked": isBlocked,
        "interests": interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "current_tuning": currentTuning,
      };
}
