import 'dart:convert';

class RegisterResponse {
  final bool? status;
  final int? statusCode;
  final String? message;
  final RegisterData? data;

  RegisterResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory RegisterResponse.fromRawJson(String str) =>
      RegisterResponse.fromJson(json.decode(str));

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null ? null : RegisterData.fromJson(json["data"]),
      );
}

class RegisterData {
  final String? token;
  final String? name;
    final String? error;


  RegisterData({
    this.token,
    this.name,
    this.error,
  });

  factory RegisterData.fromRawJson(String str) =>
      RegisterData.fromJson(json.decode(str));

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        token: json["token"],
        name: json["name"],
        error: json["error"],
      );
}
