// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.username,
    this.password,
    this.phone,
    this.email,
    this.created,
  });

  int? id;
  String? username;
  String? password;
  String? phone;
  String? email;
  DateTime? created;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        phone: json["phone"],
        email: json["email"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "phone": phone,
        "email": email,
        "created": created?.toIso8601String(),
      };
}
