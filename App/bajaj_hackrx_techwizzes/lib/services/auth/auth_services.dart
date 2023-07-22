// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bajaj_hackrx_techwizzes/features/auth/ui/login_screen.dart';
import 'package:bajaj_hackrx_techwizzes/features/home/ui/home_screen.dart';
import 'package:bajaj_hackrx_techwizzes/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  //LOGIN USER
  Future loginInUser({
    required BuildContext context,
    required String code,
    required String pin,
  }) async {
    try {
      // print("Enter Api Call");
      http.Response res =
          await http.post(Uri.parse('http://10.10.220.102:3000/api/v1/login'),
              body: jsonEncode(
                {'clientCode': code.toString(), 'pin': pin.toString()},
              ),
              headers: {
            'Content-Type': 'application/json',
          });
      print(res.statusCode);
      print(res.body);
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            body['message'],
            style: const TextStyle(color: AppColors.backgroundColor),
          ),
          backgroundColor: AppColors.lightGreen,
        ));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            body['message'],
            style: const TextStyle(color: AppColors.backgroundColor),
          ),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  //REGISTER USER
  Future registerUser({
    required BuildContext context,
    required String name,
    required String code,
    required String pin,
  }) async {
    try {
      print("Enter Api Call 2");
      http.Response res =
          await http.post(Uri.parse('http://10.10.220.102:3000/api/v1/signup'),
              body: jsonEncode(
                {
                  'name': name.toString(),
                  'clientCode': code.toString(),
                  'pin': pin.toString()
                },
              ),
              headers: {
            'Content-Type': 'application/json',
          });
      print(res.body);
      print(res.statusCode);
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            body['message'],
          ),
          backgroundColor: AppColors.lightGreen,
        ));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            body['message'],
          ),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
