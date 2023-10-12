import 'dart:convert';

class RegisterRequestModel {
  final String email;
  final String password;
  final String name;

  RegisterRequestModel(
      {required this.name,
        required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
