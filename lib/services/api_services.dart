import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:ecommerce/services/shared_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/login_model.dart';
import '../screens/home/home_screen.dart';

class ApiServices {
  final baseUrl = "http://192.168.1.64:3000";
  final loginUrl = "/login";
  final registerUrl = "/register";
  LoginModel? loginModel;
  Future<bool?> login(BuildContext context,
      {String? email, String? password}) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + loginUrl),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );

      if (response.statusCode == 200) {
        loginModel = loginModelFromJson(response.body);
        await SharedData.setEmail(loginModel?.data?.email);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false);
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Sorry failed to login,")));
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  //register
  void register(BuildContext context,
      {String? email,
      String? password,
      String? phone,
      String? username}) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + registerUrl),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "phone": phone,
            "username": username
          },
        ),
      );
      print(response.body);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Successfully Registered")));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("We cannot register now,try again later")));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
