import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order/utils/api_endpoints.dart';
import 'package:food_order/views/home_screen.dart';
import 'package:food_order/views/location.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ForgotpasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

    final TextEditingController firstdigitcontroller = TextEditingController();
  final TextEditingController seconddigitcontroller = TextEditingController();
  final TextEditingController thirddigitcontroller = TextEditingController();
  final TextEditingController fourthdigitcontroller = TextEditingController();
  

  String? errorMessage;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> sendCode() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.sendCode);
      Map body = {
        'email': emailController.text,
        
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

           print(response.statusCode);

      if (response.statusCode == 200) {
       

      
              }else if(response.statusCode == 404){
                errorMessage = jsonDecode(response.body)["message"];
                Get.snackbar("Error", errorMessage!, backgroundColor:Colors.red, colorText: Colors.white);
          
          }
    } catch (err) {
      throw Error();
    }
  }

Future<void> verifyCode() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.verifyCode);

          String code = firstdigitcontroller.text + seconddigitcontroller.text + thirddigitcontroller.text+ fourthdigitcontroller.text;
      Map body = {
        'code': code,
        'email': emailController.text,
        
      };

print(code);
print(emailController.text);
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

           print(response.statusCode);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        var token = json['signature'];
        // print(token);

        final SharedPreferences preferences = await _prefs;

        await preferences.setString('token', token);

       
        emailController.clear();
        
        Get.to(const Locationpage());
      }else if(response.statusCode == 400){
        
         print(jsonDecode(response.body)["message"] );   
          }
    } catch (err) {
      throw Error();
    }
  }
}
