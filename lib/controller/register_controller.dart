import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypepasswordController = TextEditingController();

  String? errorMessage;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerUser() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.registerCustomer);
      Map body = {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

          print(response.body);

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);

        var token = json['signature'];
        // print(token);

        final SharedPreferences preferences = await _prefs;

        await preferences.setString('token', token);

        nameController.clear();
        emailController.clear();
        passwordController.clear();

        
        Get.offAllNamed('/location');
      }else if(response.statusCode == 409){
        errorMessage = jsonDecode(response.body)["message"];
         
        Get.snackbar("Error", errorMessage!, backgroundColor: Colors.red, colorText: Colors.white);
          }
    } catch (err) {
      throw Error();
    }
  }
}
